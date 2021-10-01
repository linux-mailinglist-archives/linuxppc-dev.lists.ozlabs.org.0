Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6879C41F202
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 18:18:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLZzK0Sr4z3c7D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 02:18:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.179;
 helo=mail-qk1-f179.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLZyr5h7gz2yPR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 02:17:55 +1000 (AEST)
Received: by mail-qk1-f179.google.com with SMTP id c7so9680601qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 09:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tKg9mgF1rfjAjrXayimdKxGF/3vx77dbe9y4qadsSBo=;
 b=u5UrMpi8XFuJ+zNDJyyRPihwyLctEOinkwjzp8xCGS52VIVMmEtK3AGigKrW3oe+WF
 MxaKDCeOfpN8btpGbixWQ627tOYXzyGsgy3zxRpBfwhN6RaVQLaChxaZu81IlRwVfwYl
 KLZv5UXxsgixVoWXLtToQ2Fp+z2u9Xi9xX7dBBh6bINzhE2acsY1z5Ec2hv0XExCabBi
 8BhnoD70A5nyCW53TBtpoznKEK9ojrlOPvrFTfP+psKTjB0lS+uYuH6NO3H1R4GeIoBV
 qLodODwVTafQ+rjAmH3XIJdoUNpFrzuCwF5+pu4Dsx6Q3VSZlaWkzNrTF+5O4atBKKfG
 BhHw==
X-Gm-Message-State: AOAM531wh7ri9O4zGGGWA5UC09VJfrROqxLbRhYtllIPRdZOZytFnIKJ
 hczJ8BMX67iUTEHmRHRAb1jBSCaQ1yY=
X-Google-Smtp-Source: ABdhPJxlUMN0w/zWy0Bb0/R60Q8zxWF0Tx784xgsFlSgl/6cwMpXw79Sw8W88r/uLkA2UDhVOWQSDQ==
X-Received: by 2002:a05:620a:53d:: with SMTP id
 h29mr10308714qkh.395.1633105071689; 
 Fri, 01 Oct 2021 09:17:51 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180])
 by smtp.gmail.com with ESMTPSA id c139sm3223846qkg.2.2021.10.01.09.17.50
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:17:50 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id x9so9517617qtv.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 09:17:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:: with SMTP id
 w1mr14334812qtk.127.1633105070007; 
 Fri, 01 Oct 2021 09:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-2-leoyang.li@nxp.com>
 <db751cb1-9107-3857-7576-644bde4c28e5@canonical.com>
