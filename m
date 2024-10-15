Return-Path: <linuxppc-dev+bounces-2294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773B99F4A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 20:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XShj54tZ2z3bkf;
	Wed, 16 Oct 2024 05:00:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729015241;
	cv=none; b=D5czz2bCVYboccSf2a+vil5Cod6lfbHv2nECw/C4mzb5oBDQavEVtGnab8sMTFNBb7stQqOZSt3umyDRbMmqqcHiWhKoR5GzD2Ov/GrXt8+DUhup9K0tSAMVuttqcTD/S21DnW6uw6uA9otoJ6AlGKfz+9te4EAh66L+8H4avHo6L4+AU9K6pLHvmv40pXCZHFlRCkPQKgSaeg/BW06C+yIPJAHg7kY82MqgSU+KJ8GCL5Vhu9TC/JgK6YdzWSWe82g5Mc1YAn1hnYsZYKFc0sWPQJ6MHlzIQgFQ5Ue1yT17Sbwoe7GDD4CAQ10J+T9Ai2aqSRnTgaNcvqjHvIJYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729015241; c=relaxed/relaxed;
	bh=UycHUPt3C5ovfpOU+xjajy0eNdPuzlc0JNWgs4wefbc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aEz28sxN9emZCzA+Bf32ZW/0beAkeXs3fgyNRBmvmGk6fdRG+WTHHIIl/CCmWMWboUl3MuHJBX4nRGxabOl+kMu18Jh4o3dH7F4qzmZpKJZEzhmcaoXzgfFNja0PN2RwSqMMViyQY1YXOIcxjNuTJcwdxvoEZW5DT35woLYB5vtdC923lPlPFSsiM+ZDw25tteW/+AnMx3F8OvVr6m6OjMdNrHtl+QVbiFsJM/4KeqNl/JjtmtBRL/x0Tqz/oH1PIce1Js4bEHI/HbJehkqKKDfK5Gkt2fUGUnKz9EqJU1X6ojGTqAU8ysBGk4eih3zv1oeu7LNMJ9sFjGtMPfB/IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=amSCJzcA; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=amSCJzcA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XShj43J1Lz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 05:00:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 328CE5C5E78;
	Tue, 15 Oct 2024 18:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455A5C4CEC7;
	Tue, 15 Oct 2024 18:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729015237;
	bh=fdbd65EpwTQwaAunrY+wHtKWSQ6zq5EpEVq1loN4KaI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=amSCJzcApuRPxhbYBQKcE1D2W1DIsFnjQ8nbXR66jYXTIHhGfjQBuSqZjXla1czfq
	 cJ8vab6ReUUNkjxiBCBNNACyrrJX4efZO2DmKuVdOjsfBSrNmfkzUjpKoS9ZowtkoH
	 yMupU+NO2xvA8HilkmSxz3qclhOn9DyoiLpMrH3cnBo7U1MGYAiNX5H4ad1/gSBmdd
	 wuu8mPy2URn3X4Y0h8oa3I0UkV8sJBAHv0PxB8/11g3wBklMMgXE2Xyme64TRiVM/j
	 Ut3d5rwA5efDp1iZdqFByi4SadoKfShEuSNdgngXxngX+WS5Gx5WsEZO3iZ9oX8SH3
	 a+v/WTS4dGdLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B02BF3809A8A;
	Tue, 15 Oct 2024 18:00:43 +0000 (UTC)
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
Subject: Re: [PATCH 0/2] net: ethernet: freescale: Use %pa to format
 resource_size_t
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172901524224.1243233.8750809850342370605.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 18:00:42 +0000
References: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
In-Reply-To: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, pantelis.antoniou@gmail.com, geert@linux-m68k.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Oct 2024 11:48:06 +0100 you wrote:
> Hi,
> 
> This short series addersses the formatting of variables of
> type resource_size_t in freescale drivers.
> 
> The correct format string for resource_size_t is %pa which
> acts on the address of the variable to be formatted [1].
> 
> [...]

Here is the summary with links:
  - [1/2] net: fec_mpc52xx_phy: Use %pa to format resource_size_t
    https://git.kernel.org/netdev/net-next/c/020bfdc4ed94
  - [2/2] net: ethernet: fs_enet: Use %pa to format resource_size_t
    https://git.kernel.org/netdev/net-next/c/45fe45fada26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



