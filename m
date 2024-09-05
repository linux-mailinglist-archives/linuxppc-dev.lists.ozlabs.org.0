Return-Path: <linuxppc-dev+bounces-1067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1196E445
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 22:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0B9b01hvz2xHb;
	Fri,  6 Sep 2024 06:41:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725568914;
	cv=none; b=KtvO3VIZLmHtrqWSDFbWuZkifTjtL3XxRdMv4iwa3tYu5jI/XImZIxMBXPnVkEflsAEbqJ84YwzwjQYaOZbui5jt/JI++CNlLIeMfRTxXXHXmIjbRLniBV1Fm1pSjLmEPTJXOyCAdfYeLpBI9KBv1JJOrcKnASS4hnYhw36R3eATe7+ZS4WlTR5x3UJiNhjKV2hVfrE8wzYbIusHvH6p4/YpTMNDQTIRO7cUpTiXpVexGVjVM+EY5bn+qPzfaYtENb+MWYhwX5fA7QMjO/xWFgcHmtezdp4jJNJjwGHmLOKwyGGEHmf1nDvRfItEO1kfWglqT3nSLk9nvV6t/DeTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725568914; c=relaxed/relaxed;
	bh=IeN0hion7E5T8bnC9bEQSPstkGSkSwCA9M/4YZOxoLs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=YaKgbuP02DOX8+z91M4egiBzMFx6MkCxw54GOcJje0Nkq7yyxwOiOKhBtxpzQda07CwPkIQdKUkFqbQZBEp+z6+z7LvWIurQ7u476Y/egRVEdjJpsDWEbR6NrXZlRa3UrSRsmGEG5GihId+28UHjVVtKs42pGnDz9Ld2fMkY2PS8ULXlbY/qOyPZu5AjFPY7t/aoQcvAZwJJ/5ySfdbAbRUi4pSrVtYss73ZYuqrdk1DxUHSePqR62nngkRb37dYkQGpXjqCdsoH08HVUyJH/v16vH6/0pDcYcUlNc0TD6BL2ztg0mXk9TCljigfDWPnhRNQkKbsc/Fm/BYDyGMBXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Vmhr4xm1; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Vmhr4xm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0B9X6bJ2z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 06:41:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 785D15C5D70;
	Thu,  5 Sep 2024 20:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398A0C4CEC3;
	Thu,  5 Sep 2024 20:41:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Vmhr4xm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725568904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IeN0hion7E5T8bnC9bEQSPstkGSkSwCA9M/4YZOxoLs=;
	b=Vmhr4xm1Wp03ugcdrYba3ciO2c/OQp0oQM3tMCUeyv/y6IZN4vNwmCaOuwFQTFlZjTxzGh
	vyDmKYOWlgz6gVR/SY11McK85Ld05NIERlGr0h62hGj7fSc/8dsPEgJIDmwgO9QkzhtMl2
	G9lC+jvPOPB9VCi02VaBflNkREEbT7Y=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 48b42c3c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 20:41:44 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:41:40 +0200
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
Message-ID: <ZtoXhGYflBNR74g0@zx2c4.com>
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
> Can you figure out what's going on and send a fix, which I'll squash
> into this commit?

This doesn't work, but I wonder if something like it is what we want. I
need to head out for the day, but here's what I've got. It's all wrong
but might be of interest.

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
index a957cd2b2b03..bc49eb87cfd1 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -32,7 +32,7 @@
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
 	get_datapage	r8
-	addi		r8, r8, VDSO_RNG_DATA_OFFSET
+	addi		r9, r8, VDSO_RNG_DATA_OFFSET
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


