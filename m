Return-Path: <linuxppc-dev+bounces-13792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC192C3579C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 12:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1kCK68vSz3bW7;
	Wed,  5 Nov 2025 22:50:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762343405;
	cv=none; b=BfB8PukQsL8rjDf/ElCbk2ONcoZgVS3QiEVwPqnjKt8DFJlEG2ae9HdhFcQkBjxGfMgwrpRV3Lxh2t00y25IFbxfDV0GWS+p6qO7t4xAmqJgiTWLl0zY63WQGB8/Jm5ebYVTan+PiEu0dW5blbnHD2XAcxTcDuIH2TGnPwO/QlsLlPGsXETZ1Bv0NLSehEdjf8bj+z9wu/UxuVaLAhyvXXqq83VVvTc9bFd5E5j8eLTtcRiix0XrH1MmAAkbI6Jlr266jWkwnUquqC8fXc0sr9oqosa4dnww3+iyeER8bXZEFBpd9i6G9e2848LvVukZKUxCvFbs4sYhVdBbI07OAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762343405; c=relaxed/relaxed;
	bh=3sreApMNjeNHXRlxFsML7Dnj7kOHNONsoKT8e5K3eYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gL7fe4r1NvN30vaKvrPAXOr817Lqs5kSkbmxsvd7vmL6nFYCzIjLSyK0mnge5MfQq2EHE26IWEOq+o6eNhTxCjtUXrTAJnA0QE1p3YLz2Q/8pL9wyHdwrgfwjKlEcJyLx+6VziFfzF1P30UUyDxqROl+rjUXtRuDSpxL4nLQuqQW1O7+oQe7W9CRGSNKZO+XUg1w00JRrd7dPv5gjPu0gnM8YZODAn5RPkPvzJKcdM4jHr+2T7hN/+B8XSoMy2p2HRZUfYcCgLpwZrgV1MFucbz0a2q16tiN+Bl/orB3UI5IFJbuvr3hSNeQElvzzZgSsHva6zc7KUMNRKhiWHALaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1kCK0mnHz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 22:50:03 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d1jpk0KBdz9sRy;
	Wed,  5 Nov 2025 12:32:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zP_dHME8SHYy; Wed,  5 Nov 2025 12:32:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d1jpj6S5hz9sRg;
	Wed,  5 Nov 2025 12:32:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD46E8B76E;
	Wed,  5 Nov 2025 12:32:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id G2h3JfiGh9US; Wed,  5 Nov 2025 12:32:13 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 722548B76D;
	Wed,  5 Nov 2025 12:32:13 +0100 (CET)
Message-ID: <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
Date: Wed, 5 Nov 2025 12:32:13 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: David Hildenbrand <david@redhat.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi David,

