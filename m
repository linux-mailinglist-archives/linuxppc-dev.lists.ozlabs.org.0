Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A374976E98E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 15:08:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=brbnRUMC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGq0X3QGjz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 23:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=brbnRUMC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGpwZ3S51z3cBZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:05:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE28261D98;
	Thu,  3 Aug 2023 13:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F4DC433CD;
	Thu,  3 Aug 2023 13:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691067899;
	bh=6/pNw5GZ9cPpeea4mXIRzm1pzOv64bfB+NNtTfBrcKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brbnRUMCKIGIjATihkRYeculTwEkBoh4Uy1lHjHdzTGfDBYbdWDXZJoYKvaczYVX8
	 /Eo1+evbjs+6+BCJXcXzIJGMGA1yi+6/IjncGoISs0DokHY+g4Dko+37edQun4yjs6
	 9aEvQR2F2HtAoy1vLzK+PAQBEhhHtEqTHz1iecF04Yg4tH0GOJviRgFTHOXJLXBQSp
	 372+M0Q8A662BVTACmNTbXRP70pgzViuvFnCqD0nsy+rYdpdTTmT4DPbYYGAoL7i6P
	 CGkDxwEHGeyU6LlrqrNzMLIrrARAO98YztJrmrLSMrHoND/nDLZfJ2o9TAxYYz4VzT
	 YGGODhWCwm28Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/2] powerpc/kasan: Disable KCOV in KASAN code
Date: Thu,  3 Aug 2023 09:04:53 -0400
Message-Id: <20230803130453.642094-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803130453.642094-1-sashal@kernel.org>
References: <20230803130453.642094-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.251
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Gray <bgray@linux.ibm.com>

[ Upstream commit ccb381e1af1ace292153c88eb1fffa5683d16a20 ]

As per the generic KASAN code in mm/kasan, disable KCOV with
KCOV_INSTRUMENT := n in the makefile.

This fixes a ppc64 boot hang when KCOV and KASAN are enabled.
kasan_early_init() gets called before a PACA is initialised, but the
KCOV hook expects a valid PACA.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20230710044143.146840-1-bgray@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/kasan/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 6577897673dda..22f1a7c3f4362 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 KASAN_SANITIZE := n
+KCOV_INSTRUMENT := n
 
 obj-$(CONFIG_PPC32)           += kasan_init_32.o
-- 
2.40.1

