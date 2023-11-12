Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94F7E8DCA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 01:56:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H9MS3tqx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SSYzQ6P2Fz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 11:56:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H9MS3tqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SSYyb5SCfz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 11:55:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 69C6ECE01C5;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB5DC433CB;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=+f1eXcr91euPusl3Xe/1/DfSwfjp6Uid8mOwDf2yltU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H9MS3tqxULUVIVZESINTI28qjs/DgCx9l4kuIeVhz4pohNE2WbN6BAyRD14y7BF90
	 RY/kpgyT8TdPukD/AJXGR6o8Z2GVO/Tbn0sIbWVqCz5W7mWfsxghmcPMVtHUtZAPrC
	 qqNpGPrxFKZ3yyxP0rldcBKY2bhSoRfQtQVcL8qvIMNKeEmyCCrEvebptP7LgI0KBF
	 /AnhzXoAPcu8zsPopEYtFbsEgq1v9bjfR6k6cNBR6JEHcNqYRsqNMQaFXwH/40eL5s
	 lBAwWg+oSDpWNSMXZQtdILBi85B+aR6+jOZwz8NZST6UxEclBVUtElAOeYPYWgvOQi
	 DZpbY6goJKsuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3BA38E00089;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/9] RISC-V SBI debug console extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <169975054624.11360.10545081285064306783.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231020072140.900967-1-apatel@ventanamicro.com>
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, gregkh@linuxfoundation.org, atishp@atishpatra.org, linuxppc-dev@lists.ozlabs.org, conor@kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, pbonzini@redhat.com, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 20 Oct 2023 12:51:31 +0530 you wrote:
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
> 
> This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
> and Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] RISC-V: Add defines for SBI debug console extension
    https://git.kernel.org/riscv/c/dadf7886993c
  - [v3,2/9] RISC-V: KVM: Change the SBI specification version to v2.0
    https://git.kernel.org/riscv/c/b88e87a0a1ec
  - [v3,3/9] RISC-V: KVM: Allow some SBI extensions to be disabled by default
    https://git.kernel.org/riscv/c/56d8a385b605
  - [v3,4/9] RISC-V: KVM: Forward SBI DBCN extension to user-space
    https://git.kernel.org/riscv/c/c667ad229d13
  - [v3,5/9] KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
    https://git.kernel.org/riscv/c/d9c00f44e5de
  - [v3,6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
    (no matching commit)
  - [v3,7/9] tty/serial: Add RISC-V SBI debug console based earlycon
    (no matching commit)
  - [v3,8/9] tty: Add SBI debug console support to HVC SBI driver
    (no matching commit)
  - [v3,9/9] RISC-V: Enable SBI based earlycon support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


