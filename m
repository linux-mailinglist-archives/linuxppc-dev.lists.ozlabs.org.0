Return-Path: <linuxppc-dev+bounces-4156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4669F2F36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4v4kXfz2ywy;
	Mon, 16 Dec 2024 22:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348559;
	cv=none; b=kBJAcdjzwzaqweqZt6X3yMYVCmUtG+tqaZEKI271R3VDAKMDlpN465IZzJoGldRzDxp9a09Xqyg0qnXgtIUaUmf7kZ0dzCztIHfMepzSUzvu9z3MMacbsqDp4wkWHwVgS7I/3I0og0Pjev9UejOMWx2eCACYppFOmBNZgD5QcuW9hD/R7IFh0KEVTXkwpK3mj3mj64+g+XMqzYLo0y0A8txgkTiwFe9/23oGgMdaqWHyE4fsuUTa2OC8wXXCbBF/ovG6L1b7LCllUDpCKhUWxy957NMw9LTa8GzWvU9RhNQzTk7C+gnnNbH6hcV1yrxvhKmT1ed5RdkfZ1vA/DoAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348559; c=relaxed/relaxed;
	bh=oBIR2FSOOrnlH4kp69gEaYd1DeoIVdhN7igAbJs+304=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCymCHEIK1AMhPR3VfhpC2mLZogvNJFjNdQrmOtWvJayED+YerqGmN2pEqARaMx6A9DJJaw8yqvFqhMIvo/KfBeSbigqAxXT0SFOxaTf9KxK8yAdMnm3VDKZBxwIxIMpCkCc20F4bBYkeSdMgUBmWCDn0og2Viscf/2rPcyyIZ+qjbtWPiLG0dFb1uCjCImY6JnwZyo+oYAcdw9I39/UAZHlCAPWFxajzPZpJWC+TqFxuwNQaNpyiMJgCQcKF3G3XlPepXL/uozhLIXxu7V4+0jYFrjcWBLwSRC126o8RBxFkL4Gb3mrGU+UhwdjvzcQTA39M+UVILCBSqwcHayp9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ezXrjNfZ; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ezXrjNfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4s30s9z2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348553;
	bh=J7r5Ti/saHXCrjrJTNrPH1+HHellTzKNGzEhEZF4B/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ezXrjNfZeyrhOmlE3jk3YbSVQVNKRizh3lAJnus8DGuzlcE6RzSC9JrFiNokNSuSP
	 wIBV4gL6Q45L788RVY2O7GqGFjFTWkITpIaVHI+0VmeSW7l5YPySAMxz2NJu2I7V4L
	 p6DY+Vi09CFaP0/3fFBrYHt+c3R4Ts/EgUT22Lls=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:14 +0100
Subject: [PATCH 07/11] scsi: ipr: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-7-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=3842;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=J7r5Ti/saHXCrjrJTNrPH1+HHellTzKNGzEhEZF4B/8=;
 b=ikn/d3a4NvnzIoHDX3GVT/kqTj/u6jpmFIMnON6Q5cPNcZXzDO6bWCS+3GkoABkAbnZG8P+BJ
 LPuxqooaZ6uAHRElQg2VVKnnE/PybWFkgTefSC+utZqJHkMb2J4lr7F
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
 drivers/scsi/ipr.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index 31cf2d31cceba090859c15f72f85fe7ca1698a55..db19888c5351a27d7560192339d2b9b533101e58 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -3366,7 +3366,7 @@ static void ipr_worker_thread(struct work_struct *work)
  *	number of bytes printed to buffer
  **/
 static ssize_t ipr_read_trace(struct file *filp, struct kobject *kobj,
-			      struct bin_attribute *bin_attr,
+			      const struct bin_attribute *bin_attr,
 			      char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -3383,13 +3383,13 @@ static ssize_t ipr_read_trace(struct file *filp, struct kobject *kobj,
 	return ret;
 }
 
-static struct bin_attribute ipr_trace_attr = {
+static const struct bin_attribute ipr_trace_attr = {
 	.attr =	{
 		.name = "trace",
 		.mode = S_IRUGO,
 	},
 	.size = 0,
-	.read = ipr_read_trace,
+	.read_new = ipr_read_trace,
 };
 #endif
 
@@ -4087,7 +4087,7 @@ static struct device_attribute ipr_ioa_fw_type_attr = {
 };
 
 static ssize_t ipr_read_async_err_log(struct file *filep, struct kobject *kobj,
-				struct bin_attribute *bin_attr, char *buf,
+				const struct bin_attribute *bin_attr, char *buf,
 				loff_t off, size_t count)
 {
 	struct device *cdev = kobj_to_dev(kobj);
@@ -4111,7 +4111,7 @@ static ssize_t ipr_read_async_err_log(struct file *filep, struct kobject *kobj,
 }
 
 static ssize_t ipr_next_async_err_log(struct file *filep, struct kobject *kobj,
-				struct bin_attribute *bin_attr, char *buf,
+				const struct bin_attribute *bin_attr, char *buf,
 				loff_t off, size_t count)
 {
 	struct device *cdev = kobj_to_dev(kobj);
@@ -4134,14 +4134,14 @@ static ssize_t ipr_next_async_err_log(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute ipr_ioa_async_err_log = {
+static const struct bin_attribute ipr_ioa_async_err_log = {
 	.attr = {
 		.name =		"async_err_log",
 		.mode =		S_IRUGO | S_IWUSR,
 	},
 	.size = 0,
-	.read = ipr_read_async_err_log,
-	.write = ipr_next_async_err_log
+	.read_new = ipr_read_async_err_log,
+	.write_new = ipr_next_async_err_log
 };
 
 static struct attribute *ipr_ioa_attrs[] = {
@@ -4172,7 +4172,7 @@ ATTRIBUTE_GROUPS(ipr_ioa);
  *	number of bytes printed to buffer
  **/
 static ssize_t ipr_read_dump(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr,
+			     const struct bin_attribute *bin_attr,
 			     char *buf, loff_t off, size_t count)
 {
 	struct device *cdev = kobj_to_dev(kobj);
@@ -4361,7 +4361,7 @@ static int ipr_free_dump(struct ipr_ioa_cfg *ioa_cfg)
  *	number of bytes printed to buffer
  **/
 static ssize_t ipr_write_dump(struct file *filp, struct kobject *kobj,
-			      struct bin_attribute *bin_attr,
+			      const struct bin_attribute *bin_attr,
 			      char *buf, loff_t off, size_t count)
 {
 	struct device *cdev = kobj_to_dev(kobj);
@@ -4385,14 +4385,14 @@ static ssize_t ipr_write_dump(struct file *filp, struct kobject *kobj,
 		return count;
 }
 
-static struct bin_attribute ipr_dump_attr = {
+static const struct bin_attribute ipr_dump_attr = {
 	.attr =	{
 		.name = "dump",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read = ipr_read_dump,
-	.write = ipr_write_dump
+	.read_new = ipr_read_dump,
+	.write_new = ipr_write_dump
 };
 #else
 static int ipr_free_dump(struct ipr_ioa_cfg *ioa_cfg) { return 0; };

-- 
2.47.1


