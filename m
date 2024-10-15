Return-Path: <linuxppc-dev+bounces-2293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B499F4A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 20:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XShj54Z74z2yQG;
	Wed, 16 Oct 2024 05:00:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729015241;
	cv=none; b=juzvYjcMr463O70QAmdCEU89PNlx1l+iH2Eevh9mh+E6yd2jfR3BBRiXSqp634oNoXqX6QdjVbt+AGnACS6XcSGhfhZawfFx7s9/fLcVr08SnFF8+ewgr/3+zb5d9COwjtri5KpFiobVh3kh2UhVClU6or+9WyrzqkCEULzHT9dQ9aDrfyTcUakpilBLsj8zaXp0j9nTEbvnqfaNBpuIwpLRjV2axWKCBL7L6hoc6JWiIlLUAgcGIUvAgKqwDnWswFVGbIgIb+4OALFGoO8ek8tQrp1TeKqNQyAM5rowGCaDuXKL1Jj352A+uQS2XRdLS6jh97TJarAJdyekXwiAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729015241; c=relaxed/relaxed;
	bh=lzLnLhOjiR2+pVyiXhCYA+BsRyQe1BqT/kIohvcxU10=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KGm3q8p9AMWJGO+hRVYd7/krEtFQjYjKxBOwIAnvTogA+fywxeDvXHWqo9UfnYbNCQ3kZow9/QvYa+h/LXR8GzhgybBcFjWLcSXW/6Mknoo+B3sr4wvopHLak9oo/of2sBvrYeTgvzxpXEcIMzAogckSGJLHv8TqMrNhwXC+Oq6/Y0Qc5o9UTmbDFEsRUBE7FgUhWD51dCV7qJsK+mVBul5nf36Ym1YHDV+ytNiooc9Gcn0aH+mw/BaZ3PSLNLpnwbs5aVbvjX/XPNZgA49KaN99Sd3cwOS+n1XCjQeqHBwrtBGjUYWzEaUcl5pejUmA18I5mzLRzcr0yfEjQesyaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KuGT0VK8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KuGT0VK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XShj35QLZz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 05:00:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 374E6A4215E;
	Tue, 15 Oct 2024 18:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE2EC4CEC7;
	Tue, 15 Oct 2024 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729015235;
	bh=Sa6sgGhK0f0PdlrPB+pJBNsb8BQKXN13Ox+Haom2HEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KuGT0VK8S5iZkpWwdj4icg6/wNAAUrBPevfh4SZqoijO/LK0M//4+TxvzWdvkTnPh
	 ej10iYjREMrmMJ2Gu5Npr2RUIAnkdhPsv3wpjIS9oD4lasA8tAu3GCw1fTFYauLrpu
	 3RuHOcS958KJIGxUYsp0ERB1QMGW0dSsPNdQ80PsrTJLr49xkilO6b+UUnJ05d1/wn
	 JClelGibXCeLsadFDN2D9J1PR77WpKnQ3JH6qPkguuPszYj5ShJSHAIV1To4/BfUf4
	 6EO69W5HKU6Kiqfv8lDFOsDsbIiS0OIBybyVPrn0xkepuW1lWPDAUwAp49hj4XETun
	 TYtKkZ3F14U8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D453809A8A;
	Tue, 15 Oct 2024 18:00:42 +0000 (UTC)
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
 <172901524099.1243233.14809044192149107515.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 18:00:40 +0000
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

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
    https://git.kernel.org/netdev/net-next/c/497e17d80759
  - [03/17] inetpeer: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    https://git.kernel.org/netdev/net-next/c/bb5810d4236b
  - [04/17] ipv6: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    https://git.kernel.org/netdev/net-next/c/85e48bcf294c
  - [05/17] xfrm6_tunnel: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [06/17] batman-adv: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [08/17] net: bridge: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    https://git.kernel.org/netdev/net-next/c/4ac64e570c33
  - [10/17] can: gw: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    (no matching commit)
  - [14/17] kcm: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
    https://git.kernel.org/netdev/net-next/c/7bb3ecbc2b6b
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



