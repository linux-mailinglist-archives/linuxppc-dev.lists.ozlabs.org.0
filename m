Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC11BDFAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 16:11:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dg2k68CGzDqlh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 00:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dfyY0crvzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 00:07:28 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id 67so4916925oto.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 07:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gNzfLxyphufZW7oX+loBgrNcosGjw89AhG0FkoAT9T0=;
 b=c3thwQgBKgpbqRd7dl4ekURNnju8ekq/nK/CC1udcl+nxGWSyHXDQREq/XEyZL6ieq
 7OuCgQ6vVsjU8+yUI/fyslvguNShNMMcKWZeg7yfVeBmeK6ZvyVTdSDzByPlz/t2WrE1
 XIEzCYpXHAlG6DMF6Ehvw3CxdvR/rmoPtbNAJpEhehu28uFB5cTFyywF9Ccy1XpezKJO
 oR/3sx5ELDzdsdDIM9WsVVgReZdWG1dgaAicguuZZgX64qwi02WWNKHve5JO5UOBm4WY
 qGgtsmzzsBzUls0uWRLrrB4vWn9d11AMq+9uxzyh1sw2VfQZsE7WA7vWpQLtnRrnCnOC
 cOaw==
X-Gm-Message-State: APjAAAUnKFxXrkfE6703rDDwaQwUCgue+4qY077i3HJfTaxHCcQQpb7T
 tFwHfR2Ys0rk/lIFn5OhfVKK+wOR
X-Google-Smtp-Source: APXvYqyylUPZWSG2iQg22c0CH81/CF243Q5GvdlR98oKIkx6prFblSiZCokLjlWLvsnucid/GqWS8Q==
X-Received: by 2002:a05:6830:1586:: with SMTP id
 i6mr6380614otr.346.1569420444934; 
 Wed, 25 Sep 2019 07:07:24 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com.
 [209.85.167.170])
 by smtp.gmail.com with ESMTPSA id a88sm1734918otb.0.2019.09.25.07.07.23
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2019 07:07:23 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id k20so4995903oih.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 07:07:23 -0700 (PDT)
X-Received: by 2002:aca:d988:: with SMTP id q130mr4486320oig.13.1569420442960; 
 Wed, 25 Sep 2019 07:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490EAE9591B5AE7112C9D188F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676B8A6F7C7C3BC822B45B28F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB44902BADDDFD090BAF4178C68F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <DB7PR04MB4490684FE0E95695E89173948F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4490684FE0E95695E89173948F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 25 Sep 2019 09:07:12 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ+=au2qRL2K-tzhH8HK1+sO+ut9YBhYw4UhWSv5FF88A@mail.gmail.com>
Message-ID: <CADRPPNQ+=au2qRL2K-tzhH8HK1+sO+ut9YBhYw4UhWSv5FF88A@mail.gmail.com>
Subject: Re: [v3, 3/3] Documentation: dt: binding: fsl: Add 'fsl,
 ippdexpcr-alt-addr' property
