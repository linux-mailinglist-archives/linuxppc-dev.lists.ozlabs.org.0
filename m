Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54341B16CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 01:56:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TwdX64wjzF4dd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 09:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pXYgnB8v"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TwbT27MCzF52l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 09:54:13 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id y10so12428982pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=epB8CH0IOuw5TsX1fUGnwbGIVGe9v0LlpjCzGxP60TQ=;
 b=pXYgnB8v9vuvLFdz1UIqGnHVmsaO3b0KOiGh94bEt4QtpedVNNzipx+iIyYTwI9Obp
 XO2uCQ95ITV+w4RvV4PyxkNHy+kpiezsIVRJv8PAJogfMw2vTb9xDyWb7D3JhTT3iT0B
 jvM76OsIptNMydQYZA9B5ztqtWw1qSuDVXvMIbL6N0t1jesIi2xmx2Yha5x/RhMVF3KB
 BgW/7PYc2HrGuo52dVHBTSxe80oMM70A8aPVWGjpJDye5OCJLyXU+7hak0kxTsR47VwG
 KCbqs5X+Aq8SymUGWQCh/dFK4DIJ4Lz0VTuEDEPWhLWLNLekup1nd+lkC13UMqbwrmqA
 +NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=epB8CH0IOuw5TsX1fUGnwbGIVGe9v0LlpjCzGxP60TQ=;
 b=bHcHHQD6a8JIXkyu2q1SEQd3OawyxJ1BD1Meb+BEQ0AXfT5+MCf+GiECLEhn6tZ6Lf
 xu3pIGZyJyMFBrqOvLlKJlOYLKUCGhFntuZlbFRapSILTmcTaY3zbJ2eXgw6qqCgAS1F
 xrB8SgyNhGQ4975T79IQrTv/Xg1fpSVsVg8pgU5ImqzbKW9RSSM4Juga0BdDh2uHtcns
 214+Y2cK8R/SoJPWJ4FvkvlD9Fe031ULCO15L2pWiaONKPc06gK6McAtqZdHVWxYk3Jj
 JaGiuURtukoL9kfD/0J/i2GK9PK7VSEBQOyczGcKLk5BUkBsS0csk0FjPp+l4byCLzMm
 L05g==
X-Gm-Message-State: APjAAAU2KiFNHF7Ldlc/h17JoZ4T50X5DntkHjnDghQstNp+d4hsDIX0
 HM1zBx6wYTmKdvo9Gn2B3eI=
X-Google-Smtp-Source: APXvYqwzde8vJPDro3KBWaFAJc6Uo/3ggP569vDzVpDisDugeNgt80nBA+MCUnil+1LZlDzNpLDpvA==
X-Received: by 2002:a17:902:9d90:: with SMTP id
 c16mr34653633plq.12.1568332450067; 
 Thu, 12 Sep 2019 16:54:10 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a20sm24584085pfo.33.2019.09.12.16.54.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:54:09 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:53:48 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Message-ID: <20190912235348.GE24937@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
 <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
 <20190911110807.GB2036@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911110807.GB2036@sirena.org.uk>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 12:08:07PM +0100, Mark Brown wrote:
> On Mon, Sep 09, 2019 at 06:52:13PM -0700, Nicolin Chen wrote:
> 
> > And a quick feeling is that below code is mostly identical to what
> > is in the soc-generic-dmaengine-pcm.c file. So I'm wondering if we
> > could abstract a helper function somewhere in the ASoC core: Mark?
> 
> That's roughly what sound/core/pcm_dmaengine.c is doing -
> possibly we should move more stuff into there.

It looks like a right place to me. Thank you!