Le 29/10/2025 à 09:25, David Hildenbrand a écrit :
> On 29.10.25 06:49, Sourabh Jain wrote:
>> Kernel is printing below warning while booting:
>>
>>
>> WARNING: CPU: 0 PID: 1 at mm/hugetlb.c:4753 hugetlb_add_hstate+0xc0/0x180
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>> 6.18.0-rc1-01400-ga297f72c4951 #6 NONE
>> Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
>> NIP:  c000000001370800 LR: c000000001357740 CTR: 0000000000000005
>> REGS: c000000080183890 TRAP: 0700   Not tainted
>> (6.18.0-rc1-01400-ga297f72c4951)
>> MSR:  0000000080029002 <CE,EE,ME>  CR: 48000242  XER: 20000000
>> IRQMASK: 0
>> GPR00: c000000001357740 c000000080183b30 c000000001352000 
>> 000000000000000e
>> GPR04: c0000000011d1c4f 0000000000000002 000000000000001a 
>> 0000000000000000
>> GPR08: 0000000000000000 0000000000000002 0000000000000001 
>> 0000000000000005
>> GPR12: c0000000013576a4 c0000000015ad000 c00000000000210c 
>> 0000000000000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> GPR20: 0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> GPR24: 0000000000000000 c0000000015876e8 0000000000000002 
>> c000000001587500
>> GPR28: c000000001587578 000000000000000e 0000000004000000 
>> 0000000000000170
>> NIP [c000000001370800] hugetlb_add_hstate+0xc0/0x180
>> LR [c000000001357740] hugetlbpage_init+0x9c/0xf0
>> Call Trace:
>> hugetlb_add_hstate+0x148/0x180 (unreliable)
>> hugetlbpage_init+0x9c/0xf0
>> do_one_initcall+0x84/0x308
>> kernel_init_freeable+0x2e4/0x380
>> kernel_init+0x30/0x15c
>> ret_from_kernel_user_thread+0x14/0x1c
>>
>> Kernel commit causing these warning:
>> commit 7b4f21f5e0386dfe02c68c009294d8f26e3c1bad (HEAD)
>> Author: David Hildenbrand <david@redhat.com>
>> Date:   Mon Sep 1 17:03:29 2025 +0200
>>
>>       mm/hugetlb: check for unreasonable folio sizes when registering 
>> hstate
>>
>>       Let's check that no hstate that corresponds to an unreasonable
>> folio size
>>       is registered by an architecture.  If we were to succeed
>> registering, we
>>       could later try allocating an unsupported gigantic folio size.
>>
>> ...
>>
>>           BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
>> +       WARN_ON(order > MAX_FOLIO_ORDER);
>>           h = &hstates[hugetlb_max_hstate++];
>>
>> snip...
>>
>>
>> Command to create kernel config:
>> make ARCH=powerpc corenet64_smp_defconfig
>>
>> Qemu command:
>> qemu-system-ppc64 -nographic -vga none -M ppce500 -smp 2 -m 4G -accel
>> tcg -kernel ./vmlinux -nic user -initrd ./ppc64-novsx-rootfs.cpio.gz
>> -cpu e5500 -append "noreboot"
>>
>>
>> Root cause:
>> The MAX_FOLIO_ORDER  for e500 platform is MAX_PAGE_ORDER which is
>> nothing but CONFIG_ARCH_FORCE_MAX_ORDER which dependent of page-size
>> which was 4k. So value of MAX_FOLIO_ODER is 12 for this case.
>>
>> As per arch/powerpc/mm/nohash/tlb.c the following page size are 
>> supported on
>> e500 platform:
>>
>> struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
>>       [MMU_PAGE_4K] = {
>>           .shift    = 12,
>>       },
>>       [MMU_PAGE_2M] = {
>>           .shift    = 21,
>>       },
>>       [MMU_PAGE_4M] = {
>>           .shift    = 22,
>>       },
>>       [MMU_PAGE_16M] = {
>>           .shift    = 24,
>>       },
>>       [MMU_PAGE_64M] = {
>>           .shift    = 26,
>>       },
>>       [MMU_PAGE_256M] = {
>>           .shift    = 28,
>>       },
>>       [MMU_PAGE_1G] = {
>>           .shift    = 30,
>>       },
>> };
>>
>> With the above MAX_FOLIO_ORDER and page sizes, hugetlbpage_init() in
>> arch/powerpc/mm/hugetlbpage.c tries to call hugetlb_add_hstate() with
>> an order higher than 12, causing the kernel to print the above warning.
>>
>> Things I tried:
>> I enabled CONFIG_ARCH_HAS_GIGANTIC_PAGE for the e500 platform. With that,
>> MAX_FOLIO_ORDER was set to 16, but that was not sufficient for 
>> MMU_PAGE_1G.
>>
>> This is because with CONFIG_ARCH_HAS_GIGANTIC_PAGE enabled,
>> MAX_FOLIO_ORDER was set to 16 = PUD_ORDER = (PMD_INDEX_SIZE (7) +
>> PTE_INDEX_SIZE (9)),
>> while the order for MMU_PAGE_1G was 18.
> 
> Yes, we discussed that in [1].
> 
> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase 
> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that 
> have even larger hugetlb sizes than PUDs.
> 
> @Cristophe, I was under the impression that you would send a fix. Do you 
> want me to prepare something and send it out?

Indeed I would have liked to better understand the implications of all 
this, but I didn't have the time.

By the way, you would describe the fix better than me so yes if you can 
prepare and send a fix please do.

Christophe

