Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A52CB773CDA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:10:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CyK+8K30;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKypD3Xpsz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 02:10:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CyK+8K30;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyn96bptz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 02:09:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=F0tdNJIRRaI2CKblutNUn5ZxrmtAEp1IukyUwjA6V8I=; b=CyK+8K30AGzHC/bxjc3iPjhFBq
	/Pzq76cxAlSOkm8vRjkiTmd8No/458VSrwqk6agf/RH0Iric780uAes5qXVOC9ZaqaZKrn1Icz1zD
	Vug5TxvXR5RuCJyxNtZwm4d/qvMjkHj2T+1jl1i11DK/aV72vhUujtG2HGWZCBq8C+sWLx07CdZmH
	i8aXndeNraM9qcfoz3VAWqiyWOTJ/5iMZVJNy6dRILFtf/irBT9m2cY+F/McrE4mMwQBf7xwuyBsX
	7mxkV2bWlxz7Ggcvlnm9ethMO46njv8pBoOHsG4lW/kc5FxDeKLgx6lON6drYLm7R7qrN3fOkMhxp
	b1vISzFQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPGv-002uKd-0V;
	Tue, 08 Aug 2023 16:09:25 +0000
Message-ID: <828497a6-80c2-329f-8b47-2311bf08943d@infradead.org>
Date: Tue, 8 Aug 2023 09:09:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] powerpc: Use shared font data
Content-Language: en-US
To: linux@treblig.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org
References: <20230807010721.799613-1-linux@treblig.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230807010721.799613-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi--

On 8/6/23 18:07, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> PowerPC has a 'btext' font used for the console which is almost identical
> to the shared font_sun8x16, so use it rather than duplicating the data.
> 
> They were actually identical until about a decade ago when
>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>                         "broken bar" to "vertical line"")
> 
> which changed the | in the shared font to be a solid
> bar rather than a broken bar.  That's the only difference.
> 
> This was originally spotted by PMD which noticed that sparc does
> the same thing with the same data, and they also share a bunch
> of functions to manipulate the data.  I've previously posted a near
> identical patch for sparc.
> 
> One difference I notice in PowerPC is that there are a bunch of compile
> options for the .c files for the early code to avoid a bunch of security
> compilation features;  it's not clear to me if this is a problem for
> this font data.
> 
> Tested very lightly with a boot without FS in qemu.
> 
> v2
>   Added 'select FONT_SUPPORT' (to stop modconfig causing the font to be
>    linked into a module rather than the main kernel)
>   Added 'select FONTS' to satisfy requirements in lib/fonts
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  arch/powerpc/Kconfig.debug  |   3 +
>  arch/powerpc/kernel/btext.c | 360 +-----------------------------------
>  2 files changed, 9 insertions(+), 354 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index 2a54fadbeaf51..521c4baf30e88 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -147,6 +147,9 @@ config BDI_SWITCH
>  config BOOTX_TEXT
>  	bool "Support for early boot text console (BootX or OpenFirmware only)"
>  	depends on PPC_BOOK3S
> +	select FONT_SUN8x16
> +	select FONT_SUPPORT
> +	select FONTS
>  	help
>  	  Say Y here to see progress messages from the boot firmware in text
>  	  mode. Requires either BootX or Open Firmware.

kconfig tells me:

WARNING: unmet direct dependencies detected for FONTS
  Depends on [n]: FONT_SUPPORT [=y] && (FRAMEBUFFER_CONSOLE [=n] || STI_CONSOLE [=n])
  Selected by [y]:
  - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]

WARNING: unmet direct dependencies detected for FONT_SUN8x16
  Depends on [n]: FONT_SUPPORT [=y] && FRAMEBUFFER_CONSOLE [=n] && (!SPARC && FONTS [=y] || SPARC)
  Selected by [y]:
  - BOOTX_TEXT [=y] && PPC_BOOK3S [=y]

because FONTS depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE and neither of those is set.


-- 
~Randy
