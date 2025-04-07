Return-Path: <linuxppc-dev+bounces-7492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1315A7E6A1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 18:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWZXs5pbWz2yrv;
	Tue,  8 Apr 2025 02:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744043645;
	cv=none; b=BIx9AgE8YOuGsgg6rtWfOXaBA+DRlIruUcTL1e/viL9gK8mSevKq0F+aJDjQNYHGNfM8Ilw1MZsrGPmaHPRCCWeIdNGccBLsiTdeLkJyk2elgkRilCYr5fFWWAuEnsXJPA9BoaJ9X+GkQ9+4p3zymIYIH8qUaT/hTOfCIMZedPJCqmhy8Daa1GJ4jiOiUQzglRCW+6/Ye/pEH5VqY8DZJwOtNuV2qdKTLE0OqU3sQ/xgCpWyca6ItoY+yuSBKYjTb35VE1CyveqGY3w+LuF2pn31B4/B5blPGAdEirWxCHtjdLvdLirLWKBraIjSQSpvV/JsEYH5paQ6VdPne2qWew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744043645; c=relaxed/relaxed;
	bh=KFg4OMSXqyZAd4XoQGwUdaygVVdJ30SNWIcU9tJnxO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/qhmi/V3T9dGBSvEex2j7iguQKck9MR4t5NTVGhfuo3yItRc37189nKzoHaHUksaLfCs+nvQ4sot4ptf0Hj5jvBOusdtEqsQBNuDRu4pydAc6moeYDeGa7YDjcucfR6t1t8vFK7wFMf4VJelPvUKqBh5D8jQOB4g4IiU4qky0albDGE5j8yCM8vCVSI7+aqGQotu836cyKnyQAPBJBnljzdKvyWlI7Z2OdjZmNXwGjlXvPFeElhoHSZxA638reD5bAoeiFM3Qu6GvhCXosY/9/LXeowdCMdifNH9stmkfl1gKxXMb2NaSz06RJ1auzA+yTDVush+DO/ORwxj6/qVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJWGbxFq; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJWGbxFq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWZXn0cpHz2yrQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 02:33:59 +1000 (AEST)
Message-ID: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744043618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFg4OMSXqyZAd4XoQGwUdaygVVdJ30SNWIcU9tJnxO4=;
	b=UJWGbxFqDDyMWF8b4G2fYOD53tA+BWAfWoGwac3pflGNx/7Q8PgHH198LIFtBZ+wsx8gh/
	XnnznK1WuR4pSzwX7dn9Bt8JcNWp1s5DrdqgsT/GTNhH4Vgnu+/qhtSKjA+JF6SZ4FceM1
	MRxTN0uezDbNPzPZHXbHspuUXvMOgC8=
Date: Mon, 7 Apr 2025 12:33:28 -0400
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
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250407182738.498d96b0@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/7/25 12:27, Kory Maincent wrote:
> On Thu,  3 Apr 2025 14:18:54 -0400
> Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> This series adds support for creating PCSs as devices on a bus with a
>> driver (patch 3). As initial users,
>> 
>> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> - The Cadence MACB driver is converted to support external PCSs (namely
>>   the Xilinx PCS) (patches 9-10).
>> 
>> The last few patches add device links for pcs-handle to improve boot times,
>> and add compatibles for all Lynx PCSs.
>> 
>> Care has been taken to ensure backwards-compatibility. The main source
>> of this is that many PCS devices lack compatibles and get detected as
>> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> the devicetree to add appropriate compatibles.
> 
> I don't dive into your patch series and I don't know if you have heard about it
> but Christian Marangi is currently working on fwnode for PCS:
> https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> 
> Maybe you should sync with him!

I saw that series and made some comments. He is CC'd on this one.

I think this approach has two advantages:

- It completely solves the problem of the PCS being unregistered while the netdev
  (or whatever) is up
- I have designed the interface to make it easy to convert existing
  drivers that may not be able to use the "standard" probing process
  (because they have to support other devicetree structures for
  backwards-compatibility).

--Sean

