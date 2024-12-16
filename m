Return-Path: <linuxppc-dev+bounces-4157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E599F2F3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4x48pMz301N;
	Mon, 16 Dec 2024 22:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348561;
	cv=none; b=VGIYt+ueGiH69A/aYENGPtdsIfSNoE+VQfppZtNlk9os28FL3oM+xA0Sq5OynXeJbn3fTuT8DOgZLhSVPwGytHjc1Gz3+sO19vaMwoajnFBsk2jdYty5vq2WTdr6Nb9XZ/I96tqdpXTTqNdQrtDyBynlIT/3xpdHIHSJIm6RBvt5b3bGX3AUhiik9Sg+O/aOOzqCvVc9aIALYJVtFwEq/tZsRauKlZaXAcRjENUfdcH6DH8ZFL/X1nt1Ynr8Jo7UySfRkbSUsSsnufOOfapiMvlVEdrn5AKVdjq1/dUuLT3Xt40ZhcfzF33G8qln/bIOSN9WquEdoBaKmzPbOTelJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348561; c=relaxed/relaxed;
	bh=W3lCqQnDGCT+sODz/jTLT8VoBeR1jXkk4oz9/uuWq/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMO6gGFL4WqfV6vmnXwVSnoeK8WPa6XO2NhXrA/TIAts7KIGtssqI1nfgrd9euo+fvWQqjOO6hy8Z0yPHw/mPJo1GM3LNXCf7vn644pPZw7WwfKXt+6cc0yJp9aNSsDRPls2lQfzod5rANYz0Lng0WYEE8vVXVS0DO0xzW5ToIwO3qmJKNndC/TBRNUuG1rtpOMn7SuvO98QXykpnrFm/Nkku5q2BT9ezskGwPwBtiHCOy9f/AGbuBHwFkfQvtPA8cWNbf6toEAneBZFgEZEM0dttTD4/13p1MaHahygqVPqstq/8Umve7yiqNRFYjnuURaSzHhsyWpTjVMbe6Cqdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=IfQGNQzq; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=IfQGNQzq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4w69hlz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348553;
	bh=0zAR1Zgw045+wqZMsF16+d7FFPr4+tRVMSP1LbUeDkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IfQGNQzq3sv2I6lR7Bm4wIXf4JexmJ6Orz/ItN7wWI5NG1ehxVi8OJiDmBs3XloXw
	 SpKa9d0FdcuKXuLbHQ0vgALExfPumXMeWpgHDlTMkDWRfAvHcYQabjxC0qb4cyffv7
	 Tz2Rcr8yjxSC1drhVomftVoQCIvwhT/jsZ2yCP28=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 12:29:16 +0100
Subject: [PATCH 09/11] scsi: qedi: Constify 'struct bin_attribute'
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
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-9-f0a5e54b3437@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=802;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0zAR1Zgw045+wqZMsF16+d7FFPr4+tRVMSP1LbUeDkQ=;
 b=1W6RZ9BA9Dsc+CBzANf4Tht8N5AIdCyB6NGgVKB+IsTA27eXPneFAttchQy0ojXOOZQZt6vds
 A+mCsUddQeNDsjzwyDljmAV7qogymPgp/ZcoHbiY7G+vm89CQ7DGCvg
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
 drivers/scsi/qedi/qedi_dbg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qedi/qedi_dbg.h b/drivers/scsi/qedi/qedi_dbg.h
index fdda12ef13b0fd1f69103a28b8a9e8641281e151..5a1ec45421834bfed5f7d7b87391ae8cc4905c6e 100644
--- a/drivers/scsi/qedi/qedi_dbg.h
+++ b/drivers/scsi/qedi/qedi_dbg.h
@@ -91,7 +91,7 @@ struct Scsi_Host;
 
 struct sysfs_bin_attrs {
 	char *name;
-	struct bin_attribute *attr;
+	const struct bin_attribute *attr;
 };
 
 int qedi_create_sysfs_attr(struct Scsi_Host *shost,

-- 
2.47.1


