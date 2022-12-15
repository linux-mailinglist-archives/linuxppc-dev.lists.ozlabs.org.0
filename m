Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455764DB91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 13:48:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXsTV6KDdz3cMw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 23:47:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=atkDITg0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXsSb1kRSz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 23:47:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=atkDITg0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NXsSb0YbYz4xFy;
	Thu, 15 Dec 2022 23:47:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671108431;
	bh=6bP+wHlFKzKslZ/4uVvZb/BggFBAmkKQserkG5z/uZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=atkDITg0PXT60wrdYM1QQZqeOglTuIvcPzdMMFyowH6svRii8HJCnwJ17wls1xoGH
	 6A6hZFhfoYWfBuGVi5YV1EDjZFnwjqYuxMYFNB9DlfI/ICGIERbwKNlcRCTVZHniK4
	 xLjRdh2cNocookIvdBusNiwwN1YVMqnw9xeCrkOPakTESX3OV5fq6s4uljf5IW59Kd
	 MONglzvfbOuYVCmPnR/urWNB6Nt7SWGlUSzWEiI1vzYjPkRy6+z+uFH1ZiFmE/J4cq
	 jjvaYnXnWzkVihdnon+l7TbDzbOAfNDQUq81gN1NI7HfwFLMOf1FLVzn3nRs1LpZUF
	 Mjevt3CZQCRxg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
In-Reply-To: <20221214144525.pecvb4cmnvth6n62@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <87bko8j73z.fsf@mpe.ellerman.id.au>
 <20221214144525.pecvb4cmnvth6n62@lug-owl.de>
Date: Thu, 15 Dec 2022 23:47:07 +1100
Message-ID: <87359gkf5g.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jan-Benedict Glaw <jbglaw@lug-owl.de> writes:
> On Tue, 2022-12-13 14:49:20 +1100, Michael Ellerman <mpe@ellerman.id.au> wrote:
> [...]
>> Both treeboot-akebono.c and treeboot-currituck.c are for 476 so should
>> probably be built with -mcpu=476. eg:
>> 
>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
>> index d32d95aea5d6..acb6eddace8f 100644
>> --- a/arch/powerpc/boot/Makefile
>> +++ b/arch/powerpc/boot/Makefile
>> @@ -88,8 +88,8 @@ $(obj)/cuboot-taishan.o: BOOTCFLAGS += -mcpu=440
>>  $(obj)/cuboot-katmai.o: BOOTCFLAGS += -mcpu=440
>>  $(obj)/cuboot-acadia.o: BOOTCFLAGS += -mcpu=405
>>  $(obj)/treeboot-iss4xx.o: BOOTCFLAGS += -mcpu=405
>> -$(obj)/treeboot-currituck.o: BOOTCFLAGS += -mcpu=405
>> -$(obj)/treeboot-akebono.o: BOOTCFLAGS += -mcpu=405
>> +$(obj)/treeboot-currituck.o: BOOTCFLAGS += -mcpu=476
>> +$(obj)/treeboot-akebono.o: BOOTCFLAGS += -mcpu=476
>>  
>>  # The pre-boot decompressors pull in a lot of kernel headers and other source
>>  # files. This creates a bit of a dependency headache since we need to copy
>
> With this patch applied, it seems this fixes these asm-related builds:
>
> linux-powerpc-bamboo_defconfig
> linux-powerpc-cell_defconfig
> linux-powerpc-ebony_defconfig
> linux-powerpc-katmai_defconfig
> linux-powerpc-ppc44x_defconfig
> linux-powerpc-rainier_defconfig
> linux-powerpc-sam440ep_defconfig
> linux-powerpc-sequoia_defconfig
> linux-powerpc-taishan_defconfig

Thanks.

> ...while three remain unresolved:
>
> linux-powerpc-asp8347_defconfig

OK. Patch below which I believe fixes that.

diff --git a/arch/powerpc/include/asm/reg_fsl_emb.h b/arch/powerpc/include/asm/reg_fsl_emb.h
index a21f529c43d9..8359c06d92d9 100644
--- a/arch/powerpc/include/asm/reg_fsl_emb.h
+++ b/arch/powerpc/include/asm/reg_fsl_emb.h
@@ -12,9 +12,16 @@
 #ifndef __ASSEMBLY__
 /* Performance Monitor Registers */
 #define mfpmr(rn)	({unsigned int rval; \
-			asm volatile("mfpmr %0," __stringify(rn) \
+			asm volatile(".machine push; " \
+				     ".machine e300; " \
+				     "mfpmr %0," __stringify(rn) ";" \
+				     ".machine pop; " \
 				     : "=r" (rval)); rval;})
-#define mtpmr(rn, v)	asm volatile("mtpmr " __stringify(rn) ",%0" : : "r" (v))
+#define mtpmr(rn, v)	asm volatile(".machine push; " \
+				     ".machine e300; " \
+				     "mtpmr " __stringify(rn) ",%0; " \
+				     ".machine pop; " \
+				     : : "r" (v))
 #endif /* __ASSEMBLY__ */
 
 /* Freescale Book E Performance Monitor APU Registers */

> linux-powerpc-mvme5100_defconfig

And another:

diff --git a/arch/powerpc/kernel/epapr_hcalls.S b/arch/powerpc/kernel/epapr_hcalls.S
index 69a912550577..1ed73ab30288 100644
--- a/arch/powerpc/kernel/epapr_hcalls.S
+++ b/arch/powerpc/kernel/epapr_hcalls.S
@@ -21,7 +21,10 @@ _GLOBAL(epapr_ev_idle)
 	ori	r4, r4,_TLF_NAPPING	/* so when we take an exception */
 	PPC_STL	r4, TI_LOCAL_FLAGS(r2)	/* it will return to our caller */
 
+	.machine push
+	.machine booke
 	wrteei	1
+	.machine pop
 
 idle_loop:
 	LOAD_REG_IMMEDIATE(r11, EV_HCALL_TOKEN(EV_IDLE))


Not sure if that's the best solution, but it will at least unblock you
and allow you to actually test GCC which is I assume your goal.

> linux-powerpc-ppc64e_defconfig

TBD.

> Of course I cannot verify the resulting kernel binaries, but I guess
> you'd push this patch.

I don't have the hardware for most of these old boards, but I'll test
what I can, and yes I'd take the patch.

cheers
