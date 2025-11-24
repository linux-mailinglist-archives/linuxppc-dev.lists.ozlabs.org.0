Return-Path: <linuxppc-dev+bounces-14466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1953C8252F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 20:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFbrm66C9z2xS2;
	Tue, 25 Nov 2025 06:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764013512;
	cv=none; b=PYAvdu0jOFpNqXJt0gXfuKkmUNaekjrt4BWWFREetDdLA+HhGhuHfOeO4weQkIUr+r/joKMXVUq8SAA2ESL5bmAL4pKtYccfdxhR2d0k1bziC0KQciyAKlggtwwmcXPQAUcAx61bz4/AnlWlJZc3e0LN+2yaallL38iGww1JdYebx/3hmJPHNPtG2MIM1lriz1W2U1omTnp9DuzVm6p0RiifxgdwNPRY1vgBUgYrRllqiuhpI6LWA6+3N2lPRsRfTSXVYrCeaFRiOeA/WGgdpm0pE9rc45oM2J4il5zsx5GnqdkWjClMqnK1vYyPfVd8TGmU2DhOeZUTYOAQp7D9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764013512; c=relaxed/relaxed;
	bh=Z9NRbvbrhjIdo5mzli/NoWW87vzoGkyvyjPgyspuECw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ke/wiCmYHXg4quG0vimaZIiLvmor2eXHaYiYAyiLkSPcpgc3JGwDQZgaNdE4pTQUGFnafIfBGHpi0k+7PgXz/Gd7teYjbzwuE0kKDCYwETPNNGLrGEwNTTyG2FN1nOxE2IfRF5qGylu9PdQ2McYeyRUmrjYn0z6Rf73fxJjxkGn/5vS7TCEte9GP0smuB6ThdxtId4I3SBL/XYc3okzcTOK1NbBUXvcrOGOcjtYXYMIbYHgFXNdSYi5eUTPbJfswzbivmGiY4KbZyL5yvRtifzU6EyqIwzzSeSSwsyfkzGEqlV2Y12LrWqL4iy7GMXNYMYvTSQmLYxAkEg2u/s+zdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ONZ8dMDr; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ONZ8dMDr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFbrm0b89z2xQq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 06:45:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4816431CE;
	Mon, 24 Nov 2025 19:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAD7C4CEF1;
	Mon, 24 Nov 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764013509;
	bh=f2y7eo38yC/1lx5V3MylKrP9n9Jsl8oI8vUn8UUJJws=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ONZ8dMDrCtiEw2jlS6Esh1rqesyQ4eLZhTgzgpEK/KAdEXQBJCtXoryYkM2PCLT6C
	 C5HIWe3AzoJgSq74hbItQsOEd0rHLSeutU4NQ13PZQ5kJojo/WJcdaw+4HCfcrZRV0
	 cpl7yjo4XUxoCYwXf/LR9qpnbzObLUUGo6QpB6zVFC/b+4HnNCS67FOW8rVvM8xy04
	 k1QjW4asfrq+4nPyvlz4hZPG+ELT7zA7ro7fwC6jYWMGOx97z9kJ0hcDvOV3xsjtMB
	 nazKz6X6sLUpSMbQxkEwf+LPPMuPjzosVTQqbY5KFS8eAXRRtYUYQdyBwKMzKkwp99
	 FO0NFvzn2l3lA==
Message-ID: <c40ea685-39c2-41a1-95d7-435d4dfcc58e@kernel.org>
Date: Mon, 24 Nov 2025 20:45:03 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Downgrade ocxl to Odd Fixes
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Christophe Lombard <clombard@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Le 20/11/2025 à 04:16, Andrew Donnellan a écrit :
> There hasn't been any substantive work on the ocxl driver since 2020, and
> all patches since then have been minor fixes or part of treewide or
> arch-wide changes. Frederic and I are no longer spending much time on this
> driver.
> 
> Downgrade the status of the ocxl driver to Odd Fixes, to reflect the
> current reality.

There one patch in patchwork at the time being, will you handle it ?

"ocxl: Fix race leading to use-after-free in file operations"

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20251024010228.1667904-1-danisjiang@gmail.com/

Christophe

> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea8194ac8970d0e34421670b663347b4678a34de..3d558554f074916364b013855dc0a82cfb6e73f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18755,7 +18755,7 @@ OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
>   M:	Frederic Barrat <fbarrat@linux.ibm.com>
>   M:	Andrew Donnellan <ajd@linux.ibm.com>
>   L:	linuxppc-dev@lists.ozlabs.org
> -S:	Supported
> +S:	Odd Fixes
>   F:	Documentation/userspace-api/accelerators/ocxl.rst
>   F:	arch/powerpc/include/asm/pnv-ocxl.h
>   F:	arch/powerpc/platforms/powernv/ocxl.c
> 
> ---
> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> change-id: 20251120-ocxl-odd-fixes-6a87a68dd270
> 
> 
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
> 
> 


