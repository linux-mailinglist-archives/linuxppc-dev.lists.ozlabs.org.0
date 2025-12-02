Return-Path: <linuxppc-dev+bounces-14567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5DC9C1BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 17:08:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLQfQ1lmGz3c1C;
	Wed, 03 Dec 2025 03:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764691678;
	cv=none; b=GeT3Tx0v720sGbeN3RbxPcIXYnLKA1YIzNYzf3tmbYerYa/91SqwpMmmqwZCkCWx9BpoHCYPAH38TD5lno61YJg5pg2032mZe/wjjrk7tgRRvB9sy2EregvEBupVaJpVsLT2A5zTMHUaZncdc1Xba5E99Rr6FJfIvE7d6Klx05Rld0n28Z/5MqfxRZIapSh8nwOa4IycFJUMJ0nKpywQFjwa1J6QLIu2LEeIoaarogV7isntOh1j15RKYgKam16KonE184V1bDzsS/vQoRk4LAOWRFhaSBHIbV8Xg7apiJEsSiomSrYbXQPbq4UADoDmrTQgyX/EGqh2o5h6VO45cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764691678; c=relaxed/relaxed;
	bh=mASuH6zYJW4kgCFORENn/gDtkFiL6qvAC/Ijov/g+XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQW3NC7OBRG65+2M1mJgWOrFmm12shoToqxZXN691KoLpyHlztx9HDOjkQ+NKsKEHDVgqBIpxHNjtWqGzC63nmkfZCbWZvPGVi0zGS/ssnnLRr4kTgsm2qojB/waYX3QtmbVm5D/9OZ0jffmcCQ2gIGKaFV7wKlnE0yByV9Yu1mW83BUqLKcHbd1Dr6/pwU+EXeeetMH/OZ4enSPEWn/mysdd6iIknArpZ29vjf9v6TUl/jD976fyyG0nv4Nm8Pp2+NAV8Mvp+X1BXSuO1a9sJgAIEqeyKiwxepVuNXuplY77hLD0F2DJb1d58/u04o+OjyP3bTGAOHmC6NdqOX4aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=o0CAADB2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=o0CAADB2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLQfM5Ptlz3bn8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 03:07:54 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so9300819a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 08:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764691670; x=1765296470; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mASuH6zYJW4kgCFORENn/gDtkFiL6qvAC/Ijov/g+XU=;
        b=o0CAADB2No1+f01YIFSuZ8xtIDaASZKHvoAXN2tfiXtJOW+IyS1UtjwFDH5akB5qEh
         s3heUTwA3JQIqICAzs8fdt2MY2VULJLrhWeMSQNDPMmbcTur8XLnSlYHWdMp6gslJdip
         Bfr85sQh1ZfNFO587FTFSb2JSADFNirM1M2G+D+HS2BSNDpf382dBLF+liJmvGqMLU05
         Kycurvv/Q6p3fYMUyPIQkf1yYoOhlmMArIziMyKmJ51SwOxnrskiYH62UdOL3ZVXlfh8
         W2p7yMwIA9SHvoIEmS6J7svYojKyF+WhneWQAxd8s9qA0CAkKZo0iCLDMpE6Ys/E9+wY
         Gwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691670; x=1765296470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mASuH6zYJW4kgCFORENn/gDtkFiL6qvAC/Ijov/g+XU=;
        b=Czw2QAexbSBejdnCnLsg+cUKqJRLW1jbihCvTgRju7fTN0u27Trt24boq/DCoU5QBJ
         RbCjI7d98/HKkD86ddXfxV4tX7nrgiTrsvdLJik4cTawU/1gGiDD8E9W0uiee3Kk2CE+
         iamSFYgqyr7RXql+gX6slL0YJKa6ObyClmAPfoavL2LgCvDYNRbFz0XRS6ySl+kGGIOu
         ofcBZpOve8Ys3QDcl/PhH/iMYoKvms8JX0GhcYivwklEvMi3CySbUr8urj19tHZw+jdh
         aH4HSL4x5aNw5N+HrXiWjPw+4P8CsVLI9BWPtJIbDog6XUv7LnlzdMe0601ldrw3T8eT
         /lCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuFyOBvNnnbveas9fW6Q7T5d/AIVyZUbfZOjkrVUPjwjlP4PmE6U9lx5VAcidGc1exudfBQ/olUjyN09w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxv/0iM4LiK9zjqUs/G2BrqTKy6kh50w6afdC2E6G5+b2DJ/2AM
	4d1RetZFUi8mL3UIjv/obp4WPGgCyr7i2rXMXWEtbc/QWbSLdggit5PxNuSP2OwoXeg=
