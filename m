Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E889ED87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 10:26:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KDPNsaBu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDwrx6Mlzz3vZ7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 18:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KDPNsaBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDwrF1dJ0z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 18:25:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E5C6CE2645;
	Wed, 10 Apr 2024 08:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222B4C433F1;
	Wed, 10 Apr 2024 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712737529;
	bh=Dhybrf/jRqbpyhuhIWlZvPbxMVOS0VFGt4WJR1DnMNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDPNsaBudn+n4+RXzxU38zA293P9i01hK4pr+EzsNlygvUAPOjzwvf/oUbikrXg95
	 /N9KFTY1uuvoJgBUoJH4BkRDQEIr3X5LSBVt6P6w3X2XFz+Etf1/yCAYNPWYH2L813
	 KkAO4Cql9cMJLXpMa0g0EbkaGil+/s1j6TdGGz4k=
Date: Wed, 10 Apr 2024 10:25:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] MAINTAINERS: Drop Li Yang as their email address stopped
 working
Message-ID: <2024041010-neuron-vividness-8202@gregkh>
References: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
 <20240409144204.00cc76ce@kernel.org>
 <u4bhjzjr4jjx26r3r4jupqd5u273xsvuyfzq5ecv6binoyoqzq@5zib23vgtlsx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <u4bhjzjr4jjx26r3r4jupqd5u273xsvuyfzq5ecv6binoyoqzq@5zib23vgtlsx>
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
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2024 at 08:42:06AM +0200, Uwe Kleine-König wrote:
> On Tue, Apr 09, 2024 at 02:42:04PM -0700, Jakub Kicinski wrote:
> > On Fri,  5 Apr 2024 09:20:41 +0200 Uwe Kleine-König wrote:
> > > When sending a patch to (among others) Li Yang the nxp MTA replied that
> > > the address doesn't exist and so the mail couldn't be delivered. The
> > > error code was 550, so at least technically that's not a temporal issue.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > FWIW it's eaac25d026a1 in net, thanks!
> 
> Greg also picked it up, it's fbdd90334a6205e8a99d0bc2dfc738ee438f00bc in
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> . Both are included in next-20240410. I guess that's not a big problem.
> (And please prevent that the patch is dropped from both trees as it's
> already included in the other :-)

We already got a report from linux-next about this, it's fine, we will
both keep it.

thanks,

greg k-h
