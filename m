Return-Path: <linuxppc-dev+bounces-8182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F7AA466C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 11:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnWYp1377z3bkg;
	Wed, 30 Apr 2025 19:08:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746004094;
	cv=none; b=WZo2ckodMGMeO5NXx3lET4eBxwJdwlJ5YPDAuQhtXku+4kgAlymIoJwltUgIL3NFtMYcdg8yCYqm9kmtG/q23eAfUuQkn3QXZW0Ri06/xekNuHBV4enxSjjpJ7UPj63wQi57kV90vi0pT6oENzHSjIfgkQ538Ze36W3dNjxl/YrzuXK/osNOdxMSvjMQy7L8MV418+tEB5qZMm9srnqEa6npODBJId+3jurp5rKXWYYzXAA1spqDmyuauEwI73f8Bo22Ac6i/oP9y/9JzWBO39+ZqllHi1gxa/5ajxTF1oQgNXDyofyjW7MHzMc++nogpHD3m7Km9znHtlT4ZcDG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746004094; c=relaxed/relaxed;
	bh=PGk49vERce9Ao/sNmnIwPGXqhBWoOxQGOUY1KUCkyrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/O6mJHyFIzqSW8WQPGUrUno1PrcXVjNTNXc2uP3qANjJvs73Q32JoCABjn3aydYmfKCTcuFwj9L+gKY0JLrAzT8T5X30qZMdPncjMM1w8fkXLSWOznmAeovAoJrd0fhu51mchK3929euFaychCCvNPVao/jA7yN0nv7yu+qmImKsifzE6vK8K5c50DTmQIW0IlOZ5EO7HjxqELvafZba333xBeQDd/enzs2MX/CMStmh+3N8UP8+7Tc4stdlQNOs3oUdHfJSCp7/BydztoyHTwdMvKVnDPNWhtLWv0eXfg5RMNZ1n4BDq0AC3JE65BhxNCCumRzCPry3JBKEybxVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ll/6KyAS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ll/6KyAS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnWYm41Gmz3bkT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 19:08:11 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22da3b26532so60141565ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746004089; x=1746608889; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGk49vERce9Ao/sNmnIwPGXqhBWoOxQGOUY1KUCkyrw=;
        b=Ll/6KyASuSjoXbqAU3U6Mqs+1MDFsbovMnW5NclGotCo7PDl2oiDexFIOtX11wfyUI
         syEO4BpQULoGs+ucSYT9jmI9ib7WrWw1w9D0sAmtPElwUjGvQxsvLVkB5b7zGcNsOhe4
         X7Vmi0mCdehm0hnqR8Asd0pnLWhPMtUy91i3VJ1CqbY/KkzjH7S8Sq5dRI9nfVDXA80e
         nw/5bNURzTwsIEUdLNrjcUR3CfQxfYa/lN2dhI2AKmU6jXk57UtkGZAuy5AorXJsm3l7
         YamxwunGYq44HQbglE7wd2bMEyIVhf9tPAFDxybsYvcv19yTcb21hqD/gmH8Aa8APFFn
         Wqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004089; x=1746608889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGk49vERce9Ao/sNmnIwPGXqhBWoOxQGOUY1KUCkyrw=;
        b=kFQyVRj4WmZmrOQQgn+5R19vHC5YXAFTH0o2f/PCIyGgByukZ8+OxQTj9CYm1Udpgq
         JeDgWbaGD+lhxyN+FbQiLZ9ZI0L6tt6flqHVmM1ADDPw9frAJ+ZXFqchq3Z+y/hheU51
         Y7Dhf7zmWYhs6OIWVvlCg9XW2rDNSIq9DQRqzOFmsaOlYNUjpr9QFoceGjDcHTuPbjuO
         zNjjU3d7TGzyhe1wFpYVOmqREyk1oFN3hCPL4a5U8WQ5CXsGbv5MuBHLM8so8GSP1fVQ
         btmWn8zipRnFxq4cz5adhdMffSMdiMkE9aFYiTO24b1OThAcWaMFYBQ7+nFH9isnBOgq
         ox5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMc5MWS1lzvHtt/htnDIg3ZUElHb+eQ3++pWsKnB2z8bPsLHwCVLZR9P6B/3PGML00O/Uk2U1xqQxbA+c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxf4Wnuw9p3sR5/PXZGWd9z6/EMCT1alj+r14Lt4GQpguFTFAbv
	w8u8YYKEx8YESeg1ZnB9hjWUM78c77TfpN5oQOUCEBfVhj7QyHEn
