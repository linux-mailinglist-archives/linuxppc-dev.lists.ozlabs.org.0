Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D847AD994
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 15:51:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fgmbfV17;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvPS74s73z3cg5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 23:51:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fgmbfV17;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvPRC44PVz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 23:51:00 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ACB520003;
	Mon, 25 Sep 2023 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695649855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKSyVssNGXpwuZBiOav013PZuKtEgGXdrsg4u/3aceE=;
	b=fgmbfV17sTrAXSP+UGikfGs9yRQIdCNszisJ3LPyj2bUqQe1En3z/EC2zeVfOpL7dQ0Sor
	9vdQFy3t7fAOBR5a3cLGQehT6l6ajmK2WOA4+os/9/aBAwlVEnitY5D2Ow0i21bM2BjumD
	jQTvGRiyNEQowpG4VGdyGMh5upTVvN9eABTermy5HVNLWnE8hc9McGf+2WDa5BvyvCdokN
	uvrD05smenth7Nvk2vVvonZ8TK2huLy7epZzwJrek6H+Pv7rv8GLThplybWlnvvhYPNdhI
	ZUNQpGTv54ppl9bVicKKao5kcVqcYeuX7P55RXWU9LbMiC0Halam01cJpahvvg==
Date: Mon, 25 Sep 2023 15:50:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230925154929.2b6a9cab@bootlin.com>
In-Reply-To: <e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-9-herve.codina@bootlin.com>
	<5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
	<20230925101703.1bf083f1@bootlin.com>
	<5b804a1a-6bfd-429d-ad84-696b7ecef72d@linaro.org>
	<20230925122758.43963736@bootlin.com>
	<e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Si
 mon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Sep 2023 12:44:35 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 25/09/2023 12:27, Herve Codina wrote:
> > On Mon, 25 Sep 2023 10:21:15 +0200
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >   
> >> On 25/09/2023 10:17, Herve Codina wrote:  
> >>> Hi Krzysztof,
> >>>
> >>> On Sat, 23 Sep 2023 19:39:49 +0200
> >>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >>>     
> >>>> On 22/09/2023 09:58, Herve Codina wrote:    
> >>>>> The QMC (QUICC mutichannel controller) is a controller present in some
> >>>>> PowerQUICC SoC such as MPC885.
> >>>>> The QMC HDLC uses the QMC controller to transfer HDLC data.
> >>>>>
> >>>>> Additionally, a framer can be connected to the QMC HDLC.
> >>>>> If present, this framer is the interface between the TDM bus used by the
> >>>>> QMC HDLC and the E1/T1 line.
> >>>>> The QMC HDLC can use this framer to get information about the E1/T1 line
> >>>>> and configure the E1/T1 line.
> >>>>>
> >>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >>>>> ---
> >>>>>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 24 +++++++++++++++++++
> >>>>>  1 file changed, 24 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> >>>>> index 82d9beb48e00..61dfd5ef7407 100644
> >>>>> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> >>>>> @@ -101,6 +101,27 @@ patternProperties:
> >>>>>            Channel assigned Rx time-slots within the Rx time-slots routed by the
> >>>>>            TSA to this cell.
> >>>>>  
> >>>>> +      compatible:
> >>>>> +        const: fsl,qmc-hdlc      
> >>>>
> >>>> Why this is not a device/SoC specific compatible?    
> >>>
> >>> This compatible is present in a QMC channel.
> >>> The parent node (the QMC itself) contains a compatible with device/SoC:
> >>> --- 8< ---
> >>>   compatible:
> >>>     items:
> >>>       - enum:
> >>>           - fsl,mpc885-scc-qmc
> >>>           - fsl,mpc866-scc-qmc
> >>>       - const: fsl,cpm1-scc-qmc
> >>> --- 8< ---
> >>>
> >>> At the child level (ie QMC channel), I am not sure that adding device/SoC
> >>> makes sense. This compatible indicates that the QMC channel is handled by
> >>> the QMC HDLC driver.
> >>> At this level, whatever the device/SoC, we have to be QMC compliant.
> >>>
> >>> With these details, do you still think I need to change the child (channel)
> >>> compatible ?    
> >>
> >> From OS point of view, you have a driver binding to this child-level
> >> compatible. How do you enforce Linux driver binding based on parent
> >> compatible? I looked at your next patch and I did not see it.  
> > 
> > We do not need to have the child driver binding based on parent.  
> 
> Exactly, that's what I said.
> 
> > We have to ensure that the child handles a QMC channel and the parent provides
> > a QMC channel.
> > 
> > A QMC controller (parent) has to implement the QMC API (include/soc/fsl/qe/qmc.h)
> > and a QMC channel driver (child) has to use the QMC API.  
> 
> How does this solve my concerns? Sorry, I do not understand. Your driver
> is a platform driver and binds to the generic compatible. How do you
> solve regular compatibility issues (need for quirks) if parent
> compatible is not used?
> 
> How does being QMC compliant affects driver binding and
> compatibility/quirks?
> 
> We are back to my original question and I don't think you answered to
> any of the concerns.

Well, to be sure that I understand correctly, do you mean that I should
provide a compatible for the child (HDLC) with something like this:
--- 8< ---
  compatible:
    items:
      - enum:
          - fsl,mpc885-qmc-hdlc
          - fsl,mpc866-qmc-hdlc
      - const: fsl,cpm1-qmc-hdlc
      - const: fsl,qmc-hdlc
--- 8< ---

If so, I didn't do that because a QMC channel consumer (driver matching
fsl,qmc-hdlc) doesn't contains any SoC specific part.
It uses the channel as a communication channel to send/receive HDLC frames
to/from this communication channel.
All the specific SoC part is handled by the QMC controller (parent) itself and
not by any consumer (child).

Best regards,
Hervé
