Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCDB4432
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 00:45:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XLsh6mGbzF3Yy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 08:44:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IMUR9inG"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XLqh3JjWzDqxX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 08:43:09 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id z12so804094pgp.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 15:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cBZmVkDcKZz5zZDlHp5T39g0CCRjx154L73p3yLa6i4=;
 b=IMUR9inG/mwmcrmffeDDt03n3boFWWZwMhpmFtIhuW8MN3yX8L6SCfAknaT4kLGDek
 EmwPLX+yhIByGkpmzhWfqSRoaR7D+GP1+JsN6zESyBBEhY4/5gI8nMNniKe7bqG3Gz4Y
 J+7jHPs6G4CvZ6ISiAoqmiuxErUqWwN20jkVflyBHSJyyC5P5eC4nsbKU/6k5b5mIrcD
 +2aEeJBo3jI8jejEICUuxrdguC4UfvQk5UhGhGPwP16lX2YJIT3LZHAY3tDo1icmdAHF
 QO0IhVJ8HWw/wgmmG56RiGW3i52MvGam0j52TJU61KU9TOhCMhdPXu44fqDnPiBjpuGZ
 7+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cBZmVkDcKZz5zZDlHp5T39g0CCRjx154L73p3yLa6i4=;
 b=uIEjZnbd66zevUeQII7AZtRBY4+mrWsPtQg/LmQLVs7D9xkY+73tGg4KwbTRuosffV
 89/Es+sg/gXmmZjLF37AukDB4hAFB/+0YNtD6mgS1h9gGUMz5lZSqs0teVXS5IBSyeAV
 5ZQXkp1fmVPmfE5GpiWq6+L9A1CDwOIrj8TdasS2K3IDuYtnIEtPt5w+o4rr+7+no9Nw
 MmkXujsSBhiJPtS9zi7uPGYCNZ6YQk+pM6kl8BtQqI+2fffdCvMn1M8/roz0A1R/Dwtc
 bOR+m+g2XHy9gi1Em8hpznsjxKu0GjRfm7CQJfEaWYIIH80cyyf28n3FUB9IlOhkvm8y
 ASMw==
X-Gm-Message-State: APjAAAXb+trF8dNxWU7H6YhLW6PW019ZqkvmhhOA/wWSdEdm9BY/Ppfy
 ERSz9juZ8gLxseTXIFgqKHo=
X-Google-Smtp-Source: APXvYqwB6gvQcdks+jrYjCow1jWYalLI0aO/HIFRY6W9E6qaFAat/V97b6+aesqJTosfdItuAgcG0Q==
X-Received: by 2002:a17:90a:9201:: with SMTP id
 m1mr1736979pjo.58.1568673786005; 
 Mon, 16 Sep 2019 15:43:06 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u4sm124058pfu.177.2019.09.16.15.43.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Sep 2019 15:43:05 -0700 (PDT)
Date: Mon, 16 Sep 2019 15:42:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [EXT] Re: [PATCH 2/3] ASoC: fsl_asrc: update supported sample
 format
Message-ID: <20190916224244.GA12789@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20190912235103.GD24937@Asurada-Nvidia.nvidia.com>
 <VE1PR04MB6479A4161F9C71FD394A3DA9E3B30@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479A4161F9C71FD394A3DA9E3B30@VE1PR04MB6479.eurprd04.prod.outlook.com>
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
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2019 at 05:48:40AM +0000, S.j. Wang wrote:
> Hi
> 
> > 
> > On Tue, Sep 10, 2019 at 02:07:25AM +0000, S.j. Wang wrote:
> > > > On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > > > > The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> > > > > should not be supported, it is word width is 20bit.
> > > >
> > > > I thought 3LE used 24-bit physical width. And the driver assigns
> > > > ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit
> > > > would go for that 24-bit slot also. I don't clearly recall if I had
> > > > explicitly tested S20_3LE, but I feel it should work since I put there...
> > >
> > > For S20_3LE, the width is 20bit,  but the ASRC only support 24bit, if
> > > set the ASRMCR1n.IWD= 24bit, because the actual width is 20 bit, the
> > > volume is Lower than expected,  it likes 24bit data right shift 4 bit.
> > > So it is not supported.
> > 
> > Hmm..S20_3LE right-aligns 20 bits in a 24-bit slot? I thought they're left
> > aligned...
> > 
> > If this is the case...shouldn't we have the same lower-volume problem for
> > all hardwares that support S20_3LE now?
> 
> Actually some hardware/module when they do transmission from FIFO
> to shift register, they can select the start bit, for example from the 20th
> bit. but not all module have this capability.
> 
> For ASRC, it haven't.  IWD can only cover the data width,  there is no
> Other bit for slot width.

Okay..let's drop the S20_3LE then. But would it be possible
for you to elaborate the reasoning into the commit message
also? Just for case when people ask why we remove it simply.

Thanks
