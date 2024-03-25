Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B71888D4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 05:44:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iZ/b0NE+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V30hk2v9Fz3vbP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iZ/b0NE+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V30fR3P0Mz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 15:42:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6128B60DE9;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5273C43399;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=duVRPOkUwtqb9I+6o5VQiYAgtSlpWGf+X+0yQv8TjAs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iZ/b0NE+i7+do8pgZkg46x1uBB/MQJfp/c/XhpH71z/wGKatNJQnfFVi4TsSrJUcx
	 p9B9v3m0m2h+2n352ZneEdcJs25ZuYmCkptcEJJi14CEjUg6fZRWGQjsnzSbTTqpuQ
	 jBLNyyJKgrClKH6Ar2Sk8/u0rVBaZT96gqSwdlSHBYKiJ8LneSrMklScm8Ww85dTEe
	 eja5sWn2jN4CV4FDoeaf5TOJPL86Efy9rTKDI0W7hc3GLlwluHdA9GYm7yTBbMYg6F
	 MrrxjzojsaA/BYbk4OYMb2sE8+b4REldcJ8JhTboSwFB0wiYQTm1AKpQdnuWO2wot9
	 CNckLCoG3Oykg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F5E8D95071;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] Bump the minimum supported version of LLVM to 13.0.1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <171134175464.18749.18342004135343709281.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org, keescook@chromium.org, masahiroy@kernel.org, x86@kernel.org, linux@armlinux.org.uk, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, llvm@lists.linux.dev, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, npiggin@gmail.com, bp@alien8.de, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev, conor@kernel.org, palmer@dabbelt.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu, 25 Jan 2024 15:55:06 -0700 you wrote:
> Hi all,
> 
> This series bumps the minimum supported version of LLVM for building the
> kernel to 13.0.1. The first patch does the bump and all subsequent
> patches clean up all the various workarounds and checks for earlier
> versions.
> 
> [...]

Here is the summary with links:
  - [07/11] riscv: Remove MCOUNT_NAME workaround
    https://git.kernel.org/riscv/c/de5f3984664e
  - [08/11] riscv: Kconfig: Remove version dependency from CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
    https://git.kernel.org/riscv/c/a38d97181271

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


