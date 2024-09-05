Return-Path: <linuxppc-dev+bounces-1064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2AF96E0BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 19:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X05Kt1gVmz2yjN;
	Fri,  6 Sep 2024 03:03:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725555826;
	cv=none; b=Id0iZ/IKbt4ehaZARW3MUIWidWcua9j5/s2ZQvGHPCqj3IoD+ENgoGatsc0q7VZD/uwDixVc4KGGMaOMtVTd41fKfuInzKekYwpwtUIiteioJ3WkpmWU9Xmy0LRHNhqLKP2A7ubIJK8q9rL/pmN3ZWnU08A+L31kQKKASQ9T5AJA3S7QDs1exjne8oJ3QXmC2WY0+TpfgvVvOQcKCCcTtlIje1D0C+guQobP9RrpE8E4HksPWQpFMCZG6yYkbl0lTNF7wL5gydo+yBoPINwW4fzh6PmBW+CnJvPUMAj3/fa2hBMq3ewfkTbDdkTri0tAhN8RJBHs0hzkWe4TdthkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725555826; c=relaxed/relaxed;
	bh=2WPPczzM5fWySeHC6qCU5mJN44nYuMHACOhNso4EGCc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=h41bKmC/Y5P8OmxeX7p9dlBbBv74TsApAm6wQGlQBpx3GajkmRDoLo2x3Eh+hfWeywJQT8cmzD/Lmd5i3VUAAfIuCBJeI6aIwmD+KMs4Wz1yNalabltUrrTZaX/EBaf/OYPh7HNBVqfXEVr+Z/7D+Cx0KGIZdej8xMp124XMbl5iCEweyotM+mRFR8r63H66PjpWzajvtP7p1xV9O5Ev+goUDTk2NsKT7q1M7JtJeKhFjMzDwkowsskzBAYizahT49WZnNCU2kkJDfOjA2GhiB4EuluXhZgNhXGWUOYCNNmB6sX2+tbs2n0st94D9VQCzr3ZfjShcNGF16Nc9VI6Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=S8oxi/AJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=S8oxi/AJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X05Ks5QScz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 03:03:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49D83A44E14;
	Thu,  5 Sep 2024 17:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2114C4CEC3;
	Thu,  5 Sep 2024 17:03:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="S8oxi/AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725555817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WPPczzM5fWySeHC6qCU5mJN44nYuMHACOhNso4EGCc=;
	b=S8oxi/AJO3vG5kC0wYzvPcvwfn+o0kCttzDIhQelVpgwHEjGgAUGSmBmhwbhPa1WeQUBkb
	zu10fm2SriimEK0oAC9nBbD2fdcQS3U5JLuIJ3Yt6a4wdt2cJhjM7HSPHPV5+s0R7BSnJa
	90zYJO/+yld5Pdz8ajTRqlFukUnSKxg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 27c37213 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 17:03:37 +0000 (UTC)
Date: Thu, 5 Sep 2024 19:03:34 +0200
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
Message-ID: <ZtnkZsHJESAqU-FH@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
 <ZtnYqZI-nrsNslwy@zx2c4.com>
 <85c02620-e8b2-4c97-9905-685a9a4e556d@csgroup.eu>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <85c02620-e8b2-4c97-9905-685a9a4e556d@csgroup.eu>

On Thu, Sep 05, 2024 at 06:55:27PM +0200, Christophe Leroy wrote:
> 
> 
> Le 05/09/2024 à 18:13, Jason A. Donenfeld a écrit :
> >> +/*
> >> + * The macro sets two stack frames, one for the caller and one for the callee
> >> + * because there are no requirement for the caller to set a stack frame when
> >> + * calling VDSO so it may have omitted to set one, especially on PPC64
> >> + */
> >> +
> >> +.macro cvdso_call funct
> >> +  .cfi_startproc
> >> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> >> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> >> +	mflr		r0
> >> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> >> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> >> +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> >> +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
> >> +	get_datapage	r8
> >> +	addi		r8, r8, VDSO_RNG_DATA_OFFSET
> >> +	bl		CFUNC(DOTSYM(\funct))
> >> +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> >> +	cmpwi		r3, 0
> >> +	mtlr		r0
> >> +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> >> +  .cfi_restore lr
> >> +  .cfi_def_cfa_offset 0
> >> +	crclr		so
> >> +	bgelr+
> >> +	crset		so
> >> +	neg		r3, r3
> >> +	blr
> >> +  .cfi_endproc
> >> +.endm
> > 
> > You wrote in an earlier email that this worked with time namespaces, but
> > in my testing that doesn't seem to be the case.
> 
> Did I write that ? I can't remember and neither can I remember testing 
> it with time namespaces.

It's possible I confused you with someone else? Hum. Anyway...

> >  From my test harness [1]:
> > 
> > Normal single thread
> >     vdso: 25000000 times in 12.494133131 seconds
> >     libc: 25000000 times in 69.594625188 seconds
> > syscall: 25000000 times in 67.349243972 seconds
> > Time namespace single thread
> >     vdso: 25000000 times in 71.673057436 seconds
> >     libc: 25000000 times in 71.712774121 seconds
> > syscall: 25000000 times in 66.902318080 seconds
> > 
> > I'm seeing this on ppc, ppc64, and ppc64le.
> 
> What is the command to use to test with time namespace ?

Look at the C in the commit I linked.

