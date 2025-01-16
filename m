Return-Path: <linuxppc-dev+bounces-5345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF3A13F08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 17:15:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYnyB4mGsz3bbR;
	Fri, 17 Jan 2025 03:14:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737044098;
	cv=none; b=DcVQt+GDOLZzibGvpz+sPn8upnYhdtqVsfd/ADgMCpt27bj7JgmyxKktZiQoMmslS72wOYZDnFTKrpLMO6dZdxlaenEHN4bfeAeIsmbQZNoPOQfXBqpp1uaHTnFYZL6f/FZKbg6nExSZo/chmzNHQJC/oz/MDmhkxomtgRsIt1JXq1LHi6ddaV2KEB9U9DAdVTZ9NkjZNsaHd2jWewCYdLALYAVBQoHi+SnO+gU/v2p1nXNML71co2EDWio0Cpfgj3OE9Nk9MjpUEFQytMkPEUgp5rl4oHRijvcqdVDqkA/RiDrWbg+JPbKrkuOCrnNPy1hDpNztU6VBFyy9ATKxow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737044098; c=relaxed/relaxed;
	bh=4cbtXMLzyPopkztv6BQOuugSdO0Hp2ZJ/CR118F3wDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq1cc48LxF/W9hVkFkmRSPRd1/Ae28jZHBo8X3xIdli/uinXm2+C7LXKZSbrSKNDsCmuhAx8bNZA3X3EiYpELjiuA7GpiFAhyto7hUiDFDmgtw05EprYRcZzgTMB7g7zEkOi/EXskXFA6AP4ZbOkDPryt00JVnQnWaACMfTWYGp57cS+fwMcpaRiwIRHdnuaCaG6AWr2PIasE4Gi/2DK6+YAGwfSF6ABaG5n3Relorl9iPVuj3n+dYhp+iSR2xyKkPF0uM90CX+e2rUaQ/fEzMod0c9RWrU/9Pe5PKSQQA88DSM3Y3HAed8MsAz8l4v6SLMrLFv56XQ1rIG6o5dXDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KiasD7Lt; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KiasD7Lt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYny95MPpz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 03:14:57 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A437140E0289;
	Thu, 16 Jan 2025 16:14:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DSpXVCCTm0WF; Thu, 16 Jan 2025 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1737044089; bh=4cbtXMLzyPopkztv6BQOuugSdO0Hp2ZJ/CR118F3wDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiasD7Ltwg0G/SI2EIAC+122DCxFU9a5tvYr/5rEiIw5Rk518f/QKDhVcZieo1NL7
	 Zo/HitIcvRaEAYzL9/0WF5r0aKcKdvRVotnU2itLnd0WYWTu+X8IUZpZd4mqmQRoK7
	 f9TjPLGUHlLQpaGO5Cjb2zPfzgPlH/BRo4Tm5mtgklbFVC/NUZcaKDMrDNYIqSWDru
	 2fPKzb0Ku/nBGjk6h9LusDshF+EEnK2rUMezcQcLF0ylLr5YkK+cG467m5qEN8EKMD
	 N22h1xlZ9XjHh6quo7eN6WpUIm//TI24G6w0wSGy5P6hQHzzf8HHc3E0sGpkMGJBo2
	 nmNmHoGZsXXCo3KxzoJkd1mbIAgLsgO5t0atXAms697kQgUEkwkW9qtRefvgqkmGYo
	 +D/9cnzrxdd4kUpx3Tt3nLUgRINQmzqg+RhPHEW4N8L4sc25xlH9dyQCYSddNEDEWJ
	 aFgsH9NBgP+CZf6nPJBcgGc7CIpOyJ5KoDyQdiHeqpQpale0U8Ims1enTAvijjrL+d
	 htZMPJS4BiDknjUywCNGux+fCjvZGRIUAcMXIDmp7eWl/ncPTsQwu/hjcZgF0gdgcU
	 pBb2XYdNlWUc3YvaHbxcDH4fNUxMabBfKNcQSfpu2hzYHQyRcu5hpTeaqcHQfn4J+C
	 inbcteCotyFFuf+Fepd94VDY=
Received: from zn.tnic (p200300ea971f934f329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971f:934f:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9787240E0288;
	Thu, 16 Jan 2025 16:14:43 +0000 (UTC)
Date: Thu, 16 Jan 2025 17:14:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, arnd@arndb.de, jk@ozlabs.org,
	segher@kernel.crashing.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH v2 23/25] EDAC/cell: Remove powerpc Cell driver
Message-ID: <20250116161436.GEZ4kwbBSanEBdIb5c@fat_crate.local>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
 <20241218105523.416573-23-mpe@ellerman.id.au>
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
In-Reply-To: <20241218105523.416573-23-mpe@ellerman.id.au>
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT
	autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 09:55:11PM +1100, Michael Ellerman wrote:
> This driver can no longer be built since support for IBM Cell Blades was
> removed, in particular PPC_CELL_COMMON.
> 
> Remove the driver.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> v2: Rebase.
> 
> Cc: linux-edac@vger.kernel.org
> 
>  drivers/edac/Kconfig     |   8 --
>  drivers/edac/Makefile    |   2 -
>  drivers/edac/cell_edac.c | 281 ---------------------------------------
>  3 files changed, 291 deletions(-)
>  delete mode 100644 drivers/edac/cell_edac.c

You forgot a spot:

diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
index 53f43a34e1a9..b33f0034990c 100644
--- a/arch/powerpc/configs/cell_defconfig
+++ b/arch/powerpc/configs/cell_defconfig
@@ -168,7 +168,6 @@ CONFIG_INFINIBAND_MTHCA=m
 CONFIG_INFINIBAND_IPOIB=m
 CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=y
 CONFIG_EDAC=y
-CONFIG_EDAC_CELL=y
 CONFIG_UIO=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y

Queued with that hunk added.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

