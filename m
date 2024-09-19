Return-Path: <linuxppc-dev+bounces-1453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B7C97C3D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 07:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8P3c04s8z2yDm;
	Thu, 19 Sep 2024 15:20:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726723211;
	cv=none; b=ZlaefrXoLD+rnJUHcemyf2H1veEgjtVD4rgzbEI6wBn/vi5zyVJ9WKnte5Rng9/snVjCoWjPeiz4iYmemGl5dggOz9Ur0CTWIwamWe3x3kaoGF55rcwas555O20s5DF1JWtMUSpjy3K16+l5TrDR4BiB5qFFRe9iJn5MRIClb47McBFS14+Rj1RBA1LvwY41/D28Iaptd+J1vrsN1siT9sbVji462K0cp0AstLB5p2rFwZVjJ/vcL7BLwSMBxQMqW7/iUf36IzwkiDDMnJO8XjxFOBgUXctJMnDW1gs8InyUiieIXv6EE5qKHrEZ+VIqYimNQChXBra/8aFmqMTDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726723211; c=relaxed/relaxed;
	bh=eeb7w/1v4Ofhr7/e1H9bOmNGtnsKRSsPsVLtf50K0i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVdtcMdfKH1sKGH01gyxqiAHm7kxI5vY9pMlwfe5bpHXqycEZ8AFn1jX1QeBnM766IvrdTIr0699vdM5JuJFxscDwPgmjJrz20tOQiJf0rJjEA2W7SgPBQ4ld0tq/BUx3+SqXNTF7Ta2F1x2BzUVY68cd3W48C1385kGVTu0lKPIfEwW/K3G5tJhnXm7OKUGKCPeJXVnDj0YX/GhUoh09hxRX9KZEM+5OfPQHBTKMB7/v1/KbcSD4OnOl4H9vm5tw66IzVVYwMXD6JEzQAP4NOHk6hptOXEglRdtMsHMnawBz6uv+bGG3bauityXu0j5hfROcTr3RVgTt+4uElyeEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8P3b4wbnz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 15:20:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X8P3W2mtpz9tNv;
	Thu, 19 Sep 2024 07:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxoTRCMwyPDK; Thu, 19 Sep 2024 07:20:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X8P3W1rdTz9tCB;
	Thu, 19 Sep 2024 07:20:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CD878B775;
	Thu, 19 Sep 2024 07:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FP2B8C9gMap0; Thu, 19 Sep 2024 07:20:07 +0200 (CEST)
Received: from [192.168.234.38] (unknown [192.168.234.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9794F8B763;
	Thu, 19 Sep 2024 07:20:06 +0200 (CEST)
Message-ID: <d9d8703a-df24-47e3-bd0d-2ff5a6eae184@csgroup.eu>
Date: Thu, 19 Sep 2024 07:20:04 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/13] book3s64/hash: Remove kfence support temporarily
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
 Nirjhar Roy <nirjhar@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
References: <cover.1726571179.git.ritesh.list@gmail.com>
 <5f6809f3881d5929eedc33deac4847bf41a063b9.1726571179.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5f6809f3881d5929eedc33deac4847bf41a063b9.1726571179.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/09/2024 à 04:56, Ritesh Harjani (IBM) a écrit :
> Kfence on book3s Hash on pseries is anyways broken. It fails to boot
> due to RMA size limitation. That is because, kfence with Hash uses
> debug_pagealloc infrastructure. debug_pagealloc allocates linear map
> for entire dram size instead of just kfence relevant objects.
> This means for 16TB of DRAM it will require (16TB >> PAGE_SHIFT)
> which is 256MB which is half of RMA region on P8.
> crash kernel reserves 256MB and we also need 2048 * 16KB * 3 for
> emergency stack and some more for paca allocations.
> That means there is not enough memory for reserving the full linear map
> in the RMA region, if the DRAM size is too big (>=16TB)
> (The issue is seen above 8TB with crash kernel 256 MB reservation).
> 
> Now Kfence does not require linear memory map for entire DRAM.
> It only needs for kfence objects. So this patch temporarily removes the
> kfence functionality since debug_pagealloc code needs some refactoring.
> We will bring in kfence on Hash support in later patches.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/include/asm/kfence.h     |  5 +++++
>   arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++++++-----
>   2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index fab124ada1c7..f3a9476a71b3 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -10,6 +10,7 @@
>   
>   #include <linux/mm.h>
>   #include <asm/pgtable.h>
> +#include <asm/mmu.h>
>   
>   #ifdef CONFIG_PPC64_ELF_ABI_V1
>   #define ARCH_FUNC_PREFIX "."
> @@ -25,6 +26,10 @@ static inline void disable_kfence(void)
>   
>   static inline bool arch_kfence_init_pool(void)
>   {
> +#ifdef CONFIG_PPC64
> +	if (!radix_enabled())

No need for a #ifdef here, you can just do:

	if (IS_ENABLED(CONFIG_PPC64) && !radix_enabled())
		return false;


> +		return false;
> +#endif
>   	return !kfence_disabled;

But why not just set kfence_disabled to true by calling disable_kfence() 
from one of the powerpc init functions ?

>   }
>   #endif

