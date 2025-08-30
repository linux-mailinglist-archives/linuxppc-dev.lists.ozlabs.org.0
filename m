Return-Path: <linuxppc-dev+bounces-11541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B81B3CA4B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 12:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDX3d3qRXz2yN2;
	Sat, 30 Aug 2025 20:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756551037;
	cv=none; b=KX2sELNEHPQspMI2m7XVQpR3sRJoneD0otn9Fzwe8lbiw4T/koFd8Ta/ALs38/h8NGFwsJ55BcR1CxFKSTHdU4MuLjRJBQXuqzzVDNA87oCIzC7PwMEYIe/a14vx59njuAEwSS319+gR8zHi8GV+/C2C89E/jL9bMr9dDk+IrWvc8YcpDhp9G56Ndh2sUdHHr4Fc6DfFlDn8EO7LJVHjbj0p7OO1LPTLbVsKPVIV/w0JFfxsn535PyOBXaUtXylnQsLa5JFpA309gqr5l4IFtYGmqU6q0ZcWY/DEqxcMQFSRpYwcZ5UhxqyqTpmExcxirPb6jLsjM/UJG+RGpiKHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756551037; c=relaxed/relaxed;
	bh=YuptrA6ZjtMoKrH9DFBQbOFnY2voOZN+B19Vgxfe6pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ydt0A2lTjZG5BY6irmt0aZRwjEbVI+K5bCZvfcQWrVfT2KZ72DitvgUxOsRqzHiPpNuCklyzXFNwMC2MMaynkJ6s5kUi0xBJXPlXVOEuRvfuf5FLxBsLLTOSmUbqlZmBDM5SboClFIxEzuGw9a3q4g4vf3BYAw2zI4zs5iV60E9ZqCCYcU/jx5EEAznUTknCLo9mYvImrQXk0IAAoMNw9IH45eCzhu1B3pVZTKtbf/n0J9o8FBlwm04NrDTbNFAlTi3/zAbhu1WFOXVjiMxAtF5SRbreor3jMC9QxFJRTNo8+lASzy8N7KZdp4Q8xnKbVj0br6gEsqOqt9g/WVszUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDX3c4Qfvz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 20:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cDQBy0n2fz9sS7;
	Sat, 30 Aug 2025 08:26:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXZkS-WuuqIS; Sat, 30 Aug 2025 08:26:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cDQBy00ZLz9sRy;
	Sat, 30 Aug 2025 08:26:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF4CC8B778;
	Sat, 30 Aug 2025 08:26:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NemkWVkBglny; Sat, 30 Aug 2025 08:26:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 770528B776;
	Sat, 30 Aug 2025 08:26:33 +0200 (CEST)
Message-ID: <824bfe0d-7a16-4b35-a0ec-565e4df3223e@csgroup.eu>
Date: Sat, 30 Aug 2025 08:26:33 +0200
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
Subject: Re: [RFC 3/8] book3s64/hash: Fix phys_addr_t printf format in
 htab_initialize()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.ibm.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
 <20a8d7bb22c45eeab5cc1b7e5a78446dc1506777.1756522067.git.ritesh.list@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20a8d7bb22c45eeab5cc1b7e5a78446dc1506777.1756522067.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/08/2025 à 05:51, Ritesh Harjani (IBM) a écrit :
> We get below errors when we try to enable debug logs in book3s64/hash_utils.c
> This patch fixes these errors related to phys_addr_t printf format.
> 
> arch/powerpc/mm/book3s64/hash_utils.c: In function ‘htab_initialize’:
> arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
>   1401 |                 DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
> arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
> cc1: all warnings being treated as errors
> make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_utils.o] Error 1
> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Donet Tom <donettom@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/mm/book3s64/hash_utils.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 1e062056cfb8..495b6da6f5d4 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1394,7 +1394,7 @@ static void __init htab_initialize(void)
>   		size = end - base;
>   		base = (unsigned long)__va(base);
> 
> -		DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
> +		DBG("creating mapping for region: %llx..%llx (prot: %lx)\n",

Use %pa

See 
https://docs.kernel.org/core-api/printk-formats.html#physical-address-types-phys-addr-t

>   		    base, size, prot);
> 
>   		if ((base + size) >= H_VMALLOC_START) {
> --
> 2.50.1
> 


