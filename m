Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072B640378
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 10:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNntk6NfJz3bgK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 20:38:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hUJ5Sizc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNnsr2Bw8z30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 20:37:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hUJ5Sizc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNnsl2Zc0z4xN3;
	Fri,  2 Dec 2022 20:37:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669973851;
	bh=HgOcyu133X5TabU40GR4c197EsaCaAilQufyZi+kGao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hUJ5Sizc5PF+l8d6uuAz1aiHNHMYZmJEjA+o/a4DRn4kF+bpIJCaDkstxMo8U9SrM
	 3UUbz50tIK9+Mljqx6Fpwsrw2cygz/IQ/Vph6GCS6VZ+sJSFpnAyP66VesL8cMNUb4
	 63xXRvQFfxOq6mETqBhTzFITfn+zaX+vIQSF9wifSUk50lUr1pMK7Cln6wfhQquMac
	 vYv3eA3XIY1OyiDg/m9L3E4mJjQdeCyHW2b/sccYMSpe8OspZKpB+66sgNrIZrZyWx
	 9sqiZkIl8DYE4AizWEc9NPXoo0JtBIP+tJLQFW2m37fYxztqulpntDXfd8j/zE+Apo
	 oif0ZdnohENSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <20221202112646.5813c34b@canb.auug.org.au>
References: <20221202112646.5813c34b@canb.auug.org.au>
Date: Fri, 02 Dec 2022 20:37:29 +1100
Message-ID: <87lenq16zq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Christopher M. Riedl" <cmr@bluescreens.de>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/lib/code-patching.c: In function 'text_area_cpu_up_mm':
> arch/powerpc/lib/code-patching.c:157:14: error: implicit declaration of function 'copy_init_mm' [-Werror=implicit-function-declaration]
>   157 |         mm = copy_init_mm();
>       |              ^~~~~~~~~~~~
>
> Caused by commit
>
>   107b6828a7cd ("x86/mm: Use mm_alloc() in poking_init()")
>
> interacting with commit
>
>   55a02e6ea958 ("powerpc/code-patching: Use temporary mm for Radix MMU")
>
> from the powerpc tree.
>
> I partially reverted commit 107b6828a7cd - I left the change to
> arch/x86/mm/init.c applied.  Though, I wonder if the powerpc tree should
> use mm_alloc() instead of copy_init_mm() as well?  The tip tree commit
> says:
>
>     Instead of duplicating init_mm, allocate a fresh mm. The advantage is
>     that mm_alloc() has much simpler dependencies. Additionally it makes
>     more conceptual sense, init_mm has no (and must not have) user state
>     to duplicate.

I needed to rebase my next anyway, so I've squashed in a change to use
mm_alloc() in the powerpc commit. So this issue will be gone on Monday.

cheers
