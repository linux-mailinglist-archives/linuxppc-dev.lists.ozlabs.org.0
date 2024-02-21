Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20385E81E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 20:51:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ex9gPT2S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg6N01RFNz3dVq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 06:51:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ex9gPT2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg6MF0Scsz3brV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 06:50:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C65C76163D;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 687C1C43390;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708545029;
	bh=7Fv9UpJfx1rHXGyrBVOIkfBWNUxLkQgV7YhfSLbTmpg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ex9gPT2ScoKVKEavIEmFUPWMfyenO7aNFFNomGzvzBHB7fEfzvJ/R9DWViHY4OxmZ
	 uUIe15khQeUJJ0Gk7T3pr9qBrR+Q+1GRZc0KCagkAsxYE6tF5qrRXrugejqpL+4feU
	 wUXJUMWHBddvINHyJgm9XYJmBBdt6lj6F9VH3nXBzYVEPkzJjl9ztsazFgov3Fwdgr
	 tDaaQZu+WGEd47XiDAOJwhOHM/nSj93ULIyl5Rx5wsOz/LmbH5qjHM/1kH1X27fZmc
	 OOxuTHDE75Aun76PwEAIgCCea1UJoWSZ4wtUIi9k3ClSLn4nyEjhPbfbnAqEFjJMJM
	 LfUhSKq2V72YQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B563D84BCB;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170854502930.2044.11543238578824030795.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 19:50:29 +0000
References: <20240214153429.16484-2-palmer@rivosinc.com>
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
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
Cc: apatel@ventanamicro.com, kernel@esmil.dk, gregkh@linuxfoundation.org, atishp@rivosinc.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 14 Feb 2024 07:34:30 -0800 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
> 
> [...]

Here is the summary with links:
  - tty: hvc: Don't enable the RISC-V SBI console by default
    https://git.kernel.org/riscv/c/481860974faa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


