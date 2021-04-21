Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA693665B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 08:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQB7F5k9Gz302y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 16:52:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FNoseHrP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FNoseHrP; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQB6p6lRDz2y07
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 16:51:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQB6Z68ZCz9tB1;
 Wed, 21 Apr 2021 16:51:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618987895;
 bh=uA2hTlCrBexgLM/6u4kMgngO8YfJd4Ykb4JUjZKiLOQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FNoseHrPAQSKXddjnrEL6cDE1s6S+Hm+CLVb/4BpaSgN06mxeuRX4eVceHmHRJDEy
 kN5ll+6/FQybDyVJsoXOcwlX+sE5+sBAo+fqpCtu0uh1VGYIGr/6Z87V7/CHw70Snq
 awTqhBwLZf6HdQW6zwD2oWDdhOWmaIMxcmJ7/jePr3K09sD5eGE5hH18sN2uJ+ldoF
 NPu/KiFp43rMYxbZl3TUlllzypUx+xyC8gvSOTMEU14nCgxQPn0p28/IPWM1VmkG+e
 1BOfu7ME02YDWopEfXTNz0CiywhWVrqmbBGvoGQEwtsTpreXXAw5yqkoyiOpFcCvrH
 Ed0tkXl240gjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v10 05/10] powerpc/bpf: Write protect JIT code
In-Reply-To: <CACzsE9oERR+KKBe=+eQU1skwTOpDAmi8=_rOMAwM8+LtfBqRKA@mail.gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-6-jniethe5@gmail.com>
 <87wntnwqw9.fsf@mpe.ellerman.id.au>
 <CACzsE9oERR+KKBe=+eQU1skwTOpDAmi8=_rOMAwM8+LtfBqRKA@mail.gmail.com>
Date: Wed, 21 Apr 2021 16:51:30 +1000
Message-ID: <87wnswb05p.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, Nicholas Piggin <npiggin@gmail.com>,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Wed, Mar 31, 2021 at 9:37 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Jordan Niethe <jniethe5@gmail.com> writes:
>>
>> > Once CONFIG_STRICT_MODULE_RWX is enabled there will be no need to
>> > override bpf_jit_free() because it is now possible to set images
>> > read-only. So use the default implementation.
>> >
>> > Also add the necessary call to bpf_jit_binary_lock_ro() which will
>> > remove write protection and add exec protection to the JIT image after
>> > it has finished being written.
>> >
>> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> > ---
>> > v10: New to series
>> > ---
>> >  arch/powerpc/net/bpf_jit_comp.c   | 5 ++++-
>> >  arch/powerpc/net/bpf_jit_comp64.c | 4 ++++
>> >  2 files changed, 8 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> > index e809cb5a1631..8015e4a7d2d4 100644
>> > --- a/arch/powerpc/net/bpf_jit_comp.c
>> > +++ b/arch/powerpc/net/bpf_jit_comp.c
>> > @@ -659,12 +659,15 @@ void bpf_jit_compile(struct bpf_prog *fp)
>> >               bpf_jit_dump(flen, proglen, pass, code_base);
>> >
>> >       bpf_flush_icache(code_base, code_base + (proglen/4));
>> > -
>> >  #ifdef CONFIG_PPC64
>> >       /* Function descriptor nastiness: Address + TOC */
>> >       ((u64 *)image)[0] = (u64)code_base;
>> >       ((u64 *)image)[1] = local_paca->kernel_toc;
>> >  #endif
>> > +     if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
>> > +             set_memory_ro((unsigned long)image, alloclen >> PAGE_SHIFT);
>> > +             set_memory_x((unsigned long)image, alloclen >> PAGE_SHIFT);
>> > +     }
>>
>> You don't need to check the ifdef in a caller, there are stubs that
>> compile to nothing when CONFIG_ARCH_HAS_SET_MEMORY=n.

> As Christophe pointed out we could have !CONFIG_STRICT_MODULE_RWX and
> CONFIG_ARCH_HAS_SET_MEMORY which would then be wrong here.
> Probably we could make CONFIG_ARCH_HAS_SET_MEMORY depend on
> CONFIG_STRICT_MODULE_RWX?

I thought it already did depend on it :)

That seems a reasonable dependency to me.

cheers
