Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9618F01C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 08:07:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m5715f3pzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:07:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JvXB6i6/; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m54x1npbzDqtN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:05:52 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id b22so6728150pgb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=BrAJ3Il5fsSoa36EGbb5otH7Jxi2fT0UcBh22snMC7Y=;
 b=JvXB6i6/O3tw+cQulT1efGYxEY08jhv1/ye+TyNgC+mQ8e/XAA/rnL4JRnmOZtxPuY
 dgajgy3x1QnFC9Aq8yR3jSiwIDC4Pg0YyhMwC6ZuTLHShNuDhlDDvufZE1kiQVB6v63k
 L5muaBh/BzlTD40/zLl1SIpuFDT+1Vaz8XXXz9nvvnRQ6vuZaanf+UTayDOiWgxfsmRb
 V1/aFvKjESi6PQINyzIfMKk0qYOI8IxXkabaBky6cJZifH+kMC1t4uuRX3r9LJobjkoh
 iwnn+3BtxAgw6z/tPcidwOJh8rhi2A0SmNw/iQ1urPBtcxmmkkHgbS/JUWx1qLOsbxNw
 D/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=BrAJ3Il5fsSoa36EGbb5otH7Jxi2fT0UcBh22snMC7Y=;
 b=Tdp1H5E6JLWWePbrNuZnxliJ0yU2gYIwxcSlZaNNstRfeilQeogULg1ByUvYWfitAk
 VlzIkrxiUYMC8jrVMTYLkiGqw3bbbysXjJWDJq1TO/8VdsjISIWOyjHPD7tAq4mUGz12
 7XsQg222Xh+mnJKw9yrlBFA9H1iKVbTDEFCXc08w5L7qOLXG9xFZ4dz5GzAsLBFpNRyC
 wOtFZXyTMB1lEONi64OyzNk9iUsJoNF33XsMJY7IuFFAhcSF5oMOcPGThJfCxmjnk2CQ
 xENO78iUZe/ufWTqBBzxAkcemqNfmLJ16BOh+lVyHeQAFgh4lCmmFiVPhHkewOsEbGQc
 1PuQ==
X-Gm-Message-State: ANhLgQ0miCI9zT9uH4+0wogMrl+uLbQkJW2GldTJebhlIGRs8yUaH+df
 eb1T0TpynPZMmNwUmcllf7o=
X-Google-Smtp-Source: ADFU+vsprKu4RBEhsVcyLUNku1Xc17rhxOtDbyW/AbRGCVXS+hDlgvdiq72BAfo4oPLynA2Jxo6g9g==
X-Received: by 2002:a62:64c9:: with SMTP id y192mr23018093pfb.26.1584947150826; 
 Mon, 23 Mar 2020 00:05:50 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id 11sm12312786pfz.91.2020.03.23.00.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 00:05:50 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:02:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 11/16] powerpc: Enable Prefixed Instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-12-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-12-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584946911.tca3c5485p.astroid@bobo.none>
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

Jordan Niethe's on March 20, 2020 3:18 pm:
> From: Alistair Popple <alistair@popple.id.au>
>=20
> Prefix instructions have their own FSCR bit which needs to enabled via
> a CPU feature. The kernel will save the FSCR for problem state but it
> needs to be enabled initially.
>=20
> If prefixed instructions are made unavailable by the [H]FSCR, attempting
> to use them will cause a facility unavailable exception. Add "PREFIX" to
> the facility_strings[].
>=20
> Currently there are no prefixed instructions that are actually emulated
> by emulate_instruction() within facility_unavailable_exception().
> However, when caused by a prefixed instructions the SRR1 PREFIXED bit is
> set. Prepare for dealing with emulated prefixed instructions by checking
> for this bit.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4:
>     - Squash "Check for prefixed instructions in
>       facility_unavailable_exception()" here
>     - Remove dt parts for now
> ---
>  arch/powerpc/include/asm/reg.h | 3 +++
>  arch/powerpc/kernel/traps.c    | 1 +
>  2 files changed, 4 insertions(+)
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
>  #define   FSCR_SCV	__MASK(FSCR_SCV_LG)
>  #define   FSCR_TAR	__MASK(FSCR_TAR_LG)
>  #define   FSCR_EBB	__MASK(FSCR_EBB_LG)
>  #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
>  #define SPRN_HFSCR	0xbe	/* HV=3D1 Facility Status & Control Register */
> +#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
>  #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
>  #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
>  #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 82a3438300fd..a4764b039749 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1720,6 +1720,7 @@ void facility_unavailable_exception(struct pt_regs =
*regs)
>  		[FSCR_TAR_LG] =3D "TAR",
>  		[FSCR_MSGP_LG] =3D "MSGP",
>  		[FSCR_SCV_LG] =3D "SCV",
> +		[FSCR_PREFIX_LG] =3D "PREFIX",
>  	};
>  	char *facility =3D "unknown";
>  	u64 value;
> --=20
> 2.17.1
>=20
>=20
=
