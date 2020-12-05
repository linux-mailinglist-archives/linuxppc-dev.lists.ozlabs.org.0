Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 374652CFF2F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 22:23:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpMxT553jzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 08:23:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IomTqf+w; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpMsJ5GzLzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 08:19:32 +1100 (AEDT)
Date: Sat, 5 Dec 2020 13:19:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607203170;
 bh=PyjM1pGVTFHxUehGtpwFnMJ3A9jzuRhj8X6L8VDNDQo=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=IomTqf+w6S260Krot3AzLA96YRLEmUE+dTNDRNGda8WX41gmHH8hyEIa3DF96Wc03
 QpS/knU4Z8zTv6zTDgxt97BNT/vJ+EesFz5kZqDIvT/w6pAF5UoDUKhtWrLce1CRsA
 DFaMJnbtcUIao87SqdFnFi5RCdwFij6fIHQ19rG0D1Sb219fjP1hxOhzFqNCGRJWao
 Ju4epsvDrCq+1fjJBVTjEa+ORIpDHP81zXEVzoEfuvnHY49ZHXJXnYyi5lPqI3Ea6m
 aTce8LCME5vTq5eG7uxqQLJlE4JNKnnk+j56wQhzFp6GAMVxnM71gsC3kR8fOTi7hI
 Sn7EiyZoxM6lQ==
From: Jakub Kicinski <kuba@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH 11/20] ethernet: ucc_geth: fix use-after-free in
 ucc_geth_remove()
Message-ID: <20201205131928.7d5c8e59@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <4d35ef11-b1eb-c450-2937-94e20fa9a213@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-12-rasmus.villemoes@prevas.dk>
 <20201205124859.60d045e6@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
 <4d35ef11-b1eb-c450-2937-94e20fa9a213@prevas.dk>
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 5 Dec 2020 22:04:28 +0100 Rasmus Villemoes wrote:
> On 05/12/2020 21.48, Jakub Kicinski wrote:
> > On Sat,  5 Dec 2020 20:17:34 +0100 Rasmus Villemoes wrote:  
> >> -	unregister_netdev(dev);
> >> -	free_netdev(dev);
> >>  	ucc_geth_memclean(ugeth);
> >>  	if (of_phy_is_fixed_link(np))
> >>  		of_phy_deregister_fixed_link(np);
> >>  	of_node_put(ugeth->ug_info->tbi_node);
> >>  	of_node_put(ugeth->ug_info->phy_node);
> >> +	unregister_netdev(dev);
> >> +	free_netdev(dev);  
> > 
> > Are you sure you want to move the unregister_netdev() as well as the
> > free?
> 
> Hm, dunno, I don't think it's needed per se, but it also shouldn't hurt
> from what I can tell. It seems more natural that they go together, but
> if you prefer a minimal patch that's of course also possible.

I was concerned about the fact that we free things and release
references while the device may still be up (given that it's
unregister_netdev() that will take it down).

> I only noticed because I needed to add a free of the ug_info in a later
> patch.
