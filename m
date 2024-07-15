Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133B930D12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 05:41:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkJ7dwxZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMnzw6TM8z3cy9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 13:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkJ7dwxZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMnzD6Hmsz30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 13:40:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0BA2DCE0B9F;
	Mon, 15 Jul 2024 03:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C2A7C4AF0C;
	Mon, 15 Jul 2024 03:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721014835;
	bh=mnT8cXW+QvRBq3wDvKVm8UOmMR1dFpPq2MEHJMeYmQ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rkJ7dwxZ6Y2VZ8a7xFWjsAnnb3uxJ2OgHNulqgkhv7cZK0D3ujwzfslOZJiKzjKlx
	 CJsC/RMje/nmX6xL2FtUGwparYlrxhJW/NwE5+Xf56teu0AbCkHgJ1RJWbZukVjonN
	 ACAw13jwn/0FIinfqDeE4ZvuC2A/PNeCYorp3TGgDrnYr/JQHOiSMnnyssx7xv1nxo
	 eeIub73RxmBf0OS4obTEYjqJ9KhcEkeLHkL4z6JbUvMKYGzHzZPHnCVJbRbLj73p8l
	 +QxKFjt2nPmHrL1ztbzcKi+2QpDkbdc09KFtA7JRF4O8Uav4ranzcg4LwKRF9KnfYQ
	 ApurMpd+bJ9Aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36EE4C43331;
	Mon, 15 Jul 2024 03:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 0/5] Eliminate CONFIG_NR_CPUS dependency in
 dpaa-eth and enable COMPILE_TEST in fsl_qbman
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <172101483522.5253.5175623354065393488.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 03:40:35 +0000
References: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
In-Reply-To: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
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
Cc: herbert@gondor.apana.org.au, madalin.bucur@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, leitao@debian.org, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 14 Jul 2024 01:53:31 +0300 you wrote:
> Breno's previous attempt at enabling COMPILE_TEST for the fsl_qbman
> driver (now included here as patch 5/5) triggered compilation warnings
> for large CONFIG_NR_CPUS values:
> https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
> 
> Patch 1/5 switches two NR_CPUS arrays in the dpaa-eth driver to dynamic
> allocation to avoid that warning. There is more NR_CPUS usage in the
> fsl-qbman driver, but that looks relatively harmless and I couldn't find
> a good reason to change it.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/5] net: dpaa: avoid on-stack arrays of NR_CPUS elements
    https://git.kernel.org/netdev/net-next/c/555a05d84ca2
  - [v2,net-next,2/5] net: dpaa: eliminate NR_CPUS dependency in egress_fqs[] and conf_fqs[]
    https://git.kernel.org/netdev/net-next/c/e7072750bbcb
  - [v2,net-next,3/5] net: dpaa: stop ignoring TX queues past the number of CPUs
    https://git.kernel.org/netdev/net-next/c/e3672a6d5e89
  - [v2,net-next,4/5] net: dpaa: no need to make sure all CPUs receive a corresponding Tx queue
    https://git.kernel.org/netdev/net-next/c/6d2338205d78
  - [v2,net-next,5/5] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
    https://git.kernel.org/netdev/net-next/c/782fe08e9861

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


