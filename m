Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF386E2405
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycHV1Bj9z3fbG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:09:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XsmIQJ3s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PycG22xPkz3fRV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:08:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XsmIQJ3s;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PycG21yKCz4xFd;
	Fri, 14 Apr 2023 23:08:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681477722;
	bh=lQ2sy1Tfw62Ka0rYbe1ZrKAYF5rJAMMAsOCk22IsWto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XsmIQJ3soXQbetkQ1EFK7ilZ4d9taopH/uxnydUgDsGDZBtuA/lMQSf1WxR3aVr4j
	 aWFNbT69fPVcYIue3Edkw9ggv8vi1sGC5QC9d7j0KaktizWblQ92eM3+nYKNToY7jH
	 B0rs1QC6LEdGeGYTifm/xA5R667sTgUMrvHdI/mKk4ucn21tqcN5W1UnlziIY8CEiI
	 T9AXkVyyPVgXy9WSBFh6YTUQ2FGBy44kZu1/4g27vlNOQadC26OMH+5gastWCJUNNV
	 zrIXcuXKPdpbKNjG+EBRDVpf0i0P2/te3agT3P87UcRqbDONwbZnicnhRQINq0URPd
	 WvvjIyGUrLyUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Move Power10 feature, PPC_MODULE_FEATURE_P10.
In-Reply-To: <20230413194625.10631-3-dtsen@linux.ibm.com>
References: <20230413194625.10631-1-dtsen@linux.ibm.com>
 <20230413194625.10631-3-dtsen@linux.ibm.com>
Date: Fri, 14 Apr 2023 23:08:41 +1000
Message-ID: <87fs92a9wm.fsf@mpe.ellerman.id.au>
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Danny Tsen <dtsen@linux.ibm.com> writes:
> Move Power10 feature, PPC_MODULE_FEATURE_P10, definition to be in
> arch/powerpc/include/asm/cpufeature.h.
>
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
>  arch/powerpc/include/asm/cpufeature.h  | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> index 1533c8cdd26f..bd3475f5348d 100644
> --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
> +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> @@ -22,7 +22,6 @@
>  #include <linux/module.h>
>  #include <linux/types.h>
>  
> -#define PPC_MODULE_FEATURE_P10	(32 + ilog2(PPC_FEATURE2_ARCH_3_1))
>  #define	PPC_ALIGN		16
>  #define GCM_IV_SIZE		12
>  
> diff --git a/arch/powerpc/include/asm/cpufeature.h b/arch/powerpc/include/asm/cpufeature.h
> index f6f790a90367..2dcc66225e7f 100644
> --- a/arch/powerpc/include/asm/cpufeature.h
> +++ b/arch/powerpc/include/asm/cpufeature.h
> @@ -22,6 +22,7 @@
>   */
>  
>  #define PPC_MODULE_FEATURE_VEC_CRYPTO			(32 + ilog2(PPC_FEATURE2_VEC_CRYPTO))
> +#define PPC_MODULE_FEATURE_P10				(32 + ilog2(PPC_FEATURE2_ARCH_3_1))
>  
>  #define cpu_feature(x)		(x)
>  
> -- 
> 2.31.1
