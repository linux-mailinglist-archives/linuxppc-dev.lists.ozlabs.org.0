Return-Path: <linuxppc-dev+bounces-10322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E035B0A591
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 15:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bkB4C6cf6z2ySg;
	Fri, 18 Jul 2025 23:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752846587;
	cv=none; b=KDdrni1ASpoJQ/XRo0ESadRXrQlMznsKfeADYmZY0KKPlayNzL5eW78l+n762WcCEnFWhaDpvqp3ZjTJBrCEo2dIlbld6eolILlZDzrYdaaQH5EqNlQsIfQr4FfYZUQYTW8WNTFdny9iaQ+M4Lo1rS5g7pLD7z1imhokqtnBgOuYx3BaKFfnOR9hdTHFJtfBU405g8gVp8Xlo7GVUxwvVdi5ATKYEnDSBpKQmCe4CDxpZtzwwKpJ3CMQoB+vEHh2vnvQPN4yBpWHMOFB6RjxAjthyb31kEexpjntfaxvftHCqzjblT8sJB3sdeFXlwkByJ86bliopz+wUEFOrtn6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752846587; c=relaxed/relaxed;
	bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiyhOF80KeQyXE+vp4hAf5mGC5u5cDkQWIZRyydUkG96cRPqD9NflZ0Ci1/YqKipXtV7H/8avo+Id644AHksz6Glx0fMV1IFR41XCVj7ddirbGti9cV7SKrxPagV//as0At/FJelC8lFmTBfq7BCpypYwok4T14XrfcMur+x0VFeI+uDs5FeUtce2/e9oXhDkjXXFXe9k5ukwJsyOYEVBWiRSoLhF1qVin2VolAf+Ssbw5MWofjgBfMoVByULL6NImetW6GJFM2XuRi/QLNGC7/6MHDnGSOdXKGPvlUJTT/UqeFuKPKjA53tLID+fERv8zkZdUs8PRCJyhqI76HPmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jw8U/AdK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jw8U/AdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bkB4B14rPz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 23:49:45 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-451d7b50815so15682165e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752846581; x=1753451381; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
        b=jw8U/AdK6L/2hW+UBlUjkBhWh2rmUy0JRaSljPBUfebO7Zt3IjynO4mqgpYn+Y3eE2
         WVdUdTtLxXgV16Y0aDM8yKP/kZZnBrgddB3bZSSAIx9tKWTIFMOJ/y/rmNTim6CYm3MB
         L94PRI1D+uJhb9CXC+0e0LNdkBWfm1kRfwvnkyaU53UY0ILqbmg5PMC8+KOdpixm6MDn
         qTMwa+UdpT5SAHennVymT30mOvq2IUBWA3LTV3S2ywegC32o2cW4ACYHiRx8b5WTojlg
         bqKOWm/GegOuNc8G3bkRN7tdoDdclNOLPChoT4oUDhzkSOWg8tmyaONbRo1EETTz2iEC
         KC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846581; x=1753451381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMgyOUgLIJ32PTJWBYJxdAEjZIylinigTisZq5Jwpk8=;
        b=tLzElj2EK1CFEsYmztuDV+QPwUTfJBeb2KVZ3dsdchPhFj5zRiLUjtJTYlqaBKwUam
         u6zMhlr5rT7IuIGtB7TwN9uj/GnUhlJm7o2Eq5kda6/tTSjcG5mrGlAPCQdLBf8Qii06
         7/qbQ50c7lkHh6R+jdV0JXxKvKYIqegcuurrqZVXAbfxtAaKayGa7hbw/YtFEKYgT2ua
         DbH8yJgUq5y5v+1+qJsSqAq5CPJUjs5xOK24/A8CC2IPHJ+5i0Wyu0MBKXGgsWCy31Qc
         cRCKiP668DvBhLk0/I51dxXwCrUScM3Ig1lx900C0YzU+qGsAvOKFpt6OPifneKUiYfy
         +eqw==
