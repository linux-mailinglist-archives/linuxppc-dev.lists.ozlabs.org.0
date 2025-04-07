Return-Path: <linuxppc-dev+bounces-7496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094BA7E80B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 19:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWbc30Ldrz2yvs;
	Tue,  8 Apr 2025 03:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744046514;
	cv=none; b=YBhD3bPGEbnQNTAVvO1nhFIFH34NAX88LrWUH1FT8juOhwseaAICoWh5LoXlvTwRzsXmYI1n5lJiWU9/LqSdTkntSZBK4suC4/hd4Vl9P3bxYtakl/xOsRB1ljOd2Jbb2aQ6U5x9cECws383nuQV6dZ2Fr9jH+mrwL/YczE6BTt2S2V5URJknEI15jYO+6Idzvv2Gg2QvdOUTbAG0D5Onht25BDBcDTacIBBCZL1w2CnsW7gLgTwUClMeOjxSX1WDfVhMkm3htkHC3qSrKOx3II6nDk76kbjvxVuWT3SVFbmyt60kKXpZHK7PWxn/DInEuU/g3MVR09JZVCPhyhtzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744046514; c=relaxed/relaxed;
	bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0HWdOQj/UL9K/oyvgKJYL4WsjB6fVU0a9bgva9dUJheQiDUQY++dVbhCaKYjTJeOas1S9t4dNzcUvJJVObO63dYq/tGOkpmUWRYjrQqrEM0GuFeuao+6q94wpZSDq6s5rhlymhj1TP4jB8ovVH87f+tS9iU5NB3eUsCRoiokWInBkFsFgDJXaRauCgxLIh3XSEo0N3eUOh7xfJPlWPHuYEAiqrn6m2Z3pMEEetRPoFfltu6OxkKIaJIddCJgLbEYvXttsbYQqyp8GvbXAFGvPVQnPQHRUAyooBa1Oe6kyjJDlS2vmdjDm/HPEAEhfxYUT56h8gVrNHfbxzU5VfeDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kv2LrkMD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kv2LrkMD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWbc16MF8z2yrh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 03:21:53 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c5f720c717so588646285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Apr 2025 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744046510; x=1744651310; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
        b=Kv2LrkMDSpqKoK0yR03JL8pVQ/lQ6LIAYmgVN1dwPr5mVQJDU2h4Jn8FuOHmSQIBM1
         ognhubIlj4fHTuDif6207k8o49NNvOdDfDUXeYVEjJzk5uweUu6YNBH4pJxw7GwS7+aq
         2PUD7roLKDs8x4GX9yLv9QkDP4vQfH+fDzXxK6RM9PqRnFLWfEkRTCCSRiNn21Ycl6Dm
         A1ZCU0DDJgdIA+DRbzOP5ghpX0TQz7o5+PYTsmtcEAxRdIVH/pJYHOqVst7WzQtuM2vW
         ZQ1P7xEXoClmO1vI6Ha3LXUoK/3Wwh/Z7a7DJkOUNyPJWadlTDFRlHx2AL79LIGJSR/Y
         IYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046510; x=1744651310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
        b=X4n6AcIKANANupoXkK2S2WKJY4Sp24zZIbDtZ9rh5gi+5mK6gfWmxxh769qJ3Z04eh
         OBI47E3kfJFTtLnOx2RvQNofRw13uxW+Qm0Engb/kkuJ+zVXSDnLNQrruXrKYJX/B3pZ
         XInXO8OEQk0AeO7HZm/+A+FvTf0UEOC9qXiqIt43ybDvc+UwLyPch7tlXvq6B2ABTyCA
         ab1aA+nX4/i+AZwBSPEIpIK80fQsMJVkOrf5aBhD7IUXRuU0dsJrGo+GDv7TEurRxHg4
         Y0dR4El1biTNBcxo/2C5KHHu88PzLW41Tfqt3QVyq4vwOoI8NYG8/79B6DfgnMqweZJw
         2QDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJpnl3lrNP3/03SPTRjxhgWacc7IkhlDzImaphL+G0IXg6LuiCB9RAOudZnLNeK6onAQDyvLTUi8MPVpw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxQH6JTX/2wCGh2eWMNj6vTg14yK6fMc0UV3ma76iPXZDMkYtl
	GyIVaiiL/H5P4sAQkaWbWaOrF0VbyBOXaJQY8EoThG15B33yB5cmdCXI7mS/W2XovFpb2NLO0iD
	bxzRfg/R7JMT/QpKEzvOh7jACM7U=
X-Gm-Gg: ASbGncviUQi+ZBnEXWEjd/pJ4J37RT/9w0fSK2rP+7A0igWHnj/NsnbkrcD7QrqFzh2
	AjF0ZFyPkckkM5no8hk3H1juyVlt8F2Bor6kY+/jdTroMDz9o2NTj98712QFjVCvZ4ULLrw7Vi0
	Er3nX5Pwc1axjKCHvpxCXMvRqRKQ3Mdn7ZmHk=
