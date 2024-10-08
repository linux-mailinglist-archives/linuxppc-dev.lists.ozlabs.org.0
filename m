Return-Path: <linuxppc-dev+bounces-1846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 172959950AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 15:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNHWs5DMgz2yst;
	Wed,  9 Oct 2024 00:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728395545;
	cv=none; b=alsix8+ALqaXTYmUHYUNMhFllfDsMIibPBvyscgofZkjD5oXrQVYuSCWwl5kiiIcJsLKHsVQScufw8lvvntKM/0YYCRaygyxtx1xtA2bSYtWT8jeaB5/7fMRpXnpR6DyhO4/W5nX6VwcKAQf+Jr1OyqOnrbAtgpexpCuExBOSEUSd7MdkdXGEOjtIMb2OBx32bfSjy/SL4jHvpqf2xveJ+9IhkWBS9ioDMFxWz1G5mFQPqjhcos+U2/+jgn8nIvxCUuncBfj2yYTYq2eXritSoWS5TPbLVzyfQSB2nAxGoNiu/d+kHBpAlXv9m0RqvGyeVaEQertoVxy6sHCHAtaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728395545; c=relaxed/relaxed;
	bh=9fFiB4OxzgazoVq+/0LH5g+sqjkRP5YiJgxkbU2ZSCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGMx1dh0MSRB4+timXsOzdWSkBblDr7H258xhwff7jfNRYnexZZ1SWlCQT2MKmsklSKVR/ANJS6EieXeaEMPiuhVqwEmUwLjubjHi8u5Vw32AhIqOhlm8qn4EMnpfSTeh+dUXTNGAF0B6DoOe0NlhAQ+Nfed26ctCyXbFkrjp5Y0YL7yTXzZty6AvBtQbM00f1jOiMOz5ev5vUvik9y20Fwfzy0F0Kqvt22wXABIa+9IRpRmKdQKrqcr0KKPEMpu49YfyUnTJigYWgz5vk3zO/ABZD3+XNq5Rp//rCf2jjoN5XNQN7CVq0wVUKqYU//2eT1IeMUuiA9VDLpokhlCsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HktY9cc/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HktY9cc/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNHWn6mbfz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 00:52:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB4C55C5CC7;
	Tue,  8 Oct 2024 13:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35885C4CEC7;
	Tue,  8 Oct 2024 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728395539;
	bh=8vZb9w6+CLQ4V7ABqShJswkUhfWg9AIbO9FzWOsl6cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HktY9cc/CvaeJfzPqChfdqIENqDxLv71KGdqQus8w4q/lqjZtanz/A8sRoH3ohS6y
	 9OO1yGRgjUG7EhKWbqWXmn/giCmng9Eyf3F5CnhJcosmbtYL+3Ds03BHX2T/UNEFqF
	 KDvp3m5bsLm/YVaIKJDZ0r0tC6b0KcCsk5I6ovfkAVvsQ/rfJkHRjyB+u9wXGohpSf
	 /VcR4vpT8ep4QapFEQr4betj5iKaUdtDJhOqHIc+OdVuZs2bllFyZ9IUWZrSpPpoCO
	 CdV8o/y7jKiZ6hK2lmGlijcNE/LY4wpawNwzdG1BPE3HJY+QRTsFZPTHsBcgCYOnwI
	 IJZ2Vb05pWfCw==
Date: Tue, 8 Oct 2024 06:52:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH 3/3] powerpc: Include -m32 / -m64 for stack protector
 Kconfig test
Message-ID: <20241008135217.GB3504203@thelio-3990X>
References: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
 <20241007-powerpc-fix-stackprotector-test-clang-v1-3-08c15b2694e4@kernel.org>
 <a57f21db-911c-4331-af7b-c02c0ea8b1e6@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a57f21db-911c-4331-af7b-c02c0ea8b1e6@csgroup.eu>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 07:14:26AM +0200, Christophe Leroy wrote:
> Le 08/10/2024 à 06:22, Nathan Chancellor a écrit :
> > Kbuild uses the powerpc64le-linux-gnu target for clang, which causes the
> > Kconfig check for 32-bit powerpc stack protector support to fail because
> > nothing flips the target to 32-bit:
> > 
> >    $ clang --target=powerpc64le-linux-gnu \
> >            -mstack-protector-guard=tls
> >            -mstack-protector-guard-reg=r2 \
> >            -mstack-protector-guard-offset=0 \
> >            -x c -c -o /dev/null /dev/null
> >    clang: error: invalid value 'r2' in 'mstack-protector-guard-reg=', expected one of: r13
> 
> Why is there any restriction at all on which register can be used ? I can't
> see such restriction in GCC documentation :
> https://gcc.gnu.org/onlinedocs/gcc/RS_002f6000-and-PowerPC-Options.html

Keith may be able to answer this better than I can but I believe this is
an existing restriction in the LLVM code that dates back to the original
stack protector support:

https://github.com/llvm/llvm-project/commit/a1d8bc559761c94dded3d1e7200cb264a982d1c5

It always uses r2 for 32-bit and r13 for 64-bit for loading the stack
canary. Keith's patch basically just allows customizing the offset,
rather than the register (ultimately for simplicity in the compiler
patch I believe, since we really only care about supporting what the
kernel uses).

> > Use the Kconfig macro '$(m32-flag)', which expands to '-m32' when
> > supported, in the stack protector support cc-option call to properly
> > switch the target to a 32-bit one, which matches what happens in Kbuild.
> > While the 64-bit macro does not strictly need it, add the equivalent
> > 64-bit option for symmetry.
> > 
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >   arch/powerpc/Kconfig | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index eb98050b8c016bb23887a9d669d29e69d933c9c8..6aaca48955a34b2a38af1415bfa36f74f35c3f3e 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -275,8 +275,8 @@ config PPC
> >   	select HAVE_RSEQ
> >   	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> >   	select HAVE_SOFTIRQ_ON_OWN_STACK
> > -	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
> > -	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -mstack-protector-guard-offset=0)
> > +	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
> > +	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,$(m64-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -mstack-protector-guard-offset=0)
> 
> You modify the exact same line than Patch 1, if this patch is really
> required it should be squashed into patch 1 I think.

I believe it will still be required based on my comment above. I can
certainly squash it into patch 1, although the commit message might get
a bit wordy with both explanations in there. I suppose it still makes
sense to do so since "fix the Kconfig test" can encompass both issues
easily.

Cheers,
Nathan

