Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB716F5DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 03:57:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S0pD2jTFzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:57:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Moy0oe77; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S0mP6pK4zDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 13:55:47 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id r67so627940pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 18:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bfSVMJ6Zntz6A9BJaM12dNm4EQGGybEoHbVncbTsUMA=;
 b=Moy0oe77F1nP33WomY+/yVeQF9YOUm9A+K2Dmya3vWO3y1gDf7kXx+ARQoGIqJsbcn
 sPDlocDXHhiYZjO+XyXUp5tQV8BJw2C7x+2ghY8gYyPWFQ7qduGfKCkjbgpdinZcGNjB
 WxhCMHnCKG0c8t5hywtULwpBqj4C0bP6PHBAoxnZH9WUICVJuyrYV1mqj2wAShGjfCs6
 tIJzuV4Fe3jr6nyPLQ/HjFbLHYzt3rgUTWbLX8hMswIRiB57T3uJgkHbl/XIWiXtE5Fv
 PNehsU30K6Pj2wGG2X6MPSgieuIgHYhU1Oya8m/3JHtMlRpQXMzTlhwP7/IXW+Pi/+xR
 gauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bfSVMJ6Zntz6A9BJaM12dNm4EQGGybEoHbVncbTsUMA=;
 b=rrE6ChQmfkfDCTaEA4uVVQ1/1N/OebfSAIPFG10FkkzsbbOAFzvJCsAxgkef1TC9Yu
 0ASP91O7ctqtWslxaYC5U+LV2jlzefoX8tkbiLL0qoHWleK0HTJfMurJqLmJk4QsX4OZ
 AFboARMT4aSTVqBlDmFmlXodzU4mGsu52dPu4p+S+hjCHMvcjgX/9A/DfSLmiPm4O7Fl
 LYDMaXW520FORcw9yro9nUNibjMYjZyj5YqozLsWGm4eMAvot/hX2bIxq8b3qvdjHOwm
 NPWEfNflibyOTIK+0wILUUlCRkdKKkU0GZV+oj68FhuT8836TzWCyCxoe6j6/Ko+uBc0
 lgBQ==
X-Gm-Message-State: APjAAAXCxN3W25e/6i+AMJDja5Qc2Q41Hlhuactr7hMnMF2pwwIOSiiy
 fFlsTk0Gkeq3gH4H1AAtvrI=
X-Google-Smtp-Source: APXvYqxX5rlyRMCuaRBBYuYMduxdjpm5x24xmrS5n9R3CJux7Jc4o6x9N7kxgP+pNGY/fDI9hDV73g==
X-Received: by 2002:a17:902:9f88:: with SMTP id
 g8mr1790693plq.100.1582685743306; 
 Tue, 25 Feb 2020 18:55:43 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id l13sm444798pjq.23.2020.02.25.18.55.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Feb 2020 18:55:43 -0800 (PST)
Date: Tue, 25 Feb 2020 18:55:40 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
Message-ID: <20200226025540.GA22445@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB6479BCA376502F6F1251602BE3EC0@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20200225080350.GA11332@Asurada>
 <CAA+D8AMFzDs8uXiR-N8harRVmhC+3i8p9HdO2CgxOCX8WVfXAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AMFzDs8uXiR-N8harRVmhC+3i8p9HdO2CgxOCX8WVfXAw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 09:51:39AM +0800, Shengjiu Wang wrote:
> > > > > +static const struct regmap_config fsl_easrc_regmap_config = {
> > > > > +     .readable_reg = fsl_easrc_readable_reg,
> > > > > +     .volatile_reg = fsl_easrc_volatile_reg,
> > > > > +     .writeable_reg = fsl_easrc_writeable_reg,
> > > >
> > > > Can we use regmap_range and regmap_access_table?
> > > >
> > >
> > > Can the regmap_range support discontinuous registers?  The
> > > reg_stride = 4.
> >
> > I think it does. Giving an example here:
> > https://github.com/torvalds/linux/blob/master/drivers/mfd/da9063-i2c.c
> 
> The register in this i2c driver are continuous,  from 0x00, 0x01, 0x02...
> 
> But our case is 0x00, 0x04, 0x08, does it work?

Ah...I see your point now. I am not very sure -- have only used
in I2C drivers. You can ignore if it doesn't likely work for us.