In-Reply-To: <db751cb1-9107-3857-7576-644bde4c28e5@canonical.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 1 Oct 2021 11:17:38 -0500
X-Gmail-Original-Message-ID: <CADRPPNROVBp_QB=6XEgk8WF5fnEPFTSko4Nn+mm8oLM3iGTuuw@mail.gmail.com>
Message-ID: <CADRPPNROVBp_QB=6XEgk8WF5fnEPFTSko4Nn+mm8oLM3iGTuuw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 5:01 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 01/10/2021 02:09, Li Yang wrote:
> > Convert the txt binding to yaml format and add description.  Drop the
> > "simple-bus" compatible string from the example and not allowed by the
> > binding any more.  This will help to enforce the correct probe order
> > between parent device and child devices, but will require the ifc driver
> > to probe the child devices to work properly.
> >
> > Signed-off-by: Li Yang <leoyang.li@nxp.com>
> > ---
> > updates from previous submission:
> > - Drop "simple-bus" from binding and only "fsl,ifc" as compatible
> > - Fix one identiation problem of "reg"
> > - Add type restriction to "little-endian" property
> >
> >  .../bindings/memory-controllers/fsl/ifc.txt   |  82 -----------
> >  .../bindings/memory-controllers/fsl/ifc.yaml  | 137 ++++++++++++++++++
> >  2 files changed, 137 insertions(+), 82 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > deleted file mode 100644
> > index 89427b018ba7..000000000000
> > --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > +++ /dev/null
> > @@ -1,82 +0,0 @@
> > -Integrated Flash Controller
> > -
> > -Properties:
> > -- name : Should be ifc
> > -- compatible : should contain "fsl,ifc". The version of the integrated
> > -               flash controller can be found in the IFC_REV register at
> > -               offset zero.
> > -
> > -- #address-cells : Should be either two or three.  The first cell is the
> > -                   chipselect number, and the remaining cells are the
> > -                   offset into the chipselect.
> > -- #size-cells : Either one or two, depending on how large each chipselect
> > -                can be.
> > -- reg : Offset and length of the register set for the device
> > -- interrupts: IFC may have one or two interrupts.  If two interrupt
> > -              specifiers are present, the first is the "common"
> > -              interrupt (CM_EVTER_STAT), and the second is the NAND
> > -              interrupt (NAND_EVTER_STAT).  If there is only one,
> > -              that interrupt reports both types of event.
> > -
> > -- little-endian : If this property is absent, the big-endian mode will
> > -                  be in use as default for registers.
> > -
> > -- ranges : Each range corresponds to a single chipselect, and covers
> > -           the entire access window as configured.
> > -
> > -Child device nodes describe the devices connected to IFC such as NOR (e.g.
> > -cfi-flash) and NAND (fsl,ifc-nand). There might be board specific devices
> > -like FPGAs, CPLDs, etc.
> > -
> > -Example:
> > -
> > -     ifc@ffe1e000 {
> > -             compatible = "fsl,ifc", "simple-bus";
> > -             #address-cells = <2>;
> > -             #size-cells = <1>;
> > -             reg = <0x0 0xffe1e000 0 0x2000>;
> > -             interrupts = <16 2 19 2>;
> > -             little-endian;
> > -
> > -             /* NOR, NAND Flashes and CPLD on board */
> > -             ranges = <0x0 0x0 0x0 0xee000000 0x02000000
> > -                       0x1 0x0 0x0 0xffa00000 0x00010000
> > -                       0x3 0x0 0x0 0xffb00000 0x00020000>;
> > -
> > -             flash@0,0 {
> > -                     #address-cells = <1>;
> > -                     #size-cells = <1>;
> > -                     compatible = "cfi-flash";
> > -                     reg = <0x0 0x0 0x2000000>;
> > -                     bank-width = <2>;
> > -                     device-width = <1>;
> > -
> > -                     partition@0 {
> > -                             /* 32MB for user data */
> > -                             reg = <0x0 0x02000000>;
> > -                             label = "NOR Data";
> > -                     };
> > -             };
> > -
> > -             flash@1,0 {
> > -                     #address-cells = <1>;
> > -                     #size-cells = <1>;
> > -                     compatible = "fsl,ifc-nand";
> > -                     reg = <0x1 0x0 0x10000>;
> > -
> > -                     partition@0 {
> > -                             /* This location must not be altered  */
> > -                             /* 1MB for u-boot Bootloader Image */
> > -                             reg = <0x0 0x00100000>;
> > -                             label = "NAND U-Boot Image";
> > -                             read-only;
> > -                     };
> > -             };
> > -
> > -             cpld@3,0 {
> > -                     #address-cells = <1>;
> > -                     #size-cells = <1>;
> > -                     compatible = "fsl,p1010rdb-cpld";
> > -                     reg = <0x3 0x0 0x000001f>;
> > -             };
> > -     };
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
> > new file mode 100644
> > index 000000000000..19871ce39fe3
>
> Thanks for the patch.
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
> > @@ -0,0 +1,137 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>
> Checkpatch should scream here. If it doesn't, maybe you work on some old
> tree, which would also explain why you send it to my old address (not
> the one from get_maintainers). Please use both checkpatch and
> get_maintainers.
>
> You basically relicense bindings from GPL-2.0 only to new license,
> including GPL-3.0.

Ok.  Will update the license.

>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/memory-controllers/fsl/ifc.yaml#
>
> File name should be "fsl,ifc.yaml"

Ok.  But probably it is a little bit redundant as the upper level
folder also has fsl.

>
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: FSL/NXP Integrated Flash Controller
> > +
> > +maintainers:
> > +  - Li Yang <leoyang.li@nxp.com>
> > +
> > +description: |
> > +  NXP's integrated flash controller (IFC) is an advanced version of the
> > +  enhanced local bus controller which includes similar programming and signal
> > +  interfaces with an extended feature set. The IFC provides access to multiple
> > +  external memory types, such as NAND flash (SLC and MLC), NOR flash, EPROM,
> > +  SRAM and other memories where address and data are shared on a bus.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^ifc@[0-9a-f]+$"
>
> Nodes should be generic, so this looks like "memory-controller".

Ok.

>
> > +
> > +  compatible:
> > +    const: fsl,ifc
> > +
> > +  "#address-cells":
> > +    enum: [2, 3]
> > +    description: |
> > +      Should be either two or three.  The first cell is the chipselect
> > +      number, and the remaining cells are the offset into the chipselect.
> > +
> > +  "#size-cells":
> > +    enum: [1, 2]
> > +    description: |
> > +      Either one or two, depending on how large each chipselect can be.
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: |
> > +      Offset and length of the register set for the device.
>
> Skip the description, it's obvious.

Ok.

>
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      IFC may have one or two interrupts.  If two interrupt specifiers are
> > +      present, the first is the "common" interrupt (CM_EVTER_STAT), and the
> > +      second is the NAND interrupt (NAND_EVTER_STAT).  If there is only one,
> > +      that interrupt reports both types of event.
> > +
> > +  little-endian:
> > +    $ref: '/schemas/types.yaml#/definitions/flag'
>
> type: boolean

It will not have a true or false value, but only present or not.  Is
the boolean type taking care of this too?

>
>
> Best regards,
> Krzysztof
