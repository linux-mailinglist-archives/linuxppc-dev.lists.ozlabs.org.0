Return-Path: <linuxppc-dev+bounces-4159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096A9F2F3E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4y5Hbxz2ynn;
	Mon, 16 Dec 2024 22:29:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348562;
	cv=none; b=Tw1keh7BNm9ZJqbEhmoICSNSXZUL9RLNCjfnKpesX8aXWHEdE1pDxyyASPomRbRVOmoFFOXQYatB0xhHPyJMsItmnnPIZPvKyMlre6CXN/rNNyI42R7HI99Nn6XzUU12/8rgvNM0r6kdb07PLb685XFchWyNjdkCdacy3jobDUlhBi30dnIPgLp8pFLztUZmLOZDL/fqm9OIrKqt2xRvwWX/XKG2RsB9Q5vt9rHJYaG1mcGTBI68ISqBnxGoYUg3JDtTOqYrK1sQBWtBQt5UoThf1plapwVsp2PmCBFeX+20xDfe0vM4ghYlIzn3cC1MfnZi2CZJWx0BSP6u1/rKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348562; c=relaxed/relaxed;
	bh=F/ZpoBTjrsor9pOOJCay2JDwdsZIYyxdU6A4jJswXLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWQvb2ph/HqtFI93aiBSbIPxODJMvHZc57zMU7xPLAM8/oqH8sugUguQiNfNG82vs0FC+OUZdReL40OC5+6bbOKm/oKfvFo9n1F/fN1rorop2JzWXW4s5f5N22NwVztx+yBJrV/vvRotXXZM94lwkGe21EmObTGAuk4mZg0U3XOW7NV1tKgA8dI77+D4V8o5tyHzTj4AMw1XPY09UDXqIPfksMATgFVA+KozzMIDCeISeBjPVgPRnTaWmYJRC+rY79cT8T+Pzos6A4j6zMZt1xfHILi12lZ88pFrTPuJ8lu4bg40wlCJIThZX4ljRae2bqGUQbfu6Jfki82+oQAH8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sN8K+/xC; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sN8K+/xC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4w724Zz300g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348552;
	bh=WaboRMSctLDNjMoiMP+WBKKWL22udYHg4PafZfmH3dE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sN8K+/xCJ4sZCX8bmX7GVrAxYuOUqAJ6Kee5HVCDqDGMRkmSLuPh/Y6mYGSyXE0HG
	 99ljPEsa8JLb0GraBEi7Y0z46TqX2N5p5HP5IYyCVk53yWaeB9hqS5MQH/bqkzRJQg
	 NY4lfT52/XIEK7EZzNjDbZBnu/AE2ELBiJDhOqxg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:08 +0100
Subject: [PATCH 01/11] scsi: core: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-1-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=2829;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=WaboRMSctLDNjMoiMP+WBKKWL22udYHg4PafZfmH3dE=;
 b=K189QbdH2CaN3ics6UBI9t1/D7hlarXbzYbn3lOIMhyJEb/UWOgCYM88r+iNuEVwcc/2FVc7b
 pEUwUoHctEGBLGTLnpDHiQ1gf4nRfSgOtBYhF1LFc6MprRLxTDq93bB
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
 drivers/scsi/scsi_sysfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index f3a1ecb42128a2b221ca5c362e041eb59dba0f20..6ad859a4ec08f5a6773bb84bf899201eed1f468f 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -898,7 +898,7 @@ static DEVICE_ATTR(queue_type, S_IRUGO | S_IWUSR, show_queue_type_field,
 #define sdev_vpd_pg_attr(_page)						\
 static ssize_t							\
 show_vpd_##_page(struct file *filp, struct kobject *kobj,	\
-		 struct bin_attribute *bin_attr,			\
+		 const struct bin_attribute *bin_attr,			\
 		 char *buf, loff_t off, size_t count)			\
 {									\
 	struct device *dev = kobj_to_dev(kobj);				\
@@ -914,10 +914,10 @@ show_vpd_##_page(struct file *filp, struct kobject *kobj,	\
 	rcu_read_unlock();						\
 	return ret;							\
 }									\
-static struct bin_attribute dev_attr_vpd_##_page = {		\
+static const struct bin_attribute dev_attr_vpd_##_page = {		\
 	.attr =	{.name = __stringify(vpd_##_page), .mode = S_IRUGO },	\
 	.size = 0,							\
-	.read = show_vpd_##_page,					\
+	.read_new = show_vpd_##_page,					\
 };
 
 sdev_vpd_pg_attr(pg83);
@@ -930,7 +930,7 @@ sdev_vpd_pg_attr(pgb7);
 sdev_vpd_pg_attr(pg0);
 
 static ssize_t show_inquiry(struct file *filep, struct kobject *kobj,
-			    struct bin_attribute *bin_attr,
+			    const struct bin_attribute *bin_attr,
 			    char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -943,13 +943,13 @@ static ssize_t show_inquiry(struct file *filep, struct kobject *kobj,
 				       sdev->inquiry_len);
 }
 
-static struct bin_attribute dev_attr_inquiry = {
+static const struct bin_attribute dev_attr_inquiry = {
 	.attr = {
 		.name = "inquiry",
 		.mode = S_IRUGO,
 	},
 	.size = 0,
-	.read = show_inquiry,
+	.read_new = show_inquiry,
 };
 
 static ssize_t
@@ -1348,7 +1348,7 @@ static struct attribute *scsi_sdev_attrs[] = {
 	NULL
 };
 
-static struct bin_attribute *scsi_sdev_bin_attrs[] = {
+static const struct bin_attribute *const scsi_sdev_bin_attrs[] = {
 	&dev_attr_vpd_pg0,
 	&dev_attr_vpd_pg83,
 	&dev_attr_vpd_pg80,
@@ -1362,7 +1362,7 @@ static struct bin_attribute *scsi_sdev_bin_attrs[] = {
 };
 static struct attribute_group scsi_sdev_attr_group = {
 	.attrs =	scsi_sdev_attrs,
-	.bin_attrs =	scsi_sdev_bin_attrs,
+	.bin_attrs_new = scsi_sdev_bin_attrs,
 	.is_visible =	scsi_sdev_attr_is_visible,
 	.is_bin_visible = scsi_sdev_bin_attr_is_visible,
 };

-- 
2.47.1


