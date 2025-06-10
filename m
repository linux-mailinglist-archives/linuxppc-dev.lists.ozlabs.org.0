Return-Path: <linuxppc-dev+bounces-9250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55AAD3ED8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 18:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGvNZ56kkz3bnm;
	Wed, 11 Jun 2025 02:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749572894;
	cv=none; b=TqDtnECiiG6+2FsBXSH/8i90zvGAaVVlLaLVqiuz71ZC6eemRvKoASOdHHJ1DAxHJAO2tyyjsXEzS4BRGZxjuI9SHHrTbUZK5a5vdaWl0QMDDvVOQWQ/5eQbxeoRhCBaA5UUiHSj2mtHRgtyohqz2E910JaSV7UFdiHqDq7FuNNgWpizWUhdKIG+hdPmXdJgylD9/E3OZey952Ot7OqxDpn6O7Knjpb8Hs6G1EnrdC3K6OzLsYLXNGnNft6weFDAbZS8O9YuWIA0Q+NL6zbbvIXFCMzvkqC3xLYHh61njg+OpTWpmXPwlYhJk+VvdK6qwaglgaGTmhjPF/IjNO3HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749572894; c=relaxed/relaxed;
	bh=Na7GI90NOGGO1Btk5UzP4HcI/GphDr4xiCqLNjx4lbw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JgZRH8EWfB6UjRozFo4sedKNjQ2Ogy+8JEx0JdQiinbqYgbKq2VIg3aKLLYlr+10LXuly8sYoB3tIBWSCkGtHtSIq/JmQqQRnWjML6TvvtvHiDd1/XyUi1FzpE0HzlPLr9zb79TsWg3g415bpFGXaHP7V8icPw3CmX4N/Ima684sD0HJqbGZYk18az46qkc/nSd0G2CYwd8PWReBxPIC+51Xm192FYTmLno1ZA/MNMhaXqDeiaVBuqFqtbmsZRz3+AF+l8675hLZpmKurk6CWjdDeGZkz6F3b8lSlcSTMrf68Z6cjloXI24mIzRLdWJOhn/WJ9aZe2py4n01sXuFIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JJ1f2Y7N; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JJ1f2Y7N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGvNY0jfMz3bnc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 02:28:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB613629F9;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE9C4CEED;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572889;
	bh=VGaA2UjcATw5usDRARWAGHoyvA3nRCcXodZF/+d4fPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JJ1f2Y7NQSd54tSszQLRiQIl7dD277rRFw5CD03cct8JsOIa9MeckGxwgeTNERJbY
	 /Aq7k/QdxMobJHlLVMWLaBVYiO7WUz7b5oZF8aZHHmpn5SGMFxfrabCx4zi/NelVA7
	 9tpmie/ZR7eRtm/GQUxR12kWA/MXW8KxThnLlIuGSON9FK96/TttZtzzrp91aMtCTf
	 nkrgxszvlyVUm0gGo8/i60pLDKogQxJCIy6qqOtv6fYwtbh3P8fqWAcjVqLwJncDb0
	 2wdFJTUv8YDSR+ksvQyqg1NCDe5af7sVQqmJb6cWow02fsajDICno0naOHZ+D1dFYd
	 UMToThilj3zfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D5B39D6540;
	Tue, 10 Jun 2025 16:28:41 +0000 (UTC)
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
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291974.2454024.16546912662876416180.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:39 +0000
References: <20250602181256.529033-2-masahiroy@kernel.org>
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, alex@ghiti.fr,
 andreas@gaisler.com, anton.ivanov@cambridgegreys.com, bp@alien8.de,
 bcain@kernel.org, catalin.marinas@arm.com, chris@zankel.net,
 borntraeger@linux.ibm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, davem@davemloft.net, dinguyen@kernel.org,
 geert@linux-m68k.org, guoren@kernel.org, hpa@zytor.com, hca@linux.ibm.com,
 deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 James.Bottomley@HansenPartnership.com, johannes@sipsolutions.net,
 glaubitz@physik.fu-berlin.de, jonas@southpole.se, maddy@linux.ibm.com,
 mattst88@gmail.com, jcmvbkbc@gmail.com, mpe@ellerman.id.au, monstr@monstr.eu,
 naveen@kernel.org, npiggin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, dalias@libc.org, richard.henderson@linaro.org,
 richard@nod.at, linux@armlinux.org.uk, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, svens@linux.ibm.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, kernel@xen0n.name, will@kernel.org,
 ysato@users.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue,  3 Jun 2025 03:12:54 +0900 you wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/alpha/kernel/Makefile      | 2 +-
>  arch/arc/kernel/Makefile        | 2 +-
>  arch/arm/kernel/Makefile        | 2 +-
>  arch/arm64/kernel/Makefile      | 2 +-
>  arch/csky/kernel/Makefile       | 2 +-
>  arch/hexagon/kernel/Makefile    | 2 +-
>  arch/loongarch/kernel/Makefile  | 2 +-
>  arch/m68k/kernel/Makefile       | 2 +-
>  arch/microblaze/kernel/Makefile | 2 +-
>  arch/mips/kernel/Makefile       | 2 +-
>  arch/nios2/kernel/Makefile      | 2 +-
>  arch/openrisc/kernel/Makefile   | 2 +-
>  arch/parisc/kernel/Makefile     | 2 +-
>  arch/powerpc/kernel/Makefile    | 2 +-
>  arch/riscv/kernel/Makefile      | 2 +-
>  arch/s390/kernel/Makefile       | 2 +-
>  arch/sh/kernel/Makefile         | 2 +-
>  arch/sparc/kernel/Makefile      | 2 +-
>  arch/um/kernel/Makefile         | 2 +-
>  arch/x86/kernel/Makefile        | 2 +-
>  arch/xtensa/kernel/Makefile     | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
    https://git.kernel.org/riscv/c/e21efe833eae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



