Return-Path: <linuxppc-dev+bounces-3459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 706E89D54D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 22:40:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvWqQ08dPz2xmk;
	Fri, 22 Nov 2024 08:40:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732225217;
	cv=none; b=RmdndcnVbe67LDhImF2od6LhsparOLs7PUwPyjb13aETwuTHRjUTrIiewiscKfHoC217syXzRPN00eTlFcUeT5dY0sn3Tpmk1uJZZquNpw4YeYBLknvoC39UAC4Ul6i1HK/obhwHNvPuekDSZ5tRRZ/lKSKk3VzWcG2SW6tjK/gerPI8H8lpUm4cFd60fZc1iLsLcHLI0lfg7rcWJOnuKBKw12SpGzW5rzPkyVRAGiqoY7H9o2cnKm1pxNSXbvEJStMw1ze4m/q6U1tMCPPIQoC6bpGBsouxGYpl6z7VFU0UOljCLmCyvB6C7KC/YetXT3J2E0vR8nqdZpZlY6NnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732225217; c=relaxed/relaxed;
	bh=tUlDqsmScfRNNP4t4k0RiGyBwkSA7uedERSBrKthpbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGFDhUZNsbN4sLzVnm9EhL4lAND1Cz56XZ689UxQVyy8TL8oO97QVH7t0PlMZVPqCZrvdJfw3owc+ECcpcmILjge8GQUocAK0cMDcsh82hMWeyi1z0ZNomJVBHczfg89jbePhonR6s8NR70jMlZwa+DjJKXJQsW4SRt0mSG9UXmaA15Wzr6RzlrX3JW3LSo2D0ZhWWHN6d7ANnNsXpp0dKgH8aqKmUc5WRru3QbOqhc2AlFq674wTvgPB5PWLSA6XgaPGP0x4x3VjhZyY3ZnjV+c4bI1KMPKfGCT48iyR+DMisZbVTuH5Zz8TlnHmT1aB21qsx7e6mJjSSYxQ8ka5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPAx1iPK; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPAx1iPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvWqP0VLNz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 08:40:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A72DCA4105A;
	Thu, 21 Nov 2024 21:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1210BC4CECC;
	Thu, 21 Nov 2024 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732225213;
	bh=kUQoBpfy9drWBz+xkzp4tToFKNmUtfxu9U4gcNzJquY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPAx1iPKIWYlSUmgWbfqfbeot57JMkGh/1uNUBmkDIyv5bBAf4HmIiUcszb24ykkq
	 xs9P/xjLF4kKANQTlhmfnvGi5miDKWm9710SkmX+0CipOcUrv37yuXmArLABZ5/SUs
	 hW0DP/12rKdpnT9SdpPx6sPkYQhkS+R5a2nHRhTQjBorsfcim10M1Xw1v4m6Y3UJ55
	 ViKKbr2Eq2F8GohAiQQxH1b0lXqtl/4GmjeNE0HY54AKjW7sJ5t5hpCKEvhXvpv0Nx
	 A96TF4+jJxr0dnJUJ5c+ozhLb0nqm0wEeRJcNMlqq8G7JFVbFMhR4m6A8jWf1p5jgH
	 Mt112xwNmSuuA==
Date: Thu, 21 Nov 2024 13:40:11 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Message-ID: <20241121214011.iiup2fdwsys7hhts@jpoimboe>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
 <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
 <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> On Fri, 15 Nov 2024 at 15:06, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> So I think the thing to do is
> 
>  (a) find out which __get_user() it is that matters so much for that load
> 
> Do you have a profile somewhere?
> 
>  (b) convert them to use "unsafe_get_user()", with that whole
> 
>                 if (can_do_masked_user_access())
>                         from = masked_user_access_begin(from);
>                 else if (!user_read_access_begin(from, sizeof(*from)))
>                         return -EFAULT;
> 
>      sequence before it.
> 
> And if it's just a single __get_user() (rather than a sequence of
> them), just convert it to get_user().
> 
> Hmm?

The profile is showing futex_get_value_locked():

int futex_get_value_locked(u32 *dest, u32 __user *from)
{
	int ret;

	pagefault_disable();
	ret = __get_user(*dest, from);
	pagefault_enable();

	return ret ? -EFAULT : 0;
}

That has several callers, so we can probably just use get_user() there?

Also, is there any harm in speeding up __get_user()?  It still has ~80
callers and it's likely to be slowing down things we don't know about.

It's usually only the regressions which get noticed, and that LFENCE
went in almost 7 years ago, when there was much less automated
performance regression testing.

As a bonus, that patch will root out any "bad" users, which will
eventually allow us to simplify things and just make __get_user() an
alias of get_user().

In fact, if we aliased it for all arches, that could help in getting rid
of __get_user() altogether as there would no longer be any (real or
advertised) benefit to using it.

-- 
Josh

