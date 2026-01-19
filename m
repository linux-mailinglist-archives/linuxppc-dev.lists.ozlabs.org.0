Return-Path: <linuxppc-dev+bounces-15980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD35D3A696
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:18:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvnxq3Qfqz2xjb;
	Mon, 19 Jan 2026 22:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768821487;
	cv=none; b=e8ZoV/x0mYwLX8+rQqMW0OejKxeuwDO2GSDLJNwumRYicGed73nUD0P5gJe2i685gRWe3+6bFic/fsGpglfzkflU4e5Juhu9oXCku1+KcHTowRe6kyp3XUMsdAmiT4asAJWNNJSKRGznK3Ewnosq6fdEQj/rYYvtw4kQR8yuyrLJEWdFU5/M9gdA1ncp3yLw8J/q264DL5w8Qe4DkQzayPPMIKhfGleNLXW6uvBYN1TdILYAsUciCvH6nDgEgjFFBjnCYtzg68d9di8aTOp4yqwMH1wBJ4N+7xpzF6+pRlTmKkmtPbItpdudXbIoNpUbMVZl/Zy+0/NaFNjvEAIn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768821487; c=relaxed/relaxed;
	bh=Qrt8Pc2QUAYXx+nK9SbBMDpSB00S5AE1V+9Iq+T3JoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/HX4WFa4ld525VoLhdPQCl/ikbNBO4aVJito5IYtgcj6RkDT8JMzekMScD38yvoDGTkGMknaAJpnNgvIF0dCk0ogznfWHp5Jhf1tkyasG2tqfU5W6Igk8P3c9mYGMVdKsilEr1xN0h7D81grjGhAAvOt/WR1N7PRaiWCrT76WxhGzVlMcNMlCIoo9aA9bYpNept+7SQJ4bxrffOd/kQKn/CuPzWUMtO3RLrr/mZ+5I88153tsr6ArgEyjOIH/+DiYgnBPuK+EXKhfrvk2RhTMyUdewceuJHj8vBH1AwG6vA/QSX1dUw7TCJYaL4T9ns5ajj8E0mUgzA6T9fhdnuew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QAecoarN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QAecoarN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvnxp3DL5z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:18:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29F4F41B4F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D149C2BCAF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821483;
	bh=Qrt8Pc2QUAYXx+nK9SbBMDpSB00S5AE1V+9Iq+T3JoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QAecoarNHChls3V/koML1MoTCmcSstaYu6upGx1rM+y2j9tIJYU4WTCmdLhQZYH4h
	 a4/BwXPwDJJAVFiOUjFL94sLogU6+CewqpY1d2U7WGQtBh5UxNkp3sSwB8mZLTUy/h
	 aIXwVLQ/TsMOaytrWRvocvl4GxT7Q3f51HgfKLpxD7gMkaRqIdlsjTnOJQhlZZnycE
	 swC9Stg16nZ8vSF/dX47WLNuytsZiPXn4T7iNJ/6r6z+t9yogQ7iJSWp6hF7KzuUfk
	 P3RyHi+AUOyAGxk+e9lBkvwbkmYunPIGftM/YgflqYAooqm8QfGwSgrT4Xibf3DWdv
	 +PSVXMc4/1OuQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso4606732e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 03:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGY1AN02wdBjF5xq2gCCWE/7BX70z9tCb73ZIwY+LaayFG5+lcFQVhvCq7jEhOVRqCByCKsHzKyHawLO8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzo41w7jZ3y3sd8a/myask8ofxv/P0hhzElG2QerawAj46uXR1Y
	JKjfhjvn908eGc8IIdmGsHyZBFqO+krPz7l93G4LHSm9Wq5o4F0T/PSeK+ry22C5/l9Lnommoml
	FqVfBCQalbIp+pq9dXjrJAhgBb02kpupmkvy3lrdD0g==
X-Received: by 2002:a05:6512:234a:b0:59b:73b9:1f49 with SMTP id
 2adb3069b0e04-59ba71a21a4mr5663497e87.26.1768821481438; Mon, 19 Jan 2026
 03:18:01 -0800 (PST)
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
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com> <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
 <aW4PajoKqmyjkciY@hovoldconsulting.com>
In-Reply-To: <aW4PajoKqmyjkciY@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 12:17:49 +0100
X-Gmail-Original-Message-ID: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
X-Gm-Features: AZwV_QhTOAeF1zNPvjVLJF6GJlUC44HwEM3vIZ8FNKt6qikN3ueMCqdY3a7S--s
Message-ID: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
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

On Mon, Jan 19, 2026 at 12:03=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Tue, Dec 23, 2025 at 04:11:08PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 23, 2025 at 3:24=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > > > It's been another year of discussing the object life-time problems =
at
> > > > conferences. I2C is one of the offenders and its problems are more
> > > > complex than those of some other subsystems. It seems the revocable=
[1]
> > > > API may make its way into the kernel this year but even with it in
> > > > place, I2C won't be able to use it as there's currently nothing to
> > > > *revoke*. The struct device is embedded within the i2c_adapter stru=
ct
> > > > whose lifetime is tied to the provider device being bound to its dr=
iver.
> > > >
> > > > Fixing this won't be fast and easy but nothing's going to happen if=
 we
> > > > don't start chipping away at it. The ultimate goal in order to be a=
ble
> > > > to use an SRCU-based solution (revocable or otherwise) is to conver=
t the
> > > > embedded struct device in struct i2c_adapter into an __rcu pointer =
that
> > > > can be *revoked*. To that end we need to hide all dereferences of
> > > > adap->dev in drivers.
> > >
> > > No, this is not the way to do it. You start with designing and showin=
g
> > > what the end result will look like *before* you start rewriting world
> > > like you are doing here.
> >
> > The paragraph you're commenting under explains exactly what I propose
> > to do: move struct device out of struct i2c_adapter and protect the
> > pointer storing its address with SRCU. This is a well-known design
> > that's being generalized to a common "revocable" API which will
> > possibly be available upstream by the time we're ready to use it.
>
> Revocable, as presented in plumbers, is not going upstream.
>

Oh really? :)

https://lore.kernel.org/all/2026011607-canister-catalyst-9fdd@gregkh/

> > You know I can't possibly *show* the end result in a single series
> > because - as the paragraph before explains - we need to first hide all
> > direct dereferences of struct device in struct i2c_adapter behind
> > dedicated interfaces so that we when do the conversion, it'll affect
> > only a limited number of places. It can't realistically be done at
> > once.
>
> You can post an RFC converting one driver with a proper description of
> the problem you're trying to solve.
>

It's not a one-driver problem. It's a subsystem-wide problem requiring
a subsystem-wide solution. Wolfram explained it really well in his
summary, I'm not going to repeat it here.

I also don't agree that i2c-specific helpers make code harder to read.
Is device_set_node() harder to read than

dev->fwnode =3D fwnode;
dev->of_node =3D to_of_node(fwnode);

?

Even if you answer yes - it at least helps hide the implementation
details of the OF layer where fwnode-level is preferred. We do it all
the time in the kernel. This kind of helpers allows easier transitions
when some implementation detail needs to change - as is the case here.

Bartosz

