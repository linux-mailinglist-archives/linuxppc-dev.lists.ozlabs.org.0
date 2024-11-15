Return-Path: <linuxppc-dev+bounces-3308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34B9CFAD7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 00:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqt2F3lnXz3c9w;
	Sat, 16 Nov 2024 10:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731712021;
	cv=none; b=N2Fvu7XzXPSytw9LiBfuG0BukKUyBDge7LRAhP4ysOY9JtGl8RFJzsjgXz0/uWGjI7KlRgpsQSADV3RFiI5sMeTitwcm11MKVdksAbe/mvzrdSDvEixxyDhILlvsYtXQx11Jp+PuvB46b4ezkAc8oOpXKF3lKZckXvZS+kx+qZOyneroVvUjxbtA+SsgCmuOb35C4ra4Pg7O5mhUZixVof+0x0h8UbfMhxn/tHyiT88uT40WDW99RYTPo7JUsZ/qvQpo+SyCFGyScFJRT7A9iX2lxMn90nz1uxXoUa45Qt/SayczYib1tcwgf8Ah59RZ2W2Tm9bGNtfEYndkseZF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731712021; c=relaxed/relaxed;
	bh=O2b6SQKDGCTDaWI7zM3wBlzVvKv6BpSCpo7XXu0XVQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPHk2UL633gXRJZG5RlrdF1gF30ijlL/1b38M5PEW+2BFSPKy0SvbsV85Ohj3LCQyUa+wvi2s4uApqFUXq1Erfx1XzBDPVb1vKhO9GOjX6sy/WeaXAuPjRjd3sTPqvtj6gHS/LviC6bCKywup4DgIRxbRbdjddM94tEpCV7S49UFJSQ4v0talNQ9XGMnxIzz3+BsWYLdFaFMZpL+bKqNehPs/ZnqgX2ssLvquRVKOkSdgwPb7VPV/XfnunfvuCsMUeP6t1GeWFw9+mE4BBwk91yHHqzqlVatV2UX6aOcqVPX20HqnOHE75+2ghO2OQycWb+EKZ6sNfsSpUZt/qHD+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9mcKu5p; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9mcKu5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xqt2C5CzWz3c8w
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 10:06:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B889AA41DE8;
	Fri, 15 Nov 2024 23:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931C0C4CECF;
	Fri, 15 Nov 2024 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731712016;
	bh=cjtwl0gGLi5MSlCyLv07Q+lWF52r2XQCMliJF3VOZDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9mcKu5pi9ubrMvJHG/FOv0+CJuVSkiPA+ZjL+u4TAzs1YScuoISsPqL2Rn1s1NtP
	 pg9gtVw3yENCC8pGssa+sJVTz/1g13Y4Yg3XP6jLseFdqUrMWAjX12mN7D9PpHgdid
	 j8MDI7ItYrOiAB7sjRqm3rlKO86nBEBPRScXP58/vDV0S/dDCLI+vC4vk+HsjwYK8u
	 oaRmIKxuQPkHnkCpjcq5ZRVvM7A9fVHBfyfInCgGPdYk2EcSY/KuMWEnZHFDymZRpJ
	 9WbnUBP0YT5+xnipx4Uiwbo78LeY9+dG9YrDhgqkQbXtilqfqNM4mhiAUk76yD6ivX
	 nbvGqPJKvG0sg==
Date: Fri, 15 Nov 2024 15:06:53 -0800
From: 'Josh Poimboeuf' <jpoimboe@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Cc: "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Message-ID: <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
 <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
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
In-Reply-To: <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 08, 2024 at 05:12:53PM +0000, David Laight wrote:
> From: Josh Poimboeuf
> > On Mon, Oct 28, 2024 at 06:56:15PM -0700, Josh Poimboeuf wrote:
> > > The barrier_nospec() in 64-bit __get_user() is slow.  Instead use
> > > pointer masking to force the user pointer to all 1's if a previous
> > > access_ok() mispredicted true for an invalid address.
> > 
> > Linus pointed out that __get_user() may be used by some code to access
> > both kernel and user space and in fact I found one such usage in
> > vc_read_mem()....

.. which sucks because I got a "will-it-scale.per_process_ops 1.9%
improvement" report for this patch.

It's sad that __get_user() is now slower than get_user() on x86, it kind
of defeats the whole point!

I know at least the "coco" code is misusing __get_user().  Unless
somebody wants to audit all the other callers, we could do something
horrific:

.macro __get_user_nocheck_nospec
#ifdef CONFIG_X86_64
	movq $0x0123456789abcdef, %rdx
 1:
.pushsection runtime_ptr_USER_PTR_MAX, "a"
	.long 1b - 8 - .
.popsection
	cmp %rax, %rdx
	jb 10f
	sbb %rdx, %rdx
	or %rdx, %rax
	jmp 11f
10:	/*
	 * Stop access_ok() branch misprediction -- both of them ;-)
	 *
	 * As a benefit this also punishes callers who intentionally call this
	 * with a kernel address.  Once they're rooted out, __get_user() can
	 * just become an alias of get_user().
	 *
	 * TODO: Add WARN_ON()
	 */
#endif
	ASM_BARRIER_NOSPEC
11:
.endm

/* .. and the same for __get_user, just without the range checks */
SYM_FUNC_START(__get_user_nocheck_1)
	__get_user_nocheck_nospec
	ASM_STAC
	UACCESS movzbl (%_ASM_AX),%edx
	xor %eax,%eax
	ASM_CLAC
	RET
SYM_FUNC_END(__get_user_nocheck_1)
EXPORT_SYMBOL(__get_user_nocheck_1)

Yes, I know adding another access_ok() is bad, but it would be a
definite speedup.  And adding a WARN_ON() would root out any other bad
callers pretty quick.

> But I've wondered if access_ok() ought to be implemented using an
> 'asm goto with output' - much like get_user().
> 
> Then the use would be:
> 	masked_address = access_ok(maybe_bad_address, size, jump_label);
> with later user accesses using the masked_address.
> 
> Once you've done that __get_user() doesn't need to contain address masking.

Sure, we just need a volunteer to change all the access_ok() implementations
and callers tree-wide ;-)

> Given that clac/stac iare so slow should there are be something that
> combines stac with access_ok() bracketed with a 'user_access_end'
> or an actual fault.
> 
> I've sure there is code (maybe reading iovec[] or in sys_poll())
> that wants to do multiple get/put_user in a short loop rather that
> calling copy_to/from_user().

We already have this with user_access_begin() + unsafe_get_user().
There's also a version which masks the address: masked_user_access_begin().

We just need to start porting things over.

-- 
Josh

