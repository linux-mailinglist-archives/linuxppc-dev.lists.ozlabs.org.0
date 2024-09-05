Return-Path: <linuxppc-dev+bounces-1062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046296DF87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 18:26:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X04VP53dvz2yZ1;
	Fri,  6 Sep 2024 02:26:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725553565;
	cv=none; b=ZRYl3tPfb3iQj4SO1dKvJJdjsrBGfsPpA2Shk6BvGAHAX/tYdH5SBNJlDewkCd2PFvHojx63TIElhjLpn32q/esdUoYXqs5FICbqDT4m4GsZLn7NoEvkEMoXbxNQF1vybe4WZyJ9DhfT0QM9dlvAfIIjWJxan7T9+DQ7EK5WzmIUidVIIlv+r3IpQ3JH9NCfRIRvNdbhmHwk8299XzRJRqzaSai1VWZwLPIM6Dp+wGVY97Gyg61I3LeySNs7wy9u5bBv0SuqvxXSsy0qrqkMXLlDblMLbUl4y5L9M2B7T+CP0U9OXE3kCMpJJ0xmGjnM8oxL9/DyCTYZH3jsI91gqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725553565; c=relaxed/relaxed;
	bh=Do5c7CrlVBzR36eawPZjFAYUfW38c/yV0aaPlAdI/7A=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=h++Xm38cEEmzAaCxHflFRQiOghZy64BBtvEzE0uso0B6UAhnsYbzPkPmpWFN1pHa2q/X0sTs6STrcabYJvNv5K+JPfk1PRoYU1EP4bqVqPPmG4LbxjusKvaQCPvh3fq6pJwaJUSyKxAmyz8EM+xg4qpFOav7pX/mDVfZG2tYlgJuexvcrdai6ke2pS7c4IaCsF39iyhVJre7eCJmM6f8/pEgE20cVa8PXu9b2q+ft5v+O3EDOXSN9UNbT3TBjuMDDLNCxDpMyFTYoVaJJKGEk2EGWHDGcLgMIJTUJrN5EkBiPj1rLP3zQ8DyzXN/O4bzB6szLUqZVYkbes9goGQtUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=OfohRmW0; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=OfohRmW0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X04VP281Fz2yYn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 02:26:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB9DA5C5CDD;
	Thu,  5 Sep 2024 16:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105BDC4CEC3;
	Thu,  5 Sep 2024 16:26:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OfohRmW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725553559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Do5c7CrlVBzR36eawPZjFAYUfW38c/yV0aaPlAdI/7A=;
	b=OfohRmW0WWscsD/JbTMstie8DVPRfEAqdaxZ27+GxqvEjuSGKwxn0kbesvOhuICjN3ybwq
	3R0FYa3E+HE9NtOmaumJansW+znH81xpDSD6MPUoeZ+BS+3WOO/H96HFll09YpYrzPMaM8
	4Nv4waMmBPxUr5ME5qAf6J0j5YD7U7Y=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da9a2d0b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 16:25:59 +0000 (UTC)
Date: Thu, 5 Sep 2024 18:25:55 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v5 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on VDSO32
Message-ID: <ZtnbkxV8exv1F3H9@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
 <ZtnYqZI-nrsNslwy@zx2c4.com>
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
In-Reply-To: <ZtnYqZI-nrsNslwy@zx2c4.com>

On Thu, Sep 05, 2024 at 06:13:29PM +0200, Jason A. Donenfeld wrote:
> > +/*
> > + * The macro sets two stack frames, one for the caller and one for the callee
> > + * because there are no requirement for the caller to set a stack frame when
> > + * calling VDSO so it may have omitted to set one, especially on PPC64
> > + */
> > +
> > +.macro cvdso_call funct
> > +  .cfi_startproc
> > +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> > +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> > +	mflr		r0
> > +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> > +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> > +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> > +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
> > +	get_datapage	r8
> > +	addi		r8, r8, VDSO_RNG_DATA_OFFSET
> > +	bl		CFUNC(DOTSYM(\funct))
> > +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> > +	cmpwi		r3, 0
> > +	mtlr		r0
> > +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> > +  .cfi_restore lr
> > +  .cfi_def_cfa_offset 0
> > +	crclr		so
> > +	bgelr+
> > +	crset		so
> > +	neg		r3, r3
> > +	blr
> > +  .cfi_endproc
> > +.endm
> 
> You wrote in an earlier email that this worked with time namespaces, but
> in my testing that doesn't seem to be the case.
> 
> From my test harness [1]:
> 
> Normal single thread
>    vdso: 25000000 times in 12.494133131 seconds
>    libc: 25000000 times in 69.594625188 seconds
> syscall: 25000000 times in 67.349243972 seconds
> Time namespace single thread
>    vdso: 25000000 times in 71.673057436 seconds
>    libc: 25000000 times in 71.712774121 seconds
> syscall: 25000000 times in 66.902318080 seconds
> 
> I'm seeing this on ppc, ppc64, and ppc64le.
> 
> Can you figure out what's going on and send a fix, which I'll squash
> into this commit?

Also, FYI, I've verified that things do work on x86_64, loongarch64,
arm64, and arm64_be. It's just the ppc archs that are broken. So this
test _is_ a good one.

