Return-Path: <linuxppc-dev+bounces-11711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B943B43793
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 11:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHZV852y2z305P;
	Thu,  4 Sep 2025 19:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756979440;
	cv=none; b=j2H7Wz7tAUKR4xsNGHFqV5wUjYQFzRqDBmI3rs2yLG+ZddosU4sM3Ze1+4Tdx4DHwqw6nSJtZLVnHQz/dl4XH3+xg4/qhJ/Ham+ZC6oucJfOp8IvT2w7jvE6gEx+zhIfEysX+nLrrEhS9J9aogjY+0PiIdFnbVqvTFif0OfapfoM4eDU8WBH57flMafD5ITGb3Gee6SA3g+JvkLX8a0I4YhCawpX63ebN3LTlLHnfG2i7DXRfb1lJtKmqI5QCw9Io+07X+TSuwvMwaNW8Er/bH+yo1rzrvU316OoBZNewHkRvUN5kEOMB9akHmNsnCrBd/7QIMHm4sdWBqTCIPbA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756979440; c=relaxed/relaxed;
	bh=MBrdlz0VjSUTVfRkZT8dD8Oj6WFwjZVxgdNMHOTx+NI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bk2GGzBf1fqnLxMWmzJGPE7iAjJtQ7bsLEBr1j+BpR3tncBhcj2Px17sFxDNJa2Vo3o2pu8Ya1xIU/kcXAz33h/9HO89xfwQFSjPe9tNNXELQWjiomMCPC4z1XvIfTmuDhb2HwW3O0g+qMHu7vvM4PChQxkySZstvBL/oTUraU1VffUgviwkL9MVKW9tIrxNST2+sQGqG5I+e6rZyQZi485HzWe2q0hlt0ONIil6/o9+EKKlzEXKpYRN/IrEx9J+xApW2QTkLJAdhkC1sXh3BHXaSboR2EAckiRrPnzWrN61LzDNBcvyENTO0CSZf0TUGi8ImT/tOGAeOZ1HH04Kcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHZV81HP9z2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 19:50:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHXNM6jLZz9sSZ;
	Thu,  4 Sep 2025 10:15:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18SI7UcBawKu; Thu,  4 Sep 2025 10:15:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHXNM5kn3z9sSR;
	Thu,  4 Sep 2025 10:15:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B11998B764;
	Thu,  4 Sep 2025 10:15:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wK9n_Hr5zaWm; Thu,  4 Sep 2025 10:15:31 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 87ADC8B763;
	Thu,  4 Sep 2025 10:15:31 +0200 (CEST)
Message-ID: <548521de-1bc2-41f5-a288-d450dfb6bab4@csgroup.eu>
Date: Thu, 4 Sep 2025 10:15:31 +0200
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
Subject: Re: Kernel v6.17-rc4 with STATIC_CALL_SELFTEST=y enabled fails to
 boot at early stage (PowerMac G4 DP)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
 <98dbafee-aad3-439b-9efb-76f80c6668fd@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <98dbafee-aad3-439b-9efb-76f80c6668fd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Again,

Le 04/09/2025 à 09:31, Christophe Leroy a écrit :
> Hi Erhard,
> 
> Le 04/09/2025 à 00:44, Erhard Furtner a écrit :
>> Greetings!
>>
>> In a conversation with Andrew about his page table check code for 
>> PowerPC he found out there seems to be a general problem of the code 
>> patching code on ppc:
>>
>>  > I note that STATIC_CALL_SELFTEST seems to fail, which could be but 
>> isn't
>>  > necessarily related.
>>
>>  > Specifically, it looks like code patching fails if the instruction 
>> being patched
>>  > is in an __init function, and in this case, that occurs due to
>>  > page_table_check_pte_clear() being inlined into ptep_clear(), which 
>> is in turn
>>  > inlined into pte_clear_tests() in debug_vm_pgtable.c which is 
>> marked __init.
>>  > Very curious!
>>
>> Indeed, when I enable STATIC_CALL_SELFTEST=y on my G4 the kernel fails 
>> to boot at an early stage, the OpenFirmware console showing only:
>>
>> done
>> found display   : /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1, 
>> opening...
>>
>> Without STATIC_CALL_SELFTEST the kernel boots just fine.
>>
>> Kernel .config attached.
> 
> With your .config, on QEMU I get the following. I will investigate.
> 
> [    0.000000] Kernel panic - not syncing: arch_static_call_transform: 
> patching failed func_a+0x0/0x10 at 0x0
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.17.0- 
> rc4-PMacG4+ #1628 PREEMPTLAZY
> [    0.000000] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> [    0.000000] Call Trace:
> [    0.000000] [c0dd7e60] [c0810e54] dump_stack_lvl+0x70/0x8c (unreliable)
> [    0.000000] [c0dd7e80] [c004b220] vpanic+0x114/0x2e4
> [    0.000000] [c0dd7eb0] [c004b45c] arch_set_bit+0x0/0x38
> [    0.000000] [c0dd7f00] [c00155fc] arch_static_call_transform+0xec/0x1e8
> [    0.000000] [c0dd7f30] [c0176944] __static_call_init+0x110/0x288
> [    0.000000] [c0dd7f80] [c0c19ab0] static_call_init+0x4c/0x9c
> [    0.000000] [c0dd7fa0] [c0c02e00] start_kernel+0x7c/0x664
> [    0.000000] [c0dd7ff0] [000035d0] 0x35d0
> [    0.000000] Rebooting in 40 seconds..

The problem comes from the following in arch/powerpc/include/asm/pgtable.h :

/*
  * Protection used for kernel text. We want the debuggers to be able to
  * set breakpoints anywhere, so don't write protect the kernel text
  * on platforms where such control is possible.
  */
#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || 
defined(CONFIG_BDI_SWITCH) || \
	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
#else
#define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
#endif

I don't know what the best fix is at the moment. This probably comes 
from the old days when we didn't have CONFIG_STRICT_KERNEL_RWX. Would it 
nowadays be acceptable to inconditionnally set:

	#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X

It propably would, taking into account it is used exclusively on powerpc/32:

arch/powerpc/mm/book3s32/mmu.c:         setibat(i++, PAGE_OFFSET + base, 
base, size, PAGE_KERNEL_TEXT);
arch/powerpc/mm/book3s32/mmu.c:         setibat(i++, PAGE_OFFSET + base, 
base, size, PAGE_KERNEL_TEXT);
arch/powerpc/mm/pgtable_32.c:           map_kernel_page(v, p, ktext ? 
PAGE_KERNEL_TEXT : PAGE_KERNEL);

Christophe

