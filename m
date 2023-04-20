Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110B6E9AFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 19:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2Q1f2KyTz3f57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 03:41:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=swcqEAzz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=swcqEAzz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2Q0n6Ts4z3c38
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 03:40:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9563C64731;
	Thu, 20 Apr 2023 17:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F125BC433EF;
	Thu, 20 Apr 2023 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682012422;
	bh=xx+vnuJ8fbBXHjt5KUhqykE72X3YbB4D+HrbBLN/fp0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=swcqEAzzNfF4PbGtLC+Y1g8NIPrhqMOJudKRPHs5s2Csb72NKfNl3YFeGxGY/Zjug
	 mgDaBG1UiPHXP5gDhO5hZyyePMOqFVTrVQVAZtyXaaTobM+RSFX9sZMGuEAZzBK3/v
	 1jzJz7qSpleZTattS492X+EGgmP5uB7+UQs0GORMgqN2ZnP9tvicgu0W49TS9ELd5P
	 2SVRXYj2Ocu9C0rFm5WXUA+bzPprIweNTq5un4A4W8wRDrlJ7n41p+gmAmClYNyHiN
	 lPlV+xhImalzbHl1zYFi22w5s33BGoaaTU+sICbNfEDgu6SSxslrYCsLHK3zP0tG6F
	 msYaLIlP1PKhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2810E270E2;
	Thu, 20 Apr 2023 17:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168201242185.9373.5416270250289201005.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 17:40:21 +0000
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
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
Cc: aou@eecs.berkeley.edu, linux-kbuild@vger.kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, bjorn@kernel.org, palmer@dabbelt.com, npiggin@gmail.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 29 Mar 2023 06:53:23 +0200 you wrote:
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
> 
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch is a requirement for KASLR.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
> 
> [...]

Here is the summary with links:
  - [v9,1/6] riscv: Prepare EFI header for relocatable kernels
    https://git.kernel.org/riscv/c/55de1e4ad43b
  - [v9,2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
    https://git.kernel.org/riscv/c/69a90d2fe107
  - [v9,3/6] riscv: Introduce CONFIG_RELOCATABLE
    https://git.kernel.org/riscv/c/39b33072941f
  - [v9,4/6] powerpc: Move script to check relocations at compile time in scripts/
    https://git.kernel.org/riscv/c/47981b5cc687
  - [v9,5/6] riscv: Check relocations at compile time
    https://git.kernel.org/riscv/c/c2dea0bc5339
  - [v9,6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
    https://git.kernel.org/riscv/c/559d1e45a16d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


