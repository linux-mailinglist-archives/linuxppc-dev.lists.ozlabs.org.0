Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FACC3704EA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 04:05:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXCHg01gNz309c
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 12:05:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Il8/p3uU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Il8/p3uU; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXCHB3fGlz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 12:04:51 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id y1so21890906plg.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=OqlARIZFGaQEYSUN7r1N3UZjjucgcBkK/+tx6C+Zyu4=;
 b=Il8/p3uUo1d9BjKXjJz9vrAE7TpJmC4eoYx7tZ3r7iaelPrbc3PqnO4iFXsahEXU2x
 RYsUaf+kPEK6o2rv2Izl0zM73SaE55AwnA7bM7q4DegJL6AZe1dUhYQSU6ooxz8B9vZt
 luuSHN+X0Vg0dpuLeFTotZRVOyLV62KYanxZDvd33MNS6E02iFRBC+XXgH346E9GteIH
 SY7iN4IL25wTOSb8QsavA6w+ZJ5C4DRLllqRbK7JyKQ7cojTD6MSeR5qn8ZnZL4/ICDp
 7njhP6MxhNCFFeZoKLBAzPzrS147mvzGsGNOk/Bu2I6XE0rmWESlwoRBAFYoIoaV3RJG
 emLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=OqlARIZFGaQEYSUN7r1N3UZjjucgcBkK/+tx6C+Zyu4=;
 b=CTwI4NlJ1WpR7c8u9+6LElnJF5mJnbW8he4ouYpTA7J+W6sRMqI6eX0S15lsw39C/F
 FdDLZ2IhADvYNB3yziUAiAK39U3C0I3amPqBlwW7Pc0pSq9uPG6pv7GfA8Q+DZmnQ4aE
 Cjac0E98HfKCwFA0kAFnP5rfDRAWtDG0PFokmhREnPvIsNpTq1y495Iqfigsgj5s6KTm
 UOk/pZvy9hAm2wM6rRxXvty8/dE5xMIdw77LbXuhx6nwI7tmfo/o5cEA6HuCfPfN0DvD
 CQXniAty5mV459IXKtDhVsQjUrGw/gQdy55Q7gJ2JaEBeQedI3vVlO7ZJxs2A+T6EJNy
 UZuQ==
X-Gm-Message-State: AOAM530WdBgBLQ/VEhxpL8v7sO4jhpbcoJkGgY4kCJVRadKfuLqgXLNL
 5+90srSjChfm+shAdXdBiMhKtqtL/VYCSQ==
X-Google-Smtp-Source: ABdhPJxo3OsZ9dn384DmMOWfnFR5URsVUNBG17f/wxigK1KU6u2h9Je/gIqOc+vWg1qWmhTPzayGTg==
X-Received: by 2002:a17:90a:c28e:: with SMTP id
 f14mr8460177pjt.56.1619834688530; 
 Fri, 30 Apr 2021 19:04:48 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id e2sm3118070pjk.31.2021.04.30.19.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 19:04:48 -0700 (PDT)
Date: Sat, 01 May 2021 12:04:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/2] KVM: PPC: Book3S HV: Stop forwarding all HFSCR
 cause bits to L1
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210415230948.3563415-1-farosas@linux.ibm.com>
 <20210415230948.3563415-3-farosas@linux.ibm.com>
In-Reply-To: <20210415230948.3563415-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1619834387.ttgzg40bpb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oh sorry, I didn't skim this one before replying to the first.

Excerpts from Fabiano Rosas's message of April 16, 2021 9:09 am:
> Since commit 73937deb4b2d ("KVM: PPC: Book3S HV: Sanitise hv_regs on
> nested guest entry") we have been disabling for the nested guest the
> hypervisor facility bits that its nested hypervisor don't have access
> to.
>=20
> If the nested guest tries to use one of those facilities, the hardware
> will cause a Hypervisor Facility Unavailable interrupt. The HFSCR
> register is modified by the hardware to contain information about the
> cause of the interrupt.
>=20
> We have been returning the cause bits to the nested hypervisor but
> since commit 549e29b458c5 ("KVM: PPC: Book3S HV: Sanitise vcpu
> registers in nested path") we are reducing the amount of information
> exposed to L1, so it seems like a good idea to restrict some of the
> cause bits as well.
>=20
> With this patch the L1 guest will be allowed to handle only the
> interrupts caused by facilities it has disabled for L2. The interrupts
> caused by facilities that L0 denied will cause a Program Interrupt in
> L1.

I'm not sure if this is a good solution. This would be randomly killing=20
guest processes or kernels with no way for them to understand what's going
on or deal with it.

The problem is really a nested hypervisor mismatch / configuration=20
error, so it should be handled between the L0 and L1. Returning failure
from H_ENTER_NESTED, for example (which is probe-able, but not really=20
any less probe-able than this approach).

Thanks,
Nick

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 270552dd42c5..912a2bcdf7b0 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -138,6 +138,23 @@ static void save_hv_return_state(struct kvm_vcpu *vc=
pu, int trap,
>  	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
>  		hr->heir =3D vcpu->arch.emul_inst;
>  		break;
> +	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
> +	{
> +		u8 cause =3D vcpu->arch.hfscr >> 56;
> +
> +		WARN_ON_ONCE(cause >=3D BITS_PER_LONG);
> +
> +		if (hr->hfscr & (1UL << cause)) {
> +			hr->hfscr &=3D ~HFSCR_INTR_CAUSE;
> +			/*
> +			 * We have not restored L1 state yet, so queue
> +			 * this interrupt instead of delivering it
> +			 * immediately.
> +			 */
> +			kvmppc_book3s_queue_irqprio(vcpu, BOOK3S_INTERRUPT_PROGRAM);
> +		}
> +		break;
> +	}
>  	}
>  }
> =20
> --=20
> 2.29.2
>=20
>=20
