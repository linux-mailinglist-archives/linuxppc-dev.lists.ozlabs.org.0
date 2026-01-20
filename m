Return-Path: <linuxppc-dev+bounces-16062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C8D3C100
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 08:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwKPP1mpsz309S;
	Tue, 20 Jan 2026 18:55:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768895721;
	cv=none; b=ZT0DF9/tOZ/dT0CxY4HSOk6p1pH2aMcII72giej4ZLb2BsJ75nKS9fiPw4VoiYe8EQKSCSTAlZclxMs97lDrRD6nscXr02ilIH5lfUAFXRGGlFapQlaHJ4vTZBIuia20OEOqrY135/DTMJ1YMNzAOtVQxdG2zY6ESoQcVUZiwoNPpW0LLQrvL2+Gm8t5CIOcj0IQiiwncgUVUGzVldcdI0I4QuXPirlizT2QPozr6ix7C+NGHXi7Q+/xJbt/v2IztJPPmrak321j1W86OGbn9Gv/AiNu4QLUcBFFacUeu58F5dwEZnQWU3VETH/Z4iGx2bcj2bbzC5zD0yzO8kUqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768895721; c=relaxed/relaxed;
	bh=jeZXHXCd0A7wzXTSmrVaLmedn4oD/inYVEuWEpVtc1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8d5t2tP2Fn+twm+DcWFN8487OUbAg+1GEnueEqlbUCvqLb7oYhwqf0Yuv4tpK39wqBcor76C+MlR3OJ1/ifGHEsaAbtHC6ne58VkkgZXNI3Rgim90/ZIFdxfXGx61G5rGkfpIH6BLyLL+LAC8IDHi15Q1sbDdXy1tBwLHdHXDn68uzT0H2J0BaPQKjMs3HADvzRcNe9uNcD7Rd2rVtmF9FKSTVZR5BQSe6fegxFiDsq9Se+TBseBfuA0C60zpfjR/cnX5AwuP4wJdVL320gU1HSJHMwwt3Ichdy3GKO2kOcOfYBc3pLmBMTdcW5M8cf8qUASjISxtP6eLaLdiA+/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LNi/4U+Y; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=wens@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LNi/4U+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=wens@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwKPN1dWcz2y7b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 18:55:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCF3744304
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 07:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1758C16AAE
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895717;
	bh=TMLsqINFJyrKXhaZG2FJM4ezyn4y9q99PGcQ/6K3rFU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LNi/4U+YXla5CSde8B0UCcyl6TTmcg7RDk+rUCKE2Tuo5l8q54R2Lzu4cZkF3aPCP
	 36pRRmhzO4jcrstA4tyuI8kz9n4HRzKauNmo7obCQXKUfQtonJRC9aGSB+dwUPkfa4
	 rhKzNB0KpHv4miU2MlP0UTlPfcCP0+Ita2ZTdzVupQuQr6wB3vNMRXLfNzh49YgY4j
	 0JfNyf1/93p1u3C2IkqFcqNLVfkavlUVDKw2WrJKxCRzO0D7ieKLc0/S6ETJKm1frc
	 CMAFrWYGDFvoHaJE3MYihNWFCSzrEHgqXD/PqAdaFNNOwzzPZ/4DnjVdHAWy9oJdRR
	 AEjvSrMg/OQTQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so47818611fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 23:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkqeHbMrsD8g6lTL25d5ssfvuNHudsfRbcYW103QwDUo0qDNsG2FfTv4+Fzo4dr625CMz3CVDfp6EGECk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTvh+AkZ8A4YD0o23+rtk15rPlGbq8jLhrqR5XIzJbix8LylEK
	U7TBVj3y9JzVJvPhzIscJ5/h/9+unxs0BxZ6QGNmjLkeTHcPJpFzPiclw5lVimrIB5qQvA/cZny
	DIYuPeka4kCQiMLW3QsvBQTz86F0EbqY=
X-Received: by 2002:a05:651c:1443:b0:37b:97b7:a048 with SMTP id
 38308e7fff4ca-385a54354fbmr4917361fa.17.1768895716136; Mon, 19 Jan 2026
 23:55:16 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 20 Jan 2026 15:55:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
X-Gm-Features: AZwV_Qj3MBFPhHKAOhUS4trI6djFD2VyeTyhcWYMtPVh-frJE3FOzmJGjGidA8s
Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.

I was somewhat expecting a matching change to the Kconfig to add
COMPILE_TEST to the "depends on" line.

But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?

ChenYu

> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/soc/sunxi/sunxi_mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbu=
s.c
> index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb8=
4b60d1872b31c27 100644
> --- a/drivers/soc/sunxi/sunxi_mbus.c
> +++ b/drivers/soc/sunxi/sunxi_mbus.c
> @@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __in=
itconst =3D {
>
>  static int __init sunxi_mbus_init(void)
>  {
> -       if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
> +       if (!of_machine_compatible_match(sunxi_mbus_platforms))
>                 return 0;
>
>         bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);
>
> --
> 2.47.3
>

