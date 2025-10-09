Return-Path: <linuxppc-dev+bounces-12722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B4BC70C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 03:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chsD02FJkz300F;
	Thu,  9 Oct 2025 12:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759972032;
	cv=none; b=U0ULFFSOQSpstg6tBm1uUNvyzIsaG2xcuQWvPhWaLflJP0PaAukoLvnqghX5XjckVjx1I1d6PniKdeA9eJk4e/kfPdGQ5UKszU4enjb3ByFBBbgTTowKO8uzI8uDjjdqEwEDGiKVvNfxb/G1x8Y8NE1kQGZhnZiwO+FjqlMRil2zFWPaeJqTWEIeBS9nUY7my2r8D9C7T02z5LIsK6MQvWvISW1whMgePoxPWhzsI1ayO5HdmuOk4ePn8jxgvrMwXbbMBY4/fMX9uW4qD0q7bM5fyVImJl/gwQu5uOnjwBI76M9wT2DF/6VgfIYURltZEUUEDvJdYeAB8c6IDpF4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759972032; c=relaxed/relaxed;
	bh=Godd2xdELLl8pRhLIf389eS3C6nK6bE96pcvVwqQimk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MUqpd2Klq6XZWbwjCdk/nBGxcev9Q+lUOG6XgyAtwLdFvQxz86gTN45skP11y38bFuopxu+kALgJu0I5zqwxaRPAfydmN2w7D+33lNNZDH7ghOFYSybcw2owRalSxyvf+d+wOJdH82HFu09HkIlyWIhAoYLlGFvWw7onOm6a7QRjPAKt7/m61LO19O1kcJENf2nTPUbfkXigymc9n4jxHVNPf2DOMHVbovAfMWtzyPyNfyE98CAHnUDguXCO3Rc91bMa10it1X5EAEaXyfKBZCnN9eFsVbOFcccyAtQ0jIdTxRIso15BGk3swF3CdUwVPTLkxStLYQp3q4rk6S9zlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z85MDq7b; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z85MDq7b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chsCz2nT9z2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 12:07:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3A866212F;
	Thu,  9 Oct 2025 01:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE42C4CEF8;
	Thu,  9 Oct 2025 01:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972027;
	bh=VISjCl3028ZdolLBlNDZGd4lu4o1butuKMV03AtZBlw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z85MDq7bFHAVb7Rv7QvW4jT9Y15cPiI0WVlhCJV3Hb8KzH2ZYtKDIugmNBfAaGySd
	 z5ewF5rNJ+Eg/0lDf4iQ7eqlYgIW0QFXYttqFueGd0EyH0q3YxGVMid01GmetPjhLw
	 CLKH4BhiZk2QE9ZHGNcP1R+Uu7twuBVmXVU7JX+WU6Qkgezekw/tfTay9IqLn/03qv
	 fGM0puNNPNlEwlNS8diIH3zKif6A6uWsftAXlyDWexxIsHVq/Ua4/nh1U3nC4uYics
	 +WuF25l1nNqeg2I6RnH6RhbrrEuRMwXBeUzGy3elVssgawfAsHG1eRRK1qPPGapFZ4
	 MDqB4RaRlBhng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB00C3A41017;
	Thu,  9 Oct 2025 01:06:56 +0000 (UTC)
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] vdso: Various cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175997201575.3661959.11378704835584004005.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:06:55 +0000
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, luto@kernel.org, tglx@linutronix.de,
 vincenzo.frascino@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, namcao@linutronix.de,
 linux@armlinux.org.uk, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, arnd@arndb.de,
 brauner@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux@rasmusvillemoes.dk
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Thomas Gleixner <tglx@linutronix.de>:

On Tue, 26 Aug 2025 08:17:03 +0200 you wrote:
> Various cleanups to the generic vDSO infrastructure and a patch for ARM
> which was never applied.
> 
> This series has one trivial syntactic conflict with "dso/datastore: Allow
> prefaulting by mlockall()" [0] and a semantic one with "sparc64: vdso:
> Switch to generic vDSO library" [1], which still uses the removed
> GENERIC_VDSO_DATA_STORE.
> 
> [...]

Here is the summary with links:
  - [01/11] vdso/datastore: Gate time data behind CONFIG_GENERIC_GETTIMEOFDAY
    https://git.kernel.org/riscv/c/7c0c01a216e6
  - [02/11] ARM: VDSO: remove cntvct_ok global variable
    https://git.kernel.org/riscv/c/39f1ee1299c9
  - [03/11] vdso: Move ENABLE_COMPAT_VDSO from core to arm64
    https://git.kernel.org/riscv/c/7d298d25ce81
  - [04/11] vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
    https://git.kernel.org/riscv/c/f145d6bf8d59
  - [05/11] time: Build generic update_vsyscall() only with generic time vDSO
    https://git.kernel.org/riscv/c/ea1a1fa919a5
  - [06/11] riscv: vdso: Untangle kconfig logic
    https://git.kernel.org/riscv/c/eb3b66aab72c
  - [07/11] vdso: Drop kconfig GENERIC_VDSO_32
    https://git.kernel.org/riscv/c/278f1c933c3f
  - [08/11] vdso: Drop kconfig GENERIC_COMPAT_VDSO
    https://git.kernel.org/riscv/c/bb5bc7bfab06
  - [09/11] vdso: Drop kconfig GENERIC_VDSO_DATA_STORE
    https://git.kernel.org/riscv/c/7b338f6d4e3d
  - [10/11] vdso: Drop kconfig GENERIC_VDSO_TIME_NS
    https://git.kernel.org/riscv/c/bad53ae2dc42
  - [11/11] vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO
    https://git.kernel.org/riscv/c/258b37c6e626

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



