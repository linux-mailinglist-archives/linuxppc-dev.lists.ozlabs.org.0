Return-Path: <linuxppc-dev+bounces-7493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AADFBA7E716
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 18:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWZqc1NtVz2ytT;
	Tue,  8 Apr 2025 02:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744044411;
	cv=none; b=Jifv+fjL8hEnyC1A2ovTs584L0JfNSTcFQ1dWHxxym83kZ9+EHs5VFTZdKxQ7QpobxqVPt0RGqNLZpmSBqdgkz6kzTT+KnjuLoYbJyGwK4EUJCrlWYLwsID+xADWt+LL+/rY4N/f5nntfxuKVgsJ2aFI6T/BqCIluXq/8Dy9/ULUx0dhGTska1yPOkRlkuuB5fAoibWAcKFvkf59HkyrZtA6rIu4lDmhX+e2xCpnTVtG1XzFa3oGfSP8olNOD5yK9F78/NcHhLv8vxeqg/qGpPC2TsGw1+DJ7NKuApw0sdZ3WhpOG4sNu6rFC53bFjfr9TZdtHsT9M1mG6dd8f6K0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744044411; c=relaxed/relaxed;
	bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqOi7UIGtJJncIa2cw9uXHtYWlI8gLzgDnIvshx0+u4KzgNTzgoE/tfcPCGG7dxxfdAtiuEoUgdmj2aAN6GLMmuCE6dlOkxdIji8KzwOmXvF7gRHt5fhLEQu7vGv9kskx2mRzSak+sFF+JFJZOsyANIC0Zm0rlcitLB7ulcIzMF1mC8lwhybbcdaU241i7SYd6rzNnm5C2M9tU6UFkP7z9KA61AoAW1tpL/a0IwiIgoAHM11/BeUutCVKXcdrIh8NmlnPj3duomJaASFTp3a1HF4fMlk6TLdIdjyV7xK4FVHhoDfKNXLJNEp987gJCDTVOu5GAQY21GmL2GcwZBLnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kQcMMBD2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kQcMMBD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWZqZ0GPjz2ydw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 02:46:48 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so5300826d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Apr 2025 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044405; x=1744649205; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
        b=kQcMMBD2MN+yvFdg4oj3zR3wHjmij8GY0bgK7Y8XlG8kD88iYqDXt8EIxQXD3IwD0f
         HLf9DgniCt/h3iU/OcuDuXEqFHRXgS6xzRe6DQNVppGnF887nuLao0tRLQ1LcnK/JG3y
         pwueLItk25uqrF3pvMTVmMX9qRPt+08G2M01iXTF8C01cFxPGNQkX8RS7FoaqyZMy5D0
         5tUNqnwHKwGGo/hEKeBjV3WFwEjzJ9FEYxgbP7FzFzJrcuK4oady7ErDzMC18wOtJluU
         80rBXDtUVb4lTXsConhSxVkps05v/dsNVRw33tkPABug6xSOtr028kQWUqlHSyO2TTAX
         SOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044405; x=1744649205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
        b=H5Qf/yPZ8wh+5sQJeE+8Robq/VufzOQ+6noZutIWiW7AQpZ+grSNz+sXNteJiYziH9
         r2+TsAsvDymfermi4Rhf1xW8603t4QoZeLitfBQt1CoJBUzRGkhn5aasvi8UVhRDqGDh
         oDd2NuAh8/KzOdyavdRxmzADZrTRWEqzKpWt4O/DB4A6RutCeAkBZn/FZzzWrskMuXI2
         r2pKyoTeYqii2/Dx57PPgwIf7txmr85ANVvFvwJC1mFlQRPS0zQ6yph6n31lJ6/dhYUz
         GjJgV04P2F0WvwM63hF4w5HmHeOuC56TnsrlDIQ/MhZO6HbKpiXUN5LClHNABASo7nBc
         S0UA==
