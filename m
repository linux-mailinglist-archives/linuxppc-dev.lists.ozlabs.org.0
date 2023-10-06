Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A47BB598
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 12:46:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=iYB5jTcL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S24qj483Zz3vXd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 21:46:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=iYB5jTcL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S24pk2PGsz3c01
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 21:46:03 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4S24pR1j3Vz9sl2;
	Fri,  6 Oct 2023 12:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1696589151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SLvuk2IgweQ8ikhPjyefFhykL92f2Msr8nDnUTvIvCM=;
	b=iYB5jTcLtpOui5MNtJsFFgLnknvJcFLdU8bkBhAc+EgcjShOImCMt3QTbxe6eWsiFOhSfF
	5me5q4NcnopbPdgNf34ngDGhDETxk4mR8MlTQp8ZfIPhjf6CjntN4vraLni3kGR7972ia6
	JCaX/LgS+6Njrg6kyfNvKL7WycubdJspSa614s4teopuQXeUnoFDyUe6KOB5B1I4JAGP6e
	OqeXvM3JgE50Q1Il3iJMoZ4vkC0/YkqrRf75C6bPKVyYawI6ZgRA8S4hWCQhR9hzQhiu8M
	UH7yqn0EKN6XQFNJ0WmOo7rSa7biTIDlqkTNxlSAWVZyV8W4T7yrZUhDM0F9EQ==
Date: Fri, 6 Oct 2023 12:45:48 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
Message-ID: <20231006124548.54d4b7a8@yea>
In-Reply-To: <87sf6onwko.fsf@linux.ibm.com>
References: <20230929132750.3cd98452@yea>
	<87sf6onwko.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f9dd99bd94f5421164f
X-MBO-RS-META: 4ypuoa48dxuubi5s4tbe8z65wue5jxjk
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 06 Oct 2023 11:04:15 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> Can you check this change?
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 3ba9fe411604..6d144fedd557 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -187,8 +187,8 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
>  /*
>   * set_pte stores a linux PTE into the linux page table.
>   */
> -void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> -		pte_t pte, unsigned int nr)
> +static void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> +		pte_t pte)
>  {
>  	/*
>  	 * Make sure hardware valid bit is not set. We don't do
> @@ -203,16 +203,23 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>  	pte = set_pte_filter(pte);
>  
>  	/* Perform the setting of the PTE */
> -	arch_enter_lazy_mmu_mode();
> +	__set_pte_at(mm, addr, ptep, pte, 0);
> +}
> +
> +/*
> + * set_pte stores a linux PTE into the linux page table.
> + */
> +void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> +		pte_t pte, unsigned int nr)
> +{
> +	/* Perform the setting of the PTE */
>  	for (;;) {
> -		__set_pte_at(mm, addr, ptep, pte, 0);
> +		set_pte_at(mm, addr, ptep, pte);
>  		if (--nr == 0)
>  			break;
>  		ptep++;
> -		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
>  		addr += PAGE_SIZE;
>  	}
> -	arch_leave_lazy_mmu_mode();
>  }
>  
>  void unmap_kernel_page(unsigned long va)

Thanks for having a look into the issue! Your patch applies but I got a build failure:

 # make
  CALL    scripts/checksyscalls.sh
  CC      arch/powerpc/mm/pgtable.o
In file included from ./include/linux/mm.h:29,
                 from arch/powerpc/mm/pgtable.c:22:
./include/linux/pgtable.h:247:71: error: expected declaration specifiers or '...' before numeric constant
  247 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
      |                                                                       ^
arch/powerpc/mm/pgtable.c:190:13: note: in expansion of macro 'set_pte_at'
  190 | static void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
      |             ^~~~~~~~~~
make[4]: *** [scripts/Makefile.build:243: arch/powerpc/mm/pgtable.o] Fehler 1
make[3]: *** [scripts/Makefile.build:480: arch/powerpc/mm] Fehler 2
make[2]: *** [scripts/Makefile.build:480: arch/powerpc] Fehler 2
make[1]: *** [/usr/src/linux-stable/Makefile:1913: .] Fehler 2
make: *** [Makefile:234: __sub-make] Fehler 2

Probably you forgot adding a parameter on this line of your patch:
-		__set_pte_at(mm, addr, ptep, pte, 0);
+		set_pte_at(mm, addr, ptep, pte);

