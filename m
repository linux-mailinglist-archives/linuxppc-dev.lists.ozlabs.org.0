Return-Path: <linuxppc-dev+bounces-7206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE23A68819
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:33:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHk6041Nhz2ym2;
	Wed, 19 Mar 2025 20:33:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742376792;
	cv=none; b=ZA6h2QSPBmVuUTrFTBdy45ny+IqwNqa7796NT6m2cKvCxocGlBT1LHQ1Qpi8XDcsm57KMGWuv9Mb4zFW6iLBbNCXB3we5iFoDb3CQnFeRgft74S8eW2XFGOFai+3m3AlfOcH/iz+OZ23lsgZQFurp6UWWVUPneITIyIuUW4sCXblYkHaacQaarWn7R8p+2xSmGnvCX9lsat3qQohUt+KQuhaW65h+DY6nVK9OG4xJb3CWWR1a8Or9wueOlDL9vNwHHiTadeyhEAi5IvWQwkghk/Kw+hY+LrMosGPQBSgQ7cWUV9+yfgNy0UdeM5EcTj5ECW1ycPzQpBTLDILWUpxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742376792; c=relaxed/relaxed;
	bh=gYN742BU4QoGAEOlciNNllSX/o+WfGmjoxd1QHyYyXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/PDCql45ykhNl+MUuLWdBIJaH9pvro8gvabaGW7fRI0w/BCA/RRQU+AKcsWnTJrw1KNHj6rPaLHssn+uHvBtgabT3aN6518MntdLP7VM9C6eMo7aVu8+PVDSP+9bfL0u5iFBwJ+GtgVXvr3e0zcYeEo5QHv/wNKJ7QZ5IIEiUGrv9DLa859O/pkFf32TREaLA/JKJznmHV7rmHLU0/KHpdcYxXtCx8LHDfoUqDj+LuG1Z2mW2Lm9+wQRuwIQl0wvNiYongHzA706awsSbIajT77hfya0jshu0TgpdudjqL8qDL3cVu6s+qb3EQ4uBJ5Yq2dnQly9mtD8fJHVHpWaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FJyKCYDs; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FJyKCYDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHk5z6zQMz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:33:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BB895C5A7C;
	Wed, 19 Mar 2025 09:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324D0C4CEF0;
	Wed, 19 Mar 2025 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376790;
	bh=lidN/QLL8lJclrXx9KsiwC+GwLwp1Sp0oSxXq93ZbfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJyKCYDsJp7yl/+479P7DpVX76p15OAjRaI0jRC0YbCy/GtuHNPKx/jxOA5lNJOd/
	 I6dtTMeyPOxy4WjUrbFNtbDvf88RVHgUtb4XwevspfvXNEqwByb6eF5xZWh25Y5dVj
	 LMtWq020UsOXFnZ3xlN3NWY2nf5EmuRwz7TwYY6KS86lJCGyB3zjLwt0EcqzhJS/cB
	 0sS+NpfcksXilvhcHWjpA4AouTdeawd5KcDM7eKzkyQ6il5tghRgZK6R0hlXWDZW24
	 KTee1eqqvzSA6OR2KHIPLALwZ6avJj8TOwOnAZ30PbvP/BIf7apK0f2tPyMLvUXINB
	 7+LK4W7r1G2XA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 48/57] irqdomain: soc: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:41 +0100
Message-ID: <20250319092951.37667-49-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/soc/fsl/qe/qe_ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index e5831c298ad6..e4b6ff2cc76b 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -344,7 +344,7 @@ static unsigned int qe_ic_get_low_irq(struct qe_ic *qe_ic)
 	if (irq == 0)
 		return 0;
 
-	return irq_linear_revmap(qe_ic->irqhost, irq);
+	return irq_find_mapping(qe_ic->irqhost, irq);
 }
 
 /* Return an interrupt vector or 0 if no interrupt is pending. */
@@ -360,7 +360,7 @@ static unsigned int qe_ic_get_high_irq(struct qe_ic *qe_ic)
 	if (irq == 0)
 		return 0;
 
-	return irq_linear_revmap(qe_ic->irqhost, irq);
+	return irq_find_mapping(qe_ic->irqhost, irq);
 }
 
 static void qe_ic_cascade_low(struct irq_desc *desc)
-- 
2.49.0


