Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A11A9821
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 11:14:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Gs45ZthzDqFh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 19:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=l3bXNSrG; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Gpq3FBzzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 19:12:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492Gpk5yV6z9tyhC;
 Wed, 15 Apr 2020 11:12:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=l3bXNSrG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TaUh6lmL-P5o; Wed, 15 Apr 2020 11:12:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492Gpk4cxWz9tyh9;
 Wed, 15 Apr 2020 11:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586941966; bh=dV6YOiJ4H7/Y4XRgt4cAkIwhpU0OWRnUnXsQ0TRfdTQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=l3bXNSrGdxlnjlWOnENO9yr6woUzN6ZgWaFq0AeIbus2cgvd5vr++ZYzkKQD5rUfk
 wgf04+Ea7y8Pc4hBCTZm3k4kIvjtxa3VIUV/aMcjX+kcT+EV9MdeSHnycTXiaqXSVT
 pQhi3bHOfa4chGHCdXqoHHn+pvVwwc1LteiUO7wg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C180E8B922;
 Wed, 15 Apr 2020 11:12:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CWq1knqHjwR5; Wed, 15 Apr 2020 11:12:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B6258B91F;
 Wed, 15 Apr 2020 11:12:47 +0200 (CEST)
Subject: Re: [RFC PATCH] powerpc/lib: Fixing use a temporary mm for code
 patching
To: Christopher M Riedl <cmr@informatik.wtf>
References: <c88b13ede49744d81fdab32e037a7ae10f0b241f.1585233657.git.christophe.leroy@c-s.fr>
 <581069710.188209.1586927814880@privateemail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <badfcf58-9fcb-6189-c9db-e8429f88799e@c-s.fr>
Date: Wed, 15 Apr 2020 11:12:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <581069710.188209.1586927814880@privateemail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/04/2020 à 07:16, Christopher M Riedl a écrit :
>> On March 26, 2020 9:42 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>>   
>> This patch fixes the RFC series identified below.
>> It fixes three points:
>> - Failure with CONFIG_PPC_KUAP
>> - Failure to write do to lack of DIRTY bit set on the 8xx
>> - Inadequaly complex WARN post verification
>>
>> However, it has an impact on the CPU load. Here is the time
>> needed on an 8xx to run the ftrace selftests without and
>> with this series:
>> - Without CONFIG_STRICT_KERNEL_RWX		==> 38 seconds
>> - With CONFIG_STRICT_KERNEL_RWX			==> 40 seconds
>> - With CONFIG_STRICT_KERNEL_RWX + this series	==> 43 seconds
>>
>> Link: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=166003
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/lib/code-patching.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
>> index f156132e8975..4ccff427592e 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -97,6 +97,7 @@ static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
>>   	}
>>   
>>   	pte = mk_pte(page, pgprot);
>> +	pte = pte_mkdirty(pte);
>>   	set_pte_at(patching_mm, patching_addr, ptep, pte);
>>   
>>   	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
>> @@ -168,7 +169,9 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>>   			(offset_in_page((unsigned long)addr) /
>>   				sizeof(unsigned int));
>>   
>> +	allow_write_to_user(patch_addr, sizeof(instr));
>>   	__patch_instruction(addr, instr, patch_addr);
>> +	prevent_write_to_user(patch_addr, sizeof(instr));
>>
> 
> On radix we can map the page with PAGE_KERNEL protection which ends up
> setting EAA[0] in the radix PTE. This means the KUAP (AMR) protection is
> ignored (ISA v3.0b Fig. 35) since we are accessing the page from MSR[PR]=0.
> 
> Can we employ a similar approach on the 8xx? I would prefer *not* to wrap
> the __patch_instruction() with the allow_/prevent_write_to_user() KUAP things
> because this is a temporary kernel mapping which really isn't userspace in
> the usual sense.

On the 8xx, that's pretty different.

The PTE doesn't control whether a page is user page or a kernel page. 
The only thing that is set in the PTE is whether a page is linked to a 
given PID or not.
PAGE_KERNEL tells that the page can be addressed with any PID.

The user access right is given by a kind of zone, which is in the PGD 
entry. Every pages above PAGE_OFFSET are defined as belonging to zone 0. 
Every pages below PAGE_OFFSET are defined as belonging to zone 1.

By default, zone 0 can only be accessed by kernel, and zone 1 can only 
be accessed by user. When kernel wants to access zone 1, it temporarily 
changes properties of zone 1 to allow both kernel and user accesses.

So, if your mapping is below PAGE_OFFSET, it is in zone 1 and kernel 
must unlock it to access it.


And this is more or less the same on hash/32. This is managed by segment 
registers. One segment register corresponds to a 256Mbytes area. Every 
pages below PAGE_OFFSET can only be read by default by kernel. Only user 
can write if the PTE allows it. When the kernel needs to write at an 
address below PAGE_OFFSET, it must change the segment properties in the 
corresponding segment register.

So, for both cases, if we want to have it local to a task while still 
allowing kernel access, it means we have to define a new special area 
between TASK_SIZE and PAGE_OFFSET which belongs to kernel zone.

That looks complex to me for a small benefit, especially as 8xx is not 
SMP and neither are most of the hash/32 targets.

Christophe
