Return-Path: <linuxppc-dev+bounces-6855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83440A59A8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 16:59:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBM656jcQz2yGM;
	Tue, 11 Mar 2025 02:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741622381;
	cv=none; b=FJlFRjmQHRjsJeynatJJXJXLfrmefgkNPWNTX2NJiAteW4+NtWfG3ZDlkHa6WMwimZ7XDH9xfjH5k9PBx6C1/YFXbEHa2eDG88PLLCmBLGwYCq7DKLkcTdBti6OP77ZCXCzGIC4wi0ba6mwuRzjmQKUTF/GR+uVxc0beeg9gw29YahtGrib5MnEokasFxQ1YSOw2NM8cq0v6farEMn6f3HVQqzPR4rRWW4VvaGO1vaT+dMAeh16x4ltUcIFyviFjwLmTUsoMdnlJ/U99e4uuGMhF6Lfz+UrzGa6P2/23skZUiz3Yc6JZeQ3RYnjif37d9OYRcFIO+AyI28EPqi7cMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741622381; c=relaxed/relaxed;
	bh=ssMm746WYWcwhSr4IQzen7+TUL2c00C8Q2y0frDsabY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiV25FF6BbqY1BEsFIuEoYS2SwgtXOmPHuf9sYbJr2Doe2qyXncRBz2fCk7+AyMPqYqCK/Q0iD9YrjgbM5Qe79RT8NFh7vXwoaxNRHXyoLOljCZEv1FTOfx9LBRTk7oPvEnNutUaRKRYSlY9WJCl0CJ6DIdeqBDSrNVaFusxVRUTu3s/puRO1eJ+UqHq1tVhonAlgf/NC7n4ADjg8QlpAlQ5BbpEvPwCe9N7rJ4lij6VxHEQxV3gDXw4MZIIcT+nKI7/cJYOpkATFrTxHutHLYk1eCvua9YoJ8y3iw0q2brHdk6q62wuXnstubrBsZJRNsR2s+uZ9Gz01ouceqUzaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YOUgLza4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YOUgLza4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBM64592pz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 02:59:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6001E5C6815;
	Mon, 10 Mar 2025 15:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A90DC4CEE5;
	Mon, 10 Mar 2025 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741622377;
	bh=EBdiWtBZsjV9l+VD6FfbfKEnQna0Mj2l44kwBSBVKVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOUgLza46P+/1QH9sbANY82RHUhPdqOJu4QkvdUBxKxUlNlmfMRRQCzEeAYrgvzAm
	 I9BYaiDUn0P4flP+/zRB9yWcUmo2wYk2M+XbkcHJzfcHIx5Nfef82dLJ3Km1iGpppm
	 qpSvQAlP78Vpl7w4GTjhKHQoqq+A8/8Qx2dIvDaA=
Date: Mon, 10 Mar 2025 16:59:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev, Trevor Dickinson <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
Message-ID: <2025031024-dreamt-engulf-087b@gregkh>
References: <20250112095527.434998-4-pbonzini@redhat.com>
 <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
 <2025030516-scoured-ethanol-6540@gregkh>
 <Z8hlXzQZwVEH11fB@google.com>
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
In-Reply-To: <Z8hlXzQZwVEH11fB@google.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 05, 2025 at 06:53:19AM -0800, Sean Christopherson wrote:
> On Wed, Mar 05, 2025, Greg KH wrote:
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
> > Odd, what commit caused this problem?  Any hint as to what commit is
> > missing to fix it?
> 
> 833f69be62ac.  It most definitely should be reverted.  The "dependency" for commit
> 87ecfdbc699c ("KVM: e500: always restore irqs") is a superficial code conflict.
> 
> Oof.  The same buggy patch was queue/proposed for all stable trees from 5.4 onward,
> but it look like it only landed in 6.1, 6.6, and 6.12.  I'll send reverts.
> 
> commit 833f69be62ac366b5c23b4a6434389e470dd5c7f
> Author:     Sean Christopherson <seanjc@google.com>
> AuthorDate: Thu Oct 10 11:23:56 2024 -0700
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Mon Feb 17 10:04:56 2025 +0100
> 
>     KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
>     
>     [ Upstream commit 419cfb983ca93e75e905794521afefcfa07988bb ]
>     
>     Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
>     and continue the inexorable march towards the demise of
>     kvm_pfn_to_refcounted_page().
>     
>     Signed-off-by: Sean Christopherson <seanjc@google.com>
>     Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>     Message-ID: <20241010182427.1434605-55-seanjc@google.com>
>     Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")
>     Signed-off-by: Sasha Levin <sashal@kernel.org>

All now reverted, sorry about that.

greg k-h

