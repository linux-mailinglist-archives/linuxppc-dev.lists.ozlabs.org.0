Return-Path: <linuxppc-dev+bounces-8454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A6AB08C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 05:20:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtvQ012CXz2yfS;
	Fri,  9 May 2025 13:20:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746760808;
	cv=none; b=YRARWFql1skON53vLsVBf4ucusCW4MVbPRnXrjqNmIgfKQu4w/32K9i3iUtH2ZD0X7RxrUo1sqJ1yDHYJG5jfwZQNsSWH5/Lbefn7qln+phGWwaNKOcI5veeDfSZDXvWhYc76f1kiPJc+RyyOkJXwCZeXuEWPCfLCJaVwuY0Pvjjfokwzl44G4xXMF9E9uaPLznl6VbQQKYOxCBpIYj2e+amiOHM3VJBQhEArN3HGMsS50PcT3n5iRh4TyCpQlBxzoabVNQ1REKsMKJXrL3nsYBJgAxma2MFob3EsGYR2uSpdoHxZqZs0T7FE4WewmUKBMxx8r7xpBqnvLsm3Bmm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746760808; c=relaxed/relaxed;
	bh=rsjVb3bVFbqZxCpwgqOn0OzmwPrb1CwyQw6zTxUSgRk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SNnAHDjBrSEX6JoUgs5sNylHovKAj6QmQOQfRofHXhwbhJ7SWKMJcpSIg3wkNYCNKAemIKtMobJwCi0wYCr1ssEWQXlaLSeKJbj7HI7IX3HHrh5wGmJn7MK/TigGeabq497+BEWNe1AEjh1SbyFfnIBlhQYs6nQkEFCTH/BJsFOWZtpSjWUdXCnFYBlADJpgkMf+mz28OMrYFoCwRr4gmPgJANZto0aaRq90ZYYunHZDjbHotABYZX5retOdLynT340gMQkAb4hDx/7B0qTI79E69YNI7MeuX6AvRdB0LYcdkci+OSvoxzHPdl0l4pU/ybtEcR7BP2InLvhHsoXQ5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyi099k6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyi099k6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtvPy6rxGz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 13:20:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 953CB49EC8;
	Fri,  9 May 2025 03:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C55C4CEE7;
	Fri,  9 May 2025 03:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746760804;
	bh=NY9f4q2kixUeTEknFQvFoV+AD+81IXXwblbM2CctxyA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lyi099k6fyh1ahKM/tIi2w1iD/oHFITWbewaXU85RAhs+2ImiRhUMBLcf1bBVf0Cg
	 IUDKwZdC220PhgWaq7heBSTYpoTXLtChkVBQDVdT3N0UMiRsFfifWyASo5x1ET2GWH
	 5TJUM319B4kyqdQ7xFGWDdlATCmBwMy2FnH7kZ02beNN9qepzcvadR1eI0h5jqExlj
	 gvS8iSfn1Fo06yiztqXMR531F175M5zkI5XoaE7PyjFTJvdoElQZr4P4t6Me+0ZXQY
	 OqVZk/Y2E8RLNk+gDJ99htcy2OYiD4iNe7FQ2Xg2fpwyiGAKmsEl6yQH/2GLY4K+Ov
	 Z0BlxGOkIyVwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BFF380AA7D;
	Fri,  9 May 2025 03:20:44 +0000 (UTC)
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
Subject: Re: [PATCH v7 net-next 00/14] Add more features for ENETC v4 - round 2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174676084300.3115683.12773669022927548558.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 03:20:43 +0000
References: <20250506080735.3444381-1-wei.fang@nxp.com>
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 timur@kernel.org
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  6 May 2025 16:07:21 +0800 you wrote:
> This patch set adds the following features.
> 1. Compared with ENETC v1, the formats of tables and command BD of ENETC
> v4 have changed significantly, and the two are not compatible. Therefore,
> in order to support the NETC Table Management Protocol (NTMP) v2.0, we
> introduced the netc-lib driver and added support for MAC address filter
> table and RSS table.
> 2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
> 3. Add RSS support for i.MX95 ENETC PF.
> 4. Add loopback support for i.MX95 ENETC PF.
> 
> [...]

Here is the summary with links:
  - [v7,net-next,01/14] net: enetc: add initial netc-lib driver to support NTMP
    https://git.kernel.org/netdev/net-next/c/4701073c3deb
  - [v7,net-next,02/14] net: enetc: add command BD ring support for i.MX95 ENETC
    https://git.kernel.org/netdev/net-next/c/e3f4a0a8ddb4
  - [v7,net-next,03/14] net: enetc: move generic MAC filtering interfaces to enetc-core
    https://git.kernel.org/netdev/net-next/c/401dbdd1c23c
  - [v7,net-next,04/14] net: enetc: add MAC filtering for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/6c5bafba347b
  - [v7,net-next,05/14] net: enetc: add debugfs interface to dump MAC filter
    https://git.kernel.org/netdev/net-next/c/df6cb0958089
  - [v7,net-next,06/14] net: enetc: add set/get_rss_table() hooks to enetc_si_ops
    https://git.kernel.org/netdev/net-next/c/66b3fb001156
  - [v7,net-next,07/14] net: enetc: make enetc_set_rss_key() reusable
    https://git.kernel.org/netdev/net-next/c/7e1af4d6e4b4
  - [v7,net-next,08/14] net: enetc: add RSS support for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/2627e9873d69
  - [v7,net-next,09/14] net: enetc: change enetc_set_rss() to void type
    https://git.kernel.org/netdev/net-next/c/42fb12220ade
  - [v7,net-next,10/14] net: enetc: enable RSS feature by default
    https://git.kernel.org/netdev/net-next/c/2219281242fc
  - [v7,net-next,11/14] net: enetc: extract enetc_refresh_vlan_ht_filter()
    https://git.kernel.org/netdev/net-next/c/014e33e2d8e9
  - [v7,net-next,12/14] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
    https://git.kernel.org/netdev/net-next/c/5d7f6f6836a1
  - [v7,net-next,13/14] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/f7d30ef6c1f7
  - [v7,net-next,14/14] net: enetc: add loopback support for i.MX95 ENETC PF
    https://git.kernel.org/netdev/net-next/c/932ce98041ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



