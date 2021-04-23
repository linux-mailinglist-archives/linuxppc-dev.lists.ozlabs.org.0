Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52A36932D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:29:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZsC68M9z30G7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 23:29:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qFx7kWXg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qFx7kWXg; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZrq03Jpz2xZy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 23:29:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRZrg1Gg9z9sVb;
 Fri, 23 Apr 2021 23:29:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619184563;
 bh=ctdLTNJD26/Vx2uPmq5QR17DiC7Mea9nDlu1tsH6rI0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=qFx7kWXgn2UQTr9F9SaArfdV6w7mDrWsH79JmeYUI8/skQp9u2FTC0QCoq95mHxHr
 COinSKQ1Jj9r1GMv4iOPrr8REFOsJtLYLwCtzckrhd/6Tu8NY0Q3g+W2F8k/fNmmJT
 UnDG4389RAs6YyGd6/8HfwAoxLGh1M27kJYCcebMONWHyRKgK/cGlfm5n3BaV64dqK
 /2HlyCSGZj/+EBW8c9X1xwH1hRaTV+lu6NVVmbo/Q2aSi83c0HzuwFN/KNXCPMLDlL
 n3xIcup2RQdnX9k0BRCqsnNp1Uh68cRx/1FmaXcrUu3HJ+EGvIKcqTKpgWo/D60aIW
 kwrRMsCnAj6AA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Daniel Axtens
 <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy
 <sathvika@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/sstep: Add emulation support for
 =?utf-8?B?4oCYc2V0YuKAmQ==?= instruction
In-Reply-To: <1619085028.flue8xv2n9.naveen@linux.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
 <875z0mfzbf.fsf@linkitivity.dja.id.au>
 <1618899164.u2uju6vw3c.naveen@linux.ibm.com>
 <87lf9caycg.fsf@mpe.ellerman.id.au>
 <1619085028.flue8xv2n9.naveen@linux.ibm.com>
Date: Fri, 23 Apr 2021 23:29:18 +1000
Message-ID: <87bla5b041.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> Michael Ellerman wrote:
>> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>>> Daniel Axtens wrote:
>>>> Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:
>>>> 
>>>>> This adds emulation support for the following instruction:
>>>>>    * Set Boolean (setb)
>>>>>
>>>>> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
>> ...
>>>> 
>>>> If you do end up respinning the patch, I think it would be good to make
>>>> the maths a bit clearer. I think it works because a left shift of 2 is
>>>> the same as multiplying by 4, but it would be easier to follow if you
>>>> used a temporary variable for btf.
>>>
>>> Indeed. I wonder if it is better to follow the ISA itself. Per the ISA, 
>>> the bit we are interested in is:
>>> 	4 x BFA + 32
>>>
>>> So, if we use that along with the PPC_BIT() macro, we get:
>>> 	if (regs->ccr & PPC_BIT(ra + 32))
>> 
>> Use of PPC_BIT risks annoying your maintainer :)
>
> Uh oh... that isn't good :)
>
> I looked up previous discussions and I think I now understand why you 
> don't prefer it.

Hah, I'd forgotten I'd written (ranted :D) about this in the past.

> But, I feel it helps make it easy to follow the code when referring to 
> the ISA.

That's true. But I think that's much much less common than people
reading the code in isolation.

And ultimately it doesn't matter if the code (appears to) match the ISA,
it matters that the code works. My worry is that too much use of those
type of macros obscures what's actually happening.

> I'm wondering if it is just the name you dislike and if so, 
> does it make sense to rename PPC_BIT() to something else? We have 
> BIT_ULL(), so perhaps BIT_MSB_ULL() or MSB_BIT_ULL()?

The name is part of it. But I don't really like BIT_ULL() either, it
hides in a macro something that could just be there in front of you
ie. (1ull << x).


For this case of setb, I think I'd go with something like below. It
doesn't exactly match the ISA, but I think there's minimal obfuscation
of what's actually going on.

    	// ra is now bfa
	ra = (ra >> 2);

	// Extract 4-bit CR field
	val = regs->ccr >> (CR0_SHIFT - 4 * ra);

	if (val & 8)
		op->val = -1;
	else if (val & 4)
		op->val = 1;
	else
		op->val = 0;


If anything could use a macro it would be the 8 and 4, eg. CR_LT, CR_GT.

Of course that's probably got a bug in it, because I just wrote it by
eye and it's 11:28 pm :)

cheers
