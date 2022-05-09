Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B8520A48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 02:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxzbW0QgBz3c9H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 10:35:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lRqjkFhc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lRqjkFhc; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxrcP100Cz3bgC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 05:20:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E536B61690;
 Mon,  9 May 2022 19:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25555C385B8;
 Mon,  9 May 2022 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652124048;
 bh=+bmICguv18jBXLXxrwEf33icObsc1fpHfVo5K9f7UEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lRqjkFhc7fprJOJNhXu8GtpXTXjxRgBD11PxUp5vgIDT+yvDiqJ87C3HYOFhA8jdg
 R+oLSULFkhfcr+yp9NkuWc5h6OLbSHeyLb6zDIUu9i0pBIxF8cBZ9+47e9zOg8aL9P
 l3EkaSgcNByUgdE0P9G+I68ZcKHTZ1mAOoFJ/VOnIL2LYNsiElmX6jWPxGH4z+/NOO
 VU3uxCgvT9hpeTUOTO486gfhJr2PzZkT7pf4U7L2PPZnk1wuVH58YvDIDcdFR26RRq
 tk62Ej4fdy95ArndH/Fj2+sajgYOO9SSXHbnnLJeycGEeWRhveSn+d7ISAMZgxGDvT
 bGW6RhhtE7Nyw==
Date: Mon, 9 May 2022 12:20:45 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Message-ID: <20220509192045.2nkiaw4ne2dnuuai@treble>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
 <871qx2ubu5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <871qx2ubu5.fsf@mpe.ellerman.id.au>
X-Mailman-Approved-At: Tue, 10 May 2022 10:35:05 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 09, 2022 at 10:31:14PM +1000, Michael Ellerman wrote:
> Embarrassingly, we have another copy of the logic, used in the C
> versions, they need updating too:

Oops, thanks for finding that.

> With that added it seems to be working correctly for me.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks!

-- 
Josh
