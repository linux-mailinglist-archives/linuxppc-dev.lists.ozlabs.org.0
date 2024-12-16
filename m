Return-Path: <linuxppc-dev+bounces-4154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603A9F2F31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4t6HhDz2yvh;
	Mon, 16 Dec 2024 22:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348558;
	cv=none; b=QVfTSXwB18DQUaWNKnMknSfNWu/QNbCLEC5u95Is9AXzh72/D9xSlxtQAY1fCzlKVSGY8e0UeIw3cgdt+DLHZsEEDMIiry4Vpw2fHZ2V0GbW3xjKZNYoznXXvR+P08sTszsIKPxDYvckao7hNWtAQtBxCgYsyS+0P7tYM86uHLQJ6DFJ1PwtyI+w5M4MH+QAkg/+sjA056b5iyA6oRSZ6f7bw4llfdYlEnvdJzxIkFdTpHbJP5y3CPydSEFWvVfb3V+nhtIuuMSUAJAz5/xZjFq1MwK+EZ93PtcARlSqCrVPeWwnEBz7CLWh1yiLn/Q6rRIadCQLleLbs4DxU+GdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348558; c=relaxed/relaxed;
	bh=CbMUoMB5t9sWTp2/BgAr1nm2ivQaQG/RDD5TpUh/Su4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxEHNHyzjGC3A00z6VqDju1qyCY5p6+jz6lYXxBkdIXBivBn3YTuAqYNBJxKO3toF26If7LUtn145uzDmSpzaZha+Q6vlmazIDkh7H1g3S35kDs5YWYxheLcRNvv3qw0Joda1eq2YfMNW+Psh0cF34HDtGy15wyakMXg+V444Z91a9aUfOxmROMD177nluqG0a+637X4d/fImpbRROAVMuZ1gRF29ETKdlWWLCXFOMxI2L916ScQZYPI2WlJAbaZxqEQwgkJ0ZNBZL43zfQfXIwF857xV4+mZZcWVPTZAeQB4XCGxF8xg4SWGneHWCV8wXl8ZIJZHZL5JxDJdzFpYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=FQQrBHSu; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=FQQrBHSu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4r6KRwz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348552;
	bh=UxSxwL/qK4i4u8NjbrtHnSuDQ3zqF0XhxRjgbnp1ehs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FQQrBHSuc72gKSix1QVSuur4IgSvsKGMsC93Gbmx0fPteAd57elXpFWksPYL3Wuul
	 CtzDCAFfce5XoAN+wFusEAxuZ++WObbQDSu3h+vAgjVa2dsRO2udFjZNmvFleRSHic
	 xlszaq5LqCMZmwjIwwXu0S/L1pscFPyLclE8Fkcw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:10 +0100
Subject: [PATCH 03/11] scsi: arcmsr: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-3-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=2527;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UxSxwL/qK4i4u8NjbrtHnSuDQ3zqF0XhxRjgbnp1ehs=;
 b=vcyhEJcSeUIpb/s74+rAXfMuCTEu+PgS5tfd520cNRubmtpMJ+lqdXmNUTpuW64jf2eM5p4hu
 EXGDhImAe/bCfxvGEXm5GK3GNZZPH02XxoEI1YUiBIbmgO1caKNY1v5
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
 drivers/scsi/arcmsr/arcmsr_attr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_attr.c b/drivers/scsi/arcmsr/arcmsr_attr.c
index baeb5e79569026f1af6612705689219bb4a7052f..8e3d4799ce93c35b0befe8744fd20aa3fe467ad3 100644
--- a/drivers/scsi/arcmsr/arcmsr_attr.c
+++ b/drivers/scsi/arcmsr/arcmsr_attr.c
@@ -60,7 +60,7 @@
 
 static ssize_t arcmsr_sysfs_iop_message_read(struct file *filp,
 					     struct kobject *kobj,
-					     struct bin_attribute *bin,
+					     const struct bin_attribute *bin,
 					     char *buf, loff_t off,
 					     size_t count)
 {
@@ -107,7 +107,7 @@ static ssize_t arcmsr_sysfs_iop_message_read(struct file *filp,
 
 static ssize_t arcmsr_sysfs_iop_message_write(struct file *filp,
 					      struct kobject *kobj,
-					      struct bin_attribute *bin,
+					      const struct bin_attribute *bin,
 					      char *buf, loff_t off,
 					      size_t count)
 {
@@ -155,7 +155,7 @@ static ssize_t arcmsr_sysfs_iop_message_write(struct file *filp,
 
 static ssize_t arcmsr_sysfs_iop_message_clear(struct file *filp,
 					      struct kobject *kobj,
-					      struct bin_attribute *bin,
+					      const struct bin_attribute *bin,
 					      char *buf, loff_t off,
 					      size_t count)
 {
@@ -194,7 +194,7 @@ static const struct bin_attribute arcmsr_sysfs_message_read_attr = {
 		.mode = S_IRUSR ,
 	},
 	.size = ARCMSR_API_DATA_BUFLEN,
-	.read = arcmsr_sysfs_iop_message_read,
+	.read_new = arcmsr_sysfs_iop_message_read,
 };
 
 static const struct bin_attribute arcmsr_sysfs_message_write_attr = {
@@ -203,7 +203,7 @@ static const struct bin_attribute arcmsr_sysfs_message_write_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = ARCMSR_API_DATA_BUFLEN,
-	.write = arcmsr_sysfs_iop_message_write,
+	.write_new = arcmsr_sysfs_iop_message_write,
 };
 
 static const struct bin_attribute arcmsr_sysfs_message_clear_attr = {
@@ -212,7 +212,7 @@ static const struct bin_attribute arcmsr_sysfs_message_clear_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = 1,
-	.write = arcmsr_sysfs_iop_message_clear,
+	.write_new = arcmsr_sysfs_iop_message_clear,
 };
 
 int arcmsr_alloc_sysfs_attr(struct AdapterControlBlock *acb)

-- 
2.47.1


