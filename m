Return-Path: <linuxppc-dev+bounces-7498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC58A7E956
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 20:06:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWcbz0NzNz2yrg;
	Tue,  8 Apr 2025 04:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744049214;
	cv=none; b=b/cNUyVc5fb2SRbm0jNxNz5GcZIzPxAh2GCVB6K3mAJx7ljLwbIMdbRDs0UeB1aHuw6L7hbP5jFmglQkeZzOT9tonHnXg3B+kl1DY14y71tCbDdkSSnVLmOqJbmD/daLYgmHISgOmeI94gP6i0srfXxJxx/nrdgG3wKKQh53aWoEocpwxIRyNCiOR5rpy/cLf3cdNUk/UGoA4m6suP6AvLgS4EAcZxdHnKVbw42pX9vFnhVPdid0LZgtocFWg6Vc9ySFnszVKFka9ilzhVGf3KqqjbbzoKSIdNZZ089NbULAGHhsxzsSAtWiC6SjnI7fNW7aMehHKmTTDsx/StqunA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744049214; c=relaxed/relaxed;
	bh=kFU4PCOFCF2t2dPmfjFQsFfH3+loT9oNKaTNo2jAsrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7R1pOc4ZwfbM9RKP3ZLw+yPj5fJ1pgFIfDixZeNu/RpqZhspuwteXSHJBUs/UmoVXERpwvhk1Sn42T10tkCq0dM4TKl9k/4pL3ItHYeo7rxERTZf1ZldCEFnsA+xUrOZuL7ckpuy7rjKfX8J9oOa+kvWz3yZYZVg4E097uKuPzdVk/bTyOIQklYkhPC59xI5wVE2EU8xcFLOjWk2oaCTR+1rrR9jNw2SJn6lA3xXHtfyD1Q/rzbeAiYS8wTFxmM156Leis3ArVxRtysAeyxgSGGCUOFj3fcjgSyAXYIYi+24XqNJEUOkb6aNYVleDsJCyD62io8Wdq+BsuwBy3inw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kybWyAZ0; dkim-atps=neutral; spf=pass (client-ip=91.218.175.188; helo=out-188.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kybWyAZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.188; helo=out-188.mta0.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWcbw1jslz2yqy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 04:06:51 +1000 (AEST)
Message-ID: <3203955d-b0fa-4ef6-bcec-6d23a5b6441d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744049190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFU4PCOFCF2t2dPmfjFQsFfH3+loT9oNKaTNo2jAsrw=;
	b=kybWyAZ0LNPljlzODiID9MCxmPkOsj3+XZ3NOBA1SJ+GUkEwxi2q4YG6Tqzxu5OztwOoy2
	4FWNfu+DxWPsP6v4QiY6skK5eZddzEVCNMMTHOBHgUXOXHrueBs+hUmpIpZBJYNh/tQl0M
	sPWqXv7raQ0Wc9svTCLcg7RV8xLYw7E=
Date: Mon, 7 Apr 2025 14:06:21 -0400
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
 <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
 <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	WEIRD_QUOTING autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/7/25 13:21, Christian Marangi (Ansuel) wrote:
> Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
> <sean.anderson@linux.dev> ha scritto:
>>
>> On 4/7/25 12:46, Christian Marangi (Ansuel) wrote:
>> > Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
>> > <sean.anderson@linux.dev> ha scritto:
>> >>
>> >> On 4/7/25 12:27, Kory Maincent wrote:
>> >> > On Thu,  3 Apr 2025 14:18:54 -0400
>> >> > Sean Anderson <sean.anderson@linux.dev> wrote:
>> >> >
>> >> >> This series adds support for creating PCSs as devices on a bus with a
>> >> >> driver (patch 3). As initial users,
>> >> >>
>> >> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> >> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> >> >> - The Cadence MACB driver is converted to support external PCSs (namely
>> >> >>   the Xilinx PCS) (patches 9-10).
>> >> >>
>> >> >> The last few patches add device links for pcs-handle to improve boot times,
>> >> >> and add compatibles for all Lynx PCSs.
>> >> >>
>> >> >> Care has been taken to ensure backwards-compatibility. The main source
>> >> >> of this is that many PCS devices lack compatibles and get detected as
>> >> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> >> >> the devicetree to add appropriate compatibles.
>> >> >
>> >> > I don't dive into your patch series and I don't know if you have heard about it
>> >> > but Christian Marangi is currently working on fwnode for PCS:
>> >> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
>> >> >
>> >> > Maybe you should sync with him!
>> >>
>> >> I saw that series and made some comments. He is CC'd on this one.
>> >>
>> >> I think this approach has two advantages:
>> >>
>> >> - It completely solves the problem of the PCS being unregistered while the netdev
>> >>   (or whatever) is up
>> >> - I have designed the interface to make it easy to convert existing
>> >>   drivers that may not be able to use the "standard" probing process
>> >>   (because they have to support other devicetree structures for
>> >>   backwards-compatibility).
>> >>
>> >
>> > I notice this and it's my fault for taking too long to post v2 of the PCS patch.
>> > There was also this idea of entering the wrapper hell but I scrapped that early
>> > as I really feel it's a workaround to the current problem present for
>> > PCS handling.
>>
>> It's no workaround. The fundamental problem is that drivers can become
>> unbound at any time, and we cannot make consumers drop their references.
>> Every subsystem must deal with this reality, or suffer from
>> user-after-free bugs. See [1-3] for discussion of this problem in
>> relation to PCSs and PHYs, and [4] for more discussion of my approach.
>>
>> [1] https://lore.kernel.org/netdev/YV7Kp2k8VvN7J0fY@shell.armlinux.org.uk/
>> [2] https://lore.kernel.org/netdev/20220816163701.1578850-1-sean.anderson@seco.com/
>> [3] https://lore.kernel.org/netdev/9747f8ef-66b3-0870-cbc0-c1783896b30d@seco.com/
>> [3] https://lpc.events/event/17/contributions/1627/
>>
>> > And the real problem IMHO is that currently PCS handling is fragile and with too
>> > many assumptions. With Daniel we also discussed backwards-compatibility.
>> > (mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
>> > that slipped in before it was correctly complained that things were
>> > taking a bad path)
>> >
>> > We feel v2 permits correct support of old implementations.
>> > The ""legacy"" implementation pose the assumption that PCS is never removed
>> > (unless the MAC driver is removed)
>> > That fits v2 where a MAC has to initially provide a list of PCS to
>> > phylink instance.
>>
>> And what happens when the driver is unbound from the device and suddenly
>> a PCS on that list is free'd memory but is in active use by a netdev?
>>
> 
> driver bug for not correctly implementing the removal task.
> 
> The approach is remove as provider and call phylink removal phase
> under rtnl lock.
> We tested this with unbind, that is actually the main problem we are
> trying to address
> and works correctly.

OK, so this is a different approach since your last submission. Please
CC me on your series.

- Fundamentally this is going to make backwards compatibility very
  difficult, since your approach cannot work with mac_select_pcs. How
  are you going to handle the case of MAC-internal PCSs? Are you going
  to make them create a swnode and bind to it just to create a PCS for
  e.g. MMIO registers? And how is the MAC supposed to know how to select
  the PCS? From what I can tell you don't even notify the MAC about
  which PCS it's using.

  I considered an approach like this, where the phylink would be in the
  driver's seat (so to speak), but I decided not to persue it due to
  the problems listed above. A lot of PCSs are tightly-integrated with
  their MACs, so it does not make sense to introduce this little
  coupling. I think it is better to let the MAC select the PCS e.g.
  based on the phy interface. This tends to be a few lines of code for
  the MAC and saves so much complexity in phylink.

  I think you should try doing the macb and lynx conversions for your
  approach. It will make the above problems obvious.

- Your approach is very intrusive. There are lots of changes all over
  phylink across several patches and it is hard to verify all the
  assumptions. Whereas a wrapper keeps everything contained to one file,
  and most of the functions can be evaluated independently.

--Sean

