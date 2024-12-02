Return-Path: <linuxppc-dev+bounces-3681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965D9E0B70
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:01:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2CmN38ydz2ynr;
	Tue,  3 Dec 2024 06:00:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733166052;
	cv=none; b=BCFHMRqhf/WHNBj1gOtfpHScsSdrMKC7h9r4qMwHWSG5kWnxf+OA4j6DNDFAVh9uE3C0pCwLoshOZl1VRNOkVct7yPz7kZT6ZfK13PSJeqyffCMjcJ7KKkCJEE+tYVGFD9gswcb4Mv33aspO+1rfRT5046j6gOtAPkVmhgl8DtZp55mRi9UKa0ARCRPF5q37lvJ/4KNmJy+h0QTJKadBpdHAfshs+NHe4i15CkdHK91MtrVe+gDbXlJkf8QsoDJUi9lfCjFheO0EOUMV4o6YzqPaTQRqDVwpV/1QAc3PiLpYLWTBU490bBlq6b+Uf6x1hUA7+yNpo3N3+Y1iupBgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733166052; c=relaxed/relaxed;
	bh=cpbHYXS83699wZ/GUa4he8oB9ZPNarA3qHDneSBQudw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rumg2SmmF8cXCojjQPPMSZyQs4abKsaKFXHpknwwu+T8G54aXG43TE1TKizHr+7yC7OIjmSIlbbo5H3yi8QS7pnAflsrhpIOktiv7hxPSXgE8K6OcHT2yjEslNRXjQ8s11PdOfBvrJScPBErxhfEPFLX3OP4MN3JymDIBMFmTw7odSOHgjyp+Aj5z2YiwaYBk/SHR2UAyzdRoeZToZO5m0eq4nAiypIs0ubI775cjrrR3F4DbBue4XIZvn+Fn8v16d9GcXKPqnAe9CtbaiYeTyrMVH07LVEbWHyD//jJnFUsV4BCl5zbLGYO+YsmxyU/7oEEgUS6p0fhJZyc+GUEbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UCRrJsEI; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UCRrJsEI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2CmG60zpz2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:00:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166037;
	bh=TMBtf8tHW7HSo+J0IXx7Vgtjq1QjUtkf1n/uqfOEV94=;
	h=From:Subject:Date:To:Cc:From;
	b=UCRrJsEIeshSRwM/Fmf8PF9CwtfNSvEPZYzfdwayKyZ0BljSsO1TS2Vx3olEuVi8c
	 liYIpma/oFebeGv3rzy9oPpxSQmya00+yua1JEZNRHhxeZrW1G3RwDsPIWrbI/YR6U
	 rS2PSdnZfRR0OFAwRz9dCLxv3drRVms6BrkgPHmU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] sysfs: introduce and use macro BIN_ATTR_ADMIN_WO()
Date: Mon, 02 Dec 2024 20:00:35 +0100
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIANMDTmcC/x3MTQqDMBBA4avIrB1oQrTYqxSRxEzqLJqUTPAH8
 e6G7t63eScIZSaBV3NCppWFU6xQbQPzYuOHkH016Ic2SukO5ZAgOKcoBR3HyZaS0fpvzS3h4E3
 fh/AkZzTUxy9T4P3/f4/XdQO9DLWpbwAAAA==
X-Change-ID: 20241125-sysfs-const-bin_attr-admin_wo-9d466ff7eb42
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=1317;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=TMBtf8tHW7HSo+J0IXx7Vgtjq1QjUtkf1n/uqfOEV94=;
 b=qkbGdke2NYYCgu59TeLJS7A7eWNgWRdWBo+2G8qKIHkdDBXG//myctF8vmaEN7qBuRPkewQeU
 8qsJmBMqoyKBRHgFsXoN/t3Iemm8g1hIGmKXIQBKBNYcCX9Goj8tC6r
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For the bin_attribute constification effort it is useful to have
BIN_ATTR_ADMIN_WO() macro.
Introduce it and switch over all places in the tree which can make use
of it.

While at it also constify the bin_attribute callback parameters.

This series is meant to be applied through the driver core tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      sysfs: add macro BIN_ATTR_ADMIN_WO()
      s390/sclp_config: use BIN_ATTR_ADMIN_WO() for bin_attribute definition
      powerpc/powernv/flash: Use BIN_ATTR_ADMIN_WO() for bin_attribute definition
      firmware: google: gsmi: Use BIN_ATTR_ADMIN_WO() for bin_attribute definition
      scsi: arcmsr: Use BIN_ATTR_ADMIN_WO() for bin_attribute definitions

 arch/powerpc/platforms/powernv/opal-flash.c | 14 ++----
 drivers/firmware/google/gsmi.c              | 17 +++----
 drivers/s390/char/sclp_config.c             | 16 ++-----
 drivers/scsi/arcmsr/arcmsr_attr.c           | 73 ++++++++++-------------------
 include/linux/sysfs.h                       |  6 +++
 5 files changed, 49 insertions(+), 77 deletions(-)
---
base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
change-id: 20241125-sysfs-const-bin_attr-admin_wo-9d466ff7eb42

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


