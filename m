Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0662D3E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 03:01:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jPCN55bZzDqQq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 11:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jOogLk7R"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jP7F36YZzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 10:57:43 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id u14so7228058pfn.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ovvmvLXcN2WNj4sNwe4p/Xee5jrLgpchDLjIPq6YmSs=;
 b=jOogLk7Rn8Qffuitf+GhyMJJEvfkhY9IoNwS0oiC7kgcxvC7hcWLNLfZCUrkWrDkCt
 wzgyXYIcGChGJDMVffK9I1JdgAzPspuhFwRarpxbV5ScMXNuEvxZrvEDGbU9z1nQ4Pby
 C1yDzOfctZM5xNzF2j2UiOwnIsTn51sw0qWaQVMSzViDl+vwipjaZe3fUkopGq3l/Wbx
 tt9cdaScy+RIVLtLU3i1ovTXtDGK1YWnixyAl+r9uq9Helzuk0UuLWE7CoJP4gsVraSN
 4HLbVTv9AgzQmw/bN8ZC1ZEZN6TgykRtfBo51TTpeNsibZ2dTmm3NDlHDEP7S8r4r5/M
 F3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ovvmvLXcN2WNj4sNwe4p/Xee5jrLgpchDLjIPq6YmSs=;
 b=WM4VT2T2gkqyBYuRRa0aWFUnYXSO1yX1AIECj5Kxu2ZHy5bE+VMHbDTB+MHsv6s+Or
 JIC+lbx6dMtoMGEokNMJBnOvDabCDsPhnMd3FtdAAUjwee7LCtTdyQreY0IYwnotjzhu
 vcEnV8AA9I+cvSyq9Jl3rykRaTg8kKu+mlihv/TQI0Gkec/jPJ+FWwcwv3bHBsHq6JMk
 R1m1weD2F4h7qm/bmr4Hul8mBRaAmF0WIIsS+zecCBxRB/Ylg7I7IYxpXnprAXEeLkEk
 pVxm53/AXw1StrVgOEcBdSuYikKWDHlV0gKD3yI9WkS8NDiJ/HWmevqZ8Bs09QtOoyog
 hhTA==
X-Gm-Message-State: APjAAAWi+7EYKgeUKJ4VFkTdmYxC9U4ygRhxyXTa3h/8prNdRE/CM/dF
 U29Ta77Lkj5XOEuazZ/0E3Y=
X-Google-Smtp-Source: APXvYqzSNUuTjgHJHseb1sIy2Pn9KXojzGnULdltP79uHnrMd5CKKPPe2fjbRm0R5Ggc8XUaiEF+bw==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
 t20mr29371769pjr.8.1562633861026; 
 Mon, 08 Jul 2019 17:57:41 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q1sm32442857pfn.178.2019.07.08.17.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jul 2019 17:57:40 -0700 (PDT)
Date: Mon, 8 Jul 2019 17:58:10 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after xrun
Message-ID: <20190709005809.GA28003@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB64796C22C2D41B9A45E726BEE3F50@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64796C22C2D41B9A45E726BEE3F50@VE1PR04MB6479.eurprd04.prod.outlook.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 05, 2019 at 07:03:47AM +0000, S.j. Wang wrote:
> > 
> > > +
> > > +     /* restore registers by regcache_sync */
> > > +     fsl_esai_register_restore(esai_priv);
> > > +
> > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > > +                        ESAI_xCR_xPR_MASK, 0);
> > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > > +                        ESAI_xCR_xPR_MASK, 0);
> > 
> > And just for curious, can (or shall) we stuff this personal reset to the reset()
> > function? I found this one is a part of the reset routine being mentioned in
> > the RM -- it was done after ESAI reset is done via ECR register.
> > 
> 
> There is a problem to do this, TPR/RPR need to be clear after configure the control
> register. (TCCR, TCR). So it seems not only one place (reset function) need to be
> changed.

Do you know (or remember) why we suddenly involve this TPR/PRP?
The driver has no problem so far, even if we don't have them.

The "personal reset" sounds like a feature that we would use to
reset TX or RX individually, while this hw_reset() does a full
reset for both TX and RX. So I wonder whether they're necessary.
