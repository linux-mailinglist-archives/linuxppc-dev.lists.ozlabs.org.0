Return-Path: <linuxppc-dev+bounces-2435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E629A5773
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 01:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWvRG3hgFz2yDl;
	Mon, 21 Oct 2024 10:14:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729466090;
	cv=none; b=obiP8Er1GtZV4fcCUwbSqBLnt4HzY6WNGXElW9MXxmNLLA7TLMGEM2GlkBaFKPh8/NQq2FtdOJ7Rkh5q4tQ0dx80rnAY2O/BuANkUn5bKpakW3xqfqWM9IIjnoaQgFM9c6UImT0JYvT0ulh3msuqraWeftaUoo5XDZVx+O8zv57Vv3yXbB7r/1yU1F/d8qzBshE4muMSqKn3pB2geliXvwzGfWw86xO7q775MI1N8pMNVu56Jzp8py18WJj7quinex+dXcPXVU2g7n6PaEGtjW6JN6I6BJe4MNmLDPhsBvcrudK7LU6KFW+Yojkm+1rnebiYmYGsc06/kdbtuqoozA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729466090; c=relaxed/relaxed;
	bh=LYv8Jlhyxtonpahrl8XjdzyQF/3pHAOYiy5K6+wSfkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orcGUwDoujbq9jVnRP4lk+0hXXd0fuDWr6boniid94AJfgL+fmWpaJwxSlPol9fWzGl5VG9LgpwjaOAIEipPcnC4GPDsS6n+/WzslNI7mG5oEHOC/hdbyiP15e5UjX2S/qcJzw+O6BXHiCdbSA6jS68kf8pPZMFUbogz+vpFGGIO9HlstLhHNh4trV++gFnIrIRZDks9rQBtoyJnza7cXzrV/KC3Puh5p+75Yo/trKt4QW6xcCOWuqDqLAkTIRiRBqN1TXVa3sV7cA98HoSjPxtOKybKclkp7gy5vswM2ZAX1n4YZIUirDH1QotUS+QhU9cUAMQR2LSKdOS+VLTXPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OIib+GXw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OIib+GXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWvRF4Mykz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 10:14:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41B405C4571;
	Sun, 20 Oct 2024 23:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601DAC4CEC6;
	Sun, 20 Oct 2024 23:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729466085;
	bh=tA12XoxvMUvELKfHtl27QGe2RJCW4JCHkcSZMuQvvlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIib+GXwgh3i7Z+30p3J7gO6AvgCw0tKmjjuz6i2r5GWN7fILae8fxJjkrMdSeJUZ
	 96aKKS/ME1C64rn36zeucc2F/0AEYO4wZFzAHnRFa1FPQGc/NhFeulmQrD9wwnJ1uq
	 Tnmu3RU1OrHHmugaOtgAR/yKqwArdW/O28x4M5rlFiKKmUWMlywty42ob3YnZNujwq
	 k32drBdKc1htILwgXnL+MmOB+tv8Vxs+PIP+EoC9AHXvcmN+X1Odbol2Lt4TzGRakK
	 Z8aFV3Wzhpeg6hQCJmySlBkdGc4EUY3R4i8YXYpe5NaCdQswo2yEwAbMZRNU0UtA6F
	 Tb7BzvW+9NP3w==
Date: Sun, 20 Oct 2024 16:14:43 -0700
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
Message-ID: <20241020231443.uyqygs6brdgqljxs@treble>
References: <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble>
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
In-Reply-To: <20241020231112.erso2jzqwkbin4kh@treble>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 20, 2024 at 04:11:25PM -0700, Josh Poimboeuf wrote:
> #define FORCE_CANONICAL								\
> 	ALTERNATIVE_2								\
> 	"shl $(64 - 48), %rdx",							\
> 	"shl $(64 - 57), %rdx", X86_FEATURE_LA57,				\
			 ^^^^
			 these should be rax
> 	"", ALT_NOT(X86_FEATURE_LAM)
> 
> #ifdef CONFIG_X86_5LEVEL
> #define LOAD_TASK_SIZE_MINUS_N(n) \
> 	ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
> 		    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx), X86_FEATURE_LA57
> #else
> #define LOAD_TASK_SIZE_MINUS_N(n) \
> 	mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
> #endif
> 
> .macro check_range size
> .if IS_ENABLED(CONFIG_X86_64)
> 	FORCE_CANONICAL
> 	/* If above TASK_SIZE_MAX, convert to all 1's */
> 	LOAD_TASK_SIZE_MINUS_N(size-1)
> 	cmp %rax, %rdx
> 	sbb %rdx, %rdx
> 	or  %rdx, %rax

-- 
Josh

