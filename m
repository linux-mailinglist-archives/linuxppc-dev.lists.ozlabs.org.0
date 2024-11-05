Return-Path: <linuxppc-dev+bounces-2871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8B9BC9B3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 10:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjNz51Tgwz2xs0;
	Tue,  5 Nov 2024 20:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730800609;
	cv=none; b=C8v9DiNuBBF4YoJEbxfle7rL/nVdCFBhvM6jThd83D0GhMyHgKArAyCPRRcWV9nuHDmB/+egmUPa7RcrRMaV7YsIqiMKdxCrMZlnRUsAv9Ts/CXKcgF0PW0AbiTEzU/WS3h5S8YWjzdOCgD43y5sFIxrmww6mAa8qbKeJWlO1HVBBmA3a2q4S3GT4lIfF7rENRcp2A+9T7WFQ1vtqaPn+2xIiVTgOODcp5M4hVj6dXJdCy7hbza4+S5QeLFiKzpntzvctaXzbJ9X1GyzBRBI+Cb5y/k53jn7mbq0lCp0QYLdtyPuchPGNzHl6LbexbGWyPC3Q9/YKsbD/l6W04dNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730800609; c=relaxed/relaxed;
	bh=5FQqNCLOKvW9glyiLM/dzYJq3UH5mFHYuAMx5Xe+JRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y89J8jSmBZJaKuYigwIhm5NzA6AQ4ZGOCHXkbpfnG7BmPhCzoB3Y0tJZIGaUzClj7G3LqK5qJYxr8T3gstaCmqkbStQ5B1OKZEBXKX3h9KIeLm6EQ1Qxy6T/SZYKU1FAehgmm70735OxZeR8x7LPbcWIKyMECGcildtfxX4RUsGh8XS9UYU343jFqvUIeL+0pRqUAz8J+abVMaTt5Cr9chDEXzhg5ccl/MuRPAafxSJ4fI9CsmcTXS0a58UGHTnbvdwyMpFCKQdws2INT9VCPFgGP6lEootJ9r8MAoRvPiWxQ1caRHQb36DAuHER8bd4JLFOqkKmAFxo0oVBcjfx9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjNz40L4Cz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 20:56:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XjNyz319Qz9sPd;
	Tue,  5 Nov 2024 10:56:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpEO93zW8bQ7; Tue,  5 Nov 2024 10:56:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XjNyz27jdz9rvV;
	Tue,  5 Nov 2024 10:56:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 346688B770;
	Tue,  5 Nov 2024 10:56:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BXNslob-hZDZ; Tue,  5 Nov 2024 10:56:43 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E0918B763;
	Tue,  5 Nov 2024 10:56:42 +0100 (CET)
Message-ID: <9ee9c21b-179f-49aa-8c65-304c8ef2c9a7@csgroup.eu>
Date: Tue, 5 Nov 2024 10:56:42 +0100
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
Subject: Re: [PATCH 2/2] asm-generic: add an optional pfn_valid check to
 page_to_phys
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org
References: <20241023053644.311692-1-hch@lst.de>
 <20241023053644.311692-3-hch@lst.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241023053644.311692-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.5 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 23/10/2024 à 07:36, Christoph Hellwig a écrit :
> page_to_pfn is usually implemented by pointer arithmetics on the memory
> map, which means that bogus input can lead to even more bogus output.
> 
> Powerpc had a pfn_valid check on the intermediate pfn in the page_to_phys
> implementation when CONFIG_DEBUG_VIRTUAL is defined, which seems
> generally useful, so add that to the generic version.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   include/asm-generic/memory_model.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a73a140cbecd..6d1fb6162ac1 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -64,7 +64,17 @@ static inline int pfn_valid(unsigned long pfn)
>   #define page_to_pfn __page_to_pfn
>   #define pfn_to_page __pfn_to_page
>   
> +#ifdef CONFIG_DEBUG_VIRTUAL
> +#define page_to_phys(page)						\
> +({									\
> +	unsigned long __pfn = page_to_pfn(page);			\
> +									\
> +	WARN_ON_ONCE(!pfn_valid(__pfn));				\

On powerpc I think it was a WARN_ON().

Will a WARN_ON_ONCE() be enough ?

> +	PFN_PHYS(__pfn);						\
> +})
> +#else
>   #define page_to_phys(page)	PFN_PHYS(page_to_pfn(page))
> +#endif /* CONFIG_DEBUG_VIRTUAL */
>   #define phys_to_page(phys)	pfn_to_page(PHYS_PFN(phys))
>   
>   #endif /* __ASSEMBLY__ */

