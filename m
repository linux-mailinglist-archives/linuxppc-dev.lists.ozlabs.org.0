Return-Path: <linuxppc-dev+bounces-4161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD99F2F40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:30:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4z2vLmz304N;
	Mon, 16 Dec 2024 22:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348563;
	cv=none; b=ekcM6508gi6BeUmWG59I3oGYom4xRc0WMqJd0JtvgMELnOvJdm1KAZWn+DpQalCinm5nvTM/0SLdjYdcUqtBigUYwuXbdthIUQAOndiEv6GXNjla3NvEK6mITos/cuPtnx9IdgcZbgdXB/taCF3+HAHey0Ym5V8PZuvywJsMjzwImz+8NH5RQfDSQjpaMN4Ln90iSnVLhlNjDz6iZVumc+5GC2KMzNsFOarCJayhRTeZZ+NPHoFnugVHcb00ucFklvRYAQnMxd1PLAw42X67Am59CuQ/R9SbjMxT9WNck2EnfiUlG5GkprvNnMHE9LrlGfFDEfSLyyPm0H4XX0l+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348563; c=relaxed/relaxed;
	bh=02IfjRNVWYYSfxfzhkRdHppoxHhkMmhwcIYBIuCIhR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRVC4mzZ1DIAwCGq+e1Ly8EsgVzScwoZ7Pt9DIIiC+QZEcikPo/9vzj3acW7jvMKf7YWhWtnNaw7xRqeLlaaMvGk6VQOi/szzSCuFQZyRdkANqV0AQGAiIXOiXUNpgPrKkSkxBb5p2szrobo5IbQjv1v+kh4QFoNGUyVZ6t6emsAu2MGDLl9eqjPCdtpmG+fB7/XuCHU+kg5Z2VKww2IGOV9pZ6/AFxdvm1SsQNAQ7wgtSB6XKWQWRlZHsPDnq54E4SBQzjYzcGpQjeqOM3P/yNB1OkVKeEpMX3HpaU5c0sRH8eybY8UmLmsEWf8ntAEZmpB0c1OeDT+h7MNSNWZUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=A1FxjZYR; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=A1FxjZYR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4x2zymz301B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348553;
	bh=TnuBvtbm/eKcN8yGKFA+/hPyKlT4aEyQjANk9DeyXiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A1FxjZYRPPJQX0xbzKEXvO1Q9aAIWd0ldmiTpipg/B45okU5dWp/imiObvOguW73E
	 7QCyrC4X6ldX7RnzZxlphHwAJAd9i5FiTbQCkzIQLz/fg3n6BljzV47kOSkuVmSji+
	 8I85ovRjBYMgJPYP5Hh+kkF5H2aLupGkGSvqBHpE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:17 +0100
