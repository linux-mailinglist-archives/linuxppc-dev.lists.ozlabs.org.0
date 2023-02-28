Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFB6A6258
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 23:21:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRBfK3Vtyz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 09:21:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f94cHrYb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f94cHrYb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRBdM4pFnz3bhP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 09:20:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 24F83B80ED5;
	Tue, 28 Feb 2023 22:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4F63C433D2;
	Tue, 28 Feb 2023 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677622817;
	bh=ppvw0cxQI4JUhJxcTuOANj+eLyjWJ0rOYMJFU7anKAA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f94cHrYbIQXeA9UEKLVi0Qc/wp7x6VynPGkBe57Z8RWOGW4auwjaXGRfAyumpPtVg
	 NDpWgyp4u5kwz3qDUXV5S49XR5O0PQHhykhL5GHtxblkm+5kiy7NEoymgJ8++D73k1
	 NYeK75uTZEJi4UXXEFA6zixIhkLJGGwV2T/C9dQKh1r5sHeAkKU4vBBpHkvLed2Pxl
	 bD7iAQGR1narZuzteL19aOW9CUwv81VzKXCpWo4y7B0rntXrQY/nhYuTu3N2hyXJIr
	 qrAEFJz6pN6/siYbcOwkTaN3d9kihl/x+zew6EtuIUWW0ScLCcPSCOq3jWx7Ysit5a
	 Tvqkr6+XT53aA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ABF6DC691DE;
	Tue, 28 Feb 2023 22:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Freescale T1040RDB DTS updates
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167762281770.1436.1743470013249301155.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 22:20:17 +0000
References: <20230224155941.514638-1-vladimir.oltean@nxp.com>
In-Reply-To: <20230224155941.514638-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, fido_max@inbox.ru, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, netdev@vger.kernel.org, bigunclemax@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 24 Feb 2023 17:59:38 +0200 you wrote:
> This contains a fix for the new device tree for the T1040RDB rev A
> board, which never worked, and an update to enable multiple CPU port
> support for all revisions of the T1040RDB.
> 
> Vladimir Oltean (2):
>   powerpc: dts: t1040rdb: fix compatible string for Rev A boards
>   powerpc: dts: t1040rdb: enable both CPU ports
> 
> [...]

Here is the summary with links:
  - [1/2] powerpc: dts: t1040rdb: fix compatible string for Rev A boards
    https://git.kernel.org/netdev/net/c/ae44f1c9d1fc
  - [2/2] powerpc: dts: t1040rdb: enable both CPU ports
    https://git.kernel.org/netdev/net/c/8b322f9fdb35

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


