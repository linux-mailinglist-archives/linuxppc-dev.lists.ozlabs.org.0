Return-Path: <linuxppc-dev+bounces-14959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B75CDACDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:10:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW256lhyz2xqG;
	Wed, 24 Dec 2025 10:10:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766502684;
	cv=none; b=Vl/aqX5A6ynuDze3hWzJjBF5ORZl6PQZP7JZerytItgXFBGiIdd7BpAZ5BHFixyzQimNYzThnDbCPJt8SCupYaACd4ICrTs5lJ7eVmieQCAyKPxLuem2qIVRztnS5ZtySNTzb1jNed/uAt9/rPcZiYdtddR8+hzU1eevcMj3dCaWFyKFiD4hrwLZcLmAfQUdzml76YWOqBWS8ATrjJSaqqALC4+FCmE8nGYNrfIrC7fU0HlOlXpdjKNXcDYKhHcKof+iU+6+veCrsOU/Z2/zdtLSkdTVPhG81ayJQfwC8tzmqo16ZA/RyMwfhZFefzrdkjZTdsBupt+DzN83BFhuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766502684; c=relaxed/relaxed;
	bh=hBd99sFsDzr3RqRdPe5qJoyoWGaL7p/NWTHuLq0D7w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZYG4lQm/SEix1igraCFsOElsD3rHu865kgtwiXyYomptrE4U6ToQT/4CdZsMeR1LXxhXsonO7SFDWQ4GkkZvKQ4DW+LGixFWn9v3Dbg7ge1j4BiX6wVQQSdDMELUirCb0EPHikAd6UV/ldPux+TJCTJewPOojA76SVigsF4mVfzN/uFtEjQTRSoPFujr4Gyax91n3/bDwXQlYJ8niJ66b1zIWola57LRmdzpYWUrZk8kgy5dL3OXX4wBAkCVO63hgBll28mM3AK4DKA6BcpX2pZS5EHKdk/SnJ6P6K2zOtaxIA0F6CL6tnwLDmQeljPJDO9l1EM0AtSaZ0QFQHMXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeaF69Me; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QeaF69Me;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbJPS06sXz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 02:11:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DDC944449
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 15:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC062C2BCB2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766502681;
	bh=hBd99sFsDzr3RqRdPe5qJoyoWGaL7p/NWTHuLq0D7w8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QeaF69MeT5yBf4q0xDAsch9mn85tB7U/A6+7P7ESpX1u88b1VTvqb1KdAgCgpxDYX
	 GsUem+oUjjLn3eGCPsHWpGk6bwDY9lfpkkYR6b2fi0dIdNDrxAn+DtFzP0SFVa28Tm
	 cPkCe8pweTq6PLlZCfkBWBg1+KFHCqtnmiBY8Nu0p7KyXMOk7/eIWS35wKNaXYX1Md
	 kwu7AUdGhIcfVqTYeP2qjs3lJnlhlxBz9o8FyBiDCli5kOqz90fcuUhd26ttQ3T+sf
	 vKSWfgmHbrQnmBK/qysDXHGPtCR3KhoTSGcBjW/P70dCjgjVbjdrA3l0qvhzrsx1Lm
	 e7N6pa0uTsFTw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a2dced861so60098301fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 07:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWj80Pe7Kecpib/5MIf9msYRAaCRNE9xHxs8X79X6Tmyjc0urOV0Tx+poIxuLgIVtlNpLuxmh5IiCt2raw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLjNPXPy8tqg1webtK35odTAsuRUCam95IP42ojN9wbvDYZ9Jz
	wsVksBpI3ARH5CviGq8l3awVoVjk+bKFivucKuKRre1EymUyYGyNWOFnElUMO5ozQelaCV2q8HQ
	0KvsybqNYBNTJvAHuZhxFnlBGpc+TZCIYzDWpnUQHLA==
X-Google-Smtp-Source: AGHT+IFdufR6j9R1oFKNSbl+pKd9Z0pO11ahHM/zkyZYbJzkzxH5yHhlEwogbQjTtBxGrsqfRKfJTkaYfWLXkoOjLuo=
X-Received: by 2002:a2e:b88f:0:b0:37e:6b29:111b with SMTP id
 38308e7fff4ca-38113162f37mr64888811fa.2.1766502680316; Tue, 23 Dec 2025
 07:11:20 -0800 (PST)
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
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aUql_tZisfH8E1bq@hovoldconsulting.com>
In-Reply-To: <aUql_tZisfH8E1bq@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 23 Dec 2025 16:11:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
X-Gm-Features: AQt7F2oePEehO-JdLKixmyMZf7bMW4cvrFzOuWvK19hmXZhvMoz_mkpRCfNkPVc
Message-ID: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 23, 2025 at 3:24=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > It's been another year of discussing the object life-time problems at
> > conferences. I2C is one of the offenders and its problems are more
> > complex than those of some other subsystems. It seems the revocable[1]
> > API may make its way into the kernel this year but even with it in
> > place, I2C won't be able to use it as there's currently nothing to
> > *revoke*. The struct device is embedded within the i2c_adapter struct
> > whose lifetime is tied to the provider device being bound to its driver=
.
> >
> > Fixing this won't be fast and easy but nothing's going to happen if we
> > don't start chipping away at it. The ultimate goal in order to be able
> > to use an SRCU-based solution (revocable or otherwise) is to convert th=
e
> > embedded struct device in struct i2c_adapter into an __rcu pointer that
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> No, this is not the way to do it. You start with designing and showing
> what the end result will look like *before* you start rewriting world
> like you are doing here.
>

The paragraph you're commenting under explains exactly what I propose
to do: move struct device out of struct i2c_adapter and protect the
pointer storing its address with SRCU. This is a well-known design
that's being generalized to a common "revocable" API which will
possibly be available upstream by the time we're ready to use it.

You know I can't possibly *show* the end result in a single series
because - as the paragraph before explains - we need to first hide all
direct dereferences of struct device in struct i2c_adapter behind
dedicated interfaces so that we when do the conversion, it'll affect
only a limited number of places. It can't realistically be done at
once.

> We should not be making driver code less readable just to address some
> really niche corner cases like hot pluggable i2c controllers.
>
> But in any case, don't get ahead of things by posting changes that we
> most likely don't want in the end anyway.
>

The changes I sent are the result of another discussion with Wolfram
at LPC so I'll definitely wait for his take on it before dropping
anything.

Bartosz

