Return-Path: <linuxppc-dev+bounces-6109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DFA31A9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 01:40:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YszxD02bnz2yT0;
	Wed, 12 Feb 2025 11:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739320815;
	cv=none; b=FPQZFLBLOThsPO5p61ma4yFrXEjS7iSFb7CRclFxzGVQ8x5p60BisColthQg50BxeaT4Dgn1bsqbKG35+rPLLZpxxTqZ99QCqtYaK/Jh8B4rkUwQ0j2QthQSZSYVu3CQwuodJA39nD0MoPAhb2wmV0CIPKqCXlQOTW++y3Amx9cRw73x4cmi1JNsrWEtitc+jO2rPAQTzVhDN5/aGQsoEkiA4s5dn2CE/luOPiRjZI4fpGrUl6FY5PMm4Wb0WokC0bhtyjXhh7t0oEafwly5Y121xWPgbHRXzGyQVrdr+dtKG3IiWn/IX3PbrgksfOhOASbJ/38NCEpEPzVPCVNJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739320815; c=relaxed/relaxed;
	bh=WUIal7aeLSsOtvKYvsfp9WyJa5sgjG3eLyUdBhcygZ4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X8hqmbQ8TKPs5OLo8/bs0BIRcg7KGHDTNOZVqEi0dZ4ews6dnTHzO3+YWfri6rePLAAbj/5mNTNFoLudGD9emYk6KxLuuE/vDsQqNFRLbwd9pvTJHdwvt3/dmGkipKYrgGr6GZtHU+XA8tjWb5YXjuxOj41nsBJuArsV30p+2fyYaAfqEsuGKuiUHzGbhXveXZSeKaQ64/+ZRKb3lLJjEVeU9KXuReRosCr6+aj0R7+n1+InRzEf6J5K7sP+do+nar4cMoyVjxz9dWTMmsK8k/oLcLSk5iGsdZtbQ7Cg6Zi0vdNR5DdhZH9di4GQgDZpEiRviAfP3FhiH95AonRE5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L9faVQOF; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L9faVQOF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YszxC1wzyz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 11:40:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A110C5C5931;
	Wed, 12 Feb 2025 00:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5009C4CEE2;
	Wed, 12 Feb 2025 00:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739320811;
	bh=sFQdsqmjBtaONpq1J63ZKj4vncEBg0DemI5C7BzHWio=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L9faVQOFRqI147rOIATp4F88iCNKKoIoQomR/RK0kktOjQmMekAxif2HismJxIhD0
	 t5F01QkOM9/w2HD0pw1Fj3O3Dg6GKgdQeitRk5MKlBGXlemkBK6S2oL27qWUQy4SEL
	 pqVIHIO5D/yb1lLuo/AO/b8o0LIJblzABKkkqt7i9sz3hGVfUmT2LFM0itvVTCCETE
	 rvkxqV6SROmVoydwh64cGt4kLHlMd7T0OEz3sWGqU0qQV40yo2VPspgJugh2ejI8G6
	 X8iTYypgtYHQBg3o7whbQi9fRBT5MxOVLXxsok3yimKihrRaNDOI9Y9o3BhZDR4pdO
	 p7qjetUc+IqxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEDF380AA7A;
	Wed, 12 Feb 2025 00:40:41 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: freescale: ucc_geth: remove unused
 PHY_INIT_TIMEOUT and PHY_CHANGE_TIME
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173932084074.51333.14505766917767218539.git-patchwork-notify@kernel.org>
Date: Wed, 12 Feb 2025 00:40:40 +0000
References: <62e9429b-57e0-42ec-96a5-6a89553f441d@gmail.com>
In-Reply-To: <62e9429b-57e0-42ec-96a5-6a89553f441d@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 9 Feb 2025 13:27:44 +0100 you wrote:
> Both definitions are unused. Last users have been removed with:
> 
> 1577ecef7666 ("netdev: Merge UCC and gianfar MDIO bus drivers")
> 728de4c927a3 ("ucc_geth: migrate ucc_geth to phylib")
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: freescale: ucc_geth: remove unused PHY_INIT_TIMEOUT and PHY_CHANGE_TIME
    https://git.kernel.org/netdev/net-next/c/8729a9bd6efc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



