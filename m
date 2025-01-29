Return-Path: <linuxppc-dev+bounces-5659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40AAA215D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 01:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjNxf0vY4z2ykf;
	Wed, 29 Jan 2025 11:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738112150;
	cv=none; b=JiBNTj/GsG9yFWl4uTAOrBT4BiW6mu1uVls4ckPozR0kbJkRpZJpWG2QQROZBY9LW+dCFRlHy6akx8iI8Bi86s3gbWM3W0ClGDh/xQqnPNPKKSMXfe2Pe2D5GUfhxD5cwFqWNmNXgyQeMpmzrHxubiTd2yAijCrq6Kal9mPv4bOR5xxlpErWUKy68hpEr32BIkrgLvxyj1cGrCZPqlh0uQ+d3ndaJpEC6EP5RcdKIn91GyzAHoZn1MsvsKGlxMW2aQS+CUi6f+LKIIWfVfyJvc/2kO93uLyyyNTbfdXMnjeSum/ACCD2KM2rxKWoFsx/eIsasDBLD9PPyye786+Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738112150; c=relaxed/relaxed;
	bh=hJQf0TPyuhEeQZ0a4V+OZ72Iu2iKhB0OFe4o6fsP+TM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=I1xRnXUhdX5Jl7TphBrbwMj841Z5WAB3AsCmZTXwAXd5NG4qCsBCovaJCky2jTyygRmltYR4W01gypqQE7sR8qVjQ3fLuWf/88gljo9VSHhIGelMSfqYS5NpvVh+A6WLXi+qm8msM/7XfZzE2v9H17iBKdvvVyQf0oZrupAgSoXXWr+h1yw0DpCzcO+d0HOTLFTF726arVR8gtQ/WSmHM4gDvmmPIadIaN4cOnaUUhLAXK0MyYVaDtVI5ydFi5vOQ2KgDAhbIbu/XDBZa5zmrfEKhoUg7VBCkL4OK2kdEW4ZwBcyWqZVVymQBOg/INSwYTTybTmjY/SIHuBFujQZpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a0Tp33LE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+f2fs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a0Tp33LE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+f2fs@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjNxd1DZLz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 11:55:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6219CA415EA;
	Wed, 29 Jan 2025 00:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0E2C4CED3;
	Wed, 29 Jan 2025 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738112144;
	bh=7lLgfsbUvvXkuZ/CHyObEqTqK07OIPpnMi3L8CLFkWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a0Tp33LEr5mdpx4Jdes8W04nWqwEaLorvXlTwLQeltYmYb4klZ+1dz2ywlTC1b8vX
	 3+k4ui1fUmLbcFjL5APZZHqXajEfDw8XK18yEtuoVQbYLE2/KJ3OWDxcoyJSsIsYNE
	 DtQEthCyYqS56sQa1kB1Swn6qPUBhCaLAgWkwja3f55uChLvycrhuijZWm8POhmtni
	 ykUeyJuvAvFNmoLZJQP4RIXBzVayDzL59pE6M7xHqHJCz+rWiTvl4EPHbNFmFx8Chm
	 4j7efWWME8OF3uvIkfJk+9cFoNkYjHICLOSesiRjPTBgLZGNKhAvpDasPjs5mHTnv5
	 F99y903Tt3oVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE01380AA66;
	Wed, 29 Jan 2025 00:56:11 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH v4 00/19] Wire up CRC32 library functions to
 arch-optimized code
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <173811217076.3973351.8137382917166262630.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jan 2025 00:56:10 +0000
References: <20241202010844.144356-1-ebiggers@kernel.org>
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Sun,  1 Dec 2024 17:08:25 -0800 you wrote:
> This patchset applies to v6.13-rc1 and is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v4
> 
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,01/19] lib/crc32: drop leading underscores from __crc32c_le_base
    https://git.kernel.org/jaegeuk/f2fs/c/0a499a7e9819
  - [f2fs-dev,v4,02/19] lib/crc32: improve support for arch-specific overrides
    https://git.kernel.org/jaegeuk/f2fs/c/d36cebe03c3a
  - [f2fs-dev,v4,03/19] lib/crc32: expose whether the lib is really optimized at runtime
    https://git.kernel.org/jaegeuk/f2fs/c/b5ae12e0ee09
  - [f2fs-dev,v4,04/19] crypto: crc32 - don't unnecessarily register arch algorithms
    https://git.kernel.org/jaegeuk/f2fs/c/780acb2543ea
  - [f2fs-dev,v4,05/19] arm/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/1e1b6dbc3d9c
  - [f2fs-dev,v4,06/19] loongarch/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/72f51a4f4b07
  - [f2fs-dev,v4,07/19] mips/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/289c270eab5e
  - [f2fs-dev,v4,08/19] powerpc/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/372ff60ac4dd
  - [f2fs-dev,v4,09/19] s390/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/008071917dfc
  - [f2fs-dev,v4,10/19] sparc/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/0f60a8ace577
  - [f2fs-dev,v4,11/19] x86/crc32: update prototype for crc_pcl()
    https://git.kernel.org/jaegeuk/f2fs/c/64e3586c0b61
  - [f2fs-dev,v4,12/19] x86/crc32: update prototype for crc32_pclmul_le_16()
    https://git.kernel.org/jaegeuk/f2fs/c/1e6b72e60a5a
  - [f2fs-dev,v4,13/19] x86/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/55d1ecceb8d6
  - [f2fs-dev,v4,14/19] bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
    https://git.kernel.org/jaegeuk/f2fs/c/cc354fa7f016
  - [f2fs-dev,v4,15/19] lib/crc32: make crc32c() go directly to lib
    https://git.kernel.org/jaegeuk/f2fs/c/38a9a5121c3b
  - [f2fs-dev,v4,16/19] ext4: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/f2b4fa19647e
  - [f2fs-dev,v4,17/19] jbd2: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/dd348f054b24
  - [f2fs-dev,v4,18/19] f2fs: switch to using the crc32 library
    https://git.kernel.org/jaegeuk/f2fs/c/3ca4bec40ee2
  - [f2fs-dev,v4,19/19] scsi: target: iscsi: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/31e4cdde4d8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



