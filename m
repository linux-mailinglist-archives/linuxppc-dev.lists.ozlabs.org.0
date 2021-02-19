Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FC31F4F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:03:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhgxJ0Jl0z3cM4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:03:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Hq1q4ynu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Hq1q4ynu; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhgwv2Vg9z30Jj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:03:08 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id ba1so2792251plb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=MYyTS1/wjznlU/v9GaBg3e/Ma7dOx08FztPRQ5y5qlE=;
 b=Hq1q4ynuFCz5blo4G1nrCE1FA13tIsGAEcqU0lkN+k4W33oAYkmmQHgOCa7bNXvVbd
 MVjfvll4LGVIGCtuqQdROagYlmtiviaFMc2bRxgJw0yyhYFnAbYHww770ei2jfiZ6aUP
 y4Nd4OpUHDs/Z7O1NUhr60eM5CWx0rfOt4H38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=MYyTS1/wjznlU/v9GaBg3e/Ma7dOx08FztPRQ5y5qlE=;
 b=OCZLm6FhTMDqLkSqFGZb3XKaXT84Z6IZU5RHvJJ5TvAXC4VdFvHkd3Ajjmd8tBHPuI
 uax+sze+bLQF6aY6MiyxPO79NWvbHgirE+dqhcM0c2QjfgLd17LtuMc8NYH9974XJYjz
 vqbQWRLizNkaTfwNf861GVfYkMayktV7lmstuoFxugHywRvA7ntVv3qy9xNEtfpBq+T8
 CUdr6vMsedJ3k6wkiE66U6i44/LKFqPX9MuX/yPvYSzC4SW17BNLstIkhJ3sLEK4gfB2
 cw2jokKTRVOniisyMam0CJEed9blNGH48ZO91U6z27ZRuiW4XX8m/207xztJ9X36nt3F
 MYRA==
X-Gm-Message-State: AOAM531MuJTcmVoHk9AIRwETt+yp04MQEqZz/+CpiZ0a6qrjPBz6ITLM
 PhxtdvZAaFpT+Y/ZQw9BquNFqg==
X-Google-Smtp-Source: ABdhPJzvWi0zCztT5Olu5NZaIhs7oxY5snfk/RG6lqe8acnTTpe3q8ceVFCVTXQx18S9P+ZpZ3y0ug==
X-Received: by 2002:a17:90b:e83:: with SMTP id
 fv3mr7686838pjb.204.1613714585297; 
 Thu, 18 Feb 2021 22:03:05 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id p18sm8336399pfn.178.2021.02.18.22.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:03:04 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 2/9] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test
 into KVM
In-Reply-To: <20210202030313.3509446-3-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-3-npiggin@gmail.com>
Date: Fri, 19 Feb 2021 17:03:01 +1100
Message-ID: <87lfbka92i.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> +maybe_skip:
> +	cmpwi	r12,0x200
> +	beq	1f
> +	cmpwi	r12,0x300
> +	beq	1f
> +	cmpwi	r12,0x380
> +	beq	1f
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	/* XXX: cbe stuff? instruction breakpoint? */
> +	cmpwi	r12,0xe02
> +	beq	2f
> +#endif
> +	b	no_skip
> +1:	mfspr	r9,SPRN_SRR0
> +	addi	r9,r9,4
> +	mtspr	SPRN_SRR0,r9
> +	ld	r12,HSTATE_SCRATCH0(r13)
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	GET_SCRATCH0(r13)
> +	RFI_TO_KERNEL
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +2:	mfspr	r9,SPRN_HSRR0
> +	addi	r9,r9,4
> +	mtspr	SPRN_HSRR0,r9
> +	ld	r12,HSTATE_SCRATCH0(r13)
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	GET_SCRATCH0(r13)
> +	HRFI_TO_KERNEL
> +#endif

If I understand correctly, label 1 is the kvmppc_skip_interrupt and
label 2 is the kvmppc_skip_Hinterrupt. Would it be easier to understand
if we used symbolic labels, or do you think the RFI_TO_KERNEL vs
HRFI_TO_KERNEL and other changes are sufficient?

Apart from that, I haven't checked the precise copy-paste to make sure
nothing has changed by accident, but I am able to follow the general
idea of the patch and am vigorously in favour of anything that
simplifies our exception/interrupt paths!

Kind regards,
Daniel

> -- 
> 2.23.0
