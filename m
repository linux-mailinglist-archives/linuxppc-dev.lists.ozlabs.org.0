Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD93A810E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:42:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48dY24CLz3h3j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:42:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rUlE1M2G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rUlE1M2G; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48YQ01lsz3ddh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:39:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G48YK4nstz9t54;
 Tue, 15 Jun 2021 23:39:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623764341;
 bh=RwiNM5CQW9h5uaDmsze6JyeYY756VrLGT8x+mRIP0jo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rUlE1M2GuK/gAHQlqr4VAnqBjlYFW5s8cyDCb0hCVNiYi58bfCjMTpVgx8S9SWrZI
 /g1tHJ0jkv4IoTon+sS1dHPA956yGuc9AJ0UOcCdY0VttHcNF2s5XrkuTCMopDn1q1
 52pwyUjbmOcQ78PHqJgIDPuoYvQwHxthp4FpX5rkJiKBRUr3x8CwoNNZFeYjUDQyGw
 iccwwwAzL0Bl40IkvpKjPkNzWXdOMRURBzO+QXBLAkhbSyvS5Ml+VJe8pIx8MvfhuD
 qE0RufpMcSJUxygYb7IcrVIgLYdqgu0BpnWAZmTP68NoJ8ceCyZzndMSojDO7/R1o4
 onhiApeZdbIZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 03/11] powerpc/64s: avoid reloading (H)SRR registers
 if they are still valid
In-Reply-To: <20210610130921.706938-4-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
 <20210610130921.706938-4-npiggin@gmail.com>
Date: Tue, 15 Jun 2021 23:39:00 +1000
Message-ID: <87eed3tfgr.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
> index 2c57ece6671c..44526c157bff 100644
> --- a/arch/powerpc/kernel/fpu.S
> +++ b/arch/powerpc/kernel/fpu.S
> @@ -103,6 +103,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
>  	ori	r12,r12,MSR_FP
>  	or	r12,r12,r4
>  	std	r12,_MSR(r1)
> +	li	r4,0
> +	stb	r4,PACASRR_VALID(r13)
>  #endif
>  	li	r4,1
>  	stb	r4,THREAD_LOAD_FP(r5)

This didn't build for 64e. I changed it to:

#ifdef CONFIG_PPC_BOOK3S_64
	li	r4,0
	stb	r4,PACASRR_VALID(r13)
#endif


And similarly for vector.S.

cheers
