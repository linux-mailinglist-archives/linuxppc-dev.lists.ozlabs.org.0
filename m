Return-Path: <linuxppc-dev+bounces-3998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 788719ED9C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r2S4Mmyz2yPR;
	Thu, 12 Dec 2024 09:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956352;
	cv=none; b=csFBKNqYY3Kg2r94pz5zg6VfjA7YKe/2fdBJdcCeJOyEcStzHHiDrLDZwjiz3/6Exv7KR7Y3TWpXzq7DPcGCBiej43V9Opxuq1MambWDTONc38c6LJjmXMW1bNvD7eAAmk2vtORqf1NXjEjTyMgFF161c6NPEy3CS9HSUAB70Bm1wInUDoi6v6PV2l88mNKBCQlSY4pmqIJcVk1NiLwFs7RfmfduNmzxHwgaCOpyDXN5KAXzgXVTv5zimt2lnt2YccrM30Cu9qLYGiLINMaNoZBaTT2gNQOuqj1GtDmYW5xkgVNNd+ZcuwjreEwyeZRUM7wJgykjSLGwZoFmS7eA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956352; c=relaxed/relaxed;
	bh=hUEjsdsK5sfW+WU0cV/OJN+y9IF7umfVVUFeM2GVr84=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GaM3oS3+AFwzaKSJbKaG9X84PIsebbEhCHk//EOM/GKLOEdE448DG9KzRc4KWH0Zbsp1HiWV7ukAsTSNvBbUDkLepNy2ZaXKT/xdywXBuUXDy5X8efZas0yRMYkWE75grCQJ4TjqIk2X48oCAhXsFE7F/7mQia8C9etre6PVIOV5a+R5dBTh6P+pMTchKA6GW+4BRnwVL78zYWcjurYL2QcylPvNXfNd/Clw6P96izULEPMv8czeFzIRopAzfGk+EXF0iuVJ1CNcxCf5M4GrqasOk9V62aGrFzJhHu2rercHBFtSCelj/x0IqgKWNCK1++7t+JWPSgbKrvHsOiV2Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qv6gvZPd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qv6gvZPd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r2R45Hmz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 09:32:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FB125C67E6;
	Wed, 11 Dec 2024 22:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AB6C4CED2;
	Wed, 11 Dec 2024 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956348;
	bh=BsLL13WVfc3NzEKIjd52mjnoMrC/Et1GCt0kRWiLCQo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qv6gvZPdDzbdVPybtFSPx8+F0xql/LHjAUoa61PxHbq7BiNILQmSVN3xV/Fk+jm3l
	 eRj2euKpGQwhzha10D0yvWpJ5jdjr8+V1iYsps4/RL/90xpWyAoPlqxLTgT8H2p1Qr
	 znxHE8HzGGVb3bxCyQgvVT/2hoGKZW56OU+GylgAoSP4eq7TpXB3MZRt3VoyD522af
	 qGwcNNMDDsGqYKHkYodSX7oguHOLk4TTwi/8Q8fATZ6k5VUR9Dw7CkfxIhk8aSQAz0
	 q46lv24Cq5nGqzFQZkxa8IXK7+L/Hgf8e5dM0N1jW5ubxUNiav+to559ZbObo4j7v8
	 24oLtA9z8Jf7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFBE380A965;
	Wed, 11 Dec 2024 22:32:45 +0000 (UTC)
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
Subject: Re: [PATCH 1/2] asm-generic: provide generic page_to_phys and
 phys_to_page implementations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395636448.1729195.13128530873311699126.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:44 +0000
References: <20241023053644.311692-2-hch@lst.de>
In-Reply-To: <20241023053644.311692-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Oct 2024 07:36:36 +0200 you wrote:
> page_to_phys is duplicated by all architectures, and from some strange
> reason placed in <asm/io.h> where it doesn't fit at all.
> 
> phys_to_page is only provided by a few architectures despite having a lot
> of open coded users.
> 
> Provide generic versions in <asm-generic/memory_model.h> to make these
> helpers more easily usable.
> 
> [...]

Here is the summary with links:
  - [1/2] asm-generic: provide generic page_to_phys and phys_to_page implementations
    https://git.kernel.org/riscv/c/c5c3238d9b8c
  - [2/2] asm-generic: add an optional pfn_valid check to page_to_phys
    https://git.kernel.org/riscv/c/3e25d5a49f99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



