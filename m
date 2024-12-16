Return-Path: <linuxppc-dev+bounces-4153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4169F2F2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4t4RFzz2yhR;
	Mon, 16 Dec 2024 22:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348558;
	cv=none; b=Q7Uq2In1GoHceTVVNjBkmsGbjZwUyHMi/EYL8P+ErM07OI7pXqxs3shC8xD8VXXUNKYR8zyHNMnd0R91R7wDjpgABF1bHc8E5dP12SS+uGX8T5874gjZmbO6JsvhtQRVZ/g3anBGi254ik3s1kwpWQVOc+dmIOp3/RstvE1LkkblT44H9zhBcWA7BXYpKXtN40pTIi963CjSuS5R5CVfSMQ/NJ4WfaOdaZ+XF66D6okJggG20ojj0yI5ihpejFBClGZ60O0VaSe3zAcs1oAQmY94nOAavCuTucrb0w3pVlXHJaNpa9KJ5mFh/BQLAQ+l+/3TNPXDQu/xtsDwq2rv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348558; c=relaxed/relaxed;
	bh=dWD/KQ8lMmVZLqSWVcWT4cMsKcIMYMBsJCurqIeq9kE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ql9SRbvgbj+LJL/M9D5wG3GH4PDNkK61PMF/delNKS3VGQWA8uyrZBPbS8Qn5f7Hb72vPReJ8ORm1cXsh/1C0SmcxX+1R62JKLD+WcOVTtaxhFfQEYneGkA85UX+85aFXHH1I7jNcqp9KByxJoCbp5vv/bqITOF0uLb3MiBZHp46g+41JfV7AGTOudO6JbIMemW4PaxAtAf3vyI2M8OVaQlROs5bWdA/LCaoNXyzfAjcwjdk6WuM0fyGm7JBUeexM2PMr70A15OGSy9fnwK8O+LPD9PUdB5iXAaTAgs4h9CFoYsCj6kFt9i+9G9RCDqYzXe+AXM1hGQt0cGyvFWQqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=smBWsnEG; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=smBWsnEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4r6FG7z2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348552;
	bh=TjVja/zk+UJSLd4Q97XnJXAzbXafaV96VJJ2y2xcgm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=smBWsnEGDX0bZ10U/9wLxtIv2PGJ5U4XBMe94YkqdZF6ukWU83aG4wJzucfAP2k8P
	 YBRJMCxE9jiZ/Rrj9akKDg1C4jyus9A4sJaJL8S8em1xWjoKlmkWTA+NOeQ4fli+s+
	 NzNipJv6XG8USBabiBG904lzidmMQVDwCXIO2c/c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:11 +0100
Subject: [PATCH 04/11] scsi: esas2r: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-4-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=6468;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TjVja/zk+UJSLd4Q97XnJXAzbXafaV96VJJ2y2xcgm4=;
 b=cHpzmCZLeQqd1OQ9m+VjdHMlnbORVFZql4Wpf6q2sfJdTUE0nTJzea+z2TUT+o90QQnQ3pVcM
 1Qkron+E+zwDaDCjDL5AgAFL69ATj+ts8h3Zvs/T8Ma3pN/j1evnvnD
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
 drivers/scsi/esas2r/esas2r.h      | 12 ++++++------
 drivers/scsi/esas2r/esas2r_main.c | 32 ++++++++++++++++----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/scsi/esas2r/esas2r.h b/drivers/scsi/esas2r/esas2r.h
index 1e2d7c63a8e36a22bed3b365cd2e6eb81a3a4a1d..c48275d53aef3d45c0b8a1c38f5a21020ab33102 100644
--- a/drivers/scsi/esas2r/esas2r.h
+++ b/drivers/scsi/esas2r/esas2r.h
@@ -1411,11 +1411,11 @@ static inline void esas2r_comp_list_drain(struct esas2r_adapter *a,
 }
 
 /* sysfs handlers */
