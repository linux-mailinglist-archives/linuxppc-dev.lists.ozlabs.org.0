Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A83FBD06F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 07:58:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p3Rl23bFzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 16:58:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p3Q04M9yzDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 16:56:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Kk+qwwT/"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46p3Pz3pxxz9sPF;
 Wed,  9 Oct 2019 16:56:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1570600616;
 bh=ZfBf2MHcr0p97T1RCjzcJri4N8wX88l6VNo2jy3WEnU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Kk+qwwT/LQunmIG6IvS8IwQ9GCQiM/ANZxGcqhphK0zZW8uZNF6C/6k5PUY/oNH1Y
 hdYdDyQoPGjVgHkMG7kYcnygIZs1x/0THJT8e6egnaLiBktmGw6Ty6PVnwXql/Qron
 xLKDJ6RkPvBRxPomc6y+/Fxt3WiKYzbIgt29F+Up2/Pr1EXSYgTJQF5WaF9j0CG7t3
 oRHcLJYLAMR5mcGKHsDBl+S5GvZvfSOnhHsI8GOuE14zm/G8ge5s1gfGDCsB/SQUWy
 ggAyGv7G40mFDv1knSzEO51nhVVojGA59T4lZa+OHktPn1Ntswy4RA/ykebxZc7bCS
 QIvrdvm6NyiGw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Samuel Holland <samuel@sholland.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/book3s64/hash/4k: 4k supports only 16TB
 linear mapping
In-Reply-To: <7dc4aacd-ebe1-07d6-1869-e404c3c22d2e@sholland.org>
References: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
 <7dc4aacd-ebe1-07d6-1869-e404c3c22d2e@sholland.org>
Date: Wed, 09 Oct 2019 16:56:52 +1100
Message-ID: <87mueampgb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Cameron Berkenpas <cam@neo-zeon.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Samuel Holland <samuel@sholland.org> writes:
> Hello,
>
> On 9/17/19 9:57 AM, Aneesh Kumar K.V wrote:
>> With commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the
>> same 0xc range"), we now split the 64TB address range into 4 contexts each of
>> 16TB. That implies we can do only 16TB linear mapping. Make sure we don't
>> add physical memory above 16TB if that is present in the system.
>> 
>> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in thesame 0xc range")
>> Reported-by: Cameron Berkenpas <cam@neo-zeon.de>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/book3s/64/mmu.h | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
>> index bb3deb76c951..86cce8189240 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -35,12 +35,16 @@ extern struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
>>   * memory requirements with large number of sections.
>>   * 51 bits is the max physical real address on POWER9
>>   */
>> -#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME) &&  \
>> -	defined(CONFIG_PPC_64K_PAGES)
>> +
>> +#if defined(CONFIG_PPC_64K_PAGES)
>> +#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME)
>
> This prevents accessing physical memory over 16TB with 4k pages and radix MMU as
> well. Was this intentional?

No, it was meant to be a temporary fix until the rest of Aneesh's series
fixed things up properly, but then there were problems with those
patches so he asked me to just pick up this one.

At the moment 4K hash won't boot at all if you have too much RAM on P9,
so this was meant to at least avoid that.

But breaking 4K radix is arguably worse, so I'll drop this for now.

cheers
