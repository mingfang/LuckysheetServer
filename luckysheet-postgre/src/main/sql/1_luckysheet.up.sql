CREATE SEQUENCE "public"."luckysheet_id_seq"
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9999999999999
    START 1
    CACHE 10;

CREATE TABLE "luckysheet"
(
    "id"        int8                                        NOT NULL,
    "block_id"  varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
    "row_col"   varchar(50),
    "index"     varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
    "list_id"   varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
    "status"    int2                                        NOT NULL,
    "json_data" jsonb,
    "order"     int2,
    "is_delete" int2
);

CREATE INDEX "block_id" ON "public"."luckysheet"
    USING btree (
                 "block_id" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST,
                 "list_id" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST
        );
CREATE INDEX "index" ON "public"."luckysheet"
    USING btree (
                 "index" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST,
                 "list_id" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST
        );
CREATE INDEX "is_delete" ON "public"."luckysheet" USING btree (
                                                               "is_delete" "pg_catalog"."int2_ops" ASC NULLS LAST
    );
CREATE INDEX "list_id" ON "public"."luckysheet"
    USING btree (
                 "list_id" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST
        );
CREATE INDEX "order" ON "public"."luckysheet"
    USING btree (
                 "list_id" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST,
                 "order" "pg_catalog"."int2_ops" ASC NULLS LAST
        );
CREATE INDEX "status" ON "public"."luckysheet"
    USING btree (
                 "list_id" COLLATE "pg_catalog"."default"
                 "pg_catalog"."text_ops" ASC NULLS LAST,
                 "status" "pg_catalog"."int2_ops" ASC NULLS LAST
        );
ALTER TABLE "public"."luckysheet"
    ADD CONSTRAINT "luckysheet_pkey" PRIMARY KEY ("id");
