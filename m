Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9AC5315F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 22:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6TM46tSyz3bmw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 06:24:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NKEVA1i2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NKEVA1i2; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6TLR0GNbz305b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 06:23:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A8AE61495;
 Mon, 23 May 2022 20:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45343C385AA;
 Mon, 23 May 2022 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653337418;
 bh=cRmLCYxqZ/oPtyUyAbrJ2vSaCtJhJTaXonVzm1gzzZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKEVA1i2oilfkHiewDOhRCD2VgzU1ad8Meq+dybp0PEy6huQ+sA3jCZFN5B3i1p4d
 aRYuziRfx0xW0yhhxyrZns9P/1t2w7+H9uU2sxzu80/1JGRsKtt/rm0ybMQ9OLJIWG
 e8Avm6N7lI1+kCy5871Ae8jJr3GAFOKjB2jGLj4FI4ileAGPymwlmfonXfCTbb9xxC
 aZsaB4ZlkKHmOhwUJrFihy0GKOaOxUsG34Bz1WdBxHvLAcz3Ms+pc4KtNG+gLpktCx
 LrLFA9YVBGMML3Tt9+tMZRG+GpwUqWhE4CixX67CBqFQJg1Hv9GvMN/fRR39N5hRFx
 TO1c31n0Wvamg==
Date: Mon, 23 May 2022 13:23:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] net: fs_enet: sync rx dma buffer before reading
Message-ID: <20220523132336.073965a5@kernel.org>
In-Reply-To: <20220521104430.1212bed5@kernel.org>
References: <20220519192443.28681-1-mans@mansr.com>
 <03f24864-9d4d-b4f9-354a-f3b271c0ae66@csgroup.eu>
 <yw1xmtfc9yaj.fsf@mansr.com>
 <b11dcb32-5915-c1c8-9f0e-3cfc57b55792@csgroup.eu>
 <20220520104347.2b1b658a@kernel.org>
 <d8cc1123-30d2-d65b-84b1-2ffee0d50aab@csgroup.eu>
 <20220521104430.1212bed5@kernel.org>
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
Cc: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Dan Malek <dan@embeddededge.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vitaly Bordug <vbordug@ru.mvista.com>, Paolo Abeni <pabeni@redhat.com>,
 Joakim Tjernlund <joakim.tjernlund@lumentis.se>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 21 May 2022 10:44:30 -0700 Jakub Kicinski wrote:
> > Well, I say the contrary.
> > 
> > On the mainline the patch may be applied as is, it won't harm.
> > 
> > However, it is gets applied to kernel 4.9 (based on the fixes: tag), it 
> > will break the driver for at least powerpc 8xx.  
> 
> I see, we should make a note of that in the commit message so it doesn't
> get sucked into stable.
> 
> > I don't know how SWIOTLB works or even what it is, does any of the 
> > microcontrollers embedding freescale ethernet uses that at all ?  
> 
> AFAIU SWIOTLB basically forces the use of bounce buffers even if the
> device can reach the entire DRAM. I think some people also use it for
> added security? IDK. I mostly use it to check if I'm using the DMA API
> "right" :)

If what I said makes sense please repost the patch, the current version
has been dropped from patchwork already.
