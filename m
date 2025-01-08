Return-Path: <linuxppc-dev+bounces-4879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C7A0689F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 23:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT2yT4Shsz30ML;
	Thu,  9 Jan 2025 09:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736376225;
	cv=none; b=m9vGFRFyidMC1PwMOduL3xENB62LKq4z9Nxq2Uc0lmJMgpkFNBQrP4CN/2ak5Nn/3tpRKF9cf/NGks6ve5HT3y6tiI/jK3n1IrZz5qY2Sbf2+AVdrAVmFTIJtveaNLCMpY6Sr0HvbiKDYRm7hL2j6WuEB1mzsHBRB4rHjbaLF0gNGF3dQzXp5Bh9aewWKayos9hVY4VAp9G6TA9s5G4VLYlD1GjiMcy1Zchzf7R+FkOJUlm0GThReFIIoEN5mkAJSRtO73AKdvwl0bBzIM8J7TbC5hSWKFQw6d5iYyOWawOyh1VQ9QbTisFzOI0X8cG9aE1FXjk4LtTWs4mFoaP4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736376225; c=relaxed/relaxed;
	bh=CfWZ/ui/4R0zpE+xdBmF9S3b03gotAd4P+7iTHfbrm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EM32KxeBCCYDJgtK2AxHPHfgIz4WsOtTKeiKH83aI0qjCooUykUYDprLdwmLRSnv00WmGEJPkmyMfZmkhj7xx0n5fralVKfWfRxSa4mIt8YwVGYqdaSIn+kwh/94/euhRolj9Co+WccQT/d6lAW+IbIIhOZ9uUa7l3KdAIcRuttdDTAahoLZSgw49YdBIlYW99PJ9FjNboApfI7cerE8fE2hl9J0gxMT8jkjr7ATTka6Y2lWVNWGPm16rEVMmu1rdK7aRCcfdevjrZKoKUl82N8+DkGA+AZYGJnRmi/aHFAqkwfN4I4NC5vWyG5fydKXOVhs4B5BEhDXKVyuNHpzTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FHr2/3Xt; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FHr2/3Xt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT2yS3lYVz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 09:43:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 425465C4237
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 22:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BAAC4CEE4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 22:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736376222;
	bh=RAdH3xyNDjlY7o34z/lOpEGF3/pUFhzFt/n00JDaEko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FHr2/3Xtod4oakXCCFN4wWo/OA9XZqJa/PyBAbA98a1unn7kPTWVP9DLuMFh5w7PS
	 0ONqdkXq9B+rb9bsHg15/Pseae6siRjANAOz1JMGwPzciLYxF2wkjSrpWC5CAb6BG9
	 WDwGBT0GUEa3u0bYk7TpkO3QuxC0eLB2W5EdvXN0naUhMKH9cUGDLtzIBZvsXbZRxD
	 d+auQiUO2QDsFf38zZkOXQYbjjJQkKU8e3WtVl0p0T+JLBad7tFBDl5UTHBtbKYM5z
	 XH8CLdsHPHDoQrhdbU7kStJxiHxoy2qhUdEdnGuuM7sUICBUyF1L09kW2vrdjfKzTY
	 MGnG5YpivBwWA==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e46ebe19489so333486276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 14:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWp4zRM6WVP6rQ/i5ufMjFHTMePGdOqPaGF/1QROtRdD1rdooVYb85R1M+VH9xLNNP7K35HbPeBrlussQU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/qaE9g9kVzdQCI0rICE4nypF2/6aLyTKQS9Zzm3OcBR+SOLGn
	+8GAB/BezDM9CzB6Sgyej02HOG34vmMi7C6HeiRe5J/VsxnB3YbX7LwBHus6oZYfWjgN5ClXDey
	SR0TZMX1ihS/nwULMzosmYWZZEQ==
X-Google-Smtp-Source: AGHT+IHebptiUC2IooqZqj6nRRfRj+vGpf4w0zNYFHU3vSx9U6vxKXCpBBUSy1BHrnDt5zHmhbtAyv5ncJM6R6rhH0Y=
X-Received: by 2002:a05:690c:6a85:b0:6ef:6e34:6561 with SMTP id
 00721157ae682-6f5312dd8c2mr41203567b3.32.1736376221245; Wed, 08 Jan 2025
 14:43:41 -0800 (PST)
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
References: <87mskbqher.fsf@mail.lhotse> <20250108140414.13530-1-basharath@couthit.com>
In-Reply-To: <20250108140414.13530-1-basharath@couthit.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jan 2025 16:43:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLGW_o9i6a5wcUj=Z=4nL-GhzHwAQMFtQkb9OSHuSgTA@mail.gmail.com>
X-Gm-Features: AbW1kvYjEG7vM8QkFQpwL9KtJtQb_zQFjb2jzkS5oK731zVX9h8TThp663OOIXE
Message-ID: <CAL_JsqLLGW_o9i6a5wcUj=Z=4nL-GhzHwAQMFtQkb9OSHuSgTA@mail.gmail.com>
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: mpe@ellerman.id.au, thomas.weissschuh@linutronix.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, saravanak@google.com, danishanwar@ti.com, 
	krishna@couthit.com, mohan@couthit.com, parvathi@couthit.com, 
	pmohan@couthit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 8, 2025 at 8:04=E2=80=AFAM Basharath Hussain Khaja
<basharath@couthit.com> wrote:
>
> Hi,
>
> >> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
> >> > The members "start" and "end" of struct resource are of type
> >> > "resource_size_t" which can be 32bit wide.
> >> > Values read from OF however are always 64bit wide.
> >> >
> >> > Refactor the diff overflow checks into a helper function.
> >> > Also extend the checks to validate each calculation step.
> >> >
> >> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.d=
e>
> >> > ---
> >> >  drivers/of/address.c | 45 ++++++++++++++++++++++++++---------------=
----
> >> >  1 file changed, 26 insertions(+), 19 deletions(-)
> >> >
> >> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> >> > index 7e59283a4472..df854bb427ce 100644
> >> > --- a/drivers/of/address.c
> >> > +++ b/drivers/of/address.c
> >> > @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, const _=
_be32 *range, int na, int ns,
> >> >
> >> >  #endif /* CONFIG_PCI */
> >> >
> >> > +static int __of_address_resource_bounds(struct resource *r, u64 sta=
rt, u64 size)
> >> > +{
> >> > +     u64 end =3D start;
> >> > +
> >> > +     if (overflows_type(start, r->start))
> >> > +             return -EOVERFLOW;
> >> > +     if (size =3D=3D 0)
> >> > +             return -EOVERFLOW;
> >> > +     if (check_add_overflow(end, size - 1, &end))
> >> > +             return -EOVERFLOW;
> >> > +     if (overflows_type(end, r->end))
> >> > +             return -EOVERFLOW;
> >>
> >> This breaks PCI on powerpc qemu. Part of the PCI probe reads a resourc=
e
> >> that's zero sized, which used to succeed but now fails due to the size
> >> check above.
> >>
> >> The diff below fixes it for me.
> >
> > I fixed it up with your change.
>
>
> This commit is breaking Ethernet functionality on the TI AM57xx platform =
due to zero byte SRAM block size allocation during initialization. Prior to=
 this patch, zero byte block sizes were handled properly.

What driver and where exactly?

Rob

