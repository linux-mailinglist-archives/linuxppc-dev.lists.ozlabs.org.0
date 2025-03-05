Return-Path: <linuxppc-dev+bounces-6744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B140A502BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 15:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7Fsx4HhQz307q;
	Thu,  6 Mar 2025 01:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741186405;
	cv=none; b=BriJm/7/2qMPaTRA94j5G2sEprRhOwT791q3TzhCUFLIMeOAOWXVSdPyUbGyufTeefGFJThLKIBicUeuPAC57Yzx5GFZugi/oUAKS8OcRQbwVKMYe2LY35RdjSxgTdwhmPDJBqpdxq2P5bL6wzZ6ryixf/5OrxmNa4LyWJ0kkudl5AZYKU2NBnmHbPd4PaeTBb14cy2Xm9QG7HUkSFMynA5SXHhXozxd8oJfaQ4a2suFhSt6sO0SjdNLlgq9ZdVcFghmK3xvWRyuNaiBK4GKqOyFJqPapYzBznEo1nJKHk9C4yjo5lanfnkgRG2fY75t6tkdam4qiaje124zNJqxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741186405; c=relaxed/relaxed;
	bh=Qu1YW5U539CmDNjnWklLjoJJJx5nCfEh8QEnX9CfqX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H+xiZuuabTIsE0bMak4UFbW16tCOq1SZMbzVFc8Z142Jd4TmHs88cDidvGBvdX67aeJ5YJMHRKEAXJQyhaQGnhazgejo6pUT//r++nvQhzQ/Cwp3WFE69SshyITEqQ9NDWw5lkTBDr/mW1CthQCc8D5q7d1rZ38Ar5XeL80wAZx0AeNxAAsXixET6krysWtdNa3ijlK1YigX+aVUBIuI3vyVi6/1s0J9roQFJ52KNrrvfIq+9mnoifWA8rcyPjpJzkw8vsHv8GGJANS7OikU6IdT+mizfGBK18/U6m+gFGAETGzHaIxz8l+cADC1x2vO0qQvBzZIBWuXQXu9cDpRhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=i1GPa4fD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ywxizwykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=i1GPa4fD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ywxizwykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7Fsv5wf7z2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 01:53:22 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fea1685337so1793500a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 06:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741186401; x=1741791201; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1YW5U539CmDNjnWklLjoJJJx5nCfEh8QEnX9CfqX8=;
        b=i1GPa4fDpcogYwf7/fGlrPMn1hNXT/NxHutMMq/JoNu99JQoPp186WSlPpAD15cM6N
         C0uPl4+K+ddsNYx2V2HDzk7IkUEiwhgaCoZW5tWwyV95Th6ad2JVvhtfM1GxRwMBc8OH
         WDgKYLxtA94WqvnD1ClTvgKWyz+gXoHj6Vc69olJrAQtBlXyPR9ikXLe12I96u2DZhca
         XKLJwxhhFA3g10cqykoz1ZqS+ikMIh5ddEKAgkoF+VxFGCbOJsd+Qf83ctrkRxS91nSq
         qUJ1fuvV2lHa2Xml5MA0+k0v1gneMqoOMfA0fwRul+RrZOoK/j3nTbNJbky+O/qSseQc
         zaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186401; x=1741791201;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1YW5U539CmDNjnWklLjoJJJx5nCfEh8QEnX9CfqX8=;
        b=AGkSXyaiyccnoh9nh98TWegScuTwUASd57q93dZtXld+VrtJfP+skSom5oBDu08Oc4
         +9Q/kQndGrR6uklTVJdu1gfZHOQrEw00Gk9RH412oA8HTn9cHhTSsg3oVgjVMvz14DdI
         sAn+ktGbzZH/fUFFm1xFQUPP1RwnUh6ceAIcolIXPQSxF2gD3ihBszINaXM/U4Llcsa+
         BsqdBLKLkbPKxcKEQg3pA9HqSZby7dU+N1nybe1FNN11GcekB5iOiaWcu3H6s4bpNWM4
         OKgWsGVDHGq+2cQ/9tsjyeqTQjfMAcLe6+rAdW0I3ITROG23dzuGqnRzbOxzzzZrxYyr
         JPng==
