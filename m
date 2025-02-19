Return-Path: <linuxppc-dev+bounces-6335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19756A3AF6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 03:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyKqP005fz2yVV;
	Wed, 19 Feb 2025 13:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739931616;
	cv=none; b=nk8MS6TQkF5OzgmuRDwnb8TdUvGWQBZKa59RO5U+rVTkwz0JVsmZxSb2zce748k1ed3buYq6mo2ReUiXKkdXnOMwC0wgBLDgIeusVnTjSGwLyby8YdTIliRUg+81XTFk6ZIjyUzyJkgOeMB++5Hxy/AOyws6Ou0aNsKyYSJA5U5ucAppFZx+V9PaBDiZMBt8Zauu/l5CZcAbW1PgRSUgubwqsuvRWfWH1zGKD/qI+nFoszWkDQBCnjBlxt5gPQed+LSnSv8j2e7pIrKna4I7jIKBSvKzeT9KJf+qXoS8JEZtFjlZJ3OnvgEA8FfzDBmXSRl4frGxs93gi94KR41rPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739931616; c=relaxed/relaxed;
	bh=DD0XCY8zGH6GkNF/UcgysF3Ct23WytYoV+nWp3swWbs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VtPlBBYYWDkQzrZzRxBX6pJf1kk3qEyvaIgFZecNTEgZMyAio9u4wjnnk9xJg2mPHhsM1uZGtCqIM1m3zYHk81bB86SkIOjU2FXAOy+fx2Fcc38YEUrhwwbwxYUqXjmktU8dYZFgf97cYtBCetfYF0Q9fAlgWOJF5HkotbzM5xTwPgL6ijN4y/nNqUtw6aPCTeiDhinpkrdCIuKlbzKcx+qLiXy4Va1sD1LRirC5PCuQmYruxHaF0DrVtt0OQzNlCBpg4Ab/MuspnBJuMPFEeMvntBWZI7OxukJQtz/cEMuaOOQg+9DPwlWBvurp7uN97U+NY0pqgUF0Hr5Cv6I0Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Il+Dr8Nd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Il+Dr8Nd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyKqN14Gtz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 13:20:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA06EA41E73;
	Wed, 19 Feb 2025 02:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54185C4CEE6;
	Wed, 19 Feb 2025 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739931613;
	bh=0CyhWYhXDBlIB6Qh2fGk05QwoUJ2RZHUJnVpXYQBqwA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Il+Dr8NdQfuUvY05MSV16sGLzKBHYhg5eedR3VJUC86DKgwUa6I/u/M5UDnlyjy96
	 NVs47Xuw1omZ38o7OqU5rciKOcxMbl9LU2lWrvaXrCkVJz4SwOvvz5ZdAQJYkKz/NU
	 qX8bBCER6rY9i7cry7egoRFiV2OgVwqk4aENNLiMahdD70JMKw1bLrXi9H6g+YqzPj
	 PlaxE75+x17PTDSK34ObHjjM4DbvwXlkBIU8xyaFzaPMsLhm71DwbgjpKrdpQn4Kio
	 58bGbXAWjL5Aob34zatKTdMnPwWE/u33ruZqjS5FncXv5YIZe4HxDMdygRWSilMcod
	 +6TzwcGpM3DnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFBC380AAE9;
	Wed, 19 Feb 2025 02:20:44 +0000 (UTC)
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] net: freescale: ucc_geth: make ugeth_mac_ops be static
 const
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173993164374.106119.1367597441437405463.git-patchwork-notify@kernel.org>
Date: Wed, 19 Feb 2025 02:20:43 +0000
References: <tencent_30122FBA93E93911578208176E68AA00C807@qq.com>
In-Reply-To: <tencent_30122FBA93E93911578208176E68AA00C807@qq.com>
To: None <xiaopeitux@foxmail.com>
Cc: andrew+netdev@lunn.ch, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, xiaopei01@kylinos.cn, lkp@intel.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 17 Feb 2025 09:29:30 +0800 you wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> sparse warning:
>     sparse: symbol 'ugeth_mac_ops' was not declared. Should it be
> static.
> 
> Add static to fix sparse warnings and add const. phylink_create() will
> accept a const struct.
> 
> [...]

Here is the summary with links:
  - [V2] net: freescale: ucc_geth: make ugeth_mac_ops be static const
    https://git.kernel.org/netdev/net-next/c/9faaaef27c5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



