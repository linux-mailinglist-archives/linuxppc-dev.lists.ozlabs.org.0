Return-Path: <linuxppc-dev+bounces-3682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 325209E0B72
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:01:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2CmP0Rkvz2xsM;
	Tue,  3 Dec 2024 06:00:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733166052;
	cv=none; b=jjiL3tEBSd8e/UGaOxSsEEbvUb494ycisHNZvaMWCmu74hdX4hCsvprh423C5ByAf9bnUQnN6zDQZ3JZapLn/vanbM8+T2bttZlpOuDYf+evKQ5b143gQSEpNBwFABB69czGl8Vzg5P3OtOTykRycDy1FRnu/fywuDokxwVKtjyeiZkF8na8JND8m7emz3PDy+ThYJwfH9zZxWeQ5I3e7+0WVWaGTU0cF5Yjuh1YWknK2k6ZIE8eAcduvOHVo4JxxwLr72niimRYf8hH8Hrbpa+aAM+kYQoJIpndHaxV3woUyB1p/4pCq6prN3W/xI0PaRJtsWyA8MqVUYg0VwaK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733166052; c=relaxed/relaxed;
	bh=w5fXkvkAi3PlCa8VqYd7jmwX6rPPKpQQKJ4+a4NdcT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FykNWrwHpTpXPgPm3pCxyTDyeJ+kOZ5/ilpPpTlBiUpoKS+71SiLu2NthDY69iF1rVoVFBKy7qbIFI0drKaqsutD34EWTuSzBP4MYyMPddz5RrDle6EWZuxQXc23qHzDIU3tFkvI5NHYZkLzQixeQZmUXdXX8R9NCUjQc7AGrN7K5BNdMGU1zCMAfLZY5nkoQhWe3eP7eGY4MnW/mfuEeTWY1TZoQQnP1cFgvAj2cIKxs2zCGxMDl7ju3B4IRvOBTBegG8R9YcrHjvaodVX2OosaFjpPHdAk992qK65g2nsvzPBPnfj8C/pp3c9DQVXZv1ZXKlPR/+QO6FqPU750OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=PRoJTN2/; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=PRoJTN2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2CmJ2HjWz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:00:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166037;
	bh=c+OK0c9DqudvV6de1q2cguTuEZ7rc+EiMnpII+VV+gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PRoJTN2/WD38X6ex2MklShCZg4/Zhp1aBS6bQhM8KrWUKqsIfTO3E8JpPTZQWn4yX
	 i5z49I+Y6UsDRqwh7UMg09/F+TG8YXqtHA7xPEWaCEmYJ+9zF+wZlqRnJCyDh2xJeW
	 xqMnqBJ6ZG0AY934vDKCRdaTH8lcC+h9nHW3odGI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:00:36 +0100
Subject: [PATCH 1/5] sysfs: add macro BIN_ATTR_ADMIN_WO()
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
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-1-f489116210bf@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev, 
 linux-scsi@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=1326;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=c+OK0c9DqudvV6de1q2cguTuEZ7rc+EiMnpII+VV+gk=;
 b=fYgHqAdIAZatDuw8uWF0U9ElsIjChzM1qpbbyZvPW4NW8SrhhzeOs4sK7avctzwIrWksSbzAm
 jxiHNn1GgsFDhjK/57O009WAci/xOF8vWIVviFFNIlMNHEynIxZO/h2
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The macros BIN_ATTR_RO/BIN_ATTR_WO/BIN_ATTR_WR and
BIN_ATTR_ADMIN_RO/BIN_ATTR_ADMIN_RW already exist.
To complete the collection also add BIN_ATTR_ADMIN_WO.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 0f2fcd244523f050c5286f19d4fe1846506f9214..bcae49105e54a79b7d8a610f17212cb5920c205a 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -385,12 +385,18 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR_RW(_name, _size)
 #define __BIN_ATTR_ADMIN_RO(_name, _size)				\
 	__BIN_ATTR(_name, 0400, _name##_read, NULL, _size)
 
+#define __BIN_ATTR_ADMIN_WO(_name, _size)				\
+	__BIN_ATTR(_name, 0200, NULL, _name##_write, _size)
+
 #define __BIN_ATTR_ADMIN_RW(_name, _size)					\
 	__BIN_ATTR(_name, 0600, _name##_read, _name##_write, _size)
 
 #define BIN_ATTR_ADMIN_RO(_name, _size)					\
 struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RO(_name, _size)
 
+#define BIN_ATTR_ADMIN_WO(_name, _size)					\
+struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_WO(_name, _size)
+
 #define BIN_ATTR_ADMIN_RW(_name, _size)					\
 struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RW(_name, _size)
 

-- 
2.47.1


