Return-Path: <linuxppc-dev+bounces-6854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD41A599D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 16:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBLHK1rkCz2yGN;
	Tue, 11 Mar 2025 02:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741620157;
	cv=none; b=kQzwNvy6J/fnkrCO4ro6vErXqMgIVZp62pAH/wwH6KegwDblhNFQojS77EW0fb7OHvDGrTKUrcZYpecKD5AcW8YE1gQdu6hfkb/G/20jLU/zYSmulr4ro83lEARMwCZ1Jgh48oN6d25sSPkB8aXSQa89NKz+QZ6KkhYGl9KXzF2xZ9VWE6igErGM9txS38TLU9rBtRd8/hJkKmtG1r8iowh3cku5nTY1MhSgU08WsCSwopltThgoYmsjZB8lShYPOQyqkd+/BV2rMo8xhD+M97EMluNTBd3Ii7K/rGm1s1wP2+fXb9fB8n4LtH40xYdJMYc47hY8TCh4OXkv564Urg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741620157; c=relaxed/relaxed;
	bh=aXwb/P4Ku6eDPMk2pbmZpPw1yewSlAjqYRu9xo/BIxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JILbig2YinEBE8zT/bLSmPpKI29Rfk+PMH/pNGwJd7WKvisDX+wdCIL29R53RHDalp5FJSQYGOv76ZTIdZEOimoIOSSEW7mYjo+/buNgiB4oxs4cFhhsTPjzrl8vZZ6SesKiZmHDNAJVOEOMx5+isHVpx/Ea4glv1k9qaI5LAyoWNIQh47trzxX+cseIDKOmGnrmBWTFv+oDs8bjFWn7l3h47CG2jQQb1iNHXPgAd5tQFG5L7JV6hsbXCGp00EILppC+1P87zVMmWthEbS6UddpMmPQJOayDIjEQKEdMax9Y36ykhRt4WrxJI66LjRs0Nu/9CQIeiysF9IosQ/BEww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0FHpWcWc; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0FHpWcWc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBLHH6YV3z2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 02:22:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0532F5C6789;
	Mon, 10 Mar 2025 15:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2056DC4CEE5;
	Mon, 10 Mar 2025 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741620152;
	bh=Cv8m8jD7+RmPJkCj57aD0CpR1gxtDVWyCmNb4E+uGhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0FHpWcWc7Qca61uQIH2Govy451NTIDVUxX2ga1F597qu9+ST0RzvlJXxvR0B48iFj
	 ofDf9PKmqRIuNmNpOjue02Gp0jrJ7v6bu+qrUShfMnC+4g3aTQAt3WRjNG3Apc6tpV
	 8mTflCuUbscJQpbTB2nbZKty+F5JMvp5PEU3hadk=
Date: Mon, 10 Mar 2025 16:22:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	seanjc@google.com, linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev, Trevor Dickinson <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
Message-ID: <2025031053-define-calamity-8115@gregkh>
References: <20250112095527.434998-4-pbonzini@redhat.com>
 <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
 <2025030516-scoured-ethanol-6540@gregkh>
 <CABgObfb5U9zwTQBPkPB=mKu-vMrRspPCm4wfxoQpB+SyAnb5WQ@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfb5U9zwTQBPkPB=mKu-vMrRspPCm4wfxoQpB+SyAnb5WQ@mail.gmail.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 05, 2025 at 03:54:06PM +0100, Paolo Bonzini wrote:
> On Wed, Mar 5, 2025 at 3:19 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Mar 05, 2025 at 03:14:13PM +0100, Christian Zigotzky wrote:
> > > Hi All,
> > >
> > > The stable long-term kernel 6.12.17 cannot compile with KVM HV support for e5500 PowerPC machines anymore.
> > >
> > > Bug report: https://github.com/chzigotzky/kernels/issues/6
> > >
> > > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/x5000_defconfig
> > >
> > > Error messages:
> > >
> > > arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
> > > arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of function '__kvm_faultin_pfn' [-Werror=implicit-function-declaration]
> > >    pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> > >          ^~~~~~~~~~~~~~~~~
> > >   CC      kernel/notifier.o
> > > arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of function 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-Werror=implicit-function-declaration]
> > >   kvm_release_faultin_page(kvm, page, !!ret, writable);
> > >
> > > After that, I compiled it without KVM HV support.
> > >
> > > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/e5500_defconfig
> > >
> > > Please check the error messages.
> >
> > Odd, what commit caused this problem?
> 
> 48fe216d7db6b651972c1c1d8e3180cd699971b0
> 
> > Any hint as to what commit is missing to fix it?
> 
> A big-ass 90 patch series. __kvm_faultin_pfn and
> kvm_release_faultin_page were introduced in 6.13, as part of a big
> revamp of how KVM does page faults on all architectures.
> 
> Just revert all this crap and apply the version that I've just sent
> (https://lore.kernel.org/stable/20250305144938.212918-1-pbonzini@redhat.com/):
> 
> commit 48fe216d7db6b651972c1c1d8e3180cd699971b0
>     KVM: e500: always restore irqs
> 
> commit 833f69be62ac366b5c23b4a6434389e470dd5c7f
>     KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
>     Message-ID: <20241010182427.1434605-55-seanjc@google.com>
>     Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")
> 
> commit f2623aec7fdc2675667042c85f87502c9139c098
>     KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_lock
>     Message-ID: <20241010182427.1434605-54-seanjc@google.com>
>     Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")
> 
> commit dec857329fb9a66a5bce4f9db14c97ef64725a32
>     KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
>     Message-ID: <20241010182427.1434605-53-seanjc@google.com>
>     Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")
> 
> And this, ladies and gentlemen, is why I always include the apparently
> silly Message-ID trailer. Don't you just love how someone, whether
> script or human, cherry picked patches 53-55 without even wondering
> what was in the 52 before. I'm not sure if it'd be worse for it to be
> a human or a script... because if it's a script, surely the same level
> of sophistication could have been put into figuring out whether the
> thing even COMPILES.
> 
> Sasha, this wins the prize for most ridiculous automatic backport
> ever. Please stop playing maintainer if you can't be bothered to read
> the commit messages for random stuff that you apply.

Sasha, I thought we weren't taking any kvm patches that were not
explicitly tagged for stable?  The filter list says that...

Anyway, let me go revert these, thanks for the report.

thanks,

greg k-h

