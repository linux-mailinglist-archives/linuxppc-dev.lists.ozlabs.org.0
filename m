Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E58BCA1F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 10:58:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gS2TAt28;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXwL61YbVz3bv8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:58:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gS2TAt28;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXwKL6Qt8z30TJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 18:57:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714985861;
	bh=cckhLARkyb3oh/wDwudJRWGBL6LODBWmZxbKJGkql3o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gS2TAt28hdJp0GVGuxc0GqF0HBwJIIE6g865JbTcDlQ4Bq15z5L2lKpDYOEn9r1ww
	 hsX15AwxZD1CjOwo4xRbYzBcwoiSq0TNZUiTXUub8V24eZGadzhzkvFJHFFu9oZt3H
	 QAcIpzLF9IzLL8/RJlkwnpXW7MyeKY0uF2NehUEzm9/Bim0CzqfU9w9cwum+5pGQwF
	 xSI1GAbrHs1469EaFCgMZwVhfD2AiSCW6nWax66+g5qkjilBF79mQZpSQL5OrQSGXu
	 e5172dSMmCRQxc4I8MOmnYs1NF2QAnG5NjOlhgW4zHUvQ/3D8+TxMr/9S1YopiTt4Z
	 JS27CStBxNFLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXwKC2cR3z4x12;
	Mon,  6 May 2024 18:57:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 01/29] powerpc/mm: add ARCH_PKEY_BITS to Kconfig
In-Reply-To: <20240503130147.1154804-2-joey.gouly@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-2-joey.gouly@arm.com>
Date: Mon, 06 May 2024 18:57:32 +1000
Message-ID: <8734qvnwqr.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, joey.gouly@arm.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joey Gouly <joey.gouly@arm.com> writes:
> The new config option specifies how many bits are in each PKEY.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1c4be3373686..6e33e4726856 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -1020,6 +1020,10 @@ config PPC_MEM_KEYS
>  
>  	  If unsure, say y.
>  
> +config ARCH_PKEY_BITS
> +	int
> +	default 5
> +
>  config PPC_SECURE_BOOT
>  	prompt "Enable secure boot support"
>  	bool
> -- 
> 2.25.1
