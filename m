Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C386FBE25
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 06:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFlKw5pgNz3fLh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 14:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OeLw5Y49;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OeLw5Y49;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFlK06ZMnz3chV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 14:18:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hAweX2f1hu6oBbHEW7rwfHxKnrqr1h9EowLzMonuLeA=; b=OeLw5Y496lChWTtHlDSw3IgCq3
	awDnMHCY3st2vb0Sd+sZ0wMUD3UPIWoG5GQGFbvddOOL6CF1qUEq2KWqBF0DZmx14t45iElFrc555
	SBZGDTZgM7To8DJxR8cI8kKnlShBMFFpk2Vt0/CcEhZNoIkiFBerruiP8KpDDU+yqJdVADmoUyuQb
	TJdFP/qvtox7VOtoufdpNunEr5tqLZ6FUdnhKCMywQ094Ul6xlHi1u9QXSDTYNcuPRptQ01EdlXOK
	Ov8pwSmKxIWsZoTVBeAjpfsFgKYrt04EhG8eiYb/8HxSEyIQ0NXOUxQYzCJiCdu8lGx1KZz3TSxvO
	MwTRWAhg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pwEo5-002EtN-0K;
	Tue, 09 May 2023 04:18:33 +0000
Message-ID: <62539831-1f8c-d908-bd7c-2a926702fa7f@infradead.org>
Date: Mon, 8 May 2023 21:18:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH AUTOSEL 6.3 6/7] powerpc/fsl_uli1575: Allow to disable
 FSL_ULI1575 support
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230509035455.59524-1-sashal@kernel.org>
 <20230509035455.59524-6-sashal@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230509035455.59524-6-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de, linus.walleij@linaro.org, linuxppc-dev@lists.ozlabs.org, andriy.shevchenko@linux.intel.com, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi--

Just a heads up. This patch can cause build errors.
I sent a patch for these on 2023-APR-28:
  https://lore.kernel.org/linuxppc-dev/20230429043519.19807-1-rdunlap@infradead.org/

Michael, I think this is your area if I'm not mistaken.


On 5/8/23 20:54, Sasha Levin wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> [ Upstream commit 22fdf79171e8509db54599fd2c05ef0022ee83f5 ]
> 
> ULI1575 PCIe south bridge exists only on some Freescale boards. Allow to
> disable CONFIG_FSL_ULI1575 symbol when it is not explicitly selected and
> only implied. This is achieved by marking symbol as visible by providing
> short description. Also adds dependency for this symbol to prevent enabling
> it on platforms on which driver does not compile.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://msgid.link/20230409000812.18904-7-pali@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/powerpc/platforms/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> index d41dad227de84..608ac0290e3aa 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -261,7 +261,9 @@ config CPM2
>  	  on it (826x, 827x, 8560).
>  
>  config FSL_ULI1575
> -	bool
> +	bool "ULI1575 PCIe south bridge support"
> +	depends on FSL_SOC_BOOKE || PPC_86xx
> +	select FSL_PCI
>  	select GENERIC_ISA_DMA
>  	help
>  	  Supports for the ULI1575 PCIe south bridge that exists on some

-- 
~Randy
