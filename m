Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B18816FF59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:53:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SG224J8mzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:53:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vo8zTNll; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SFYH4TbRzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 23:32:03 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id u124so2370449qkh.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0MRsXhRp3E6rh2+qvZmIeFVHR93AAhtRNYB0tmbFEVY=;
 b=Vo8zTNllfC4o6nND7kLPoDV7V03+PGLD04JqV7MNWSx0oObQWxHlaEfGIBrdyHaRvJ
 ww2vSmC4bRv8i6hcU8VBeY2YhfMDKdaS6MfQUPq1T7fZxrXW5NTcxlG8C521XtoJJQOx
 AlBGmyqtGt3YFgb2TnObOZnHZNWjm9XEp7X9sF25doQduHp62/V02ifg2v+zkJGjLGie
 X240XCgFRjloBM3RFAwEtFylPsHPRhwNYVxOXI3L4Uz4qTKOe116ebQmBoaKfuWsL/+e
 cjoSbJV9c9LPLH4pAIgZn619ZEH4FQ8oRR3Ud3Vo+NF1ywIf8ZBsAIOqEb9XriCWX05L
 N/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0MRsXhRp3E6rh2+qvZmIeFVHR93AAhtRNYB0tmbFEVY=;
 b=fMRGUjHlxYM8pUatsJ5RMGkYJ8x8QmMWnTx2FGlazmU5hZEjW2uztUR8PRxYgCDbhs
 Ei+s02SZCb5dTLCZir+2Gwfm7Hrbt1D5/8pcAUff4rVunEHzX+U+BlHE05Qaf9qXg5vp
 ONuS8A/HCTKpnWzJuNHhWurA8Cz3D/VqLIoPEODHjZ8a92aHT/cGBgVMTinlR/4qChQi
 iw4cjeKgCF5EmJA51yGGttKPsznc2WCju54J23z/WJyYQEbBkefRo3YjmDDkcRT/1uG2
 q7QbvgGpwWFsf8Zd67SsvyLJpW5rxrolu/S7TXbuJxHxjxs9W9IPVUDBB47oRiAomXpG
 8Y3Q==
X-Gm-Message-State: APjAAAUPoiXp438WoQBYcuj1pX2PLVw57fTTfVyO04fDHJX2+OemfWi4
 yYagXeiL5JHJ9RBqexAOjxnbTAFP/G3ipfzJp5E=
X-Google-Smtp-Source: APXvYqzT0QOBpKRKbC4kcg/YNxuLy3cnTrGuXc9LH9ek2oNBn/hVko38x0Hlgj0xhIw5szgawcSuZNLgT142188LFQs=
X-Received: by 2002:a37:a8c3:: with SMTP id r186mr5306087qke.37.1582720319288; 
 Wed, 26 Feb 2020 04:31:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
 <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
 <20200219203706.GA25618@bogus>
In-Reply-To: <20200219203706.GA25618@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 26 Feb 2020 20:31:48 +0800
Message-ID: <CAA+D8AMrHHZ3U66z+jroZqLK8pnn7xF0A9MCzxAqdqDfUHxf2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: fsl_easrc: Add document for
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

Hi

On Thu, Feb 20, 2020 at 4:38 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Feb 18, 2020 at 02:39:36PM +0800, Shengjiu Wang wrote:
> > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > IP module found on i.MX8MN.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
>
> Bindings are now in DT schema format. See
> Documentation/devicetree/writing-schema.rst.
>
Thanks, will switch to .yaml format.

best regards
wang shengjiu
