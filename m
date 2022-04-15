Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD3502F22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:10:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5Wr5ZKWz3bwL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:10:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnUbP0tT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HnUbP0tT; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TN40Zrz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A625A61BA7;
 Fri, 15 Apr 2022 19:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46964C385A4;
 Fri, 15 Apr 2022 19:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049718;
 bh=3GSH601X4LqRWpFnvScC4daS1AorO+4ieLuBBuBrntQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HnUbP0tTgnYaEiIklhCUba59DaMfbxRXhh4KmBtilODwJGDfbzRmqaluIQB+/zG2/
 lrfFa28WnL/+NTR0wjJHq6Rpn8wGuyCiErbKLcfSGSIfabnzsS/fpWRFPzQtCq4dEy
 ir+0/mNgWrdpB8LKWgHyvkwno1tmv3ofGhLvp+yrSNPMF9nhUQ75NGgdEOk6v1vq16
 FAfUp68uiRWZyK8NbPjr6Pr+tOOKua6y/4VdSCbXl8TdQ/4hReVq87LbV9VJeCHlcX
 hE40D4uiGabJtuqqO8JR239Vyj64zw+KbhlK8X/ZCagNzttkC8YaLtIE3o5fzQiGwa
 uhxCeopoqALDQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 4/7] sh: remove unused SLOW_DOWN_IO
Date: Fri, 15 Apr 2022 14:08:14 -0500
Message-Id: <20220415190817.842864-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

io.h defines SLOW_DOWN_IO only when CONF_SLOWDOWN_IO is defined, but
CONF_SLOWDOWN_IO is never defined and is in fact explicitly undefined.
Remove SLOW_DOWN_IO and related code.

N.B. 37b7a97884ba ("sh: machvec IO death.") went to some trouble to add
CONF_SLOWDOWN_IO and SLOW_DOWN_IO, for no obvious reason.  Maybe there was
some out-of-tree case that used this.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/sh/include/asm/io.h | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index cf9a3ec32406..3fe0e56eff4e 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -121,11 +121,6 @@ __BUILD_MEMORY_STRING(__raw_, q, u64)
 
 #ifdef CONFIG_HAS_IOPORT_MAP
 
-/*
- * Slowdown I/O port space accesses for antique hardware.
- */
-#undef CONF_SLOWDOWN_IO
-
 /*
  * On SuperH I/O ports are memory mapped, so we access them using normal
  * load/store instructions. sh_io_port_base is the virtual address to
@@ -145,13 +140,7 @@ static inline void __set_io_port_base(unsigned long pbase)
 extern void __iomem *__ioport_map(unsigned long addr, unsigned int size);
 #endif
 
-#ifdef CONF_SLOWDOWN_IO
-#define SLOW_DOWN_IO __raw_readw(sh_io_port_base)
-#else
-#define SLOW_DOWN_IO
-#endif
-
-#define __BUILD_IOPORT_SINGLE(pfx, bwlq, type, p, slow)			\
+#define __BUILD_IOPORT_SINGLE(pfx, bwlq, type, p)			\
 									\
 static inline void pfx##out##bwlq##p(type val, unsigned long port)	\
 {									\
@@ -159,7 +148,6 @@ static inline void pfx##out##bwlq##p(type val, unsigned long port)	\
 									\
 	__addr = __ioport_map(port, sizeof(type));			\
 	*__addr = val;							\
-	slow;								\
 }									\
 									\
 static inline type pfx##in##bwlq##p(unsigned long port)			\
@@ -169,14 +157,13 @@ static inline type pfx##in##bwlq##p(unsigned long port)			\
 									\
 	__addr = __ioport_map(port, sizeof(type));			\
 	__val = *__addr;						\
-	slow;								\
 									\
 	return __val;							\
 }
 
 #define __BUILD_IOPORT_PFX(bus, bwlq, type)				\
 	__BUILD_IOPORT_SINGLE(bus, bwlq, type, ,)			\
-	__BUILD_IOPORT_SINGLE(bus, bwlq, type, _p, SLOW_DOWN_IO)
+	__BUILD_IOPORT_SINGLE(bus, bwlq, type, _p,)
 
 #define BUILDIO_IOPORT(bwlq, type)					\
 	__BUILD_IOPORT_PFX(, bwlq, type)
-- 
2.25.1