X-Google-Smtp-Source: AGHT+IE7oF7zYUiFClD9j+MaUG+QMzWikeMa5fdbd6jkjTVPOvWSr5tLM3OX7RIKBrrUgH1CqT/Ky1y9rQ5HCbtZCIc=
X-Received: by 2002:a0c:c688:0:b0:6ed:18cd:956d with SMTP id
 6a1803df08f44-6f0d25479aamr4072856d6.22.1744046510291; Mon, 07 Apr 2025
 10:21:50 -0700 (PDT)
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
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390> <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com> <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
In-Reply-To: <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 19:21:38 +0200
X-Gm-Features: ATxdqUFVoaO2wEB2GhdEUNwWwPj2cMvxUNhs7goYdYdDae4Y74aVkceCOkA0pWY
Message-ID: <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, upstream@airoha.com, 
	Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Clark Wang <xiaoning.wang@nxp.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Madalin Bucur <madalin.bucur@nxp.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <michal.simek@amd.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>, 
	Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:46, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
> > <sean.anderson@linux.dev> ha scritto:
> >>
> >> On 4/7/25 12:27, Kory Maincent wrote:
> >> > On Thu,  3 Apr 2025 14:18:54 -0400
> >> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >> >
> >> >> This series adds support for creating PCSs as devices on a bus with a
> >> >> driver (patch 3). As initial users,
> >> >>
> >> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >> >>   the Xilinx PCS) (patches 9-10).
> >> >>
> >> >> The last few patches add device links for pcs-handle to improve boot times,
> >> >> and add compatibles for all Lynx PCSs.
> >> >>
> >> >> Care has been taken to ensure backwards-compatibility. The main source
> >> >> of this is that many PCS devices lack compatibles and get detected as
> >> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> >> the devicetree to add appropriate compatibles.
> >> >
> >> > I don't dive into your patch series and I don't know if you have heard about it
> >> > but Christian Marangi is currently working on fwnode for PCS:
> >> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >> >
> >> > Maybe you should sync with him!
> >>
> >> I saw that series and made some comments. He is CC'd on this one.
> >>
> >> I think this approach has two advantages:
> >>
> >> - It completely solves the problem of the PCS being unregistered while the netdev
> >>   (or whatever) is up
> >> - I have designed the interface to make it easy to convert existing
> >>   drivers that may not be able to use the "standard" probing process
> >>   (because they have to support other devicetree structures for
> >>   backwards-compatibility).
> >>
> >
> > I notice this and it's my fault for taking too long to post v2 of the PCS patch.
> > There was also this idea of entering the wrapper hell but I scrapped that early
> > as I really feel it's a workaround to the current problem present for
> > PCS handling.
>
> It's no workaround. The fundamental problem is that drivers can become
> unbound at any time, and we cannot make consumers drop their references.
> Every subsystem must deal with this reality, or suffer from
> user-after-free bugs. See [1-3] for discussion of this problem in
> relation to PCSs and PHYs, and [4] for more discussion of my approach.
>
> [1] https://lore.kernel.org/netdev/YV7Kp2k8VvN7J0fY@shell.armlinux.org.uk/
> [2] https://lore.kernel.org/netdev/20220816163701.1578850-1-sean.anderson@seco.com/
> [3] https://lore.kernel.org/netdev/9747f8ef-66b3-0870-cbc0-c1783896b30d@seco.com/
> [3] https://lpc.events/event/17/contributions/1627/
>
> > And the real problem IMHO is that currently PCS handling is fragile and with too
> > many assumptions. With Daniel we also discussed backwards-compatibility.
> > (mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
> > that slipped in before it was correctly complained that things were
> > taking a bad path)
> >
> > We feel v2 permits correct support of old implementations.
> > The ""legacy"" implementation pose the assumption that PCS is never removed
> > (unless the MAC driver is removed)
> > That fits v2 where a MAC has to initially provide a list of PCS to
> > phylink instance.
>
> And what happens when the driver is unbound from the device and suddenly
> a PCS on that list is free'd memory but is in active use by a netdev?
>

driver bug for not correctly implementing the removal task.

The approach is remove as provider and call phylink removal phase
under rtnl lock.
We tested this with unbind, that is actually the main problem we are
trying to address
and works correctly.

> > With this implementation, a MAC can manually parse whatever PCS node structure
> > is in place and fill the PCS.
> >
> > As really the "late" removal/addition of a PCS can only be supported with fwnode
> > implementation as dedicated PCS driver will make use of that.
>
> I agree that a "cells" approach would require this, but
>
> - There are no in-tree examples of where this is necessary
> - I think this would be easy to add when necessary
>

There are no in-tree cause only now we are starting to support
complex configuration with multiple PCS placed outside the MAC.

I feel it's better to define a standard API for them now before
we permit even more MAC driver to implement custom property
and have to address tons of workaround for compatibility.

> > I honestly hope we can skip having to enter the wrapper hell.
>
> Unfortunately, this is required by the kernel driver model :l
>
> > Anyway I also see you made REALLY GOOD documentation.
>
> Thanks. One of my peeves is subsystems that have zero docs...
>
> > Would be ideal to
> > collaborate for that. Anyway it's up to net maintainers on what path to follow.
> >
> > Just my 2 cent on the PCS topic.
>
> --Sean

