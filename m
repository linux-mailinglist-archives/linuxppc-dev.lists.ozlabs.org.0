Return-Path: <linuxppc-dev+bounces-112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FCC953D61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 00:42:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=px/HGB1A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlKrv3y8cz2xjK;
	Fri, 16 Aug 2024 08:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e36"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=px/HGB1A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlH055zDSz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 06:33:56 +1000 (AEST)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4928b5531caso471470137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723754034; x=1724358834; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUB5DtqEXasUqeTn5ggBGYiSPHH9LQLM5I6fa/JbtdA=;
        b=px/HGB1A4jqC/IbvFDPMO29rj4ysOHjaplskqoLYbvmQYqPAUkI1SwBfj+rkS+fomZ
         sDGGCF3euV2J7Nj+j835VA8l+cglLcQa3RPruzdXHBeSZC4EP2wD/wnk96ABaf7OyRR5
         oUchK86AZ6UkqUaeHVPpzv7QFl9Q3ogIAsp0mU1Df1AG0q0PlzfrgfpoT9b/mx38Ad+K
         /BaOrENZ+aQHLdppy+7FvoZP2PCLV+KMqRmwQZiro++GOcf67p0Y+ivmCMqyVWWh9rsI
         e1kHCf265+RgVW4J1zAlcSI+bSfiwi5Ygi0i7Vo1aPe4LpTKKTP52f0OMhfVaA17trAO
         9+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754034; x=1724358834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUB5DtqEXasUqeTn5ggBGYiSPHH9LQLM5I6fa/JbtdA=;
        b=u149M94Jntxp28yHoLpLpwUfk3vHJTvbV+hbrSVxi/Yjv/V6lDUesDyUEVpfAndgXY
         IpaKhjUz9iZ9A0bmWBweugyQXFsOvJLujmUptqv7jE+in/898OQtwXn76oMXu4YNVr1j
         cfVtmU/L+zapr/bwNEsX8cOqWeR+x/yfUVZUu1l0/tZrG/xq8ppPxW9ae+HNVHckfdhp
         ssDo+m37SobiKdep92T7dkyBmWbSxoqnADTgt1QcZC0y7sFbDT47Dn2wI/qSnjAy4y3I
         6WDx6nyE5QlOgkNwvAm/tJ2a36qCwp7DGyDYWQHMTtFgFIZEeosWkewajSHukeh7faoh
         +UqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnTSQ1Tcz94OgsWWHePW1lB7RVVdRUJHTp0AijD3sNahKp7Io/fVK6eFRMsqBlLvK6D7PqF0oN+ESw4+DLDM2OY4aW806uMxkgsq+m1A==
X-Gm-Message-State: AOJu0YyYTWDrcWp2VlBlL87rpZSTPiS6GSMntOf4qrO0MTq+m05+6dnZ
	bHHVDoAhDBfSbMgpNGPSuytoHVnd0UvBETe5KdHo/4ki8LOOcbYS9q9WGKS2xItxIs90V0D8z5c
	BLF+BzcFIqM9WWbX4r+IlpLN4trx8foSqf1qZ
X-Google-Smtp-Source: AGHT+IGfmuESjcg91WnDqUqkDtn8UIkv+97xiwN4+ScLJKsVEkWIs/4dVOABxE4IIaU7W5co17m4OAQqJ19lGvWOC8s=
X-Received: by 2002:a05:6102:41aa:b0:493:d41a:1185 with SMTP id
 ada2fe7eead31-497798dc938mr1347334137.17.1723754033614; Thu, 15 Aug 2024
 13:33:53 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com> <20240806212106.617164-15-mmaurer@google.com>
In-Reply-To: <20240806212106.617164-15-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:33:15 +0000
Message-ID: <CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=HbKE-va0urJU1Vg@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Aug 6, 2024 at 9:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
[...]
> +void modversion_ext_start(const struct load_info *info,
> +                         struct modversion_info_ext *start)
> +{
> +       unsigned int crc_idx =3D info->index.vers_ext_crc;
> +       unsigned int name_idx =3D info->index.vers_ext_name;
> +       Elf_Shdr *sechdrs =3D info->sechdrs;
> +
> +       /*
> +        * Both of these fields are needed for this to be useful
> +        * Any future fields should be initialized to NULL if absent.
> +        */
> +       if ((crc_idx =3D=3D 0) || (name_idx =3D=3D 0))

nit: The extra parentheses are not necessary.

> +               start->remaining =3D 0;
> +
> +       start->crc =3D (const s32 *)sechdrs[crc_idx].sh_addr;
> +       start->name =3D (const char *)sechdrs[name_idx].sh_addr;
> +       start->remaining =3D sechdrs[crc_idx].sh_size / sizeof(*start->cr=
c);
> +}

Is this missing an else condition or a return? Why set
start->remaining to zero and then proceed to assign a possibly invalid
value to it anyway?

Sami

