Return-Path: <linuxppc-dev+bounces-2434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B89A5772
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 01:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWvMQ2b7Zz2yDT;
	Mon, 21 Oct 2024 10:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729465890;
	cv=none; b=Mk525IKnLXXygSOq5UBg+BcknvtavxFfCyBKKg+mgFkFFN5PZA6GNN+JfCCcPOtVEMmIPkN3GMBnkd0kXO5ps0WJyx+4H/myvtEBU8/dTLq++G2C+mdEhqSkUYIAjRRdce0EH/Pj6UEd5//8AnHfjLLToWHB9wVkmVlkXABQIhypjuKPcb5ueSbR/1IftVFrVQ/xJRmpq1txoNGI9OWdn8PwZc7I+KZlsSPnGcgrsMJcXVvP81vAQY06mwZfdnqS+oWhFNH29ExSzT3Z/p8BUTsN4T/bPV4NPicFvUDhKCKuNyL1zFSSyBQ6/pjsWodW/YEIwAv+Bat43DfYHF/PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729465890; c=relaxed/relaxed;
	bh=oCjC1Hok6afdzAbhzMI2BN7qbDL8yh2eNEpNbKKPMro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQptnVNjNQiXKCeGRamGL+f5PUhnILV4Aka7+DKllTSWrSXG7F13a+/ady83/uaoqQYHsEFZhbmZwe62Oig1ryYb6bpM7iHax1XwKvBQk6DUmsZO8B8fiqhz/mpeyqY7nwNT8IRq/dS9bdJI5fIfgxUd6gTUTd3qUKr+/ZCTjPdKgLqeUCFzMFzsquAOvnD5By/RhLy9FuVHrJDu7+ecZFS0Gd6uCrqGeaTf2Ezv10WuAKT7p5CqbCpgY0On7jY9KDNOLJDd7so3Z6ey42rWf+xKaPOtNg0UD9J+tixgtq3ijQT09B+wzWWkx1tJXBHxsGHsbuYbe/tGEUBmHuo8dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vu8GXzd/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vu8GXzd/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWvMN72Mkz2xg3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 10:11:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 436525C5420;
	Sun, 20 Oct 2024 23:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965DEC4CEC6;
	Sun, 20 Oct 2024 23:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729465885;
	bh=WBPlnyP520hZQjLc4tUWJ5hPrqdpuTPCsmDnPbNCaQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vu8GXzd/CV05TUgEN+N8mjRse4guzmRSwin+nXWtbvzEBCuvKJZJj9pUd8SVzr9uN
	 ERe9XoKG+ZNtQ7tvpGP6w2TecRfzUIihsbfs/rh6A3/Q1cm+SxJTdIOgd6PVchjaBh
	 gPTX5pz0GpcARkcaZdg6KaMgD4VCFpjjZGG43EKiKcYo8L9CaDSyXGqS+uAdVWGMYM
	 HKxpWUK7ZlGuvY3oZO+jxxs94cqnhxEX7QvdwcaHfTqsGlQk8N+kDoiRdcS0162f8l
	 VqsQbjElyZfzJurQtyM5U2BpsYOK7IWbhiByobxb6MPtQchcaT9o3qsgtSRsKGF+MO
	 1VPrR+UHt3qiw==
Date: Sun, 20 Oct 2024 16:11:12 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241020231112.erso2jzqwkbin4kh@treble>
References: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 20, 2024 at 03:59:25PM -0700, Linus Torvalds wrote:
> On Sun, 20 Oct 2024 at 15:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > Anyway, I'd really like to make forward progress on getting rid of the
> > LFENCEs in copy_from_user() and __get_user(), so until if/when we hear
> > back from both vendors, how about we avoid noncanonical exceptions
> > altogether (along with the edge cases mentioned above) and do something
> > like the below?
> 
> That doesn't work for LAM at _all_.

Argh, ok.

> So at a minimum, you need to then say "for LAM enabled CPU's we do the
> 'shift sign bit' trick".

Something like below to wipe out the LAM bits beforehand?

I'm probably overlooking something else as there are a lot of annoying
details here...

> Hopefully any LAM-capable CPU doesn't have this issue?
> 
> And I still think that clac/stac has to serialize with surrounding
> memory operations, making this all moot.

Until it's s/think/know/ can we please put something in place?


#define FORCE_CANONICAL								\
	ALTERNATIVE_2								\
	"shl $(64 - 48), %rdx",							\
	"shl $(64 - 57), %rdx", X86_FEATURE_LA57,				\
	"", ALT_NOT(X86_FEATURE_LAM)

#ifdef CONFIG_X86_5LEVEL
#define LOAD_TASK_SIZE_MINUS_N(n) \
	ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
		    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx), X86_FEATURE_LA57
#else
#define LOAD_TASK_SIZE_MINUS_N(n) \
	mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
#endif

.macro check_range size
.if IS_ENABLED(CONFIG_X86_64)
	FORCE_CANONICAL
	/* If above TASK_SIZE_MAX, convert to all 1's */
	LOAD_TASK_SIZE_MINUS_N(size-1)
	cmp %rax, %rdx
	sbb %rdx, %rdx
	or  %rdx, %rax

