Return-Path: <linuxppc-dev+bounces-11393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1EB388E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBsWd2HK9z305n;
	Thu, 28 Aug 2025 03:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756317037;
	cv=none; b=RIi+1qPRa0qP+lXCY3EBCRRVw68VaUKks65mIgZqRKeM7cXHZHoQ69tZ6qdvqG2MWgPCZP6u6ghktilxL9Rc5dGAuATD0VH8cnGS18erilAeC0nc0KH4flKtU1Y70gPI0eII3ko8xCsPKhWx0fIUFG0V/Fx3t0Jic0vCOi5oknOs/Vsn1bXxRHKOQF7qmnZQagf+O7XV59x1QyrFnCUH7kOKapsQ9fquy0UsDwHC/mLJp+DuOx7MqeXEXJmrLV9I9KjjMjrpZa1ILZ5LAUbrxpXCGz+6I/CaKmvMlS2flHtkGap9kuTtfQoZso0z4VF/Mqvd0O5DvNWTyyd4BI8nKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756317037; c=relaxed/relaxed;
	bh=iA4OZUuACECzN8vfRikSOQbmN4McUEILvOootuFHWbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qj3mF5+P28rxFIYig4ZAxXvrSlbiZLjtDFCbWM5CFUtKxJhVEjrYdSQLkOPVSDXNPRqU443ydv3fNn/KMF33nx5MxEC7g3QC4tyOcccmUwyveCJYlIMr64NLdp48jkndQf0iXLlrGIuLW4weLqko5wQvxr1bs2ZhMhSs1ybtgil1MmqHtEkobgv7vDf6a+GpNROfIezkt84PGZaVHCl+73hmrWpt99nUfGhewAcne9cxVgXVnfL9Q3nsXp8hWQWeU0fWetAUaXoc7kT8nYRxl1h8GREQym7uHiaEFB0RlRdIoG2ri1syOTMBH6mzuIVZadF7+0Br0FQ5c0ApOvxnTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBsWc4j7Pz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cBrlQ6VXXz9sS7;
	Wed, 27 Aug 2025 19:15:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VH7Q5uEy69_B; Wed, 27 Aug 2025 19:15:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cBrlQ5CHWz9sRy;
	Wed, 27 Aug 2025 19:15:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A0458B764;
	Wed, 27 Aug 2025 19:15:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vywdVwtWOi4k; Wed, 27 Aug 2025 19:15:46 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 29C2F8B763;
	Wed, 27 Aug 2025 19:15:46 +0200 (CEST)