So I changed it to:
-		__set_pte_at(mm, addr, ptep, pte, 0);
+		set_pte_at(mm, addr, ptep, pte, 0);

Got the kernel building after that but on booting I still run into the issue. Though details of the dmesg look different now:

BUG: Unable to handle kernel data access at 0xfffffb6affee6dfe
Faulting instruction address: 0xc00000000005d150
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T  6.6.0-rc4-PMacGS #1
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
NIP:  c00000000005d150 LR: c000000000065a70 CTR: c000000000007730
REGS: c0000000022bf4c0 TRAP: 0380   Tainted: G                T (6.6.0-rc3-PMacGS)
MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 44004242  XER: 00000000
IRQMASK: 3
GPR00: 0000000000000000 c0000000022bf760 c0000000010bb900 00000000000001ac
GPR04: 0000000003c80000 0000000000000300 c0000000f20001ae 0000000000000300
GPR08: 0000000000000006 fffffb6affee6dff 0000000000000001 0000000000000000
GPR12: 9000000000001032 c000000002362000 c000000000f9eb80 0000000000000000
GPR16: 0000000000000000 000000047fb56ef0 0000000000000006 c000000000f62280
GPR20: 00000000000001ac c00000000000000c c0000000022ce985 000000000000000c
GPR24: 0000000000000300 00000003b0a3691d c0003e008030000e 0000000000000000
GPR28: c00000000000000c c0000000f20001ee fffffb6affee6dfe 00000000000001ac
NIP [c00000000005d150] hash_page_do_lazy_icache+0x50/0x100
LR [c000000000065a70] __hash_page_4K+0x420/0x590
Call Trace:
[c0000000022bf760] [c0000000022bf7a0] 0xc0000000022bf7a0 (unreliable)
[c0000000022bf790] [c0000000022bf7d0] 0xc0000000022bf7d0
[c0000000022bf870] [c00000000005d55c] hash_page_mm+0x24c/0x770
[c0000000022bf950] [c00000000005dc0c] do_hash_fault+0x10c/0x290
[c0000000022bf980] [c0000000000078e8] data_access_common_virt+0x198/0x1f0
--- interrupt: 300 at mpic_init+0x530/0x1164
NIP:  c000000002020c10 LR: c000000002020b40 CTR: 0000000000000000
REGS: c0000000022bf9f0 TRAP: 0300   Tainted: G                T (6.6.0-rc4-PMacGS)
MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 24004248  XER: 00000000
DAR: c0003e008030000e DSISR: 40000000 IRQMASK: 1
GPR00: 0000000000000000 c0000000022bfc50 c0000000010bb900 c0003e0080300000
GPR04: 0000000000000000 0000000000000000 f6331d6a321c0000 06d34d7094f60000
GPR08: 49fea3a513a00000 46082ea04e99f795 854c3f242ccc0000 0000000000000000
GPR12: 0000000000000000 c000000002362000 c000000000f9eb80 0000000000000000
GPR16: 0000000000000000 c00000047fb56ef0 0000000000000000 c000000000f62280
GPR20: c000000000f69bd0 eff371268bb2fcef f584c8e573e37e99 0000000000000001
GPR24: c0003e0080300000 c000000002270348 c00000000404c640 0000000000000000
GPR28: c0003e0080300000 c00000000404c000 2ecb2e344f558316 c0000000022bfc50
NIP [c000000002020c10] mpic_init+0x530/0x1164
LR [c000000002020b40] mpic_init+0x460/0x1164
~~~ interrupt: 300
[c0000000022bfd80] [c000000002022ca8] pmac_setup_one_mpic+0x258/0x2dc
[c0000000022bfe10] [c000000002022f8c] pmac_pic_init+0x260/0x41c
[c0000000022bfef0] [c00000000200b7d4] init_IRQ+0x90/0x144
[c0000000022bff30] [c000000002005408] start_kernel+0x57c/0x78c
[c0000000022bffe0] [c00000000000cb48] start_here_common+0x1c/0x20
Code: e9290000 7c292040 4081007c fbc10020 3d220127 78843664 39292900 ebc90000 7fde2214 e93e0000 712a0001 40820064 <e93e0000> 71292000 40820048 e93e0000
---[ end trace 0000000000000000 ]---

Regards,
Erhard
