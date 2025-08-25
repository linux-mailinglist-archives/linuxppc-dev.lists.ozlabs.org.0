Return-Path: <linuxppc-dev+bounces-11246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E1B33C7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 12:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9RdJ3zxyz3cgP;
	Mon, 25 Aug 2025 20:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756117236;
	cv=none; b=fEnVi9LcW7PjVk592eAZEX8g4rUod8Za4ChdXNNhBqtYkYYMggpwVEGUt91TBTWN6Zuc/0NUF+XOqvOqwEBLw9eEAkx67JCEsrif563EXxCMFU2S0NrBRqPDq8x5W4bPUSMpeO/iDsh1PoaN6WsOZKfM87UB8kadsbzQ1oHRqIAzHhyeLyVH+sYBQ9zUG2A+6BRV8y87NOgteY7tCAoGJgh3F1dy2bkR2ml7qXU/0vIIw6JyeGjchICB8LQGob1vmocug9AgqV960KFFTuKJP4AfPi76Xu1fboAgoXf6SZopz4KlfgsYgD9JJ+pn69Jk7xU77lHd1/razjOnO/vWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756117236; c=relaxed/relaxed;
	bh=0PCMP2DJBUtl6uDh+HQlNBdAOpBQeWcYe8UpTkRt06E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghWPX6iG4oD0wAolJi6aaE5HVBCP8XkGhQr9smMlRwvFZLMMY6RK8CFziOpYj9nQCZCPxDG0fx2bETxEb92h/ArCVlPJaIswW5iN+9mEyEeWEytYkWMiqA5LnlzOmbGX1KDj2PSoDEMAtfCPT/5vQY5iuSvmcwAgmfPnZBoRje5lp7oNhKa6NqdOylw1bNv+LxJgzFwSbmNYbvB8bGakbyZArVHwkLGPB87tNtoCNOWBzg2jURn+xbaUonYG9pGn3VgjRczxXXeg5NhTKsK/I0ea0Vy3L6Z018s06Kd8tQ82L0nLuGmDJQE1ECTWQUBM7mJXT5+8FHO5MScu9dj04w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9RdH6Tj7z3cg1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 20:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9QlP1HkLz9sSh;
	Mon, 25 Aug 2025 11:40:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXbQBsr7Ehxm; Mon, 25 Aug 2025 11:40:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9QlP04NMz9sSc;
	Mon, 25 Aug 2025 11:40:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D6B268B765;
	Mon, 25 Aug 2025 11:40:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gtwn_B0_QRlE; Mon, 25 Aug 2025 11:40:48 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 763DD8B764;
	Mon, 25 Aug 2025 11:40:48 +0200 (CEST)
Message-ID: <16679d56-5ee0-469d-a11c-475a45a1c2b9@csgroup.eu>
Date: Mon, 25 Aug 2025 11:40:48 +0200
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
Subject: Re: [PATCH v2 10/10] powerpc/uaccess: Implement masked user access
To: Gabriel Paubert <paubert@iram.es>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-block@vger.kernel.org
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
 <647f1b1db985aec8ec1163bf97688563ae6f9609.1755854833.git.christophe.leroy@csgroup.eu>
 <aKwnMo7UllLZkOcK@lt-gp.iram.es>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <aKwnMo7UllLZkOcK@lt-gp.iram.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Gabriel,

Le 25/08/2025 à 11:04, Gabriel Paubert a écrit :
> [Vous ne recevez pas souvent de courriers de paubert@iram.es. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Christophe,
> 
> On Fri, Aug 22, 2025 at 11:58:06AM +0200, Christophe Leroy wrote:
>> Masked user access avoids the address/size verification by access_ok().
>> Allthough its main purpose is to skip the speculation in the
>> verification of user address and size hence avoid the need of spec
>> mitigation, it also has the advantage of reducing the amount of
>> instructions required so it even benefits to platforms that don't
>> need speculation mitigation, especially when the size of the copy is
>> not know at build time.
>>
>> So implement masked user access on powerpc. The only requirement is
>> to have memory gap that faults between the top user space and the
>> real start of kernel area.
>>
>> On 64 bits platforms the address space is divided that way:
>>
>>        0xffffffffffffffff      +------------------+
>>                                |                  |
>>                                |   kernel space   |
>>                                |                  |
>>        0xc000000000000000      +------------------+  <== PAGE_OFFSET
>>                                |//////////////////|
>>                                |//////////////////|
>>        0x8000000000000000      |//////////////////|
>>                                |//////////////////|
>>                                |//////////////////|
>>        0x0010000000000000      +------------------+  <== TASK_SIZE_MAX
>>                                |                  |
>>                                |    user space    |
>>                                |                  |
>>        0x0000000000000000      +------------------+
>>
>> Kernel is always above 0x8000000000000000 and user always
>> below, with a gap in-between. It leads to a 4 instructions sequence:
>>
>>    80: 7c 69 1b 78     mr      r9,r3
>>    84: 7c 63 fe 76     sradi   r3,r3,63
>>    88: 7d 29 18 78     andc    r9,r9,r3
>>    8c: 79 23 00 4c     rldimi  r3,r9,0,1
>>
>> This sequence leaves r3 unmodified when it is below 0x8000000000000000
>> and clamps it to 0x8000000000000000 if it is above.
>>
> 
> This comment looks wrong: the second instruction converts r3 to a
> replicated sign bit of the address ((addr>0)?0:-1) if treating the
> address as signed. After that the code only modifies the MSB of r3. So I
> don't see how r3 could be unchanged from the original value...

Unless I'm missing something, the above rldimi leaves the MSB of r3 
unmodified and replaces all other bits by the same in r9.

This is the code generated by GCC for the following:

	unsigned long mask = (unsigned long)((long)addr >> 63);

	addr = ((addr & ~mask) & (~0UL >> 1)) | (mask & (1UL << 63));


> 
> OTOH, I believe the following 3 instructions sequence would work,
> input address (a) in r3, scratch value (tmp) in r9, both intptr_t:
> 
>          sradi r9,r3,63  ; tmp = (a >= 0) ? 0L : -1L;
>          andc r3,r3,r9   ; a = a & ~tmp; (equivalently a = (a >= 0) ? a : 0)
>          rldimi r3,r9,0,1 ; copy MSB of tmp to MSB of a
> 
> But maybe I goofed...
> 

 From my understanding of rldimi, your proposed code would:
- Keep r3 unmodified when it is above 0x8000000000000000
- Set r3 to 0x7fffffffffffffff when it is below 0x8000000000000000

Extract of ppc64 ABI:

rldimi RA,RS,SH,MB

The contents of register RS are rotated 64 left SH bits.
A mask is generated having 1-bits from bit MB
through bit 63− SH and 0-bits elsewhere. The rotated
data are inserted into register RA under control of the
generated mask.



