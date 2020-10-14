Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51728E94B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 01:53:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBTkb4HVHzDqVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 10:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (unknown [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBThd3SQNzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:51:21 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id D142E803073C;
 Wed, 14 Oct 2020 23:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iS3dvPxgJMCS; Thu, 15 Oct 2020 02:51:15 +0300 (MSK)
Date: Thu, 15 Oct 2020 02:51:05 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201014235105.kj4rtwiidph7gyen@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
 <20201014171640.bup52mgaz4jvhtsy@mobilestation>
 <CAJKOXPcHi_=jea=0YrPNo4dh6k03+63Tc2Uo+sd0u8+XPdQjOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAJKOXPcHi_=jea=0YrPNo4dh6k03+63Tc2Uo+sd0u8+XPdQjOw@mail.gmail.com>
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

On Wed, Oct 14, 2020 at 10:04:32PM +0200, Krzysztof Kozlowski wrote:
> On Wed, 14 Oct 2020 at 19:16, Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Wed, Oct 14, 2020 at 12:33:25PM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, 14 Oct 2020 at 12:23, Serge Semin
> > > <Sergey.Semin@baikalelectronics.ru> wrote:
> > > >
> > > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> > > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > > >
> > > > Note we don't change the DWC USB3-compatible nodes names of
> > > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > > in-source comment says that the nodes name need to be preserved as
> > > > "^dwusb@.*" for some backward compatibility.
> > > >
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > >
> > > > ---
> > > >
> > > > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > > > files. I did only a manual grepping of the possible nodes dependencies.
> > >
> >
> > > 1. It is you who should compare the decompiled DTS, not us. For example:
> > > $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
> > > scripts/dtc/dtx_diff ${i} dts-new/${i#dts-old/} ; done
> > >
> > > $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
> > > fdtdump ${i} > ${i}.fdt ; crosc64 fdtdump dts-new/${i#dts-old/} >
> > > dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt
> > > dts-new/${i#dts-old/}.fdt ; done
> >
> > So basically you suggest first to compile the old and new dts files, then to
> > de-compile them, then diff old and new fdt's, and visually compare the results.
> > Personally it isn't that much better than what I did, since each old and new
> > dtbs will for sure differ due to the node names change suggested in this patch.
> > So it will lead to the visual debugging too, which isn't that effective. But
> > your approach is still more demonstrative to make sure that I didn't loose any
> > nodes redefinition, since in the occasion the old and new de-compiled nodes will
> > differ not only by the node names but with an additional old named node.
> 

> My suggestion is to compare the entire, effective DTS after all
> inclusions. Maybe you did it already, I don't know.

Only by grepping the dts'es, which include the dtsi'es modified in this patch.
So your suggestion of compiling and de-compiling has been indeed relevant.

> The point is that
> when you change node names in DTSI but you miss one in DTS, you end up
> with two nodes.

Yep, that's exactly what I meant when I said that your approach was more
demonstrative, etc.

> This is much easier to spot with dtxdiff or with
> fdtdump (which behaves better for node moves).
> 

> Indeed it is still a visual comparison - if you have any ideas how to
> automate it (e.g. ignore phandle changes), please share. It would
> solve my testings as well.

Alas I don't. That's why to save my time of coming up with an automated solution
I did a very thorough modification making sure that each affected node isn't
updated in the corresponding dts'es and asked to test the patches out.

Anyway the approach suggested by you will indeed give us a better understanding
of my patches correctness. So I'll use it before sending v3. Thanks.

> But asking others to test because you do
> not want to check it is not the best way to handle such changes.
> 
> >
> > So to speak thanks for suggesting it. I'll try it to validate the proposed
> > changes.
> >
> > Two questions:
> > 1) Any advise of a good inliner/command to compile all dtbs at once? Of course I
> > can get all the updated dtsi'es, then find out all the dts'es which include
> > them, then directly use dtc to compile the found dts'es... On the other hand I
> > can just compile all dts'es, then compare old and new ones. The diff of the
> > non-modified dtb'es will be just empty...
> 

> make dtbs

It's not that easy.) "make dtbs" will build dtbs only for enabled boards, which
first need to be enabled in the kernel config. So I'll need to have a config
with all the affected dts. The later is the same as if I just found all the
affected dts and built them one-by-one by directly calling dtc.

> touch your dts or git stash pop
> make dtbs
> compare
> diff for all unchanged will be simply empty, so easy to spot
> 
> > 2) What crosc64 is?
> 
> Ah, just an alias for cross compiling + ccache + kbuild out. I just
> copied you my helpers, so you need to tweak them.
> 
> >
> > >
> > > 2. Split it per arm architectures (and proper subject prefix - not
> > > "arch") and subarchitectures so maintainers can pick it up.
> >
> > Why? The changes are simple and can be formatted as a single patch. I've seen
> > tons of patches submitted like that, accepted and then merged. What you suggest
> > is just much more work, which I don't see quite required.
> 

> DTS changes go separate between arm64 and arm. There is nothing
> unusual here - all changes are submitted like this.
> Second topic is to split by subarchitectures which is necessary if you
> want it to be picked up by maintainers. It also makes it easier to
> review.

The current patches are easy enough for review. The last three patches of the
series is a collection of the one-type changes concerning the same type of
nodes. So reviewing them won't cause any difficulty. But I assume that's not
the main point in this discussion.

> Sure, without split ber subarchitectures this could be picked
> up by SoC folks but you did not even CC them. So if you do not want to
> split it per subarchitectures for maintainers and you do not CC SoC,
> then how do you believe this should be picked up? Out of the regular
> patch submission way? That's not how the changes are handled.

AFAIU there are another ways of merging comprehensive patches. If they get to collect
all the Acked-by tags, they could be merged in, for instance, through Greg' or Rob'
(for dts) repos, if of course they get to agree with doing that. Am I wrong?

My hope was to ask Rob or Greg to get the patches merged in when they get
to collect all the ackes, since I thought it was an option in such cases. So if
they refuse to do so I'll have no choice but to split the series up into a
smaller patches as you say.

> 
> >
> > >
> > > 3. The subject title could be more accurate - there is no fix here
> > > because there was no errors in the first place. Requirement of DWC
> > > node names comes recently, so it is more alignment with dtschema.
> > > Otherwise automatic-pickup-stable-bot might want to pick up... and it
> > > should not go to stable.
> >
> > Actually it is a fix, because the USB DT nodes should have been named with "usb"
> > prefix in the first place. Legacy DWC USB3 bindings didn't define the nodes
> > naming, but implied to be "usb"-prefixed by the USB HCD schema. The Qualcomm
> > DWC3 schema should have defined the sub-nodes as "dwc3@"-prefixed, which was
> > wrong in the first place.
> 

> Not following the naming convention of DT spec which was loosely
> enforced is not an error which should be "fixed". Simply wrong title.
> This is an alignment with dtschema or correcting naming convention.
> Not fixing errors.

From your perspective it wasn't an error, from mine and most likely Rob' it
was.) Anyway as I said I don't care that much about preserving the subject
wording, so what about the next one:
<arch>: <subarch>: Harmonize DWC USB3 nodes name with DT schema
?

-Sergey

> 
> >
> > Regarding automatic-pickup-stable-bot if it exists I don't think it scans all the
> > emails, but most likely the stable@vger.kernel.org list only or the emails
> > having the "Fixes:" tag. If I am wrong please give me a link to the bot sources
> > or refer to a doc where I can read about the way it works, to take it into
> > account in future commits. Just to note I submitted patches which did some fixes,
> > had the word "fix" in the subject but weren't selected to be backported to the
> > stable kernel.
> 
> You mixed up bots. The regular stable bot picks commits with cc-stable
> or with "Fixes". The auto-pickup bot picks all commits (not emails...
> why would it look at emails?) looking like a fix. Wording could be one
> of the hints used in the heuristic. Anyway, this is not a fix,
> regardless of autosel, so the wording is not correct.
> 
> Just Google for AUTOSEL. You can then ask Sasha for sources...
> 
> > Anyway I don't really care that much about the subject text using the word "fix"
> > or some else. So if you suggest some better alternative, I'd be glad to consider
> > it.
> 
> I already did. One example is: alignment with dtschema.
> 
> Best regards,
> Krzysztof
