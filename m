Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8A2A502E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 20:33:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQg2C680czDqkK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 06:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=saeed@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=k04pehKH; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQfzx0BZqzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 06:31:56 +1100 (AEDT)
Received: from lt-jalone-7480.mtl.com (c-24-6-56-119.hsd1.ca.comcast.net
 [24.6.56.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8D632080D;
 Tue,  3 Nov 2020 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604431913;
 bh=S+XTa/Ddbvh+IsyG31DYZypsQ7ugisv/L9FbS0/2MT0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=k04pehKHXgSp1gCBIIxlvyMNlN4PLVoxEtSR7x5/ZEXOffB4o52TItFE+b2KZHrSW
 SwG4YWmCouheXFGspowoxdbzUcr7oLJZsERO8RhQv1Z0b4p6KyHByvoVgVxn9pD+7V
 zZfoeuawcOmpYjV+yEzum15EHJsBhYetDi8Izc74=
Message-ID: <2eeb1f2ccce034455babdef88a275b4e5ebfba81.camel@kernel.org>
Subject: Re: [PATCH net-next 04/15] net: mlx5: Replace in_irq() usage.
From: Saeed Mahameed <saeed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leon@kernel.org>
Date: Tue, 03 Nov 2020 11:31:50 -0800
In-Reply-To: <20201031095938.3878412e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
 <20201027225454.3492351-5-bigeasy@linutronix.de>
 <20201031095938.3878412e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
 Madalin Bucur <madalin.bucur@nxp.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Samuel Chessman <chessman@tux.org>,
 Ping-Ke Shih <pkshih@realtek.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?UTF-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, Daniel Drake <dsd@gentoo.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-10-31 at 09:59 -0700, Jakub Kicinski wrote:
> On Tue, 27 Oct 2020 23:54:43 +0100 Sebastian Andrzej Siewior wrote:
> > mlx5_eq_async_int() uses in_irq() to decide whether eq::lock needs
> > to be
> > acquired and released with spin_[un]lock() or the irq
> > saving/restoring
> > variants.
> > 
> > The usage of in_*() in drivers is phased out and Linus clearly
> > requested
> > that code which changes behaviour depending on context should
> > either be
> > seperated or the context be conveyed in an argument passed by the
> > caller,
> > which usually knows the context.
> > 
> > mlx5_eq_async_int() knows the context via the action argument
> > already so
> > using it for the lock variant decision is a straight forward
> > replacement
> > for in_irq().
> > 
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: Saeed Mahameed <saeedm@nvidia.com>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: linux-rdma@vger.kernel.org
> 
> Saeed, please pick this up into your tree.

Applied to net-next-mlx5 will submit to net-next shortly.

