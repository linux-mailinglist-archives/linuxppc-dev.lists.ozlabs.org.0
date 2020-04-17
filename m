Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA71AD419
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 03:28:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493JPn4VJSzDsq3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:28:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=Id68iYAV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mV8cjKDW; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493JN172fkzDsPf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 11:26:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D2C71633;
 Thu, 16 Apr 2020 21:26:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 21:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 YyORb9IBz9K3VedEbvxpxVFCoWtwyIDeBemcaew2SnU=; b=Id68iYAVxAhC3coY
 VdtHQgoFriBjyW4wVW56qMkMgkYSM1mw3SDr4r5DmF8s8lOhUdFf0Gkr/cK3ONX4
 kqcienVRMGlRGm3NH6HblGnRXtXMSJ7JyNOD0bnjbReRR1wR9jgeWrUilw9Y6i6b
 tA4ButdTiQoVi6md8q1B9LvIvjOCIT6EOHIorlc5bKdyRJTEmFtF8Em38BzDJm8X
 ETTivZvmHNo2lwYPt8mmi1ymZgxYoVs48CzKo0xZ35EDtRl+4JXKR3HfHkQFBFX/
 hhIJnwAFuJ3+Al6srLFg3tDebVKW4gBh8rJjE9dw/1hOMbswDJq9ZREmWx2US8lz
 BHbZqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=YyORb9IBz9K3VedEbvxpxVFCoWtwyIDeBemcaew2S
 nU=; b=mV8cjKDW6RhLjEOPebTmT39Dl9Mg3O4EhabORpccjfCDrdrM49p5cuxAC
 zZ1xjAQpYqUZoBixz+uGVOyQfxA+/2FObY0MT1qNFX/g3d9+sKATmHNmYIBLh8fK
 qYetxwL3NEp9Jxqz0X/vnZYOEE+Zh2Hqjm4mM6R8yXN0XxQYxGcmdVaPPSCi+qE8
 d7HLtgQLf1EAitBwDUsMHIkAWvT/Wrno2hOMuwcpr8ORKroumbTCKW76xftqEJZs
 M7nZp6+3UGhJrtwhSV7OfF8uO/762IV7ptCaOfazA4Uok3Jbm9+wALRVfgSTGMa3
 g+pci2c0UNfbSuFDTXTh5qrMmzcOA==
X-ME-Sender: <xms:yQWZXj0gSzRxSOrhZTntNlZjNbdjHf-Y7L6ADvwoKGj5rkxqGMXG6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeigdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddurdeghedrvdduvddrvdefleenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvg
 hllhdrtggt
X-ME-Proxy: <xmx:yQWZXnmnzqv6SYcVncDUsZk_eivJIGcqHZNP_Cdteu9DxKtBssuOZw>
 <xmx:yQWZXsObGoUoJvBQ5zO6ErWhcPLFKSLldA9S9jhPuoqF1swANxgy5Q>
 <xmx:yQWZXm5DwOGA6U1B8hQfI_LEXHdCsh0S6w8EQHvIQKEV-9OQZzJRRg>
 <xmx:zQWZXs4lJlw96-_bXcryEAL7CzWaE-HfFSwLB6ZfMDrefDRCTUU7jw>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65539328005E;
 Thu, 16 Apr 2020 21:26:30 -0400 (EDT)
Message-ID: <b0b361092d2d7e38f753edee6dcd9222b4e388ce.camel@russell.cc>
Subject: Re: [PATCH kernel v2 0/7] powerpc/powenv/ioda: Allow huge DMA
 window at 4GB
From: Russell Currey <ruscur@russell.cc>
To: Oliver O'Halloran <oohall@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Fri, 17 Apr 2020 11:26:27 +1000
In-Reply-To: <CAOSf1CHgUsJ7jGokg6QD6cEDr4-o5hnyyyjRZ=YijsRY3T1sYA@mail.gmail.com>
References: <20200323075354.93825-1-aik@ozlabs.ru>
 <b512ac5e-dca5-4c08-8ea1-a636b887c0d0@ozlabs.ru>
 <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
 <CAOSf1CGfjX9LGQ1GDSmxrzjnaWOM3mUvBu9_xe-L2umin9n66w@mail.gmail.com>
 <CAOSf1CHgUsJ7jGokg6QD6cEDr4-o5hnyyyjRZ=YijsRY3T1sYA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: KVM list <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-16 at 12:53 +1000, Oliver O'Halloran wrote:
> On Thu, Apr 16, 2020 at 12:34 PM Oliver O'Halloran <oohall@gmail.com>
> wrote:
> > On Thu, Apr 16, 2020 at 11:27 AM Alexey Kardashevskiy <
> > aik@ozlabs.ru> wrote:
> > > Anyone? Is it totally useless or wrong approach? Thanks,
> > 
> > I wouldn't say it's either, but I still hate it.
> > 
> > The 4GB mode being per-PHB makes it difficult to use unless we
> > force
> > that mode on 100% of the time which I'd prefer not to do. Ideally
> > devices that actually support 64bit addressing (which is most of
> > them)
> > should be able to use no-translate mode when possible since a) It's
> > faster, and b) It frees up room in the TCE cache devices that
> > actually
> > need them. I know you've done some testing with 100G NICs and found
> > the overhead was fine, but IMO that's a bad test since it's pretty
> > much the best-case scenario since all the devices on the PHB are in
> > the same PE. The PHB's TCE cache only hits when the TCE matches the
> > DMA bus address and the PE number for the device so in a multi-PE
> > environment there's a lot of potential for TCE cache trashing. If
> > there was one or two PEs under that PHB it's probably not going to
> > matter, but if you have an NVMe rack with 20 drives it starts to
> > look
> > a bit ugly.
> > 
> > That all said, it might be worth doing this anyway since we
> > probably
> > want the software infrastructure in place to take advantage of it.
> > Maybe expand the command line parameters to allow it to be enabled
> > on
> > a per-PHB basis rather than globally.
> 
> Since we're on the topic
> 
> I've been thinking the real issue we have is that we're trying to
> pick
> an "optimal" IOMMU config at a point where we don't have enough
> information to work out what's actually optimal. The IOMMU config is
> done on a per-PE basis, but since PEs may contain devices with
> different DMA masks (looking at you wierd AMD audio function) we're
> always going to have to pick something conservative as the default
> config for TVE#0 (64k, no bypass mapping) since the driver will tell
> us what the device actually supports long after the IOMMU
> configuation
> is done. What we really want is to be able to have separate IOMMU
> contexts for each device, or at the very least a separate context for
> the crippled devices.
> 
> We could allow a per-device IOMMU context by extending the Master /
> Slave PE thing to cover DMA in addition to MMIO. Right now we only
> use
> slave PEs when a device's MMIO BARs extend over multiple m64
> segments.
> When that happens an MMIO error causes the PHB to freezes the PE
> corresponding to one of those segments, but not any of the others. To
> present a single "PE" to the EEH core we check the freeze status of
> each of the slave PEs when the EEH core does a PE status check and if
> any of them are frozen, we freeze the rest of them too. When a driver
> sets a limited DMA mask we could move that device to a seperate slave
> PE so that it has it's own IOMMU context taylored to its DMA
> addressing limits.
> 
> Thoughts?

For what it's worth this sounds like a good idea to me, it just sounds
tricky to implement.  You're adding another layer of complexity on top
of EEH (well, making things look simple to the EEH core and doing your
own freezing on top of it) in addition to the DMA handling.

If it works then great, just has a high potential to become a new bug
haven.

> 
> Oliver

