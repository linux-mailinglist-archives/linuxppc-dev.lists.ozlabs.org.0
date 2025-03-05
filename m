Return-Path: <linuxppc-dev+bounces-6742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF09A501A7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 15:19:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7F735NTXz3bxH;
	Thu,  6 Mar 2025 01:19:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741184383;
	cv=none; b=PoEg2b3BbeTTw+rIH26UGK82bNtG6q1+nDUrpUerS+635ATGCcm2vjgbbu9cpIkjgulwudbT9AYFIR0bAdtESTP6TTBstgJTHjEE5D50c7oAxdWHyvrM7qLKV7uF8hdt359+rK3mwYxwXc1H8/8NrAdpxhO/KmMusDWCK01A45N8Lqn8dg8BJkh7rsjUK2Pd1HGlcmA251qftnUez5rHQIrvU5DiTwcNktxzj6hm5BWYR54dbiq1UA65AO1tR2+6vzYn2HQGabtk5UxsI0pcu2AD0gqmw5qYfgv8WZJRdi5hp1yRiZon7MZlqLYYQaLOhUtx60nwY/FceD6pVAltRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741184383; c=relaxed/relaxed;
	bh=gr/7PMu5bMZpLT3n7a2SGeiFVxRhQrmhOmJ4djzqY9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAWVp7HdlXuXfgukC2E3fGVX8e+npj1uUDaKQ++0tDx7XMnxJSSLpJIrZQgw0MvqMgt2mvJQiFCTemkm6YvYqFUP8kw1FSdgS79UJ76a7aNL1KW87zpmzwhYCJ8o5nQ9rFyG77yZp/TWT91Xwr6QVK91jyv0MkUa8hAf5nqb6FCnuor8PuZnJyOi+mSddFPXHDOFc1L27B9lN7VNOnlof0pidJDs5YZD/H2SzI1Tul6VE3GIRcrL0aECuElBb3V2Gd0dDTA4vcI8+NBoAewruYDkB2uvx3Eiqmfz5/uHS9S7ie8DdzFT05/5e7sqxD2rnEl573/KStSkOWmJQNY77w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UrBVaWeh; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UrBVaWeh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7F720fChz3btT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 01:19:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 540A8A45769;
	Wed,  5 Mar 2025 14:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6369AC4CED1;
	Wed,  5 Mar 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741184377;
	bh=gr6AIeXrk7toPGAq+EGWNUJ0Rw7W7akc2JJ+IpSibI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrBVaWeh9cfCtfWfG18L68fypcEi903bh0aPiIChrvDZSVFkRCr0f1OjIAcKV0N+1
	 duWvo5UZCKKtuYLkZlwuaKsIrDUiGNUwH0Efag8nmJbwWIljutcLPU+vVvxYEWm4Pu
	 aG0er/6DeoXPi3aEL8DJsABdU5SIQr6LqILPBjzM=
Date: Wed, 5 Mar 2025 15:19:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org, regressions@lists.linux.dev,
	Trevor Dickinson <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
Message-ID: <2025030516-scoured-ethanol-6540@gregkh>
References: <20250112095527.434998-4-pbonzini@redhat.com>
 <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 05, 2025 at 03:14:13PM +0100, Christian Zigotzky wrote:
> Hi All,
> 
> The stable long-term kernel 6.12.17 cannot compile with KVM HV support for e5500 PowerPC machines anymore.
> 
> Bug report: https://github.com/chzigotzky/kernels/issues/6
> 
> Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/x5000_defconfig
> 
> Error messages:
> 
> arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
> arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of function '__kvm_faultin_pfn' [-Werror=implicit-function-declaration]
>    pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
>          ^~~~~~~~~~~~~~~~~
>   CC      kernel/notifier.o
> arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of function 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-Werror=implicit-function-declaration]
>   kvm_release_faultin_page(kvm, page, !!ret, writable);
> 
> After that, I compiled it without KVM HV support.
> 
> Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/e5500_defconfig
> 
> Please check the error messages.

Odd, what commit caused this problem?  Any hint as to what commit is
missing to fix it?

thanks,

greg k-h

