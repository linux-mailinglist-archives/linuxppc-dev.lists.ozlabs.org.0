Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE7325D60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmzhB227dz3cnf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 17:07:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=cGJiVIMr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=cGJiVIMr; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmzgm0f5sz3cTY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 17:06:42 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id i14so3756484pjz.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 22:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1mVcmt0ZvY7Uv/jshYVKfExfLIN+9bxYoK2/ZcoShx8=;
 b=cGJiVIMr+BajjT84h1CERxfdSJ3E9SkaPODfTg0VPl8zt7WtkAIIeox4NipnJW/mjd
 ix/M4jOuC6+pdsz2is5lgyU2cY3Bfb2EsW34KmCrSenAEl6O6BqSvWNcdm9Mt54qt0Dh
 o81KFKm2HQQG2a8yymigwn0RoQyEPoAMFWq4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1mVcmt0ZvY7Uv/jshYVKfExfLIN+9bxYoK2/ZcoShx8=;
 b=InB+cdn406GVxbhlAtRJf84FqNYQ+Usa+yjMx1jidFYyoUmr4y2bs9PjF69NXpUf40
 vc8UY5s1c9iTYukXFI3QMVihE8uFNsMq6VNTN6pfTiKwmw+bIGvN9PrTjBtae1L0Fnb1
 bh1KVeV9vcjd9pqlc4y1RRJ/2rVRs/r3n6XDVwyWyp3oGPsMeNidubdRIZTUokP6vOd8
 fPSeEBbIma3UZ5XuLuK6w9QuMuSj5tVDTIhC1FE+r6TlBpjbvmslb6p3U9YJf9N1d9lk
 2uDXGiggDKUlOngXAGgH1SAWLjqtlOmyTexsTv2GdELKvHI2W5Hpqwj8CAQIPYJZ2C21
 t8bw==
X-Gm-Message-State: AOAM5335LkMhD7+62La9eyWeofuKsQ0IHwMjI2e2jg6yjLzfHDMJ0pOb
 Ckh9XevuSdfjrmPRynSWB1K3MA==
X-Google-Smtp-Source: ABdhPJxRVDYc+YcFZabj+EZQgRYsNoYJYXUYFQ5jIxIuNmSPMuoJ9AG0F5STIxLuj5dRAWfpb1Nv7Q==
X-Received: by 2002:a17:90b:1b47:: with SMTP id
 nv7mr1758380pjb.235.1614319600443; 
 Thu, 25 Feb 2021 22:06:40 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id q13sm8167423pfs.183.2021.02.25.22.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 22:06:40 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 05/37] KVM: PPC: Book3S HV: Ensure MSR[ME] is always
 set in guest MSR
In-Reply-To: <20210225134652.2127648-6-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-6-npiggin@gmail.com>
Date: Fri, 26 Feb 2021 17:06:37 +1100
Message-ID: <87zgzr8is2.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

>  void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
>  {
> +	/*
> +	 * Guest must always run with machine check interrupt
> +	 * enabled.
> +	 */
> +	if (!(msr & MSR_ME))
> +		msr |= MSR_ME;

This 'if' is technically redundant but you mention a future patch warning
on !(msr & MSR_ME) so I'm holding off on any judgement about the 'if' until
I get to that patch :)

The patch seems sane to me, I agree that we don't want guests running with
MSR_ME=0 and kvmppc_set_msr_hv already ensures that the transactional state is
sane so this is another sanity-enforcement in the same sort of vein.

All up:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> +
>  	/*
>  	 * Check for illegal transactional state bit combination
>  	 * and if we find it, force the TS field to a safe state.
> -- 
> 2.23.0
