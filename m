Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CFD361640
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 01:29:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLwYD2dNwz3bvG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 09:29:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Fni1JOOo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Fni1JOOo; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLwXn6Xc3z30C3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 09:29:27 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso13573930pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 16:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jw2PSbrXAEN39rMTtQwepRsUrzSF/PJDp6qJKD1maOQ=;
 b=Fni1JOOo4PrUzlzK7TjMF4v5KQ8JMEB8GQFvJdoCIs85gQ7hkEMknpG3xaXPhS80Fg
 xJbRmZBxuaLCaLsDL4AVpD5/12galNW2GkHBhD13nBI/qZ+kzKtFLFCZKRtePFqUO/Re
 Zz++4+ACyGOOamm7Y7acj4xF6H4JSsTKL7jUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jw2PSbrXAEN39rMTtQwepRsUrzSF/PJDp6qJKD1maOQ=;
 b=Kz8lc7NwUwAaFCqIMwsbq5PLOMfnJgvxroExsbjNcR2YsvxkMdJNwv60VpPKrjdjxl
 RXWW5FPm3u3ryFhpr7PwuT+Diqac7EZuappWdcLhGeHh/KmuzVFo2MzdqnP2iZAxaHX4
 ml1GEjo4ZNPzBFPufKSPDinq4P3SL9xVBeKHPSfMTCKdmRqGAko4adCL5IOsny9FLxcR
 bNLdLD3wPquqCiOIJBouHPTsPcPiC6CND6hFBsOavVFA9M3qErheghOCRrEq9rYT3qxb
 ys/Bb85AaM1KksNxSPnWB0+Ewi1q1RUyefJb9o2guMJBUqqsMdKJH+DOA9RsicaEQCnS
 7E4g==
X-Gm-Message-State: AOAM533LhU+ecOrOLOO/ceVZvOF8+iBxjlHYauKDVk2hqscAEpTFNBJt
 VSZG3lfeUMAQmdPCY2eWRrL6QNly3IIcZg==
X-Google-Smtp-Source: ABdhPJxSv6iVBSeJJdGrfMFvazb0EusrLGidlTGj83XpU/NnbzX7T+WOwAI5+RKJlavNfX48j0XS8Q==
X-Received: by 2002:a17:90a:6c88:: with SMTP id
 y8mr6713418pjj.38.1618529364161; 
 Thu, 15 Apr 2021 16:29:24 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-3f8b-a64e-9a27-b872.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:3f8b:a64e:9a27:b872])
 by smtp.gmail.com with ESMTPSA id nv7sm3342006pjb.18.2021.04.15.16.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 16:29:23 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v1 4/5] mm: ptdump: Support hugepd table entries
In-Reply-To: <f41a177a0fd5a71db616e586a9ec5c51102c6656.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <f41a177a0fd5a71db616e586a9ec5c51102c6656.1618506910.git.christophe.leroy@csgroup.eu>
Date: Fri, 16 Apr 2021 09:29:20 +1000
Message-ID: <87zgxzyvn3.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> Which hugepd, page table entries can be at any level
> and can be of any size.
>
> Add support for them.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  mm/ptdump.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 61cd16afb1c8..6efdb8c15a7d 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -112,11 +112,24 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
>  {
>  	struct ptdump_state *st = walk->private;
>  	pte_t val = ptep_get(pte);
> +	unsigned long page_size = next - addr;
> +	int level;
> +
> +	if (page_size >= PGDIR_SIZE)
> +		level = 0;
> +	else if (page_size >= P4D_SIZE)
> +		level = 1;
> +	else if (page_size >= PUD_SIZE)
> +		level = 2;
> +	else if (page_size >= PMD_SIZE)
> +		level = 3;
> +	else
> +		level = 4;
>  
>  	if (st->effective_prot)
> -		st->effective_prot(st, 4, pte_val(val));
> +		st->effective_prot(st, level, pte_val(val));
>  
> -	st->note_page(st, addr, 4, pte_val(val), PAGE_SIZE);
> +	st->note_page(st, addr, level, pte_val(val), page_size);

It seems to me that passing both level and page_size is a bit redundant,
but I guess it does reduce the impact on each arch's code?

Kind regards,
Daniel

>  
>  	return 0;
>  }
> -- 
> 2.25.0