X-Forwarded-Encrypted: i=1; AJvYcCUg/LR98PILuhEAipPzgBcNi/21kGLRV3h8b3MVYx1gauxsdPdISBN/cQDmMqVMs3GRqlvl8DMxwAALrkA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3zj4g8GvteAB88hXJOc+6xFOhR7+zhAEg9CGVGs0Lg2l6TQUS
	Ry8KVyVPPb2/ZMhGuOy7cpD+19OOiY2kQ3JQoA8z4ligaHJj6sz+FUgb
X-Gm-Gg: ASbGnctxkmZdbU5Abl1MN4lST6d/n8N1L5ve9VTpCx7NEr63xYdubZkBLxvZXqxm/3Y
	0o+kkj+9JCBJQ3hMYIlDTvCWBeGOUQEgrZOtzUyCmlSV/Lm8jbKFQ/05beXBHb6rXT8RZa0/ifk
	yuLzYO56OutNC9T5aZLcgee47BUid9dtj4iOj00jmYlbzl62puT6pWyvAEpjrEDcFK3aTxXitsc
	E7d8csnShv0PbBEqXeTN+OnZCSIMXgMIPACJt0FqHtwO5erXeliHdCsgt7dbm4CMGS7cHb5F5tV
	qWxyvgW23g/t/kz5TA+MsaE7K416/zV0mOPqAjZygsX7ChaVm7dXMAfWoLOyCEsLFp45rNFw9M7
	UwkXJPJdUZ/kQb+G4liw2GCWdRGtQ7yoYdiZktOiIx+JUnrBRsIwGXJlV524otKyBUFfk6IkigY
	+W5EUAimFW
X-Google-Smtp-Source: AGHT+IHffGdFSHvYOR3y1R1hMWHllBX1SeAON/ZoD7Ch8x5l+0sSh2Ktls2hMGgkwYE+UWSbANbmhg==
X-Received: by 2002:a05:600c:4e02:b0:456:201a:99f with SMTP id 5b1f17b1804b1-4562e373d4fmr108407665e9.18.1752846581084;
        Fri, 18 Jul 2025 06:49:41 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45626cde7aasm62335145e9.1.2025.07.18.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:49:39 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:49:37 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
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
	protocol="application/pgp-signature"; boundary="xzuw4l5ej7k2fa3p"
Content-Disposition: inline
In-Reply-To: <2025071716-phoney-object-1648@gregkh>
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--xzuw4l5ej7k2fa3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > Something that's been bugging me over the years is how some drivers have
> > had to adopt file-scoped variables to pass data into something like the
> > syscore operations. This is often harmless, but usually leads to drivers
> > not being able to deal with multiple instances, or additional frameworks
> > or data structures needing to be created to handle multiple instances.
> >=20
> > This series proposes to "objectify" struct syscore_ops by passing a
> > pointer to struct syscore_ops to the syscore callbacks. Implementations
> > of these callbacks can then make use of container_of() to get access to
> > contextual data that struct syscore_ops was embedded in. This elegantly
> > avoids the need for file-scoped, singleton variables, by tying syscore
> > to individual instances.
> >=20
> > Patch 1 contains the bulk of these changes. It's fairly intrusive
> > because it does the conversion of the function signature all in one
> > patch. An alternative would've been to introduce new callbacks such that
> > these changes could be staged in. However, the amount of changes here
> > are not quite numerous enough to justify that, in my opinion, and
> > syscore isn't very frequently used, so the risk of another user getting
> > added while this is merged is rather small. All in all I think merging
> > this in one go is the simplest way.
>=20
> All at once is good, I like the idea, but:
>=20
> > Patches 2-7 are conversions of some existing drivers to take advantage
> > of this new parameter and tie the code to per-instance data.
>=20
> That's great, but none of these conversions actually get rid of the
> global structure, so what actually was helped here other than the churn
> of this "potentially" allowing the global data variables from being
> removed in the future?
>=20
> So how does this actually help?