Subject: [PATCH 10/11] scsi: qla2xxx: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-10-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=9804;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TnuBvtbm/eKcN8yGKFA+/hPyKlT4aEyQjANk9DeyXiI=;
 b=hMP1olY6EzhDv4p3LOXBwNL02D9JjGyYAaTYTMdtgmGsKSZbwRDLoJlLp8E+KZMqxkaOwp8pV
 sFlVux4YBYGClYqis4bxn540b7WW9JUJueJYIG3tACx4vyI0MUTLc4u
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
 drivers/scsi/qla2xxx/qla_attr.c | 80 ++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index e6ece30c43486ce8f268e369f317e850994ed008..dcb0c2af1fa7cf9b63a5613c01b792143142a412 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -17,7 +17,7 @@ static int qla24xx_vport_disable(struct fc_vport *, bool);
 
 static ssize_t
 qla2x00_sysfs_read_fw_dump(struct file *filp, struct kobject *kobj,
-			   struct bin_attribute *bin_attr,
+			   const struct bin_attribute *bin_attr,
 			   char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -58,7 +58,7 @@ qla2x00_sysfs_read_fw_dump(struct file *filp, struct kobject *kobj,
 
 static ssize_t
 qla2x00_sysfs_write_fw_dump(struct file *filp, struct kobject *kobj,
-			    struct bin_attribute *bin_attr,
+			    const struct bin_attribute *bin_attr,
 			    char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -168,19 +168,19 @@ qla2x00_sysfs_write_fw_dump(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_fw_dump_attr = {
+static const struct bin_attribute sysfs_fw_dump_attr = {
 	.attr = {
 		.name = "fw_dump",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read = qla2x00_sysfs_read_fw_dump,
-	.write = qla2x00_sysfs_write_fw_dump,
+	.read_new = qla2x00_sysfs_read_fw_dump,
+	.write_new = qla2x00_sysfs_write_fw_dump,
 };
 
 static ssize_t
 qla2x00_sysfs_read_nvram(struct file *filp, struct kobject *kobj,
-			 struct bin_attribute *bin_attr,
+			 const struct bin_attribute *bin_attr,
 			 char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -220,7 +220,7 @@ qla2x00_sysfs_read_nvram(struct file *filp, struct kobject *kobj,
 
 static ssize_t
 qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
-			  struct bin_attribute *bin_attr,
+			  const struct bin_attribute *bin_attr,
 			  char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -282,19 +282,19 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_nvram_attr = {
+static const struct bin_attribute sysfs_nvram_attr = {
 	.attr = {
 		.name = "nvram",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 512,
-	.read = qla2x00_sysfs_read_nvram,
-	.write = qla2x00_sysfs_write_nvram,
+	.read_new = qla2x00_sysfs_read_nvram,
+	.write_new = qla2x00_sysfs_write_nvram,
 };
 
 static ssize_t
 qla2x00_sysfs_read_optrom(struct file *filp, struct kobject *kobj,
-			  struct bin_attribute *bin_attr,
+			  const struct bin_attribute *bin_attr,
 			  char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -318,7 +318,7 @@ qla2x00_sysfs_read_optrom(struct file *filp, struct kobject *kobj,
 
 static ssize_t
 qla2x00_sysfs_write_optrom(struct file *filp, struct kobject *kobj,
-			   struct bin_attribute *bin_attr,
+			   const struct bin_attribute *bin_attr,
 			   char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -344,19 +344,19 @@ qla2x00_sysfs_write_optrom(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_optrom_attr = {
+static const struct bin_attribute sysfs_optrom_attr = {
 	.attr = {
 		.name = "optrom",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read = qla2x00_sysfs_read_optrom,
-	.write = qla2x00_sysfs_write_optrom,
+	.read_new = qla2x00_sysfs_read_optrom,
+	.write_new = qla2x00_sysfs_write_optrom,
 };
 
 static ssize_t
 qla2x00_sysfs_write_optrom_ctl(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
+			       const struct bin_attribute *bin_attr,
 			       char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -529,18 +529,18 @@ qla2x00_sysfs_write_optrom_ctl(struct file *filp, struct kobject *kobj,
 	return rval;
 }
 
-static struct bin_attribute sysfs_optrom_ctl_attr = {
+static const struct bin_attribute sysfs_optrom_ctl_attr = {
 	.attr = {
 		.name = "optrom_ctl",
 		.mode = S_IWUSR,
 	},
 	.size = 0,
-	.write = qla2x00_sysfs_write_optrom_ctl,
+	.write_new = qla2x00_sysfs_write_optrom_ctl,
 };
 
 static ssize_t
 qla2x00_sysfs_read_vpd(struct file *filp, struct kobject *kobj,
-		       struct bin_attribute *bin_attr,
+		       const struct bin_attribute *bin_attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -587,7 +587,7 @@ qla2x00_sysfs_read_vpd(struct file *filp, struct kobject *kobj,
 
 static ssize_t
 qla2x00_sysfs_write_vpd(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr,
+			const struct bin_attribute *bin_attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -642,19 +642,19 @@ qla2x00_sysfs_write_vpd(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_vpd_attr = {
+static const struct bin_attribute sysfs_vpd_attr = {
 	.attr = {
 		.name = "vpd",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read = qla2x00_sysfs_read_vpd,
-	.write = qla2x00_sysfs_write_vpd,
+	.read_new = qla2x00_sysfs_read_vpd,
+	.write_new = qla2x00_sysfs_write_vpd,
 };
 
 static ssize_t
 qla2x00_sysfs_read_sfp(struct file *filp, struct kobject *kobj,
-		       struct bin_attribute *bin_attr,
+		       const struct bin_attribute *bin_attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -679,18 +679,18 @@ qla2x00_sysfs_read_sfp(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_sfp_attr = {
+static const struct bin_attribute sysfs_sfp_attr = {
 	.attr = {
 		.name = "sfp",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = SFP_DEV_SIZE,
-	.read = qla2x00_sysfs_read_sfp,
+	.read_new = qla2x00_sysfs_read_sfp,
 };
 
 static ssize_t
 qla2x00_sysfs_write_reset(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr,
+			const struct bin_attribute *bin_attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -823,19 +823,19 @@ qla2x00_sysfs_write_reset(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_reset_attr = {
+static const struct bin_attribute sysfs_reset_attr = {
 	.attr = {
 		.name = "reset",
 		.mode = S_IWUSR,
 	},
 	.size = 0,
-	.write = qla2x00_sysfs_write_reset,
+	.write_new = qla2x00_sysfs_write_reset,
 };
 
 static ssize_t
 qla2x00_issue_logo(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr,
-			char *buf, loff_t off, size_t count)
+		   const struct bin_attribute *bin_attr,
+		   char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
 	    struct device, kobj)));
@@ -866,18 +866,18 @@ qla2x00_issue_logo(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_issue_logo_attr = {
+static const struct bin_attribute sysfs_issue_logo_attr = {
 	.attr = {
 		.name = "issue_logo",
 		.mode = S_IWUSR,
 	},
 	.size = 0,
-	.write = qla2x00_issue_logo,
+	.write_new = qla2x00_issue_logo,
 };
 
 static ssize_t
 qla2x00_sysfs_read_xgmac_stats(struct file *filp, struct kobject *kobj,
-		       struct bin_attribute *bin_attr,
+		       const struct bin_attribute *bin_attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -929,18 +929,18 @@ qla2x00_sysfs_read_xgmac_stats(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_xgmac_stats_attr = {
+static const struct bin_attribute sysfs_xgmac_stats_attr = {
 	.attr = {
 		.name = "xgmac_stats",
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read = qla2x00_sysfs_read_xgmac_stats,
+	.read_new = qla2x00_sysfs_read_xgmac_stats,
 };
 
 static ssize_t
 qla2x00_sysfs_read_dcbx_tlv(struct file *filp, struct kobject *kobj,
-		       struct bin_attribute *bin_attr,
+		       const struct bin_attribute *bin_attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
@@ -987,18 +987,18 @@ qla2x00_sysfs_read_dcbx_tlv(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_dcbx_tlv_attr = {
+static const struct bin_attribute sysfs_dcbx_tlv_attr = {
 	.attr = {
 		.name = "dcbx_tlv",
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read = qla2x00_sysfs_read_dcbx_tlv,
+	.read_new = qla2x00_sysfs_read_dcbx_tlv,
 };
 
 static struct sysfs_entry {
 	char *name;
-	struct bin_attribute *attr;
+	const struct bin_attribute *attr;
 	int type;
 } bin_file_entries[] = {
 	{ "fw_dump", &sysfs_fw_dump_attr, },

-- 
2.47.1


