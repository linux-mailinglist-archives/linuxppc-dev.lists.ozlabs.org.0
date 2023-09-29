Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281727B331E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 15:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxrN16Wqxz3cn1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 23:11:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 2227 seconds by postgrey-1.37 at boromir; Fri, 29 Sep 2023 23:11:17 AEST
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxrMT2Ggsz3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 23:11:16 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qmCh1-0003Ck-Fq; Fri, 29 Sep 2023 14:34:03 +0200
Message-ID: <908333ab-1cf2-4b72-b40f-fca4328e160f@leemhuis.info>
Date: Fri, 29 Sep 2023 14:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG: Unable
 to handle kernel data access at 0xfeffbb62ffec65fe)
Content-Language: en-US, de-DE
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
References: <20230929132750.3cd98452@yea>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230929132750.3cd98452@yea>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695993077;fa02de49;
X-HE-SMSGID: 1qmCh1-0003Ck-Fq
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, willy@infradead.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 29.09.23 13:27, Erhard Furtner wrote:
> Greetings!
> 
> Kernel 6.5.5 boots fine on my PowerMac G5 11,2 but kernel 6.6-rc3 fails to boot with following dmesg shown on the OpenFirmware console (transcribed screenshot):
> 
> [...]
> SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> rcu: Hierarchical RCU implementation.
>  Tracing variant of Tasks RCU enabled.
> rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
> NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> mpic: Setting up MPIC " MPIC 1   " version 1.2 at f8040000, max 2 CPUs
> mpic: ISU size: 124, shift: 7, mask: 7f
> mpic: Initializing for 124 sources
> mpic: Setting up HT PICs workarounds for U3/U4
> BUG: Unable to handle kernel data access at 0xfeffbb62ffec65fe
> Faulting instruction address: 0xc00000000005dc40
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T  6.6.0-rc3-PMacGS #1
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c00000000005dc40 LR: c000000000066660 CTR: c000000000007730
> REGS: c0000000022bf510 TRAP: 0380   Tainted: G                T (6.6.0-rc3-PMacGS)
> MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 44004242  XER: 00000000
> IRQMASK: 3
> GPR00: 0000000000000000 c0000000022bf7b0 c0000000010c0b00 00000000000001ac
> GPR04: 0000000003c80000 0000000000000300 c0000000f20001ae 0000000000000300
> GPR08: 0000000000000006 feffbb62ffec65ff 0000000000000001 0000000000000000
> GPR12: 9000000000001032 c000000002362000 c000000000f76b80 000000000349ecd8
> GPR16: 0000000002367ba8 0000000002367f08 0000000000000006 0000000000000000
> GPR20: 00000000000001ac c000000000f6f920 c0000000022cd985 000000000000000c
> GPR24: 0000000000000300 00000003b0a3691d c0003e008030000e 0000000000000000
> GPR28: c00000000000000c c0000000f20001ee feffbb62ffec65fe 00000000000001ac
> NIP [c00000000005dc40] hash_page_do_lazy_icache+0x50/0x100
> LR [c000000000066660] __hash_page_4K+0x420/0x590
> Call Trace:
> [c0000000022bf7e0] [ffffffffffffffff] 0xffffffffffffffff
> [c0000000022bf8c0] [c00000000005e164] hash_page_mm+0x364/0x6f0
> [c0000000022bf990] [c00000000005e684] do_hash_fault+0x114/0x2b0
> [c0000000022bf9c0] [c0000000000078e8] data_access_common_virt+0x198/0x1f0
> --- interrupt: 300 at mpic_init+0x4bc/0x10c4
> NIP:  c000000002020a5c LR: c000000002020a04 CTR: 0000000000000000
> REGS: c0000000022bf9f0 TRAP: 0300   Tainted: G                T (6.6.0-rc3-PMacGS)
> MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 24004248  XER: 00000000
> DAR: c0003e008030000e DSISR: 40000000 IRQMASK: 1
> GPR00: 0000000000000000 c0000000022bfc90 c0000000010c0b00 c0003e0080300000
> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR08: 0000000000000000 221b80894c06df2f 0000000000000000 0000000000000000
> GPR12: 0000000000000000 c000000002362000 c000000000f76b80 000000000349ecd8
> GPR16: 0000000002367ba8 0000000002367f08 0000000002367c70 0000000000000000
> GPR20: 567ce25e8c9202b7 c000000000f6f920 0000000000000001 c0003e0080300000
> GPR24: c00000000226f348 0000000000000004 c00000000404c640 0000000000000000
> GPR28: c0003e0080300000 c00000000404c000 45886d8559cb69b4 c0000000022bfc90
> NIP [c00000000005dc40] mpic_init+0x4bc/0x10c4
> LR [c000000000066660] mpic_init+0x464/0x10c4
> ~~~ interrupt: 300
> [c0000000022bfd90] [c000000002022ae4] pmac_setup_one_mpic+0x258/0x2dc
> [c0000000022bf2e0] [c000000002022df4] pmac_pic_init+0x28c/0x3d8
> [c0000000022bfef0] [c00000000200b750] init_IRQ+0x90/0x140
> [c0000000022bff30] [c0000000020053c0] start_kernel+0x57c/0x78c
> [c0000000022bffe0] [c00000000000cb48] start_here_common+0x1c/0x20
> Code: 09290000 7c292040 4081007c fbc10020 3d220127 78843664 3929d700 ebc90000 7fde2214 e93e0000 712a0001 40820064 <e93e0000> 71232000 40820048 e93e0000
> ---[ end trace 0000000000000000 ]---
> 
> Kernel panic - not syncing: Fatal exception
> Rebooting in 40 seconds..
> 
> 
> I bisected the issue and got 9fee28baa601f4dbf869b1373183b312d2d5ef3d as 1st bad commit:
> 
>  # git bisect good
> 9fee28baa601f4dbf869b1373183b312d2d5ef3d is the first bad commit
> commit 9fee28baa601f4dbf869b1373183b312d2d5ef3d
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Wed Aug 2 16:13:49 2023 +0100
> 
>     powerpc: implement the new page table range API
>     
>     Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().  Change
>     the PG_arch_1 (aka PG_dcache_dirty) flag from being per-page to per-folio.
>     
>     [willy@infradead.org: re-export flush_dcache_icache_folio()]
>       Link: https://lkml.kernel.org/r/ZMx1daYwvD9EM7Cv@casper.infradead.org
>     Link: https://lkml.kernel.org/r/20230802151406.3735276-22-willy@infradead.org
>     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>     Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>     Cc: Michael Ellerman <mpe@ellerman.id.au>
>     Cc: Nicholas Piggin <npiggin@gmail.com>
>     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  5 ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +---
>  arch/powerpc/include/asm/book3s/pgtable.h    | 11 ++----
>  arch/powerpc/include/asm/cacheflush.h        | 14 +++++---
>  arch/powerpc/include/asm/kvm_ppc.h           | 10 +++---
>  arch/powerpc/include/asm/nohash/pgtable.h    | 16 +++------
>  arch/powerpc/include/asm/pgtable.h           | 12 +++++++
>  arch/powerpc/mm/book3s64/hash_utils.c        | 11 +++---
>  arch/powerpc/mm/cacheflush.c                 | 41 ++++++++-------------
>  arch/powerpc/mm/nohash/e500_hugetlbpage.c    |  3 +-
>  arch/powerpc/mm/pgtable.c                    | 53 ++++++++++++++++------------
>  11 files changed, 89 insertions(+), 93 deletions(-)
> 
> 
> And indeed when I revert commit 9fee28baa601f4dbf869b1373183b312d2d5ef3d I get a booting kernel again. I reverted the commit on top of 864609c6a0b5f0464f6ec7869cb2a45a529c35d7 (HEAD) as I get build issues when I revert it on top of 6.6-rc3.
> 
> dmesg of the successful boot with the reverted commit attached, also kernel .config and the bisect.log.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 9fee28baa601f4dbf869b1373183b312d
#regzbot title powerpc: new page table range API causes PowerMac G5 to
fail booting
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
