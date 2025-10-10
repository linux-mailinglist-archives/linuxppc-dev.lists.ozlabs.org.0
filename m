Return-Path: <linuxppc-dev+bounces-12771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D1BCCD31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 14:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjlkc53Qdz2yrT;
	Fri, 10 Oct 2025 23:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760097800;
	cv=none; b=UK0/9KhCVDnlH9MPAegzPKm4tGixBo0xghsErbDE4ygS8jxc2Y35fIjZZlhYYwTYdfcHzsTSI07C+uiB4s9FKA6HPgWBpc95EdxK2DNYs1Lz8CDK4iErRf2QpM5sNqLp24+LoJIrkA07hw8jTtrTSKnYsh886lonKZkIUPWVZt3ZGRcWVKhPCbVRpawzbE9BDBAn3PcRUkPMQzgXrsjPsZMBxS2fQ2t3yWUW0DolnUKot12opTBw/gvm1FoXPkRUuSnRilJ3A7qwQ0pcWywWdXW29noAi5XsIp4vvdj5sKFMTbQvgX8TkYXnrcumsmE4rjYnwiUNG7eJTWfHjHNRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760097800; c=relaxed/relaxed;
	bh=1WQ4/s0vJPykpnnYd7mdV+rKmdacgri2InTmJfigiAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EwlL4s4jsRrwlhliv4g3aJeKwzoGi2rMkQveHvgGZx91VxqYVkWK4lM3NmKhhEYnJ3+hM7w7TkYcnH5Tnh/59nP4/3yKvZgFv12XiByShwyw55v/NueaczXgk126t5mJ6dX0m/2Au1st0Nm7pLz+blwNnhpaDfnGCsQRRV/6rD4YL0gL/O2l+YBcgP4MtvnQVTZfYJCTHxHDuBfMEq259K9F9RXCV39M13GioM7lEftNBXMLe04z1jzFiwuKeLR7WcAf3kEEaUn3WMv/fkESH2QFt2/eqqeybEW1psO3Pt11F/B62hP1261DdAIunDgj7lCgTTDNhLvoBG5Jolz0gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FoDPBAnp; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oNIdUWY2; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FoDPBAnp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oNIdUWY2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjlkZ6VR0z2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 23:03:18 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760097793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1WQ4/s0vJPykpnnYd7mdV+rKmdacgri2InTmJfigiAI=;
	b=FoDPBAnp+dQMTD4mcmpKFr4YwyeaJlOmD6ryPOjT5zu/nZtjOEA9iicgSemlVrbU2bsD7p
	2mWYm/84lLykVQCKHq4++S8uhykCfnpNzb7Owwwxu8X/le7Wk+HhKx6raMC2QqkQAP+U7X
	Q+5R3q/H42ncxgUD3J5NjRFvdoATd6yt9YjFzx8gZfgN6b88aA0sEtrpKW+MKajzemMurq
	iHD3v2vZyibnP0Q8xShkkj45keGAILnKy1Fh5XCVAqf4pETVDf7nAXSAnxZ8VQXlgy1S3p
	WC6SzEU4oSdc/e1KehZl6gF6+X2IZqTnInwZ4uAuRVepjbYb2/gKqDmihTHy0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760097793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1WQ4/s0vJPykpnnYd7mdV+rKmdacgri2InTmJfigiAI=;
	b=oNIdUWY2nXLLoRleentRIre5rOxeakSX2Rb//70QW0sJKIGAhz+anLVF7pSlBVsfYGQWzC
	j8CE2tzYaUFAgzDg==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/msi: Fix NULL pointer dereference at irq domain teardown
Date: Fri, 10 Oct 2025 12:03:07 +0000
Message-ID: <20251010120307.3281720-1-namcao@linutronix.de>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

pseries_msi_ops_teardown() reads pci_dev* from msi_alloc_info_t. However,
pseries_msi_ops_prepare() does not populate this structure, thus it is all
zeros. Consequently, pseries_msi_ops_teardown() triggers a NULL pointer
dereference crash.

struct pci_dev is available in struct irq_domain. Read it there instead.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/linuxppc-dev/878d7651-433a-46fe-a28b-1b7e89=
3fcbe0@linux.ibm.com/
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/powerpc/platforms/pseries/msi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index 825f9432e03d..a82aaa786e9e 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -443,8 +443,7 @@ static int pseries_msi_ops_prepare(struct irq_domain *d=
omain, struct device *dev
  */
 static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_=
info_t *arg)
 {
-	struct msi_desc *desc =3D arg->desc;
-	struct pci_dev *pdev =3D msi_desc_to_pci_dev(desc);
+	struct pci_dev *pdev =3D to_pci_dev(domain->dev);
=20
 	rtas_disable_msi(pdev);
 }
--=20
2.51.0


