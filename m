Return-Path: <linuxppc-dev+bounces-9293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F826AD59F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 17:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHTgg3T26z30DL;
	Thu, 12 Jun 2025 01:13:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749654799;
	cv=none; b=WB86y8IhuMftP8/cipZ7LcluSNCPHQ2mk+cIo0/uf+R09gwtKWw4IbXft9JLcIVtq4FGl7tlQGeLe7AeFBfy6Y1xJYi9UxSZNFxkVeRTctkrYCSMfWxedc2DAbzANhDVTd4f4ghsUOaX75TJXyfV5bxmBTpcXiWVG4fFG5Zpj9jxIS+mkORMMbTf678HZHjjeAzYlXgC30jfZ9ss95aqiH8S2lsiOx62Hb5k9jNlfCVjJM46HoL/pC0OEaO1/dDr9xQRU9Pgm+vnERPjmDDG+109siv5obN8+b+VKSfNF5gk3tEf6z00zcFz235um5gfJkVLKI6IrrvXddSSW7FDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749654799; c=relaxed/relaxed;
	bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtZDqmwECYNMwtNF2frYOfjSCabQUwbzTcRLJ6rfvP70jl08xXGcckoESTCDJhPRRPkxO9yljzQWMiTtoIRYi1eeEFBasnyIebiFisKTIL65ixnAPdR5FlAJpJpei7x9dbeFmuTfkev1kZVD7n767jVh2i2NbWDMr1LNqETr9JV8VquUlMo5Ip1VFm5dH64Ew6O2UKTZR+q2QvJn6qit12sBVA/pCKmING7VF+hC/mIFVKVKOtM0fcLYHKhsCQxBGAedYfo6iXMWDsS3paMZD11sw506qKOpdUe+hkmebduWEXsiY+vdIqVkP3aksku9gCIejEpwbbOhAwPA7HYbBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kaowdinR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kaowdinR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHTgf05Y1z30CB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 01:13:17 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so84801615e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749654795; x=1750259595; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
        b=kaowdinR14XfRzq7lwzLoErAT1Hn5+7a0rlCjqlbvg9vbPoWTrO0Mnt0hkwdl8p1+J
         g7Q7UNCZKgqiZqwXuirpWtRfPOL4SgnYwEacrcr4g4byRyx+qRTJ/EBqn0YVs8EqN5ay
         eSEVoN0fZVxVz3xZtElU2hutDoipWiCb+mIIlJxxE8sRve2MTiDGh7l95qq/mSintwTx
         5CsqzXzswgZrwHo7nIIYhIf3Hie1Zv+x2DPOzmMnFT46dDE4/4ZDYgsn2wCPUQcAbbgo
         RoTKWaa0Yo5TQF8Kf4qXVTnP7fetvZH8xDkP4But4pda/8ZTw0kogBlMEUtkld7hTKIf
         /uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654795; x=1750259595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw0ROdeFkh9FWMHJ/DqYZHwPq7uqPvziD7anVpTSv94=;
        b=kJTt28X7oDZ8/jwPaxENcY7iMTj/b+mDqKELpP46ltHaZZCSzk9lwJniGaZk8+Znmh
         p0A7jlCU+52Dm2gYa2mGwwLJObZo35m2rQzejmPcsq1xsOZI49mZU5NJ6qeoJsfef1eF
         q7ZhxtsEICkVlj72Hcgvwl91EHtYVQnU73q5yTGURqvyHlD5uTCQYUhyIm0Hl4gyWCYi
         zDbpyFLADmG0IYad8mnxDy6EtBq+dSpa+pnURmEEnsdgrnegiyFmhJz3wxxUGAzU0k7Z
         Xkwx80zlvsT8IvCXJ6lsUMSiOldsHKcq5qqYLkkEVCUNRi52pS0ZTJLyhDM8dNpa9sVZ
         G49A==
X-Forwarded-Encrypted: i=1; AJvYcCXET/pQAZdtquaCRrEA73ag5KAwpD9KkjE/avr4TcDPvvFnpg+GLOODZuqmeXSn0Q8CLcGc2Eq24wtmK0w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtbCGeHcMUPCZfY5N//R/1BS5BxtkluV3jXZumTw3wyA+H4cgR
	HVM6nS48KTLcNlLJg59sC08LHy2GPB3eNFq6WPzFuPfbEY0K3XiLyGjL
