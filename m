Return-Path: <linuxppc-dev+bounces-7494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F215FA7E79B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 19:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWb8F2ZF2z2yvk;
	Tue,  8 Apr 2025 03:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744045277;
	cv=none; b=M57HNrwv+XhQoIxqJBpgO2acqx9eFfgj9u07FVw1shlkJEaDZ+IxIqWyMV0anF3fwwgod7p1v+aOh9bCcgPaN6uFd7XXD44lYe5aDeUz9Kg8tMTvlAsEARv0loaehLm8D3tkCcqTgol3dq95B3a8K0q/jMn69T/aoZT2Uo+gPpa8HpnO1RxjSTcwWWdcsqItyI9uYI8OvDG5j3kJmuNC306mguS0VdoXzXjhhY3X/qh15BufGToTJn5s9ZetEPVNv4yCRL0R+0iGWh4iGlZtjJ3ZgNqr1r60PFhGwsaRpr/YLl3fO79XMDiwWf4jV9WpCKGLRkbIvq2N2Eqqrrwn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744045277; c=relaxed/relaxed;
	bh=oLDAmjclRasSVpfEYONAaYZO702FQiJJq0bMQnxY2As=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pbfxym1dcQ2dW9KAKO42VqzkSPMTtrd22qYJNK0fbsGoJ2thbKipHVGH7BaFasRb2d3jMmKzg7GGF7V/d+jjW7voqqoNSj2x8i5E+fx9qw2o9771Al5oxYW6ZGWQ792RBmQbLgc3xgAUAOe0oEkyknJCjEqWBGKe8qwijD+GA0c5yrDP7YYd3DJ3Jn9A1v60Q/PmnyFClSK8EEU1RkoyCBqZuwpwg5bPH0KgVfC5fLu8+oPoY3y2ikW7+JmMQdx2ua4Js/JwtbyjbDFB+OpOgYHEK8zFrJlBX+7iDw5UBpIo3VKzOmslGzmV5SxXQwpUzlBcPR2967j134z7n132gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X97KDpLR; dkim-atps=neutral; spf=pass (client-ip=91.218.175.183; helo=out-183.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X97KDpLR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.183; helo=out-183.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWb853CwWz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 03:01:07 +1000 (AEST)
Message-ID: <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744045243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLDAmjclRasSVpfEYONAaYZO702FQiJJq0bMQnxY2As=;
	b=X97KDpLRfMghEYf9sxoBxmw793lbUNyIZX2MhCZr0epog6FScf9fPv/rbXMCRI4WlxGsF1
	ACaKep6rqwnu785TYkn30Pqnpl9BJRWA+kOGZfrTVeDuXFPVxZz98GZ//C62FkDo4bfBee
	qs640GM1x6TnhIGk7qK8bfPHB7/TZxI=
Date: Mon, 7 Apr 2025 13:00:34 -0400
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
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>,
 UNGLinuxDriver@microchip.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linuxppc-dev@lists.ozlabs.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	WEIRD_QUOTING autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/7/25 12:46, Christian Marangi (Ansuel) wrote:
> Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
> <sean.anderson@linux.dev> ha scritto:
>>
>> On 4/7/25 12:27, Kory Maincent wrote:
>> > On Thu,  3 Apr 2025 14:18:54 -0400
>> > Sean Anderson <sean.anderson@linux.dev> wrote:
>> >
>> >> This series adds support for creating PCSs as devices on a bus with a
>> >> driver (patch 3). As initial users,
>> >>
>> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> >> - The Cadence MACB driver is converted to support external PCSs (namely
>> >>   the Xilinx PCS) (patches 9-10).
>> >>
>> >> The last few patches add device links for pcs-handle to improve boot times,
>> >> and add compatibles for all Lynx PCSs.
>> >>
>> >> Care has been taken to ensure backwards-compatibility. The main source
>> >> of this is that many PCS devices lack compatibles and get detected as
>> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> >> the devicetree to add appropriate compatibles.
>> >
>> > I don't dive into your patch series and I don't know if you have heard about it
>> > but Christian Marangi is currently working on fwnode for PCS:
>> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
>> >
>> > Maybe you should sync with him!
>>
>> I saw that series and made some comments. He is CC'd on this one.
>>
>> I think this approach has two advantages:
>>
>> - It completely solves the problem of the PCS being unregistered while the netdev
>>   (or whatever) is up
>> - I have designed the interface to make it easy to convert existing
>>   drivers that may not be able to use the "standard" probing process
>>   (because they have to support other devicetree structures for
>>   backwards-compatibility).
>>
> 
> I notice this and it's my fault for taking too long to post v2 of the PCS patch.
> There was also this idea of entering the wrapper hell but I scrapped that early
> as I really feel it's a workaround to the current problem present for
> PCS handling.

It's no workaround. The fundamental problem is that drivers can become
unbound at any time, and we cannot make consumers drop their references.
Every subsystem must deal with this reality, or suffer from
user-after-free bugs. See [1-3] for discussion of this problem in
relation to PCSs and PHYs, and [4] for more discussion of my approach.

[1] https://lore.kernel.org/netdev/YV7Kp2k8VvN7J0fY@shell.armlinux.org.uk/
[2] https://lore.kernel.org/netdev/20220816163701.1578850-1-sean.anderson@seco.com/
[3] https://lore.kernel.org/netdev/9747f8ef-66b3-0870-cbc0-c1783896b30d@seco.com/
[3] https://lpc.events/event/17/contributions/1627/

> And the real problem IMHO is that currently PCS handling is fragile and with too
> many assumptions. With Daniel we also discussed backwards-compatibility.
> (mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
> that slipped in before it was correctly complained that things were
> taking a bad path)
> 
> We feel v2 permits correct support of old implementations.
> The ""legacy"" implementation pose the assumption that PCS is never removed
> (unless the MAC driver is removed)
> That fits v2 where a MAC has to initially provide a list of PCS to
> phylink instance.

And what happens when the driver is unbound from the device and suddenly
a PCS on that list is free'd memory but is in active use by a netdev?

> With this implementation, a MAC can manually parse whatever PCS node structure
> is in place and fill the PCS.
> 
> As really the "late" removal/addition of a PCS can only be supported with fwnode
> implementation as dedicated PCS driver will make use of that.

I agree that a "cells" approach would require this, but

- There are no in-tree examples of where this is necessary
- I think this would be easy to add when necessary

> I honestly hope we can skip having to enter the wrapper hell.

Unfortunately, this is required by the kernel driver model :l

> Anyway I also see you made REALLY GOOD documentation.

Thanks. One of my peeves is subsystems that have zero docs...

> Would be ideal to
> collaborate for that. Anyway it's up to net maintainers on what path to follow.
> 
> Just my 2 cent on the PCS topic.

--Sean