Thanks for pointing this out and letting me look at it again. Most of
these actually do get rid of the global data variables. The MIPS patch
doesn't because I forgot, but the __alchemy_pci_ctx is no longer used
after the patch (except where it's initialized to the ctx variable, but
that's no longer needed now). I've updated that patch.

The Ingenic TCU patch gets rid of it, and so do the clk/mvebu and
irq-imx-gpcv2 patches. The two exceptions where it wasn't possible to
get rid of the global data variables are mvebu-mbus and Tegra PMC, in
both cases because there is other functionality that relies on the
global variable. The bits that make it very difficult to remove these
entirely is that they export functions that are called without context
=66rom other parts of code.

I have a fairly large series on top of this that converts the Tegra PMC
driver to move away from this as much as possible. It's not possible to
do on 32-bit ARM because there is some low-level CPU code that needs to
call into this function. However, the goal is to at least make the PMC
driver data completely instance-specific on 64-bit ARM so that we can
support multiple instances eventually.

Maybe something similar could be done for mvebu-bus, but I'm not sure
it's worth it. Typically for these cases you need some form of context
in order to replace the global data. On Tegra we do have that in many
cases (via DT phandle references), but I'm not familiar enough with
mvebu to know if something similar exists.

My goal with this series is to get this a bit more established so that
people don't use the lack of context in syscore as an excuse for not
properly encapsulating things. These usually tend to go hand in hand,
where people end up using a global data variable for syscore and since
they can't get around that one, they keep using it for a bunch of other
shortcuts.

> Also, small nit, make the function pointers const please :)

I originally tried that. Unfortunately, the struct syscore_ops contains
a struct list_head to add it to the global list of structures. I suppose
I could move the function pointers into a different structure and make
pointers to that const, something like this:

	struct syscore;

	struct syscore_ops {
		int (*suspend)(struct syscore *syscore);
		void (*resume)(struct syscore *syscore);
		void (*shutdown)(struct syscore *syscore);
	};

	struct syscore {
		const struct syscore_ops *ops;
		struct list_head node;
	};

Is that what you had in mind?

Thanks,
Thierry

--xzuw4l5ej7k2fa3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh6UO0ACgkQ3SOs138+
s6HHnQ//RJDy7HyKY3QGC3LCcmt2Vfyic7ACiUP72YYAnBKVHsFoF36OZi9Jv5iG
Bq9Go0qFfluWgOrOlsjmhHE2BEj6shRzh/+yjZWu4MpCdM2CpxnUz/bwHQryuDKL
3TMs47m/NEVQ0IqPBmMmqHjLoSZ8q1c5URJv8kzhGFUZPif5CfeDwU5Myq7IDMd9
yqc25SLzHS8bhHyFXDVzGc06uTrdwRbopvwS+VEFtupMNrGD/bmVo2f7HE38Vrgx
aoX6xxuDqTeRRonB9OxU0Upm0Kv/JGXetysgOLLHml2TvQudYg1sG/xbIQqymU2K
YopxcFWmObA5qAPRadidJChbWyaKpZXfr2rqsgvM28cnRmCjKIDRpmVzCsLpQHBb
fJ7tbGWQBz4ZFczYLM9Z6cjZPJFFuwHjzm9dRNH/ppJKWmtr23eSYuWX44kG19CM
644Z1OYxg9GBp5mZ7mGLu3HF8ycXWFKDoApp62SLm7TyHRTP/W0Kn90MqgHuAd4U
0RhHg1+7MlFBE9jC/X1Ac+RsZNaZUd+biEy6QvAkOHL5VtPxlR9OCKhftZcsPRuM
YdQVi9IgteKqzq0ul2dQbTD1LaqzrEYmFXJ1So3dTTSbOUqrb+VDt9Bqtfm7oGdG
O1NPiukTbLVBWb9QXt5vvJ6QXxC7wn5jdhgby0kUROvSnCkM+8U=
=McxE
-----END PGP SIGNATURE-----

--xzuw4l5ej7k2fa3p--

