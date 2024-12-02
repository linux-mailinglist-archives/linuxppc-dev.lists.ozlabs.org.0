Return-Path: <linuxppc-dev+bounces-3664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD69DFBF6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 09:33:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1xrh1M5lz2xy6;
	Mon,  2 Dec 2024 19:33:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733128420;
	cv=none; b=CuMzT5mZF24z3IGEIO5vyQWVMU5x2B+2wSu23NTzXZO+G6ab34uVigAWl5pgI1AWfUh1bMLPbNq2ylYtronIQRqmZchcIzAJU02HWE/3yoBLFZqjPeUPjJCVRluon9O0TRPxcnIKgXpTWIt1DQ6AiDJE14u3kaIWWrJ/J3NVIg9SpwYXAUs8+eBFLXCQdp5D1AOoGPrNKKPCi5q9sMZHmU4mUwDDSBCg/ikpHZiMBqt4H02kNXWabEasjCyjJ18/EjOfxCMVnGpKb6JH4xY6vaEgSK8BYxK8EiOmtr/cdjk6mds6by0pToq3jck6SONwF3yKKazriDCiNgeuEujBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733128420; c=relaxed/relaxed;
	bh=u56ZXLj3zoJcwhJCVeWsy3FmczwJw23Uyl3fWwY/H5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMEWZSTovxPnNjLIYsSp4WDQLEawHJ9BFOJWvawJcEA0QgKlViCjIB3M0yWzQCn69SXitgzwPL0GXi/oreeZd7G5TTy4whcSs0/CW6vBsSwD/A6ovmiod263IjjdOf/hFKyL58WAhNv1DEfQIhlkJE4g0dxWQ8h4Xb3vM/LuhpiWd7hOwBBqUxI0fBbFipsfmA1prPpZgwrt2b+Dp1mXDJ62As3kdEjrDnkPG76rDyQzGV6SkZEy5ab1Walp/1fV0LdvHIlF0NNJ7yTzk8VdMTX5LyBU8I/2bcLU3GMN6do5R8tC3oHCEzio3qec/BHFoKIwj7NZucerUNCWwYXFqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.53; helo=mail-vs1-f53.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.53; helo=mail-vs1-f53.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1xrd3klHz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 19:33:35 +1100 (AEDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4af5ed9c8b4so874153137.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2024 00:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128411; x=1733733211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u56ZXLj3zoJcwhJCVeWsy3FmczwJw23Uyl3fWwY/H5U=;
        b=BbyT4//ZhQzmtk6cLvaABsEhX/uJK8b287C62Rq28q4OrRvRRkjTR8r5v8JOduIXJT
         L8GtpO7PA9V2shrohbpjUu5Y+qmP04323O8SCCF1keBws7w+04ztHJl/8dQf6VRy520q
         Q9DNHhTELlev8rQeoE9AmsGVjpHql7kCNad9m+YguYGgAR6qQ4cr55P4di1DesUCij9W
         tgdgz7aLdkR//4NADsYpzmsKJXcmGBmXStLEjMFyJH1uuCmVseOxKHjKKiUdI1hEmYqY
         pI10BjqdyKyrmVN2Hq3hSBACMuzR/JNzvMhJgvX7v/U1vVHnWs+FxzdVRcye/cIqK6XB
         OZvw==
X-Forwarded-Encrypted: i=1; AJvYcCVkfOC365D1fwSH60A9YqHeWo4TBWEayfpn20gFf0OJJJGHsz+GCEbHWmQLg+7QAto6CsRFRKS3qxDKpPw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoJirWKxSgKO6r5lYQuOcO09UX/VW2D1Vh77kpkbe82eGU1hAG
	ARsPRHNL0aiDVEOcwVdyalVIYeRfDvGX73IA7mOUaMUEbayZXX1yr5TN0nn9
X-Gm-Gg: ASbGncvo3m/cPGR0jo3zfxLwy6s9Xl0Srign2zi2jKhAXv8s2YOQl40v7Hw0Yj4XNrL
	paClHTK59wNSSgI3ElnE8wFMTWGMHJL/oUfNxFpAIAM67ePu+6qZkxeDWjMcqc3o6zWOVKTJVn1
	Z63ATKRNUs5sg8BiA/i9rcsKjeturNhtmY8KQoC08aPSihIqKeoRmG4CN4YV9zXQNqnNdyqdSWl
	dH7h/EOiYidpZ2ccBBlGQTLMCzkfEd506Ih4BPUXdHTiR8VEtLmw1UMMFlmgeSa8x8l/DY77kpN
	lPiOscCic6cn
X-Google-Smtp-Source: AGHT+IEvpS3O4rEBWuP8lMEHA9aG5urDHP2XyQXYFFd49JXmpEXdyK+/TwM5nLlE5TIQi+HGjE2Tmw==
X-Received: by 2002:a05:6102:e14:b0:4af:59ac:c9b4 with SMTP id ada2fe7eead31-4af59acca7bmr17205680137.2.1733128411425;
        Mon, 02 Dec 2024 00:33:31 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af590e725esm1710705137.10.2024.12.02.00.33.30
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:33:31 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aed6fdf04fso928493137.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2024 00:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsA2igBaed/fFCVzLFke8kv4HMRL9pe5NCkrMnm3lEmuXTdAPCJA/Zyb0amGx9iI2XDIYWQZQY6C3rJak=@lists.ozlabs.org
X-Received: by 2002:a05:6102:954:b0:4a9:5d98:6c5f with SMTP id
 ada2fe7eead31-4af448f6d7dmr26891641137.5.1733128410739; Mon, 02 Dec 2024
 00:33:30 -0800 (PST)
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
References: <20241202012056.209768-1-ebiggers@kernel.org> <20241202012056.209768-11-ebiggers@kernel.org>
In-Reply-To: <20241202012056.209768-11-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Dec 2024 09:33:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5rQggS9YHMJfU0gdhg6oFENTnPKp9Tbp3sJKgQdnMTA@mail.gmail.com>
Message-ID: <CAMuHMdV5rQggS9YHMJfU0gdhg6oFENTnPKp9Tbp3sJKgQdnMTA@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] lib/crc32test: delete obsolete crc32test.c
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Vinicius Peixoto <vpeixoto@lkcamp.dev>, "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 2, 2024 at 2:24=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
> From: Eric Biggers <ebiggers@google.com>
>
> Delete crc32test.c, since it has been superseded by crc_kunit.c.
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/m68k/configs/amiga_defconfig    |   1 -
>  arch/m68k/configs/apollo_defconfig   |   1 -
>  arch/m68k/configs/atari_defconfig    |   1 -
>  arch/m68k/configs/bvme6000_defconfig |   1 -
>  arch/m68k/configs/hp300_defconfig    |   1 -
>  arch/m68k/configs/mac_defconfig      |   1 -
>  arch/m68k/configs/multi_defconfig    |   1 -
>  arch/m68k/configs/mvme147_defconfig  |   1 -
>  arch/m68k/configs/mvme16x_defconfig  |   1 -
>  arch/m68k/configs/q40_defconfig      |   1 -
>  arch/m68k/configs/sun3_defconfig     |   1 -
>  arch/m68k/configs/sun3x_defconfig    |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

