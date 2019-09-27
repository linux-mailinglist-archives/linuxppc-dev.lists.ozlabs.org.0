Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5BC0B12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 20:30:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g0jB1VYLzDqsl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 04:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g0g34kmnzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 04:28:47 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id g13so3064061otp.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 11:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qZoUc61rWZUABqYiFdYsTRbcGhf3P6ij4WXTBM/dESA=;
 b=D40JFrTgYnK867e5yE/9cmEvU+mPWbgiYNGYdVildx+sg/G1mN+YQFwSK8kNp8DdrB
 btXCywo5pHGIn3nKfLAcgwg/26happhN83tgAksegch0Zk0aESC/MdvFVtHGMZIatW1H
 d7vH1o3MI/G5V5JiXeelCj5rfc0JV9JOf9UVpxUikL9Z0g2ouxE9/OvAl9V7Oe3Munmx
 Gi9DtzbxzS9hLVSnuNbxrwW8uwMR1Oa/LkvsXSqy3N/4S4YgWk0D8bFI8crKmr+oQEJh
 gJPHWSR3lJK5QfotFi4lpVuhvl0BW++mlM4W90QBc7b2QTVeW8L2FeM9VOlFOwYvL0jt
 2UsQ==
X-Gm-Message-State: APjAAAXBPMF24pbJyvkp8lR4l7QURW7vONsSOXgZjQCYFKz9PC+v6vFh
 gTi2OoLdrXbZPSeYysALrQ==
X-Google-Smtp-Source: APXvYqyQPejECmFGd11SGP7Xcg8Htf2DDNyXC9qmFAvQC7yFda9W92oheirhgtI3bl+Vjh4c4JzYUw==
X-Received: by 2002:a9d:6a59:: with SMTP id h25mr4511188otn.324.1569608925282; 
 Fri, 27 Sep 2019 11:28:45 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w20sm1127648otk.73.2019.09.27.11.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:28:44 -0700 (PDT)
Date: Fri, 27 Sep 2019 13:28:44 -0500
From: Rob Herring <robh@kernel.org>
To: Leo Li <leoyang.li@nxp.com>
Subject: Re: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Message-ID: <20190927182844.GA5203@bogus>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Biwen Li <biwen.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ran Wang <ran.wang_1@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 03:34:47AM +0000, Leo Li wrote:
> 
> 
> > -----Original Message-----
> > From: Biwen Li
> > Sent: Tuesday, September 24, 2019 10:30 PM
> > To: Leo Li <leoyang.li@nxp.com>; shawnguo@kernel.org;
> > robh+dt@kernel.org; mark.rutland@arm.com; Ran Wang
> > <ran.wang_1@nxp.com>
> > Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add 'fsl,ippdexpcr-alt-
> > addr' property
> > 
> > > > > >
> > > > > > The 'fsl,ippdexpcr-alt-addr' property is used to handle an
> > > > > > errata
> > > > > > A-008646 on LS1021A
> > > > > >
> > > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > > ---
> > > > > > Change in v3:
> > > > > > 	- rename property name
> > > > > > 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> > > > > >
> > > > > > Change in v2:
> > > > > > 	- update desc of the property 'fsl,rcpm-scfg'
> > > > > >
> > > > > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > > > > > ++++++++++++++
> > > > > >  1 file changed, 14 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > index 5a33619d881d..157dcf6da17c 100644
> > > > > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > @@ -34,6 +34,11 @@ Chassis Version		Example Chips
> > > > > >  Optional properties:
> > > > > >   - little-endian : RCPM register block is Little Endian. Without it RCPM
> > > > > >     will be Big Endian (default case).
> > > > > > + - fsl,ippdexpcr-alt-addr : Must add the property for SoC
> > > > > > + LS1021A,
> > > > >
> > > > > You probably should mention this is related to a hardware issue on
> > > > > LS1021a and only needed on LS1021a.
> > > > Okay, got it, thanks, I will add this in v4.
> > > > >
> > > > > > +   Must include n + 1 entries (n = #fsl,rcpm-wakeup-cells, such as:
> > > > > > +   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 + 1 entries).
> > > > >
> > > > > #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR registers on an SoC.
> > > > > However you are defining an offset to scfg registers here.  Why
> > > > > these two are related?  The length here should actually be related
> > > > > to the #address-cells of the soc/.  But since this is only needed
> > > > > for LS1021, you can
> > > > just make it 3.
> > > > I need set the value of IPPDEXPCR resgiters from ftm_alarm0 device
> > > > node(fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
> > > > 0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for IPPDEXPCR1).
> > > > But because of the hardware issue on LS1021A, I need store the value
> > > > of IPPDEXPCR registers to an alt address. So I defining an offset to
> > > > scfg registers, then RCPM driver get an abosolute address from
> > > > offset, RCPM driver write the value of IPPDEXPCR registers to these
> > > > abosolute addresses(backup the value of IPPDEXPCR registers).
> > >
> > > I understand what you are trying to do.  The problem is that the new
> > > fsl,ippdexpcr-alt-addr property contains a phandle and an offset.  The
> > > size of it shouldn't be related to #fsl,rcpm-wakeup-cells.
> > You maybe like this: fsl,ippdexpcr-alt-addr = <&scfg 0x51c>;/*
> > SCFG_SPARECR8 */
> 
> No.  The #address-cell for the soc/ is 2, so the offset to scfg 
> should be 0x0 0x51c.  The total size should be 3, but it shouldn't be 
> coming from #fsl,rcpm-wakeup-cells like you mentioned in the binding.

Um, no. #address-cells applies to reg and ranges, not some vendor 
specific property. You can just define how many cells you need if that's 
fixed. 

However, I suggested doing this another way in the next version of this.

Rob