X-Gm-Gg: ASbGncttj+bKBS8HtvTJpaTPlePcaJDM0t63p4+MeIUkapU8eVCcqUMKAV6TUlUJLNJ
	z24r02AVYZgP3MdojBFuAXRXrVCKqqOu2e05ZCeW6WXYb/ZcanWHHKfny44cgs2pPfi3C5S22na
	JryqsjZgRIJ0ICsJAxmT7lrCBA//QZtoAIloOAovRaZJoEbdQ0tSJntvx6bFt/2bMIWxiJDFUKa
	aHzwPs0+8GPV7IM4Ma3bdg2B9lrYJRYiHTD7Y2hfRhxs4eQQUQfTuoiqdUypoPpEo3cFKSJA5kt
	ygRb5NAAIyy+LD+VEoZH95W0aTAWLU/DvZo0Zn97
X-Google-Smtp-Source: AGHT+IGNdId1ZgH8N9ypLITt6W5dX5KSuwIUHGHLCKO4dd9hafaceBcm+alDaSMKQP3rtTIjMT4g6w==
X-Received: by 2002:a17:902:ce91:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-22df34aa1fbmr36008895ad.9.1746004089231;
        Wed, 30 Apr 2025 02:08:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102e13sm116931085ad.201.2025.04.30.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:08:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8F47B4208F70; Wed, 30 Apr 2025 16:08:05 +0700 (WIB)
Date: Wed, 30 Apr 2025 16:08:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
	linux-next@vger.kernel.org, hbabu@us.ibm.com
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS
 ioctls
Message-ID: <aBHodTu4IjqzZeXb@archie.me>
References: <20250430022847.1118093-1-haren@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="IyftOE3+/ex4fxHI"
Content-Disposition: inline
In-Reply-To: <20250430022847.1118093-1-haren@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--IyftOE3+/ex4fxHI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 07:28:47PM -0700, Haren Myneni wrote:
> Fix the description format for the following build warnings:
>=20
> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> ERROR: Malformed table. Text in column margin in table line 301.
>=20
> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> powerpc/pseries indices API
>                             <mailto:linuxppc-dev>
> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> powerpc/pseries Platform Dump API
>                             <mailto:linuxppc-dev>
> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> powerpc/pseries Physical Attestation API
>                             <mailto:linuxppc-dev>"
>=20

Hi,

FYI, I've also submitted the fix earlier at [1] (but different approach).
ppc maintainers, would you like taking this patch instead or mine?

[1]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme=
@gmail.com/

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for p=
apr-indices ioctls")
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character d=
river for dump retrieval")
> Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-att=
estation RTAS")
> Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.a=
uug.org.au/
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index 017a23aeadc3..fee5c4731501 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -366,11 +366,11 @@ Code  Seq#    Include File                         =
                  Comments
>                                                                       <ma=
ilto:linuxppc-dev>
>  0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            pow=
erpc/pseries system parameter API
>                                                                       <ma=
ilto:linuxppc-dev>
> -0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             pow=
erpc/pseries indices API
> +0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            pow=
erpc/pseries indices API
>                                                                       <ma=
ilto:linuxppc-dev>
> -0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       pow=
erpc/pseries Platform Dump API
> +0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      pow=
erpc/pseries Platform Dump API
>                                                                       <ma=
ilto:linuxppc-dev>
> -0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  pow=
erpc/pseries Physical Attestation API
> +0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    pow=
erpc/pseries Physical Attestation API
>                                                                       <ma=
ilto:linuxppc-dev>
>  0xB3  00     linux/mmc/ioctl.h
>  0xB4  00-0F  linux/gpio.h                                            <ma=
ilto:linux-gpio@vger.kernel.org>

In any case,

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IyftOE3+/ex4fxHI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBHobgAKCRD2uYlJVVFO
o9WtAQDoPqj9Ii+tUdaxb4jYF5hN6yZ+QHVuccrGg0VCgwEwpAD/erW3LCkPQzuB
+WtWvCiOKZZIKZbGiIFyERE+4TOJCwU=
=9R4X
-----END PGP SIGNATURE-----

--IyftOE3+/ex4fxHI--

