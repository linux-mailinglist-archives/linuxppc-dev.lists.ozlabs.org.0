Return-Path: <linuxppc-dev+bounces-3403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9F9D0EC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 11:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsPMQ4b3nz2y34;
	Mon, 18 Nov 2024 21:42:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731926530;
	cv=none; b=eej85CppmR87jc8053tVYevYJGeb+ofxQIg81VynmtmNrQpYbbvwgsv9uFi87jYVn8O9mwZCpVM1t6L/0CMS8i9i5YkZziTWVVo+sm/Eb1fy/U5H0aoTGGSpXJ0E0yWxnVTukybWN8+bfxDL1kCORwh7nSlUvyJdPi5sPVnpljMllzeDpwixsO1BJSD0mRhv0CC8rVHkXtMZxzHJP7b+64VKHGSZhY5Vai1aaVXQGBzS1fP3FYAmL25ViEiJosETGqIoNjDbieeksKw3d9pPD4Xn6biErYqxhhJVmVqpoIoyAeZgScslGrWZNL1OLGQkgAPytFK8PNLn1CYE4Pb6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731926530; c=relaxed/relaxed;
	bh=DmWtgi2Qz0m6ZoT7qjh0PUC9+yoNEpuOT/5+gLqTlk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6l4YxiOes/G+SGQmns1ylGhIyqLdGsGLqnTLvuWphpa+6toCefvZW/WjSPIxOm43eh/LrEFotFtG/4bxASqTeEIIDsTz941qwM1C9GqU6Xzuknw/akSie2xl6nXRsCWCqyGub8k+JqohhzwML2NpSnr4moRYVnR+nneaFp/QiPAhHjjJs+bw9emKyKO4KKYMpPszszOZVeeNIBUj4la0ITVkiSA9AMtOBRTo5DbNAsJf1WZnA0BgNgXNlXOCyeEoQUBH1hCMKZHadpV2+vUKCAf6Fu1VF0H2TvuHP3zS9xf/myDiPYGSYeYUemf6Ryko1p+OupU48+z3AYQkR8/+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=JvWhmqmR; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=JvWhmqmR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsPMM57mLz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 21:42:04 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2708040E019C;
	Mon, 18 Nov 2024 10:41:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OvAE2aXAax_E; Mon, 18 Nov 2024 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1731926513; bh=DmWtgi2Qz0m6ZoT7qjh0PUC9+yoNEpuOT/5+gLqTlk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvWhmqmRUL7hkytSCadEsftyQZKStLgnKxQ7agUehRPUm1ZpVWnixa4PPWp1SIqoe
	 B0enESfQMM4tBv8OGr3oljiDEJy53Cput7Tbtpo5l/yTEOABbGS7lsX40nOSy78mGK
	 uN0kaY126B8moeEx1Kd74aXQBfWrqZULBxXSJmSBS1T4XQwhnX17MBMiHfLy+w1ynD
	 tk7kA0N+oLs6kJpgaVSP1Af169qh2I7ULbzp9bu6xvTzh+h/48BIdqnxwWT8k+6sET
	 xpqjcnpnUrKE5vtHnoDTSbyVZONtyWW7D8zJpnZmmTHWbh/KiNv+MMvRGTCVQ9Zx/Z
	 J5daFgDpW47r1bpgQQPSyduzz085tzUxHbLWXX7NAKwUbY0hrUnvd0zFLUK1AiRg8X
	 rTm1iGsHtQsMyBztWeLmr2FSQgr1FZUZTmGDJfunx4IgtvVcJjwH12+05OAy3T+Srr
	 cX7AGw5UVQPhXz2KTTn6TWzFHlIRIXbRVkc5wbh7/TvrKxJ+aND6IwipLlv25LlrnH
	 jHHOMYePIE22wYsbcwEXa3F7LylXwFh8Tt07LFZBesr5abbc0KxkiLCwudeTg9XjAQ
	 eGqnrrFfxj4NMxqUcqEiRoUAoel5a0PUXnFILzlBIairHJVl1TPu2mKq4K99nFb8GG
	 Hej1E+d6sW5YH7KdeqVs6lQg=
Received: from zn.tnic (pd9530b86.dip0.t-ipconnect.de [217.83.11.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 165CA40E0163;
	Mon, 18 Nov 2024 10:41:48 +0000 (UTC)
Date: Mon, 18 Nov 2024 11:41:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, tony.luck@intel.com
Subject: Re: [PATCH] EDAC/powerpc: Remove PPC_MAPLE drivers
Message-ID: <20241118104142.GAZzsZ5vcY_Vv3GvY-@fat_crate.local>
References: <20241112084134.411964-1-mpe@ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112084134.411964-1-mpe@ellerman.id.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 12, 2024 at 07:41:34PM +1100, Michael Ellerman wrote:
> These two drivers are only buildable for the powerpc "maple" platform
> (CONFIG_PPC_MAPLE), which has now been removed, see
> commit 62f8f307c80e ("powerpc/64: Remove maple platform").
> 
> Remove the drivers.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  drivers/edac/Kconfig        |  18 --
>  drivers/edac/Makefile       |   2 -
>  drivers/edac/amd8111_edac.c | 596 ------------------------------------
>  drivers/edac/amd8111_edac.h | 118 -------
>  drivers/edac/amd8131_edac.c | 358 ----------------------
>  drivers/edac/amd8131_edac.h | 107 -------
>  6 files changed, 1199 deletions(-)
>  delete mode 100644 drivers/edac/amd8111_edac.c
>  delete mode 100644 drivers/edac/amd8111_edac.h
>  delete mode 100644 drivers/edac/amd8131_edac.c
>  delete mode 100644 drivers/edac/amd8131_edac.h
> 
> The removal commit is in the powerpc/next branch:
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next
> 
> I can take this via the powerpc tree if that's easiest, let me know.

Yes, please do. 

I've been meaning to reply to you but then gazillion things interrupted me and
... you know how it is. Sorry.

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

