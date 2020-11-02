Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B12A3658
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 23:15:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ6gY5M6WzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 09:15:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=saeed@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=F3ka5x6N; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ5vz0HbmzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 08:41:35 +1100 (AEDT)
Received: from lt-jalone-7480.mtl.com (c-24-6-56-119.hsd1.ca.comcast.net
 [24.6.56.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EE4921D40;
 Mon,  2 Nov 2020 21:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604353291;
 bh=CT78URbf8GWUrauRnN7DRJ5X5z820SmGZe8HhrCPyTY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=F3ka5x6N19Rp7WtfdR4oM2thWJyW5uF0CpRDHZKTIn7zaFGSn5bBL4vkRh0550qnI
 lGZrPKMm2fJzhc/aBEQzYjjML/1g3PbMMvddAbtL2uE0wIGZ5ooLgSMaeua6X1a1Pk
 UF2VWhVZnZ67yk5X5Estw6tnPoHhELfjpb7ZTFk0=
Message-ID: <5940727ec6361becbac13d5dcbdc995c1fa3353b.camel@kernel.org>
Subject: Re: [PATCH net-next 04/15] net: mlx5: Replace in_irq() usage.
From: Saeed Mahameed <saeed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leon@kernel.org>
Date: Mon, 02 Nov 2020 13:41:29 -0800
In-Reply-To: <20201031095938.3878412e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
 <20201027225454.3492351-5-bigeasy@linutronix.de>
 <20201031095938.3878412e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 09:14:12 +1100
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

Ack

