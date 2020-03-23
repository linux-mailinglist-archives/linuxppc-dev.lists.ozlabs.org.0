Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF018ED76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 01:26:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lwDC62V0zDqfc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:26:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NS7XdKDK; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lw9k63mLzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 11:24:26 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id m15so5249663pje.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 17:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=aSzwm6mZHGvC7o7iWEwuN6MepEd9aOpdWn6z1egBp8Q=;
 b=NS7XdKDKT13qEU4daSi1AbGdLzL+rBjS2FajSUY3H0MgGFRZSz7/VUYr2hTBqFb6jr
 XTjkUhTo3HBgFzWerZIGovDLOmUIpplvC/QU+MNT0GAaCC6EyzKEphAFX2Cix8UP37ST
 cd8xVFdXqH7aJJX0YI3HbiVw8sC1uaSKau36Sa1U1L6IKhmRUVKPIAaX4VFoMP/2WKBW
 nCTqi1f3QLr0nihHBKPtrDtP4rUV6n5OgHO3ZMq2TZNDIBB5h8de+yVEnPTj0KqLb/5U
 InnGq6oC1MWi3Xxhyh43MxypontSQ795J7U95pv8RaI1A+7YAMX8wEcpTm8A05teQEw9
 SdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=aSzwm6mZHGvC7o7iWEwuN6MepEd9aOpdWn6z1egBp8Q=;
 b=j8T5vrvlcQIqHlvmpUNRU+DmNLSjcJeidbpi5XkPGpUoC5gVJmgZ7yqAbKZj8cX4oy
 oltfiSF0B35sNpYA7fLaEKq9eGUhgTsosgPQ12NT/N1Y/eqxrjPyDtqMCMSjw0GfgedC
 OI/2b/UpqaPJQpqm+RQxJhibqsMLjXnem5Uj9zNt65hgoAgThZ4urTf62ok+bx9xAkMV
 HvOX1w7PDkkSfmlDkq5IDQSvnADZpIXwl5FgWoJwQu/o2L0g1yE+3AJjnaA9A/pic4Mr
 sTz7+HXET2YwKbwDZbjNfzaBWxmIBlvx3WEV4/AsZzrMrPlhR6fxonNkdw6DoM1K1eqc
 o4rg==
X-Gm-Message-State: ANhLgQ17PB9dbf8/jiikX4wHxdHcfdyWZ7tKdLmFyYuWCGyj4Y2AstqD
 Jphc9wxX9qeTfDY09/Tc300=
X-Google-Smtp-Source: ADFU+vtSOrq9AC+Cl7tS2gWqiKJEYqyU4D3ahLGyLgd75uPmDPbgOG8rK830AA85od6Vs3jQ+UE3TQ==
X-Received: by 2002:a17:90a:fb41:: with SMTP id
 iq1mr4280786pjb.89.1584923064657; 
 Sun, 22 Mar 2020 17:24:24 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id m9sm7983068pff.93.2020.03.22.17.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 17:24:24 -0700 (PDT)
Date: Mon, 23 Mar 2020 10:20:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 01/14] powerpc/xive: Define
 xive_native_alloc_irq_on_chip()
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598352.9256.15242.camel@hbabu-laptop>
In-Reply-To: <1584598352.9256.15242.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584922512.kzufg0h76s.astroid@bobo.none>
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 19, 2020 4:12 pm:
>=20
> This function allocates IRQ on a specific chip. VAS needs per chip
> IRQ allocation and will have IRQ handler per VAS instance.

Can't see a problem, but don't really know the XIVE code. C=C3=A9dric seems=
=20
like an obvious omission from CC here.

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/xive.h   | 9 ++++++++-
>  arch/powerpc/sysdev/xive/native.c | 6 +++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
> index 93f982db..d08ea11 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -5,6 +5,8 @@
>  #ifndef _ASM_POWERPC_XIVE_H
>  #define _ASM_POWERPC_XIVE_H
> =20
> +#include <asm/opal-api.h>
> +
>  #define XIVE_INVALID_VP	0xffffffff
> =20
>  #ifdef CONFIG_PPC_XIVE
> @@ -108,7 +110,6 @@ struct xive_q {
>  int xive_native_populate_irq_data(u32 hw_irq,
>  				  struct xive_irq_data *data);
>  void xive_cleanup_irq_data(struct xive_irq_data *xd);
> -u32 xive_native_alloc_irq(void);
>  void xive_native_free_irq(u32 irq);
>  int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_ir=
q);
> =20
> @@ -137,6 +138,12 @@ int xive_native_set_queue_state(u32 vp_id, uint32_t =
prio, u32 qtoggle,
>  				u32 qindex);
>  int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
>  bool xive_native_has_queue_state_support(void);
> +extern u32 xive_native_alloc_irq_on_chip(u32 chip_id);
> +
> +static inline u32 xive_native_alloc_irq(void)
> +{
> +	return xive_native_alloc_irq_on_chip(OPAL_XIVE_ANY_CHIP);
> +}
> =20
>  #else
> =20
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
> index 0ff6b73..14d4406 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -279,12 +279,12 @@ static int xive_native_get_ipi(unsigned int cpu, st=
ruct xive_cpu *xc)
>  }
>  #endif /* CONFIG_SMP */
> =20
> -u32 xive_native_alloc_irq(void)
> +u32 xive_native_alloc_irq_on_chip(u32 chip_id)
>  {
>  	s64 rc;
> =20
>  	for (;;) {
> -		rc =3D opal_xive_allocate_irq(OPAL_XIVE_ANY_CHIP);
> +		rc =3D opal_xive_allocate_irq(chip_id);
>  		if (rc !=3D OPAL_BUSY)
>  			break;
>  		msleep(OPAL_BUSY_DELAY_MS);
> @@ -293,7 +293,7 @@ u32 xive_native_alloc_irq(void)
>  		return 0;
>  	return rc;
>  }
> -EXPORT_SYMBOL_GPL(xive_native_alloc_irq);
> +EXPORT_SYMBOL_GPL(xive_native_alloc_irq_on_chip);
> =20
>  void xive_native_free_irq(u32 irq)
>  {
> --=20
> 1.8.3.1
>=20
>=20
>=20
>=20
=
