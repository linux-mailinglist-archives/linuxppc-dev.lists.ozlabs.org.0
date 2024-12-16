Return-Path: <linuxppc-dev+bounces-4162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB69F2F41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:30:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4z6Kyvz3054;
	Mon, 16 Dec 2024 22:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348563;
	cv=none; b=cKV4TpgvLhI5BWCqyC6fDpCfnK61H4APfhWItsnKVdMTl/kEyTaG6sBy6rUxrhLSoJSi/Up7lUjp2pt7vwPLOovqFlkxYbLSFSmshew/2Fw9t0czl1t2rsYsyQ+RaRZ3nryKNMrTbAGDpTnyRJu1LxOqopkWnaJ2LzYJJETjbpSqw4i0IFguR23Tnv0jtJ+AkhkhcarZLOBuCE1iIrYdVa8prcju4cuhgZAH1q61Ow6akn9z+bFc1UajuXykSDgbY1J6CiYYW1AfMsE8wOcQsmMfsirUhgK/BzoppYErS16NYWuLPeQe/yCBPnUbeLWiqNyUta4Yj4KPMvzSBwWnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348563; c=relaxed/relaxed;
	bh=g9tjk3PODnytxLGLUKqtJmJ+F/iSkkx1r3oj2gP/2ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emWIjwdF7HHxAe2YGzwmP6/+jGUIym/SNyR1Ijf/ruyhPHylBayy9/raxuhiWtWh+YGQV1lw4OwL7cW1CkBy/lgGptz5eSDVZoNGcd2CB7OUeBNkNpXcZC0NZB0YtVW9AhhKjUZWxE848GfRjhP8AkCSerrRaGQvk8QatiGnjnzg1r6eDLW/tsZQ6+KX9XsWb32rK2tQca41/9BeOIuuxakQnimcjFSGbZ22Fqfxn8vDX9lqjaLvL5JS5lFqTV8kACCpQVEg/nq0QxnVYvh6Ywvzc+SDMCWKj1b+MVQmC4LSQdMDTwfOYnNUVqU1/N2Y3xXYeAaQ17S6wS7W+M/1wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=JZnvdDvI; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=JZnvdDvI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4y1xylz302N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348553;
	bh=3uZW7n2Dks+H/Doo9q/ymOJETj3rjFvKcshiuUcefLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JZnvdDvIVLp1ZOxxcHNlXN8wdnL+pIUmr0q7kiYSIb59hF+wPedan38OdkIU3mFxI
	 GCnSq0idhsTC5EYfkYXdnHztJe4bXI9oXfLHux5+MNwo1WYKNujzy1r+0jT6DM7Gyp
	 VQzSYcM/qQ/Z4JjpIikvUVUs9SejC6uHDS2gdaF0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:18 +0100
Subject: [PATCH 11/11] scsi: qla4xxx: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-11-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=2063;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=3uZW7n2Dks+H/Doo9q/ymOJETj3rjFvKcshiuUcefLM=;
 b=FudiGZdk+7eiqucd0Mb3IdXBG2lRQt7iNuv+QY5rtiehQ0sCbeMq8dx/vlYt5/Q9/IIhVyJBr
 R65fOzklM+wC2PS3I1zQMq5XL6HeZTFUPE1v5sntq59RyzxSNb7mE4t
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
 drivers/scsi/qla4xxx/ql4_attr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/qla4xxx/ql4_attr.c b/drivers/scsi/qla4xxx/ql4_attr.c
index abfa6ef604800aefef3dbc757d656b7dc20ede8c..e3f85d6ea0db25d5674ca69475af31a4267e2fdb 100644
--- a/drivers/scsi/qla4xxx/ql4_attr.c
+++ b/drivers/scsi/qla4xxx/ql4_attr.c
@@ -10,7 +10,7 @@
 
 static ssize_t
 qla4_8xxx_sysfs_read_fw_dump(struct file *filep, struct kobject *kobj,
-			     struct bin_attribute *ba, char *buf, loff_t off,
+			     const struct bin_attribute *ba, char *buf, loff_t off,
 			     size_t count)
 {
 	struct scsi_qla_host *ha = to_qla_host(dev_to_shost(container_of(kobj,
@@ -28,7 +28,7 @@ qla4_8xxx_sysfs_read_fw_dump(struct file *filep, struct kobject *kobj,
 
 static ssize_t
 qla4_8xxx_sysfs_write_fw_dump(struct file *filep, struct kobject *kobj,
-			      struct bin_attribute *ba, char *buf, loff_t off,
+			      const struct bin_attribute *ba, char *buf, loff_t off,
 			      size_t count)
 {
 	struct scsi_qla_host *ha = to_qla_host(dev_to_shost(container_of(kobj,
@@ -104,19 +104,19 @@ qla4_8xxx_sysfs_write_fw_dump(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute sysfs_fw_dump_attr = {
+static const struct bin_attribute sysfs_fw_dump_attr = {
 	.attr = {
 		.name = "fw_dump",
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read = qla4_8xxx_sysfs_read_fw_dump,
-	.write = qla4_8xxx_sysfs_write_fw_dump,
+	.read_new = qla4_8xxx_sysfs_read_fw_dump,
+	.write_new = qla4_8xxx_sysfs_write_fw_dump,
 };
 
 static struct sysfs_entry {
 	char *name;
-	struct bin_attribute *attr;
+	const struct bin_attribute *attr;
 } bin_file_entries[] = {
 	{ "fw_dump", &sysfs_fw_dump_attr },
 	{ NULL },

-- 
2.47.1


