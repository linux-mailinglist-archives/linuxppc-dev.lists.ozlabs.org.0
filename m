Return-Path: <linuxppc-dev+bounces-15735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EDDD1F15C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 14:37:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drnGP2KYbz2xNT;
	Thu, 15 Jan 2026 00:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768397821;
	cv=none; b=kXWwWKo3U6lyTTS33wPlVJfQ8zEGHjVo7RNsdVq1xgjS5jdVJzqTQhjVBjMYdjZwBW4lH2cN5norQeXWfJ1fogjJS6JWlYvskiuqriuPhEG3N0DEFTHPCHZkAMZriinXM96HcYW0FE51nqgctrWjQK7QtH9K+M/9XwlSJh19CPPIkx7G6zB7CX2QZvqDKmDu/bhF9nM0qBOzykA9bUTBWUrVSh/i3UG/rBKlZLsGdH8tvkZ7teg8E16b2VD0CwCcvQxYNWUxZnOgkbOp9uakippJpNwphSn7+MxvvZG5qQJeZjyMkzFw+q1lIr3jiKeQqN1/37zpn/baPnaoAGtZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768397821; c=relaxed/relaxed;
	bh=iV2zIwFS7NHR+Qp/+VWDRZd4JeaS2I3vbQOZ53pHX20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpTvPeTKvM/ay/p/GFu3cZzzMCis/h0jst4aga1NZXpWzrwJSGAK5pNpeUyMV9RarfHKOiUXg0aLvu8cqyZG0h+K+NbPsdA5Ra9Mc1U1RINYfq/Nnua6NyNeeNvuKuy9FSx2/8La6JMt7nzRZQ6JLHJcijtZHHvlyxKO32nYGsh5EW2DHSUEE4cPgnfHD/9XZT8jvTsOHG2OWs1d0Eukifqbz1WPvMzSzKZGQWnH5hc7wQ6rJyTuOGGKaC7ruaPAX/G1JKxAOrd65c822O+IWomUkor8kPbEjN6Zl7VQxNKfTlq8Qij8JHlTH37oyAsJb1WmcUBy5n6LPbFohtRxPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VBYPO5pS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VBYPO5pS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drnGN06yNz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 00:36:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BFD841867
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 13:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E148AC4CEF7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768397815;
	bh=iV2zIwFS7NHR+Qp/+VWDRZd4JeaS2I3vbQOZ53pHX20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VBYPO5pSI8rH97CrxrlpFcNe8up2TALe4Ntxv1qjoRJSpwUJOQc5Fhagj8/PjSQ48
	 wkdlwbae471gei9GTYTB4ynI0nsml7zP4gC1GMu1wmcE8BorN8vyrLO4vf5blzmNBh
	 xGh7g3YAkIMVg1FGZrmduoaZtJsWjHW8SGyiLHUS7Wa6HUJRnZs1e/qHCUxxhMEneA
	 B9+ylZY0tZz5sXWtPmrOpLtOglaVJ0zRijneAbWsxp+hxzqy+/0/xbrQvSqcB0TZry
	 tTwlKc3J0WRZTwo5hLImovQZU2Ao7IiJscfvtE65gDQG93qPoI1TazbYnFWmZOmDzV
	 MH0qBVWi73RFA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b9fee282dso1204976e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 05:36:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYT1PhrxdsXgMQlDITpG1En7/ntZw+1rGL450E9wdYB0zL1y/gi9xQzbA1ses7IXf6jfUEkG+oq8GphrQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSbHCZgJVcjHR+JMWzZ19QayecI9REMeQ4UpECwjOFr0sG8oeC
	0L4jtXUl8DUSJaTuc7QAofgm0/B+HyqH+6AZzd9AWsihQzPrOF2IOYSXCETkVDF0Acf0MtFBm8+
	8QNudjFzvM7Y5hc89kF8Glb7M8yFq1mq3p4WcbeVGWA==
X-Received: by 2002:a05:6512:3e10:b0:59b:70e7:4121 with SMTP id
 2adb3069b0e04-59ba174d90emr764517e87.36.1768397814581; Wed, 14 Jan 2026
 05:36:54 -0800 (PST)
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
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 14:36:42 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
X-Gm-Features: AZwV_QiYLMexanAhF-BM1IfGaqguSnDiL1N1XOc2vJYCEMxqR8GZei0usNH3TDU
Message-ID: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
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

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>

FYI: I think the road-map will look something like this: v7.1 will get
new interfaces and most controllers under drivers/i2c/ converted as
this can be done within your tree exclusively. For v7.2 (with the new
interfaces upstream) we can think about converting all i2c controller
drivers treewide to the new helpers. Once v7.2-rc1 is tagged, I would
try to remove struct device from struct i2c_adapter locally and send
it to autobuilders for testing. If that goes well, we could create
struct i2c_adapter_private or something like this and store its
address in struct i2c_adapter. This new struct would be controlled by
i2c core and contain struct device. With that out of the way, for v7.4
we could think about adding SRCU into the mix (possibly using the
then-available revocable).

If all goes well, we should be done in early 2027. :)

Bartosz

