Return-Path: <linuxppc-dev+bounces-12724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E54BC70F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 03:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chsD919gFz3ccN;
	Thu,  9 Oct 2025 12:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759972041;
	cv=none; b=dvAKHCIdm4DtK8fQM+xR9wbFV+FEYExeJbcTwJY9NuLtezhqg7kt1LxCp4RjiFpCACZ7UEZdPG/TAKzv9LACpr1exqY0GylgMsNR6sUnSKZsX2tZCY+5UR8N5TWISEIF+pH9Sie1wb8Xd/oeSkaWSXD+L8JOipqrWieUzCuD5gXcmttX32PKFN9Isv9P3p21Ga39Np3BfbLpAPMesF8eXBSirroKbY2EKKHFfgTMbyfGBJyiWaT27EOEehNQK95m6Qxykk8v0IV6xD9XEaIuNhBGdPg9AnPGAKk/FB957XysyMJK6R9LYtBiywmOl+k3G3gzupQx72y3xhHd6/U+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759972041; c=relaxed/relaxed;
	bh=1QmteHczt4IB2OaGgMcuo7lCBy1YKUcT8nLt2LHCF7g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TY8VLJ0DOljFO7sExC3jRB3oKGslt01F8ReaqVrY3tHu/YmiU2UmgQXXGVyTeqd/T01eK3ZXC6pCgpMoJRjGtSfQ2LbBxCQfwRO3aOotHkoi9ottaWP0TywPJ/XP2nKDJFPY/zF0/ZvSX8QJeOItB3qwxzh7frajJqLxz6fzNLb97UuPUwQlA0m/3WMqYj9eV2tVYRdEXJFG7ChidXFsoSQNDGqsnH5G+q6nRU735edx0W9Z9ogRgNP/Rx+sNyE/bclDwiX1hOF73qLcFLtQVUl+/i1AvQ7yyyFOkK4HuR8QpTKJFZaI2BaBQfEQeswH8VQqt9qLpC9Fm5mZphYRjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mgLCEG1p; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mgLCEG1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chsD84Dq7z2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 12:07:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32835450E2;
	Thu,  9 Oct 2025 01:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1021AC4CEE7;
	Thu,  9 Oct 2025 01:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972038;
	bh=0pQ9vc0S7+W0X1K4N+Om/UUij1yWdKMoXEP+Dp45E6A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mgLCEG1psTMeWNX86G6Tj93NFOr9A6HPWBooqhDsK/peZJiDr0z/lTt34SW/uV2wG
	 K2KA79ATbUyDb+QTtCiIb37Rmvl0ZB6h8EYOw6lZaU8PA4YEraSK96r4wnFJg5DgK6
	 px0wfbyKDtcXRuIuG3T18Ewh+okDNXN4RBEutXF8zlOxKiOztQ3FRVjOkE20nlpwGX
	 YhuXK6buub3FK7cN2EWSYIN6r/pZvCaQavyztMciWzkDa46lDOV/dfEDrzjJFL6sad
	 0NMFuRS+cJkrvvNwdswXaYRikNalB+yZpqvN9LdbCi0fl6LsirGqURxRennMUrvEHk
	 ipzxebesp0GnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF8C3A41017;
	Thu,  9 Oct 2025 01:07:07 +0000 (UTC)
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
Subject: Re: [PATCH v6 0/2] kasan: unify kasan_enabled() and remove
 arch-specific
 implementations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175997202628.3661959.104646439887808862.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:06 +0000
References: <20250810125746.1105476-1-snovitoll@gmail.com>
In-Reply-To: <20250810125746.1105476-1-snovitoll@gmail.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: linux-riscv@lists.infradead.org, ryabinin.a.a@gmail.com,
 christophe.leroy@csgroup.eu, bhe@redhat.com, hca@linux.ibm.com,
 andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, davidgow@google.com, glider@google.com,
 dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr,
 agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Andrew Morton <akpm@linux-foundation.org>:

On Sun, 10 Aug 2025 17:57:44 +0500 you wrote:
> This patch series addresses the fragmentation in KASAN initialization
> across architectures by introducing a unified approach that eliminates
> duplicate static keys and arch-specific kasan_arch_is_ready()
> implementations.
> 
> The core issue is that different architectures have inconsistent approaches
> to KASAN readiness tracking:
> - PowerPC, LoongArch, and UML arch, each implement own kasan_arch_is_ready()
> - Only HW_TAGS mode had a unified static key (kasan_flag_enabled)
> - Generic and SW_TAGS modes relied on arch-specific solutions
>   or always-on behavior
> 
> [...]

Here is the summary with links:
  - [v6,1/2] kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
    https://git.kernel.org/riscv/c/1e338f4d99e6
  - [v6,2/2] kasan: call kasan_init_generic in kasan_init
    https://git.kernel.org/riscv/c/e45085f2673b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



