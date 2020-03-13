Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C9183FBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 04:37:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48drwh6KgLzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 14:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VvQtaK7O; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48drtk4NCdzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 14:35:22 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id i1so7908223oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 20:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o9U8lazxGRetsQy6HWnT4z3HZb84M9DeDJBZYGquUHA=;
 b=VvQtaK7OKtdcv0KRvKeMjyrYt8hlIs0Vv5qQmDthPKjy15/K2kxiDlKjmOcjnDOcIQ
 Arp38t5pkvnfhLHd011nBlk0NFRhTjgx9WlVSPdl6p2wwPQCaNY5clM9UxERmPa/GnHM
 dLjMUs2IQ8Txs3QAkJNvS42FEqhuuAubNu73Hv0+N4oldHeUTEaOF7RHPtZLKKvtjyEy
 2OTE9jMgKzSSbDsUtXn9X/WqP/121CzAZihC6t7x0V981y3uiWgVL8yxpxZL6aj4++sz
 t3hsJ6d4CstVJHV69rfRmfc7rqvF9ewNfCIscN5kVhErYC6y8s2efDkpAHNZTxZswWXK
 EG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o9U8lazxGRetsQy6HWnT4z3HZb84M9DeDJBZYGquUHA=;
 b=hqvKhpHkPMMgH7yd/f/7Ta7WwPLdO8AE32eiqvRV4SbhOFZI3ThP6Ebe27rYnAC98j
 qeeR2ooaT+Tr6/T2BY781L+4b/iBcXjNlcoHYWokcdlsXSGstR2TgSKtx45a976UTaUr
 W7j/8uAr5UINTQDPAc9C9UexVWmvbl5IC7+CjtGcqtBBoM7rqz8CZFyzZv+X/335fRjW
 e7LgUtHgkwPQLxtPS/qA5LDON7p9UVKJd7X+GAa76lqAmfeQd/Wo5DoUxbMup5fB/pIJ
 kkWZannuqDCNHzMhWm0Sz58OuU52ZRVoT91B5GFj9Va8KObAFo9MtjHDakrqhxQxG2IZ
 c+BA==
X-Gm-Message-State: ANhLgQ3WXV9A7l3o6okJz0+SdStbYKEKwBiS7U+kDOhApsBOJxjvBoHl
 I/6p37dmoZw/tZF5LaefPkQ=
X-Google-Smtp-Source: ADFU+vu7PRLfbONkr6AgNM7esPfXmysezUGwWouWPhb9//WvPJSpF00Lzuv38/ieLK4bSxa2EB769w==
X-Received: by 2002:aca:c45:: with SMTP id i5mr5037058oiy.111.1584070519356;
 Thu, 12 Mar 2020 20:35:19 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id s203sm5817558oib.8.2020.03.12.20.35.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 20:35:18 -0700 (PDT)
Date: Thu, 12 Mar 2020 20:35:17 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32: Fix missing NULL pmd check in virt_to_kpte()
Message-ID: <20200313033517.GA37606@ubuntu-m2-xlarge-x86>
References: <b1177cdfc6af74a3e277bba5d9e708c4b3315ebe.1583575707.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1177cdfc6af74a3e277bba5d9e708c4b3315ebe.1583575707.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 07, 2020 at 10:09:15AM +0000, Christophe Leroy wrote:
> Commit 2efc7c085f05 ("powerpc/32: drop get_pteptr()"),
> replaced get_pteptr() by virt_to_kpte(). But virt_to_kpte() lacks a
> NULL pmd check and returns an invalid non NULL pointer when there
> is no page table.
> 
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Fixes: 2efc7c085f05 ("powerpc/32: drop get_pteptr()")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/pgtable.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index b80bfd41828d..b1f1d5339735 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -54,7 +54,9 @@ static inline pmd_t *pmd_ptr_k(unsigned long va)
>  
>  static inline pte_t *virt_to_kpte(unsigned long vaddr)
>  {
> -	return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
> +	pmd_t *pmd = pmd_ptr_k(vaddr);
> +
> +	return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
>  }
>  #endif
>  
> -- 
> 2.25.0
> 

With QEMU 4.2.0, I can confirm this fixes the panic:

Tested-by: Nathan Chancellor <natechancellor@gmail.com>
