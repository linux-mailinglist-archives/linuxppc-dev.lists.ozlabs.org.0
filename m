Return-Path: <linuxppc-dev+bounces-4160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F27DA9F2F3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4z24Khz3048;
	Mon, 16 Dec 2024 22:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348563;
	cv=none; b=NsmHkfUE5c/Xmnmj0b0bkrFD+UNlmee7hkmdlmqTZRvMzWoCottVM7Vkc/jOBSB46OfFmNA+glu5zyP3RQ/nRXnw2D9KHPApY3pIefErTh/dVCHEgaSjF3cjqC7FITIEm51ZDcES1Kf3crn55hYANYEHTHl3Xg2KjR74wyoHhy8cPIP3SPUfW+d56t3mqZHf5uk8XRDvkqQ66hYIgfQ/Hcpn2GGEKVqfdyUbUujGV7ip17YTg4SkXdKL7MNReW6NN1lfFtC7rExxD7umKTrosYOokFeemr3jfTG5dqE5uoZFKBePuNjaYQ4xZBLSW7tMWRhHhumtjPCWznr/0uFAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348563; c=relaxed/relaxed;
	bh=htzlxY/hwm84cAKGwxjnQbmr1zTO4no+lM/1COcdNEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcmFdC1sVTMjWLLkTBG8NzUYQQGBWhRZaY4sRmhu+BS9oql4jLYZ5KQ92ZOxaRAfXCoHFemRvF0C563LxjasTUg53SB3KTQDhJIBL7wXFFmi41b7mx1domXodZr9qdBrgtwBDNLzaYi9ENerdONJn3rCElqh2c48rFCxzM5EZ4VbkNnTUpO3wg9SOnlyMUlOsHjTlE8tDtaI/5SQ/uKVX2Wut+Rv10WtviPahtoljC+hdTjUzdDa99/IpYUQhjV15pHxiy1XdGTKNhaVsifmciaTW6d6gCR6yO8qTEHQSKubZ7hMv10fMzvUFwcGbdTjFTjMqkfUl442Y7z6/ICFmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Q1eyXdHb; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Q1eyXdHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4x0Clhz3011
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348552;
	bh=oitZ6tqthOyv84s9N34Rb9nzMVcAd+9eCJs7DMuMPZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q1eyXdHbyag9KhzRNNgo9E8H9QL8KBm0VJ3bBuTYmu/Q8ID2LdEs7F82M+oAGmL0f
	 hFS3ewEZkIiO22+WG30C4OWIEuIknRZphCNvM1N8nsB04lCaZxqliKvhBLxrIsnnGK
	 yEdF8dh4FKu2rUj1XByTCI+l4AHJ0pzX80nSFnSk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:09 +0100
Subject: [PATCH 02/11] scsi: 3w-sas: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-2-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=2354;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=oitZ6tqthOyv84s9N34Rb9nzMVcAd+9eCJs7DMuMPZg=;
 b=sacDHXbh5wtVuj4CIy4c8lPoMwYfRqbvW7o53sDn3Rl8gYBj1PngcDtMJ7orcye3Msm+5Yd3Y
 i5icvP0is0qAVyMZ0QA3a+yvatFzrL5ioZHW6iyicE3OkmniylWhmUR
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
 drivers/scsi/3w-sas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/3w-sas.c b/drivers/scsi/3w-sas.c
index caa6713a62a44a72c7cfa5128c01fe54788cf708..6b2b02f89490aeb0494f3b586c9df995ec05a158 100644
--- a/drivers/scsi/3w-sas.c
+++ b/drivers/scsi/3w-sas.c
@@ -96,7 +96,7 @@ static int twl_reset_device_extension(TW_Device_Extension *tw_dev, int ioctl_res
 
 /* This function returns AENs through sysfs */
 static ssize_t twl_sysfs_aen_read(struct file *filp, struct kobject *kobj,
-				  struct bin_attribute *bin_attr,
+				  const struct bin_attribute *bin_attr,
 				  char *outbuf, loff_t offset, size_t count)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
@@ -116,18 +116,18 @@ static ssize_t twl_sysfs_aen_read(struct file *filp, struct kobject *kobj,
 } /* End twl_sysfs_aen_read() */
 
 /* aen_read sysfs attribute initializer */
-static struct bin_attribute twl_sysfs_aen_read_attr = {
+static const struct bin_attribute twl_sysfs_aen_read_attr = {
 	.attr = {
 		.name = "3ware_aen_read",
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read = twl_sysfs_aen_read
+	.read_new = twl_sysfs_aen_read
 };
 
 /* This function returns driver compatibility info through sysfs */
 static ssize_t twl_sysfs_compat_info(struct file *filp, struct kobject *kobj,
-				     struct bin_attribute *bin_attr,
+				     const struct bin_attribute *bin_attr,
 				     char *outbuf, loff_t offset, size_t count)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
@@ -147,13 +147,13 @@ static ssize_t twl_sysfs_compat_info(struct file *filp, struct kobject *kobj,
 } /* End twl_sysfs_compat_info() */
 
 /* compat_info sysfs attribute initializer */
-static struct bin_attribute twl_sysfs_compat_info_attr = {
+static const struct bin_attribute twl_sysfs_compat_info_attr = {
 	.attr = {
 		.name = "3ware_compat_info",
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read = twl_sysfs_compat_info
+	.read_new = twl_sysfs_compat_info
 };
 
 /* Show some statistics about the card */

-- 
2.47.1


