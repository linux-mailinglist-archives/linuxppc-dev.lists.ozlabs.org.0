Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C232AAA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 10:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HShc3SdnzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 18:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HKXKteSe"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HSfq5h7QzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 18:20:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HSfc02pHz9typt;
 Mon,  3 Jun 2019 10:20:24 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HKXKteSe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zr09SGG8LgmD; Mon,  3 Jun 2019 10:20:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HSfb66BNz9typs;
 Mon,  3 Jun 2019 10:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559550023; bh=+Dy4E19F4WwnCTLPgVfWD0Hzr4dGN4PVcDn0mVnwdX4=;
 h=From:Subject:To:Cc:Date:From;
 b=HKXKteSeJVqAwnfV652Zlbx/9HBL6LLz0ee+FohA66lTxGEmoJRWHxZ/jlM8/vxiK
 PJWHxCothJ27GwxxvTKjt9y8M/6WKV2tQBo7RjFfa2Dg3quIH/XYJnefgUrZ58gR0s
 gflCbR5IEkusGiIW12lxirectA+CQXWuWyNcecxA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FB5E8B7B8;
 Mon,  3 Jun 2019 10:20:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0biTqtzBvmD1; Mon,  3 Jun 2019 10:20:28 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 596B48B7B1;
 Mon,  3 Jun 2019 10:20:28 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2570168B20; Mon,  3 Jun 2019 08:20:28 +0000 (UTC)
Message-Id: <56efc3b317622d5f607d1f7a35894b194c385492.1559549824.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3] powerpc: fix kexec failure on book3s/32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Date: Mon,  3 Jun 2019 08:20:28 +0000 (UTC)
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

In the old days, _PAGE_EXEC didn't exist on 6xx aka book3s/32.
Therefore, allthough __mapin_ram_chunk() was already mapping kernel
text with PAGE_KERNEL_TEXT and the rest with PAGE_KERNEL, the entire
memory was executable. Part of the memory (first 512kbytes) was
mapped with BATs instead of page table, but it was also entirely
mapped as executable.

In commit 385e89d5b20f ("powerpc/mm: add exec protection on
powerpc 603"), we started adding exec protection to some 6xx, namely
the 603, for pages mapped via pagetables.

Then, in commit 63b2bc619565 ("powerpc/mm/32s: Use BATs for
STRICT_KERNEL_RWX"), the exec protection was extended to BAT mapped
memory, so that really only the kernel text could be executed.

The problem here is that kexec is based on copying some code into
upper part of memory then executing it from there in order to install
a fresh new kernel at its definitive location.

However, the code is position independant and first part of it is
just there to deactivate the MMU and jump to the second part. So it
is possible to run this first part inplace instead of running the
copy. Once the MMU is off, there is no protection anymore and the
second part of the code will just run as before.

Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 Aaro, can you test this patch ? Thanks.

 arch/powerpc/include/asm/kexec.h       | 3 +++
 arch/powerpc/kernel/machine_kexec_32.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 4a585cba1787..c68476818753 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -94,6 +94,9 @@ static inline bool kdump_in_progress(void)
 	return crashing_cpu >= 0;
 }
 
+void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_code_buffer,
+			 unsigned long start_address) __noreturn;
+
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_elf64_ops;
 
diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/machine_kexec_32.c
index affe5dcce7f4..2b160d68db49 100644
--- a/arch/powerpc/kernel/machine_kexec_32.c
+++ b/arch/powerpc/kernel/machine_kexec_32.c
@@ -30,7 +30,6 @@ typedef void (*relocate_new_kernel_t)(
  */
 void default_machine_kexec(struct kimage *image)
 {
-	extern const unsigned char relocate_new_kernel[];
 	extern const unsigned int relocate_new_kernel_size;
 	unsigned long page_list;
 	unsigned long reboot_code_buffer, reboot_code_buffer_phys;
@@ -58,6 +57,9 @@ void default_machine_kexec(struct kimage *image)
 				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
 	printk(KERN_INFO "Bye!\n");
 
+	if (!IS_ENABLED(CONFIG_FSL_BOOKE) && !IS_ENABLED(CONFIG_44x))
+		relocate_new_kernel(page_list, reboot_code_buffer_phys, image->start);
+
 	/* now call it */
 	rnk = (relocate_new_kernel_t) reboot_code_buffer;
 	(*rnk)(page_list, reboot_code_buffer_phys, image->start);
-- 
2.13.3

