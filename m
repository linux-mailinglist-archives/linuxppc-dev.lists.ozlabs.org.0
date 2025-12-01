Return-Path: <linuxppc-dev+bounces-14555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7D9C9695A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 01 Dec 2025 11:14:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKfrp4xCPz2yv4;
	Mon, 01 Dec 2025 21:14:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764584058;
	cv=none; b=jxWC7ASesDr5ImDBYamUPXqVMiPUqlqmwjkq3yn3zeGKipvHtL8TgBxt3+dDq1CME6YhYIjjwDEwOJFWfEVARNm0uZKGlSghNR5J7yXgaMnv823sqMkpgGmqZEtgKYmn1n44ZVNywkPTqeljwcVJ0Lh7oxn1/o0+yCvI0g5AkV3H+c9keS1biakgJzCUI908qqCMg4m2HEUhrf1YnMdfHVonbCAC0dLxVgP5uVpvDIqFSGVhLUDgtfTRXnUpnhwXX2l+el6jLFbIBgIwe2NMQoau1sixsMZQiXvH6pQFpRPUiKWBnz2t3SihqFhQJWEkC+pqlAHB1Hkuz+k9rhcMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764584058; c=relaxed/relaxed;
	bh=xZxvTB1GxIeyCIXw8ZbCri89NeI0ncQNutkkJIGpuuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqd3ckdITu+qIrGk6xRjWYcJEskgP7thXb4EbiqW5/8/weFLG4pkKlsmBj4QMigD+mPJD1RHT1nybywA0aQIpDsO72girKxzB+KtFr2ObLqv1iwYzp9EtvSfe6iFu5Jk1JnvoOsZBITYFOHHYTNVQIqXWIwrEXRUF1lFkCeBU0dzzVpHI7uOuuXhpVTcvsjHzzqcSbv21+RCj4kLr/kEQHz9JvW4HpWpFlJdglBxMsuI7HyUEN2ndStMebgzg+vp6GoDK46Z4LGW/XvPKWfHOygXMv53KxmRf56BV2OqpMgNnh+NqF+22xmbopvoCnb8mhD+FcTVSmHrB9Q7z2nYcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LoCgp+dQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LoCgp+dQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKfrn5JyDz2ynP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Dec 2025 21:14:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 586AD43DEA;
	Mon,  1 Dec 2025 10:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9177FC4CEF1;
	Mon,  1 Dec 2025 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764584055;
	bh=jbH32GfphK99V2xFL7pk3dVlmunWspL46P+bLaITSAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoCgp+dQTz1kUiasiV0fk3XCrCLAHz2QpTtnOrJYj3XqU1yDONA+FZGf4b/w9MgCB
	 S+9hYNwmGcLu+c0T6KsY2NjpsZaMuYxxwdmiKJsPTg4l2apgtyb4fw+WXI3Vs/MTSr
	 1YDiFjeI0xRpuEYriXU/2pD3FX61lztAjX1OUM6kvdVQizdl8dleaw5+iD6rkbKnNF
	 HpC9gkUKcDwNDcbyludPUXDCowsrDrTi4/wp+jgJ99b1HJ92Az40+hUXvkiS9G7g9/
	 oIuhmEvJjxL//hxS3FKZ0SkYy7oR7veieWSZPWNGPUnDEGLuemhQ1YunqI/zeONjho
	 f/RaCiRhOnlUQ==
Date: Mon, 1 Dec 2025 10:14:10 +0000
From: Simon Horman <horms@kernel.org>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: ps3_gelic_net: Use napi_alloc_skb() and
 napi_gro_receive()
Message-ID: <aS1qciHDiLaK-c2f@horms.kernel.org>
References: <20251130194155.1950980-1-fuchsfl@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130194155.1950980-1-fuchsfl@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 30, 2025 at 08:41:55PM +0100, Florian Fuchs wrote:
> Use the napi functions napi_alloc_skb() and napi_gro_receive() instead
> of netdev_alloc_skb() and netif_receive_skb() for more efficient packet
> receiving. The switch to napi aware functions increases the RX
> throughput, reduces the occurrence of retransmissions and improves the
> resilience against SKB allocation failures.
> 
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
> Note: This change has been tested on real hardware Sony PS3 (CECHL04 PAL),
> the patch was tested for many hours, with continuous system load, high
> network transfer load and injected failslab errors.
> 
> In my tests, the RX throughput increased up to 100% and reduced the
> occurrence of retransmissions drastically, with GRO enabled:
> 
> iperf3 before and after the commit, where PS3 (with this driver) is on
> the receiving side:
> Before: [  5]   0.00-10.00  sec   551 MBytes   462 Mbits/sec receiver
> After:  [  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec receiver
> 
> stats from the sending client to the PS3:
> Before: [  5]   0.00-10.00  sec   552 MBytes   463 Mbits/sec  3151 sender
> After:  [  5]   0.00-10.00  sec  1.09 GBytes   940 Mbits/sec   37  sender

Hi Florian,

Thanks for the rest results and confirming this has
been exercised on real HW.

Thinking out loud:

* I see that the napi_mode argument to gelic_descr_prepare_rx ensures
  that napi_alloc_skb() is only called from softirq context.

* I see that the driver already calls napi_complete_done() in
  it's poll callback, a pre-requisite for using napi_alloc_skb().

So as I understand things the use of the NAPI API by this patch is correct.

And this provides a nice example of the advantages of using this part
of the API.

Reviewed-by: Simon Horman <horms@kernel.org>

