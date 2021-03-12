Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F23384DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 06:08:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxYk06TlCz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 16:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=iiFmQA/u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=iiFmQA/u; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxYjb1Hmnz3cJF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 16:07:59 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id gb6so4582770pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 21:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Aw8LdrIy0N+x7RWdCdmmkmT4qhnI7TsuuwjFLzDAHCg=;
 b=iiFmQA/ujrKz79YHZfVGSeFKgwmlp1xcvs5qM1LU+dCINPeVoAVxJCPmTzVvT7nUog
 SfKW53M7u4loOU2OJnzuOO9IFWGOfkXsrPtf0NMSuWyU1q1LmVpw9wr/xSMFtW/q7N9i
 QkMVEF6qW2xnLWxjVfOBnJqhrTTuKYOD1j74s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Aw8LdrIy0N+x7RWdCdmmkmT4qhnI7TsuuwjFLzDAHCg=;
 b=T7ZMFOUL44Lkok+c2jvWheXXnZ8xf06n10eMVchOKrKRbGiLmFCXXDytGH7O17HDNQ
 w7tDW+zejEB1AxIy3gj8wUof1OpqRASfUoUenONMHTg7X77UHAuoDfrk47DT9yA90WeG
 TAg+sv+DTlQoUQ5kPkfUVABdO5OXcFRZRXhXCP5NpOtrmKh7hmhOC+uWudnlHxtd1t7W
 7Rq+Mij+8KD0pcXpOQUI3aulquHt5xLtC29dYhhUbEd+iMJuhIpR6xFjMAytp7QHP4tn
 t7PSdrv8mcEqLPEsIa++J6G+GqwRbRtSz/ivTjiH5wruNDV0Eu/MOItWBqIRo84eD5Ev
 D9Qg==
X-Gm-Message-State: AOAM533l3TQmKUPNAXAUXae8WAMori1QUrZc/ymOhRQgVzuOjttX+8IJ
 9rbZj9Zz9vftCD3jFyQhrOC84Q==
X-Google-Smtp-Source: ABdhPJyDC5thnbRF6vH+OWtFPtshcHt9zGNXl3bAvIhIAAiWc8LkvHsuU8eEV6jCKV5y1HazdorJHg==
X-Received: by 2002:a17:903:22d2:b029:e5:df4f:3d64 with SMTP id
 y18-20020a17090322d2b02900e5df4f3d64mr11868068plg.37.1615525676335; 
 Thu, 11 Mar 2021 21:07:56 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id 134sm3978946pfc.113.2021.03.11.21.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 21:07:55 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 03/41] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
In-Reply-To: <20210305150638.2675513-4-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-4-npiggin@gmail.com>
Date: Fri, 12 Mar 2021 16:07:52 +1100
Message-ID: <87ft117ydz.fsf@linkitivity.dja.id.au>
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

> This SPR is set to 0 twice when exiting the guest.
>
Indeed it is.

I checked the ISA because I'd never heard of the PSPB SPR before! It's
the Problem State Priority Boost register. Before I knew what it was, I
was slightly concerned that the chip might change the value while the
other mtsprs were running, but given that it's just affects the priority
boost states that problem state can use, I don't think that is actually
going to happen.

I also checked the commit that introduced it - commit 95a6432ce903
("KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix
guests"), and there wasn't any justification for having a double mtspr.

So, this seems good:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel


> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 2e29b96ef775..0542d7f17dc3 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3758,7 +3758,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	mtspr(SPRN_DSCR, host_dscr);
>  	mtspr(SPRN_TIDR, host_tidr);
>  	mtspr(SPRN_IAMR, host_iamr);
> -	mtspr(SPRN_PSPB, 0);
>
>  	if (host_amr != vcpu->arch.amr)
>  		mtspr(SPRN_AMR, host_amr);
> -- 
> 2.23.0
