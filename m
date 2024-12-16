Return-Path: <linuxppc-dev+bounces-4163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B52079F2F42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:30:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd5026Myz305G;
	Mon, 16 Dec 2024 22:29:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348564;
	cv=none; b=YsXBccHHJWQxi4fsMoBdUfQetGKO5je2X3lK1hzo/TwMKs+K2Q1PVlijP0iOA/XWtDoRI8k51WG+2+8mumY+Fz8FtNQjdR/I52+h8xbjXC1KEzKLer+BQWKdcx+tiW9EgB6erUSzU4c0axd2KpG4ymmYhIpROUT1HUmiW3H4O+sVZtzpNCgw6mHVtHOeCXA50bAOe1Xrhc4mjP7+6sf3a6kNLG/RvKasD1RUoCHHf8U/4MFxQWFS5gzlcS3UFI9JzqZCOJHkqqO7BGTThWIQm+Zar5ORTPf+wvIgZKgQ6YPC5ak+R/NKpqM2LGQmSfxONxYpYI+LvxMZfnrNnkO4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348564; c=relaxed/relaxed;
	bh=ei2ylT2acHUR6GZkra3b0Tchvf1oqStYh1vPrMEf/Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNE9czQbhnmS4bdSo40fjj+K4tnbP3EBbjJuRoO2OBy79XQqi4RFfVxe+xBituLRDXs6w5RvRW+o6Hy5h3K4LWHAQa+Lzri3og7iHKegGwDosf1sMRzKKiIl3Wt2CM+dhzbf2ogXOR2Bu1mH/lgazOfr7tzRBfbNPi/zAhkKa20c367d9IOl1XPC4VHeL+P9lRFUSIt4b2cPRTTCzvACVj7ffFlQvh6tsleKNLzylzeRMZR/Z3k7YMy0gGfeCHYmjoMcqhdM8GoRjTL2ongMAQa9BojwL4cqG5UOQtzRd+PlsdGuryuhGN5/5m0gACkP8WtfnYR3s+Flx1ReRdMP8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=dZKEYZOu; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=dZKEYZOu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4z2q5Dz304C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348552;
	bh=qDXql5e0dlsoUkgnrUATod+FIdN2oCDJzygWUo2bAxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dZKEYZOuYIHlGMQvecOcn2uix+tggU/FkxIxa3rtLJR1ytNHcWcz1br92ylyAydSN
	 AaGg4z+b62l/Jnx9a7qEvnDagQ+5qgY9qf6W8AsuUNgYyCRQkCdx06aCL3kp1iUP93
	 j6hK6BCVF2OpA96b4jyQJflQWD6xbwe6Il2RcEQk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:12 +0100
Subject: [PATCH 05/11] scsi: ibmvfc: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-5-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=1371;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qDXql5e0dlsoUkgnrUATod+FIdN2oCDJzygWUo2bAxI=;
 b=dDgz9Ydf6v4c6BI1Dnxg8otiPshJZaMRuHcfAE+qvBaHTOKVPItUmjE76IBIT2jLd/2Q0crxB
 eOz7VAZ6/uECvTk+TKC/HJAY59i1sBjxrZyaCFMfdE1+rcuzjW44oZJ
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
 drivers/scsi/ibmvscsi/ibmvfc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index e66c3ef74267a5527b21e6e1d13efb91425b158e..dc8401587bb529860d261ac83b924fceac8335d9 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3639,7 +3639,7 @@ static DEVICE_ATTR(nr_scsi_channels, S_IRUGO | S_IWUSR,
  *	number of bytes printed to buffer
  **/
 static ssize_t ibmvfc_read_trace(struct file *filp, struct kobject *kobj,
-				 struct bin_attribute *bin_attr,
+				 const struct bin_attribute *bin_attr,
 				 char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -3662,13 +3662,13 @@ static ssize_t ibmvfc_read_trace(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
-static struct bin_attribute ibmvfc_trace_attr = {
+static const struct bin_attribute ibmvfc_trace_attr = {
 	.attr =	{
 		.name = "trace",
 		.mode = S_IRUGO,
 	},
 	.size = 0,
-	.read = ibmvfc_read_trace,
+	.read_new = ibmvfc_read_trace,
 };
 #endif
 

-- 
2.47.1


