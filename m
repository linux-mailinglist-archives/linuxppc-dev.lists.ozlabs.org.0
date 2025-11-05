Return-Path: <linuxppc-dev+bounces-13813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC285C36CF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 17:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1rvv0VVbz3bW7;
	Thu,  6 Nov 2025 03:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762361530;
	cv=none; b=HFGFatRhp6p9H8RseVkDGACQscWlCPjQRsfe9SaVKYDPkB3gZuZa+sPyZ12trwlLEOC1OCN+5g9wHRDGCmZZjmMDEFWehslQtXhHkC3DAf+WD/xPhmX8pl+cSqLKYzKM3vxqndo319nS6WN7O4bY9opFd2mVUOdfmo2mpFjrWHf0u5pvU26R/4kC8+JZR04ANjKSW0wtC58HV+0VIaN2tOkbCNRLWdB9YAGoBAB5j3YsHEa/J3Zq3betNmEWpItCI9F1dmXO9oH3M3HaHvvfCUluJsabxaTzwaxlS4I+cHxno1Ut3/ss1RzXL0x0cDGnbzrgWnMRMJUGhk68qgRkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762361530; c=relaxed/relaxed;
	bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6/ZmwkhNQnVurpyZz6REzOYOMz+b6GWKufcbd6GHXujEVw0FMc8G1k16CJUUwL4jnPsfBXXStufmnpiXRP2FmYz1fZQcHjrbfjl16B9P0uEocBRUrJ1D7B/bkeJfTSdCtynoi5v/37Wv/NMDkJ0XkOdGkpFAwjHf3S4Ile1Be99UmWLMGa8bd3f41vFyLmdnJH8Q+hEzEo5vRdYXKpLPvkRAvTU3bRNXo8r3UzHzQWAN4h8Wt7584EdPadoqWb2k3EUMNOkd56XfEGKR+CfHiuyPIN+QkcFCACSbf9Sd5/euIBDhDON9QKMub+f9Qjjbou/YVkWWNuZNctJPJiN6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KM66O0Sh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KM66O0Sh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1rvs0Fdmz2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 03:52:08 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477563bcaacso75265e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361524; x=1762966324; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=KM66O0ShHrqZB1IzltVNPvCg5kl3865otA3D/6ot5XEAjQWIkGrWcmZEe5U+iO9K2E
         r+kQjaTqHgrTJxNSV/nmrfq0AEA2JbRBfNNozokTYPJq5YEKXvGFm1cfrfbQuG2jEB/j
         n+DASCxZYZ+v2CMjkUNyk5sAntuoqmBieqxahEyYhHqQREm94GG2swtod4Tx+heUxJaR
         U0LnF2eAgvEzZmymd4j4QFn6iausoTzbC+tV7KrGGP54tGdJiW4hO9s9xyhA6sigDYwe
         ZRlB6iuKlIsnZrGjuaA32AAeAmUms6R+GyhbV7rvwvrJgYbuj4cEt93bHbv4u/2dnlDb
         Nzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361524; x=1762966324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=eBbCOVJ4PPZetSMEWvSIo8WltvQgUiGyEvj34Lhcfnh+InnjGLhouUxQF0ld+DpD8b
         S+soWdAcUojKPHpuQ/xBJfVw+noiSa9IxHEoklyB76jCUEQb6PExTDZKVZIIXv14VKPH
         VznAKBhYPKVo0AYlEcwZWHYcpF5oyj6tq/kY1OAjCooTtjNd+vMvCJgKA3SLHTZxJaJm
         IrAZT884U1wg8jemUmJ7TewA/jwJW6YShOPCRsQXkd3O7CKKPyyyR5ZCFK1nxKKCRKZp
         +cYhAgo9N4z1kvM8vTx1q9uXEhXJ/QI0s/6mZhFhAhMrk626twliui3wIODyQ4FbALBe
         PHnA==
X-Forwarded-Encrypted: i=1; AJvYcCUi2J8IZDPvpxa1lw6+xtcOItLxmgdPMT/f6f+k+n0lYXKnnlr16C/fIIGKcW/rPTfXj9z4eEhsAo1aKg4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3eGyYYwBAoSI7IPJWDWmM1NRIwIkymTTDg6yndyJOjt1S93M0
	9DxLxLHSMqw9fjB0uEq+4pYmfa/UwGCwmoPVvMLxS6rxAcm6m+lG7hxE
