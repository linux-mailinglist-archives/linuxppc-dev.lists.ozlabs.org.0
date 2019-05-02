Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B464121F1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 20:35:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w3q11Xn8zDqSK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 04:35:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L9VDpZd7"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w3nZ0JP2zDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 04:34:09 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id z28so1557817pfk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9pb3Jn+Vd+nDYRO/WKHx1a5dMNfMG+2SwDRrQcgz14A=;
 b=L9VDpZd7yhW7D4dES1p8F41DXoL4cI3oVP+xeAgaVLAPRICbbOmA8zCIYc8C7R10Ze
 aCmnVONmStqlxASn958ixGMTiMe42NqhfrNP+IeyeHPz2U1dvNMIducxvXB5BrKhRFNT
 zFlkpyzKVJRe9BvjM2tdiX78/f+qY+6yrjlCPuDfuiIRnEKQddP5LNl+3KwMh7QhYB0p
 Qy/FnzYhkVHiPrnt9wPbeHn0ZbMyZtpwYNuRyfwfzQ4kCnnS6/XX1bWAsy8psDCMq6b9
 BdAZe1Ovpcb4kKWCP4t8G8K/7CJlXKC2fhUlMn2PklQX4oPYNEiPuLfsvnp1XZAEL0sD
 0aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9pb3Jn+Vd+nDYRO/WKHx1a5dMNfMG+2SwDRrQcgz14A=;
 b=pRizOlge9xZa4ddrLJeobnmjwYHNi/TKF8B3AjkLYzY0R5bBsPDHaB/MQgDd+A3IFc
 U3ED3RZ7mIkyQ+d3smG+jw1IlWWE7n4YlCsmcufjWTHOczlXCJNaB32FDdYTIPGDthwH
 Fu7gqLhF083i7GTSDvIS+pLPoWo/ll/AuGORlHSW1887kIGoGPeahGGOrukZ3hwVRBB/
 kQAPYMt/vEf8UUDQ4nH9TnSNiBm6IV+2xN/NrsncNIaiqjjeKq76x9eL2onxUzP61Qye
 at5DHzduUxkPBdm697EiiGbWrQmbCAnQGNRad1nybhfDz71P5KTEttUCsXAZnAntMeYR
 b9AA==
X-Gm-Message-State: APjAAAWFbcHc5QDqLFaEQ2BOALQGE54ppKCJp/evX9G3Jezv3Rfm2E/D
 EuiGDRVnFHozR5Itc8q3gmE=
X-Google-Smtp-Source: APXvYqwJitXju3fizMVEW7pWswOKDMbqed3Yj6lTTZT5fp0epxAX+wzjtiPHMb8hQMZDeFkYoswyMQ==
X-Received: by 2002:a62:e501:: with SMTP id n1mr5757562pff.17.1556822046126;
 Thu, 02 May 2019 11:34:06 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id n15sm34696825pfb.111.2019.05.02.11.34.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 11:34:05 -0700 (PDT)
Date: Thu, 2 May 2019 11:32:31 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Message-ID: <20190502183230.GA25229@Asurada-Nvidia.nvidia.com>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
 <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
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
 Mark Brown <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 02, 2019 at 09:13:58AM +0000, S.j. Wang wrote:
> > On Sun, Apr 28, 2019 at 02:24:54AM +0000, S.j. Wang wrote:
> > > Add pm runtime support and move clock handling there.
> > > Close the clocks at suspend to reduce the power consumption.
> > >
> > > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > > fsl_esai_resume is replaced by pm_runtime_force_resume.
> > 
> > This doesn't apply against for-5.2 again.  Sorry about this, I think this one is
> > due to some messups with my scripts which caused some patches to be
> > dropped for a while (and it's likely to be what happened the last time as
> > well).  Can you check and resend again please?  Like I say sorry about this, I
> > think it's my mistake.
> 
> I am checking, but I don't know why this patch failed in your side. I 
> Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, all are

I just tried to apply it against top of trees of for-next and for-5.2
and both were fine on my side too.

> Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git.

Btw, this git link no longer works for me, not sure why:
# git remote add broonie git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
# git fetch broonie
fatal: remote error: access denied or repository not exported: /m/korg/pub/scm/linux/kernel/git/broonie/sound.git

It started to work after I changed "git://" to "https://" though...
