Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED668EDFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:34:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBdDn5BClz3f4t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 22:34:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fXWANCuB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=thierry.reding@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fXWANCuB;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBdCq0Gqbz2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 22:33:08 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id r3so10268105edq.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Feb 2023 03:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIu5FMX5zzGn7W3WV4iDVGUOhSdTojc3bSXVJLsQvOI=;
        b=fXWANCuB/MzwMxY8e/PE9hMX6kQQgSi4nwzOxcZP1sqB8ClZa9gcDxf95xcMCFGA60
         8r4HPxPuojmsyiGZM5fo54iQbE21y+qmauAqwiUZ3JgfWGvn5hFl6n/jQnypHDEAEiIN
         BuyuO7rl564g2V4OrWmmn0okwkjZbGE1TCtQTMGjJTfw9GCV5cQzEBQZbHy2naOM6bpE
         uDbQrwann+eaSyPP4Qr1iDlD/kMNgp3Ia2Gz41p5KUz1dsAlq9DKH/Kv+GyzBHKHadV6
         bLLJuLtOY0ewEYZPIZXw0dCi5dG6BoEsrdfO+bUYCY7Ew7umVt4h/WIptyhk6gza7ptd
         eQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIu5FMX5zzGn7W3WV4iDVGUOhSdTojc3bSXVJLsQvOI=;
        b=f9bTmgN0MGETXTjhHvMfBxHklsslU4Sko6o37aIi79/qhVCCJWRNPU4qb8eKOF1DRZ
         m/N0P8FDBMZHAebhp3GParcgcbV1Xrmq3uYT7ThEVoJYVqzvA4QGnofdUNwHZnGFfRxE
         MRWXyxpmlWa0zcrUCwH9hbiHO9hcpZrEZeQF9pJND9RUh6WFSDvkWxSw5SrEddwST0sD
         0xaB1udGunbop0TlzPkj8yc6BL5/1uzqJ3xflRIuHnoTgJ5XkeU+l+lGf/l/zPKVTBjc
         QkCmgQuz2W1fytnnW1qt7OBIhTH3q0gg7WnVLZ8LuZWFz7vTV2uz6uUiwXrMyLvapj1B
         diuw==
X-Gm-Message-State: AO0yUKW5Y/PKvrZ2gLP1SG5/C8OEfquKNUwNWQ3tuLg1sdS2arDF67b0
	XcnDoJ9k5rnyOtjWVaOYWAU=
X-Google-Smtp-Source: AK7set+tg8yMsoPfm6aG9wW3C95mLbOW3tHfVXRDEHWicn13te2n5qII2lTooySpSVWWHaqcTV5FYg==
X-Received: by 2002:a50:9f25:0:b0:4aa:a517:b861 with SMTP id b34-20020a509f25000000b004aaa517b861mr7580201edf.30.1675855982063;
        Wed, 08 Feb 2023 03:33:02 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y89-20020a50bb62000000b004aab193b8dbsm4424195ede.80.2023.02.08.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:33:01 -0800 (PST)
Date: Wed, 8 Feb 2023 12:33:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
Message-ID: <Y+OIbIEn4QSQCB7M@orome>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D5qM/4zvEVCMgXpb"
Content-Disposition: inline
In-Reply-To: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: alsa-devel@alsa-project.org, Geoff Levand <geoff@infradead.org>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, kernel@pengutronix.de, linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--D5qM/4zvEVCMgXpb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 08:19:07PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The function returns 0 unconditionally. Make it return void instead and
> simplify all callers accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  include/sound/core.h      | 2 +-
>  sound/core/init.c         | 6 ++----
>  sound/pci/hda/hda_tegra.c | 6 ++----
>  sound/ppc/snd_ps3.c       | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--D5qM/4zvEVCMgXpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjiGsACgkQ3SOs138+
s6GK+Q//ZiTKsijeECRfzHmIOgymJ77EeHGA/vhS4NBBfe9U296ifD3l2Iyv+64i
fI7nKoz7sr+HxnB675oWnqtDQNIogLRPrej9fG7qGtqk7JWxnUuGkELw43jefGp+
62Q7q/UXC7tSPNf3lZGD1Mcown6X1SkSwohIqvqhY5GLcSMV8/QMOIIQIHeeyjTZ
fxtr8htfD+XArBu+CD5gbo8mQezE3zwlOOnms6OfciwEK/RU70OPK/Do38/gDaIf
c7oJv32pu43UekdJES/C4HhfkdSi/xOUZSYRnl13V0xQ0imngncCPUU+sV+yRhGu
tSqIpDypo9GBzu/AyGMD7L+7wTOlhZKYcPCH7+wUil7H+7QNx5kqxTZQY+w6rMR6
Z7MHYsU5oTnhsgvJmTybU/NFp1Cb0jNlWzH+YvuJz82Wx9wD7p3l+HkOazLj63wv
e1Ktc1Dn9AOKMJR4R6IFwb8T9FiqtQ4MWdJmCbLSuRemo62DYAPzm2els+2lO7yG
/vzZSAi/655ELwubZcGkMQ6ng3nda0JRSqocaT/AzwpnWiTok+srqy2JuoLjE1uG
OLMieD4toJrYTzqR1wPK1lKtJu+qXgw2GsI0nbGJ//kcAK9l5rwKZT0ye8bwG+5N
BWkK1n+90YKZI00GffWXjiOaH/yuzSYrQZuDtzAizFJ0UX87E4k=
=sIaY
-----END PGP SIGNATURE-----

--D5qM/4zvEVCMgXpb--