X-Gm-Gg: ASbGncslE6XBpj5Q8x7tKnlGSbxPxJr0ThGp3miY/oihc56ql7W5g5ad+QGWiWa3YFO
	mw4+bSjphhPTrZwxH5oqoWNCd1Wt1YrReX+3fFjguGXF9o48jB0TJ2MEnQQOCksh22GZQI1siC9
	y0nK/3HITo4ysvN3QvRByqBAaQat1coGJROFO9jMPVx4+vaxtR/lAdL9vBu0v5atTu4WJqZSHvs
	/KQJkZR3SyploKqB7crQrJKl6C9+izuziloizcmI8Z5NBaQO9G6LXa9ZFvKJdGJuwMdTu5nDfJY
	42zBAJaScxbhCRh/bjrDWXuZd3jexyAiVMqRPPxIKFMHfCdCugDPqUwcZcN6VqQB3Y03wSwFqvs
	ysXqXPa7cSWdc6D458L92AXekY9FPajbxo5qXxVRL/qDllHHJ+E3Ihw9M2swo6OwjPT80+g9twe
	AiPTrC0uVz572WTIC1TdbxBPK7M33jxBD+Oj48dvdbg7RjG6SZF/F3stP1EAygPyM=
X-Google-Smtp-Source: AGHT+IF1eT04urNHEfsD9kdCj32CNL1YcHJ6oGuMVK3cU2BLT/aQRFRmm7ox5OYZe77ML31HK9v5ow==
X-Received: by 2002:a05:600c:1c94:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4775ce23efemr42468465e9.17.1762361524090;
        Wed, 05 Nov 2025 08:52:04 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce210a7sm59725725e9.12.2025.11.05.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:52:02 -0800 (PST)
Date: Wed, 5 Nov 2025 17:52:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="ykyajizgfjgayrmb"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ykyajizgfjgayrmb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Several drivers can benefit from registering per-instance data along
> > with the syscore operations. To achieve this, move the modifiable fields
> > out of the syscore_ops structure and into a separate struct syscore that
> > can be registered with the framework. Add a void * driver data field for
> > drivers to store contextual data that will be passed to the syscore ops.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> This change is fine with me, so I can apply it unless somebody has any
> specific heartburn related to it (Greg?), but in case you want to
> route it differently
>=20
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

I have a few follow-up patches for the Tegra PMC driver that depend on
this. 6.19 is what I was targetting, so if we could put this into a
stable branch that'd be the best solution. I can set that up via the
Tegra tree if you and Greg are okay with it.

If that's all too complicated, I can probably wait until the next cycle
to merge the PMC changes.

Thierry

--ykyajizgfjgayrmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkLgLAACgkQ3SOs138+
s6F0Lg//dTn1/PUCYHRhF8cm1xB6JKggiLC40TRct49fcf9eF5gAdCqXm44qKoaF
67aqiXAiwzovTctJIu3rz8p71/FeXp/qGWDdPm/+wI7yD+BoCcVO0nmvXuPwCzhd
ZMwqeaRVm57JX4M9S5BdkOGtDLgAjyZ/6Qq/2isiQSPiWWl/IT3YiLyzw8vq8mcY
VoepQGK5hm7CHFf8FOBs+sMt6q5JJDm0VjNi+seVcCNg9U25GaXCRc2D9ztAqRib
3768/KMhlftnoJKsizCwWq2Gyw0Se7ifz66djjf51sHd064LLDv7OZpfeGyiFK01
MvVGXoPFuIJB0yqIoMRBbeRULm4kq+dkUkt1JWwYAMw9ZJnhXPJJI8bal2IASj8/
E6NADiYd9HS8kAXWYvLkm0xHv4FN5WXWG2a+Gf6K2vpBm07zG2xnI+eVjYQSnb9W
O9TcZf3jDWvgEQ31plH5JFY32sI4vjLAdcKS2oRfkbxFDJvTS+RRjj3EPqFshNXf
B5E6pXTCltOkUepuhbGDzIifVWzYgg/GyXNfwzdnJUXcAz7QPPJySfMraf/dn+8S
hggVgAivRFDEtaNEqKU6iqoePR3HIUJe/Ebjrb199RV9t4FcnVYOpviJRf5EWpsF
2YEUJPiA7neiac9fPLwCoRh33bJTIzanmWVxmFF1nQ2vozIt68U=
=3Mmd
-----END PGP SIGNATURE-----

--ykyajizgfjgayrmb--

