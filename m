Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A917E8DCB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 01:57:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JLb3QwkY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SSZ0M4Tctz3ccX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 11:57:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JLb3QwkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SSYyb5Tt1z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 11:55:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A28B560BCA;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68ACAC433C9;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=VgTVM+5WP2BDA8+eWnnrND2B8DSs8IWm3pfXn96hH5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JLb3QwkYkbpfY3FNvlq0ln90cjF2dCJ/FBjoJvohtlKl5++jjxUpLiRvVRrzLfnMw
	 vqIx6cIMfKr070kpufEO4pDDNYZBrsbey74LmD56VyB6rtMKEMS2PuHv8FlOzAdnko
	 OCS/Hdjzh6S+iL7nZNY1du7wFsPrQPCaydb5KK9mUDp8BLAfADd2autchrBUsE5bXS
	 wtlaPjOEbe6qAkDlAIfra6VZWq2xAq3pay7+/5hPxAYOmrUCJZap1/rY5guetPn+MO
	 WzYBiUUdpnzpd6S0tZndmFihAyu/lQnh1zU4pQRpK3GfZZ53EnlYT1MgSfx2vEGWUx
	 pSeNNz6aY733A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4447AE00088;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] kbuild: remove ARCH_POSTLINK from module builds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <169975054627.11360.14371365860315312701.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231017103742.130927-1-masahiroy@kernel.org>
In-Reply-To: <20231017103742.130927-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: x86@kernel.org, aou@eecs.berkeley.edu, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, dave.hansen@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, nathan@kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, paul.walmsley@sifive.com, hpa@zytor.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org, tsbogend@alpha.franken.de, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue, 17 Oct 2023 19:37:39 +0900 you wrote:
> The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
> 'true' command.
> 
> Remove the meaningless code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> [...]

Here is the summary with links:
  - [1/4] kbuild: remove ARCH_POSTLINK from module builds
    https://git.kernel.org/riscv/c/7f6d8f7e43fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


