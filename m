Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581F47F2E1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLfrg3Hcgz2x9B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bptPorC3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bptPorC3; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLfr10rsdz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:12:33 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id w7so7518932plp.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=jSLMI+swcvFHPJkOVD0EgcDum0m3RTXwA5m9h03P6Qo=;
 b=bptPorC3YmKkBbB0HNIE3hk65qb3ngCvsexK96XHRSZx03YYgQ/Nlj0GlVxIT3/MjI
 PW+F25WIHfFcdpkr+M0Cb8Q4DA/GsOhPEo2CSWRoiZbGYZyGIB7QgnC0Dpc0IsHYHCAd
 2HdeFHwmaGzjzUELfXOa+QF3oBmk0iJo1Oc+r4faSK/hiVfmLn7694UkO9XQyOe7PgRb
 pSqh2teO+41Sg0fqMPXnpmc1BtwAdTlaNgSoLBfo0mpMUjQlLG25uklIgPsym2idMnXq
 bn7xlNYMUWHO2mZO1GVsxI7oKieP/frOD/wPlujELR6VKnxL5YNs8Yxf3UpiEAOk+h5S
 cFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=jSLMI+swcvFHPJkOVD0EgcDum0m3RTXwA5m9h03P6Qo=;
 b=yTkearub1nkyCen3ip2DejGCIDUhIModV4BAMrJb+Ik2nZQeX7TauR95x2of2VCYEC
 TUGl4cfwZ9lTbxbfudJ5jcpRsotKwnaiOH1NXU2ySndcgIA/XhbB0Y6BDmMphIAGIK6D
 mq05o+eeaogTCXyPrZH+INzlxJaTykha37chpFfYgcTGYq2ZHy8XezQSLz2PYWp3FEcN
 M1rDq+zFfqT7mhkcaULZewW7LKhCaRMbLLhihUB4bgOCaFx8w0D1pzBwH5RECsU3+6qR
 5VpXqnT1mj5BAIJYJFQUOy2HwE7c6236X96drQ4p4qkHXcC3aAGnq8yLs7G2INn2bMxG
 lOrA==
X-Gm-Message-State: AOAM5302nDQMROoJ28u6F4TOGSxTMnxd88Rj37GetFHxubdoiwG6EZkA
 AM7q/Ck8d5oTy9gApufGnnY=
X-Google-Smtp-Source: ABdhPJxFmMOXm1Fq1zCbSVfMSfhS9Nc0LvpLZy984QoCsONH9ZkF2hjHrvBDGjKcPuHqN/KN6yWZNw==
X-Received: by 2002:a17:902:ab1a:b0:148:b34f:5bee with SMTP id
 ik26-20020a170902ab1a00b00148b34f5beemr9727974plb.157.1640427150179; 
 Sat, 25 Dec 2021 02:12:30 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id f20sm12408453pfe.166.2021.12.25.02.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:12:29 -0800 (PST)
Date: Sat, 25 Dec 2021 20:12:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] KVM: PPC: Fix vmx/vsx mixup in mmio emulation
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20211223211528.3560711-1-farosas@linux.ibm.com>
 <20211223211528.3560711-3-farosas@linux.ibm.com>
In-Reply-To: <20211223211528.3560711-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1640427087.r4g49fcnps.astroid@bobo.none>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of December 24, 2021 7:15 am:
> The MMIO emulation code for vector instructions is duplicated between
> VSX and VMX. When emulating VMX we should check the VMX copy size
> instead of the VSX one.
>=20
> Fixes: acc9eb9305fe ("KVM: PPC: Reimplement LOAD_VMX/STORE_VMX instructio=
n ...")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Good catch. AFAIKS handle_vmx_store needs the same treatment? If you
agree then

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kvm/powerpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 1e130bb087c4..793d42bd6c8f 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1507,7 +1507,7 @@ int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
>  {
>  	enum emulation_result emulated =3D EMULATE_DONE;
> =20
> -	if (vcpu->arch.mmio_vsx_copy_nums > 2)
> +	if (vcpu->arch.mmio_vmx_copy_nums > 2)
>  		return EMULATE_FAIL;
> =20
>  	while (vcpu->arch.mmio_vmx_copy_nums) {
> --=20
> 2.33.1
>=20
>=20
