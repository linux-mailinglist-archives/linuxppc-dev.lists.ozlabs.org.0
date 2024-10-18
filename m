Return-Path: <linuxppc-dev+bounces-2375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08D9A4300
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 17:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVTn30FHvz3bn9;
	Sat, 19 Oct 2024 02:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729266918;
	cv=none; b=RN7y8M48k8ou4TUlbMML/nEwuKOoIzU1DH5H9weEvTvV8w87wII4opVR7cnkZFYj8tABMuPtQRX8eDZDnjTUrSP9vJkzzt81aWSrePJJUobBQvkREVCAkoZZASowALfFaW/5Gi+76JLUzBw/AFLggIEq2whZvwKaIlziuMl/J6IFJebiOMyG6KRjCP1fLgAMtAucaLVzrMOOLFWEtWeR5lxKJiuHmV4UmU2TZsPt2Xdn8zbXaK/XjU3XBvJhMUAYf7bLi9e2lqt49ppcKJEKhbh3VoiocnpKzvJvHqtHjNlIi70mJmgRaOoseBicYo2dB3hoKN9iv1PxYr3sN0t4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729266918; c=relaxed/relaxed;
	bh=qN491zR5Aog1DsYzRi+rFh0EPj81SgGZBJkoxYqSaak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X77++TJ97D+RBzjImJzxL6bVfACsPx+t6OUT4pllv53jIamFk2rjuuDr3do5lviX8todek4V1pEIlpr3v5Bp1s/eqvbbbjO/q6M7zJKfFAEbWLXQEpCZFp2YS4P4EmHSP3UtM881Ai8CHEGcv26fNGPnXD5IQuUEIfscBjsAD/t9VT+TlR2LMAy3hFGPdzvJoBu/4Q3SZ1xZTwJTcH0cl1wSnSMxS3HVbY2we6S+gMM3QALF1KB7GHIi8npwoRAerbk1LzGkRYdVwsh32R8ac6r83W5z3yozBLEMxjjj+G1JsGH6Lla1iSsUoM1s8UHivwbz6Rz2M/6D0bl86z7wxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CgeeZh71; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CgeeZh71;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVTn209Rpz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 02:55:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 995CCA44523;
	Fri, 18 Oct 2024 15:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71F2C4CEC3;
	Fri, 18 Oct 2024 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729266915;
	bh=htHCVl3dLq19V8wPIxFnR3ZwPaftOj2Ne5i0C7AnREY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgeeZh71kHHVa+cdIml4FAaHnIyZWEzgZRfuxPxxCs+RFgod+LNwbqICcNdi7yKjG
	 QG1DB6W5hM6ZVIvhWravyOF6IJevy+fGh8ntBge476UHqWIqXRDvOPzREa0THkkj74
	 Tc1xt0ykVx00t7JDcJObK37GMAXrH6vxy6QQB7M6CLaveixPdN5FuLclDcwS9RLUYG
	 ZPlR65HSH+C7UTrMN/lgWv8zpB2FXtMTM+LdBKsUJyWILobAbQNZoc3LeDI8+RljKY
	 oT1t72OoDDbv7tLUqEuj/7Vqg8AltGdVRJc2brKLDUmuMc0dPgOcJR5Gtplahxz4FA
	 QTr93f8rHUetg==
Date: Fri, 18 Oct 2024 08:55:13 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Kirill A . Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 3/6] x86/uaccess: Rearrange putuser.S
Message-ID: <20241018155513.zaufdhi7p5mrz2bp@treble>
References: <cover.1729201904.git.jpoimboe@kernel.org>
 <7818233ecd726628a3eb9cbb5ed0ba831e69af4b.1729201904.git.jpoimboe@kernel.org>
 <srdcfvwgmm4aiyny5ex24puhi7u4rohy2sjb2htrzqhr7igekx@bh3c22loauzb>
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
In-Reply-To: <srdcfvwgmm4aiyny5ex24puhi7u4rohy2sjb2htrzqhr7igekx@bh3c22loauzb>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 18, 2024 at 11:51:06AM +0300, Kirill A . Shutemov wrote:
> On Thu, Oct 17, 2024 at 02:55:22PM -0700, Josh Poimboeuf wrote:
> >  SYM_FUNC_START(__put_user_2)
> >  	check_range size=2
> >  	ASM_STAC
> > -3:	movw %ax,(%_ASM_CX)
> > +2:	movw %ax,(%_ASM_CX)
> >  	xor %ecx,%ecx
> >  	ASM_CLAC
> >  	RET
> >  SYM_FUNC_END(__put_user_2)
> >  EXPORT_SYMBOL(__put_user_2)
> 
> This patch provides an opportunity to give these labels more meaningful
> names, so that future rearrangements do not require as much boilerplate.

Yeah, I can add a patch like Linus' patch to getuser.S which
encapsulates it all in a macro:

.macro UACCESS op src dst
1:	\op \src,\dst
	_ASM_EXTABLE_UA(1b, __get_user_handle_exception)
.endm

	.text
SYM_FUNC_START(__get_user_1)
	check_range size=1
	ASM_STAC
	UACCESS movzbl (%_ASM_AX),%edx
	xor %eax,%eax
	ASM_CLAC
	RET
SYM_FUNC_END(__get_user_1)
EXPORT_SYMBOL(__get_user_1)

-- 
Josh

