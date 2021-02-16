Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADF31C66C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 06:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dfqpd1XPSz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 16:51:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=UKi9cKVT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=UKi9cKVT; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfqpB6BBPz30H5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 16:50:55 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id 189so5496521pfy.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 21:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=L20tLHb0cR8fWG8MPX2utwLyUyRJcSh0clErwGsHLTs=;
 b=UKi9cKVTXB5q0ZI0OjpLHqj4tKjYtJjyygKVw33wzYt4YoHHU9FqxVktMGHgFerOph
 6Hugchw31oiOm5F8f3aR3ZyGi/bT/2/sY588zk5A/CXdSIruzmmX12FYDasSa+ZykrSR
 BB9W9iJWUud9TdRhHv8cBTK57CcQxr5jb4xtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=L20tLHb0cR8fWG8MPX2utwLyUyRJcSh0clErwGsHLTs=;
 b=dGg92imQecmxvG4oHpyLvde55aJ1WdkWGRIhPxcI9OPtzXfOPyzSeyI4zztYqCgO/W
 eGs0HPlFzEaH+eBlN+ZTggIRq3y9yFqJOOwKmdRh3gFEmUO/9lpZ1+xj5oAW45CnhgD3
 C5+EhUJMpCp1rckOC6lAEu/dpmnHgEAaM75xeKbLoeJCq3SoQtbWCGdY8YJBmJbSfEuN
 uQtv2PLb/NBaRwsOioCqMWezSuHHjSTcOD8xxy/vY1qcyLKHe/iA1sz6XG46GZHsmBDA
 M+zEQs7eDDGo3mpZZmCTT/6XO/UW3wxZS+NVoqX3L4pM/MUPk8oNlpTvdUfdXn1z7wDK
 tZMQ==
X-Gm-Message-State: AOAM533lavsI86/dG2DiL/lEFAGWh/luEKgpXK/LG9Me/w+JreGAL5uu
 SCplSK6BULQHeZfh/Ynm6bxccaXw5j4+62Gl
X-Google-Smtp-Source: ABdhPJyRVZeTr9E0QcV+4De9d/fDQJB62LLpajIrH0qLZ+sI/5M+lSEUTOE82QXCgRcCL8ueW+1HNA==
X-Received: by 2002:a63:d710:: with SMTP id d16mr10850488pgg.123.1613454652794; 
 Mon, 15 Feb 2021 21:50:52 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id s184sm20441525pfs.112.2021.02.15.21.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 21:50:52 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] powerpc/64s: Use htab_convert_pte_flags() in
 hash__mark_rodata_ro()
In-Reply-To: <20210211135130.3474832-3-mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-3-mpe@ellerman.id.au>
Date: Tue, 16 Feb 2021 16:50:49 +1100
Message-ID: <87r1lga7d2.fsf@linkitivity.dja.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

> In hash__mark_rodata_ro() we pass the raw PP_RXXX value to
> hash__change_memory_range(). That has the effect of setting the key to
> zero, because PP_RXXX contains no key value.
>
> Fix it by using htab_convert_pte_flags(), which knows how to convert a
> pgprot into a pp value, including the key.

So far as I can tell by chasing the definitions around, this appears
to do what it claims to do.

So, for what it's worth:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash translation")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/book3s64/hash_pgtable.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
> index 567e0c6b3978..03819c259f0a 100644
> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> @@ -428,12 +428,14 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
>  
>  void hash__mark_rodata_ro(void)
>  {
> -	unsigned long start, end;
> +	unsigned long start, end, pp;
>  
>  	start = (unsigned long)_stext;
>  	end = (unsigned long)__init_begin;
>  
> -	WARN_ON(!hash__change_memory_range(start, end, PP_RXXX));
> +	pp = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL_ROX), HPTE_USE_KERNEL_KEY);
> +
> +	WARN_ON(!hash__change_memory_range(start, end, pp));
>  }
>  
>  void hash__mark_initmem_nx(void)
> -- 
> 2.25.1
