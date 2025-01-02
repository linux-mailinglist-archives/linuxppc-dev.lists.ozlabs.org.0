Return-Path: <linuxppc-dev+bounces-4590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B0C9FFEE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:52:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPG5v0r0nz305Y;
	Fri,  3 Jan 2025 05:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735843923;
	cv=none; b=YkarrWD+IOrlrjofwT4n7AxDCsHaakW8zZqlGdzr4fpdE9xhH5h3LyqGvBeWjxJD9jqZ1QxwjmVPWqDjvxgYHqeug0g/NqgIkkzlRDRICr+vk1b0tZVZpKYu3eHJ4fpBR0+Vo5wtTQ9Ff/ZO3jQFnyuJo1HN7uwD40JxUnYRBjCbS2b4/EAHdvOxR66p8mPaPaO6qzhkFk4dbJNv0NcxB2FZDVnWOuME+3zd/xU9OClNo1B6ShEpiIxxL1mTL5DkWJpSqPMMcwiqrMpAcqp6uwrIZANhcUqZY5yUQ4J3++LU1yMK32ftJyPxPh14LkMXl+NDFqfKnCbvqKUaBp9tCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735843923; c=relaxed/relaxed;
	bh=hWCBZ7r0i0yssx7XHMxq6TAPA7lPrPA+v76lqDd445s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3kEd26/OUcnC2IlXxUWIjWS7oruhgpkXDWneo1QpsOE9gnMmhScY0ezUbv1ZcWWi1uZecfWabNYAtsNqGcfbbis921X5DJQddBD/fHoxhS5DO9xEEElIm6JpWuyKSgzCPsR40kRqXxdQZcz/7er+LF86VwGXHXWeaRoojw1uOuN89UcWfsTWInIZeBpko8BwXpOvoUo9yDnmexXBBHYvp4bwHeCrDoiMBHYf5bj3QZBaAW0tHP9/yispgQJxqra7qcYm12X5GuCRW3gKIaxK3D6YAPThkYvq/znydveSWo5Qxgt/P/t1W6W9e2Kfqu2Wf3yTbxSVqbZApwg9GCQrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YIA59CgJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YIA59CgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPG5s74HRz3048
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:52:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 935A95C60EC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 18:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8B4C4CED6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735843919;
	bh=9o9ycyiMUSNjTVnycTsJDeHcaJxmcLIi5oOVn068Vn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YIA59CgJVPlcy7BsCXqkArlhXX/KjGyVK4OmBDMShoKC7rKy9cxcVG1yRUcdG3Bgp
	 3W2b9ipl841HWrkRWvmAjuoCk1c+KDHclzuxtNcDc4jnd/56UggDUTi9lKliAtEDZP
	 74cN0w+pDBZhn5fk78MX0qqiMNSIP9/+39mKT7WZqVquFpMFB2YMIBeUj5HY2rypP2
	 qljlHXe/BSsBcLJrNFCNle2V2yiDTLZn9b6Aio1jmP68buPz4hH7GcRq75JeOmxDB4
	 H7bpzxH57cFiGA6i8b4I5RLbK2ozclLUJz4sUIwA2lbtwmArae2VLR3IE1k70sFnME
	 hinTSZEnXX7eQ==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so12595050276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 10:51:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9OoB8gnq+1r2iG/avXakPZcrUikrM3o7f3VXX+sqOjy/42PhHDR9DC3AzZKizVDF2VpDUHgnMs4VGxaQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0jj2DbuZ6kbo72NHm4KatGbss2WE5kgiCQhC7gs4Cm+/KtesQ
	NiYIZaEkmmQFiiNXZ9xxipC0X6NgTG/SsBokqOlm2F5OeT7xKSLAVNEVyLUNtwUOY88muc473w5
	PxzRrJ27vYgn6onFKPz1W7/v7Ng==
X-Google-Smtp-Source: AGHT+IHzv4tTwd37ygG8C4NPOdk5dyiaF86SEGEk3rQ9YxK7q5xujQyWmcs9lZeqreVVbljcu72dVaYtdMN8q030Y/I=
X-Received: by 2002:a05:690c:600f:b0:6ef:6ae0:e9d7 with SMTP id
 00721157ae682-6f3f82388b1mr294833037b3.36.1735843918368; Thu, 02 Jan 2025
 10:51:58 -0800 (PST)
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
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net> <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Jan 2025 12:51:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
Message-ID: <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
To: j.ne@posteo.net
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 2, 2025 at 12:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Quoting from drivers/of/platform.c:
>
> > of_platform_populate() - [...]
> > Similar to of_platform_bus_probe(), this function walks the device
> > tree and creates devices from nodes.  It differs in that it follows
> > the modern convention of requiring all device nodes to have a
> > 'compatible' property, and it is suitable for creating devices which
> > are children of the root node (of_platform_bus_probe will only create
> > children of the root which are selected by the @matches argument).
>
> This is useful for new board ports because it means that the C code does
> not have to anticipate every node that is placed directly under the root.
>
> As a consequence, the of_bus_ids list can be much shorter, and I've
> trimmed it to the necessary parts:
>
>  - device-type =3D "soc" and compatible =3D "simple-bus" for the SoC bus
>  - compatible =3D "gianfar" for the Ethernet controller (TSEC), which
>    may contain an MDIO bus, which needs to be probed, as a subnode
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  arch/powerpc/platforms/83xx/misc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/=
83xx/misc.c
> index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb1429233355f6=
68fc8563d8ca4e2 100644
> --- a/arch/powerpc/platforms/83xx/misc.c
> +++ b/arch/powerpc/platforms/83xx/misc.c
> @@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
>
>  static const struct of_device_id of_bus_ids[] __initconst =3D {
>         { .type =3D "soc", },

of_platform_populate() won't work on this match unless there's a
compatible in the node, too. Can we use compatible instead or are
there a bunch of them?

> -       { .compatible =3D "soc", },
>         { .compatible =3D "simple-bus" },
>         { .compatible =3D "gianfar" },
> -       { .compatible =3D "gpio-leds", },
> -       { .type =3D "qe", },
> -       { .compatible =3D "fsl,qe", },

Better still would be if we could move the remaining ones to the
default table and just call of_platform_default_populate().

Rob

