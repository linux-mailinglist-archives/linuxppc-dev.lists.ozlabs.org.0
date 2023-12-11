Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C080C837
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 12:41:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OjaZsTBT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Spfw64rcVz3byT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 22:41:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OjaZsTBT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpfvG2Ktlz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 22:40:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702294842;
	bh=k4wN68Mq0e2bKIcvTdFsm/pTk95jdSaidC3qaQdYyYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OjaZsTBT/hWYSnsoSwj4KCR5Jy3sQDTssSNWeIv+komjJmEafPirJrQjpcL7bvPrk
	 pHubtmp3y+48jrCAPndqJnSRDEom1RfPP2CZW9f7GgR5Bu5ZXvldEqJhffcZLmVkeJ
	 O4YvXEPxHVLvoh1AXro+tBs+8DLxe6hu35qbTZSQTWFCfM8gEqU41ehaH5HUKvTQ8z
	 wdX2EmB0csZsywRtzYoH+gG7mbnTpeILo8jzDRhersMGQU9wTju80irAt44wKoMMPe
	 JeLbuGw8o8MmehEJvsGrpwLs/nMtMak6RbETYVZrr7+iKCh5HK9WG+UK/lP1KA+Msr
	 Blm4bLht2iwbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpfvG0ZmVz4xPL;
	Mon, 11 Dec 2023 22:40:41 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH 1/2] powerpc/locking: implement this_cpu_cmpxchg local API
In-Reply-To: <0EFBD0242622180B+20231204022303.528-1-luming.yu@shingroup.cn>
References: <0EFBD0242622180B+20231204022303.528-1-luming.yu@shingroup.cn>
Date: Mon, 11 Dec 2023 22:40:38 +1100
Message-ID: <87jzpldl1l.fsf@mail.lhotse>
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Luming Yu,

Luming Yu <luming.yu@shingroup.cn> writes:
> ppc appears to have already supported cmpxchg-local atomic semantics
> that is defined by the kernel convention of the feature.
> Add this_cpu_cmpxchg ppc local for the performance benefit of arch
> sepcific implementation than asm-generic c verison of the locking API.

Implementing this has been suggested before but it wasn't clear that it
was actually going to perform better than the generic version.

On 64-bit we have interrupt soft masking, so disabling interrupts is
relatively cheap. So the generic this_cpu_cmpxhg using irq disable just
becomes a few loads & stores, no atomic ops required.

In contrast implementing it using __cmpxchg_local() will use
ldarx/stdcx etc. which will be more expensive.

Have you done any performance measurements?

It probably is a bit fishy that we don't mask PMU interrupts vs
this_cpu_cmpxchg() etc., but I don't think it's actually a bug given the
few places using this_cpu_cmpxchg(). Though I could be wrong about that.

> diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
> index 8e5b7d0b851c..ceab5df6e7ab 100644
> --- a/arch/powerpc/include/asm/percpu.h
> +++ b/arch/powerpc/include/asm/percpu.h
> @@ -18,5 +18,22 @@
>  #include <asm-generic/percpu.h>
>  
>  #include <asm/paca.h>
> +#include <asm/cmpxchg.h>
> +#ifdef this_cpu_cmpxchg_1
> +#undef this_cpu_cmpxchg_1
 
If we need to undef then I think something has gone wrong with the
header inclusion order, the model should be that the arch defines what
it has and the generic code provides fallbacks if the arch didn't define
anything.

> +#define this_cpu_cmpxchg_1(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 1)

I think this is unsafe vs preemption. The raw_cpu_ptr() can generate the
per-cpu address, but then the task can be preempted and moved to a
different CPU before the ldarx/stdcx do the cmpxchg.

The arm64 implementation had the same bug until they fixed it.

> +#endif 
> +#ifdef this_cpu_cmpxchg_2
> +#undef this_cpu_cmpxchg_2
> +#define this_cpu_cmpxchg_2(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 2)
> +#endif
> +#ifdef this_cpu_cmpxchg_4
> +#undef this_cpu_cmpxchg_4
> +#define this_cpu_cmpxchg_4(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 4)
> +#endif
> +#ifdef this_cpu_cmpxchg_8
> +#undef this_cpu_cmpxchg_8
> +#define this_cpu_cmpxchg_8(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 8)
> +#endif
>  
>  #endif /* _ASM_POWERPC_PERCPU_H_ */

cheers
