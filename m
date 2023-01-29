Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F135467FF32
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 13:44:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4WGv68B6z3ccn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 23:44:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOlDKwso;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOlDKwso;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4WFB4hjhz3cMt
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jan 2023 23:43:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6AB160D3D;
	Sun, 29 Jan 2023 12:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C73C433A7;
	Sun, 29 Jan 2023 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674996188;
	bh=cgWDMwNotrvgtwLOXkxr022OhYpC4uBm5qKZZMTCdc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOlDKwso6wRfZVylh618GS0Ouplr5vx0EbZPPHD3xUb+8QoPpiFEHadR57onqorCd
	 YVV0X4T7n8gLAlDCcDoHkjHy+WzsJoiwhi5dfYlZ0/SJbhBTB4CLpq8O6xDe8ABdAj
	 ibLF/6hCOLr13VOj/azi035hOFFfeFmuDXjRvCo9nQzUAZ1DneDknyLVqg+z3u91Hb
	 JSM0yS+mjSe2REo/FRs3DbdIX7npqpWYBVELIqlPxuJWRXDIEj2eP/ud0TKhe2R7e/
	 shdVeHbLA/9GwBZjKAbCX1zbNI+chUKkqGr1E/I9bnpduDb0l68n12sXR48UTQjqrn
	 2HPElfopuZj9Q==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/4] arm: include asm-generic/memory_model.h from page.h rather than memory.h
Date: Sun, 29 Jan 2023 14:42:32 +0200
Message-Id: <20230129124235.209895-2-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230129124235.209895-1-rppt@kernel.org>
References: <20230129124235.209895-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Mic
 hal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Makes it consistent with other architectures and allows for generic
definition of pfn_valid() in asm-generic/memory_model.h with clear override
in arch/arm/include/asm/page.h

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm/include/asm/memory.h | 2 --
 arch/arm/include/asm/page.h   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
index d8eef4bd8c71..62e9df024445 100644
--- a/arch/arm/include/asm/memory.h
+++ b/arch/arm/include/asm/memory.h
@@ -386,6 +386,4 @@ static inline unsigned long __virt_to_idmap(unsigned long x)
 
 #endif
 
-#include <asm-generic/memory_model.h>
-
 #endif
diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
index 5fcc8a600e36..74bb5947b387 100644
--- a/arch/arm/include/asm/page.h
+++ b/arch/arm/include/asm/page.h
@@ -158,6 +158,7 @@ typedef struct page *pgtable_t;
 
 #ifdef CONFIG_HAVE_ARCH_PFN_VALID
 extern int pfn_valid(unsigned long);
+#define pfn_valid pfn_valid
 #endif
 
 #include <asm/memory.h>
@@ -167,5 +168,6 @@ extern int pfn_valid(unsigned long);
 #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 #include <asm-generic/getorder.h>
+#include <asm-generic/memory_model.h>
 
 #endif
-- 
2.35.1

