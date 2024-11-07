Return-Path: <linuxppc-dev+bounces-2967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB659C0049
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHP31wGz3blV;
	Thu,  7 Nov 2024 19:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969105;
	cv=none; b=IeylJwNHdklm/GQZIOTL16WLu2MzgcwfVCxwuZbez48JeLCKnXus+cSW2lRG+bsiRXQlOulGeY/opMjtO7jtI6qgMm/FKe6q25ESFaN9oOxrCMtfBee/gmjsIs4LlDtsXx8h2Ku0gBuuYQTHFhK/+hQ4oTCFZ0mYkRPd0KV4JY5aTo6OiV2bhvBj0UPOe4cWku6ARehgp1poPi/o/zVK1Sr1uAGbzqoVPhCV7Gk+a776THGhd0c5/SNGsRmbgH4l8g11/ZRin2EshumzHHcraXD3ByYpRyPkngP6a3NTWhiwjXBqLIhnMbkIxI2+2jC6W9EK70xh6fqMwrZpMpB1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969105; c=relaxed/relaxed;
	bh=v2eWMiptyDtzPkjPBE+lL4CiTwJcR2mPcVzcmcVQwG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jvQdVR/tR72ZEuEt9XuBPJa895zs8JGAtcgO6InsmMzIPsiX02qFz+eiQrgl7Im3uQ0KW9dCTiOucvC4bXSYVt4ch0212+fRadgsLtKKIjYvNMRGuPKHenSMhmSwWTPEJrHYnmxHwLUV0YL4VwF1XENQuUF6S5ABXtg5eiwB2hx56rntW6OBntYAt7KLc3WYz3lJb3kg25J8O8Bl5w10rPMjDcyfMCcr3nlo8SNSp+7397NxK4jRVt2qpIEPqAcwmfEoRvbds7HfltUxKhAMvhfM5w1Te1FUAe47rgjqSDCeoQ2Ud0OhF9sXb4e9ALT9dl2JJJEChXMhdFiTJwSUXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f07FxH7f; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f07FxH7f;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHN4Q0lz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969102;
	bh=v2eWMiptyDtzPkjPBE+lL4CiTwJcR2mPcVzcmcVQwG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f07FxH7fhzQx2+i8p2lpvbpFrg9vJisXSrolMJLtXR29iZy5cSwJSmTG/i1QL/FUA
	 tPmnvtW79vy3noD04AD78xOyb2eKtjcgIondWh9rrYxDHQa1VyeuhzcJaiPvygmtvT
	 nd8W4I81NYn+O5CJPIb+E5GGBZnxqy34YxI4pr6MPlIyw3nSPBRG0ojGUnmwmxkd5H
	 E703KTbvhw2gXUEqFhKZCJtrqbCwI/mVY17YNjZCMNUp7J5MogtnXloj4qj9NIXfWc
	 IghDWxBmo00S4Q68LaCagMVJCJvoVpo9FNRo5NuBZe6J/Vuv1IpXDpCN8vMTqSMA6q
	 AH8TpX+qHNZMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHK50pyz4xG0;
	Thu,  7 Nov 2024 19:45:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor <nathan@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20241009-powerpc-fix-stackprotector-test-clang-v2-0-12fb86b31857@kernel.org>
References: <20241009-powerpc-fix-stackprotector-test-clang-v2-0-12fb86b31857@kernel.org>
Subject: Re: [PATCH v2 0/2] powerpc: Prepare for clang's per-task stack protector support
Message-Id: <173096894645.18315.12963917579657771949.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 09 Oct 2024 12:26:07 -0700, Nathan Chancellor wrote:
> This series prepares the powerpc Kconfig and Kbuild files for clang's
> per-task stack protector support. clang requires
> '-mstack-protector-guard-offset' to always be passed with the other
> '-mstack-protector-guard' flags, which does not always happen with the
> powerpc implementation, unlike arm, arm64, and riscv implementations.
> This series brings powerpc in line with those other architectures, which
> allows clang's support to work right away when it is merged.
> Additionally, there is one other fix needed for the Kconfig test to work
> correctly when targeting 32-bit.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Fix stack protector Kconfig test for clang
      https://git.kernel.org/powerpc/c/46e1879deea22eed31e9425d58635895fc0e8040
[2/2] powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang
      https://git.kernel.org/powerpc/c/bee08a9e6ab03caf14481d97b35a258400ffab8f

cheers

