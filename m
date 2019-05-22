Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C33925ECB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 09:47:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4584Ty5pz6zDqPB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 17:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="G1xQ7NGH"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4584Sc06q3zDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 17:46:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4584ST00W2z9v1VX;
 Wed, 22 May 2019 09:46:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=G1xQ7NGH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8i9G6yAW0AVu; Wed, 22 May 2019 09:46:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4584SS5yT6z9v1VW;
 Wed, 22 May 2019 09:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558511160; bh=Q7p8tnanbyhfXSwbbdwXPGkJ/UivUbr2zRRYxsQb98o=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=G1xQ7NGHjbn4bC9w6HQLH0qWrK0+kYcgd87FZhFZepZzAbMvL6mi19XTJ9oFlUY0B
 MsGcL8QH8mYfbv3yBgwuEerG0misANGDeKjUaEAUh5cXl3V5Z1tG7khb4gNJ6OCMpp
 jomE28BUf3igRfadq5PpIIfTv4IgsK/YQeCKS7hE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D74C48B81B;
 Wed, 22 May 2019 09:46:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hfWoYvLqeC5p; Wed, 22 May 2019 09:46:01 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A805D8B75B;
 Wed, 22 May 2019 09:46:01 +0200 (CEST)
Subject: Re: [BISECTED] kexec regression on PowerBook G4
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
 <90f3557b-400b-60b5-9ff8-d5605adeee79@c-s.fr>
Message-ID: <a8f8a0d7-1737-4c83-4587-8d4dc87c3ecb@c-s.fr>
Date: Wed, 22 May 2019 07:44:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <90f3557b-400b-60b5-9ff8-d5605adeee79@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Again,

On 05/22/2019 06:14 AM, Christophe Leroy wrote:
> Hi Aero,
> 
> Le 22/05/2019 à 00:18, Aaro Koskinen a écrit :
>> Hi,
>>
>> I was trying to upgrade from v5.0 -> v5.1 on PowerBook G4, but when 
>> trying
>> to kexec a kernel the system gets stuck (no errors seen on the console).
> 
> Do you mean you are trying to kexec a v5.1 kernel from a v5.0 kernel, or 
> do you have a working v5.1 kernel, but kexec doesn't work with it ?
> 
>>
>> Bisected to: 93c4a162b014 ("powerpc/6xx: Store PGDIR physical address
>> in a SPRG"). This commit doesn't revert cleanly anymore but I tested
>> that the one before works OK.
> 
> Not sure that's the problem. There was a problem with that commit, but 
> it was fixed by 4622a2d43101 ("powerpc/6xx: fix setup and use of 
> SPRN_SPRG_PGDIR for hash32").
> You probably hit some commit between those two during bisect, that's 
> likely the reason why you ended here.
> 
> Can you restart your bisect from 4622a2d43101 ?
> 
> If you have CONFIG_SMP, maybe you should also consider taking 
> 397d2300b08c ("powerpc/32s: fix flush_hash_pages() on SMP"). Stable 
> 5.1.4 includes it.
> 
>>
>> With current Linus HEAD (9c7db5004280), it gets a bit further but still
>> doesn't work: now I get an error on the console after kexec "Starting
>> new kernel! ... Bye!":
>>
>>     kernel tried to execute exec-protected page (...) - exploit attempt?
> 
> Interesting.
> 
> Do you have CONFIG_STRICT_KERNEL_RWX=y in your .config ? If so, can you 
> retry without it ?

After looking at the code, I don't thing CONFIG_STRICT_KERNEL_RWX will 
make any difference. Can you try the patch below ?

 From 8c1039da0d0f26cdf995156a905fc97fe7bda36c Mon Sep 17 00:00:00 2001
From: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Wed, 22 May 2019 07:28:42 +0000
Subject: [PATCH] Fix Kexec

---
  arch/powerpc/include/asm/pgtable.h     | 2 ++
  arch/powerpc/kernel/machine_kexec_32.c | 4 ++++
  arch/powerpc/mm/pgtable_32.c           | 2 +-
  3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/pgtable.h 
b/arch/powerpc/include/asm/pgtable.h
index 3f53be60fb01..642eea937229 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -140,6 +140,8 @@ static inline void pte_frag_set(mm_context_t *ctx, 
void *p)
  }
  #endif

+int change_page_attr(struct page *page, int numpages, pgprot_t prot);
+
  #endif /* __ASSEMBLY__ */

  #endif /* _ASM_POWERPC_PGTABLE_H */
diff --git a/arch/powerpc/kernel/machine_kexec_32.c 
b/arch/powerpc/kernel/machine_kexec_32.c
index affe5dcce7f4..4f719501e6ae 100644
--- a/arch/powerpc/kernel/machine_kexec_32.c
+++ b/arch/powerpc/kernel/machine_kexec_32.c
@@ -54,6 +54,10 @@ void default_machine_kexec(struct kimage *image)
  	memcpy((void *)reboot_code_buffer, relocate_new_kernel,
  						relocate_new_kernel_size);

+	change_page_attr(image->control_code_page,
+			 ALIGN(KEXEC_CONTROL_PAGE_SIZE, PAGE_SIZE) >> PAGE_SHIFT,
+			 PAGE_KERNEL_TEXT);
+
  	flush_icache_range(reboot_code_buffer,
  				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
  	printk(KERN_INFO "Bye!\n");
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 16ada373b32b..0e4651d803fc 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -340,7 +340,7 @@ static int __change_page_attr_noflush(struct page 
*page, pgprot_t prot)
   *
   * THIS DOES NOTHING WITH BAT MAPPINGS, DEBUG USE ONLY
   */
-static int change_page_attr(struct page *page, int numpages, pgprot_t prot)
+int change_page_attr(struct page *page, int numpages, pgprot_t prot)
  {
  	int i, err = 0;
  	unsigned long flags;
-- 
2.13.3
