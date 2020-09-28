Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666927AF8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 16:00:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0PLF6RyxzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 00:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vDmSUBpY; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0PGC38cBzDqMH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 23:57:07 +1000 (AEST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 527C621941
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601301423;
 bh=jpy86xlaUGPlUxTUN9/FT28T6TJmY9Ad8uRAhplOiLM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vDmSUBpYh7JEkaKpuSJodZASpvn5qYNR9WD7Zz+ui1FtxvuddwJe0WaOjmp/axHLo
 CvGi+htN93Dw+bCHcooMeEmLM6ROMwqzptJbER2UAJzI5Gc0Rbgm9qtlYuoiCTp2kJ
 kSRDYEYKPRHzv/MBnvBvucpR9bEchfKfyRLFlTYk=
Received: by mail-oi1-f177.google.com with SMTP id 185so1368846oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 06:57:03 -0700 (PDT)
X-Gm-Message-State: AOAM530uJspn5G5ZSCCkNFTNFFZCScu1hvCN+HSKDs3+ipD7TTiDd0IG
 FE4pAgWpf1V+KTdYXXFUg+b8IPNKI+TEEKIN8Q==
X-Google-Smtp-Source: ABdhPJyYmZnCW5ClUtpTwg9oOuQczSxGPBFDOMMXF/U6MycG0QqSC1DUS8ybQXFW/wpG74B1ug8+ncnraesKmTdxWF0=
X-Received: by 2002:aca:7543:: with SMTP id q64mr978362oic.147.1601301422618; 
 Mon, 28 Sep 2020 06:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200923023234.GA3751572@bogus>
 <AM6PR04MB5413BB2F8D044B2312DAEC4FF1380@AM6PR04MB5413.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5413BB2F8D044B2312DAEC4FF1380@AM6PR04MB5413.eurprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Sep 2020 08:56:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+uzkr7CcvwQTe5vhpMPtdqL9v4EeqH5yZjMoT=JrDtDQ@mail.gmail.com>
Message-ID: <CAL_Jsq+uzkr7CcvwQTe5vhpMPtdqL9v4EeqH5yZjMoT=JrDtDQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
To: Ran Wang <ran.wang_1@nxp.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Biwen Li <biwen.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 1:44 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Hi Rob,
>
> On Wednesday, September 23, 2020 10:33 AM, Rob Herring wrote:
> >
> > On Wed, Sep 16, 2020 at 04:18:27PM +0800, Ran Wang wrote:
> > > From: Biwen Li <biwen.li@nxp.com>
> > >
> > > The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata
> > > A-008646 on LS1021A
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 19
> > > +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > index 5a33619..1be58a3 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > @@ -34,6 +34,11 @@ Chassis Version          Example Chips
> > >  Optional properties:
> > >   - little-endian : RCPM register block is Little Endian. Without it RCPM
> > >     will be Big Endian (default case).
> > > + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware issue
> > > +   on SoC LS1021A and only needed on SoC LS1021A.
> > > +   Must include 2 entries:
> > > +   The first entry must be a link to the SCFG device node.
> > > +   The 2nd entry must be offset of register IPPDEXPCR1 in SCFG.
> >
> > You don't need a DT change for this. You can find SCFG node by its compatible
> > string and then the offset should be known given this issue is only on 1 SoC.
>
> Did you mean that RCPM driver just to access IPPDEXPCR1 shadowed register in SCFG
> directly without fetching it's offset info. from DT?

Yes. There's only 1 possible value of the offset because there's only
one SoC, so the driver can hardcode the offset. And I assume there's
only one SCFG node, so you can find it by its compatible string
(of_find_compatible_node).

Rob