To: Biwen Li <biwen.li@nxp.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Ran Wang <ran.wang_1@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 11:27 PM Biwen Li <biwen.li@nxp.com> wrote:
>
> > > >
> > > > > > > > > >
> > > > > > > > > > The 'fsl,ippdexpcr-alt-addr' property is used to handle
> > > > > > > > > > an errata
> > > > > > > > > > A-008646 on LS1021A
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > > > > > > ---
> > > > > > > > > > Change in v3:
> > > > > > > > > >       - rename property name
> > > > > > > > > >         fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> > > > > > > > > >
> > > > > > > > > > Change in v2:
> > > > > > > > > >       - update desc of the property 'fsl,rcpm-scfg'
> > > > > > > > > >
> > > > > > > > > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > > > > > > > > > ++++++++++++++
> > > > > > > > > >  1 file changed, 14 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git
> > > > > > > > > > a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > index 5a33619d881d..157dcf6da17c 100644
> > > > > > > > > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > @@ -34,6 +34,11 @@ Chassis Version            Example
> > > > Chips
> > > > > > > > > >  Optional properties:
> > > > > > > > > >   - little-endian : RCPM register block is Little Endian.
> > > > > > > > > > Without it
> > > > > RCPM
> > > > > > > > > >     will be Big Endian (default case).
> > > > > > > > > > + - fsl,ippdexpcr-alt-addr : Must add the property for
> > > > > > > > > > + SoC LS1021A,
> > > > > > > > >
> > > > > > > > > You probably should mention this is related to a hardware
> > > > > > > > > issue on LS1021a and only needed on LS1021a.
> > > > > > > > Okay, got it, thanks, I will add this in v4.
> > > > > > > > >
> > > > > > > > > > +   Must include n + 1 entries (n =
> > > > > > > > > > + #fsl,rcpm-wakeup-cells, such
> > > as:
> > > > > > > > > > +   #fsl,rcpm-wakeup-cells equal to 2, then must include
> > > > > > > > > > + 2
> > > > > > > > > > + +
> > > > > > > > > > + 1
> > > > > entries).
> > > > > > > > >
> > > > > > > > > #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR
> > > > > > > > > registers on an
> > > > > SoC.
> > > > > > > > > However you are defining an offset to scfg registers here.
> > > > > > > > > Why these two are related?  The length here should
> > > > > > > > > actually be related to the #address-cells of the soc/.
> > > > > > > > > But since this is only needed for LS1021, you can
> > > > > > > > just make it 3.
> > > > > > > > I need set the value of IPPDEXPCR resgiters from ftm_alarm0
> > > > > > > > device node(fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
> > > > > > > > 0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for
> > > > > IPPDEXPCR1).
> > > > > > > > But because of the hardware issue on LS1021A, I need store
> > > > > > > > the value of IPPDEXPCR registers to an alt address. So I
> > > > > > > > defining an offset to scfg registers, then RCPM driver get
> > > > > > > > an abosolute address from offset, RCPM driver write the
> > > > > > > > value of IPPDEXPCR registers to these abosolute
> > > > > > > > addresses(backup the value of IPPDEXPCR
> > > > > registers).
> > > > > > >
> > > > > > > I understand what you are trying to do.  The problem is that
> > > > > > > the new fsl,ippdexpcr-alt-addr property contains a phandle and an
> > offset.
> > > > > > > The size of it shouldn't be related to #fsl,rcpm-wakeup-cells.
> > > > > > You maybe like this: fsl,ippdexpcr-alt-addr = <&scfg 0x51c>;/*
> > > > > > SCFG_SPARECR8 */
> > > > >
> > > > > No.  The #address-cell for the soc/ is 2, so the offset to scfg
> > > > > should be 0x0 0x51c.  The total size should be 3, but it shouldn't
> > > > > be coming from #fsl,rcpm-wakeup-cells like you mentioned in the
> > binding.
> > > > Oh, I got it. You want that fsl,ippdexpcr-alt-add is relative with
> > > > #address-cells instead of #fsl,rcpm-wakeup-cells.
> > >
> > > Yes.
> > I got an example from drivers/pci/controller/dwc/pci-layerscape.c
> > and arch/arm/boot/dts/ls1021a.dtsi as follows:
> > fsl,pcie-scfg = <&scfg 0>, 0 is an index
> >
> > In my fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x51c>, It means that 0x0 is an alt
> > offset address for IPPDEXPCR0, 0x51c is an alt offset address For
> > IPPDEXPCR1 instead of 0x0 and 0x51c compose to an alt address of
> > SCFG_SPARECR8.
> Maybe I need write it as:
> fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x0 0x0 0x51c>;
> first two 0x0 compose an alt offset address for IPPDEXPCR0,
> last 0x0 and 0x51c compose an alt address for IPPDEXPCR1,

I remember the hardware issue is only is only related to IPPDEXPCR1
register, no idea why you need to define IPPDEXPCR0 in the binding.

>
> Best Regards,
> Biwen Li
> > >
> > > Regards,
> > > Leo
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > +   The first entry must be a link to the SCFG device node.
> > > > > > > > > > +   The non-first entry must be offset of registers of SCFG.
> > > > > > > > > >
> > > > > > > > > >  Example:
> > > > > > > > > >  The RCPM node for T4240:
> > > > > > > > > > @@ -43,6 +48,15 @@ The RCPM node for T4240:
> > > > > > > > > >               #fsl,rcpm-wakeup-cells = <2>;
> > > > > > > > > >       };
> > > > > > > > > >
> > > > > > > > > > +The RCPM node for LS1021A:
> > > > > > > > > > +     rcpm: rcpm@1ee2140 {
> > > > > > > > > > +             compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-
> > > > > > 2.1+";
> > > > > > > > > > +             reg = <0x0 0x1ee2140 0x0 0x8>;
> > > > > > > > > > +             #fsl,rcpm-wakeup-cells = <2>;
> > > > > > > > > > +             fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x51c>; /*
> > > > > > > > > > SCFG_SPARECR8 */
> > > > > > > > > > +     };
> > > > > > > > > > +
> > > > > > > > > > +
> > > > > > > > > >  * Freescale RCPM Wakeup Source Device Tree Bindings
> > > > > > > > > >  -------------------------------------------
> > > > > > > > > >  Required fsl,rcpm-wakeup property should be added to a
> > > > > > > > > > device node if the device
> > > > > > > > > > --
> > > > > > > > > > 2.17.1
>
