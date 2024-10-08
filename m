Return-Path: <linuxppc-dev+bounces-1844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9599505A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 15:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNHFZ3ZtRz2ydW;
	Wed,  9 Oct 2024 00:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728394802;
	cv=none; b=cxvesuE78Bmi9YFJDx6HIQf4Yc2cb6Va/Uxzd7IwLfVvdV+0BDj6lH8AnBI8z5bMokIAXPvlK/BvwAb2FOoZZ8KYitd3grobqLycPb0LoVZGiVK51IrJARLum7ad6EFRxYp/DbyamSD2Ieqygz8l6T8miiQ74vSM48Q9YeNRc/prX26+CrdHi99fvV8YtOdBk/u3apj7dzvguDu1yQSZl6c01Pm4NDB7phogKkCoo+jkI41dV4X5bU40xN41PzpucazCgv2i0zt6/ex46m8y4laHXLVgju3DK9L+6asVl3G/PMcKOUCPNClJhny5D1a5U1Pw6U+ReI4PJHm6TQIUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728394802; c=relaxed/relaxed;
	bh=WTqRYSORAY28+PXqrA/dN+jGsyQXtOzmUR9OLNsy2YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXzkhwlk46c6CaIMScdW78Vjh26bjsrpmENlh0uqUi5NJ3x9hGqBJ0J3jIu7Id9smZ7mEGtP2X6dJUWTIIEy5dhSppKaItd9v6cxqkKBx/xpk/McNdXifmy47srm6Xl03cENJnNiS/XZpI5cRiH9onZTqBvK+pKieT5xNls2o5l87biHA2cXmjOqxu5z22fGBfEWV27RYpbTOJlBqdJPOibG2jWAtHHQUco8WjODynEnYIosgihYbcDZqfijx/4cQMcvguqGdyIVqNNF2ZXRVd8noeedLMmKchwyqLj0C3J8ajEChpTiRS3M6ojTsMYzmAEGFxqf9yqUHI+CiF7ysQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RMHLtQSv; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RMHLtQSv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNHFY1n3vz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 00:40:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 074B55C5CA0;
	Tue,  8 Oct 2024 13:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441AEC4CECC;
	Tue,  8 Oct 2024 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394797;
	bh=D3zMX+nGIlOON+28O/pmYT+Fu3bkr9vHmFGcJlFRjRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMHLtQSvncaYoVgNIdgxSoX0o70ZrDxc+PIUIYuwdcx+dXhx5hA9/n7PUUZk14Pc4
	 Kn+3OMabgZ/Q4luLUeXa2jhlyNXQQov1IY9w8zI06NPNeW9YRQQiroliL5ZGwy9SEG
	 EUbmOz3CxwdQ5f3XdzxexYAZjlrHxZXGCqs++cDZIFuJWeyGfhAH1+XyTZPy+A5jge
	 fmtZ3a8bjfX0g1WMlnTP6MGcM88nm5eSAi4eJR5lUpAxEQ+/0tsfD+X5CnsM88g4GQ
	 Q6GsDj59n0KEWuX7WTccnQlUeeK5k1uMzCSpVKihyuRXGqCgmwkZZgdNKHsbi4n5S4
	 tSJFGXP4f65Pw==
Date: Tue, 8 Oct 2024 06:39:55 -0700
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
Subject: Re: [PATCH 2/3] powerpc: Adjust adding stack protector flags to
 KBUILD_CLAGS for clang
Message-ID: <20241008133955.GA3504203@thelio-3990X>
References: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
 <20241007-powerpc-fix-stackprotector-test-clang-v1-2-08c15b2694e4@kernel.org>
 <331cc7ba-ed5e-4dd3-8175-b51bacb65186@csgroup.eu>
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
In-Reply-To: <331cc7ba-ed5e-4dd3-8175-b51bacb65186@csgroup.eu>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

First of all, thanks a lot for the quick review.

On Tue, Oct 08, 2024 at 07:10:36AM +0200, Christophe Leroy wrote:
> Le 08/10/2024 à 06:22, Nathan Chancellor a écrit :
> > After fixing the HAVE_STACKPROTECTER checks for clang's in-progress
> > per-task stack protector support [1], the build fails during prepare0
> > because '-mstack-protector-guard-offset' has not been added to
> > KBUILD_CFLAGS yet but the other '-mstack-protector-guard' flags have.
> > 
> >    clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default
> >    clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default
> >    make[4]: *** [scripts/Makefile.build:229: scripts/mod/empty.o] Error 1
> >    make[4]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1
> > 
> > Mirror other architectures and add all '-mstack-protector-guard' flags
> > to KBUILD_CFLAGS atomically during stack_protector_prepare, which
> > resolves the issue and allows clang's implementation to fully work with
> > the kernel.
> > 
> > Link: https://github.com/llvm/llvm-project/pull/110928 [1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Is it worth a Fixes: tag so that it gets applied on stable, or wont CLANG 20
> be used with kernels older than 6.13 ?

Yes, I did consider adding Fixes: + Cc: stable. I think it is probably
worth doing since the fixes are rather benign. Do you have a suggestion
for a good Fixes: commit? It always feels somewhat wrong to blame a
commit for not having foresight into how a future implementation might
do things differently :)

> > -	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
> > +	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls \
> > +				-mstack-protector-guard-reg=r13 \
> 
> Can you put both above lines on a single line to avoid having too many lines
> at the end:
> 
> +	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls -mstack-protector-guard-reg=r13 \

Ack, I have made this change locally for v2.

Cheers,
Nathan

