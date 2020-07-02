Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E78212C7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:44:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yRpF2BCmzDr2k
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:44:21 +1000 (AEST)
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
 header.s=20161025 header.b=JsFN61eC; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRmF6jG9zDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:42:37 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id a9so2399512pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tbX9gnwNkjOzk/98d8BFqWlU3Yk39GHs2cPsD7jbrXM=;
 b=JsFN61eCI+fVmsDGKjx3xNcUB9PTWSDRaIF3nEA7cb13QIkZmIqYDssIQvKF2ony9w
 Bc/I8YIpo/DNOqg01APimdwuBKsysstKm3eNWmiCC3L/WkvKtEItiHdW/NHiV9JLIy2p
 HHTSap5HMi/MV+wih89HXnkggCyyyijeIt1gDdczQXVBEUvk5m8LIl6T18qw1O504bYW
 FNnUrxwdVjGvbXXZTLejVs98ZvwYFj8GJ/b87XNnMV+MkQ6DuZtq5a6uUyTj4NWjs7G1
 JUrHAvMaz6Hoel+1vWArGEnqsSgZTzcuLoyH6nNKRM2GUj/N382/u5XK3EnAfr8XtJJE
 FMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tbX9gnwNkjOzk/98d8BFqWlU3Yk39GHs2cPsD7jbrXM=;
 b=GUbwALa+ub0jAsLqj137V4XbGWodZNGexHlTO2dSsK2iE7lj66DlENNnTpNXUWUfq6
 RazxUADwS4togFMRxNAKsnE8973q4mthj+UFWSIhuJhGeTQuMI5tcqdJn70swFwyTcMJ
 St20ohmU5h7XR4Fjw2c49TtphONacB1UnTyGN6CwscwYIh88EeMjWWnTX0co8fVTw547
 tWC5ij+WnRK3SZbr29yrT5pDcCYK/UsqXViPECMYc6i2zFxb7o4B4LHET9lYFWHIxNry
 Ylam+SCx/x8qFtbpGVZP0Bptcd3aLTDhjakz/peCzxQD+eReRRSxjyFb3qYlXLT/o0+D
 2xUw==
X-Gm-Message-State: AOAM5302L1vRsYYhk1BeR7XsNuArj3BDTOxuVYnfXLgoRAHCKQe2xHXL
 5DOmzQCInt1mVaQGjkmqSMY=
X-Google-Smtp-Source: ABdhPJzmKId/+K9zaOkh/BstpizWZM6xvVYuyR3syVZrxtWMXg/kTWp1q3xysYJLElQ8cgvSAK8/BA==
X-Received: by 2002:a17:90a:290e:: with SMTP id
 g14mr30210537pjd.85.1593715354041; 
 Thu, 02 Jul 2020 11:42:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y7sm8819228pjy.21.2020.07.02.11.42.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:42:33 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:42:26 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200702184226.GA23935@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnaud,

On Thu, Jul 02, 2020 at 04:22:31PM +0200, Arnaud Ferraris wrote:
> The current ASRC driver hardcodes the input and output clocks used for
> sample rate conversions. In order to allow greater flexibility and to
> cover more use cases, it would be preferable to select the clocks using
> device-tree properties.

We recent just merged a new change that auto-selecting internal
clocks based on sample rates as the first option -- ideal ratio
mode is the fallback mode now. Please refer to:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200702&id=d0250cf4f2abfbea64ed247230f08f5ae23979f0

Having a quick review at your changes, I think the DT part may
not be necessary as it's more likely a software configuration.
I personally like the new auto-selecting solution more.

> This series also fix register configuration and clock assignment so
> conversion can be conducted effectively in both directions with a good
> quality.

If there's any further change that you feel you can improve on
the top of mentioned change after rebasing, I'd like to review.

Thanks
Nic
