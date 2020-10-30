Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A12A0D6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 19:30:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN9qJ3wNKzDqkq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 05:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=MIS4KY1J; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN9nG1bDszDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 05:29:05 +1100 (AEDT)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B15720702;
 Fri, 30 Oct 2020 18:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604082542;
 bh=T+9rwp4yVvdDVmqCTMI4J0+lif+YYrb6qw5IVuzKMoE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MIS4KY1J3r4JBmDfIwmP17X64aSTEg7voFCa7w9Tj72useO0Y96wHqtOAew6nNViV
 wqsc+1Y5IFshsOupCVLpIoqTC6s7JDJVi6q3Bz+c3t1d0x+K/XvrhUMitpBcFiZpJ2
 X5bIJJybGh+aXi+2T7b0fAsCfhJKTFATkXHLTeP8=
Date: Fri, 30 Oct 2020 11:29:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next 00/15] in_interrupt() cleanup, part 2
Message-ID: <20201030112900.08bd1750@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201027225454.3492351-1-bigeasy@linutronix.de>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Samuel Chessman <chessman@tux.org>, Ping-Ke Shih <pkshih@realtek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?UTF-8?B?R2VhbnTEgw==?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, linuxppc-dev@lists.ozlabs.org,
 Daniel Drake <dsd@gentoo.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Leon Romanovsky <leon@kernel.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Oct 2020 23:54:39 +0100 Sebastian Andrzej Siewior wrote:
> Folks,
> 
> in the discussion about preempt count consistency across kernel configurations:
> 
>   https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> 
> Linus clearly requested that code in drivers and libraries which changes
> behaviour based on execution context should either be split up so that
> e.g. task context invocations and BH invocations have different interfaces
> or if that's not possible the context information has to be provided by the
> caller which knows in which context it is executing.
> 
> This includes conditional locking, allocation mode (GFP_*) decisions and
> avoidance of code paths which might sleep.
> 
> In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> driver code completely.
> 
> This is part two addressing remaining drivers except for orinoco-usb.

Freescale folks - can I get an ack for merging the last three patches
into net-next?
