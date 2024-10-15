Return-Path: <linuxppc-dev+bounces-2287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4999EDE5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 15:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSZwt215Nz3bpP;
	Wed, 16 Oct 2024 00:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728999630;
	cv=none; b=c0oJcohXW9rLrwNO8tW3UVrdpbd7uOJ/Ts8SaxmklnwLKiPADBdGeLHxL0Gg93G9LmMTzuUK6EW0yzFZOWU7DK9bVvnf1MBtN8ihFRpXJW+sEHdQQw9XhyWtN5AA12uxFS5vrdyNcrYW+YHjq1ZLyEOnd9qr+16yAKUPsjv1DEdPdu1tzIRTOVjKAFQwzwU0Jan6M0kX81j9LYe/yQyA+6xui4iETc/EGQOnQlPz018eZ6p4E3pk3l0rk252G5jJoHeXcffXfOEjS2m2eI2mdZl7pm2HWXqV2Sk22vZ80tER6iA5v91RkUhAdKLxJPoN2WaQgFXlbqYk+xXnhChP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728999630; c=relaxed/relaxed;
	bh=y+sDwZCNM90KYt/soAlpYgBe1DdAWGrVEXxeOWfj4Jg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nBi1vmX9QloocmpsvwJyTRUbWrCFIXPtyjamjEVm7NR6+ytQGTBtKiTxsKImWT7G2+ZiDW73uFzCVBOY0sSSAw5tkzUX9i/w9bi6i9biaQylA9J64hq3PjnJeT1TABqUfQoa64rOahck6F30+D0SgmsC0uL9HBBEL5/2UHcv/0ygzJxP2OsgaNIDFpO20d2Hr5g6KwLTpx83KL9jS0UZiIaLJNvk7VDACY2cR/iIjjFWFHmRswFoP9UtU3+yS7/vHl7nk1VIzii96xFtbFlnT8lDBU5vPnFc+mDy2c2I42R8lP+BF/LYZMPejxdklvRc7cbu3G/iX0kjEOaTbJAo8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uX00nqRb; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uX00nqRb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSZws15ttz3bnm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 00:40:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E51EB5C58C6;
	Tue, 15 Oct 2024 13:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D07C4CEC6;
	Tue, 15 Oct 2024 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728999626;
	bh=+eg5Ogets9SiLlYwP2uE1cyuHarfu0eMJpCc1LNOyZk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uX00nqRbj0TEG1Tz8shbGOT2WxuN/MzsJ0/O8D6fMk7nTY7nynwkrPoV5Izq1912G
	 MCNxilzGTiCcfUAS5pjSXwW6q3cRG/BW6D6YbtnmlO0q+fhZtWAV8iW5Tl912r9gZP
	 jE929Z//XzSjfIYVBdbbV+yN6bRsMcoaXu9P5SmP/HpGUsX8oWRvpS3y/CHIagsxmZ
	 wSs02+S5+DmmcEkoZwbxu00ArbFRTvF91bDqH9pPk66sN6FjSlgd1oE0CGyqAvnLq/
	 xoAmzPiMCVa7yA7fqt68pGzpMEomnxnAVW+/H1RaLmsld8vRk3GlFiM5j84R4We9bm
	 NTYamxloL6Fqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B943809A8A;
	Tue, 15 Oct 2024 13:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/17] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172899963173.1165800.13282848624565322990.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 13:40:31 +0000
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 vbabka@suse.cz, paulmck@kernel.org, tom@talpey.com, Dai.Ngo@oracle.com,
 okorniev@redhat.com, neilb@suse.de, linux-can@vger.kernel.org,
 bridge@lists.linux.dev, b.a.t.m.a.n@lists.open-mesh.org,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-block@vger.kernel.org, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Simon Wunderlich <sw@simonwunderlich.de>:

On Sun, 13 Oct 2024 22:16:47 +0200 you wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.
> 
> [...]

Here is the summary with links:
  - [01/17] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [02/17] ipv4: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [03/17] inetpeer: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [04/17] ipv6: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [05/17] xfrm6_tunnel: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [06/17] batman-adv: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    https://git.kernel.org/netdev/net-next/c/356c81b6c494
  - [08/17] net: bridge: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [10/17] can: gw: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [14/17] kcm: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [15/17] netfilter: nf_conncount: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [16/17] netfilter: expect: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [17/17] netfilter: xt_hashlimit: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



