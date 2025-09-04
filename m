Return-Path: <linuxppc-dev+bounces-11700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361EFB433AC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 09:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHW9q00TMz2yrZ;
	Thu,  4 Sep 2025 17:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756970478;
	cv=none; b=kWNZz+S4qaPkpqVQgc7h2T7t+3KiidIB+5YRL/roBYJgtY6SvjgWCI6QHvaZJoXKb+mdVDRpVn3u6yLixElYj2hYtidvJQ1A7LND5GtpL2zEgl9Lq157lClBn8sMPaSImx0sHgNtstTqY6TDOqITUVBBMrRtnDdcEjmSZ+kXzUvOzmlwuwnY4neDtzOnNj3C+lMNXjwrOHLyCowAWdSu0ls/Cyj7Z88M0uDKDd7TzK4vtM5HUwoZlpRKAWP8ebldKZGBmeYEjzHUhM7hRgAfMUUvcjU+fx1N40OymgKIEsSo2J/fa8WcgL1EByU+pDaO6t3E2Dgap8E32jLwjLY0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756970478; c=relaxed/relaxed;
	bh=28HQS0dhxfb3EtDkhwzavnP+Qfq1q2LO7iNoRzqKpY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxLRUxZdh22Scf321+v8hAZiqdaqE3iRtbUxgGIpQjRtmaO9hnuzchJ/VooLaJVzWaycKW+KSE7//7hkYiP232f2EnoO/uMtWEAr1cx+bhPP6mEZYbZbAYk3JQQ1cO1hBpUkPLn9w75ZGWQgMnnIeGA7HVP49WmDFbdBgpOMIigG5xj2rHiANW/A5QD7tQyCrANVwMv9oadp1F+OkVM+IYEC/kTZv/hEQvIXIkbJfhsW0TgKKjyHNfaqPnn8MC+Txdq8iLYOT2yZ8D6YKusR0GdGK19EZ9NxwFlXkAjXhgFELCU0ufJIsxpSaLbx0F/S1r//MEPBeLr1hSgbFSuWvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHW9n47D4z2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 17:21:15 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHVwp4xsdz9sVh;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEv7Y2YJZkgd; Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHVwp4BWrz9sVk;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 784388B764;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JZAEJLwTYdG3; Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 23FBF8B763;
	Thu,  4 Sep 2025 09:10:02 +0200 (CEST)
Message-ID: <3b333f4e-9817-4a5b-bf0a-f8a9d33575e9@csgroup.eu>
Date: Thu, 4 Sep 2025 09:10:01 +0200
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
Subject: Re: [PATCH v3 5/7] powerpc: Stop calling page_address() in
 free_pages()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-6-vishal.moola@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250903185921.1785167-6-vishal.moola@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 03/09/2025 à 20:59, Vishal Moola (Oracle) a écrit :
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index be523e5fe9c5..73977dbabcf2 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -780,7 +780,7 @@ static void __meminit free_vmemmap_pages(struct page *page,
>   		while (nr_pages--)
>   			free_reserved_page(page++);
>   	} else
> -		free_pages((unsigned long)page_address(page), order);
> +		__free_pages(page, order);
>   }
>   
>   static void __meminit remove_pte_table(pte_t *pte_start, unsigned long addr,


