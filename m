Return-Path: <linuxppc-dev+bounces-12723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB536BC70DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 03:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chsD7400kz3cZ5;
	Thu,  9 Oct 2025 12:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759972039;
	cv=none; b=jpUB4YrLc7j67XrwWUGivIk1pJopAEsmXNDQJ2VFkZq5tLvHGBL/1/RTcdiV2mHuT00C1Pp9TIij3GXltVNi56zoi6jaxPAZO6Dpn35ks83r0zx+T2Mb27xVgFVTTe4a/X5GToIWmS56nk0wtE0NQHk0yOJXRXvVajHKBTNnTFaufOO6SJutQoJxGwkgXFLUpJhQjZdJJaYvsSKaE26Wbe9Hf6J4XsYE45WBtQxoqYGNgpWgjp+5eE3VHPVcqELQcJpJsRWGPVSQ/M+n3zibd62xscvXhqbUsfUBX8TAhzvnkPvNqTE16NSp/9od8kzaJl7CJJ2HIC4R5dMDgk+Z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759972039; c=relaxed/relaxed;
	bh=GYPM3zilSaiHuUuHSr5SbTjPPiedHSHnHHOcx2daRqg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CUuEMVe4vgxtsf/L4TRVc8Wwj+549XmQ0gWtLyVFuBVOzy7L9HXn5Fr1WdnEXFlvqlBETLltNOidgNbD5grWCtw64JbnTSmenwgk6ktXhmgAo+anImrg5gC94XM4z3FMmqHBDRNEbtO/z38GGTlnPoUhneMv5AdH0Rm7+Q5NkZ/QX30ioR70X+yq5ISQa47Uc34Vy6FvW+iJbnf8DOABaXlKWH1/OC2ETeqUq9WpqNl0EOauR7Sa9ZuVfZXjj6uhkBxkG8q01yI8HAFYIHxF+9uJ4NlT+C7Fzx5DcW13bhXutdLs4jQjKeHeXJcgmieVZ5sFfWqFztnri2FWaiLsng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cq+QIuaS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cq+QIuaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chsD6553lz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 12:07:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0B6E62139;
	Thu,  9 Oct 2025 01:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF0C4CEE7;
	Thu,  9 Oct 2025 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972036;
	bh=uICwW+7JjdNTrdwYOThDjo78WSe40MG6kD2tcS8UCr0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cq+QIuaSsbZ85Bye4hA95eTz3hsHytAX1GTFc9YGto55OBTrhSQts03gyTHo2eSvn
	 rNgYrFWU2souedJNKH6yF6ZCWEwY8jrNexNaitylW4ivlHpWVjhbYCAMV/nCTZ0CtL
	 oShIr9D42WzY/SRFilbT1mqkl6x9++jWyPnFwByoyG/Cut3jUlY64GzGWuzLpebMQz
	 w6uj0kRrCETVOXtVAqrz1jAM7/GJQA5bYn5s7PAlvZCkQNO3eOD7pPdDsew6svVkaE
	 TtclXcV4dI7gawm5GYhlHGNy+cRg3zhyB0uCj+rKzY1KwQUV3/WZTj4Wp3vrhYv/Dt
	 LmzPOKnu/WrKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE73A41017;
	Thu,  9 Oct 2025 01:07:06 +0000 (UTC)
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
Subject: Re: [PATCH 00/17] Add __attribute_const__ to ffs()-family
 implementations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175997202477.3661959.16005423815156173105.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:04 +0000
References: <20250804163910.work.929-kees@kernel.org>
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Kees Cook <kees@kernel.org>:

On Mon,  4 Aug 2025 09:43:56 -0700 you wrote:
> Hi,
> 
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute_const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> [...]

Here is the summary with links:
  - [01/17] KUnit: Introduce ffs()-family tests
    (no matching commit)
  - [02/17] bitops: Add __attribute_const__ to generic ffs()-family implementations
    (no matching commit)
  - [03/17] csky: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [04/17] x86: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [05/17] powerpc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [06/17] sh: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [07/17] alpha: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [08/17] hexagon: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [09/17] riscv: Add __attribute_const__ to ffs()-family implementations
    https://git.kernel.org/riscv/c/c51c26e687a6
  - [10/17] openrisc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [11/17] m68k: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [12/17] mips: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [13/17] parisc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [14/17] s390: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [15/17] xtensa: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [16/17] sparc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [17/17] KUnit: ffs: Validate all the __attribute_const__ annotations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



