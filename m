Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D06E7C6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 16:23:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1jhD2VJGz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 00:23:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=eJ51Lyhm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=eJ51Lyhm;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1jgM4nS2z3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 00:22:54 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso1793928b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681914172; x=1684506172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvT99d3vu2s9u2HdXHuOsCskK0/5VChFq+aBcaoQwKM=;
        b=eJ51Lyhme8n3XB+0k6fcBFov9PY8/EUmTR8+nuSaGr7xBsijqIoLjwhsLzVxYH/nx0
         wauVowtfzqnaLMg0Md06tjLXI3lWkSGzsXedNOsMpQwkDCNvEtBTyQ19M/Yyo6D06BSV
         XNjXn0CGdLZl3nFWqDjNax+yB6CXLq01SwKNwyDS36uGnLYxQFXzNQuK/+7hScqPlZwX
         z+agJw/VCIGMUixwVDzm2XMnLSn8GR3DsnMXY+jrQCfbr9O1Le1uXDKTi2rYkt7oJ2Ce
         tyNNGrxSj0L54sdbIeiSTDtndMc3YiWnjyxMJLeRw/TsNRHsyFeDM9KNzzDNKUVPs4Et
         pKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914172; x=1684506172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvT99d3vu2s9u2HdXHuOsCskK0/5VChFq+aBcaoQwKM=;
        b=Kve/pf0rQI2PyqzN7M7vjEtkzbhmTMlv9MjvEdNqgeYZ08ah7XCk13G2APs0Ng5nsA
         tP0+wC9+lnr4vuFl2XG/f7584O69g/5CZ77G24AtzvCqWpzyaWUkc6gLyvPSUjdvISxh
         lwhiVb510DKdaU//SIkgNUGj5CdG3qKEK3kAUZAVKwoJwBqgdJiplBpqmaR7qMRuFHdT
         wmJhsqoVStpB8v30prDB+BZUUh6SyolfCoElSySImPcjsB+cL0rbk5Nnm3zCTdcxofqg
         vM2MhqNOk40ICH2o1hJRne6yJ2yqTHzkOFfF9cgX95b3knsYGiz50NpXggrSvwLo0PAO
         oNeA==
X-Gm-Message-State: AAQBX9cOZJGhEerhysOohqDDw6dSMBAyTl8CAaels3y6k/cyFpaRHxya
	nJQRzUqGkOdHF1Xa8vJEJBGnBg==
X-Google-Smtp-Source: AKy350YgrN7zbaEKFT5DU1qrct74Wsi9a0WokbCy4dVCW0VXg9H7v3lPwT87yJxbljWHRWpRpF5B0Q==
X-Received: by 2002:a05:6a00:130a:b0:63b:859f:f094 with SMTP id j10-20020a056a00130a00b0063b859ff094mr4002975pfu.20.1681914171995;
        Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d2-20020a63d642000000b005140ce70582sm10431557pgj.44.2023.04.19.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:22:44 PDT (-0700)
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-7529cf5a-4397-456f-b610-faa619d4faca@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linus.walleij@linaro.org, glaubitz@physik.fu-berlin.de, linux-mips@vger.kernel.org, jcmvbkbc@gmail.com, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, deller@gmx.de, linux@armlinux.org.uk, geert@linux-m68k.org, vgupta@kernel.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, bcain@quicinc.com, prabhakar.mahadev-lad.rj@bp.renesas.com, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org, linux-
 hexagon@vger.kernel.org, linux-oxnas@groups.io, robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Mar 2023 05:13:05 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index 640f4c496d26..69c80b2155a1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