X-Gm-Gg: ASbGncvJ3TQavRNUGwIwVk8XUxarsK7uaIGSPzjU0+PPBRPe2IrxDXAqdh1Iliu1onD
	wObnwPYHGfxAhDajC68EJQh/+uWqXXmXyelcp4+OY9/7DjKNsGQ9Q80UTN0szinVLl2FUsSZB3r
	hk4jjJLna64NehweqAhjZ38x0PW9FP1xliWgWpMToTvnhWd13rmiyXD6GdZyHk5Zezbd3ltxw2x
	tUEYocH/8yOxzuZhzgpeC8dRwUUQQg8YrKsysFJF++4oQxBKi/7uwBa8gPlVdb9fgBhCqs/0KtG
	8e56QmVgqNWGrJKwwVDTWUxvK4692v5rjbv4H7NwXzjAp6PRGHRF5m4SeiPoq8dC//XxaSFVPsz
	ii9GsRRUJMJyrJIc30BV68vjtV5ID7jlxAEC2OcuGgJYyJkGI
X-Google-Smtp-Source: AGHT+IEDVsHtC1GbgmVXkrBhi7qP89VRSAHqsPRw+3TK8NgfPIpRXp3HCwEkAPPqvPVqYIRwks0NVw==
X-Received: by 2002:a05:600c:3b1a:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-453248cfda0mr30513625e9.28.1749654794417;
        Wed, 11 Jun 2025 08:13:14 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325171412sm23865525e9.17.2025.06.11.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:13:12 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:13:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc: Use dev_fwnode()
Message-ID: <nrukbxvov3vgyqtanxqldtnovzhhijpzamxhj3bqrouqbx3tlf@3stf2h62h56d>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vwrysg6fi76oazm"
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-19-jirislaby@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--6vwrysg6fi76oazm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc: Use dev_fwnode()
MIME-Version: 1.0

On Wed, Jun 11, 2025 at 12:43:47PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>=20
> So use the dev_fwnode() helper.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
>=20
> ---
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 3 +--
>  drivers/soc/tegra/pmc.c    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Nice.

Acked-by: Thierry Reding <treding@nvidia.com>

--6vwrysg6fi76oazm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJnQYACgkQ3SOs138+
s6EVqhAAwl9x/C2bZ95K26Ya7KjGd12r+UguN2KE+Ox5oVvGiXJqH01jlbLNQQNd
e2dWs7Ab/Pm6GDWPizV/3GDmtAjl/VTosIk68fHIfgn+lbOuPCIbF1357hby0EoG
EsiZkTH37DPAHssGvu8HQvc2dcdrIAY0l8CMDF/02q0rEudONhfR2IdYuUrdQ+2s
nTXWdU3WyJhznnB+a0RZMZTjqzR8uac7xkAJxoflrCBBfVlJqibqzFqqkjQihAQC
P+/YoQ6k5S+E2PHm4hpSsYKlgT++RKWIhiWM/TfWdwRqUv8FRQVdGzfh/NrnVJB3
2/QClOh5C5d+V5NOJPsuZLt/aJNoAcOaHcEP10hxmM4uR7cyKMz6mcB5mxVQ/+eJ
EQLIhUPtBQQjUO9438neInn5zIv3ASFpLodyMuZQHGuHbD/kcifBX1sPqrFa21yC
ifK20ep2CQugVVWYR7oYtcylFXLdWtjag46oGtMikG7ym4t/5mEeNhhuh9FmiJ1w
uYS0ei+jnJSb6fQsmwlZyxvpqBS0XIakoHL+/ZTA/UVMwUenRcQ+mJGI83k6m1IR
ajr1OdeB9FR2D95Tmi3WlQFsiO/vhi0D0Hg4leYelvUtwrN0y0PCuqJbF6A4lUNi
i+n2VZDdEsaQSWTwn6S4FRhScCYlb3AALXE43F+jTwR6xbEIXQc=
=w/HU
-----END PGP SIGNATURE-----

--6vwrysg6fi76oazm--

