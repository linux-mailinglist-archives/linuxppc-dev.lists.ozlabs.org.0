Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C6B2748F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 21:17:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwrfG4m3pzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 05:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=WoGpDfo+; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwrbj1R6fzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 05:14:57 +1000 (AEST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 836682371F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600802094;
 bh=K+FrKaAh3M2RF05RFR8JYisPOdNOgL1KtkDgvvTgNw4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WoGpDfo+b71YQehweqKVvRVhUqpOX8wGCIr1D7KBVtECMtntprYcahScgc1FY6zMi
 67mN/XlmZiVY+yXTfx/NOnHITC5QaSjE6mFKCZqLaOWy2G3yorxWv/wBBwOuLoizNF
 93xXmtSBtCpMWcOoe67BfbQXFoTh6vL2Nx5q5APc=
Received: by mail-ot1-f42.google.com with SMTP id n61so16650783ota.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 12:14:54 -0700 (PDT)
X-Gm-Message-State: AOAM531hHez1DCSiQi4+bro2SAqdsAMe1CJ3zDjQu0UAlMmuxOURkquL
 wmZ6mPunj13VwOHGOgM3mnG50rKUpNYNbiqrfA==
X-Google-Smtp-Source: ABdhPJyVX7r0tEN2yw5zRjAYHq+1PnOgkxXKpqO5O9Azdg5etPRi/tvoNzgrgjii6rc0qrT18YB9L0+LKo50aovAoJg=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr3834273otp.129.1600802093800; 
 Tue, 22 Sep 2020 12:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599343429.git.chunkeey@gmail.com>
 <47109d80c7bd481c7747c949e8a3ecd498d9c039.1599343429.git.chunkeey@gmail.com>
 <20200915010543.GB612463@bogus>
 <7bf866fd-6499-68e4-9825-5c3e2042ef65@gmail.com>
In-Reply-To: <7bf866fd-6499-68e4-9825-5c3e2042ef65@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Sep 2020 13:14:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+x0jFh-2jVt9pVek6a2=UCv0z0sBJpuh5irxeQG+tbUg@mail.gmail.com>
Message-ID: <CAL_Jsq+x0jFh-2jVt9pVek6a2=UCv0z0sBJpuh5irxeQG+tbUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] powerpc: apm82181: create shared dtsi for APM
 bluestone
To: Christian Lamparter <chunkeey@gmail.com>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Chris Blake <chrisrblake93@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 2:23 PM Christian Lamparter <chunkeey@gmail.com> wrote:
>
> On 2020-09-15 03:05, Rob Herring wrote:
> > On Sun, Sep 06, 2020 at 12:06:12AM +0200, Christian Lamparter wrote:
> >> This patch adds an DTSI-File that can be used by various device-tree
> >> files for APM82181-based devices.
> >>
> >> Some of the nodes (like UART, PCIE, SATA) are used by the uboot and
> >> need to stick with the naming-conventions of the old times'.
> >> I've added comments whenever this was the case.
> >>
> >> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> >> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> >> ---
> >> rfc v1 -> v2:
> >>      - removed PKA (this CryptoPU will need driver)
> >>      - stick with compatibles, nodes, ... from either
> >>        Bluestone (APM82181) or Canyonlands (PPC460EX).
> >>      - add labels for NAND and NOR to help with access.
> >> v2 -> v3:
> >>      - nodename of pciex@d.... was changed to pcie@d..
> >>        due to upstream patch.
> >>      - use simple-bus on the ebc, opb and plb nodes
> >> ---
> >>   arch/powerpc/boot/dts/apm82181.dtsi | 466 ++++++++++++++++++++++++++++
> >>   1 file changed, 466 insertions(+)
> >>   create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi
> >>
> >> diff --git a/arch/powerpc/boot/dts/apm82181.dtsi b/arch/powerpc/boot/dts/apm82181.dtsi
> >> new file mode 100644
> >> index 000000000000..60283430978d
> >> --- /dev/null
> >> +++ b/arch/powerpc/boot/dts/apm82181.dtsi
> >> @@ -0,0 +1,466 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Device Tree template include for various APM82181 boards.
> >> + *
> >> + * The SoC is an evolution of the PPC460EX predecessor.
> >> + * This is why dt-nodes from the canyonlands EBC, OPB, USB,
> >> + * DMA, SATA, EMAC, ... ended up in here.
> >> + *
> >> + * Copyright (c) 2010, Applied Micro Circuits Corporation
> >> + * Author: Tirumala R Marri <tmarri@apm.com>,
> >> + *     Christian Lamparter <chunkeey@gmail.com>,
> >> + *     Chris Blake <chrisrblake93@gmail.com>
> >> + */
> >> +
> >> +#include <dt-bindings/dma/dw-dmac.h>
> >> +#include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +
> >> +/ {
> >> +    #address-cells = <2>;
> >> +    #size-cells = <1>;
> >> +    dcr-parent = <&{/cpus/cpu@0}>;
> >> +
> >> +    aliases {
> >> +            ethernet0 = &EMAC0; /* needed for BSP u-boot */
> >> +    };
> >> +
> >> +    cpus {
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +
> >> +            CPU0: cpu@0 {
> >> +                    device_type = "cpu";
> >> +                    model = "PowerPC,apm82181";
> >
> > This doesn't match the existing bluestone dts file.
> >
> > Please separate any restructuring from changes.
>
>
> "I see" (I'm including your comment of the dt-binding as well).
>
> I'm getting the vibe that I better should not touch that bluestone.dts.

I don't know about that.

> An honestly, looking at the series and patches that the APM-engineers
> posted back in the day, I can see why this well is so poisoned... and
> stuff like SATA/AHBDMA/USB/GPIO/CPM/... was missing.
>
> As for the devices. In the spirit of Arnd Bergmann's post of
> <https://lkml.org/lkml/2020/3/30/195>
>
> |It would be nice to move over the the bluestone .dts to the apm82181.dtsi file
> |when that gets added, if only to ensure they use the same description for each
> |node, but that shouldn't stop the addition of the new file if that is needed for
> |distros to make use of a popular device.
> |I see a couple of additional files in openwrt.
>
> I mean I don't have the bluestone dev board, just the consumer devices.

This stuff is old enough, I'd guess no one cares about a dev board.
But we should figure that out and document that with any changes.

> Would it be possible to support those? I can start from a "skeleton" apm82181.dtsi
> This would just include CPU, Memory (SD-RAM+L2C+OCM), UIC (Interrupt-Controller),
> the PLB+OBP+EBC Busses and UART. Just enough to make a board "boot from ram".

This skeleton would be chunks moved over or duplicated? I don't think
we want 2 of the same thing.

The order I would go is split into an apm82181.dtsi with 0 changes to
the built dtb(s). Then make changes/additions you need. As far as
changes to existing bindings, it's only an ABI if someone notices.


Rob
