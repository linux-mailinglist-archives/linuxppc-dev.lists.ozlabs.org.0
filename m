Return-Path: <linuxppc-dev+bounces-3999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3E9ED9C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:32:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r2V5Q0Mz30Nc;
	Thu, 12 Dec 2024 09:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956354;
	cv=none; b=kmgJAZSL5pLwNK1H7G0NmkdjP59zolmghqA17xIwXPjTLXVPtf3Br3zz2HhqM1yUWJ1HqcImCQFV8VXOJRCMGLtNfpMZ40rphzro8zLk3mBARQDekrQQ/zCydta7nuQPPbsnIuYDobPNp3109tgzDdPMg2GVWaqRL6PjlY24EVtfS2PGDFATp7GmcosZgXjp/120ML//7BEvsZWi4XU5lFJhr2nWKixTfSzPcrEaRNEvVjLPBSqmwItgDzUT9oXAtJQ+oPrfLOfbsJrsReUWMrbnK7SDq4aHw0VNxImkKzXUzb/SyL6lEgq0+tdpr1XMeB4RHU/ghfN2lB4a1KjJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956354; c=relaxed/relaxed;
	bh=o4ptZloOfFwNLV1nxYbKIFIsGukxF2nm3f5nBiNdcUE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bPBXetZeynO1DxWJM/i5qz6fjVJforWY6b+X9YRkJ1QFpCD9aauQGT59kH63ub/1se1DSXpcTzp793+Wvb4QIGHxOG/rPrN49WDkIhE4oEzAuCQ21GnTC9axhVzuOe7YrT6yVIrae0vKL83Ro52eo4viOvCV9+0HzrpLyUYAuwr1JeRY3XSxlY511PKhM3Ly22k2rfgYdGx9aMl1fWNqRV824q4FCHxiVTf3M5LmBPjkWoYZRpGHC4MICun9pGoCKvOPHToW+irJKhHI27L4+/JtGgj6dDWckKFg6DZR64VHUbNJNZqNjhZx5hX0DOEkS2cQZw6cYbsj0QFd4pF23g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q+h6JdhY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q+h6JdhY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r2T4hZYz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 09:32:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C2945C678F;
	Wed, 11 Dec 2024 22:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABF1C4CED2;
	Wed, 11 Dec 2024 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956350;
	bh=Lj6m1KGdu6A9P37ePkeHmGhpEOYrC07Re+9IHx97taY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q+h6JdhYbgWkkJZKxxBpvzzMrsNxkGoEdza4YFJyky6PGRqvTppB4WWSHpF2XbZEp
	 3RmwDTIJ+IWZiPF6URzM7AFAUrovMRw7D8NbXB+92TG9vVWaXrcU/MsgUuSOZ3vPex
	 o0MaFjihetIadNNvJTpEn+nlZctZbXnS0fVYRMWoku2hOngBPg/UbRT+WKkxpgNf2d
	 SwvyT1mNlDgHbiMNbtlfPoLzmzqTgNvTIuq+Jo3m/NabxJ757iMFljbIUWU4KxUn8N
	 5ID5hDIVQ1/ODfWBnJSI9qXoWm4SM9dKAfh3gfNA/Y4dMt1mVhzEjFLVbDxspwHNRS
	 2u3nMpWh8Eo9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C81380A965;
	Wed, 11 Dec 2024 22:32:47 +0000 (UTC)
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
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395636600.1729195.17930169527159894833.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:46 +0000
References: <20241103080552.4787-1-00107082@163.com>
In-Reply-To: <20241103080552.4787-1-00107082@163.com>
To: David Wang <00107082@163.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de,
 richard.henderson@linaro.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 paul.walmsley@sifive.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Michael Ellerman <mpe@ellerman.id.au>:

On Sun,  3 Nov 2024 16:05:52 +0800 you wrote:
> seq_printf is costy, when stress reading /proc/interrupts, profiling indicates
> seq_printf takes about ~47% of show_interrupts samples:
> 
>     show_interrupts(94.495% 5166019/5466991)
> 	seq_printf(47.429% 2450210/5166019)
> 	    vsnprintf(89.232% 2186366/2450210)
> 		format_decode(24.005% 524831/2186366)
> 		number(19.488% 426084/2186366)
> 		memcpy_orig(3.739% 81753/2186366)
> 		...
> 	_raw_spin_unlock_irqrestore(26.643% 1376379/5166019)
> 	mtree_load(8.059% 416304/5166019)
> 
> [...]

Here is the summary with links:
  - kernel/irq/proc: performance: replace seq_printf with seq_put_decimal_ull_width
    https://git.kernel.org/riscv/c/5b881c1f8379

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



