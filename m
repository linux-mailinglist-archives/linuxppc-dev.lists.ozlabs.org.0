Return-Path: <linuxppc-dev+bounces-2901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204359BE163
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 09:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjzZg4vz2z2ym2;
	Wed,  6 Nov 2024 19:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730883371;
	cv=none; b=epXq0JasNyuijf5K0Azf0/3UZoJGPG99RuQLuJy69dVneJYBw7xCh83fBG0dCrg3oLJuUQSlFI4tRHbHhHzL9iEjys5OV0UMlQQthIjXU+BlvNM93HwVzoUyCRC+exYElSKwWNLpAVPVT4XVGXgael/kqmXvgEJv4mchOk1pJK6Tw1EZZS20IChnccz7QdC0oNpS1wqyIjjXZ9tOmlG3bTR2u2b3dtDbqxDqT1iC46sLKVvlYPNmba3NiBEtkNP11OT/AKMtaokyxdr/pZ0ZK9Y2z30M3XW32GcXm3JHzP/VNUzQsR0gRCLvs4c9GR1Z6Bb71K147Hj3FEVOtgXotw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730883371; c=relaxed/relaxed;
	bh=8xg97IHAsg0qc0dCYyV1yhFIn1COfR1Dj3eu5cFRguE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhWvbBJE6wjOHGDjeUv6EaWugt99LvcXYRihHxl9Q+WMg4i3zJL4Prubp9eSSiq8eF3UPoZSbPwu3h4ZTFMgmz522uk210IP23F+ef1DsApIke0ipussB9Yg98lm1nHsJ3kNg8ssVSdFsMBCWmzTCqxmmz2dMDdV2XFvawIPWRvAj5l/R3NkQCacsB65BV19KWEkJm1OsjA95Arq5lcGaUff5Ha6qygNnvTs6/dQTrl3C7Q4C0ZJaIbcVavWZ+aJX6QOD5NsVyJY8Ex5w/O4ye+LwPj1AjknbJXR4dNZe+df/+/C0n1c4d2TsmxrsLeAymyi7hrf3eNuRzOCIxWTIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjzZZ50yHz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 19:56:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XjzZR0Ldwz9sRr;
	Wed,  6 Nov 2024 09:55:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HmlH4RdKwyO; Wed,  6 Nov 2024 09:55:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XjzZQ6gnwz9sRk;
	Wed,  6 Nov 2024 09:55:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D44F78B77B;
	Wed,  6 Nov 2024 09:55:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oCC65t6-tMXu; Wed,  6 Nov 2024 09:55:58 +0100 (CET)
Received: from [192.168.232.93] (unknown [192.168.232.93])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B3A5C8B77A;
	Wed,  6 Nov 2024 09:55:58 +0100 (CET)
Message-ID: <884cf694-09c7-4082-a6b1-6de987025bf8@csgroup.eu>
Date: Wed, 6 Nov 2024 09:55:58 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: Drop -mstack-protector-guard flags in
 32-bit files with clang
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, stable@vger.kernel.org
References: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 30/10/2024 à 19:41, Nathan Chancellor a écrit :
> Under certain conditions, the 64-bit '-mstack-protector-guard' flags may
> end up in the 32-bit vDSO flags, resulting in build failures due to the
> structure of clang's argument parsing of the stack protector options,
> which validates the arguments of the stack protector guard flags
> unconditionally in the frontend, choking on the 64-bit values when
> targeting 32-bit:
> 
>    clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', expected one of: r2
>    clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', expected one of: r2
>    make[3]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
>    make[3]: *** [arch/powerpc/kernel/vdso/Makefile:87: arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
> 
> Remove these flags by adding them to the CC32FLAGSREMOVE variable, which
> already handles situations similar to this. Additionally, reformat and
> align a comment better for the expanding CONFIG_CC_IS_CLANG block.

Is the problem really exclusively for 32-bit VDSO on 64-bit kernel ?
In any case, it is just wrong to have anything related to stack 
protection in VDSO, for this reason we have the following in Makefile:

ccflags-y += $(call cc-option, -fno-stack-protector)

If it is not enough, should we have more complete ?

Christophe

