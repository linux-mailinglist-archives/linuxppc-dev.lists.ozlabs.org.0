Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B3A52FE9F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 19:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L59wP65K5z3cBk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 03:45:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mLf/GRtn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mLf/GRtn; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L59vm0Sjkz2xKf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 May 2022 03:44:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C9CD60D2C;
 Sat, 21 May 2022 17:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29773C385A5;
 Sat, 21 May 2022 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653155072;
 bh=EO84JGczgpntqsBiE0PFKKUwtkIBC7vQT45PS1nrYTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mLf/GRtnZ3q1ciVMuzDkYnEOKTsDT2jfwFJXyiuutQp8dgnkLSAC+iqUKGoddB38U
 eNtiepYn+un7FTXa4fS+9fUCbQRWSC4uQZp7J5AsFGqxplizWSjG824CwOEi4IAViT
 V8Q8rSPKq2THHVLB0DQhc6CuWzygK3Pllx91p4JRconHLosADsY2jespf42KWlWxnG
 kYda1VOAsx28iaQfIdjkqflGklVkLc47XuInXCyEOnksXin+L2PQqm4dWZr8KNAagF
 vVA0cZohdBxcoqO/yOR7IxARweX4iEqPGvLppqn31NPcPEuHk/gsgkfUTq7C1es5vO
 CFajLlyyvFlBA==
Date: Sat, 21 May 2022 10:44:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] net: fs_enet: sync rx dma buffer before reading
Message-ID: <20220521104430.1212bed5@kernel.org>
In-Reply-To: <d8cc1123-30d2-d65b-84b1-2ffee0d50aab@csgroup.eu>
References: <20220519192443.28681-1-mans@mansr.com>
 <03f24864-9d4d-b4f9-354a-f3b271c0ae66@csgroup.eu>
 <yw1xmtfc9yaj.fsf@mansr.com>
 <b11dcb32-5915-c1c8-9f0e-3cfc57b55792@csgroup.eu>
 <20220520104347.2b1b658a@kernel.org>
 <d8cc1123-30d2-d65b-84b1-2ffee0d50aab@csgroup.eu>
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

On Sat, 21 May 2022 06:44:41 +0000 Christophe Leroy wrote:
> > Hm, I think the patch is necessary, sorry if you're also saying that
> > and I'm misinterpreting.  
> 
> Well, I say the contrary.
> 
> On the mainline the patch may be applied as is, it won't harm.
> 
> However, it is gets applied to kernel 4.9 (based on the fixes: tag), it 
> will break the driver for at least powerpc 8xx.

I see, we should make a note of that in the commit message so it doesn't
get sucked into stable.

> > Without the dma_sync_single_for_cpu() if swiotlb is used the data
> > will not be copied back into the original buffer if there is no sync.  
> 
> I don't know how SWIOTLB works or even what it is, does any of the 
> microcontrollers embedding freescale ethernet uses that at all ?

AFAIU SWIOTLB basically forces the use of bounce buffers even if the
device can reach the entire DRAM. I think some people also use it for
added security? IDK. I mostly use it to check if I'm using the DMA API
"right" :)
