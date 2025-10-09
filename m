Return-Path: <linuxppc-dev+bounces-12725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A830EBC70F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 03:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chsD95QLMz3cfH;
	Thu,  9 Oct 2025 12:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759972041;
	cv=none; b=GrSQzbHUzeZdXuugUJCbyrcCEVYcz0GWFAH3NYV8l6IMdVXDfqVJe6W71bhFzUtm9Bb/rjYpNaxCxJhrA2orLmWZP79OoucVDaAwx3X9OIBo+k3bASNCpOhKuBnkY5BGLc+3QZPS3MkaCKWW7wuKtSkPna9t4OU8s3h7EcKx/y/BWtWszFdX8BYDLDTvJgmEyvRporv9dyykxHnRYDWO9/AZfVhIc0z6YYivzaHkvRHyHUbM35mb9gwNdai8RDSzS+++0iv1jKpBBf4s0edB1YQCebBRbv76wduySjbFKfvhmjrGJgbVTfHanayXrugwnYZAHk4/siSEz+aihBL0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759972041; c=relaxed/relaxed;
	bh=Pf7jqXbWOnWfySIA6lQmKNb481iT1x0PI2Co78K1Es0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xo19n21Vaj+lIK/zpkHG0GDZtmrb4RKTqCfOgwH+uCA8zmJkBaaKAFBwrWF9fLGN7ryltIkvOw9D9kZuWeoGl087lCUlA5AhqanGwCp1q0VFi5/R1KrD5ilDyBJqV209nhXc8JdsXDWG01BW4O4VhPxkGCfnUtuYuZODBtihjLQtEkhQ2wSkijOBFTbGdetKG0DXNheDPSs9YdL5sBe3D4AqPqL0v/Ya9D+nreTVoR4EWPRnNe1MtJfsxR45Pm35VNe3FncKEaetA8lWFJxwUGyQeNWaNQjARG1Sx9hnADeGl0/rQWCRXncTS+jDWw2p6Aku2/JqNovfBbqhwPbysA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hjYsA57W; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hjYsA57W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chsD91tSWz3ccf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 12:07:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F9748840;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1B5C4CEF5;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972039;
	bh=t6dp3X5zH0EXAKG5SlHHvBagHVmQAF54vkAiSOAzRro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hjYsA57WUk/Uk8p2fuaW+XkuH44BrQ0BB/rx3wHmvL7Nz5SEpfaDFIXoicRvUMnFO
	 7+UhpTNDXdZYg/SYGwPDbRKGUalwZjDBR3Yk/sn9Iktr2OCSplwbASH1t2VQZjcTOI
	 BU8M4dF6UujKz6YyhNr7/Jj+w1iZJD4BktB8rsRZV7CDWC/Yyj/AVaCJeuCOSA5QqX
	 CIrJ8oV6iWtuTCoNIPR+ExaOEDuwd7AKYGUlUAZVrT0MqW5h8HXO8HcmQktZM72qCh
	 6eCrEa9whwxNi/OPCSMdhTiMm1GJrzQEVPttyBmW4pm8ET69I8Yufn3a78+p7qvGbf
	 VGm+6zkZOIsRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C163A41017;
	Thu,  9 Oct 2025 01:07:09 +0000 (UTC)
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
Subject: Re: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175997202775.3661959.1535236572113247824.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:07 +0000
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 arnd@arndb.de, kees@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev,
 patches@lists.linux.dev, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux@armlinux.org.uk, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, palmer@dabbelt.com, alex@ghiti.fr,
 elver@google.com, peterz@infraded.org, kasan-dev@googlegroups.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Nathan Chancellor <nathan@kernel.org>:

On Thu, 21 Aug 2025 14:15:37 -0700 you wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.
> 
> [...]

Here is the summary with links:
  - [v2,07/12] riscv: Remove version check for LTO_CLANG selects
    https://git.kernel.org/riscv/c/6578a1ff6aa4
  - [v2,08/12] riscv: Unconditionally use linker relaxation
    https://git.kernel.org/riscv/c/7ccbe91796d7
  - [v2,09/12] riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
    https://git.kernel.org/riscv/c/87b28d71396b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



