Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A66512A55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 06:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpj0F5CJ0z3bq5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 14:13:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F/JO9why;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=F/JO9why; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KphzZ2XHjz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 14:12:40 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id s14so3271689plk.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=io+jKzHun/DVw5+/escf8la1hEu0bh7CLX1jPSTeK14=;
 b=F/JO9whyVX6P0mC9GTWkkIHpJ2qVhAS/VGzRILSJQQtlmaEv63fNx/+5rcWlx3EBef
 Z+sxD833iLzTjlXaGkVV4dQxl8T13yF4uvDY5ccFSTyLGbfHFbpEr93qnPAxPcek1sMn
 PwCHz9kGS2pCjCb3on9BUpRMhxHWcEawaJuvYWIc6gB5V+RBMA7kJJCymSfwkrASY/2F
 +qkukDCX4iuaWOULo0OmMvxVKR/sQh1tnnhQ9dz3qzhgRvNYgg4ebQVeedgSSy/Afnta
 /adZbPnKUd9YCOzSLseW+WLBMQUGI3Ne7cLEtfxaBAEnrxKQ1/NZN25XtscdjBjmCrSh
 Ms+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=io+jKzHun/DVw5+/escf8la1hEu0bh7CLX1jPSTeK14=;
 b=vf5HVQWZSnJlRQutZMfLwNprmYexj5+OYGP6U893dMLst94Bgpvd35AvL1LxUSGMcA
 XyLnHxSa0CblowdYLzZGcHQjjptGbp9q/XzUEOIFYLuY1AztlSZPvgqDIKsq04R9yveJ
 aiT0ZJYd1LAUpuR+Wjr34+3+9wXMblCBWWGnanqkeenuTmlGB6Dbadw+zwz/OwLsKzKm
 +BkLgq8XbGuFJroZbQ4C3timJlNV8xCxj1UnNwAX1Iv3ggrb94VNEbdsWI3ODlhqsYBW
 iUgdFcYYGya5ExrpNxuB9l2XJMCPX5tfc1xz8TGmpQTIwrJgeVYnZYif4CAngMinLEyp
 Q0qA==
X-Gm-Message-State: AOAM532HcaobWmzLKfjcaXKB5dIzKdYNIwKDNiU260vXKPqCjqzSbDyZ
 q4gY+D83tyHw4a2+G7iPox4=
X-Google-Smtp-Source: ABdhPJxMomsldnYQpSewhOKG2Jkua0Lv2p4xeHWBFC1Yd4ibjIORF+fWCVPmEMgtlMtiVhkMHcDW7Q==
X-Received: by 2002:a17:90a:1116:b0:1d9:a41a:d13d with SMTP id
 d22-20020a17090a111600b001d9a41ad13dmr15601739pja.206.1651119156838; 
 Wed, 27 Apr 2022 21:12:36 -0700 (PDT)
Received: from localhost (193-116-105-54.tpgi.com.au. [193.116.105.54])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm21733118pfu.120.2022.04.27.21.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 21:12:36 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:12:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Initialize AMOR in nested entry
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220425142151.1495142-1-farosas@linux.ibm.com>
In-Reply-To: <20220425142151.1495142-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1651118922.7qh15cf4pc.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of April 26, 2022 12:21 am:
> The hypervisor always sets AMOR to ~0, but let's ensure we're not
> passing stale values around.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Looks like our L0 doesn't do anything with hvregs.amor ?

Thanks,
Nick

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6fa518f6501d..b5f504576765 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3967,6 +3967,7 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vc=
pu *vcpu, u64 time_limit, uns
> =20
>  	kvmhv_save_hv_regs(vcpu, &hvregs);
>  	hvregs.lpcr =3D lpcr;
> +	hvregs.amor =3D ~0;
>  	vcpu->arch.regs.msr =3D vcpu->arch.shregs.msr;
>  	hvregs.version =3D HV_GUEST_STATE_VERSION;
>  	if (vcpu->arch.nested) {
> --=20
> 2.35.1
>=20
>=20
