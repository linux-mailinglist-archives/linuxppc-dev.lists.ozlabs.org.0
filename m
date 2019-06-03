Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B233072
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 15:03:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HZwd0CPMzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:02:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="APkqGIzu"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HZtQ34pNzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 23:00:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HZt74TlNz9v0wV;
 Mon,  3 Jun 2019 15:00:47 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=APkqGIzu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id moZU-hkmW74f; Mon,  3 Jun 2019 15:00:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HZt73Bshz9v0wS;
 Mon,  3 Jun 2019 15:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559566847; bh=sGfXk+kidH6pMSSQK1NVdRQ3mMjl4lldiD7dAX8TpPo=;
 h=From:Subject:To:Cc:Date:From;
 b=APkqGIzuUzYD8oDm7EkOFnvEzJcNUeElo+G9IMjLsk6N/T8vMiEcMO52l3/qvxWxp
 JOfcMNC6RDOFRiyGY4dXJnkSy8RpGMh1nlei6+9H7MlB/nQz6iHgx/OfsEJewxT6Zf
 eCumgGla2x7RQR/TVGUjvg/f3ZPpK7wtXxNe1mxo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CD418B906;
 Mon,  3 Jun 2019 15:00:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zuVuUvQGercw; Mon,  3 Jun 2019 15:00:52 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 302FD8B905;
 Mon,  3 Jun 2019 15:00:52 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5BD30661E4; Mon,  3 Jun 2019 13:00:51 +0000 (UTC)
Message-Id: <90d30adb0943a11ab127808c03229ba657478df4.1559566521.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: fix booting with CONFIG_PPC_EARLY_DEBUG_BOOTX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mathieu Malaterre <malat@debian.org>
Date: Mon,  3 Jun 2019 13:00:51 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When booting through OF, setup_disp_bat() does nothing because
disp_BAT are not set. By change, it used to work because BOOTX
buffer is mapped 1:1 at address 0x81000000 by the bootloader, and
btext_setup_display() sets virt addr same as phys addr.

But since commit 215b823707ce ("powerpc/32s: set up an early static
hash table for KASAN."), a temporary page table overrides the
bootloader mapping.

This 0x81000000 is also problematic with the newly implemented
Kernel Userspace Access Protection (KUAP) because it is within user
address space.

This patch fixes those issues by properly setting disp_BAT through
a call to btext_prepare_BAT(), allowing setup_disp_bat() to
properly setup BAT3 for early bootx screen buffer access.

Reported-by: Mathieu Malaterre <malat@debian.org>
Fixes: 215b823707ce ("powerpc/32s: set up an early static hash table for KASAN.")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/btext.h       | 4 ++++
 arch/powerpc/kernel/prom_init.c        | 1 +
 arch/powerpc/kernel/prom_init_check.sh | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/btext.h b/arch/powerpc/include/asm/btext.h
index 3ffad030393c..461b0f193864 100644
--- a/arch/powerpc/include/asm/btext.h
+++ b/arch/powerpc/include/asm/btext.h
@@ -13,7 +13,11 @@ extern void btext_update_display(unsigned long phys, int width, int height,
 				 int depth, int pitch);
 extern void btext_setup_display(int width, int height, int depth, int pitch,
 				unsigned long address);
+#ifdef CONFIG_PPC32
 extern void btext_prepare_BAT(void);
+#else
+static inline void btext_prepare_BAT(void) { }
+#endif
 extern void btext_map(void);
 extern void btext_unmap(void);
 
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 3555cad7bdde..ed446b7ea164 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2336,6 +2336,7 @@ static void __init prom_check_displays(void)
 			prom_printf("W=%d H=%d LB=%d addr=0x%x\n",
 				    width, height, pitch, addr);
 			btext_setup_display(width, height, 8, pitch, addr);
+			btext_prepare_BAT();
 		}
 #endif /* CONFIG_PPC_EARLY_DEBUG_BOOTX */
 	}
diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index 518d416971c1..160bef0d553d 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -24,7 +24,7 @@ fi
 WHITELIST="add_reloc_offset __bss_start __bss_stop copy_and_flush
 _end enter_prom $MEM_FUNCS reloc_offset __secondary_hold
 __secondary_hold_acknowledge __secondary_hold_spinloop __start
-logo_linux_clut224
+logo_linux_clut224 btext_prepare_BAT
 reloc_got2 kernstart_addr memstart_addr linux_banner _stext
 __prom_init_toc_start __prom_init_toc_end btext_setup_display TOC."
 
-- 
2.13.3

