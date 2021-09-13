Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4240A18A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 01:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7jFL2y6sz2yMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 09:22:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WVs0wRG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WVs0wRG3; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7jDd4n87z2xXr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 09:22:08 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id 2so9731540qtw.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 16:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7JcMHzLy/MRU7HyIiFXHagC7sUS3oc4PEpxDPHvyC2M=;
 b=WVs0wRG3afqL1+46CS0Uts+KEx8i+fmu4at07K821ffb9mU44g0Ej9P/DhfGaIcPVo
 jEqpcY8ffuLMa30+Yuk4IKk+NkoZJfl8Cj5VbA5FCDjq6HuNU4aw6QFLme5Ky0Ff2O9A
 +Nr3FoQfLVcoC/4uioghhrTuNkpgcUU0N8ndA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7JcMHzLy/MRU7HyIiFXHagC7sUS3oc4PEpxDPHvyC2M=;
 b=RZjqcm2jnQVkBoHicAniG1CXLvxOxAnOgwWJX3s0R15bY6XMUwpWa7dmpfZUwtVzdm
 fI9g/y7Xio9x0XdZuiudi3Aw202I6dcNyfovADt6xujAyhJcGJDCBJUslTwF8EgYmCbH
 VKuEqW5c3+IK3qzcbpa3Cfy+KUY3/HlOo6WhuuGBgUEaIWsqso99QflgQ14RGFEs2iIR
 gqbk+H7wBq/VdWxxMy+EScygE58V5q36RvOzwV20EewycYwV19Ck8tCg+KWPqa2t5J1/
 fdayxkGzQVxmNJBE0dYIMwCajec/HrHT+hn0b99D23ujcy03u9d9AiAkcH3Heb2T6T39
 kwmQ==
X-Gm-Message-State: AOAM533WIaPwVuRPfUSk6jp3NSeX1bP0NzOYmz7UjoDXPeypWHg5Vqar
 ieOISxr6kkp2e6STw3Tx1f1PXMq7564866s0i/C5zVhFNYs=
X-Google-Smtp-Source: ABdhPJwxAr0CdKmNdXw6OizFxgTPEghkUMRP/A+UtQjjMKn/GEQ7F5GF/3Pac+2bsjtPhWYJwR8v6AJVQ+DeP1MRqXE=
X-Received: by 2002:ac8:7dc6:: with SMTP id c6mr1926213qte.25.1631575325055;
 Mon, 13 Sep 2021 16:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210913134056.3761960-1-clg@kaod.org>
In-Reply-To: <20210913134056.3761960-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Sep 2021 23:21:52 +0000
Message-ID: <CACPK8Xestw5t3y+gzLviVJ-FbfTM4WCYOyQ1nskvgzZOP0rndA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/xics: Set the IRQ chip data for the ICS native
 backend
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Sept 2021 at 13:48, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The ICS native driver relies on the IRQ chip data to find the struct
> 'ics_native' describing the ICS controller but it was removed by commit
> 248af248a8f4 ("powerpc/xics: Rename the map handler in a check handler").
> Revert this change to fix the Microwatt SoC platform.
>
> Fixes: 248af248a8f4 ("powerpc/xics: Rename the map handler in a check han=
dler")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks C=C3=A9dric.

> ---
>  arch/powerpc/sysdev/xics/xics-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
> index 5c1a157a83b8..244a727c6ba4 100644
> --- a/arch/powerpc/sysdev/xics/xics-common.c
> +++ b/arch/powerpc/sysdev/xics/xics-common.c
> @@ -348,9 +348,9 @@ static int xics_host_map(struct irq_domain *domain, u=
nsigned int virq,
>         if (xics_ics->check(xics_ics, hwirq))
>                 return -EINVAL;
>
> -       /* No chip data for the XICS domain */
> +       /* Let the ICS be the chip data for the XICS domain. For ICS nati=
ve */
>         irq_domain_set_info(domain, virq, hwirq, xics_ics->chip,
> -                           NULL, handle_fasteoi_irq, NULL, NULL);
> +                           xics_ics, handle_fasteoi_irq, NULL, NULL);
>
>         return 0;
>  }
> --
> 2.31.1
>
