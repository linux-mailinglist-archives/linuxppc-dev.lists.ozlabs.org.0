Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F01BD2F6CFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 22:16:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGxvr2dHbzDrbB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 08:16:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k4n/STNm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGvs93lT2zDrdm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 06:44:29 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C723238EC;
 Thu, 14 Jan 2021 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610644495;
 bh=RDEJdDVwILr1jM/hUHMK43X/Aq2TqFRPO473xjQ/s4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k4n/STNmaNHIWsT916GZmz4QENJO11kKIpmhTvbk+3HBZbLsJS5+OOU5kdJp8GsqJ
 jc7NomeF0hPCzT0GF0uPkxUbffiWCJr1vCgbcugvXeJHZonSh7o/oKtcZOT/9Ses5D
 cZacciofUZDcTAyidREbaNUiW32XgyI3zoa+jFvu05di+mGUv2rGqJEO7IoesrXS5O
 1eBMFEKEF79c6FsTgQU6A6tHuxBjMVP6GlaxD3sbs/SfjxsYWPCEXyJWCmt+i8czt3
 9/X4W4WmRiMBPIHSF6tMMy3SVsQJc3YdRAosQp9cOyWYmerHidiQ+Rvdi/KmnmiQSo
 2+qDHsOaHb3Ng==
Date: Thu, 14 Jan 2021 09:14:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210114091453.30177d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210114083349.GI3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
 <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210114083349.GI3975472@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 14 Jan 2021 08:33:49 +0000 Lee Jones wrote:
> On Wed, 13 Jan 2021, Jakub Kicinski wrote:
> 
> > On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:  
> > > Resending the stragglers again.                                                                                  
> > > 
> > > This set is part of a larger effort attempting to clean-up W=1                                                   
> > > kernel builds, which are currently overwhelmingly riddled with                                                   
> > > niggly little warnings.                                                                                          
> > >                                                                                                                  
> > > v2:                                                                                                              
> > >  - Squashed IBM patches                                                                                      
> > >  - Fixed real issue in SMSC
> > >  - Added Andrew's Reviewed-by tags on remainder  
> > 
> > Does not apply, please rebase on net-next/master.  
> 
> These are based on Tuesday's next/master.

What's next/master?

This is net-next:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

> I just rebased them now with no issue.
> 
> What conflict are you seeing?

Applying: net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
error: patch failed: drivers/net/ethernet/smsc/smc91x.c:2192
error: drivers/net/ethernet/smsc/smc91x.c: patch does not apply
Patch failed at 0001 net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
