Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF6C245B28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 05:47:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVKk75rn8zDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVKhQ1SpnzDqN3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 13:45:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nXW//UZa; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVKhP3mCKz9sRK;
 Mon, 17 Aug 2020 13:45:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597635957;
 bh=NqoN0tZjJc+g4LNikiO42+qvS3/dVJspsqGoOu1MRA0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nXW//UZaTXNdMut3BsqeS+6aHktxZx7ywaGaU0yNJwHDEG/Dyx4hTCV3PPNV7bGNx
 XLv5QTZkrjA+Y3IOsOlxj8NfY7f4kgSnE7sQjIx2Jji3cjiGWjFCr73ttjURpiorB9
 lHC1dgrAxPXw0Nh+N2Fa+mn/Xj56CDt4wZoeYt8GPL93RDAb8NsdkPRULK/ngbStv/
 ZaNoCOGCn/u5w4bsKZfTKtTLnDUTtj9ngGojEFYeK5qrTxcew9B+awMwfgK940YBy1
 WgZ2vJGxsFBvdCFhH0pZk9hmK2F8vgvaCUmZmNA1j/muJQ77c7ihG8ezotB/dyuO/X
 C9VQUbAqpjXbg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
In-Reply-To: <874kp7z73m.fsf@linux.ibm.com>
References: <20200812012005.1919255-1-nathanl@linux.ibm.com>
 <5e8213a6-802b-f7ca-b43b-a3de8a03d1da@linux.ibm.com>
 <87lfij9yp6.fsf@mpe.ellerman.id.au> <874kp7z73m.fsf@linux.ibm.com>
Date: Mon, 17 Aug 2020 13:45:52 +1000
Message-ID: <87zh6u7x5b.fsf@mpe.ellerman.id.au>
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>>> On 8/11/20 6:20 PM, Nathan Lynch wrote:
>>>>  
>>>> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
>>>> +{
>>>> +	const unsigned int resched_interval = 20;
>>>> +
>>>> +	BUG_ON(lmb < drmem_info->lmbs);
>>>> +	BUG_ON(lmb >= drmem_info->lmbs + drmem_info->n_lmbs);
>>>
>>> I think BUG_ON is a pretty big no-no these days unless there is no other option.
>>
>> It's complicated, but yes we would like to avoid adding them if we can.
>>
>> In a case like this there is no other option, *if* the check has to be
>> in drmem_lmb_next().
>>
>> But I don't think we really need to check that there.
>>
>> If for some reason this was called with an *lmb pointing outside of the
>> lmbs array it would confuse the cond_resched() logic, but it's not worth
>> crashing the box for that IMHO.
>
> The BUG_ONs are pretty much orthogonal to the cond_resched().

Yes that was kind of my point. We don't need them to implement the
cond_resched() logic.

> It's not apparent from the context of the change, but some users of the
> for_each_drmem_lmb* macros modify elements of the drmem_info->lmbs
> array. If the lmb passed to drmem_lmb_next() violates the bounds check
> (say, if the callsite inappropriately modifies it within the loop), such
> users are guaranteed to corrupt other objects in memory. This was my
> thinking in adding the BUG_ONs, and I don't see another place to do
> it.

If it's really something we're worried about, I think we'd be better off
putting checks for that in the code that's doing those modifications.

That way you have enough context to do something more nuanced than a
BUG(), ie. you can print a useful message and fail whatever operation is
in progress.

If we did that then we could also add those BUG_ONs() as a safety net.

What you really want is a way for the for_each_xxx() construct to
express that there was an error traversing the list, but there isn't
really a nice way to do that in C.

cheers