Message-ID: <3236e24d-4800-44e1-99de-4e8d0d204daa@csgroup.eu>
Date: Wed, 27 Aug 2025 19:15:45 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
To: Mathieu Malaterre <malat@debian.org>
Cc: linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20190621085822.1527-1-malat@debian.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20190621085822.1527-1-malat@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 21/06/2019 à 10:58, Mathieu Malaterre a écrit :
> When building with clang-8 the frame size limit is hit:
> 
>    ../arch/powerpc/lib/xor_vmx.c:119:6: error: stack frame size of 1200 bytes in function '__xor_altivec_5' [-Werror,-Wframe-larger-than=]
> 
> Follow the same approach as commit 9c87156cce5a ("powerpc/xmon: Relax
> frame size for clang") until a proper fix is implemented upstream in
> clang and relax requirement for clang.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/563
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>

Apparently the problem is gone with recent versions of clang, frame size 
is 16.

000001b0 <__xor_altivec_5>:
  1b0:	94 21 ff f0 	stwu    r1,-16(r1)
  1b4:	93 c1 00 08 	stw     r30,8(r1)
  1b8:	54 63 d1 be 	srwi    r3,r3,6
  1bc:	39 20 00 00 	li      r9,0
  1c0:	39 40 00 10 	li      r10,16
  1c4:	39 60 00 20 	li      r11,32
  1c8:	7c 69 03 a6 	mtctr   r3
  1cc:	38 60 00 30 	li      r3,48
  1d0:	7c 44 48 ce 	lvx     v2,r4,r9
  1d4:	7d 84 4a 14 	add     r12,r4,r9
  1d8:	7c 65 48 ce 	lvx     v3,r5,r9
  1dc:	7f c5 4a 14 	add     r30,r5,r9
  1e0:	7c 86 48 ce 	lvx     v4,r6,r9
  1e4:	7c a7 48 ce 	lvx     v5,r7,r9
  1e8:	10 43 14 c4 	vxor    v2,v3,v2
  1ec:	7c 2c 50 ce 	lvx     v1,r12,r10
  1f0:	10 42 24 c4 	vxor    v2,v2,v4
  1f4:	7d 1e 50 ce 	lvx     v8,r30,r10
  1f8:	10 42 2c c4 	vxor    v2,v2,v5
  1fc:	7d 3e 58 ce 	lvx     v9,r30,r11
  200:	7d 5e 18 ce 	lvx     v10,r30,r3
  204:	7f c6 4a 14 	add     r30,r6,r9
  208:	7c 08 48 ce 	lvx     v0,r8,r9
  20c:	10 68 0c c4 	vxor    v3,v8,v1
  210:	7c cc 58 ce 	lvx     v6,r12,r11
  214:	7c ec 18 ce 	lvx     v7,r12,r3
  218:	10 42 04 c4 	vxor    v2,v2,v0
  21c:	7d 7e 50 ce 	lvx     v11,r30,r10
  220:	10 29 34 c4 	vxor    v1,v9,v6
  224:	7d 9e 58 ce 	lvx     v12,r30,r11
  228:	10 aa 3c c4 	vxor    v5,v10,v7
  22c:	7d be 18 ce 	lvx     v13,r30,r3
  230:	7f c7 4a 14 	add     r30,r7,r9
  234:	7d de 50 ce 	lvx     v14,r30,r10
  238:	10 63 5c c4 	vxor    v3,v3,v11
  23c:	10 21 64 c4 	vxor    v1,v1,v12
  240:	7d fe 58 ce 	lvx     v15,r30,r11
  244:	7e 1e 18 ce 	lvx     v16,r30,r3
  248:	7f c8 4a 14 	add     r30,r8,r9
  24c:	7e 3e 50 ce 	lvx     v17,r30,r10
  250:	10 63 74 c4 	vxor    v3,v3,v14
  254:	7e 5e 58 ce 	lvx     v18,r30,r11
  258:	7c 9e 18 ce 	lvx     v4,r30,r3
  25c:	10 63 8c c4 	vxor    v3,v3,v17
  260:	7c 44 49 ce 	stvx    v2,r4,r9
  264:	10 45 6c c4 	vxor    v2,v5,v13
  268:	10 a1 7c c4 	vxor    v5,v1,v15
  26c:	39 29 00 40 	addi    r9,r9,64
  270:	10 42 84 c4 	vxor    v2,v2,v16
  274:	7c 6c 51 ce 	stvx    v3,r12,r10
  278:	10 65 94 c4 	vxor    v3,v5,v18
  27c:	10 42 24 c4 	vxor    v2,v2,v4
  280:	7c 6c 59 ce 	stvx    v3,r12,r11
  284:	7c 4c 19 ce 	stvx    v2,r12,r3
  288:	42 00 ff 48 	bdnz    1d0 <__xor_altivec_5+0x20>
  28c:	83 c1 00 08 	lwz     r30,8(r1)
  290:	38 21 00 10 	addi    r1,r1,16
  294:	4e 80 00 20 	blr

Christophe

> ---
>   arch/powerpc/lib/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index c55f9c27bf79..b3f7d64caaf0 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -58,5 +58,9 @@ obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
>   
>   obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
>   CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
> +ifdef CONFIG_CC_IS_CLANG
> +# See https://github.com/ClangBuiltLinux/linux/issues/563
> +CFLAGS_xor_vmx.o += -Wframe-larger-than=4096
> +endif
>   
>   obj-$(CONFIG_PPC64) += $(obj64-y)