-extern struct bin_attribute bin_attr_fw;
-extern struct bin_attribute bin_attr_fs;
-extern struct bin_attribute bin_attr_vda;
-extern struct bin_attribute bin_attr_hw;
-extern struct bin_attribute bin_attr_live_nvram;
-extern struct bin_attribute bin_attr_default_nvram;
+extern const struct bin_attribute bin_attr_fw;
+extern const struct bin_attribute bin_attr_fs;
+extern const struct bin_attribute bin_attr_vda;
+extern const struct bin_attribute bin_attr_hw;
+extern const struct bin_attribute bin_attr_live_nvram;
+extern const struct bin_attribute bin_attr_default_nvram;
 
 #endif /* ESAS2R_H */
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index f700a16cd88534c1edc9fb0ed8ed8b8d1db4fe51..44871746944ad0c0f30f28975ed40e0fde4e8d03 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -66,7 +66,7 @@ static struct esas2r_adapter *esas2r_adapter_from_kobj(struct kobject *kobj)
 }
 
 static ssize_t read_fw(struct file *file, struct kobject *kobj,
-		       struct bin_attribute *attr,
+		       const struct bin_attribute *attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -75,7 +75,7 @@ static ssize_t read_fw(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t write_fw(struct file *file, struct kobject *kobj,
-			struct bin_attribute *attr,
+			const struct bin_attribute *attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -84,7 +84,7 @@ static ssize_t write_fw(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t read_fs(struct file *file, struct kobject *kobj,
-		       struct bin_attribute *attr,
+		       const struct bin_attribute *attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -93,7 +93,7 @@ static ssize_t read_fs(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t write_fs(struct file *file, struct kobject *kobj,
-			struct bin_attribute *attr,
+			const struct bin_attribute *attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -109,7 +109,7 @@ static ssize_t write_fs(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t read_vda(struct file *file, struct kobject *kobj,
-			struct bin_attribute *attr,
+			const struct bin_attribute *attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -118,7 +118,7 @@ static ssize_t read_vda(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t write_vda(struct file *file, struct kobject *kobj,
-			 struct bin_attribute *attr,
+			 const struct bin_attribute *attr,
 			 char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -127,7 +127,7 @@ static ssize_t write_vda(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t read_live_nvram(struct file *file, struct kobject *kobj,
-			       struct bin_attribute *attr,
+			       const struct bin_attribute *attr,
 			       char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -138,7 +138,7 @@ static ssize_t read_live_nvram(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t write_live_nvram(struct file *file, struct kobject *kobj,
-				struct bin_attribute *attr,
+				const struct bin_attribute *attr,
 				char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -158,7 +158,7 @@ static ssize_t write_live_nvram(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t read_default_nvram(struct file *file, struct kobject *kobj,
-				  struct bin_attribute *attr,
+				  const struct bin_attribute *attr,
 				  char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -169,7 +169,7 @@ static ssize_t read_default_nvram(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t read_hw(struct file *file, struct kobject *kobj,
-		       struct bin_attribute *attr,
+		       const struct bin_attribute *attr,
 		       char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -187,7 +187,7 @@ static ssize_t read_hw(struct file *file, struct kobject *kobj,
 }
 
 static ssize_t write_hw(struct file *file, struct kobject *kobj,
-			struct bin_attribute *attr,
+			const struct bin_attribute *attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct esas2r_adapter *a = esas2r_adapter_from_kobj(kobj);
@@ -211,12 +211,12 @@ static ssize_t write_hw(struct file *file, struct kobject *kobj,
 }
 
 #define ESAS2R_RW_BIN_ATTR(_name) \
-	struct bin_attribute bin_attr_ ## _name = { \
+	const struct bin_attribute bin_attr_ ## _name = { \
 		.attr	= \
 		{ .name = __stringify(_name), .mode  = S_IRUSR | S_IWUSR }, \
 		.size	= 0, \
-		.read	= read_ ## _name, \
-		.write	= write_ ## _name }
+		.read_new	= read_ ## _name, \
+		.write_new	= write_ ## _name }
 
 ESAS2R_RW_BIN_ATTR(fw);
 ESAS2R_RW_BIN_ATTR(fs);
@@ -224,10 +224,10 @@ ESAS2R_RW_BIN_ATTR(vda);
 ESAS2R_RW_BIN_ATTR(hw);
 ESAS2R_RW_BIN_ATTR(live_nvram);
 
-struct bin_attribute bin_attr_default_nvram = {
+const struct bin_attribute bin_attr_default_nvram = {
 	.attr	= { .name = "default_nvram", .mode = S_IRUGO },
 	.size	= 0,
-	.read	= read_default_nvram,
+	.read_new	= read_default_nvram,
 	.write	= NULL
 };
 

-- 
2.47.1


