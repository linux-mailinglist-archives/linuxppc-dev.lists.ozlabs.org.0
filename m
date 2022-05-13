Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626F525BA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 08:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzzTv1RVvz3cCW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 16:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SI15G+ne;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzzTH2J3Wz3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 16:37:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SI15G+ne; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KzzTG1XWDz4xXJ;
 Fri, 13 May 2022 16:37:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652423827;
 bh=wBZd5augCd9NCYq5BTfS1YbWd+KJyjpYKVecpVbN/6g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SI15G+ne6/Z/NZFtvbriZ6NWicBjyIg3iO8mQ+glJzXsMTiVVJ/wUhDE7z3qiV8Hu
 WB9rE6cXIUDANJg4KFDmQkBUa5O8UkjcMe+cIbxBhbP8yOeg6wcNeSfJRXVsjl8jDc
 HZM6WqnE/B8Mt3FXefXZ+829wteXDp6hcBzM19fCRu80T7TWwu4/tQ+8UxtdUeG8Y9
 DmKkrv5BJxLSATPjYVMW/mNfgZRPdZSCcsPbrLPK8mJbjVxjYWnAka8DfOIXICZ/6T
 6fXK96g0A2uTyhaPuJRDtZwfM0DZ0zU4sLRaxySXmIbX1snWwJzhC6gKrdNZciiNUY
 oaOKcwnOIWKjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Borkmann <daniel@iogearbox.net>, Hari Bathini
 <hbathini@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/5] Atomics support for eBPF on powerpc
In-Reply-To: <21577e77-9860-7746-235e-8c241b4a8a7a@iogearbox.net>
References: <20220512074546.231616-1-hbathini@linux.ibm.com>
 <21577e77-9860-7746-235e-8c241b4a8a7a@iogearbox.net>
Date: Fri, 13 May 2022 16:37:04 +1000
Message-ID: <87h75u6ir3.fsf@mpe.ellerman.id.au>
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
Cc: Song Liu <songliubraving@fb.com>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Jordan Niethe <jniethe5@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Borkmann <daniel@iogearbox.net> writes:
> On 5/12/22 9:45 AM, Hari Bathini wrote:
>> This patchset adds atomic operations to the eBPF instruction set on
>> powerpc. The instructions that are added here can be summarised with
>> this list of kernel operations for ppc64:
>> 
>> * atomic[64]_[fetch_]add
>> * atomic[64]_[fetch_]and
>> * atomic[64]_[fetch_]or
>> * atomic[64]_[fetch_]xor
>> * atomic[64]_xchg
>> * atomic[64]_cmpxchg
>> 
>> and this list of kernel operations for ppc32:
>> 
>> * atomic_[fetch_]add
>> * atomic_[fetch_]and
>> * atomic_[fetch_]or
>> * atomic_[fetch_]xor
>> * atomic_xchg
>> * atomic_cmpxchg
>> 
>> The following are left out of scope for this effort:
>> 
>> * 64 bit operations on ppc32.
>> * Explicit memory barriers, 16 and 8 bit operations on both ppc32
>>    & ppc64.
>> 
>> The first patch adds support for bitwsie atomic operations on ppc64.
>> The next patch adds fetch variant support for these instructions. The
>> third patch adds support for xchg and cmpxchg atomic operations on
>> ppc64. Patch #4 adds support for 32-bit atomic bitwise operations on
>> ppc32. patch #5 adds support for xchg and cmpxchg atomic operations
>> on ppc32.
>
> Thanks for adding these, Hari! I presume they'll get routed via Michael,
> right?

Yeah I'm happy to take them if they are OK by you.

I do wonder if the BPF jit code should eventually move out of arch/, but
that's a discussion for another day.

> One thing that may be worth adding to the commit log as well is
> the test result from test_bpf.ko given it has an extensive suite around
> atomics useful for testing corner cases in JITs.

Yes please, test results make me feel much better about merging things :)

cheers
