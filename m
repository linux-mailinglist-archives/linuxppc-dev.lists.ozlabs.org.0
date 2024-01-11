Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A982B0FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 15:51:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hXwEmxrb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9ng106Lsz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 01:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hXwEmxrb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9nfB3Nhgz3bbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 01:50:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F0B961AF8;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2BA3C43609;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=poNz0ZTftVJwt7XbLawzBiVnhFM+TAQwKnLBWaeIY2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hXwEmxrbdHXjEbjKT9cmMGDMp+soTGur9boVUpX+yeXIiv8b/u8G07PEnaRSiyW8R
	 edIyBL50tFk+tmk7o5ApNztR7sVfp6uPBu1W/3M2OhYjlfSXp3HAq9AG4DICw+c5vg
	 nM4Th8RmkSpe8yPk0RibQysBTzv/dzIqqNAMDZC+mRV37CNFOJFf+EwAuTZ53ZsjW8
	 k68dOyaYeWRvO5J04bjhvjgnBUI/QWE4ngvvRNgFQ6NSY3icogjF+fJOGZAARhYryy
	 E8La/cu6qcGeBEzqFHwyJrTbFJiwtUXHc49IYMH0ac+nTlDwYCxam9b2BLi4abZYQ1
	 OLeNk5edMfekA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CDBA3DFC698;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170498463783.20080.10723421328706946354.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, conor@kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, linux-serial@vger.kernel.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
> 
> This series adds support for SBI debug console (DBCN) extension in
> Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
    https://git.kernel.org/riscv/c/f503b167b660
  - [v5,2/5] RISC-V: Add SBI debug console helper routines
    https://git.kernel.org/riscv/c/f43fabf444ca
  - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
    https://git.kernel.org/riscv/c/c77bf3607a0f
  - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
    https://git.kernel.org/riscv/c/88ead68e764c
  - [v5,5/5] RISC-V: Enable SBI based earlycon support
    https://git.kernel.org/riscv/c/50942ad6ddb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


