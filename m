Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94227A21F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:44:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BztMG74SJzDqFK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 03:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X1HV/72a; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BztKB66jlzDqFK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 03:42:51 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id 185so8916021oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOqq1NtE8UWItkZvhYlsWbh6+10MRuMZY6KxRvBw6Yc=;
 b=X1HV/72aN7Wu9W+/SbcdtBZ2q0cDW2wYVHlGtvfhZsL+BQsxbY6sJ18PJd8Xulht9K
 UtQT2ux731t1uYXY55drQLjScjh47DMJ8Fdeibl81TfxUWo5sYCKIDepksrSPdFqHRF6
 eVkw1cjofe8YMSGEBOGWY6BvAIZ7kjvDdSxFcQh9ADWFoAlfq5ta2WRKTMxemPSs6Qnd
 GuTzpkz03JNvbMjWH7DkaUYVQm6UkSxijkN9mxP4gfWbEVHa8D1udpzLQ/cpiAy47XAf
 Jz+RJX4B0ElLkpwFK++g6mYt8+4yYIXzMyKaLUts++EpHFvSyp69osO8u6POTTN4o7rY
 7UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOqq1NtE8UWItkZvhYlsWbh6+10MRuMZY6KxRvBw6Yc=;
 b=PzNM8QCPmAIlhksBpOQ0LMyfXya1sgrt2qW0TrTQ5o8JSKDH3u/RoBTb4a8rhoRY4x
 YkczYFX0x/1R0k6vZS62+tAr3xbWXKhsRqoezuA9WmaqKv7A8B9l0HZPdRmKrPTAutLQ
 a0QrS4M8BIw9ifX6dGLf6Tw1R6lY06OYWseb42fPmon3gJe3JdX6xzuhNnQ0sE5TGRaL
 HsIHTRpod9is+m+/rGC6rrG3F3eWScvmo422h7AuxmCuZdeTtr80XGV3iwox3Ti2P5g4
 Q5kkuvW/po52HONRyn8sxPUdAm4JapSG1bLSa8kFlMHdJwGf359optyOZciP2qV/CS9O
 c/ow==
X-Gm-Message-State: AOAM533c9yDOEi3osiDZlEUw6hny39P9+9uRciICSs1BE1lzbUIeH0cC
 Dunb+NOEKBhx1O4oeflRhcnQCnQ6CrjJdd+Zitw=
X-Google-Smtp-Source: ABdhPJzIh3NkBBH3vdmXwIPZb7XdPadfdDW9V+vdUNAQUw1PyEAIkdoOtt7X02HG9p30H+n4rlAC3vKeGQrKnPhtfL4=
X-Received: by 2002:aca:35c6:: with SMTP id c189mr3781553oia.171.1601228564871; 
 Sun, 27 Sep 2020 10:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599343429.git.chunkeey@gmail.com>
 <47109d80c7bd481c7747c949e8a3ecd498d9c039.1599343429.git.chunkeey@gmail.com>
 <20200915010543.GB612463@bogus>
 <7bf866fd-6499-68e4-9825-5c3e2042ef65@gmail.com>
 <CAL_Jsq+x0jFh-2jVt9pVek6a2=UCv0z0sBJpuh5irxeQG+tbUg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+x0jFh-2jVt9pVek6a2=UCv0z0sBJpuh5irxeQG+tbUg@mail.gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Date: Sun, 27 Sep 2020 19:42:33 +0200
