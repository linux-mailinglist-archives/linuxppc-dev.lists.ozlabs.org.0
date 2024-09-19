Return-Path: <linuxppc-dev+bounces-1456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246597C46C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 08:48:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8R1G1FDXz2xFm;
	Thu, 19 Sep 2024 16:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726728498;
	cv=none; b=UEi/1Zn1SwRDOU0smiMFDdvpe0TKGkk6bC/wevjCsU5UHQjhtvzl9eXRyeDZH0+4je22tp0Qo8V8vrKDVH4cExojqiyW1u93IwnsaqiJ/8s9Lc6WtLjeq2j9QHap4l0jZffcNO37Tg2TuoQbqwdutu5LOCYjTl4AQPPxuXrMmJSVvSUyCokIG8/Shp2OpvYvfqQ6UgzwOlbm+zCsIbiP6sfzuWZvOc5P80jbxcwM/LgDp1fiDKdCR5GY5UOND4KrS24uR4Kl1Vc5a4p//1aX1fe32AAXKggJJ88k/WV9f8BD7UW7x3Gp7x9uqphqgeKVTB55t3JtLODarMjk0bYa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726728498; c=relaxed/relaxed;
	bh=qzFct2wPC2/ZRn6nkpmX0Kmt6QrEdSXOy7GQnEKjFA4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nx8gqnRF23dWn1qW0FkaEg7Zt43fiX+gOJNvPNBoCqYLbjCWGnO6j4MzmyL/qToF4mGIl4mkJfqC0iCWoLMmBVmJoezABxN7Zve5hc0moKlp9q55nI34xjlPC//GATugT98ne8hQ/uxm9Pa/H9/++95QB4WWvHd6cbN3C6c/lnud83UCrGFg65tyYZy6xDXPTDubYm53N0qXwN8lbRbKsWtcDBkIbb7LYM/DRkCbrgeagbQ1aybgEwwjn5l9BXuBEESSWAHSpkzwEp9dzUR8W3twFNGiOZBFjJJnF82vmMmIJY+Op+Ol71LdRaOyHA6R0fA/6dwrO+PIF2/095s31Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q81Roesj; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q81Roesj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8R1F5gsZz2xCp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 16:48:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CDAEA43AF5;
	Thu, 19 Sep 2024 06:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BBCC4CEC6;
	Thu, 19 Sep 2024 06:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726728494;
	bh=ptlNwoMjKB9av3H5kpJ+WQGwxruc9JPLbe+DNrJLVE8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q81RoesjmcgXs13T7PojFQx/xWI4m2qQ/yhsgAmMGdmpzmk09z0Cwp+3OQO7mQfl4
	 nUbH5y0BGtPTRJe6gS1ynxU7wMi47hLP1/nml8F5g0iUS7e3h/GRjke7DYRPLqEDEN
	 xQ2ZMChb5A2ljV61fuVOc0LklEwORkqblhgyHbqzcpnRFaodnEbxX3Klr8h9Y/uxcO
	 AOOF/OqzhXLcOjU26S7ifaWnVUYcpD4jKiipJ54uEmq8weeuUyHbTMCPF9WARtDNUJ
	 Q9u1usn0lr9Ln7ya70ibPcOm4Ebfnh6vlnCdoIiNhydmBP5LCASu292WKqi9omBJNQ
	 kBr8A23J4YXpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF2A3809A80;
	Thu, 19 Sep 2024 06:48:17 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <8734lxqc1x.fsf@mail.lhotse>
References: <8734lxqc1x.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8734lxqc1x.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-1
X-PR-Tracked-Commit-Id: 39190ac7cff1fd15135fa8e658030d9646fdb5f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a7101e9b27fe97240c2fd430c71e61262447dd1
Message-Id: <172672849627.1360580.1044648835370166976.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2024 06:48:16 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, adubey@linux.ibm.com, alexs@kernel.org, arnd@arndb.de, bgray@linux.ibm.com, christophe.leroy@csgroup.eu, cuigaosheng1@huawei.com, gautam@linux.ibm.com, haren@linux.ibm.com, huangxiaojia2@huawei.com, jk@ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, naveen@kernel.org, nnmlinux@linux.ibm.com, robh@kernel.org, ruanjinjie@huawei.com, tzimmermann@suse.de, u.kleine-koenig@baylibre.com, zhangzekun11@huawei.com
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Thu, 19 Sep 2024 00:19:38 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a7101e9b27fe97240c2fd430c71e61262447dd1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

