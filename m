Return-Path: <linuxppc-dev+bounces-4158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BF9F2F3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4x4NZJz301Y;
	Mon, 16 Dec 2024 22:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348561;
	cv=none; b=Q7zSkGxmVHWsUwjvouxPmqZmwsWNvfTbKkv1574OQ6xVhSGihHHmqBifnaK1Qhxlx208nfIzqt1oCjGijL7n34E0FWoqo6UOd1OEBzQhHvdjy1Rmt8WdGwru2ZwMP6bCsdFfeUVhiv/PBVbd+wq2EDPKl5s5LXUk9+e2S3Uu0KkEcjvUS0SrVeuAfZHivEtqJRmbaYxg4Uc7zv0ZSncDwM7BxPVmnvyecH2pVCBhDODOpF9qvQTTghNMW5cCPbS+/yPpDoxEdlhCe2SeyWAO+AclcFegYWQsrXLcSzXwANFdCFlq2xGvx7oO2dkesKOeKNOKsqZy5LMf+GwY8NdX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348561; c=relaxed/relaxed;
	bh=XDD/zkXmAzb5d6G04Ok7GwAqGONUznCKQ8IXSYcP2NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXac8qcIaIg/Xw94pvn/kIns8J4RM9QfRAjuhwR1mpT8Sfmoc83lnEPCOxGb5Yj4KjNnbEts2qGd+qDj3XUqIUtcTvG4V3BFi4/w7JA3hFezP7c+SRQHlaWG1vWBHvzXsFZeIXAONHEFExLLPHcfP90zm02V55cj7GeK1VSJm6c7aaqU+oZ/UZqWsvZC5kib1D9oe3mSYmm2bkGVuHOHCQWqw+eYfp4/Xp97nf0OWArK5u+ekJXjO7f9vL5Kru53r5MRNrp4m1gDtmAUnZjexTL21yUNiPJzMSebOE/lAcJ/p/XbYMTpSgqw4FHboCFKwYgTlJcmLXLCB8mmctuutQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=RMkcaJQt; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=RMkcaJQt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4w6HK5z300V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348553;
	bh=/47zmPkyqW64N/sWNZItQvBd6ybLPkBtNbUpLnt2Msc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RMkcaJQt8UBr77DelZNaePGGudtkBLDC/fceGR/DYNrQruoPmfGp4X4Ih/idasJ6J
	 LiP0ReqpGtsDJ4ilq11ZC+OV9Cbpz725LuWbb6g46Hx+hov/ipO+zMCZVcF09Ux8PE
	 lJ5Ghu3SIfOUoQJLq2aoT99RDZ4Fio79eyMt9grk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:15 +0100
Subject: [PATCH 08/11] scsi: qedf: Constify 'struct bin_attribute'
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-8-f0a5e54b3437@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Adam Radford <aradford@gmail.com>, 
 Bradley Grove <linuxdrivers@attotech.com>, 
 Tyrel Datwyler <tyreld@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, Brian King <brking@us.ibm.com>, 
 Saurav Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>, 
 GR-QLogic-Storage-Upstream@marvell.com, Nilesh Javali <njavali@marvell.com>, 
 Manish Rangankar <mrangankar@marvell.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=2312;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=/47zmPkyqW64N/sWNZItQvBd6ybLPkBtNbUpLnt2Msc=;
 b=yoemaf355a7pBtjrYmusgAHSgDSHBiZ/xpsxVOY2bN+lr7orgVWt0/padwJDXbBQS6h6g2A/v
 ZfCk5GBEeFnA/CuO6ERllqvp4wf56ggfq0HQFvV9/Vx9XlOgwrjVYfl
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/scsi/qedf/qedf_attr.c | 10 +++++-----
 drivers/scsi/qedf/qedf_dbg.h  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/qedf/qedf_attr.c b/drivers/scsi/qedf/qedf_attr.c
index 8d8c760eee435ad9018e64440837211109725ff6..769da92ee20d0fac71525a8265cb6332146585ec 100644
--- a/drivers/scsi/qedf/qedf_attr.c
+++ b/drivers/scsi/qedf/qedf_attr.c
@@ -104,7 +104,7 @@ void qedf_capture_grc_dump(struct qedf_ctx *qedf)
 
 static ssize_t
 qedf_sysfs_read_grcdump(struct file *filep, struct kobject *kobj,
-			struct bin_attribute *ba, char *buf, loff_t off,
+			const struct bin_attribute *ba, char *buf, loff_t off,
 			size_t count)
 {
 	ssize_t ret = 0;
@@ -124,7 +124,7 @@ qedf_sysfs_read_grcdump(struct file *filep, struct kobject *kobj,
 
 static ssize_t
 qedf_sysfs_write_grcdump(struct file *filep, struct kobject *kobj,
-			struct bin_attribute *ba, char *buf, loff_t off,
+			const struct bin_attribute *ba, char *buf, loff_t off,
 			size_t count)
 {
 	struct fc_lport *lport = NULL;
@@ -160,14 +160,14 @@ qedf_sysfs_write_grcdump(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_grcdump_attr = {
+static const struct bin_attribute sysfs_grcdump_attr = {
 	.attr = {
 		.name = "grcdump",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read = qedf_sysfs_read_grcdump,
-	.write = qedf_sysfs_write_grcdump,
+	.read_new = qedf_sysfs_read_grcdump,
+	.write_new = qedf_sysfs_write_grcdump,
 };
 
 static struct sysfs_bin_attrs bin_file_entries[] = {
diff --git a/drivers/scsi/qedf/qedf_dbg.h b/drivers/scsi/qedf/qedf_dbg.h
index 5ec2b817c694a9846c337c88f6e9b59382dbaa1b..eeb6c841dacb1e68890420db2e5349e9ce60bc20 100644
--- a/drivers/scsi/qedf/qedf_dbg.h
+++ b/drivers/scsi/qedf/qedf_dbg.h
@@ -100,7 +100,7 @@ struct Scsi_Host;
 
 struct sysfs_bin_attrs {
 	char *name;
-	struct bin_attribute *attr;
+	const struct bin_attribute *attr;
 };
 
 extern int qedf_alloc_grc_dump_buf(uint8_t **buf, uint32_t len);

-- 
2.47.1


