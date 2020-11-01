Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB52A2244
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 00:06:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPWrb6S8RzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 10:06:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=RMU/zjUY; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=tnpRn8tR; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPWpZ2twczDqBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 10:04:54 +1100 (AEDT)
Date: Mon, 2 Nov 2020 00:04:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604271886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTz98QayFDBHYxMPWUtO7gaEkyZ/vOcdTDDbAj+qRew=;
 b=RMU/zjUYLCUjVRchj6Lg3u4Z19FFUmuHwlDZ2qGVpy/BdoA3b//QydpJ7N7D+WmAoRB0IH
 pmV1W/0VeokRopnyeRg+ygSZZOfWKGYRwtyI5HiyH0TUIGejGgymkIN4DKkHfDbRSJQn8e
 rT5+PlUZP2ugKmnOCJm35JryUgdJb7ljV7ykRm6tF2faCdOtJej9FtWwHhc6hSX3h1uEDH
 Gd4WxxV8TJ6q2juUmfy5klRvhEADPp4nTFTDxGw/BMqURzqkJLdvmfM4w3u6QgmPIid7Rl
 NX1YuzWXGWY+YLx3NL0aXhAOvMJaZv3rGHCSwHHqsUjDwq+K5lyxO0Uo8/q1sA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604271886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTz98QayFDBHYxMPWUtO7gaEkyZ/vOcdTDDbAj+qRew=;
 b=tnpRn8tRWR4CI2WkiILhCMpdG2/AknpJnnJmkdPNVstOdtLFWUfk/KI2sY0XDMTfc58jfy
 8FUsfwCSSqWeBgCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 14/15] net: dpaa: Replace in_irq() usage.
Message-ID: <20201101230444.x5dxzarehepyynp3@linutronix.de>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
 <20201027225454.3492351-15-bigeasy@linutronix.de>
 <20201031101215.38a13e51@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201031101215.38a13e51@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
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
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 linux-crypto@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-10-31 10:12:15 [-0700], Jakub Kicinski wrote:
> Nit: some networking drivers have a bool napi which means "are we
> running in napi context", the semantics here feel a little backwards,
> at least to me. But if I'm the only one thinking this, so be it.

I renamed it to `sched_napi'.

Sebastian
