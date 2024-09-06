Return-Path: <linuxppc-dev+bounces-1073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7099D96E82D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 05:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0M6D1fGsz2yvq;
	Fri,  6 Sep 2024 13:24:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725593076;
	cv=none; b=dLV2KL3POD/FUk2IOFzEd3GxMAdr/NB2lBbA2YjQnNTDiZFazwioG0SOASJUFKF7f2mC5OSH8+P/hp3AwY4/OoM9u88yGUDrt4Qtm+w8gJdDKjDxm+zHXe7bhzmjVCrWt0Pez1tPKLZfZ713yAng9DQia4UtCDlVUDktaeq8byD45FHO0/bUbMDhW5IMZyvKJN7SDwWWaIHc+aOdrX3Nbt4dY3ccpeY52N2MUhFkqZlfrMGHi//O8opNCe63BuB1X80CZtJGBNkhCll4VBnnCDw9Awmre+YeXpTLJeQn45iNiLyUuTQ5y1Dba/168tnbFMKu6WeXmH7F/MTY+XC54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725593076; c=relaxed/relaxed;
	bh=Z2dxDPKKa2YK6AR5mLMyQ8i6dADRrELxYn6efyeudEY=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=kEIm/F3WPa0iZtI1In4DYa05nnC+yJtdBpOmk71lDITaI+npdWpEAPdah6rQzYlTrcd9h/GYUm7DyE+TQ1huJmH6gEeLRAPHuD2czu8B1gtfUlkN9jSaYbwf2w8C4BUQO1/hm1R6SiS/2jb3EwE0Pzn527CIg40DXDedzShC8kQmBcFMWNzAqdcxDj+RHDhEE488eN0cK1NmiEBrFydz/xNpOVS+SPLj+jC7gU0KiidvTaI2f+TYUq8F1YS6oE2iOpJp9OpOn53v2K78A0dlheBvDa4VxZlZLU3xiOA2Zvx+0wIR2GKYv03Ei5/VXTKR9/4QAMDbDAyIDA2Q5am1qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lWXUkZvb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lWXUkZvb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0M6C5lmvz2y65
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 13:24:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27E575C5A9F;
	Fri,  6 Sep 2024 03:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC162C4CEC3;
	Fri,  6 Sep 2024 03:24:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lWXUkZvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725593069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2dxDPKKa2YK6AR5mLMyQ8i6dADRrELxYn6efyeudEY=;
	b=lWXUkZvbvlbUyOMCWA1zuc7ad4c+I0UJcawqwTucUHLSLfjSoDcXGiWc2V7qkYM6p9qDOE
	xqMX7fe/Xfh9D0076bwd4NPqJu9BUto8QUy3Vo/4JDK4c4+j1HrSQbP9/ilbY+G0btPrj7
	0Zg0qZDITzK9zGSnoBQ0QQgntbqq/qk=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 182a6eb3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 03:24:28 +0000 (UTC)
Date: Fri, 6 Sep 2024 05:24:24 +0200
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
Message-ID: <Ztp16FkqG0ALlXnh@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
 <ZtnYqZI-nrsNslwy@zx2c4.com>
 <ZtoXhGYflBNR74g0@zx2c4.com>
 <ZtptfOicjZU3k3ZV@zx2c4.com>
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
In-Reply-To: <ZtptfOicjZU3k3ZV@zx2c4.com>

On Fri, Sep 06, 2024 at 04:48:28AM +0200, Jason A. Donenfeld wrote:
> On Thu, Sep 05, 2024 at 10:41:40PM +0200, Jason A. Donenfeld wrote:
> > On Thu, Sep 05, 2024 at 06:13:29PM +0200, Jason A. Donenfeld wrote:
> > > > +/*
> > > > + * The macro sets two stack frames, one for the caller and one for the callee
> > > > + * because there are no requirement for the caller to set a stack frame when
> > > > + * calling VDSO so it may have omitted to set one, especially on PPC64
> > > > + */
> > > > +
> > > > +.macro cvdso_call funct
> > > > +  .cfi_startproc
> > > > +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> > > > +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> > > > +	mflr		r0
> > > > +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> > > > +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> > > > +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> > > > +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
> > > > +	get_datapage	r8
> > > > +	addi		r8, r8, VDSO_RNG_DATA_OFFSET
> > > > +	bl		CFUNC(DOTSYM(\funct))
> > > > +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> > > > +	cmpwi		r3, 0
> > > > +	mtlr		r0
> > > > +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> > > > +  .cfi_restore lr
> > > > +  .cfi_def_cfa_offset 0
> > > > +	crclr		so
> > > > +	bgelr+
> > > > +	crset		so
> > > > +	neg		r3, r3
> > > > +	blr
> > > > +  .cfi_endproc
> > > > +.endm
> > > 
> > > Can you figure out what's going on and send a fix, which I'll squash
> > > into this commit?
> > 
> > This doesn't work, but I wonder if something like it is what we want. I
> > need to head out for the day, but here's what I've got. It's all wrong
> > but might be of interest.
> 
> Oh, I just got one small detail wrong before. The below actually works,
> and uses the same strategy as on arm64.
> 
> Let me know if you'd like me to fix up this commit with the below patch,
> or if you have another way you'd like to go about it.

And here's the much shorter version in assembly, which maybe you prefer.
Also works, and is a bit less invasive than the other thing.

diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index a957cd2b2b03..070daba2d547 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -32,6 +32,14 @@
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
 	get_datapage	r8
+#ifdef CONFIG_TIME_NS
+	lis		r10, 0x7fff
+	ori		r10, r10, 0xffff
+	lwz		r9, VDSO_DATA_OFFSET + 4(r8)
+	cmpw		r9, r10
+	bne		+8
+	addi		r8, r8, (1 << CONFIG_PAGE_SHIFT)
+#endif
 	addi		r8, r8, VDSO_RNG_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)


