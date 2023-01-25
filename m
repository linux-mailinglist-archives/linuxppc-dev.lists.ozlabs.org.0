Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802567BA63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 20:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2D1S0Bqwz3chK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 06:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VayjFvjT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VayjFvjT;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Czj0t7gz3ch0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 06:08:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E7B5615BF;
	Wed, 25 Jan 2023 19:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85BCC433A7;
	Wed, 25 Jan 2023 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674673710;
	bh=e5RD+ChFYW/EecHl5ap2SmlVrekFipkC772OqZMuVGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VayjFvjTXPvWyL/99q0Q7Vo5BJQIU/QWsdqT9U6kg3Xi9+KratRvjQIvNgQZNC3ej
	 6x/V1dpkk1wIjhfkSpo4tsDE6LKiO+Z94AT9MrMhVBrrQvC4crABv3iZAhx0hPAdnc
	 G/Kplj04nGqfPkVb2pBjO0GqI2SeHuT5hhqCing4uoX5Nyi2JGI89yALKqEotm5cXW
	 IVAcb4mE1j1I4sF505IYGjEOjQNXyPndc4ldxqG2bG//O/g+ApLa4k300Bdp2RDaS6
	 +A5XNi3/uTO24fyw3WkB8WmX8CDXexEGrS2YKYpiYOPBhNL3AuJAnu+PeWPrPw3UmH
	 WPqMRKYef77Yg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] m68k: use asm-generic/memory_model.h for both MMU and !MMU
Date: Wed, 25 Jan 2023 21:07:55 +0200
Message-Id: <20230125190757.22555-2-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230125190757.22555-1-rppt@kernel.org>
References: <20230125190757.22555-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux--csky@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thom
 as Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

The MMU variant uses generic definitions of page_to_pfn() and
pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
good reason.

Include asm-generic/memory_model.h in the common include/asm/page.h and
drop redundant definitions.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/m68k/include/asm/page.h    | 6 +-----
 arch/m68k/include/asm/page_mm.h | 1 -
 arch/m68k/include/asm/page_no.h | 2 --
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index 2f1c54e4725d..a5993ad83ed8 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -62,11 +62,7 @@ extern unsigned long _ramend;
 #include <asm/page_no.h>
 #endif
 
-#ifndef CONFIG_MMU
-#define __phys_to_pfn(paddr)	((unsigned long)((paddr) >> PAGE_SHIFT))
-#define __pfn_to_phys(pfn)	PFN_PHYS(pfn)
-#endif
-
 #include <asm-generic/getorder.h>
+#include <asm-generic/memory_model.h>
 
 #endif /* _M68K_PAGE_H */
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index a5b459bcb7d8..3903db2e8da7 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -134,7 +134,6 @@ extern int m68k_virt_to_node_shift;
 })
 
 #define ARCH_PFN_OFFSET (m68k_memory[0].addr >> PAGE_SHIFT)
-#include <asm-generic/memory_model.h>
 
 #define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
 #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index c9d0d84158a4..0a8ccef777fd 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -26,8 +26,6 @@ extern unsigned long memory_end;
 #define virt_to_page(addr)	(mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
 #define page_to_virt(page)	__va(((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET))
 
-#define pfn_to_page(pfn)	virt_to_page(pfn_to_virt(pfn))
-#define page_to_pfn(page)	virt_to_pfn(page_to_virt(page))
 #define pfn_valid(pfn)	        ((pfn) < max_mapnr)
 
 #define	virt_addr_valid(kaddr)	(((unsigned long)(kaddr) >= PAGE_OFFSET) && \
-- 
2.35.1

