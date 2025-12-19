Return-Path: <linuxppc-dev+bounces-14892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1375CCEE8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 09:13:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXgJw5Vqhz2yG2;
	Fri, 19 Dec 2025 19:13:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766132000;
	cv=none; b=Tn7W7dUy99bpCkfTDiLeY3f/apFrD0jdIMlnFX9+snS7lRVThENHj9FB/yJQNNr4ulKYOGqKr9ZhjYsI6Nq5UdSXWrHhRE1hyeIvjpmBzR0SkgcZrfChsiddpgkSQkCl6m9hvPPSXC02tccdTUOhT5VxV7Yo6t7z/mP7z2/zzHNSep0XRNdMshSPZRo3n2RRiFoUVTgpnQuUI42Gf4D9IOQN5nlLOtfZDI+COHtZMc1cT7f0Jwv8RyrtKYGp0ffxIn96gr/L3C4qTZPiAf/EwMzF/ByGMWEJlQZJULZgdUTFVuA93WACg0XjqLS0E8pwrNF/gFV3DoSHynOeg/HQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766132000; c=relaxed/relaxed;
	bh=KMXfMjR4WxAUzVj6h596i+8ywzrPvR4Oget7Rn4OOrU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IajUdDdz2jt+1A0ebrlFDW4IBYakMuI5Cbl5FqhQMkAc20oY+5bTIKEh/xA1TymHP+UxlA6Q4sbXXOoQGgQ7AXQ+tOQ226HR+d1nKqjf3IrFlCzyLbY2zEV6R6+la/8Eq4nlGljFHrtHM8aqcNkb5WsxpobSxTswYEXFa7dvD988tzICNN/iRVkvQSmFsbbfaZsC1nIsRSzIYTAJ1FWwKnNUCeqA3S3C3qm9y3z11PuZslWExwQZoCpbd+1J4HyR46sBgQR0GECGzVbaNYGq9/N9Zb6fAml7Kjg28fV/hWu3l+XelmFjxFVPRjcCjhpM3iVGbS6y381nHBVpzGQl0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GLiYOmvP; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GLiYOmvP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXgJw03ltz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 19:13:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6699744265;
	Fri, 19 Dec 2025 08:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DA1C4CEF1;
	Fri, 19 Dec 2025 08:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131998;
	bh=ZpBHca7oN52iVgWXthIDFgDhI9A0INgKqTumn5Wu6+Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GLiYOmvPUPoGBBkA0Ts0/kjAyBBbJ5CVV866J5BiVEgPJj3OYjRgC+9kPctyKNkbY
	 OTmQcFlqulWRizG9DOeVMcBBx3TMpnVx8OsXdwOLS+oyRNZ43rplVORNJeOQQd5TCz
	 VpcmAphzU3UsvkI5L30JzY+yn/H0KfEWqpVte7ln/hSbjF1dNKhUJB0U1REatJzEyR
	 lb/rrla5Oq6RnkhwpZlVihV4NT0itGutxX9yV+3Mu7xreaNE+7eVmbadIEeUslLbKZ
	 K6SjjazHiexJwS8UcYibsLYI3osV5J/1Mf1cfAxG4KlgZXMP2+gQZEcu1CfsRsvhQs
	 DlwDgJSLvSrwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7872A380AA50;
	Fri, 19 Dec 2025 08:10:08 +0000 (UTC)
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
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176613180728.3684357.15978002339429469981.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:07 +0000
References: <20251027083700.573016505@linutronix.de>
In-Reply-To: <20251027083700.573016505@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 torvalds@linux-foundation.org, x86@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
 hca@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org, mathieu.desnoyers@efficios.com,
 andrew.cooper3@citrix.com, david.laight.linux@gmail.com,
 Julia.Lawall@inria.fr, nicolas.palix@imag.fr, peterz@infradead.org,
 dvhart@infradead.org, dave@stgolabs.net, andrealmeid@igalia.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Ingo Molnar <mingo@kernel.org>:

On Mon, 27 Oct 2025 09:43:40 +0100 (CET) you wrote:
> This is a follow up on the V4 feedback:
> 
>    https://lore.kernel.org/20251022102427.400699796@linutronix.de
> 
> Changes vs. V4:
> 
>   - Rename get/put_user_masked() to get/put_user_inline()
> 
> [...]

Here is the summary with links:
  - [V5,01/12] ARM: uaccess: Implement missing __get_user_asm_dword()
    https://git.kernel.org/riscv/c/44c5b6768e3a
  - [V5,02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
    (no matching commit)
  - [V5,03/12] x86/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/14219398e3e1
  - [V5,04/12] powerpc/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/5002dd53144f
  - [V5,05/12] riscv/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/0988ea18c624
  - [V5,06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/43cc54d8dbe6
  - [V5,07/12] uaccess: Provide scoped user access regions
    https://git.kernel.org/riscv/c/e497310b4ffb
  - [V5,08/12] uaccess: Provide put/get_user_inline()
    https://git.kernel.org/riscv/c/b2cfc0cd68b8
  - [V5,09/12,RFC] coccinelle: misc: Add scoped_masked_$MODE_access() checker script
    (no matching commit)
  - [V5,10/12] futex: Convert to get/put_user_inline()
    https://git.kernel.org/riscv/c/e4e28fd6986e
  - [V5,11/12] x86/futex: Convert to scoped user access
    https://git.kernel.org/riscv/c/e02718c9865c
  - [V5,12/12] select: Convert to scoped user access
    https://git.kernel.org/riscv/c/3ce17e690994

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



