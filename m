Return-Path: <linuxppc-dev+bounces-3462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EED9D5692
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 01:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvbC42Bx0z2xs8;
	Fri, 22 Nov 2024 11:12:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732234352;
	cv=none; b=e+nEadcvPePNQA7wrg7uPS1mjfaqpDYBZ5UXd1bqTBBcbPHy3nkei6jmXPCD5ZqLSLdQvvShgbB0eiTMPVdNlRjN5RykzeqMlzdJ5SjEAC2txcHglL6nsmKQewoPN8lgf8UVKNK+VJEZeINpcofDUDUE/3IKpzGx4i+Eb55xbeWz3SBszDS7GMSZFu4aQ68iVth/cmqhBCrQ0UM9aWi6y+TfQmR87lGz1fkgb9YQ9fRRswbuAIime4B/x0bM8XChOTNKfLwGDCFWZ2ElLQk6zxRSfC7QzhrdvmO41r4njYsA67Y3DuFUEqZl8EVUCf6gt64EEQGP/XYCGjMqn/crBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732234352; c=relaxed/relaxed;
	bh=Wffooz6MUUKYfinOlEoFedgJPZJoAkv0E3EAfQPhHHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI6QGAGlTHzlH6ArXV3AfxHJuPN23B901hC6hMuPenBMF3vE5DuGIE0JHzLfB2K6UTRcm8lQQbvaxow9dnBJynB/OlAfCrPaIRwXTD848PTftNobzTkxXgEnresAoVQ2nL9UkJ7gcY+VfJhSP84+lESOdflQlW1VeMqJ7SALKn0EFGmmylI4Ze/1LO8q6e4Gu0w9VtMdlelC8hUfQAgPW1BRmJGpynqlQcGIOjkEUupdCZ7ZVJJGkGaqQEM0781wrykNJ27enzOAnx9FtujBVSEDKnZ3NsZbGgFHLYvPapHw7rmy+moAaZ3mMbJc8qOvqFqbt0RystkXAkOqwY1+Ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hPvBLq/t; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hPvBLq/t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvbC25sk7z2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 11:12:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4785A41173;
	Fri, 22 Nov 2024 00:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC93C4CECC;
	Fri, 22 Nov 2024 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732234345;
	bh=2bFBvlIANNzsnG/eRsTTpVDynDBFhvmqfTYpO+NZfkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPvBLq/tcrhkeqbB0/yVI/tV87vKr2sAGORr2D8/7v7r7psgNnkWrRvsPMYebv6B2
	 15ElUn+MQL4/txvkJztS1pG4/PTqHZ25X7wEF75z0NtuJ8AhSqgxRgz/iNjTzVHmfj
	 +7tCWlKvdv4+8JeotVLkfoKkXJ5C0a0rXTS6ySeSTjs4b4ZiSqvBgQ619jtBtkjAHt
	 4YketKrp4iZOdc6kmaiMWZ92avl2P3NJdvei+7Bjmp69wv7cXYrVxtU9KxEbEIJzM9
	 Oh11rkkHbJnHNHlktaJU8sn665wD8gti5WM3rn681061IaA3SISQH3bSasqZW4AxnE
	 fgaZSQpXRci9A==
Date: Thu, 21 Nov 2024 16:12:23 -0800
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
Message-ID: <20241122001223.t4uywacusrplpefq@jpoimboe>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
 <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
 <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe>
 <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
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
In-Reply-To: <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 21, 2024 at 02:16:12PM -0800, Linus Torvalds wrote:
>     mov    %gs:0x0,%rax                 # current
>     incl   0x1a9c(%rax)                 # current->pagefault_disable++
>     movabs $0x123456789abcdef,%rcx      # magic virtual address size
>     cmp    %rsi,%rcx                    # address masking
>     sbb    %rcx,%rcx
>     or     %rsi,%rcx
>     stac                                # enable user space acccess
>     mov    (%rcx),%ecx                  # get the value
>     clac                                # disable user space access
>     decl   0x1a9c(%rax)                 # current->pagefault_disable--
>     mov    %ecx,(%rdi)                  # save the value
>     xor    %eax,%eax                    # return 0
>     ret

The asm looks good, but the C exploded a bit... why not just have an
inline get_user()?

> If you can test this and verify that it actually help, I'll take it as
> a patch. Consider it signed-off after testing.

Let me see if I can recreate the original report (or get the automatic
testing to see the commit).

> > Also, is there any harm in speeding up __get_user()?  It still has ~80
> > callers and it's likely to be slowing down things we don't know about.
> 
> How would you speed it up?  We definitely can't replace the fence with
> addressing tricks. So we can't just replace it with "get_user()",
> because of those horrid architecture-specific kernel uses.

I'm not sure if you saw the example code snippet I posted up-thread,
here it is below.

It adds a conditional branch to test if it's a user address.  If so, it
does pointer masking.  If not, it does LFENCE.  So "bad" users get the
slow path, and we could even add a WARN_ON().

Yes, another conditional branch isn't ideal, but it's still much faster
than the current code, and it would root out any bad users with a
WARN_ON() so that eventually it can just become a get_user() alias.

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

-- 
Josh

