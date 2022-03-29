Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FD4EA917
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 10:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSMvH1P7Fz2xlF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 19:20:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Grb80NNN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Grb80NNN; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSMtg3pX3z2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 19:19:54 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id m22so16689301pja.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+BQQikJPmuFMFFUhgZstKn2ehOJbUcy0wVlEIm+OMNw=;
 b=Grb80NNNkoGpRBPmdHSOINVeVj5NHWTYZDw4p0Gd4C7kZo5pZ3YO09zzKwGWcc3wzI
 QUA8OUPiK8AXC1qgRL7j+XEEHEeN4cnAd2GNXADdmo2QXyNHeTr1iJxotobASxgBowha
 1pdQaBy3ASf508g9+mgoPnW5SQlp36l5cgH9AyA/3b6ocQ+jIgrhkd+OZpEiyRxaYwtw
 muwHDFoGMSyKlQNaYX8BLb9l81HyYSsuFv3Zg/nXzeOiOtKqIBTY6n3fuNL/N/oP3YrM
 ZXfQWyrEScXP2KKh3U0z7DyPGbYHnlRFAfcLumsPiKOovquxcI9Mt4isfs6l29RQdzzh
 d7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+BQQikJPmuFMFFUhgZstKn2ehOJbUcy0wVlEIm+OMNw=;
 b=lDigEB8PoW99xY3PlBSECsqmHNeCripNyvnvBV9yc5QgtnaxY9nQtWdTvy93wLu2p3
 hIvt4MzNfsBKlamNo+vjadeF/MGT278fX6dRsr9CMdOxIjfrPgiG7ph4no4t/BT48VSo
 FugYoeGSlayHa8S1+p2N4Q1bT73FPts/kYK5lrHoSbU5sRDhy+ZSgJzSHuS0iRXGok93
 Z8UP7MdY3eKg4w80W2KNoXJYlgEQcEDrs6OZ+imD4YA1vFmEhK2R9h96EAapaCjEtC8k
 3MKRNWn5f6abGe9UHeRL1jT6v3TKeEHN2hxAJy5q6bW+I5OVawP7Hk0YFrCd0+iYpU4b
 GcHQ==
X-Gm-Message-State: AOAM53113YMA7uAPxc/1Qjymn/D6WyNOM73mSUuXFncUshhMejw2qlP7
 yQNTIfyxzZG/vH2QJ9c9FvM=
X-Google-Smtp-Source: ABdhPJx8H9NEeDpOiaemybgKimyOiRyvIy8IwHUL8CApJL3bMWqkTws7fvxZaYRlZcBzs9BqmGaPNg==
X-Received: by 2002:a17:90a:9294:b0:1b9:48e9:a030 with SMTP id
 n20-20020a17090a929400b001b948e9a030mr3352342pjo.200.1648541990704; 
 Tue, 29 Mar 2022 01:19:50 -0700 (PDT)
Received: from localhost (58-6-255-110.tpgi.com.au. [58.6.255.110])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056a00080700b004fb28fafc4csm12672527pfk.97.2022.03.29.01.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:19:50 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:19:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix vcore_blocked tracepoint
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220328215831.320409-1-farosas@linux.ibm.com>
In-Reply-To: <20220328215831.320409-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1648541941.gxj49rdes1.astroid@bobo.none>
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of March 29, 2022 7:58 am:
> We removed most of the vcore logic from the P9 path but there's still
> a tracepoint that tried to dereference vc->runner.

Thanks for the fix.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Fixes: ecb6a7207f92 ("KVM: PPC: Book3S HV P9: Remove most of the vcore lo=
gic")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 8 ++++----
>  arch/powerpc/kvm/trace_hv.h  | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index c886557638a1..5f5b2d0dee8c 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4218,13 +4218,13 @@ static void kvmppc_vcore_blocked(struct kvmppc_vc=
ore *vc)
>  	start_wait =3D ktime_get();
> =20
>  	vc->vcore_state =3D VCORE_SLEEPING;
> -	trace_kvmppc_vcore_blocked(vc, 0);
> +	trace_kvmppc_vcore_blocked(vc->runner, 0);
>  	spin_unlock(&vc->lock);
>  	schedule();
>  	finish_rcuwait(&vc->wait);
>  	spin_lock(&vc->lock);
>  	vc->vcore_state =3D VCORE_INACTIVE;
> -	trace_kvmppc_vcore_blocked(vc, 1);
> +	trace_kvmppc_vcore_blocked(vc->runner, 1);
>  	++vc->runner->stat.halt_successful_wait;
> =20
>  	cur =3D ktime_get();
> @@ -4596,9 +4596,9 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u6=
4 time_limit,
>  			if (kvmppc_vcpu_check_block(vcpu))
>  				break;
> =20
> -			trace_kvmppc_vcore_blocked(vc, 0);
> +			trace_kvmppc_vcore_blocked(vcpu, 0);
>  			schedule();
> -			trace_kvmppc_vcore_blocked(vc, 1);
> +			trace_kvmppc_vcore_blocked(vcpu, 1);
>  		}
>  		finish_rcuwait(wait);
>  	}
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 38cd0ed0a617..32e2cb5811cc 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -409,9 +409,9 @@ TRACE_EVENT(kvmppc_run_core,
>  );
> =20
>  TRACE_EVENT(kvmppc_vcore_blocked,
> -	TP_PROTO(struct kvmppc_vcore *vc, int where),
> +	TP_PROTO(struct kvm_vcpu *vcpu, int where),
> =20
> -	TP_ARGS(vc, where),
> +	TP_ARGS(vcpu, where),
> =20
>  	TP_STRUCT__entry(
>  		__field(int,	n_runnable)
> @@ -421,8 +421,8 @@ TRACE_EVENT(kvmppc_vcore_blocked,
>  	),
> =20
>  	TP_fast_assign(
> -		__entry->runner_vcpu =3D vc->runner->vcpu_id;
> -		__entry->n_runnable  =3D vc->n_runnable;
> +		__entry->runner_vcpu =3D vcpu->vcpu_id;
> +		__entry->n_runnable  =3D vcpu->arch.vcore->n_runnable;
>  		__entry->where       =3D where;
>  		__entry->tgid	     =3D current->tgid;
>  	),
> --=20
> 2.35.1
>=20
>=20
