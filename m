Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 640391A912B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 04:57:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4926Tz55TlzDqPR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 12:57:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dyBX2dum; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4926S334K2zDqxV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 12:56:03 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id c12so1019892qvj.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 19:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+pk54KXVRCt6mCeYfu6u1hgghJvTphtuH45b199eug=;
 b=dyBX2dumBT3DX60HltmnArMIt6VdxDUSG499ZJ+SRAW1GNYbaDK0TUKMeEq/aSkESG
 ChLKmTo6et7e8BsIPVwRNLLNO9n/dw8bpcW9L9WweiHlT8y42jKTCt+AeIllZGKe76jU
 RCJUyCb3E7/1slLwAqTMTggJnLfQCt+1pYkAtHgsu7uB3FhuoZHhbfYnkQ+I6xm8NEE6
 FnY3Z833zX6HWbAH1HxGSB0Bo9GqexomPFByl1c6UoTg01cXsev+ZUKRSoBVimBuYroh
 m71L7+eFHi5pdsEosfQhCxZfgq5510wDXejkW+/+V2tIAXptyqXdWbIIQX8BclLlyFL4
 l+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+pk54KXVRCt6mCeYfu6u1hgghJvTphtuH45b199eug=;
 b=SaaVj+xK2w+kK8DhKqOkQO4QpmmX/OSgkt1Xq5uBpzZQReyFrnQh74GSg9+YJYWLBu
 c/oGyuHRlBEC+bjFsAoWir70c1P9r5HD94L+SB1jW7jhn0pfbQW5VNrFgCJaz/TwIDQb
 6/pDyHz9Y8udixdU8+HgJR9ynWEqhFRY3jQ5O5Tet9Ff/OkNAo86yGa/z7Hco4g75BJ4
 Jiov1OJ91rBHQel4/AHj+Ztws8bm06txm8TPANbV8kjvQSwdu8v9PWaacVcYsI5o0OQC
 WNokbx6Eea2ctwxWxA+UhHtzRgMWpPv6e1ELCEUoFGYfO4V0vT9BUPuSMRtx+hu58Ls7
 YpKg==
X-Gm-Message-State: AGi0PuYvaXsVAxbgnV+jr9KDruT2SIFE6IXxOc7dgOWO3PSLC21CvA8x
 xi2IMQEaCvS2es0rJiPmOTYXdYxWT/tkowBSArQ=
X-Google-Smtp-Source: APiQypL6fx5Jo66bviF7emrcPPuSgkq+sExxjq0BShhEl+ej8+MVt0ZP8mIC/3uoA9xgoayPyN+s0Rj7dR5hh4U60L4=
X-Received: by 2002:ad4:46e3:: with SMTP id h3mr3036173qvw.14.1586919359561;
 Tue, 14 Apr 2020 19:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <68208297b49e85adfddf843bc205d154790a49de.1585726761.git.shengjiu.wang@nxp.com>
 <20200414154643.GA29098@bogus>
In-Reply-To: <20200414154643.GA29098@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 Apr 2020 10:55:47 +0800
Message-ID: <CAA+D8AP2CiRT7qkNa7yBDH0Dbd=i1eyqL4g4zobRmR-vEx4VBQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
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

Hi Rob

On Tue, Apr 14, 2020 at 11:49 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 01, 2020 at 04:45:39PM +0800, Shengjiu Wang wrote:
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
> > index 000000000000..14ea60084420
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
> > +  firmware-name:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/string
> > +      - const: imx/easrc/easrc-imx8mn.bin
> > +    description: The coefficient table for the filters
> > +
> > +  fsl,asrc-rate:
>
> fsl,asrc-rate-hz

Can we keep "fsl,asrc-rate", because I want this property
align with the one in fsl,asrc.txt.  These two asrc modules
can share same property name.

best regards
wang shengjiu
