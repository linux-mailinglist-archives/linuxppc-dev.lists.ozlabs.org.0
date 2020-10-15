Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5FE28F493
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 16:19:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBrxn3DsxzDq9G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 01:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalelectronics.com
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBrsj0WCYzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 01:15:36 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 205078030719;
 Thu, 15 Oct 2020 14:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCX0OAgYPjwG; Thu, 15 Oct 2020 17:15:34 +0300 (MSK)
Date: Thu, 15 Oct 2020 17:15:31 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201015141531.zxmcgq6k4akm3lmo@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
 <20201014171640.bup52mgaz4jvhtsy@mobilestation>
 <CAJKOXPcHi_=jea=0YrPNo4dh6k03+63Tc2Uo+sd0u8+XPdQjOw@mail.gmail.com>
 <20201014235105.kj4rtwiidph7gyen@mobilestation>
 <20201015061439.GA2926@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201015061439.GA2926@kozik-lap>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Wei Xu <xuwei5@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 08:14:39AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2020 at 02:51:05AM +0300, Serge Semin wrote:
>  > >
> > > > So to speak thanks for suggesting it. I'll try it to validate the proposed
> > > > changes.
> > > >
> > > > Two questions:
> > > > 1) Any advise of a good inliner/command to compile all dtbs at once? Of course I
> > > > can get all the updated dtsi'es, then find out all the dts'es which include
> > > > them, then directly use dtc to compile the found dts'es... On the other hand I
> > > > can just compile all dts'es, then compare old and new ones. The diff of the
> > > > non-modified dtb'es will be just empty...
> > > 
> > 
> > > make dtbs
> > 
> > It's not that easy.) "make dtbs" will build dtbs only for enabled boards, which
> > first need to be enabled in the kernel config. So I'll need to have a config
> > with all the affected dts. The later is the same as if I just found all the
> > affected dts and built them one-by-one by directly calling dtc.
> 
> True. Sometimes allyesconfig for given arch might be helpful but not
> always (e.g. for ARM it does not select all of ARMv4 and ARMv5 boards).
> Most likely your approach is actually faster/more reliable.
> 
> > 
> > > touch your dts or git stash pop
> > > make dtbs
> > > compare
> > > diff for all unchanged will be simply empty, so easy to spot
> > > 
> > > > 2) What crosc64 is?
> > > 
> > > Ah, just an alias for cross compiling + ccache + kbuild out. I just
> > > copied you my helpers, so you need to tweak them.
> > > 
> > > >
> > > > >
> > > > > 2. Split it per arm architectures (and proper subject prefix - not
> > > > > "arch") and subarchitectures so maintainers can pick it up.
> > > >
> > > > Why? The changes are simple and can be formatted as a single patch. I've seen
> > > > tons of patches submitted like that, accepted and then merged. What you suggest
> > > > is just much more work, which I don't see quite required.
> > > 
> > 
> > > DTS changes go separate between arm64 and arm. There is nothing
> > > unusual here - all changes are submitted like this.
> > > Second topic is to split by subarchitectures which is necessary if you
> > > want it to be picked up by maintainers. It also makes it easier to
> > > review.
> > 
> > The current patches are easy enough for review. The last three patches of the
> > series is a collection of the one-type changes concerning the same type of
> > nodes. So reviewing them won't cause any difficulty. But I assume that's not
> > the main point in this discussion.
> > 
> > > Sure, without split ber subarchitectures this could be picked
> > > up by SoC folks but you did not even CC them. So if you do not want to
> > > split it per subarchitectures for maintainers and you do not CC SoC,
> > > then how do you believe this should be picked up? Out of the regular
> > > patch submission way? That's not how the changes are handled.
> > 
> > AFAIU there are another ways of merging comprehensive patches. If they get to collect
> > all the Acked-by tags, they could be merged in, for instance, through Greg' or Rob'
> > (for dts) repos, if of course they get to agree with doing that. Am I wrong?
> > 
> > My hope was to ask Rob or Greg to get the patches merged in when they get
> > to collect all the ackes, since I thought it was an option in such cases. So if
> > they refuse to do so I'll have no choice but to split the series up into a
> > smaller patches as you say.
> 

> This is neither Rob's nor Greg's patch to pick up, but ARM SoC (which was
> not CCed here). And most likely they won't pick it up because judging by
> contents it is obvious it should go via ARM SoC.
> 
> Sure, if there are dependencies between some patches they can go with
> acks through unrelated trees, but this not the usual way. This is an
> exception in the process to solve particular dependency problem.  It has
> drawbacks - increases the chances of annoying conflicts.
> 
> The case here does not fall into this criteria - there is no dependency
> of this patch on the others  Therefore there is no reason to use the
> unusual/exceptional way of handling patches.  There is no reason why
> this shouldn't go via either specific ARM subarchitecture maintainers or
> via ARM SoC.

Ok. I see your point. To sum it up I've studied the git log arch/ commit
messages and it turns out even Rob has to split the cleanup changes like this
ones. So thanks for your patience with stating your point. I'll split the last
three patches up to be merged in via the corresponding archs/subarch'es repos.

-Sergey

> 
> > > > > 3. The subject title could be more accurate - there is no fix here
> > > > > because there was no errors in the first place. Requirement of DWC
> > > > > node names comes recently, so it is more alignment with dtschema.
> > > > > Otherwise automatic-pickup-stable-bot might want to pick up... and it
> > > > > should not go to stable.
> > > >
> > > > Actually it is a fix, because the USB DT nodes should have been named with "usb"
> > > > prefix in the first place. Legacy DWC USB3 bindings didn't define the nodes
> > > > naming, but implied to be "usb"-prefixed by the USB HCD schema. The Qualcomm
> > > > DWC3 schema should have defined the sub-nodes as "dwc3@"-prefixed, which was
> > > > wrong in the first place.
> > > 
> > 
> > > Not following the naming convention of DT spec which was loosely
> > > enforced is not an error which should be "fixed". Simply wrong title.
> > > This is an alignment with dtschema or correcting naming convention.
> > > Not fixing errors.
> > 
> > From your perspective it wasn't an error, from mine and most likely Rob' it
> > was.) Anyway as I said I don't care that much about preserving the subject
> > wording, so what about the next one:
> > <arch>: <subarch>: Harmonize DWC USB3 nodes name with DT schema
> > ?
> 
> Looks good.
> 
> Best regards,
> Krzysztof
> 
