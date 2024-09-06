Return-Path: <linuxppc-dev+bounces-1072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3E96E7DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 04:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0LJr0bxgz2ytR;
	Fri,  6 Sep 2024 12:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725590924;
	cv=none; b=CbajZ3YUxp1pHkFoIGw5wNAwWm8RCVbMtLKovLkXI9BbTmXpM9PF5CDqpr7EMtLdUsxikgwHR1TuVwQMsKMsFi6TKXMDWQfxM6dxY2ISuztEfcZRMd++70ObN5ajffNGTG0co8bolVnvfGhym4xg7DZ2fKv4a5bt7xOfoRKapH/xkRwLV05IGmFM0yhZbI5BODILUbRdojyBL+PTcJgAHEMo7tY9jItDBFsKTQn1kSEwnHl0d9Sik82+q9wsmRDfLqkPhuTz1v+zz6q6mKgUlORQDFTtOoI121B9sEz2duOLZmUoddHTDQ5pRrjUSXosUHOlRqYnk3OKVlGFVCs/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725590924; c=relaxed/relaxed;
	bh=GDin/TTzmHCatsL5YEP7qml5EKwCyw3+unP9HsNBBks=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=ZlCXD2OA07eGAIyPHjJ1ucr7VSem+0qYlufGtpUhJrHNHejnusZrqkBwAOqRx1oaMlNbZUL5Zy9x5dlW5/48La5+aIqr+HvNlQ3rw/WFVII2VB3BKkgerTUv0aqHAWJ2Xuink5iK/ZWLl2jORa9lUORgtnDeQMCK4o9OQctdjs7MsHViwAweIraGIhWZtvYYmA7NeOjxoprB/q2xlnVlOMW3i1c+EMVBd2RBQumud2iqO0tSfLqHJf/3BENUdqAHz+1d/0Wj13yO9t0Bg7FKKql29BxCXkJCS9gd13bALAtgEjPWg5IF61BIL4T4fGsibAVSOmuWNYtdZ1Swc5DqEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=bRX4+VzE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=bRX4+VzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0LJn5P9Pz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 12:48:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A74E45C5976;
	Fri,  6 Sep 2024 02:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754BFC4CEC3;
	Fri,  6 Sep 2024 02:48:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bRX4+VzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725590913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDin/TTzmHCatsL5YEP7qml5EKwCyw3+unP9HsNBBks=;
	b=bRX4+VzElx6AhF7yIERy0JoxrcqZ8w2XnNUX4cySvATmmNIgFgKdGdfDY+DT1KfFqexJRX
	9BvfkivoCdg2WCBNWf5LjK2iwqnwDbLFu2UJPBepJhXrsh39RcDJ68oyyRJJCk1qgWS81f
	K191Ft9MxUKb0Efd83zvLBnDi2pl2n4=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ee168b6 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 02:48:32 +0000 (UTC)
Date: Fri, 6 Sep 2024 04:48:28 +0200
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
Message-ID: <ZtptfOicjZU3k3ZV@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
 <ZtnYqZI-nrsNslwy@zx2c4.com>
 <ZtoXhGYflBNR74g0@zx2c4.com>
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
In-Reply-To: <ZtoXhGYflBNR74g0@zx2c4.com>

On Thu, Sep 05, 2024 at 10:41:40PM +0200, Jason A. Donenfeld wrote:
> On Thu, Sep 05, 2024 at 06:13:29PM +0200, Jason A. Donenfeld wrote:
> > > +/*
> > > + * The macro sets two stack frames, one for the caller and one for the callee
> > > + * because there are no requirement for the caller to set a stack frame when
> > > + * calling VDSO so it may have omitted to set one, especially on PPC64
> > > + */
> > > +
> > > +.macro cvdso_call funct
> > > +  .cfi_startproc
> > > +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> > > +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> > > +	mflr		r0
> > > +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> > > +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> > > +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> > > +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
> > > +	get_datapage	r8
> > > +	addi		r8, r8, VDSO_RNG_DATA_OFFSET
> > > +	bl		CFUNC(DOTSYM(\funct))
> > > +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> > > +	cmpwi		r3, 0
> > > +	mtlr		r0
> > > +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> > > +  .cfi_restore lr
> > > +  .cfi_def_cfa_offset 0
> > > +	crclr		so
> > > +	bgelr+
> > > +	crset		so
> > > +	neg		r3, r3
> > > +	blr
> > > +  .cfi_endproc
> > > +.endm
> > 
> > Can you figure out what's going on and send a fix, which I'll squash
> > into this commit?
> 
> This doesn't work, but I wonder if something like it is what we want. I
> need to head out for the day, but here's what I've got. It's all wrong
> but might be of interest.

Oh, I just got one small detail wrong before. The below actually works,
and uses the same strategy as on arm64.

Let me know if you'd like me to fix up this commit with the below patch,
or if you have another way you'd like to go about it.

diff --git a/arch/powerpc/include/asm/vdso/getrandom.h b/arch/powerpc/include/asm/vdso/getrandom.h
index 501d6bb14e8a..acb271709d30 100644
--- a/arch/powerpc/include/asm/vdso/getrandom.h
+++ b/arch/powerpc/include/asm/vdso/getrandom.h
@@ -47,7 +47,8 @@ static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 }

 ssize_t __c_kernel_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state,
-			     size_t opaque_len, const struct vdso_rng_data *vd);
+			     size_t opaque_len, const struct vdso_data *vd,
+			     const struct vdso_rng_data *vrd);

 #endif /* !__ASSEMBLY__ */

diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index a957cd2b2b03..64cc1fad3ccc 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -32,7 +32,8 @@
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
 	get_datapage	r8
-	addi		r8, r8, VDSO_RNG_DATA_OFFSET
+	addi		r9, r8, VDSO_RNG_DATA_OFFSET
+	addi		r8, r8, VDSO_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
diff --git a/arch/powerpc/kernel/vdso/vgetrandom.c b/arch/powerpc/kernel/vdso/vgetrandom.c
index 5f855d45fb7b..408c76036868 100644
--- a/arch/powerpc/kernel/vdso/vgetrandom.c
+++ b/arch/powerpc/kernel/vdso/vgetrandom.c
@@ -8,7 +8,10 @@
 #include <linux/types.h>

 ssize_t __c_kernel_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state,
-			     size_t opaque_len, const struct vdso_rng_data *vd)
+			     size_t opaque_len, const struct vdso_data *vd,
+			     const struct vdso_rng_data *vrd)
 {
-	return __cvdso_getrandom_data(vd, buffer, len, flags, opaque_state, opaque_len);
+	if (IS_ENABLED(CONFIG_TIME_NS) && vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+		vrd = (void *)vrd + (1UL << CONFIG_PAGE_SHIFT);
+	return __cvdso_getrandom_data(vrd, buffer, len, flags, opaque_state, opaque_len);
 }


