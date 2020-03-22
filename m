Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE6318E778
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 09:04:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lVR94z4CzDrfQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 19:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aaQ6VVng; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lVPY3LvwzDrTP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 19:03:12 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id h14so11958674qke.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXVv3O+6eypP6m1WWp+RaUMVY3oNb3TdV/pq+HroePk=;
 b=aaQ6VVngPHL4EX4wx6NHsYw7h7DHQ+Co8ZaQT3+ricC2dvlwjh+yjYyPlppiu5w/2k
 tgkrJS24DpcYVsN2SpS/m73nsrtXWgQIGP7QgVvGNH4yAQ2CJE9QjUVZJ1VfIBICkwH0
 qvjOKpniEAAWaNNgl1uYm8KivgOm5uRZc3en9aqZAAXmjfpsLdzzCP8ek3KY89OLurBW
 p8wpNTqbZFt4IZED75rsXMFWhez2a+r2ZHH7FKSFRHG8M5QY8gx/87zDOMkj8C1jj4EB
 9HF/lMB0LHe6RNVgiVSRzidRYxSbSPJc6tZgDTmiQKo3kSc125VgkAv7i4O5/7LQZ10t
 gVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXVv3O+6eypP6m1WWp+RaUMVY3oNb3TdV/pq+HroePk=;
 b=g4whEenBKHSkQbheeSgETpOZky5zs5CfD9x1h3riiwz5OCbuPbESEgbTa9FI8/9qFy
 MmWL+gFs0NNlhtp/BeBvLNA/jlLrfLZ4jVXjadxTsghxJ42diBK9kBebE81tRRycG1fz
 iqAHVlpjp1ZJxFSGSv+nsFkLfu6EJzh6X+IjsXZHK9QDoXG2EhpHpCJ1bOj3KQtC29M7
 EakZmSHFn5xLyTzSFIbE+keQv6dSHXwnEx01+4oWZ559UEnCSo+VaHxyo8OOUavGPI9B
 DuW6t53b5yCE9DAdkoiDu1iM1cZ51UitCmZAUcNLGfIooS7/BYR7Kb1VK9ZckBrxrEIP
 ERwQ==
X-Gm-Message-State: ANhLgQ0Im87eXU6eKK0+ZXU2qUXVKAURCDSpjLROXuKHzEyunnEa4xp3
 2nZXCOUAkXMti9nzmbqsuoh/9mTxNvbfPLj09ig=
X-Google-Smtp-Source: ADFU+vv15vjlLfsa664H8VI+98Ko/0kGJBPM66yGAqwLj6B2pgF+uXCCQ0y20KBRdMdMu0RQlW+glQ8BaD4Y4HxhOxA=
X-Received: by 2002:a37:4a85:: with SMTP id
 x127mr16083800qka.152.1584864189047; 
 Sun, 22 Mar 2020 01:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <71b6ad3d0ea79076fded2373490ec1eb8c418d21.1583725533.git.shengjiu.wang@nxp.com>
 <20200320174812.GA27070@bogus>
In-Reply-To: <20200320174812.GA27070@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 22 Mar 2020 16:02:57 +0800
Message-ID: <CAA+D8AMC0fuTxDiWEjOVx11eDuGb9WeMhFTzxFx-3fYKvf=-jw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 21, 2020 at 1:50 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 09, 2020 at 11:58:33AM +0800, Shengjiu Wang wrote:
> > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > IP module found on i.MX8MN.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > new file mode 100644
> > index 000000000000..ff22f8056a63
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > @@ -0,0 +1,101 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^easrc@.*"
> > +
> > +  compatible:
> > +    const: fsl,imx8mn-easrc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mem
> > +
> > +  dmas:
> > +    maxItems: 8
> > +
> > +  dma-names:
> > +    items:
> > +      - const: ctx0_rx
> > +      - const: ctx0_tx
> > +      - const: ctx1_rx
> > +      - const: ctx1_tx
> > +      - const: ctx2_rx
> > +      - const: ctx2_tx
> > +      - const: ctx3_rx
> > +      - const: ctx3_tx
> > +
> > +  fsl,easrc-ram-script-name:
>
> 'firmware-name' is the established property name for this.

will use "firmware-name"

>
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/string
> > +      - const: imx/easrc/easrc-imx8mn.bin
>
> Though if there's only 1 possible value, why does this need to be in DT?
>
> > +    description: The coefficient table for the filters
>
> If the firmware is only 1 thing, then perhaps this should just be a DT
> property rather than a separate file. It depends on who owns/creates
> this file. If fixed for the platform, then DT is a good fit. If updated
> separately from DT and boot firmware, then keeping it separate makes
> sense.
>
The firmware is not fixed for the platform, it is updated separately from
DT.  So we can keep it separately.

best regards
wang shengjiu
