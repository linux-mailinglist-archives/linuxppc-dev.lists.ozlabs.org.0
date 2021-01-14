Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B809D2F6B9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 20:57:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGw8d5nDBzDsPt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 06:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j/heu2mu; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGw4n5zPfzDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 06:54:31 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id 91so7057263wrj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 11:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Jco6OKkBzH2W5YMgKN8CdIkvv1c2tCGRqtwwKgOzoTU=;
 b=j/heu2munUhWuITG04w2E1rUlnHuKEPX2QcskO7PII2HtxbjLoBk0vUIcYEDq+Wzro
 YLJmhogwgK7dlTRE23UGZqyCSoOgK1BzwC0fWeASrYRSGQazGVMHHmXW9K9wa+vH4eTp
 7hJXY4pc3DRmorYpfjoKJWoFz8Uvtjw+DBeVr5OjnyRmzsb+lM9WLIg/+YMqhXwLk5qd
 RNXYmJFSZxYTOJYA90oJcZWqt6vrrA3MHDsaWY5r8+hnBBr2/7nsrV2TFzYqtCwHCchP
 4WXaxG6eUxVUnT80m6hPSIQ9Qd9QUYa1vNxPvRIelB9mmyGw38k8IiFKHNclOgN9xw/C
 ayag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Jco6OKkBzH2W5YMgKN8CdIkvv1c2tCGRqtwwKgOzoTU=;
 b=lHE6yrib3727diUO8fo2talVEPqVluBrQvA5mbUYfCSQLqa4Mm2Am2PcKdg83QkVD5
 mT2XPWej95Ch8BmEy16UOKqUqIkPFAWdrsdHmh/OGdzGruQFXkwfFDnWWc0nKTOaNQiW
 z/mEkDPXDarad2v5dBkmef31mUJpf2cT2ma01AuHbPHL1oegkRGBk9rDt9UROrDdfvZ9
 7GO9bD3DdNiWLdO/ZpSbOVmtQ18/7mUiHAYbsLzXdouICqCocKuDN0Ef3+cq8fWu/Ph9
 jiAm3pueao2ugPakA/DzKkaUK95rvRMwrvB5+q+v995ZkP2+zUcNvdrFNeRrMge0JLMv
 XQPQ==
X-Gm-Message-State: AOAM530YHhjoeskGLgBhdmAmW2m1hRqvaw1pE1TRoXEdCuipCiwCaq2r
 qxV0bqA2QgCv5r2M3wAeZKUYGA==
X-Google-Smtp-Source: ABdhPJwTAnSC8i9erqyaC2T3bmWeIfWfGjCjtI2qx+TyOz9rMatI0AIgHFfUQq4dPzhL98mW7iEdYA==
X-Received: by 2002:adf:9d42:: with SMTP id o2mr9465225wre.135.1610654066061; 
 Thu, 14 Jan 2021 11:54:26 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id b3sm5050877wme.32.2021.01.14.11.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:54:25 -0800 (PST)
Date: Thu, 14 Jan 2021 19:54:22 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210114195422.GB3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
 <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114083349.GI3975472@dell>
 <20210114091453.30177d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114091453.30177d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Thu, 14 Jan 2021, Jakub Kicinski wrote:

> On Thu, 14 Jan 2021 08:33:49 +0000 Lee Jones wrote:
> > On Wed, 13 Jan 2021, Jakub Kicinski wrote:
> > 
> > > On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:  
> > > > Resending the stragglers again.                                                                                  
> > > > 
> > > > This set is part of a larger effort attempting to clean-up W=1                                                   
> > > > kernel builds, which are currently overwhelmingly riddled with                                                   
> > > > niggly little warnings.                                                                                          
> > > >                                                                                                                  
> > > > v2:                                                                                                              
> > > >  - Squashed IBM patches                                                                                      
> > > >  - Fixed real issue in SMSC
> > > >  - Added Andrew's Reviewed-by tags on remainder  
> > > 
> > > Does not apply, please rebase on net-next/master.  
> > 
> > These are based on Tuesday's next/master.
> 
> What's next/master?

I'm not sure if this is a joke, or not? :)

next/master == Linux Next.  The daily merged repo where all of the
*-next branches end up to ensure interoperability.  It's also the
branch that is most heavily tested by the auto-builders to ensure the
vast majority of issues are ironed out before hitting Mainline.

> This is net-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

Looks like net-next gets merged into next/master:

commit 452958f1f3d1c8980a8414f9c37c8c6de24c7d32
Merge: 1eabba209a17a f50e2f9f79164
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu Jan 14 10:35:40 2021 +1100

    Merge remote-tracking branch 'net-next/master'

So I'm not sure what it's conflicting with.

Do you have patches in net-next that didn't make it into next/master
for some reason?

I'll try to rebase again tomorrow.

Hopefully I am able to reproduce your issue by then.

> > I just rebased them now with no issue.
> > 
> > What conflict are you seeing?
> 
> Applying: net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
> error: patch failed: drivers/net/ethernet/smsc/smc91x.c:2192
> error: drivers/net/ethernet/smsc/smc91x.c: patch does not apply
> Patch failed at 0001 net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