Message-ID: <CAAd0S9DZ0MHSL02sifw0pZTADwuLfq8rtUYgqfrjqOrZaiRe5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] powerpc: apm82181: create shared dtsi for APM
 bluestone
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Chris Blake <chrisrblake93@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 9:14 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Sep 19, 2020 at 2:23 PM Christian Lamparter <chunkeey@gmail.com> wrote:
> >
> > On 2020-09-15 03:05, Rob Herring wrote:
> > > On Sun, Sep 06, 2020 at 12:06:12AM +0200, Christian Lamparter wrote:
> > >> This patch adds an DTSI-File that can be used by various device-tree
> > >> files for APM82181-based devices.
> > >>
> > >> Some of the nodes (like UART, PCIE, SATA) are used by the uboot and
> > >> need to stick with the naming-conventions of the old times'.
> > >> I've added comments whenever this was the case.
> > >>
> > >> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> > >> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > >> ---
> > >> rfc v1 -> v2:
> > >>      - removed PKA (this CryptoPU will need driver)
> > >>      - stick with compatibles, nodes, ... from either
> > >>        Bluestone (APM82181) or Canyonlands (PPC460EX).
> > >>      - add labels for NAND and NOR to help with access.
> > >> v2 -> v3:
> > >>      - nodename of pciex@d.... was changed to pcie@d..
> > >>        due to upstream patch.
> > >>      - use simple-bus on the ebc, opb and plb nodes
> > >> ---
> > >>   arch/powerpc/boot/dts/apm82181.dtsi | 466 ++++++++++++++++++++++++++++
> > >>   1 file changed, 466 insertions(+)
> > >>   create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi
> > >>
> > >> diff --git a/arch/powerpc/boot/dts/apm82181.dtsi b/arch/powerpc/boot/dts/apm82181.dtsi
> > >> new file mode 100644
> > >> index 000000000000..60283430978d
> > >> --- /dev/null
> > >> +++ b/arch/powerpc/boot/dts/apm82181.dtsi
> > >> @@ -0,0 +1,466 @@
> > >> +// SPDX-License-Identifier: GPL-2.0-or-later
> > >> +/*
> > >> + * Device Tree template include for various APM82181 boards.
> > >> + *
> > >> + * The SoC is an evolution of the PPC460EX predecessor.
> > >> + * This is why dt-nodes from the canyonlands EBC, OPB, USB,
> > >> + * DMA, SATA, EMAC, ... ended up in here.
> > >> + *
> > >> + * Copyright (c) 2010, Applied Micro Circuits Corporation
> > >> + * Author: Tirumala R Marri <tmarri@apm.com>,
> > >> + *     Christian Lamparter <chunkeey@gmail.com>,
> > >> + *     Chris Blake <chrisrblake93@gmail.com>
> > >> + */
> > >> +
> > >> +#include <dt-bindings/dma/dw-dmac.h>
> > >> +#include <dt-bindings/input/input.h>
> > >> +#include <dt-bindings/interrupt-controller/irq.h>
> > >> +#include <dt-bindings/gpio/gpio.h>
> > >> +
> > >> +/ {
> > >> +    #address-cells = <2>;
> > >> +    #size-cells = <1>;
> > >> +    dcr-parent = <&{/cpus/cpu@0}>;
> > >> +
> > >> +    aliases {
> > >> +            ethernet0 = &EMAC0; /* needed for BSP u-boot */
> > >> +    };
> > >> +
> > >> +    cpus {
> > >> +            #address-cells = <1>;
> > >> +            #size-cells = <0>;
> > >> +
> > >> +            CPU0: cpu@0 {
> > >> +                    device_type = "cpu";
> > >> +                    model = "PowerPC,apm82181";
> > >
> > > This doesn't match the existing bluestone dts file.
> > >
> > > Please separate any restructuring from changes.
> >
> >
> > "I see" (I'm including your comment of the dt-binding as well).
> >
> > I'm getting the vibe that I better should not touch that bluestone.dts.
>
> I don't know about that.

k, understood.

>
> > An honestly, looking at the series and patches that the APM-engineers
> > posted back in the day, I can see why this well is so poisoned... and
> > stuff like SATA/AHBDMA/USB/GPIO/CPM/... was missing.
> >
> > As for the devices. In the spirit of Arnd Bergmann's post of
> > <https://lkml.org/lkml/2020/3/30/195>
> >
> > |It would be nice to move over the the bluestone .dts to the apm82181.dtsi file
> > |when that gets added, if only to ensure they use the same description for each
> > |node, but that shouldn't stop the addition of the new file if that is needed for
> > |distros to make use of a popular device.
> > |I see a couple of additional files in openwrt.
> >
> > I mean I don't have the bluestone dev board, just the consumer devices.
>
> This stuff is old enough, I'd guess no one cares about a dev board.
> But we should figure that out and document that with any changes.
>
> > Would it be possible to support those? I can start from a "skeleton" apm82181.dtsi
> > This would just include CPU, Memory (SD-RAM+L2C+OCM), UIC (Interrupt-Controller),
> > the PLB+OBP+EBC Busses and UART. Just enough to make a board "boot from ram".
>
> This skeleton would be chunks moved over or duplicated? I don't think
> we want 2 of the same thing.
My Idea was copying the working apm82181.dtsi we have in OpenWrt
and stripping the nodes we added for SATA, USB, GPIO and the likes.
so the remaining nodes would be very close to what bluestone.dts had.
The main differences would be:
- It's a bit smaller since I made a separate patch for the NOR/NAND on the EBC.
Reason being that the SoC uses glue-logic for mapping NOR/NAND (and other
external peripherals like the GPIOs on the WD) into the memory and I thought
this needed some explanation as to why this weird thing works.

- it would already use the dt-bindings/interrupt-controller/irq.h macros
for LEVEL/EDGE cell values

- it contains valuable comments about the uboot. Because ethernet0 alias
  and the /plb/obc/ebc node-name requirements).

- UART are using 16750 compatible (as per hardware docs)

>
> The order I would go is split into an apm82181.dtsi with 0 changes to
> the built dtb(s). Then make changes/additions you need. As far as
> changes to existing bindings, it's only an ABI if someone notices.

This will rewriting the history,  as the development of apm82181.dtsi
did happen differently (basically, each device started with its own full dts.
But early on in 2016 we merged the common nodes and switched over
to the macros). This is fine though, I'll need some time to rebase and rewrite
the patches.

(Note: I've already wrote a patch for a the apm82181 dwc USB binding for
this: <https://www.spinics.net/lists/devicetree/msg378884.html>. Not sure
about uic, sata and dw-dma as these drivers each use a common binding.
I hope there's some leeway for this old stuff.)

Cheers,
Christian
