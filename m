Return-Path: <linuxppc-dev+bounces-4155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CEC9F2F35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4v3GX8z2ywC;
	Mon, 16 Dec 2024 22:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348559;
	cv=none; b=flb/FAJH34gX+8es4a0wuLPI8t5DkiAuaOBCkTfWyjFv4KXkMWTx3AHAUknPWXqkP5jrLA9O2srnIlDbiK9qSze90csjpHz0H+fyA+ijWHM2tNcHs4Fk2+BtXXbBuZ9qTb7BJfIKM8Er+m971Nv4PjmVGhNAwYbj5CjnljKqCg5V/iZgfuAIzWZO7cBRwnLPJx/mCnWUjCfeRrtujA7M7xcU98pQ/thEAfPnkPgek4MW3RgZF8iSX/CrEtuIvqkCYnzwddFucAK7NOg5XFVIVZjuK4gc7f28W3sfTZLXSS8u1aOWWSABhX4++GeDJr5an3mwyHAJQ6MMT4+7PYDrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348559; c=relaxed/relaxed;
	bh=wK9gKQDCvwcwN7OIPppFh0cBblpRnthlhegEw7Acjuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpWswFRTlE9b0sRWKTC1elLH+tnsjMsEK9G+VI420PF4b26Zwpxpg60ERFDBjpSeiFKaSkpRce9a5jnfeRJbwaVRGmKVLrVALz/pRto3uXmA+X3FekgvRFydnCK3zKPOq2tST4wvWguaPsm0eE2cQRwRhBw3CLRuE23UziXdVfMTMHjjRtnodlhSp3pNJHOxlG8ntHyV6DPwXiXavOyCnB76M+x/r8kUTuci3sbLxZKM7qlHv6GOeERmVevD5CtwG8W/FRBUlYkZVSSz9axnhJC+atYOCAi1z7zPVxm9tQMNgqwlQ6q9rH2GR0VMFQJzFozGcE0VsxPcFwj+D0YCtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ix4b7inj; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ix4b7inj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4s4z8Rz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348553;
	bh=W+0Z4QVsEE43bUpRexFCykIgMN9iO9eLgbxKoLARbqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ix4b7injg+/iY+ZOZh+5gU5wmZFvPs6gnTB9UQENKl3DystMTzeSMrmyVUfkqAqg/
	 gZ69Cq9X70sGKHjvMImWM+Nj/LUWX2W19kcSZedUxWupGBepLGik2YAcO8dx7QU+ly
	 zQ8gb3MLOWd5WoYQf1/B4gj94nY1po/wDLkcIqpk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:13 +0100
Subject: [PATCH 06/11] scsi: lpfc: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-6-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=2659;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=W+0Z4QVsEE43bUpRexFCykIgMN9iO9eLgbxKoLARbqk=;
 b=PvxT0Qpnkj49P3LHfPfXUCSjZE54BDHEBEjiOzke6/a3CdIzFNkyHoShGplVXsJePuSfUff3F
 dfoi0gw/LXlDRb6N4AsoA6trIQtSEUSLVm2LIqvPkYloF319CSfV2Bf
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
 drivers/scsi/lpfc/lpfc_attr.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 39b504164ecc187d8b0798c95c9fa3f6bc9780e3..0d0213bba35da8e10be8b874763dd5f01d6ff586 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -6185,7 +6185,7 @@ const struct attribute_group *lpfc_vport_groups[] = {
  **/
 static ssize_t
 sysfs_ctlreg_write(struct file *filp, struct kobject *kobj,
-		   struct bin_attribute *bin_attr,
+		   const struct bin_attribute *bin_attr,
 		   char *buf, loff_t off, size_t count)
 {
 	size_t buf_off;
@@ -6244,7 +6244,7 @@ sysfs_ctlreg_write(struct file *filp, struct kobject *kobj,
  **/
 static ssize_t
 sysfs_ctlreg_read(struct file *filp, struct kobject *kobj,
-		  struct bin_attribute *bin_attr,
+		  const struct bin_attribute *bin_attr,
 		  char *buf, loff_t off, size_t count)
 {
 	size_t buf_off;
@@ -6280,14 +6280,14 @@ sysfs_ctlreg_read(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_ctlreg_attr = {
+static const struct bin_attribute sysfs_ctlreg_attr = {
 	.attr = {
 		.name = "ctlreg",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 256,
-	.read = sysfs_ctlreg_read,
-	.write = sysfs_ctlreg_write,
+	.read_new = sysfs_ctlreg_read,
+	.write_new = sysfs_ctlreg_write,
 };
 
 /**
@@ -6308,7 +6308,7 @@ static struct bin_attribute sysfs_ctlreg_attr = {
  **/
 static ssize_t
 sysfs_mbox_write(struct file *filp, struct kobject *kobj,
-		 struct bin_attribute *bin_attr,
+		 const struct bin_attribute *bin_attr,
 		 char *buf, loff_t off, size_t count)
 {
 	return -EPERM;
@@ -6332,20 +6332,20 @@ sysfs_mbox_write(struct file *filp, struct kobject *kobj,
  **/
 static ssize_t
 sysfs_mbox_read(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *bin_attr,
+		const struct bin_attribute *bin_attr,
 		char *buf, loff_t off, size_t count)
 {
 	return -EPERM;
 }
 
-static struct bin_attribute sysfs_mbox_attr = {
+static const struct bin_attribute sysfs_mbox_attr = {
 	.attr = {
 		.name = "mbox",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = MAILBOX_SYSFS_MAX,
-	.read = sysfs_mbox_read,
-	.write = sysfs_mbox_write,
+	.read_new = sysfs_mbox_read,
+	.write_new = sysfs_mbox_write,
 };
 
 /**

-- 
2.47.1


