Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41C22C759
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:09:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrfP0jNZzDr7P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:09:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqWH2H7DzF0ZM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=im19rQU+; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqWG0Sk3z9sSt; Fri, 24 Jul 2020 23:17:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqWF5jgMz9sTF; Fri, 24 Jul 2020 23:17:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596665;
 bh=pHFT9O/+8lqHstChao9yHTOO75nLWxLdyVzlMhXDaU0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=im19rQU+s7NoKaAQS7iBfE0MvnDdJ4HYspaZX5wz3nWX3FxkhwCguFS5EKaEFltHp
 WIBSpUocmulQ6XSpRw2o/7Z+TcyLUlZs407DuUsBl/6ouVYNLOqAMSO6097nD4wv9g
 1+jUt3kIEVjNkWfMhSsRIncVhNY0OFiZ0ht4PTJUUaSisoKKKne07aT8OkJ8GvGEXd
 KUYZCgL4ddwfURt9224eXL8CXsCetds4QqHKiSqgngv84r9Q7rAbGeIkgc15RtNvBu
 Wwqkd7pI1SIZp2Kb5XxwglbRpxeP/1ZC5kpWXItd3EoroOxQkiCV7YFhlHR2LxsHF2
 j2Y+yFsLBdhYA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 9/9] powerpc: Drop old comment about CONFIG_POWER
Date: Fri, 24 Jul 2020 23:17:28 +1000
Message-Id: <20200724131728.1643966-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a comment in time.h referring to CONFIG_POWER, which doesn't
exist. That confuses scripts/checkkconfigsymbols.py.

Presumably the comment was referring to a CONFIG_POWER vs CONFIG_PPC,
in which case for CONFIG_POWER we would #define __USE_RTC to 1. But
instead we have CONFIG_PPC_BOOK3S_601, and these days we have
IS_ENABLED().

So the comment is no longer relevant, drop it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/time.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index b287cfc2dd85..cb326720a8a1 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -39,7 +39,6 @@ struct div_result {
 };
 
 /* Accessor functions for the timebase (RTC on 601) registers. */
-/* If one day CONFIG_POWER is added just define __USE_RTC as 1 */
 #define __USE_RTC()	(IS_ENABLED(CONFIG_PPC_BOOK3S_601))
 
 #ifdef CONFIG_PPC64
-- 
2.25.1

