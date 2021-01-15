Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E63782F778A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 12:22:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHJgW5mS1zDsdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 22:22:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q3yaL+9D; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHJZx6BlzzDscP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 22:18:31 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id c124so6988806wma.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1v0kX8Ej1D5vKbj6l4aBaWcu5DlgLp/Dsh/tnFpcg+Y=;
 b=q3yaL+9Dr08XGvGA9C6LCEyO8dv4MnZdXyFkQYqmFx0J6077BQyNrC3ZfumRsecp3C
 jhWw5mwhLJPw0Cs1JbrRKisZLtJwnz1td5U9T0NGKs1Du/ixjp/OJBAzJfzKRI6OcJk7
 jMEwkkp1Tkj+4L5MV7I56bqhm0b41JzVf87hKjB9+45TNRkOJr4vpR/ubLc/6rtvmcJ5
 7mCbPO3LDc6oV5qxhdZ2mVZdYUEoFwtOSOsE5jhkTTaKb96r2hJSt5iuNgvxYG8TmgQR
 6/dS/oeqnNfc5YG3pyRPZOkm06JhrYQzWk/YJrzGR6qgls7QN+s9q82XGRS8f8pSX4Qd
 is3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1v0kX8Ej1D5vKbj6l4aBaWcu5DlgLp/Dsh/tnFpcg+Y=;
 b=ZiKnlrunro5aFjK+avPm3aSWGuDCI6FPAEI2Zex/jof74WN70bcloi5jabsRjwAbwb
 dQice6f+kBureoEUPp0zKJc9oJbeX8HEnCFROJGFB3s0ic7jfFf3kCbE6suXDiLxRL2r
 +jQSWqVdzYMfqrNw+E7xEFViX41NN32+RY2aqWc2GugJVbaLqbrFbM9iPwF6EYaFCjCy
 vBhv93dzBJlgMm8em9ABvVc57iMNiXpUjOnc9C75N5VkSleK+Z4n6SUJfkb0GJ7qj7wC
 r5PrJLgUXJoa4fuxQU9l9AksqK610I9/jDKbBQYdnkjeBcc2Jt+7lR1yc/FmX4rjPery
 DrEg==
X-Gm-Message-State: AOAM530dkxfs1RqtPoznKdRHvgeW98b1MRjQpsyyvkJ4Psgk4vH7t62U
 1uuKyvvRgTQsYf9tfpTv9KUzSw==
X-Google-Smtp-Source: ABdhPJy6Ksm7TL3YP23vSBkfPg6+Ma2TEXquqULAQIh92rfS/zIKFK4APldrd16rYZnbmfKF7kRaEA==
X-Received: by 2002:a05:600c:4417:: with SMTP id
 u23mr8306553wmn.100.1610709506910; 
 Fri, 15 Jan 2021 03:18:26 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id i18sm14818507wrp.74.2021.01.15.03.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 03:18:26 -0800 (PST)
Date: Fri, 15 Jan 2021 11:18:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210115111823.GH3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
 <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114083349.GI3975472@dell>
 <20210114091453.30177d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114195422.GB3975472@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114195422.GB3975472@dell>
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
Cc: Paul Durrant <paul@xen.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Cammaert <pc@denkart.be>,
 Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Wei Liu <wei.liu@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Santiago Leon <santi_leon@yahoo.com>, xen-devel@lists.xenproject.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Daris A Nevil <dnevil@snmc.com>,
 Lijun Pan <ljp@linux.ibm.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Erik Stahlman <erik@vt.edu>, John Allen <jallen@linux.vnet.ibm.com>,
 Utz Bacher <utz.bacher@de.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Russell King <rmk@arm.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jan 2021, Lee Jones wrote:

> On Thu, 14 Jan 2021, Jakub Kicinski wrote:
> 
> > On Thu, 14 Jan 2021 08:33:49 +0000 Lee Jones wrote:
> > > On Wed, 13 Jan 2021, Jakub Kicinski wrote:
> > > 
> > > > On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:  
> > > > > Resending the stragglers again.                                                                                  
> > > > > 
> > > > > This set is part of a larger effort attempting to clean-up W=1                                                   
> > > > > kernel builds, which are currently overwhelmingly riddled with                                                   
> > > > > niggly little warnings.                                                                                          
> > > > >                                                                                                                  
> > > > > v2:                                                                                                              
> > > > >  - Squashed IBM patches                                                                                      
> > > > >  - Fixed real issue in SMSC
> > > > >  - Added Andrew's Reviewed-by tags on remainder  
> > > > 
> > > > Does not apply, please rebase on net-next/master.  
> > > 
> > > These are based on Tuesday's next/master.
> > 
> > What's next/master?
> 
> I'm not sure if this is a joke, or not? :)
> 
> next/master == Linux Next.  The daily merged repo where all of the
> *-next branches end up to ensure interoperability.  It's also the
> branch that is most heavily tested by the auto-builders to ensure the
> vast majority of issues are ironed out before hitting Mainline.
> 
> > This is net-next:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/
> 
> Looks like net-next gets merged into next/master:
> 
> commit 452958f1f3d1c8980a8414f9c37c8c6de24c7d32
> Merge: 1eabba209a17a f50e2f9f79164
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Thu Jan 14 10:35:40 2021 +1100
> 
>     Merge remote-tracking branch 'net-next/master'
> 
> So I'm not sure what it's conflicting with.
> 
> Do you have patches in net-next that didn't make it into next/master
> for some reason?
> 
> I'll try to rebase again tomorrow.
> 
> Hopefully I am able to reproduce your issue by then.

Okay so my development branch rebased again with no issue.

I also took the liberty to checkout net-next and cherry-pick the
patches [0], which again didn't cause a problem.

I'm not sure what else to suggest.  Is your local copy up-to-date?

[0]

lee@dell:~/projects/linux/kernel [net-next]$ gcp 0cea4b05acd57..924e1f46aba5e
Auto-merging drivers/net/ethernet/smsc/smc91x.c
[net-next 19811db3120a2] net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
 Date: Mon Oct 19 12:47:11 2020 +0100
 1 file changed, 1 insertion(+), 1 deletion(-)
[net-next dc6f4490cb64e] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
 Date: Tue Oct 20 08:00:43 2020 +0100
 1 file changed, 2 insertions(+), 2 deletions(-)
[net-next a3363cb09ae59] net: ethernet: ti: am65-cpsw-qos: Demote non-conformant function header
 Date: Tue Oct 20 09:05:38 2020 +0100
 1 file changed, 1 insertion(+), 1 deletion(-)
[net-next 005462f886c3e] net: ethernet: ti: am65-cpts: Document am65_cpts_rx_enable()'s 'en' parameter
 Date: Tue Oct 20 09:06:57 2020 +0100
 1 file changed, 1 insertion(+), 1 deletion(-)
Auto-merging drivers/net/xen-netfront.c
[net-next 9fcc32e395e09] net: ethernet: ibm: ibmvnic: Fix some kernel-doc misdemeanours
 Date: Tue Oct 20 09:42:19 2020 +0100
 2 files changed, 16 insertions(+), 17 deletions(-)
[net-next 15ba865fef481] net: ethernet: toshiba: ps3_gelic_net: Fix some kernel-doc misdemeanours
 Date: Tue Oct 20 10:10:14 2020 +0100
 1 file changed, 5 insertions(+), 3 deletions(-)
[net-next f815eb7cbd7f5] net: ethernet: toshiba: spider_net: Document a whole bunch of function parameters
 Date: Tue Oct 20 10:18:21 2020 +0100
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
