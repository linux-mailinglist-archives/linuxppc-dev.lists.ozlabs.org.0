Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6838A8CA814
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 08:41:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l3rbGvfu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vk4Q066Ctz3g9N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 16:33:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l3rbGvfu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vk4PD2gXtz3dFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 16:32:47 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36c85170db2so14736425ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716273164; x=1716877964; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v5h6PC3m5viZM1uwwljp97r1zeipYab7bRIWScSl2M=;
        b=l3rbGvfuDdUmLCspuAmat3hna0DVUDMJBnD3KE8CX8qgOggR4I9shYgXnZkGwOo/kT
         QhKUS/5I67fiWdI6MkFSQfQKR6V3aAwO2aE8jGxTzg9Cacqs7ETvnzXYRaaab6DptmEY
         l6L6x3BJmNPLI2yAfQo+OjoOqDHRRQnRnBgRnPkQSty6jn22Ua3IjDRYjTWW39wGBy41
         OPvlOoimAnw9cmUh9F9dFkbWuC/Q+MO85NmR5xD4vwNzAP4pCl6z1mgKTHfXQkP8DP8l
         3R2haLso5rgFL/vJY+VklykJVb85LyZHVZFXjuVVRiSal4QyJSQOUBRLfuN+DmTt473F
         pMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716273164; x=1716877964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9v5h6PC3m5viZM1uwwljp97r1zeipYab7bRIWScSl2M=;
        b=wt2e/ARPbNHKls740oAXsw0jVQzSEk5lzdd4cWquX+dFgV3UUnIa9fc1G6RlK4DgNi
         t8691czcM2Ez5b8a6gJtmVmurMdXPeoGQN++eYkC6N0r+XKjiMwFE/ecF3O1EDANEQIL
         ZrvA8GH41Q9VFIN0ozWA2F8K1tbMkHEvdeIM1N6L70Bk90zYS0+rozNGmJmbN3ieQU9O
         GgUyWKDp0dAxPMfrbT9JEdZsqNphP9vq7WoIenVzPwfd71aG0fNnhlNHtv2OAuQL+iGK
         Li3YvRYDJ5aLZwiQp2w/uSLWjKjoqTVDmDQLg1rew6EuuJ4Gl8eb6GU2BZB7akhZmeLb
         Yxmg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Mk32L/O+JycNxft+nx+ckv4Wk2rkeB1aoCl4PAhsDssQdqcDpoLuweNc+LIfJgokni6hSKXXDbrZqQFmYDW+ef6+gEfb4wF9jylxwA==
X-Gm-Message-State: AOJu0YxhSJQ4TncrGsdpqDQc73/bmCLR+A3upxE37zR62hNuq+e/atU3
	jj/zuI7tm2Zib3aEQH98VdAz54eitaWUScand8gfQXDFGYwu2TnaL1hDoGkOAbdPmt12xQcjgaW
	zrpjHw+gFN0OCti3HgnQee35aJIs=
X-Google-Smtp-Source: AGHT+IHxK0DDX2uyvGgjkFhMSHqcRRzxekD6O/b+tOay3l5GstPgFhvbAwzUrXw/5NT70QAMEfkIjbuJ3XTfQfLanXw=
X-Received: by 2002:a05:6e02:1fea:b0:36c:4b17:e06a with SMTP id
 e9e14a558f8ab-36cc148e51amr385802135ab.18.1716273163845; Mon, 20 May 2024
 23:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
 <1715939146-13031-2-git-send-email-shengjiu.wang@nxp.com> <4727a091-bc64-46ea-8652-db6797dd93d2@linaro.org>
In-Reply-To: <4727a091-bc64-46ea-8652-db6797dd93d2@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 May 2024 14:32:32 +0800
Message-ID: <CAA+D8APgcZo4fhmzft83ZFeG2bfF19Ew5Fi4o5Gqh3Ej=OPCuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2024 at 6:47=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/05/2024 11:45, Shengjiu Wang wrote:
> > In order to support the MQS module on i.MX95, a new property
> > "fsl,mqs-ctrl" needs to be added, as there are two MQS instances
> > on the i.MX95 platform, the definition of bit positions in the
> > control register is different. This new property is to distinguish
> > these two instances.
> >
> > Without this property, the difference of platforms except the
> > i.MX95 was handled by the driver itself. But this new property can
> > also be used for previous platforms.
> >
> > The MQS only has one control register, the register may be
> > in General Purpose Register memory space, or MQS its own
> > memory space, or controlled by System Manager.
> > The bit position in the register may be different for each
> > platform, there are four parts (bits for module enablement,
> > bits for reset, bits for oversampling ratio, bits for divider ratio).
> > This new property includes all these things.
>
> ...
>
> >
> >    clocks:
> >      minItems: 1
> > @@ -45,6 +46,22 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  fsl,mqs-ctrl:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 6
> > +    maxItems: 6
> > +    description: |
> > +      Contains the control register information, defined as,
> > +      Cell #1: register type
> > +               0 - the register in owned register map
> > +               1 - the register in general purpose register map
> > +               2 - the register in control of system manager
> > +      Cell #2: offset of the control register from the syscon
> > +      Cell #3: shift bits for module enable bit
> > +      Cell #4: shift bits for reset bit
> > +      Cell #5: shift bits for oversampling ratio bit
> > +      Cell #6: shift bits for divider ratio control bit
>
> Thanks for detailed explanation in commit msg, but no, please do not
> describe layout of registers in DTS. For the syscon phandles, you can
> pass an argument (although not 6 arguments...). Usually this is enough.
> For some cases, like you have differences in capabilities of this device
> or its programming model, maybe you need different compatible.
>
> If these are different capabilities, sometimes new properties are
> applicable (describing hardware, not register bits...).
>
The main difference between the two instances on i.MX95 is the register
difference. looks like I need to use two compatible strings:
      - fsl,imx95-aonmix-mqs
      - fsl,imx95-netcmix-mqs
to distinguish them.

best regards
Shengjiu Wang

> Best regards,
> Krzysztof
>
