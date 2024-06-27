Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCA91AF31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 20:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W96pC6f4Rz3dKH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 04:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.53; helo=mail-ed1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W96nq35M8z3cVw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 04:40:30 +1000 (AEST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso2259823a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 11:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719513627; x=1720118427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRtwt1nHk/eFQfYHJCx8+U3yM4OGoY8sGkg3XpVPOa0=;
        b=Sy3Gy1nLhPsnEyhla0VwxQI44pgmF8hd36fX0E3XgvgqQjLwaDJUm6GvAL0+ZBufSa
         jpYtMAsxVbLrlDp1dBuy8wBIv4GpAXejWGMpsPO/csfr0Fr0VG9fwRaq/I6hVKzJwZA8
         xuaCI4debLTWWYPDQm2AHIk1v8oxZmy9CVQcYtjXR/z9TugSxpphRPxxl88U4yru/UbU
         r7ewdr61LShfnf1z+/aAuLXMIvf9L660+YH9Lgl6lr1BCOHu21ZXw49MLJOMVzXvEehf
         KAtQNaz5/NWfq1Dmwsii0GoYaXbvSYhjSBwidXNiVDHlqyBXe1L5MiJTMLIZgAcHbi5Q
         97Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ghLCeqdDfp6kjHLQqklsa2lg7xlqSL31svBL41JtT8fufJjW83rDsoN7U9Guamk9Jsw2YXbV8CVZXb/LDHBv8dtTjnIjQmy92NuNKA==
X-Gm-Message-State: AOJu0YwvjEItfvxcNslmwrKoPysvWAWlfhAXtbl667qggoCrKEhP3VcO
	gLdt6Hq7X45NBJj6cTsKSSt1Nfv3nQH6DoiMwhtqeHwAdNriFRq3
X-Google-Smtp-Source: AGHT+IGyWL39Gdti/FMrbm7JkEdRxyFNJ+JC9do85JtWo4z+QZkEpUt2llHGxHDQC6aOi9kuwYXphQ==
X-Received: by 2002:a50:c34d:0:b0:57c:7151:2669 with SMTP id 4fb4d7f45d1cf-57d4a276171mr11107130a12.7.1719513626964;
        Thu, 27 Jun 2024 11:40:26 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-115.fbsv.net. [2a03:2880:30ff:73::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c83578sm28651a12.18.2024.06.27.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 11:40:26 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:40:24 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <Zn2yGBuwiW/BYvQ7@gmail.com>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626140623.7ebsspddqwc24ne4@skbuf>
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
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org, Roy.Pledge@nxp.com, llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, horms@kernel.org, oe-kbuild-all@lists.linux.dev, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Vladimir,

On Wed, Jun 26, 2024 at 05:06:23PM +0300, Vladimir Oltean wrote:
> On Wed, Jun 26, 2024 at 08:09:53PM +0800, kernel test robot wrote:

> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning: stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
> >     3280 | static int dpaa_eth_probe(struct platform_device *pdev)
> >          |            ^
> >    1 warning generated.
> > --
> > >> drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:454:12: warning: stack frame size (8264) exceeds limit (2048) in 'dpaa_set_coalesce' [-Wframe-larger-than]
> >      454 | static int dpaa_set_coalesce(struct net_device *dev,
> >          |            ^
> >    1 warning generated.
> 
> Arrays of NR_CPUS elements are what it probably doesn't like?

Can it use the number of online CPUs instead of NR_CPUS?

Other than that, I would say we can drop this patch in the meantime, so,
we can move with the others, while this one is being addressed.
