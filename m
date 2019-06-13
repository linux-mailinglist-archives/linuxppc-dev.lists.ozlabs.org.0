Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DC4326E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 05:56:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PVKY0wmTzDrBR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 13:56:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VY1ARRR2"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PVHd4syHzDr69
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 13:54:52 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 81so10900142pfy.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 20:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mKy9mX5Pp1ioIzP2A8hzp0vntRtGgDnY3IkJQGZ2PBw=;
 b=VY1ARRR2PzJXX/T0X0dikiSYlvBOEZzpixIOxb3/mvvoEJvO1W+6VTiUN6qa+hwMMo
 jsl2ys0dkXq4g+DWURE4vjrOA2narBcN4B7lhf7YxeZhy+Z0fu5wAAQFHrloFTYa9bAY
 McCy2tdVTjXdUZYioxoPhBdfF9xPSgXf05UMISQO85e9KsMEvjDb2BwLLkPYMcRNEssg
 h7H455qyD1uCW4Zr8pD6qbBPtHYMzyMsJRpcuPVSkar+w665vxzgBZhRWnurIda6PDgu
 5Rof3ELHIuGjr0Fe4ShBzdXI70oyHYUPHypZZDzQB9bOCqzydNXdWbkpM5J+7NxaoAQ2
 xrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mKy9mX5Pp1ioIzP2A8hzp0vntRtGgDnY3IkJQGZ2PBw=;
 b=ssIUb2/XKJG7LIRGbOcIEH5t9RYvKNQ4pDUuwX0BfX9YUV3uSVgNRRVEB6jPyVcAw9
 yRztvhr6sGdwKRQF2U29vuwPkK6HQhdcCfU46f63JDK4/Cn/8QGed/cD3rSARXZBd36y
 qCm2G8hTkf5o8E/wqgsHGJhg7GCPeM76t3Hq8zGsZMJgbCfbyaeOTQK66x54gpCuyryC
 IVIJ0efBpLdhqOyI55nThnScO9+Flm7ZPRP43nE3/5RuDsS0orcomkUe0ms58aBLHpfR
 7C/tqhkoIv+xeMxT2FJyVcsyVX4d/hkK1SYXG2cK8KTL56ibNV4yjM27woO0tBQSusuM
 dDTw==
X-Gm-Message-State: APjAAAWCT+MnveMNOGijKyB1QyTVkNdKHLDH7mhAhBYBUmZe3bLF4d23
 zOVlO/55HmhE1YP6wqIO230=
X-Google-Smtp-Source: APXvYqzRZrUpdn80GYYwHJcJVav31KYzUN1LPr7q/EkOEPciQgLl7crthZ3eONR3VME76glRiBDUmQ==
X-Received: by 2002:a65:5304:: with SMTP id m4mr27956862pgq.126.1560398089063; 
 Wed, 12 Jun 2019 20:54:49 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 y22sm994911pgj.38.2019.06.12.20.54.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 20:54:48 -0700 (PDT)
Date: Wed, 12 Jun 2019 20:54:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR and TX0~5
 registers are non volatile"
Message-ID: <20190613035434.GA7692@Asurada>
References: <VE1PR04MB6479D4B1D5F00B07C5CECC5BE3EF0@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479D4B1D5F00B07C5CECC5BE3EF0@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Thu, Jun 13, 2019 at 03:00:58AM +0000, S.j. Wang wrote:
> > Commit 8973112aa41b ("ASoC: fsl_esai: ETDR and TX0~5 registers are non
> > volatile") removed TX data registers from the volatile_reg list and appended
> > default values for them. However, being data registers of TX, they should
> > not have been removed from the list because they should not be cached --
> > see the following reason.
> > 
> > When doing regcache_sync(), this operation might accidentally write some
> > dirty data to these registers, in case that cached data happen to be
> > different from the default ones, which might also result in a channel shift or
> > swap situation, since the number of write-via-sync operations at ETDR
> > would very unlikely match the channel number.
> > 
> > So this patch reverts the original commit to keep TX data registers in
> > volatile_reg list in order to prevent them from being written by
> > regcache_sync().
> > 
> > Note: this revert is not a complete revert as it keeps those macros of
> > registers remaining in the default value list while the original commit also
> > changed other entries in the list. And this patch isn't very necessary to Cc
> > stable tree since there has been always a FIFO reset operation around the
> > regcache_sync() call, even prior to this reverted commit.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > Hi Mark,
> > In case there's no objection against the patch, I'd still like to wait for a
> > Tested-by from NXP folks before submitting it. Thanks!
> 
> bool regmap_volatile(struct regmap *map, unsigned int reg)
> {
>         if (!map->format.format_write && !regmap_readable(map, reg))
>                 return false;
> 
> 
> Actually with this patch, the regcache_sync will write the 0 to ETDR, even
> It is declared volatile, the reason is that in regmap_volatile(), the first
> condition
> 
> (!map->format.format_write && !regmap_readable(map, reg))  is true.
> 
> So the regmap_volatile will return false.

Interesting finding.....so a write-only register will not be treated
as a volatile register (to avoid regcache_sync) at all....

> And in regcache_reg_needs_sync(), because there is no default value
> It will return true, then the ETDR need be synced, and be written 0.

Looks like either way of keeping them in or out of volatile_reg list
might have the same result of having a data being written, while our
current code at least would not force to write 0.

So I think having a FIFO reset won't be a bad idea at all. And since
our suspend/resume() functions are already doing regcache_sync() with
a FIFO reset, we can just reuse that code for your reset routine.

Thanks a lot
Nicolin
