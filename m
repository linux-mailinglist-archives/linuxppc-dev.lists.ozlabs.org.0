Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7316F84B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:03:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6GL5tjnzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:03:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NqCM7Mw+; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5z16LRPzDqcN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:50:21 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id u12so814035pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 22:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Dyi3LDVfYP/T9T0L+kYKwVivO3oe5wJ8DGKkzikRHUg=;
 b=NqCM7Mw+e1JGqrmQO3fBOB2Yfs8bbYBd1zrNxSlZryJ6oEfe14reMzO2jiLaXTRG/2
 yQhRzSIjhjm2utXWpzNwAcR9NC7uln2MZ97Mn37T8lpWde1c7lMbbb3W7g2uZeLKbpq8
 ieJF4vizVJeWkuFgdPKnY+dEKbsZ1BPZTmIodFdrMAxLOhXBea7K0lnsF21ndVXjoQX/
 J6pvmAH5v+yy6in4Q9bBLljYVS5sGZIazk1Pj0k/ggSh76lKQdOLzoseEQJeAnH5e+eh
 N39YXhMKFjOUeCDe54uK9G/dknSftVg3YSIGgmii2zBLeVVMZDzcYVn/yUpapci8yoJm
 ylEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Dyi3LDVfYP/T9T0L+kYKwVivO3oe5wJ8DGKkzikRHUg=;
 b=At9KNOEb6n7wCQbLR7w2oheP80X96h1SJEwspgGxsaKcst/SeM99iuffiWKVSoklj6
 nh4pmv82JG7dn2oD0Myw1mSdUIhBdN7D6IEQVpbdQoFdBu2PIbtmcap2aZxBD4CZ0rZx
 om+eLt2ozzkfBInoyEzybT2yFns0up/yH124lu/zrjAYtFBKIK/vMp6KmPzNCIda4Xqe
 7AJIzwlxe51B/es+R2pbzfurXS0Z91QUZb8ie/2HE9MYLybpf3oLZF+Uw8OEphXXkxQo
 pkCJ//aSYuv+2wt6HDtvoU6+wYZwpzYpbP4kXwE+m/EgaLFu3Zdc4jaYGS/auSfpjO5v
 SutA==
X-Gm-Message-State: APjAAAVm/tZrO1sBRhKi9CRZ4KLnNchAz7qF14Y8fCkDfywg36nC4fjb
 Ygrs8y/rww+IZrwTSggA/pw=
X-Google-Smtp-Source: APXvYqwglkAUIcYT4TeCdk0f0hTPYrBC5RX6JKqPq/KmEKOJNmRL4TDYdcZbnZvRV1YCCwMnNQpfuw==
X-Received: by 2002:a63:be09:: with SMTP id l9mr2353259pgf.439.1582699816227; 
 Tue, 25 Feb 2020 22:50:16 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id k9sm1268109pjo.19.2020.02.25.22.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 22:50:15 -0800 (PST)
Date: Wed, 26 Feb 2020 16:46:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 01/14] powerpc: Enable Prefixed Instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-2-jniethe5@gmail.com>
In-Reply-To: <20200226040716.32395-2-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582698829.pxzksoow7n.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 26, 2020 2:07 pm:
> From: Alistair Popple <alistair@popple.id.au>
>=20
> Prefix instructions have their own FSCR bit which needs to enabled via
> a CPU feature. The kernel will save the FSCR for problem state but it
> needs to be enabled initially.
>=20
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> ---
>  arch/powerpc/include/asm/reg.h    |  3 +++
>  arch/powerpc/kernel/dt_cpu_ftrs.c | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 1aa46dff0957..c7758c2ccc5f 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -397,6 +397,7 @@
>  #define SPRN_RWMR	0x375	/* Region-Weighting Mode Register */
> =20
>  /* HFSCR and FSCR bit numbers are the same */
> +#define FSCR_PREFIX_LG	13	/* Enable Prefix Instructions */
>  #define FSCR_SCV_LG	12	/* Enable System Call Vectored */
>  #define FSCR_MSGP_LG	10	/* Enable MSGP */
>  #define FSCR_TAR_LG	8	/* Enable Target Address Register */
> @@ -408,11 +409,13 @@
>  #define FSCR_VECVSX_LG	1	/* Enable VMX/VSX  */
>  #define FSCR_FP_LG	0	/* Enable Floating Point */
>  #define SPRN_FSCR	0x099	/* Facility Status & Control Register */
> +#define   FSCR_PREFIX	__MASK(FSCR_PREFIX_LG)

When you add a new FSCR, there's a couple more things to do, check
out traps.c.

>  #define   FSCR_SCV	__MASK(FSCR_SCV_LG)
>  #define   FSCR_TAR	__MASK(FSCR_TAR_LG)
>  #define   FSCR_EBB	__MASK(FSCR_EBB_LG)
>  #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
>  #define SPRN_HFSCR	0xbe	/* HV=3D1 Facility Status & Control Register */
> +#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
>  #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
>  #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
>  #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_c=
pu_ftrs.c
> index 182b4047c1ef..396f2c6c588e 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -553,6 +553,28 @@ static int __init feat_enable_large_ci(struct dt_cpu=
_feature *f)
>  	return 1;
>  }
> =20
> +static int __init feat_enable_prefix(struct dt_cpu_feature *f)
> +{
> +	u64 fscr, hfscr;
> +
> +	if (f->usable_privilege & USABLE_HV) {
> +		hfscr =3D mfspr(SPRN_HFSCR);
> +		hfscr |=3D HFSCR_PREFIX;
> +		mtspr(SPRN_HFSCR, hfscr);
> +	}
> +
> +	if (f->usable_privilege & USABLE_OS) {
> +		fscr =3D mfspr(SPRN_FSCR);
> +		fscr |=3D FSCR_PREFIX;
> +		mtspr(SPRN_FSCR, fscr);
> +
> +		if (f->usable_privilege & USABLE_PR)
> +			current->thread.fscr |=3D FSCR_PREFIX;
> +	}
> +
> +	return 1;
> +}

It would be good to be able to just use the default feature matching
for this, if possible? Do we not do the right thing with=20
init_thread.fscr?


> +
>  struct dt_cpu_feature_match {
>  	const char *name;
>  	int (*enable)(struct dt_cpu_feature *f);
> @@ -626,6 +648,7 @@ static struct dt_cpu_feature_match __initdata
>  	{"vector-binary128", feat_enable, 0},
>  	{"vector-binary16", feat_enable, 0},
>  	{"wait-v3", feat_enable, 0},
> +	{"prefix-instructions", feat_enable_prefix, 0},

That's reasonable to make that a feature, will it specify a minimum
base set of prefix instructions or just that prefix instructions
with the prefix/suffix arrangement exist?

You may not need "-instructions" on the end, none of the other=20
instructions do.

I would maybe just hold off upstreaming the dt_cpu_ftrs changes for
a bit. We have to do a pass over new CPU feature device tree, and
some compatibility questions have come up recently.

If you wouldn't mind just adding the new [H]FSCR bits and faults
upstream for now, that would be good.

Thanks,
Nick
=
