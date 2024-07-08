Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC792A3C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 15:38:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YLRndFiL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHlZG34lFz3clx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 23:38:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YLRndFiL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHlYY5Zm8z2y8t
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 23:37:52 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42662d80138so10380555e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2024 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720445869; x=1721050669; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKb3q0Y7TytSgi4aTS4oA0BDYeL9S2seeAThCNboSVY=;
        b=YLRndFiL6Q9wpzIj1m6SZzKyCVA512wIeKy+zFip9D8oXqmbASCRaPBRO/CyjyhmS0
         //U4VzoYhmkuAiUyZwrK0IC1ez3ULUWba+PDL7caySkSb3fJZGQ1fg83i0YvS7UWKLAD
         VvUa2e7X8uuB2QBnJQECbEVisEGuLxffD0YHY+MalvpLRHT7K7Q+FIEZGfnlajLo069E
         S8htJfpbtbhTvRn+C7bBsLOPOAsp5BE6geYQwp0z1E/sy/NesPSgzImBQ91q/Ap5W3t9
         LuZzxQGLDn23VI1MsP9T3A9mm2cN/jDrCQtQseJrqKAD4j7M/kdAviLF93oGrdY/f1nC
         zJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445869; x=1721050669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKb3q0Y7TytSgi4aTS4oA0BDYeL9S2seeAThCNboSVY=;
        b=ij1qKBscpwMxfAZRV83W8UyurJxl7LJC872XZFfJS2vY/L0ph/GiFcOFuV8IAmV5jF
         F2u/eUfccJ8LHjPzQOuGOh8/JiW8/jcm89pLqN4B4Y/dejq8vh47/WoLa2PhAi5vajXA
         /1Pq3ltjHXojtVIdW6ai7OWquF0BbB+Laas6WAhyldUS3/QEOrrOi9fdhR3KApLqSo4G
         xlqNucebXDlnEB2YLRe3wdkr4iZqQyWgXZMJgvNn4pBCu00UXPCdPNqcJeeKNTaIuVHJ
         TJ0V//v86of4gWxMXROcUtcV0J1Asr4F8flR7Fb0ybnBRlbnjMWdIA/mLBy2QMRWh2MI
         7CpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSHFhntkY3Ot+ItM5P23sXI4/K1Bi/Pvmi2qCxiinochOrVXk7UvvnQDJkcRBTB4GVZ4UDwXuueq51P/XPcWj+EG8XAvthFWeRIxNSaA==
X-Gm-Message-State: AOJu0YzhHc0gSITmionVZ1Xy8JBNoU4GwNDBN+H8AUm2gGFk5050lkTE
	i/ZHV/bQmlDfCgZlEawDE6AnrSqCRgtqnqgnwugGou8RWf1VeJpV
X-Google-Smtp-Source: AGHT+IFf2CtPfnw+MM5W8B/XjYd7ZO0yJR0wUNYpiS0Y2kF7RSShvAnNhhqjkbjraPsAS3o4pFs36Q==
X-Received: by 2002:a05:600c:ad0:b0:426:61af:e1d3 with SMTP id 5b1f17b1804b1-42661afe258mr37880785e9.31.1720445869053;
        Mon, 08 Jul 2024 06:37:49 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426615876bbsm85539585e9.6.2024.07.08.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:37:48 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:37:46 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <20240708133746.ea62kkeq2inzcos5@skbuf>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn2yGBuwiW/BYvQ7@gmail.com>
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

On Thu, Jun 27, 2024 at 11:40:24AM -0700, Breno Leitao wrote:
> Hello Vladimir,
> 
> On Wed, Jun 26, 2024 at 05:06:23PM +0300, Vladimir Oltean wrote:
> > On Wed, Jun 26, 2024 at 08:09:53PM +0800, kernel test robot wrote:
> 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:3280:12: warning: stack frame size (16664) exceeds limit (2048) in 'dpaa_eth_probe' [-Wframe-larger-than]
> > >     3280 | static int dpaa_eth_probe(struct platform_device *pdev)
> > >          |            ^
> > >    1 warning generated.
> > > --
> > > >> drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:454:12: warning: stack frame size (8264) exceeds limit (2048) in 'dpaa_set_coalesce' [-Wframe-larger-than]
> > >      454 | static int dpaa_set_coalesce(struct net_device *dev,
> > >          |            ^
> > >    1 warning generated.
> > 
> > Arrays of NR_CPUS elements are what it probably doesn't like?
> 
> Can it use the number of online CPUs instead of NR_CPUS?

I don't see how, given that variable length arrays are something which
should be avoided in the kernel?
