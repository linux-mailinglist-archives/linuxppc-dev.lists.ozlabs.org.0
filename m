Return-Path: <linuxppc-dev+bounces-13553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7BC20017
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 13:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy3L5485Wz30V1;
	Thu, 30 Oct 2025 23:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761827293;
	cv=none; b=FtybIsgbmU/YQAuREkUPFONwWOnX0ESJ3qK3xBXVjjh0xftCa7I6SOTMpUndDpjPPLCbaVCeb0+6GWAD+HBWPr9GLCrY5BDVYuZHgRvyLMk7yIzBNpHlhF2QZQ6gylMTPVT45qqKjyL+GmpPXrvV//VdSM2OKLRjW1T8eeuI9TpTcHHotG17co4ht/zP2P6MZyb4Gc1CFSu03XCTuwCv2upmdVQfX3eCEZa1fMqem7zSgQAH1pK4LHNcTjzBeYgmMJvzdHCjz8evq4uEV2FlFTFdl372R4Xpxsb3ADs8VoAqHUz7bs88tF/Aocwc91f3A52V+oftzox9rJ8wPJ4zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761827293; c=relaxed/relaxed;
	bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZCb3hxP4ibzFw5Zc6MEUKEIZ1eBNcISygIiaZ7yP2DO/0eZXjCxB2uVqf4O+95yE07NNpi5pLR7WVPd+cabFjnBTTzQ9bW3u7Y1KIxuao9hPh/U1QGju0aMoebtWGvCQVp5XPjxqFiLznITP0bf1PIMFiLgniWoBaBrIgsK+7qBMvFI+bcjJ9awf3wlYkqwXBa+W0EzY7d10Y32xKbuwl1QS1ytBGTbMVjCtL2WwluX5FvbIfrGwBrwZ0/7zg8swe4FvXJLikStzQncM28qgceMqXeDNv5sRseXaFIpTj4H9v0YRaITdCK7I4YuBBm4W/axLFIdOuSw/GtT3VSusw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bE8J4GTM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bE8J4GTM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy3L41qF8z2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 23:28:11 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so597886f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761827288; x=1762432088; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=bE8J4GTMxbTEZ4aYo2npFQ3udi2S6pAq6ndxIseJPieL1VsrFUCOhAz1lkPKgsPr3U
         ZvY87rWpiQMrUVWorXNCEIbb6jO+4bFdA2/dK0+pbA3gfrflYTeKMngbHioKrjPBvo2v
         U/9OMhRzbGYSXUumTPl2mSCjeQnUUG7frHNq0phPOff20aJJ6rKsvbegN8bDkxFbA3b7
         1u9wroGzGCLHLTWIMT2kDuX35+WsUOT2drAkFgHlmOwzD/WdGObCnzvEaLzI1V+3b+EE
         7yWult6ASuN/4AOrW5JpnHJFi60RwHN7tdZOAvHU55j+xwVLKGDDdEdc9zXbF6dnVMkB
         qW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761827288; x=1762432088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=i+2keFDp1hIw+6jw9RiuvUOuf8isPge6ommSDmtqAWtSM/zMyAV/n+0txHaOFwg00x
         v7jAOEMM8FdSFd+N6PzNP8pkIh4nfdlBTa/wDfq8AIktW0orBMke5EPO8CyTEExILMTn
         EvNPlbReqkj/GlQRryON3vUv+9yVKix7OIifNyBTW2i6qJrD3uDah8Vj3N6RVYWoOYjJ
         yElaIXQ7tcdkktTmgL2EDf9Tm8YWLgYAVaeu7LaXGy8/UQW9cZVIRbvjONAS9htrG2qN
         ieg9uQvt9NSD45tN/A1fWLPISRi1g0hSpunTD6R/bPQCkIv4HAJLyVY4joU6d448AYfO
         +IEA==
X-Forwarded-Encrypted: i=1; AJvYcCU6IILPJrRn9k34oRi+dI7L44BlqY9f3261SCKiFbuOtnXTTlNE4GX4RpHj890F84YXQjy3In5o7Rd++s0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJqB6gU8HDuxLT42f/arah5P/B1AvL+yvj7u1B4lMWegEvfTku
	Jp3kMfayR2ypyRKbKAiW9P+cBO4OUJn/7xpiyc7UXgtuPqeayFxXfDgL