X-Forwarded-Encrypted: i=1; AJvYcCVSAy74EBijAHRsezqEtWxwOWew1li0J1k90/Fu67ETPTYkiJ4ozkmvRx6mbiJ7KeTnlX8zusGZ2efO4Kc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQTcyJy6sXknomttM3zhE16D7vN01O4hrnuTj0GGyILXFCtB6o
	rP2lrSdBvTX3yW2hEPFol8rErycd+7OoOe/Z0ayoW0Lk35xbhUlgh7wTJ+YBbXMhrVr8IeU9UJA
	yRal3cakVxPm1eN+z0sDDDBGtaLQ=
X-Gm-Gg: ASbGncu8WTFEdPYrpirwjwpgG447+hPAE/U44GRGnqsI2yDZej7P2tdWk8HyAEPY/eC
	VamzR0bDOnlLbtpbuVLGp8v3cprIqLzjPnPU6TjScQipXMhXZDBD600f/d1qFBaZKFlFxD+iQzx
	+ix074QYkoXdw79rn23SMX0Xl8
X-Google-Smtp-Source: AGHT+IHn1NWvGQNUg+cTWq77arIBOMg99zSiThdNcGxwwVSUpNgoUD/iAcjqlZYjSbS/ACMXvRhNvnrbFKc+S9VTrwY=
X-Received: by 2002:a05:6214:1307:b0:6e2:3761:71b0 with SMTP id
 6a1803df08f44-6f0d24ed16bmr3696846d6.5.1744044405300; Mon, 07 Apr 2025
 09:46:45 -0700 (PDT)
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
In-Reply-To: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 18:46:34 +0200
X-Gm-Features: ATxdqUHTe6GO-vqbSM3EmiJ-FaS0XfNSqylpsewp4c0XXyMi1WCC05uIygoRAqs
Message-ID: <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
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

Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:27, Kory Maincent wrote:
> > On Thu,  3 Apr 2025 14:18:54 -0400
> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> >>
> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >>   the Xilinx PCS) (patches 9-10).
> >>
> >> The last few patches add device links for pcs-handle to improve boot times,
> >> and add compatibles for all Lynx PCSs.
> >>
> >> Care has been taken to ensure backwards-compatibility. The main source
> >> of this is that many PCS devices lack compatibles and get detected as
> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> the devicetree to add appropriate compatibles.
> >
> > I don't dive into your patch series and I don't know if you have heard about it
> > but Christian Marangi is currently working on fwnode for PCS:
> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >
> > Maybe you should sync with him!
>
> I saw that series and made some comments. He is CC'd on this one.
>
> I think this approach has two advantages:
>
> - It completely solves the problem of the PCS being unregistered while the netdev
>   (or whatever) is up
> - I have designed the interface to make it easy to convert existing
>   drivers that may not be able to use the "standard" probing process
>   (because they have to support other devicetree structures for
>   backwards-compatibility).
>

I notice this and it's my fault for taking too long to post v2 of the PCS patch.
There was also this idea of entering the wrapper hell but I scrapped that early
as I really feel it's a workaround to the current problem present for
PCS handling.

And the real problem IMHO is that currently PCS handling is fragile and with too
many assumptions. With Daniel we also discussed backwards-compatibility.
(mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
that slipped in before it was correctly complained that things were
taking a bad path)

We feel v2 permits correct support of old implementations.
The ""legacy"" implementation pose the assumption that PCS is never removed
(unless the MAC driver is removed)
That fits v2 where a MAC has to initially provide a list of PCS to
phylink instance.
With this implementation, a MAC can manually parse whatever PCS node structure
is in place and fill the PCS.

As really the "late" removal/addition of a PCS can only be supported with fwnode
implementation as dedicated PCS driver will make use of that.

I honestly hope we can skip having to enter the wrapper hell.
Anyway I also see you made REALLY GOOD documentation. Would be ideal to
collaborate for that. Anyway it's up to net maintainers on what path to follow.

Just my 2 cent on the PCS topic.

