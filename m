Return-Path: <linuxppc-dev+bounces-14559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F24C99B1B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 02:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dL2Zq1KpZz2yvC;
	Tue, 02 Dec 2025 12:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764637411;
	cv=none; b=YrMgwkfC9z4cx518lvHupL38c0lCBU45PdzJT+/cVQLgpE5Z+7gAueHxGtzBuSfBUvIwFEzkU63I7ws2rkr8hTBxWjHldL6XGQsjSIPI916QqK9rqkkdGORCed/tdfrMFO8OqXX8QpvaTYIOXzDXWINhHhjaxDbV6eUjfG8UO0UT2T4GJEn/I5b5wIeUwdDEbGCSpE0V6Wfj+MoPh8cJSgGsMxUTiGMVfoa3qfphrJ9AQT4gEQJNYMIxWF64+y7e2259vtS5zQgRa2uJEyFyBo1lWwde5Cbe99ZbRIcsp/J+i8CobNJq+avIho+5AZXyixCSGlJk9szqRi5CKRVtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764637411; c=relaxed/relaxed;
	bh=tn9xTOI6uuLhmDauvjhrqM19z0sTEgCk6SeSHGlnlMA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Uk/ven7y6fHW5+oulEtPAHIGzFTwytAN6MNOjr12QYmxZLVqyjX1/iB8MKXDD1tnbWpjv/X8n7jaPPmgsOmTCPfapkPuAfwhWUtQaQzPt+Q3Urm/SdnlbV5zsXHkqofzEybeD2fx8Ab+i3r8aY1aSOE8+Q3+8B1C5i8OS+sVldnmL+SSQ++oaMbAfMeKzsNniBor2VHttKfP2PbDOR5Mjx3bnHCXZ3g1a9KK4rojdIwJmJR6BX8HGnvvhytacbhNeNVpDy0xoIovcQmvyDw2jOtPzbaDUdFSl83zDT8RVqzpBjVxh69Y5fNrjnSK1T9tUZAKm+ghzpzEoY9hApqQAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O6q/LtSw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O6q/LtSw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dL2Zn6sX5z2xqs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 12:03:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01F196018D;
	Tue,  2 Dec 2025 01:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E7FC4CEF1;
	Tue,  2 Dec 2025 01:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764637406;
	bh=bDUyO/8pwGPWgnqf9TEf/6/As5sSaALRjTm2IoGnL+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O6q/LtSwmyMowyRrOlHRD+XK4tslIK0Nv9ZI9OrhWeCRqKt/ptBO55pqlaTKUYJJB
	 ry+OOAs+60ZNBUXURm56TiQqL+D7PSR5aeXuwuUPBy1EFCQ/7QYlmEhtQFy7aRl5IP
	 Q8bVanK8ef3Jk0CjIzgipXfnzltfHTKYaH/erOByZNJYrywk0lhWLRYxaQbV6wQAxi
	 HOvWixVP0UqhYK3xKPtVvsciYvz0qrwKgKgTo2eFK3dtQmUcOXIIWttxijF9PqP4vd
	 yI2JXlq6IZYLzbc+Z6JuF4UK/ZQOwJ3Q1znuvgni51fdzekbRADw4KW7yTsrzY992N
	 2KSlUg8B4Nc2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5816381196B;
	Tue,  2 Dec 2025 01:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ps3_gelic_net: Use napi_alloc_skb() and
 napi_gro_receive()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176463722628.2619157.40495973344298966.git-patchwork-notify@kernel.org>
Date: Tue, 02 Dec 2025 01:00:26 +0000
References: <20251130194155.1950980-1-fuchsfl@gmail.com>
In-Reply-To: <20251130194155.1950980-1-fuchsfl@gmail.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: geoff@infradead.org, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 30 Nov 2025 20:41:55 +0100 you wrote:
> Use the napi functions napi_alloc_skb() and napi_gro_receive() instead
> of netdev_alloc_skb() and netif_receive_skb() for more efficient packet
> receiving. The switch to napi aware functions increases the RX
> throughput, reduces the occurrence of retransmissions and improves the
> resilience against SKB allocation failures.
> 
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ps3_gelic_net: Use napi_alloc_skb() and napi_gro_receive()
    https://git.kernel.org/netdev/net-next/c/d8e08149a5ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