X-Forwarded-Encrypted: i=1; AJvYcCUeC9nLXeT+C+hJYjOeqDYk4Lf1iTAZItRNeSq+7fJ+mXssG2NLN98Kys0/GQE/ZnlPliYBRv1vZiDQ/+8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw49EX++/cmsR/Mw+/DeOsQrL8OFA4X/1VN63WiadpIRRVHa1d+
	iJePk0uPTFiofTkCTdg119f+SuM09pMWKSROfCI1ifSHVQimEY3fYkBYS0GRaCogexrkO2fGtOJ
	uIQ==
X-Google-Smtp-Source: AGHT+IHAYzQscJ8h7qg5HkSjPcaVcG06YIt5n669L2SaCaC2sybvLMQURj9aN7SRU326Fz9IYsQdsLpJF/s=
X-Received: from pfbft1.prod.google.com ([2002:a05:6a00:81c1:b0:730:9146:35ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f84:b0:2fa:1d9f:c80
 with SMTP id 98e67ed59e1d1-2ff33c2129amr12121356a91.17.1741186401066; Wed, 05
 Mar 2025 06:53:21 -0800 (PST)
Date: Wed, 5 Mar 2025 06:53:19 -0800
In-Reply-To: <2025030516-scoured-ethanol-6540@gregkh>
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
References: <20250112095527.434998-4-pbonzini@redhat.com> <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
 <2025030516-scoured-ethanol-6540@gregkh>
Message-ID: <Z8hlXzQZwVEH11fB@google.com>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
From: Sean Christopherson <seanjc@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, regressions@lists.linux.dev, 
	Trevor Dickinson <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au, 
	Darren Stevens <darren@stevens-zone.net>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 05, 2025, Greg KH wrote:
> On Wed, Mar 05, 2025 at 03:14:13PM +0100, Christian Zigotzky wrote:
> > Hi All,
> > 
> > The stable long-term kernel 6.12.17 cannot compile with KVM HV support for e5500 PowerPC machines anymore.
> > 
> > Bug report: https://github.com/chzigotzky/kernels/issues/6
> > 
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/x5000_defconfig
> > 
> > Error messages:
> > 
> > arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
> > arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of function '__kvm_faultin_pfn' [-Werror=implicit-function-declaration]
> >    pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> >          ^~~~~~~~~~~~~~~~~
> >   CC      kernel/notifier.o
> > arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of function 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-Werror=implicit-function-declaration]
> >   kvm_release_faultin_page(kvm, page, !!ret, writable);
> > 
> > After that, I compiled it without KVM HV support.
> > 
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/e5500_defconfig
> > 
> > Please check the error messages.
> 
> Odd, what commit caused this problem?  Any hint as to what commit is
> missing to fix it?

833f69be62ac.  It most definitely should be reverted.  The "dependency" for commit
87ecfdbc699c ("KVM: e500: always restore irqs") is a superficial code conflict.

Oof.  The same buggy patch was queue/proposed for all stable trees from 5.4 onward,
but it look like it only landed in 6.1, 6.6, and 6.12.  I'll send reverts.

commit 833f69be62ac366b5c23b4a6434389e470dd5c7f
Author:     Sean Christopherson <seanjc@google.com>
AuthorDate: Thu Oct 10 11:23:56 2024 -0700
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Mon Feb 17 10:04:56 2025 +0100

    KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
    
    [ Upstream commit 419cfb983ca93e75e905794521afefcfa07988bb ]
    
    Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
    and continue the inexorable march towards the demise of
    kvm_pfn_to_refcounted_page().
    
    Signed-off-by: Sean Christopherson <seanjc@google.com>
    Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-ID: <20241010182427.1434605-55-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")
    Signed-off-by: Sasha Levin <sashal@kernel.org>

