Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D526DBB29
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 15:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptx0B5VGSz3flk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 23:28:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qir4ccYw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qir4ccYw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptwtj2Skmz3f8R
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 23:24:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AEEB614BC;
	Sat,  8 Apr 2023 13:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A48C433A1;
	Sat,  8 Apr 2023 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680960248;
	bh=zh3lTgBmnypZA5+Nw411DMxgOKCSc/q0VjQ8IrqzJ2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qir4ccYwjx5pT4lgUGrpeYXWCsLQ0NUmCK3/ppsTQEuSStZwPzdxJSbfxS5nIf22G
	 eQy30zudpEHB+aP9VRsq9pySKx5EjCj7Codh/Tx5aBhJ9bLeeL4Up4zAVuWPKZ6HAP
	 pq+3xQefgFkOnbBQ0mMh+giXrmZtpMaADqt8241TrZGwEe5nZpOthnQ8eLXUc01p5U
	 iqiDfiakaTmP3dRPnMd0yNlC0/bxDaHfqGkEFWLkbRHy9Ak0tKR6zD/a7f410BeSI+
	 d+CYpKx2vSOe6NgLMWg5r9yc6trXmnUSfjxIrPrtpHuvgCr67sNs2t2Wl5iy6qt2lT
	 AYLumcsVYdR7A==
Received: by pali.im (Postfix)
	id 4240F20C8; Sat,  8 Apr 2023 15:24:06 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 6/8] powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
Date: Sat,  8 Apr 2023 15:21:49 +0200
Message-Id: <20230408132151.8902-7-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230408132151.8902-1-pali@kernel.org>
References: <20230408132151.8902-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ULI1575 PCIe south bridge exists only on some Freescale boards. Allow to
disable CONFIG_FSL_ULI1575 symbol when it is not explicitly selected and
only implied.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index d41dad227de8..d4b43dade51e 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -261,7 +261,7 @@ config CPM2
 	  on it (826x, 827x, 8560).
 
 config FSL_ULI1575
-	bool
+	bool "ULI1575 PCIe south bridge support"
 	select GENERIC_ISA_DMA
 	help
 	  Supports for the ULI1575 PCIe south bridge that exists on some
-- 
2.20.1