X-Gm-Gg: ASbGnctunAzdz9c5T1J7Ph3QSgUk+p5aE0FuZYj0LOKy6VG7lnx04fk7F4imiojeBeg
	6GPMD9ojbGIPYFIqiZ6iWqqPje6KhG197SDxZIcGeLcHU4EYoLQl0ANaikK4dLgiW5H+jrsyA9K
	kdce2wQ4JdordzskuMvAC2q3n3aIFGphdr0fNxYK9ptNpx/7f1jRnc/kpPUZ9bu3/CzLsykFsVq
	uY4AuEc0wGvzKPHQJlaUI6JBWpkskIulprjEKiX1Qg3wsqMXdJJ8/MTPS9IG6fEvbTHHWQnuPLn
	DwTmkgKI7qHNRE2AP7lwkXpDLnBxTdRv5VSNVn9HHSUgU4uSrtHOIwZ2UUMjiGHcmOCmVbAFCzr
	OLf606RKpWKTPT4OGmjVXfLmi4NwlsdJTiyjbq0mZjUM3iRhr/mTK+8DutganvFUQvHC5B7CA/b
	hBYxvweN2v66B7rk07R1AbHU5prAxyabYmno8ZcZ5VMV+ymkJ3jOmW5Np6LkOg1t0mbjh9BivfA
	Uc=
X-Google-Smtp-Source: AGHT+IFh/5tJb19bNqnddbaYmnbwkI79t+1frciQEHhJt/tYxMN1h/8py4CbgA/+4cIeR/x4Zc6QEw==
X-Received: by 2002:a05:6402:1e91:b0:62f:8274:d6bd with SMTP id 4fb4d7f45d1cf-64794f2f6bcmr112557a12.8.1764691669711;
        Tue, 02 Dec 2025 08:07:49 -0800 (PST)
Received: from localhost (p200300f65f006608cf714cc86879bb1e.dip0.t-ipconnect.de. [2003:f6:5f00:6608:cf71:4cc8:6879:bb1e])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64751035d4csm15547965a12.21.2025.12.02.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:07:49 -0800 (PST)
Date: Tue, 2 Dec 2025 17:07:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
Message-ID: <crbruv2pp24ljufun5ki3ow3ips326tpuitxch464b2iuhwwem@i2yf5wynizvl>
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
 <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
 <2025120253-bullseye-diaper-8bd9@gregkh>
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
	protocol="application/pgp-signature"; boundary="uvld6mh7map67iie"
Content-Disposition: inline
In-Reply-To: <2025120253-bullseye-diaper-8bd9@gregkh>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--uvld6mh7map67iie
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
MIME-Version: 1.0

Hello Greg,

On Tue, Dec 02, 2025 at 03:48:05PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 02, 2025 at 03:09:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > With the eventual goal to drop .probe(), .remove() and .shutdown() from
> > struct device_driver, convert the fsl bus to use bus methods.
>=20
> We can drop those functions?  Ok, that would be nice, didn't realize it
> would be possible!

I think we discussed that some time ago when I tackled making the
remove callbacks return void. When I said I want to make
device_driver->remove also return void I think it was you who said
to better convert the users to bus functions. So that's me doing what
you said :-)

I wonder what the merge plan for this series is. The last changes to
drivers/fsl-mc were merged by Christophe Leroy (added to Cc:)

Best regards
Uwe

--uvld6mh7map67iie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkvDtEACgkQj4D7WH0S
/k49AAf/SEKUaRDO33sb70nHO+gtfnI4RN51x4KdDWZ3wx3iVroCQV0uijpzu97O
CvlUoVJboCG1fBzsqoFPZutZiERFq/X5TAOZCRG3+LzhKXgMisC3l9yFTFZdfeWs
fnD0FKnR8b048L2pyUJw0MTgEQQbU8EXqkqG2A+r/oYnjApNvSvyOWlesL9fi5p6
zWltvUB6/U+4iHHaGOmbAVxvaU2yp9pZC66stYIfqESRufZWeutWARG6H1VkGBRh
Y8ySLppzPVCPO6MPpmnDqk5hD60j4QR9DjqNnEbc3yNkWdjmbEQMZ4Bc6GXMbrKO
bTnFPln+//y8xWuiz0aRvxYN5wCwTQ==
=qLf8
-----END PGP SIGNATURE-----

--uvld6mh7map67iie--

