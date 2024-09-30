Return-Path: <linuxppc-dev+bounces-1699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC0F98AFB6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 00:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHb3g334Cz2xGH;
	Tue,  1 Oct 2024 08:15:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=199.89.1.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727720371;
	cv=none; b=cn4SZejDRGTmFAy1zhSogJRqhfhYrmki4+rYLBUHn9rGrBksSHoH4ja0RpPuwpubVCQLHdr/LBdx04EnZXIMu44zz5+r6DnIUeO3O/7bOQmiN/9dTj4Nx9QJ7RCzKi59aM8LgTQBhkGk/8gUSxvmqe6LDyQMFeGfx3fZ3nlbMnLGbc2mVregU5yaT+LCi1c7jCF/a1Gzt6cCXZqROQivBTv2oWHv2hMXC1iQTCOlkiX49V5lFCOeVCZiBoW5NTpuKwjCbSsivVFXt9GYGWISmvBB7b1O537CO6lLSMJ3hhVOOmt/76mEKwnKHZidggT+1CmY7VJ5/Hw/FrhObX04nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727720371; c=relaxed/relaxed;
	bh=zaI39plbOj1b0fMPH7CHurh+dET18cQh8zlGr0HXTtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCRhiMih2xaDRlyGuA/Xjx9Ell9lq5KM8X1Cw+/yaaOpI6W8AJc/0RarS8+eeniI50ylCn5uI/uVvWGpPaPPkg9EEyfmd3BK/e22zg3cJ0j2pYFuzGkPoLla0nXotQ3a6qTSbt1XErGML2gl4qx2XzybnJSmDsTDIu1L9ds1bw/7t9c0ys4WuTsIbbK1K6FeJNOL1Xg2k7zeWE1SGNNJitFUQ6Nndo94A4EWMWGZ8oRzW0Vvf4mb/aS2/YdmtZVDXEVSSiAPvoTFQfY17Esnx5ISiw1qxYUWfY9xHeRQNKjLYji/cjqfWed669FHLGqzC83Yvb3QQ+R6cMcq+CDPzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=acm.org; dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ELHSdJJZ; dkim-atps=neutral; spf=pass (client-ip=199.89.1.12; helo=009.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org) smtp.mailfrom=acm.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ELHSdJJZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=acm.org (client-ip=199.89.1.12; helo=009.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 176 seconds by postgrey-1.37 at boromir; Tue, 01 Oct 2024 04:19:31 AEST
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHTql585Jz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 04:19:31 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XHTmJ63wzzlgMVs;
	Mon, 30 Sep 2024 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1727720189; x=1730312190; bh=zaI39
	plbOj1b0fMPH7CHurh+dET18cQh8zlGr0HXTtw=; b=ELHSdJJZaYp7FTWNj8JWl
	0t9zqDuLCCUrsH5umTrlv12Jm7F2aCziZxfYDTQ7bCdQjriDquPkv296VB96DWgV
	7G63LC/njwBukmkiWnhCqv5OtErCw7PbrMPCdEObffF+A2CuxtABZgphJwO/p6VV
	jM+0nSGrx7inGGU4FDGP3t5fWfbcJj1HdQ/kMlKMV4xwPQnME6TrnyM4zTOaFqLT
	yBUFs41qDzKhbhSV8E8bf0pgfcELoFUZlHiOkYQlcdjJpliHKaQHbxg+P0lBVdJX
	U5nUMMgLPuLCZ+34Dh0cveMID7hDcBzblIoCCm1G0Tk3hVSrs6lGTUGyyd3fZAqC
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id b-l6cx9my2_3; Mon, 30 Sep 2024 18:16:29 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XHTmD5V7ZzlgMVj;
	Mon, 30 Sep 2024 18:16:28 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/21] powerpc/cell: Switch to number_of_interrupts()
Date: Mon, 30 Sep 2024 11:15:43 -0700
Message-ID: <20240930181600.1684198-5-bvanassche@acm.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20240930181600.1684198-1-bvanassche@acm.org>
References: <20240930181600.1684198-1-bvanassche@acm.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use the number_of_interrupts() function instead of the global variable
'nr_irqs'. This patch prepares for changing 'nr_irqs' from an exported
global variable into a variable with file scope.

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/powerpc/platforms/cell/axon_msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platfo=
rms/cell/axon_msi.c
index 28dc86744cac..b7996bc091e6 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -112,7 +112,7 @@ static void axon_msi_cascade(struct irq_desc *desc)
 		pr_devel("axon_msi: woff %x roff %x msi %x\n",
 			  write_offset, msic->read_offset, msi);
=20
-		if (msi < nr_irqs && irq_get_chip_data(msi) =3D=3D msic) {
+		if (msi < number_of_interrupts() && irq_get_chip_data(msi) =3D=3D msic=
) {
 			generic_handle_irq(msi);
 			msic->fifo_virt[idx] =3D cpu_to_le32(0xffffffff);
 		} else {

