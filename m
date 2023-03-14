Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B683A6B8CEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:18:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbRHL4JQtz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:18:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n6wGLaeH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n6wGLaeH;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbRGR2hQmz3c9Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:17:33 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id r11so6900967edd.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 01:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678781849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFmrgoFX8e2tXRWBLSQLhRldhqfPMiA/z+mX5uDLA5E=;
        b=n6wGLaeHLTOcz5q517JnqrC2Xt7AxmI2nv4QFevlP0RyX8Mp6PDcCBaA0lLJp/itCW
         VBlcS5cZKmJkxd0x+uG7iXdb1IhHh046fxGJ3W60DxFPFLcsTjXh7JCxsMDDpOPqS9Ap
         rRFPZhai3QZ1K0mBjYYtJUswXLAKAUADeeMBlqygnBnNYbLIHvIgsD0WuO+NgIRSeSWx
         xE9rK5cLcOmiXwmRCzIEzsDrwiBIfKOwOzF5AUePYV+3LT2jRVNwhKkQWLPM6PQ0mx7t
         aaCC0IVenXzK6Dh9PEXCeBhMopwQimceFiFC9lB+68IsLyMbg/pBjyGwnSlPaqM2d1rI
         ep0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFmrgoFX8e2tXRWBLSQLhRldhqfPMiA/z+mX5uDLA5E=;
        b=LP8HcueLMS7wT+cBNUGMOfGnCCkNd5I19tdXKW4j47uhbhYYQ1tOFn5rzaTFPp64ZF
         hfSQc6NNigK9AknSYXxJMjF2IZ4N2GL2Aq7fGZ8/C9bfJciFPNEkYfGKDBmWyaahcidP
         wfquYU0ojJiEqymslMaTZcidDnXXl+VwSOumrwn16ZtEoLvjFkPdKvn7u0Z3m68q5aEA
         DNLBSRhL+VYTU13cua2y/pH3QjBN8ao+fAtyZBccz/PmXH7uBFZicI+dDm33qhnYNQWZ
         3IXv2rk6TMfsvo3I3EHmD9JuWz8HiWZAW0mbtsYBAf6/oNM3GZ4V2Nl7qbVf7+odMPkc
         Ls1Q==
X-Gm-Message-State: AO0yUKViIIyU30FlpRY1AKjHxs5siWek81/NfJT9GoADoLRpIQ7rl80U
	wkslD7aBMgyOP1v/h6A+ugwlsc2WNi811DAQqEw=
X-Google-Smtp-Source: AK7set/WsRTaXQDKcuv6Z3Z8FDkurQyyZzTSUvVAfJWb39YBTuibZxwLFDRj0gBxe+eRAtNAc9NQ8F/WFpjjun5zK6s=
X-Received: by 2002:a17:906:4d57:b0:90a:33e4:5a69 with SMTP id
 b23-20020a1709064d5700b0090a33e45a69mr662685ejv.3.1678781849147; Tue, 14 Mar
 2023 01:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
 <20230314085741.6f968e68@bootlin.com>
In-Reply-To: <20230314085741.6f968e68@bootlin.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 14 Mar 2023 09:17:18 +0100
Message-ID: <CAKXUXMwqobqZJtDXAfymF3iWmzE3EXH1q6VLddVob9q2ygzWyQ@mail.gmail.com>
Subject: Re: Question about the dependency on the config SOC_FSL in CPM_QMC
To: Herve Codina <herve.codina@bootlin.com>
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 8:57=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Lukas,
>
> On Tue, 14 Mar 2023 08:21:50 +0100
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> > Dear Herve,
> >
> > In your patch below, you added the config CPM_QMC which depends on the
> > non-existing config SOC_FSL:
> >
> > https://lore.kernel.org/r/20230217145645.1768659-7-herve.codina@bootlin=
.com
> >
> > Up to my knowledge, the config SOC_FSL never existed in the mainline
> > tree. Is this dependency really required or can the expression simply
> > be reduced to COMPILE_TEST and we drop the dependency to SOC_FSL?
> >
> > Note: This patch has now shown up in linux-next with commit
> > 3178d58e0b97. Currently, it would not be possible to compile test this
> > driver, as the dependency on SOC_FSL is never met.
> >
> >
> > Best regards,
> >
> > Lukas
>
> My bad :(
>
> The dependency must be FSL_SOC instead of SOC_FSL.

Herve, are you going to send a quick fix to your patch or ask Mark if
your original patch can simply be replaced with a new one with this
change added?

Lukas

> I mean:
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index f90cfdf0c763..7268c2fbcbc1 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -47,7 +47,7 @@ config CPM_TSA
>  config CPM_QMC
>         tristate "CPM QMC support"
>         depends on OF && HAS_IOMEM
> -       depends on CPM1 || (SOC_FSL && COMPILE_TEST)
> +       depends on CPM1 || (FSL_SOC && COMPILE_TEST)
>         depends on CPM_TSA
>         help
>           Freescale CPM QUICC Multichannel Controller
>
>
>
> --
> Herv=C3=A9 Codina, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
