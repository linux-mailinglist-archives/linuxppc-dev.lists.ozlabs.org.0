Return-Path: <linuxppc-dev+bounces-7320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA56A6EA4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 08:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsl6Wfvz2yKq;
	Tue, 25 Mar 2025 18:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742887211;
	cv=none; b=AGMO+e/y6+xekpQ1DSy7p/3TRUIw84TOGP75UMHPbetqs6wCnjiTlfBUJGxM2Imfxksg5EktaXqeoKJfP6gyN2ND7K8LrxOGEl2J7p8GIysQVB7hffZwGKvUMucyQSxLYbIu62p9TfpbI77aeiwyCcpnmQYz2HV+2iTyohdXLXZVTpkx4ND1iKGa2ELUyC8gdg71NjdADFCjdbfBYseo+gs5NO73NDsFdMIaF5x+ldYxUbjDZ4tfc+1KHLrR3OI5WGwBbciP+wuQv7Rw/QTPuLIwscDN6Om66tnsTtMuRU62i67iTGbwYpO91+0xsTZ8cpEqLKli67KX6N0BxTxYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742887211; c=relaxed/relaxed;
	bh=nVCvfQ5DtQYHcmAr0D2aMfpBZawKOMRMx48ObQpx+8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPA6eCIhkGSQnBXmpQk06Vt8KFKKqR1Si4j9HxvLmi1Nlr0Hb2VXFh/6AF/oSBZRZUDCIRp3O8w4grF+TC5rgg3r7oUDQLr1vobuu9BL8mXpRadLPZMsQjjUeZfqsaQ5cb7j6pMSFX4WZe0BTbTat61Whe93vpOTTZPVOrceTOaYrpB2qcaSlJZHaDzQrItKcMr1hj+HfcdF2vW9cZ6BckikbQWoXgBRCfHE1/tgOmXCON+172mBgST1urAG72O6uP4nGHZN0WhxXl2lFo5pXZii0eo9f2TIgkK1jQ73OCV5ijTSXyf/xLG0z1jYZDBjAOOIohGwBbIxv8z/wGosrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsl0VjCz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 18:20:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZMLYK5Gt4z9sSh;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJ4bAikuKLHX; Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZMLYK4VFHz9sSg;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 851568B765;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1R3S4luMUOar; Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 565FA8B763;
	Tue, 25 Mar 2025 08:05:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 52P75npS009415
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:05:49 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 52P75mFm009410;
	Tue, 25 Mar 2025 08:05:48 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: ioana.ciornei@nxp.com, stuyoder@gmail.com, linux@treblig.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Date: Tue, 25 Mar 2025 08:03:29 +0100
Message-ID: <174288553818.2234438.11007216946587143383.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115152055.279732-1-linux@treblig.org>
References: <20241115152055.279732-1-linux@treblig.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742886214; l=584; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VhmgXn8UTNWepu/WKdG9W0WStpBu+2fR6BBNfwNb5Vo=; b=OOvXAJey8QbW05uaPC1iND6tTU4jLioJLk4ni3WxNp8YZL9IeOycvAmyn8xVebICfDxO/xZ2T ZW88LyzkL67DtjvUgJNVQ4IKPHgyaY28eIKUhtLCD0xCKdaYppLQQbT
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 15 Nov 2024 15:20:55 +0000, linux@treblig.org wrote:
> fsl_mc_allocator_driver_exit() was added explicitly by
> commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was added in 2015 by
> commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> but was never used.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: Remove deadcode
      commit: c25951eb7518844fcb7fc9ec58e888731e8c46d0

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

