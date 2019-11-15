Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBFFD2D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 03:13:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dhj01Wy1zF82B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 13:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B5q0wHOf"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dhfp2NdczF3Cs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 13:11:29 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id m125so6895581qkd.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 18:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwrIjV3rAOWSyJGG0/sIPU9f3LX/vsYsv+fodZVW0cU=;
 b=B5q0wHOfASmZ2Lh14yogezn+rxmdrhLEqWhuNk93pGbwQbaO6sLoWN7peQg5V6zIB6
 KHayoKlXplSk/aAY4eaN8FJ/LAw9ESKXao6PP24mYa/m6e90+PSSO74emOhetwN0BmXu
 x4/s0wWLW7qZEQoT34tbAxMOASITbRC12NeR9YdqxBOuZcoQvxYgnFDcm9j6MATYT+L6
 jXZi8EgW68Tv/u65e1Vh0dJ0TP4SInsfheo6NTaxtuF6qIk0orBHmmXtqCB5djpK2PBl
 5IIP2SiNR3Z/SA2ocdB8O4KPAnhgDXzbHSYDOGXEhLIbfxrZXIrOrXRk3z8Y3LPaiICF
 GjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwrIjV3rAOWSyJGG0/sIPU9f3LX/vsYsv+fodZVW0cU=;
 b=V52W9n5bd+u8uSdQmqb/vV6QSLq6SCSL3xO3ofHMVlLBsoLkPWpWbIYuOOWcY3jKJW
 1NrlOCObYU+nOk8kyStKtnrX3gReJ/LkPWWqIwyXxtoOInvKWH1Y4/jyW3K1wGSr7kQc
 7QYO1WejCurryIXfs4BBK/OTt24tlcYxcMg8q+1Ws1xbqHdmOR56Dv/A0VCYDpYMpYkL
 w+9sU8yJJBi3LBUzJRFTeJp0TNpWLm3i/qmeiH3gPvsYwIgFTmZn9VKjmQlbpPwJPMVK
 SxSVeM5WqTDOdETQ1qtPCtYeUHP4aUJVbL+KscfgPHofAHyyJnRGYdSsn4RHKHr5tA8g
 NB/g==
X-Gm-Message-State: APjAAAVwAuumlg5w5D9lxcx3VrmPkH6Fv2la3rpg0ypEV4GH+o3V+P6v
 Juxg/7N7YV3jq2Ta0aLpP020GmW0MnOW+V5y8wU=
X-Google-Smtp-Source: APXvYqzZHeRcZIgni1l1ogsgH8eDjDju0/cJCQTbsqWiKfxK9978qCLi+jtHTfqk6AqN7EAjBIsCUqRktKpqKTvt5gY=
X-Received: by 2002:a37:a00f:: with SMTP id j15mr10776968qke.103.1573783886106; 
 Thu, 14 Nov 2019 18:11:26 -0800 (PST)
MIME-Version: 1.0
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
 <20191114211237.GA25375@bogus>
In-Reply-To: <20191114211237.GA25375@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 Nov 2019 10:11:14 +0800
Message-ID: <CAA+D8AOfPbS4dn=p+0f8icWBsZegUubJ21qsY7yFw2a=a3Mb_A@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH V3 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Nicolin Chen <nicoleotsuka@gmail.com>, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob

On Fri, Nov 15, 2019 at 5:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Nov 11, 2019 at 05:18:22PM +0800, Shengjiu Wang wrote:
> > Add compatible string "fsl,imx8qm-asrc" for imx8qm platform.
> >
> > There are two asrc modules in imx8qm, the clock mapping is
> > different for each other, so add new property "fsl,asrc-clk-map"
> > to distinguish them.
>
> What's the clock mapping?
>
The two asrc have different clock source connected to it,  also
the asrc in other platform, like imx6, has different clock source.

We collect all these clock source together, defined an enumerate
format structure in driver, so for the asrc in each platform, we
need to remap the clock source from the enumerate index to
the real connection index in hardware.

The range of  the enumerate structure is 0-0x30, some index
may not be used in this platform, but used in other platform
the range of the real connection range is 0-0xf, so we do
the remapping for [0, 0x30]  to [0, 0xf]

>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > -none
> >
> > changes in v3
> > -use only one compatible string "fsl,imx8qm-asrc",
> > -add new property "fsl,asrc-clk-map".
> >
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index 1d4d9f938689..02edab7cf3e0 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -8,7 +8,8 @@ three substreams within totally 10 channels.
> >
> >  Required properties:
> >
> > -  - compatible               : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> > +  - compatible               : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> > +                       "fsl,imx8qm-asrc".
> >
> >    - reg                      : Offset and length of the register set for the device.
> >
> > @@ -35,6 +36,13 @@ Required properties:
> >
> >     - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> >
> > +   - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
> > +                       by imx8qm/imx8qxp platform
> > +                       <0> - select the map for asrc0 in imx8qm
> > +                       <1> - select the map for asrc1 in imx8qm
> > +                       <2> - select the map for asrc0 in imx8qxp
> > +                       <3> - select the map for asrc1 in imx8qxp
>
> Is this 4 modes of the h/w or just selecting 1 of 4 settings defined in
> the driver? How does one decide? This seems strange.

The setting is defined in driver.  please see the following definition in
driver.  This is some kind of hard code, for the asrc0 in imx8qm,
we need to set fsl,asrc-clk-map = 0.

+/**
+ * i.MX8QM/i.MX8QXP uses the same map for input and output.
+ * clk_map_imx8qm[0] is for i.MX8QM asrc0
+ * clk_map_imx8qm[1] is for i.MX8QM asrc1
+ * clk_map_imx8qm[2] is for i.MX8QXP asrc0
+ * clk_map_imx8qm[3] is for i.MX8QXP asrc1
+ */
+static unsigned char clk_map_imx8qm[4][ASRC_CLK_MAP_LEN] = {


>
> imx8qxp should perhaps be a separate compatible. Then you only need 1 of
> 2 modes...
>
Yes, that is an option.  If you agree that we can use fsl,asrc-clk-map to
distinguish the clock mapping defined in driver,  I can do this change that
add new compatible string for imx8qxp.


Best Regards
Wang Shengjiu
