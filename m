Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF41C771
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 13:06:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453FHf6q8zzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 21:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="OBFgLORn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453FGB6xvkzDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 21:05:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 453FG36GB8z9tyyM;
 Tue, 14 May 2019 13:05:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OBFgLORn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CRSSRmvQNw8I; Tue, 14 May 2019 13:05:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 453FG355wmz9tyxW;
 Tue, 14 May 2019 13:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557831915; bh=K+KeNbverQB5F1LXFcJ4rVmMKWsXkPbXfPHwZAhNGXo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OBFgLORniGwfg1ZcpRLVyGyp7Gf8HBK0bZI9d2RrHjR1aE5g5V0WvN9J9W6VbWYKo
 w0cdWcD+PA4xg1oBlGIRjFeIgIA4jxQqidyPjfwjPif5Mbe4W+6UVkdipe4Fd6doCy
 lFAswI8pPGFD7HbSLKo6OYxGQFMAuKCXnUCrn6t4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C30208B8BF;
 Tue, 14 May 2019 13:05:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id A70QW05s1MRp; Tue, 14 May 2019 13:05:16 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 84B3C8B7C1;
 Tue, 14 May 2019 13:05:15 +0200 (CEST)
Subject: Re: Kernel OOPS followed by a panic on next20190507 with 4K page size
To: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <A4247410-7C78-4E52-AB56-1C33A6C27FF3@linux.vnet.ibm.com>
 <0414d06e-1c4e-e9ec-e265-fd9662308df8@linux.ibm.com>
 <4465D9C6-BE89-4215-9730-21CD40ABEA50@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fb4c0e92-ef29-c26e-9e24-602203edd45a@c-s.fr>
Date: Tue, 14 May 2019 13:05:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4465D9C6-BE89-4215-9730-21CD40ABEA50@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/05/2019 à 10:57, Sachin Sant a écrit :
> 
> 
>> On 14-May-2019, at 7:00 AM, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 5/8/19 4:30 PM, Sachin Sant wrote:
>>> While running LTP tests (specifically futex_wake04) against next-20199597
>>> build with 4K page size on a POWER8 LPAR following crash is observed.
>>> [ 4233.214876] BUG: Kernel NULL pointer dereference at 0x0000001c
>>> [ 4233.214898] Faulting instruction address: 0xc000000001d1e58c
>>> [ 4233.214905] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [ 4233.214911] LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>>> [ 4233.214920] Dumping ftrace buffer:
>>> [ 4233.214928]    (ftrace buffer empty)
>>> [ 4233.214933] Modules linked in: overlay rpadlpar_io rpaphp iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
>>> [ 4233.214973] CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
>>> [ 4233.214980] NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
>>> [ 4233.214987] REGS: c000000004937890 TRAP: 0300   Tainted: G        W  O       (5.1.0-next-20190507-autotest)
>>> [ 4233.214993] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
>>> [ 4233.215005] CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
>>> [ 4233.215005] GPR00: c000000001901a80 c000000004937b20 c000000003938700 0000000000000000
>>> [ 4233.215005] GPR04: 0000000000400cc0 000000000003efff 000000027966e000 c000000003ba8700
>>> [ 4233.215005] GPR08: c000000003ba8700 000000000d601125 c000000003ba8700 0000000080000000
>>> [ 4233.215005] GPR12: 0000000022424822 c00000001ecae280 0000000000000000 0000000000000000
>>> [ 4233.215005] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> [ 4233.215005] GPR20: 0000000000000018 c0000000039e2d30 c0000000039e2d28 c0000002762da460
>>> [ 4233.215005] GPR24: 000000000000001c 0000000000000000 0000000000000001 c000000001901a80
>>> [ 4233.215005] GPR28: 0000000000400cc0 0000000000000000 0000000000000000 0000000000400cc0
>>> [ 4233.215065] NIP [c000000001d1e58c] kmem_cache_alloc+0xbc/0x5a0
>>> [ 4233.215071] LR [c000000001d1e54c] kmem_cache_alloc+0x7c/0x5a0
>>> [ 4233.215075] Call Trace:
>>> [ 4233.215081] [c000000004937b20] [c000000001c91150] __pud_alloc+0x160/0x200 (unreliable)
>>> [ 4233.215090] [c000000004937b80] [c000000001901a80] huge_pte_alloc+0x580/0x950
>>> [ 4233.215098] [c000000004937c00] [c000000001cf7910] hugetlb_fault+0x9a0/0x1250
>>> [ 4233.215106] [c000000004937ce0] [c000000001c94a80] handle_mm_fault+0x490/0x4a0
>>> [ 4233.215114] [c000000004937d20] [c0000000018d529c] __do_page_fault+0x77c/0x1f00
>>> [ 4233.215121] [c000000004937e00] [c0000000018d6a48] do_page_fault+0x28/0x50
>>> [ 4233.215129] [c000000004937e20] [c00000000183b0d4] handle_page_fault+0x18/0x38
>>> [ 4233.215135] Instruction dump:
>>> [ 4233.215139] 39290001 f92ac1b0 419e009c 3ce20027 3ba00000 e927c1f0 39290001 f927c1f0
>>> [ 4233.215149] 3d420027 e92ac290 39290001 f92ac290 <8359001c> 83390018 60000000 3ce20027
>>
>> I did send a patch to the list to handle page allocation failures in this patch. But i guess what we are finding here is get_current() crashing. Any chance to bisect this?
>>
> 
> Following commit seems to have introduced this problem.
> 
> 723f268f19 - powerpc/mm: cleanup ifdef mess in add_huge_page_size()
> 
> Reverting this patch allows the test case to execute properly without a crash.

Oops ...

Can you check by replacing

mmu_psize = check_and_get_huge_psize(size);

by

mmu_psize = check_and_get_huge_psize(shift);

in add_huge_page_size()

Thanks
Christophe

> 
> Thanks
> -Sachin
> 
