Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA557E1925
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 04:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNxSJ4wq0z3cb1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 598 seconds by postgrey-1.37 at boromir; Mon, 06 Nov 2023 14:20:07 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNxRq1hgFz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 14:20:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 791E3C15;
	Sun,  5 Nov 2023 19:10:16 -0800 (PST)
Received: from [10.162.41.8] (a077893.blr.arm.com [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E226E3F64C;
	Sun,  5 Nov 2023 19:09:29 -0800 (PST)
Message-ID: <dc5a1072-0c2b-4f49-8a5f-de3dcfb8c06e@arm.com>
Date: Mon, 6 Nov 2023 08:39:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/debug_vm_pgtable.c:860 warning triggered
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <ZUV+W9bwUBjahL15@goliath>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <ZUV+W9bwUBjahL15@goliath>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "David Beazley \(dbeazley\)" <dbeazley@cisco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Daniel,

This test just ensures that PFN is preserved during pte <--> swap pte transformations
, and the warning here seems to have been caused by powerpc platform specific helpers
and/or its pte_t representation. Adding powerpc folks and platform mailing list here.

- Anshuman

On 11/4/23 04:42, Daniel Walker (danielwa) wrote:
> 
> Hi,
> 
> This warning has triggered on our powerpc equipment.
> 
> debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at mm/debug_vm_pgtable.c:860 0xc1012190
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 6.6.0 #14
> Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS
> NIP:  c1012190 LR: c101216c CTR: 00000000
> REGS: c145bc70 TRAP: 0700   Not tainted  (6.6.0)
> MSR:  00029000 <CE,EE,ME>  CR: 48000248  XER: 00000000
> 
> GPR00: c1012094 c145bd60 c1498000 c145bd6c 0000003c 00000000 7cffffff 00000001 
> GPR08: efa2d000 00000000 00000000 2d589a6c 88000248 00000000 c000343c 00000000 
> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c10000d8 
> GPR24: 00000000 00000000 00000000 00000000 00000000 00000200 fffffffc 7cffffff 
> Call Trace:
> [c145bd60] [c1012094] 0xc1012094 (unreliable)
> [c145be30] [c0003044] 0xc0003044
> [c145bea0] [c1000ea0] 0xc1000ea0
> [c145bee0] [c0003460] 0xc0003460
> [c145bf00] [c0011224] 0xc0011224
> --- interrupt: 0 at 0x00000000
> NIP:  00000000 LR: 00000000 CTR: 00000000
> REGS: c145bf10 TRAP: 0000   Not tainted  (6.6.0)
> MSR:  00000000 <>  CR: 00000000  XER: 00000000
> 
> GPR00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> GPR08: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> --- interrupt: 0
> Code: 3861000c 38a00000 4b10a235 8121000c 7c1f4800 41820008 0fe00000 8121006c 7d29e378 5529463e 7c1d4840 41820008 <0fe00000> 81410080 2c0affff 41820058 
> ---[ end trace 0000000000000000 ]---
> 
> This appears to be the following code,
> 
>  850 
>  851 static void __init pte_swap_tests(struct pgtable_debug_args *args)
>  852 {
>  853         swp_entry_t swp;
>  854         pte_t pte;
>  855 
>  856         pr_debug("Validating PTE swap\n");
>  857         pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
>  858         swp = __pte_to_swp_entry(pte);
>  859         pte = __swp_entry_to_pte(swp);
>  860         WARN_ON(args->fixed_pte_pfn != pte_pfn(pte));
>  861 }
>  862 
> 
> 
> This only happens in powerpc with the following config options enabled,
> 
> CONFIG_PTE_64BIT=y
> CONFIG_PHYS_64BIT=y
> 
> These options can increase the pte_t type to 64bits, which swp_entry_t remains unsigned
> long which is 32 bits on there systems. This warning appears to have triggered since the
> inclusion of CONFIG_DEBUG_VM_PGTABLE support for powerpc.
> 
> To reproduce the issue you can use the attached config to build a powerpc kernel. Then
> boot with QEMU using the following command line.
> 
> qemu-system-ppc -M mpc8544ds -kernel ../powerpc/vmlinux -append "console=ttyS0" -nographic
> 
> Please CC me on any fixes in the future.
> 
> Thanks,
> 
> Daniel
> 
