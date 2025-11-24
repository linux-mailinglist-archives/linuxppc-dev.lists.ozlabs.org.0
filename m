Return-Path: <linuxppc-dev+bounces-14436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B0C7F022
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 06:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFFJG3YsDz2yvd;
	Mon, 24 Nov 2025 16:49:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763963358;
	cv=none; b=PfGiTVFnUOOSqgHMNCBAIEKfIz286jdPydzAbVUlm1DWIwYh7Idbd+nMnvwsnWy+jBZ4oNUa0nxpyVckaZEGVY0uTGn0LC0uGVG8xfmjeypYh68biqmBfwueV2gFRKALgQ/j3Xkpe0Gk0CGATB2qe9QQOq0yMaWBn73zfqn0jjcNEAH99HRRmV2OUAOHwejDzjJk7Az6CEcSwaKx8Ew98pIn3/Uf+fAABI5Dw7wU3kPceZXNRETZ53+MsveThFnrc3PwXY3IDwcEUedap2lhhaG5NHkSMXG9Gsx63Ag8OSQJPaPVTPJxqCsZZHHiw2kDBiKcpNymUhTXKcSmPcQ41g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763963358; c=relaxed/relaxed;
	bh=85gkDOc9k7TycGaz4SlA9zgAvgvnE4HZD8NoYjBuk7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCSCPZkyf3pTleCfxYqfy7x0yUbLDHluM6eV9TVN8RPenydbHG/k70mC2XqXgKHUZWtTyzfJmGhVBRXbOgCdwKWEzqUc5OIY58kMf6Jrp9WM472eGUyxgckVZB4tI/1INFDpT1f0bB8vpVCoaVaoU3tS0JtNYN/M01WrZeVvPFeVtHcu/jJtdptK0BVejkJhAIwYIuEJwyErluJHFFcO713gXq129WrNl3HfNyiAbd+K2TaMQwezQMRkg65yKavRq7Ul9YLuHt0dFced8gNJlD3ILoj/0CPxMO6JEMgr5frEEKPy6XczWLunEsojZXK7a6sGyd2KFDVf70O5y9dejQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d0hF0S29; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d0hF0S29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFFJD5WtBz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 16:49:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 597DA43E89;
	Mon, 24 Nov 2025 05:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEDAC4CEF1;
	Mon, 24 Nov 2025 05:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763963354;
	bh=RtmieIsRpu0yymoknLrJY7KVzPDvgcoCBsCC6GwVpPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0hF0S293H4CLdNZYHzKT3Sy19IcdMMHpgMd0I2ySi7yRxraNmOYU340i+32ka0eL
	 3zxez05k6i4WcwOJnWAWguZIUpzNbzzpIroRxnRfj/onrTwgkB1Jz0C157tXMFDFho
	 CnJ3K4GolGj/uMZMXp0ZKJtuXJTWdzgIzgCDJMFgox/rhMhZ+GsH3dT+Ct773b1J1n
	 Mw5pIvUco6A43OkP/4hSekcFICNUBX5h/mfGtGjjuqiIuObY/dVYzyDDceU42opqNw
	 UF8dzfMJ90NVnieiCGikHIVcaFBadRZtZQR2nSLz2zUPlZqVSqMP69Cttr3KfEve6G
	 fANOXP9aKIA8g==
Date: Mon, 24 Nov 2025 11:19:16 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-trace-kernel@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev, Maryam Moghadas <maryammo@ca.ibm.com>
Subject: Re: [PATCH 1/3] powerpc64: make clang cross-build friendly
Message-ID: <rtnn6dd6y3refo7myc4crzmrunbuyabr2ewlyk7oe4yx3f2rl2@wzoyvsucfeyf>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
 <20251108210405.2375472-2-hbathini@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108210405.2375472-2-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 09, 2025 at 02:34:03AM +0530, Hari Bathini wrote:
> ARCH_USING_PATCHABLE_FUNCTION_ENTRY depends on toolchain support for
> -fpatchable-function-entry option. The current script that checks
> for this support only handles GCC. Rename the script and extend it
> to detect support for -fpatchable-function-entry with Clang as well,
> allowing clean cross-compilation with Clang toolchains.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig                                         | 5 +++--
>  ...-function-entry.sh => check-fpatchable-function-entry.sh} | 0
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  rename arch/powerpc/tools/{gcc-check-fpatchable-function-entry.sh => check-fpatchable-function-entry.sh} (100%)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 325c1171894d..dfb62e211c92 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -568,8 +568,9 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>  	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
>  	depends on $(cc-option,-fpatchable-function-entry=2)
>  	def_bool y if PPC32
> -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
> -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
> +	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_GCC
> +	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -target ppc64le -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_CLANG

Can you instead pass $(CLANG_FLAGS) to retain the same command across 
gcc/clang?

- Naveen


