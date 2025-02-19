Return-Path: <linuxppc-dev+bounces-6342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87FA3B297
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 08:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyStr4jlKz2ygQ;
	Wed, 19 Feb 2025 18:38:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739950724;
	cv=none; b=APvr7075ATDfoyvnOYgT64+VUKfS64wKI/ZFNPA9e1XqqOHLRjvo7a7//0hgKErvJxFfyOaF41U3jvYjckgAl+b+KcstzxfhLwALvMtt6WAy1endcGvGr6ps8ixChksfxj5HIHLnsvzEi0YrbGmxzI6xftkqAv4ptaOXRluJFSqrZp0uikLOnK+NN0YnsRLtc0wHex0EQWrm59L+Punz1eCC6D3m/JhalwTssDwpPKKBc+/BH7K+OksRup/9xVB8nr6t/uXMUA2lQ/qLH3EmiJj60zYaPO61xpu2qdd+a3+RSB7ak3O27Mqu/TYqal4R3p8vnpDIxQGtcOWZiDfwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739950724; c=relaxed/relaxed;
	bh=0/Djs9NrnZFyY7N9MaDIjuxsEsWYadjuwBoMmF+C/+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLO1KUWEWIFIUcR1q7qNBlMfK337x7JIkhirVpdB25EY4J722ZFYTcnZJCBE4wRJhw1cpO/Pa38y+cVabgdPkUdaTTnNEFDDAxST7IGX+PCEzc21L/c8j8fm+BxmMfe2AawCUjuVv9L+/ymgIP593INwFqRBuy393mgeh4vkD0x6zl8Rj6fI/aGejuUncLs0cgZV+KKQxjj4AmhrYWmBa07iGbCAUtbNQ6tlwveQImOFwe2IbIeM3AFUZKYGLjeAXgdi/efn98fqiyM/xpcfOQs9h3pbPHZMnJSh2GGknj1lEh2Pplsl8ej83XKJggZP7gePtdoRbD+CHycuA4xS1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ib0su9la; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ib0su9la;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyStq5Ywwz2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 18:38:42 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220c8cf98bbso129389555ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 23:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739950721; x=1740555521; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/Djs9NrnZFyY7N9MaDIjuxsEsWYadjuwBoMmF+C/+E=;
        b=ib0su9la8jB1C7rPD0V6RmMDlGNj8eij/55TpfhW4MdPT35XripkbB7QTeVKO19/II
         Blp24xOnn+of3CoACAeL+XjW0yER07Ky3yH6LuLQ9RHf8xlgKSNucdPk+WyAVXGWWksg
         w7stOiyVfv1/eiwFoGL1boewgwFbZM7Sp9usOJrP3AnX97In/K7O4XTxEQyVc33Rz/44
         wpCcQ5xXeglekrKnakoPCMOvGlIRwyGWmUePFfHkhJii1IPx71/t6ggennKgkYCzJwLR
         4tgSZ+rhuVPSFvmLHxkuyUupHVBZC2bP5+NSAIGAquaOBZYR0RSmMZwj0HjkThT59nfW
         /BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739950721; x=1740555521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/Djs9NrnZFyY7N9MaDIjuxsEsWYadjuwBoMmF+C/+E=;
        b=O7OhCx92w9uL855R6UDNxQhUKOTcsKG7hEW4ixLEZe7OJhM+WcY91ryRBDqJGobBhL
         xZ3bfQyhtUInglINOp3XjAsl/fxU+cNSP/CaXTdRNstoiFECVEUiIFqxAkYsJKz5/CY9
         U1TLrIYhZvKBIVPcqCvZRtNqgYDTiKxnZ0v4CW/ecAfxNIBpVifI6OaoxMVI3WUMmCcu
         ulVXAmXO4gxtsnDKv0I3F6qRRJKVNzEgDPKwHn464Fi5JBOKHiQVj03n1HdPyfeTt3s5
         zvhnRIu8SmIw95TlOlHLccRcWYZbcOiD8xOtXq4RJwtoSjgymL5sp7IJ0htnrG5xELsv
         1Htw==
X-Forwarded-Encrypted: i=1; AJvYcCUUy7qFa1pVqZFwD3eSgbZf2yNpUWFPQGtW4TRyM67tEcDki3tEiJBOJill6mVz8M5KddpZogwbmUXrVck=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzr/ZJdysHMavhUROIbwc4RM62kS1gWnnnMLF6J9/uAh9wdpgqB
	Vi9Ua2h+ioosPL72kBoSflwmF1ixKOsxiiOyEdQwH5klRLBWKr/a
X-Gm-Gg: ASbGncsz2cMs4CT/VtbFIGbHmSSmaStPfW0jdoJXsxq/7aTIMM2xGT9rueUj/0T4uoF
	Jsu0Q4tb1seS86NccbHvytiySF+ActvMyVs2xGD6S3pJApWrRS1w8kBWnrz1kJgvXNTifVsR6Vm
	5FqrGweN1/V8B48bSyUvlKZhSxWVPdGE+9NpXghO3C5IP1c8b1jYDDzgmnnAUvs6eQ9dngkbmVO
	4ZguXBGS3L/QhbU6bup/idjkFxXaWePlQDWvpY9Hx/XI+gvsxO5YLtlU//OvwS4Ozgm41eKeO0b
	a2FTGNbLoVtjyII=
X-Google-Smtp-Source: AGHT+IEtnJVIN9VtJexIl05tl/mliZYyCnnzp6h8ajkOHvbvDh2lrvbG6zVZXn9JBV/VSoV5bJeUeQ==
X-Received: by 2002:a17:903:8c8:b0:220:fe5d:f194 with SMTP id d9443c01a7336-221040ced94mr211767065ad.52.1739950720334;
        Tue, 18 Feb 2025 23:38:40 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d468sm98155505ad.167.2025.02.18.23.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:38:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1BA5B4208F47; Wed, 19 Feb 2025 14:38:34 +0700 (WIB)
Date: Wed, 19 Feb 2025 14:38:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: fbarrat@linux.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	mchehab+huawei@kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl: Fix cross-reference in documentation and add
 deprecation warning
Message-ID: <Z7WKeru0VjEEsBXu@archie.me>
References: <20250219064807.175107-1-ajd@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmv7amjBQtNnovnm"
Content-Disposition: inline
In-Reply-To: <20250219064807.175107-1-ajd@linux.ibm.com>
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--kmv7amjBQtNnovnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 05:48:07PM +1100, Andrew Donnellan wrote:
> commit 5731d41af924 ("cxl: Deprecate driver") labelled the cxl driver as
> deprecated and moved the ABI documentation to the obsolete/ subdirectory,
> but didn't update cxl.rst, causing a warning once ff7ff6eb4f809 ("docs:
> media: Allow creating cross-references for RC ABI") was merged.
>=20
> Fix the cross-reference, and also add a deprecation warning.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--kmv7amjBQtNnovnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7WKcwAKCRD2uYlJVVFO
o0jMAQD1Vx3v8OEwLm/orghsOT4E7eZHtXNBKDhk/IYj/kVqKgD/e27EzMa4n+YV
4zN0IkxY6Adkg/1+JQpYLwXUa/k7EQA=
=1Bns
-----END PGP SIGNATURE-----

--kmv7amjBQtNnovnm--

