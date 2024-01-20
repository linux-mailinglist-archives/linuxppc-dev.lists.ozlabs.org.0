Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF90833639
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 22:11:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ncG4baLy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THTgJ4fY9z3cWQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 08:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ncG4baLy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THTdc3kbxz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 08:09:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFD8560BD6;
	Sat, 20 Jan 2024 21:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A8E3C43390;
	Sat, 20 Jan 2024 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784992;
	bh=Rp5EUqsK/zub74udKI73W3OYZb8MEebPJJcJBbBEBqQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ncG4baLylKP+ss4CNXGIlS1a6uVEW90QY99EMGmgpt4V0oF/pEjWEZ3npunq0fl94
	 6PShq8XUgcdedvfzb/WzPJFqk0JtjmvcUPRYOzk0iNlMKX8YNyCcm+ak7wj9Cs0cQ0
	 nYdvbHahPXimCBXcoo/hRh31unWRJgPFFXQANqeWvuw1gUb1052zmkYbcwW8lH3JNy
	 UferhTZ58Bmo4LtIjuw6GElQDqC1PevMsZITHmk7jIkMPCrGudcbfNOBvQcvgU4wUP
	 b2WVtO6lkZuexwY2RgZZyq4EE1kc6h0RZ0V/MEDn2mCQykMUkd9XAAR3j8w4O3c98P
	 WXy4hDcSfDJug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A88ED8C96C;
	Sat, 20 Jan 2024 21:09:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/5] RISC-V SBI debug console extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <170578499217.24348.10595488871949157918.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:52 +0000
References: <20240119113449.492152-1-apatel@ventanamicro.com>
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 19 Jan 2024 17:04:44 +0530 you wrote:
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
  - [v6,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
    https://git.kernel.org/riscv/c/f503b167b660
  - [v6,2/5] RISC-V: Add SBI debug console helper routines
    (no matching commit)
  - [v6,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
    https://git.kernel.org/riscv/c/c77bf3607a0f
  - [v6,4/5] tty: Add SBI debug console support to HVC SBI driver
    (no matching commit)
  - [v6,5/5] RISC-V: Enable SBI based earlycon support
    https://git.kernel.org/riscv/c/50942ad6ddb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