X-Gm-Gg: ASbGncvbm/4PT51odCOjAaaQNbLCuY4WigiaLWAokl4F2SrGNdc4ko8eKOc+8ZjFhcL
	ZgUuJTXFxq9Bsj7xkgsO1f6zxkTyR5N/HMxKPXqN69Xxmax3ZnVVFol4we8g26cK/NS7qyMUx62
	ex1qclfrXOhI5ldF05qN21xzcfvLZr1dWpGp/UeNfxIpdIbAdRzw8QAL64BTloR60JQegFBU4F6
	oRyiev3qRBmnBNc/9UxEvWD4NvEwfG/hG/+ucPDFUL1M1QZq/z4w8SmgTo5OfcOhJDFQbJFPr1B
	8pJVnkfFmS24c3MWLZXAKRDimnivKtAU1tkSP3hWBY9kvxnmBFdsitxIfH4hxGHzZTj94APIYmb
	Wh413jmISVFSDpLQf69mKieZDhTDjPSWkKpXsr7KLvj/x4GmQ38zyAcmWbHwbaIiRhNAj2lAF5i
	7+3tRCd2YN8yOVV8IzjtirnffH5RzaGCTBPCjaBB9cA4REKeCrfNPVOqhvTfh00ryB74lKH/wMM
	Q==
X-Google-Smtp-Source: AGHT+IFohGfPrMB+gEC0PPjeDu6wKsKn5Xw4tnoTnVq6JsR15gq4re74GuIZTwiApDmgxJjGG1cQpQ==
X-Received: by 2002:a5d:5d06:0:b0:3ec:d78d:8fcc with SMTP id ffacd0b85a97d-429aef82ae4mr6294449f8f.14.1761827288007;
        Thu, 30 Oct 2025 05:28:08 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ba445463sm2028625f8f.10.2025.10.30.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:28:06 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:28:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
Message-ID: <5psq67p7ozmfz6mbi626q2uixqtbtfpejkhud5fv6wqr66xasz@ksiokkf5qsgr>
References: <20251029163336.2785270-5-thierry.reding@gmail.com>
 <20251029175647.GA1572736@bhelgaas>
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
	protocol="application/pgp-signature"; boundary="6ob5xm6zi76m7ppm"
Content-Disposition: inline
In-Reply-To: <20251029175647.GA1572736@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--6ob5xm6zi76m7ppm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:56:47PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:33PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Some of these things in drivers/clk/ are also platform_device drivers
> (though not this one) and use generic power management, e.g.,
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/qcom/q6sstop-qcs404.c?id=3Dv6.17#n209
>=20
> I have no idea if that's desirable or practical here, but using the
> platform_device model instead of syscore could have advantages in
> terms of modeling device dependencies and ordering.

Similar to the MIPS/Alchemy PCI driver, although there's no git log
reference in this case, I suspect this was not in driver PM on purpose.
The pattern I've seen quite often is very low-level device driver code
doing this using syscore_ops because they run very late/early during
suspend/resume, respectively, so the driver PM callbacks often aren't
sufficient.

In recent years, some of the issues have been alleviated by things such
as device links, so a conversion may work now.

However, often these are also exotic and/or old devices that are
difficult to find testers for, so I've been trying to keep the changes
in this series as minimal as possible, so that we can be reasonably sure
things will continue to work just by reviewing the code.

The most important bit in the series is patch 1, which lays the
groundwork for avoiding these global variables for new code. Also, in
particular I have a concrete case where the global variable approach
doesn't work because an IP block that used to be a guaranteed singleton
now no longer is.

I have looked at various drivers that I ended up not converting because
they use a global variable not only for syscore but also for other
things and fixing that up would've been way out of scope of this series.

Thierry

--6ob5xm6zi76m7ppm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDWcwACgkQ3SOs138+
s6Hg1w//bfwZK2UyWYgH0DjUdLRkw/JLbu/3memPliSQO+SxPOEf7uwnD1QnAiQ3
AaL3UiueXsnj30IkhBnqYoPaFQRz3G5Ag/PFIKX3kireFrAExwZP/9AKWiJflD1I
gh+QOfqgZ1HpJr3QSmmjosBmkm5T7a/J5dUNuCcZoRcya8QmACQqg3sWy8gj4BdT
Hy/aq2/JWEEJs1pLE5SvCexBqTP5gxTj8MTuNgqm3hRDtZc4TQnKNZIcJwgOruMX
Wy4rrgBPQiASKxxP7ksI7iXCTOYM61AlEm39RUFNcGKI9iOw1YxFn2LuVIPoFJc6
H92dgYcRmcEgy/oWPc8yTs9iX2POH5p/40/nb53U3sj6iQVhEMoVIGmIuxEX9RHL
VHkn3RNfYCZlwqDtwCCoN6DWBW2PNUAX3dsD1ng3ZZHuDH2lbQaQudKRi7MGhAxm
ADqiAfq1HO8Fk6uo5BFMtpieue14jJFHaQs21TkOlurf/LH9GT2qO52/8KtcxYx8
F8pXjAM4Ps+sj+Er6h1Tb6PpXrpJ1lvGqagYTEJpWQuWyjXLGeseMpif2ucjdzjp
4qfcE13QtePpLlbO8kklfDMdo6+uClFAMgWMM0jWWFtczIaUWmwRYcDGUbW4RbHt
H6TJJVsDtuaQNx9wfo+vq3oMZviuttJPzFqYefIOL7oACIZD6sk=
=0K07
-----END PGP SIGNATURE-----

--6ob5xm6zi76m7ppm--

