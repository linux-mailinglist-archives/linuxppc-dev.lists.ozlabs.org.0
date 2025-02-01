Return-Path: <linuxppc-dev+bounces-5766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9361A249B8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2025 16:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlbzW4yjvz2yNP;
	Sun,  2 Feb 2025 02:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738423207;
	cv=none; b=Zs3ktX43sCnuBfA8ezRtZ7+jnf7qyMr6sgelPhx8FWelIxPum4q4CeLxDfhwW5e0ehFPvOcpf7zZYDFO/zf97pCfylfRXlhA0ZrGHvgbueh6HwAx/xBKNLszhcVr8Q96G/adI13Um6Vf6NqF2K+azb9XFKITzLZGG01PF8vxzCtHW2pdnr6mmTqbITmDD3mVcEX+I12XkxNIsorAlYYdPpn59f5/yUAYu+kjBP3eCx68GKl/FklONLcc6vHRgR/dz0KEpDfWUz6epvtcyQTACetCf+FrYK24MemsyOtJQX4tWAsqPdwrnsT3+gHwIjEzw5FNONToICxF3KMu6XItoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738423207; c=relaxed/relaxed;
	bh=wFIN+auOPs+dYqh8kBNWuHix6Ny5XSTC0b0lOVMceI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg5gq/CP4dbhDfHlOOpGstPM+2v82p/h6HYitFhMrdZlvWf6dslnj2CDzddFAHUS83pBQ8MnPO4wYCKPi0+b10gpgcgye/nqmBQVT9020nRUasAC6RvtV02A1ERd5bQQu7ME3+4sy3Vq0ctvH/aYSKzC0FUZcl97deyBu0W9gFy/JKmdxCYKmIc6GiCxUPyXdBn2bwwNYBxDidJ2wIBDirENIE8vDV61JUY7wf8Xn7Bs2+PHu+bWcx3UN5f6hbty61pD3h2lFIO11pdUXWox0yNaytXfVSM1ukgF7pPxgNKFFq4j5E4nVA+icHUu6cRziZ+X6YDT7yk8PXJp3dXgng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlbzV4hmtz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2025 02:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YlbrY0Q8Nz9sRr;
	Sat,  1 Feb 2025 16:14:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcTJnK3UAy8Y; Sat,  1 Feb 2025 16:14:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YlbrX6gvwz9sRk;
	Sat,  1 Feb 2025 16:14:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2D858B764;
	Sat,  1 Feb 2025 16:14:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HHMZ0FDlXTeB; Sat,  1 Feb 2025 16:14:04 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 75F378B763;
	Sat,  1 Feb 2025 16:14:04 +0100 (CET)
Message-ID: <1ff477a4-85f6-4330-aa0c-add315abfff9@csgroup.eu>
Date: Sat, 1 Feb 2025 16:14:04 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Balbir Singh <bsingharora@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250112135832.57c92322@yea>
 <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
 <20250121220027.64b79bab@yea>
 <f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
 <20250122002159.43b367f0@yea>
 <ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
 <8acd6ef8-adf0-4694-a3e5-72ec3cf09bf1@csgroup.eu>
 <20250201151435.48400261@yea>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250201151435.48400261@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 01/02/2025 à 15:14, Erhard Furtner a écrit :
> On Wed, 22 Jan 2025 19:23:00 +0100
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>
>>> I was able to reproduce it with v6.13 with QEMU when loading test_bpf
>>> module.
>>>
>>> On my side, the problem doesn't disappear when reverting of commit
>>> 32913f348229 ("futex: fix user access on powerpc")
>>>
>>> I bisected it to commit e4137f08816b ("mm, kasan, kmsan: instrument
>>> copy_from/to_kernel_nofault"), which makes a lot more sense to me.
>>>
>>> It might be a problem in the way patch_instruction() is implemented on
>>> powerpc, to be investigated.
>>
>> I think the problem is commit 37bc3e5fd764 ("powerpc/lib/code-patching:
>> Use alternate map for patch_instruction()")
>>
>> Can you try the change below:
>>
>> diff --git a/arch/powerpc/lib/code-patching.c
>> b/arch/powerpc/lib/code-patching.c
>> index af97fbb3c257..8a378fc19074 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -108,7 +108,7 @@ static int text_area_cpu_up(unsigned int cpu)
>>    	unsigned long addr;
>>    	int err;
>>
>> -	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
>> +	area = get_vm_area(PAGE_SIZE, 0);
>>    	if (!area) {
>>    		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
>>    			cpu);
>>
> 
> Checked on my Talos II (POWER9) too, to see whether ppc64 is also affected and here I still see the KASAN hit despite Christophes patch applied:
> 
> BUG: KASAN: user-memory-access in copy_to_kernel_nofault+0x8c/0x1a0
> Write of size 8 at addr 0000187e458f2000 by task systemd/1


Thanks for the report.

That's something different. Previous report was:

BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8

This is what my patch fixes.

New report is:

BUG: KASAN: user-memory-access in copy_to_kernel_nofault+0x8c/0x1a0

Christophe

