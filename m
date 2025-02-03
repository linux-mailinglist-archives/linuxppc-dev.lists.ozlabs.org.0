Return-Path: <linuxppc-dev+bounces-5792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E077EA26366
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 20:15:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ymx5s6Tszz2yPG;
	Tue,  4 Feb 2025 06:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738610113;
	cv=none; b=DHe+OuFg/OSrF1Er4G35P59KYZoAdhwxeB6Pgj+1Dg48fGoKm9eANlkcBKTfWXu9zXm/HXZVPZ4DdGabcGVz9OnaWxTLGUT4l5L+Fml0AE7MUPsp50WbGNkaPPEiWnFzTKknohCLhotSM/I+kmjOrSVIJ9rGx/Jdfq+ZzW8tRUMQrktGhH4LQqMeDO3vd+vNFdvGNbzYJoY3gLsjn8m44YWeFDAIhOeR5Q2JJCtYEIZMjcogui5RN6+dAH7zcRTTqDEKiYpnnZVkkCZcNCsK92Y1HCpVOJ8CkTvxrDnotkipl/aCigfqIrUWbMCgXPUvc08KDWCiIO1ES0xCakvOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738610113; c=relaxed/relaxed;
	bh=QJJ8vIfh+fi3LO004gyalYlgrFsy4LuWFQlycJlYTzM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dIXjyrRuUTCByc7v9mdeWpD4YP+woRs6ZD4pKcIwpeJ1siKioX+K61cazoCKkidz11TeRua+abbrI7hHoPrMWMEZRAzKmSLbGOGeNsV9kwOSjk7NHcgJDiFHdtgM+tuUa7HU/kRNoXkOjek5/LsVLZ30t+QV4GW1U6tnJyLLaxNwtgQafTF0jjEgyeFir/Uthv06MOu0T8KX6anQVUwnGtINwrfTVDl72GzfkfilkJvt09oqO8/Seyex8XVtswSt0oG/roWvo3/ZCcsLVqc/4xqx27q51mtHuevQP9URqoJ0ZviLbawqZPBPfGvmENAiSPrwuAfTxUp+QtiknjTI4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nT1V9ZuB; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nT1V9ZuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymx5s1tnlz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 06:15:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF2545C688E;
	Mon,  3 Feb 2025 19:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDCBC4CED2;
	Mon,  3 Feb 2025 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610110;
	bh=wYJsv6Ip8xBUuijIyu9SEbYTkFPxUHuia0rzAhiQbTY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nT1V9ZuBZz/M7OG34ICcaQlVBd2ecDEkC8PqR69ZQNryLFl35xKAJWIO2ArC9euaW
	 CY+XTGfAH3mIw3Pk/hf6u7etNb2IFyJ8i7qpxOINcV+FN2fY74nfhI647+ytKEYqN5
	 rv9NzVl6hy/uRylwN0CS2fkMA3tbL70TKOoOl6wtC4YdLzknbvrRCdYOdulzNjlZad
	 nxxJiEnwddUIqmbBcL29UiO39cii9KH4h7+Kql6MdicCoSaF696fpYS1WJyxiuwmMu
	 zwCVPZUvVBraATcDi5rbm/swneDjGZLA/yEfclo4+HrqQbFsmIItF0ncmZGSz6/0U1
	 P8eNfk+BBSbxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0C5380AA67;
	Mon,  3 Feb 2025 19:15:38 +0000 (UTC)
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
Subject: Re: [PATCH v6 0/2] Improve interrupt handling during machine kexec
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861013755.3409359.8865555054206741851.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:37 +0000
References: <20241204142003.32859-1-farbere@amazon.com>
In-Reply-To: <20241204142003.32859-1-farbere@amazon.com>
To: Eliav Farber <farbere@amazon.com>
Cc: linux-riscv@lists.infradead.org, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, tglx@linutronix.de, akpm@linux-foundation.org,
 bhe@redhat.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
 adityag@linux.ibm.com, songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, jonnyc@amazon.com
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Wed, 4 Dec 2024 14:20:01 +0000 you wrote:
> This patch series focuses on improving the machine_kexec_mask_interrupts()
> function by consolidating its implementation and optimizing its behavior to
> avoid redundant interrupt masking.
> 
> Patch Summary:
> [PATCH v6 1/2] Move machine_kexec_mask_interrupts() to kernel/irq/kexec.c,
>                removing duplicate architecture-specific implementations.
> [PATCH v6 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
>                already-masked interrupts, resolving specific warnings
>                triggered in GPIO IRQ flows.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] kexec: Consolidate machine_kexec_mask_interrupts() implementation
    https://git.kernel.org/riscv/c/bad6722e478f
  - [v6,2/2] kexec: Prevent redundant IRQ masking by checking state before shutdown
    https://git.kernel.org/riscv/c/b4706d814921

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



