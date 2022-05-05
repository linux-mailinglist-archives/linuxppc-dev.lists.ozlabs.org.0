Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F30351BFDE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 14:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvDBK1120z3cFL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 22:52:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UT76O0MV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvD922jCVz3bpZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 22:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UT76O0MV; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KvD915p86z4ySp;
 Thu,  5 May 2022 22:51:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651755093;
 bh=ubB6SgfDI+P/k0hjAXWGeJL0PaKlzbLWzO8P81xOKRU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UT76O0MVOxgFBUcqfS+zazksdH1WlzfSxD9DLhoC8ByPMcfUoMgpr87iGkGfjrKCd
 +9abcqvXbSs4zO4Dywl7DiSOoS1M/gGuZMEWjZN6SILB2Xvmixiv6lMdaWij74v5q2
 XwJXjOjeKGUwzS1UIJsh+uN0XvWGzkmIc0wkbJFyA03xNBRVynRVf3QQNgpPTsWeSe
 PW9lhIRoDlCTLyNHqFVp8zCEvtqE5eXwRIKukVnqMCezRrCMRcE+igexH0wn1QobtB
 fEfnKKfPfjIO5LlxkMrvG6mHsqErhh2wo1ocoPEYvyIqAcxN2TngT1Cw14sVrbaAxS
 7AqF2QtIMDwrg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] arch/Kconfig: Drop references to powerpc PAGE_SIZE symbols
Date: Thu,  5 May 2022 22:51:23 +1000
Message-Id: <20220505125123.2088143-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505125123.2088143-1-mpe@ellerman.id.au>
References: <20220505125123.2088143-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the previous commit powerpc added PAGE_SIZE related config symbols
using the generic names.

So there's no need to refer to them in the definition of
PAGE_SIZE_LESS_THAN_64KB etc, the negative dependency on the generic
symbol is sufficient (in this case !PAGE_SIZE_64KB).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 31c4fdc4a4ba..d235c9089d17 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1007,12 +1007,10 @@ config PAGE_SIZE_LESS_THAN_64KB
 	depends on !IA64_PAGE_SIZE_64KB
 	depends on !PAGE_SIZE_64KB
 	depends on !PARISC_PAGE_SIZE_64KB
-	depends on !PPC_64K_PAGES
 	depends on PAGE_SIZE_LESS_THAN_256KB
 
 config PAGE_SIZE_LESS_THAN_256KB
 	def_bool y
-	depends on !PPC_256K_PAGES
 	depends on !PAGE_SIZE_256KB
 
 # This allows to use a set of generic functions to determine mmap base
-- 
2.35.1

