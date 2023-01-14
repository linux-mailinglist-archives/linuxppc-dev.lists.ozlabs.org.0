Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73DF66A975
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 06:41:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nv6b85qXGz3fCV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 16:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYOeQx8s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYOeQx8s;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nv6ZD4Y9Wz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 16:40:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63C4460B26;
	Sat, 14 Jan 2023 05:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15E7C433D2;
	Sat, 14 Jan 2023 05:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673674816;
	bh=riDHRRZIXAVOQRC0kftpaNw9qgUv5ftVi3KjpAu4yRo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NYOeQx8sFJDX5pqc5wkLxO3o23ZtB5y7bM87008/5oHdkvrZzUnD8YUr3xc/TzjCB
	 PCl/JHw2m+FO8uVJ80gvvnkNZFg18b7L2Y8bcc6SevsNyNVsZKuu1Ty4AXJBeHoS1a
	 Lhd3+a+g2gSCELFiPnrA6qm8CB3TZZmPCBvVQVis0OZRwaoo0M9h2VTxY2waTZ9gAE
	 uPvAza6uUhPjLZaSh6bLkKMBDlafDTL2ZPVZZRMyiD7rowBmeMz1mFfmKuiCB+vRgA
	 duKK/kCvX4f/GmpTZPjoruF/YXgN1Dp9Tj/4sJwQN5IoeaONNpG8JghBM0tdruYI3g
	 2kb8aFEgYEVPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A565BE21EE0;
	Sat, 14 Jan 2023 05:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: wan: Add checks for NULL for utdm in
  undo_uhdlc_init and unmap_si_regs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167367481667.11900.5215482730586989034.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jan 2023 05:40:16 +0000
References: <20230112074703.13558-1-eesina@astralinux.ru>
In-Reply-To: <20230112074703.13558-1-eesina@astralinux.ru>
To: Esina Ekaterina <eesina@astralinux.ru>
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jan 2023 10:47:03 +0300 you wrote:
> If uhdlc_priv_tsa != 1 then utdm is not initialized.
> And if ret != NULL then goto undo_uhdlc_init, where
> utdm is dereferenced. Same if dev == NULL.
> 
> Found by Astra Linux on behalf of Linux Verification Center
> (linuxtesting.org) with SVACE.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: wan: Add checks for NULL for utdm in undo_uhdlc_init and unmap_si_regs
    https://git.kernel.org/netdev/net/c/488e0bf7f34a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


