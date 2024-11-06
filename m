Return-Path: <linuxppc-dev+bounces-2929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07F9BF546
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 19:31:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkDM13HY0z3bgQ;
	Thu,  7 Nov 2024 05:31:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730917917;
	cv=none; b=HOeTN/jtorz8ZSzemtaQJrgLUiF1ajRqrEhCL29s8xnF6zcTQQg6cilHBfvdw9pMupHvWQvBnBIjocTf/1QWdZGKFD1OzrU01nXzuwU85Y4J8YSpleCRTlkqGpyoLKxiNqe6jS5DnQJxhESbtIJNcmruxhMsDje8/kLQ+bHM4pvd339h+S9mAgjs2YJ+6h47HPYy33l6tcyYKcbGXRXbGgovplYHGLiMfl3kKH2s3wrHYdaEW8P/fWXixqv06zMSbYNEX90FfAfYOxHOqMqv0mCyd32GLxbwICDVut8D59z1PVIrCuip3UzHCG2rKIGw3XbywUt8wTHpeB+D6PF8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730917917; c=relaxed/relaxed;
	bh=aSEc3taDmu7kdFliJ+Z52GGczaVGmXnK1bD8nq8xhbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5RyvO3kZ0wLAV3n1nBMWvQ84NEVutf6CJP8IfU5H+aBq+C5R/Z6R40juwaReMrzL+OjrVVgkUQHgupGehxBNwwVZP8iwE35KYre/vEYNHDbL8AqHdOVN5sKatRofvbH6M+pLzDgugMR9zjplYauCPZ1FZqI0UwtyJrhl4TDK7awR4sc6AL9eOoCqNin0Zycwi2TtG2Qp6cxQ+BlJxHgGaVoilgA+MRBkuGN6sfUSoJ4poRV7r1oscFo6Hx1wvBulNhu0H4kUhnpO8/mTbRfIzm9NPv/cFE1pVb9ZW3hitk4UTr9Kgs9xSVJwjsUpDOgoLCwQs2SE8Qvo9HYcr/l+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkDLy3Y9wz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 05:31:53 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A6ITW0E024009;
	Wed, 6 Nov 2024 12:29:32 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4A6ITVEL024004;
	Wed, 6 Nov 2024 12:29:31 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 6 Nov 2024 12:29:31 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with clang
Message-ID: <20241106182931.GI29862@gate.crashing.org>
References: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org> <884cf694-09c7-4082-a6b1-6de987025bf8@csgroup.eu> <20241106133752.GG29862@gate.crashing.org> <20241106152114.GA2738371@thelio-3990X>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106152114.GA2738371@thelio-3990X>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Wed, Nov 06, 2024 at 08:21:14AM -0700, Nathan Chancellor wrote:
> > (r2 is the default for -m32, r13 is the default for -m64, it appears
> > that clang does not implement this option at all, it simply checks if
> > you set the default, and explodes if not).
> 
> Not sure that I would say it has not been implemented correctly, more
> that it has not been implemented in the same manner as GCC. Keith chose
> not to open up support for arbitrary registers to keep the
> implementation of this option in LLVM simple:

LLVM claims to be compatible to GCC.  It is not.  This is a bug.  As it
is, LLVM can not be used to compile the PowerPC kernel.

These flags (-mstack-protector-guard-{reg,offset}=) are there
*specifically* so that the user can choose to use something different
from the default.  I added this (back in 2017) because the kernel needed
it.  Some other GCC ports (aarch64, arm, riscv, x86) have followed suit
since then, btw.


Segher

