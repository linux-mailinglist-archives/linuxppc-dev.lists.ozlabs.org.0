Return-Path: <linuxppc-dev+bounces-14126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B6C52BA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 15:31:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d65Sh4VGfz2yvJ;
	Thu, 13 Nov 2025 01:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762957908;
	cv=none; b=cRqLSrBj8ecIe7LAYLGOKcXCMTN7UlHZBHWwSoScrvp0PbDDzDdUs5HTU9e0AIzNG057RQyAI0XIcom979j3K/n2Tpg6a+jXX1Rdi+udZL7GLgWTWQ+kn+wvVRlGLpGsNgP0QToD0/yFtsADUy1t+sibI7G2+rhSA6HWTq5CI+rXvytPN12/hj0uv0/VVlsXCskAIto6Cc+uzXd5eGk9NZ2ZvtrOhHdKEQFi2yfTEfpg3aBit8EF3V0NX8L3RCgDlqEsRQhfjgEx1myGcDtTSt1ZQEKJlBape/yGiA1D7Nd6OmHX88mHbL6LkNehrtoaGOon2GCpTCKuLOdM+O70zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762957908; c=relaxed/relaxed;
	bh=MukasWcD2HlrVrLej9eLTyub9bgX8lgt4xPdv4L4T3w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3CurZqd/6vnWmJLdiDMwk6RZXCUZhO8cdbTxuQmJtRtTmcIN8zOCwIKe/8VBmONvkgsEiTprOr8CpWeqmttbAsg8KZyI5Bx2W60Tme/i9Z0LAVHeCmfvQF932h2H3wiGyCR1mR9GUCqGXH8fJQtZk2+ADkr40vT1sPJpAbl1F1gVM/nRdaglqvK9tzzHsPJ3ohnS0FciVJAi0gqB8EcSHQ3cUmxUGqsPs99MJ+k8ogXAguxf6YK8H/9Q3VRmt6rwiLLS6uLsvXJVUYS3Pjk6IPUc1gSe45qajRdrGNuKTD3+vCXwuPoA3Bt8/B6bvA4ggSD4jtltmpOG26CSafHdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIinGQwg; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GIinGQwg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d65Sg6dKPz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 01:31:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A09B26021C;
	Wed, 12 Nov 2025 14:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32E1C4CEF5;
	Wed, 12 Nov 2025 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762957905;
	bh=Zh735Muu3xEoGfWdwvFpedTcy89mgtmJ14KbCy/3EQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GIinGQwghyLFcbqlaCIqJdMQRe/oeTlsFI8shPpORhabfRb0llPMkSikbIEd/JZiK
	 +gBPQOsFBELK1bMqOdX+yU7Sn3GfSNLITAxYB0gjD3FL260k1FYnk/QWT86Ilv7G9S
	 YQppZvMVUWCXvbcjoevdvtKdBAqw6OGpHaM5bhHPQtGrqYCG2MsqWGlz9ufN5kx+o6
	 C1F5qOC3ET/u09SZQQv0w0hYR4eDjHSanx15/qQ49GB0p8xKafEKuqvgDT/cgjs43k
	 l8NhT0rSDWDwEKKTWVrEG7CsCmalw1FY9fvBx3gx5TEfqSDwyyDWcTX9hUe3uwRNH0
	 vKTUa3Nh0HI5w==
Date: Wed, 12 Nov 2025 06:31:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ps3_gelic_net: handle skb allocation failures
Message-ID: <20251112063143.1040d431@kernel.org>
In-Reply-To: <aRRUiYIrOcpSiakH@lithos>
References: <20251110114523.3099559-1-fuchsfl@gmail.com>
	<20251111180451.0ef1dc9c@kernel.org>
	<aRRUiYIrOcpSiakH@lithos>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 12 Nov 2025 10:34:01 +0100 Florian Fuchs wrote:
> > > --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> > > +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> > > @@ -259,6 +259,7 @@ void gelic_card_down(struct gelic_card *card)
> > >  	mutex_lock(&card->updown_lock);
> > >  	if (atomic_dec_if_positive(&card->users) == 0) {
> > >  		pr_debug("%s: real do\n", __func__);
> > > +		timer_delete_sync(&card->rx_oom_timer);
> > >  		napi_disable(&card->napi);  
> > 
> > I think the ordering here should be inverted  
> 
> I thought, that there might be a race condition in the inverted order
> like that napi gets re-enabled by the timer in between of the down:
> 
> 1. napi_disable
> 2. rx_oom_timer runs and calls napi_schedule again
> 3. timer_delete_sync
> 
> So the timer is deleted first, to prevent any possibility to run.

napi_disable() makes napi_schedule() a nop (it makes it look like it's
already scheduled).

> > TBH handling the OOM inside the Rx function seems a little fragile.
> > What if there is a packet to Rx as we enter. I don't see any loop here
> > it just replaces the used buffer..  
> 
> I am not sure, the handling needs to happen, when the skb allocation
> fails, and that happens in the rx function, right? I am open to better
> fitting fix position.

Purely from the structure of the code PoV it'd be cleaner if the
alloc/refill was separate from the processing so we can call just 
that part.

But looking closer I think the handling is fine as is. So I think
just addressing the nits is fine for v2

