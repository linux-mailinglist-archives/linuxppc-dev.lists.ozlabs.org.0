Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A64368B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 02:18:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K5pc54qKzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 10:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ay6RwqsM"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K5nD3gM9zDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 10:16:48 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j2so321690pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 17:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cK/gGt5PDimlIevfbs8g1ARiYxKpO3It4jGHeUdOAXQ=;
 b=Ay6RwqsM05DNTHbEStXHw3SHZKFvhBkjCx8hE4XKG0cWnEjcpqh9Jb33U70NaQK5P5
 JRB8pq/Yv1iSxEVJIdwTFVeT956CEFAyRS+KdKadsqMAOE1dxxx+kkZc0J6ibY/EiQyk
 T9Y5dPWUBdYx++K6X+6MKeB2LVaUPXV+C4qmTvSoXFCUYIy/2stW9i01QSf95M6u7QZS
 yOWMQZbN/65Ot9oZZLwrgeVSLMaOpkZZHSFhYVwnf0bi9BYjcCMKc2jmCZTqpbWUoaaD
 hN0xLeFv976DkIpB+bXcUTrk7gNaxhhJrKKpNfMfJZGgFogEMT2CIntoAluVsBdoA8Xi
 m6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cK/gGt5PDimlIevfbs8g1ARiYxKpO3It4jGHeUdOAXQ=;
 b=ckzxJzkyBUm/xo1hGgU0R+fHXBKNruqh1U5VMSyfdQ+0nSleC43CMTX90IQnYgDgAR
 5s2M1QwCo59Fwi4SU+Tm62BHw6LerS8wkrQO9BvyMS1JDxB+kox8iZEcbPfiXZTlvBpn
 UuWsZHiQVG5hCMeXw78oGNJrDom9FIYaG6ErKiFJhHzWbHX9MuW52OU7RdwjEcq8YF+E
 h5RcqbDEepVIf8iyfCh8fxaj0cl4CNo2EmrRt5PbBTa6Hdmz/zKd+vjt8MvpAu8nX9Ft
 8f9AlMJar7Kw0HviOG+BgclsQYQPBOIrNeFHGU5WJcwahdHqyRUzkfAMx7T6psnKIUOZ
 yYKw==
X-Gm-Message-State: APjAAAXig+QKqignKOpe36WEh0TmX1zVys0k3PiJe0FTIiwF8JOWxr4k
 XRPpveEvwQ4HzsS0Urcm386fudLVTl0=
X-Google-Smtp-Source: APXvYqxwKRXiNuveG7RIUpRL8Y8GH4zg3HqUKLfaIlbElDmZUZU2dbjjzlJ33UBzpFgTEcuhwJbeAA==
X-Received: by 2002:a17:90a:338e:: with SMTP id
 n14mr46596229pjb.35.1559780204786; 
 Wed, 05 Jun 2019 17:16:44 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 10sm93476pfh.179.2019.06.05.17.16.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 17:16:44 -0700 (PDT)
Date: Wed, 5 Jun 2019 17:16:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Message-ID: <20190606001644.GA20103@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB6479D7512EDE1217228033CAE3160@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479D7512EDE1217228033CAE3160@VE1PR04MB6479.eurprd04.prod.outlook.com>
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

Hello Shengjiu,

On Wed, Jun 05, 2019 at 10:29:37AM +0000, S.j. Wang wrote:
> > > ETDR is not volatile,  if we mark it is volatile, is it correct?
> > 
> > Well, you have a point -- it might not be ideally true, but it sounds like a
> > correct fix to me according to this comments.
> > 
> > We can wait for Mark's comments or just send a patch to the mail list for
> > review.
> 
> I test this patch, we don't need to reset the FIFO, and regcache_sync didn't
> Write the ETDR even the EDTR is not volatile.  This fault maybe caused by

The fsl_esai driver uses FLAT type cache so regcache_sync() would
go through regcache_default_sync() that would bypass cache sync at
the regcache_reg_needs_sync() check when the cached register value
matches its default value: in case of ETDR who has a default value
0x0, it'd just "continue" without doing that _regmap_write() when
the cached value equals to 0x0.

> Legacy, in the beginning we add this patch in internal branch, there maybe
> Something cause this issue, but now can't reproduced. 

The "legacy" case might happen to have two mismatched ETDR values
between the cached value and default 0x0. And I am worried it may
appear once again someday.

So I feel we still need to change ETDR to volatile type. And for
your question "ETDR is not volatile,  if we mark it is volatile,
is it correct?", I double checked the definition of volatile_reg,
and it says:
 * @volatile_reg: Optional callback returning true if the register
 *		  value can't be cached. If this field is NULL but

So it seems correct to me then, as the "volatile" should be also
transcribed as "non-cacheable".

Thanks
Nicolin
