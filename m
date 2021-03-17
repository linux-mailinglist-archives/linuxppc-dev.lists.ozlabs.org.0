Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB95733E769
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 04:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0ZlX6LCzz3brX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 14:05:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=gB8Ihhzu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=gB8Ihhzu; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Zl13tXkz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 14:04:42 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id p21so23920477pgl.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 20:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ArISpaVR5NftLHA/UO2Rb3+d6mO7ozCvgCFkvz0VkaU=;
 b=gB8IhhzuEXE0MWZPR8gGgSnLLxT40ijvLPcJjobBxTOh7v+wqAn/EtahpgVWj8EAMl
 6cHsC/CpO9ttpUNdFm9uD7SudafgtprFotv94lVisWfSWYWv29hWuFCfRWkCLnp/UQGI
 GH7Awg0PrkcshDKjiJUutXKgvjDFHHHfMOyho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ArISpaVR5NftLHA/UO2Rb3+d6mO7ozCvgCFkvz0VkaU=;
 b=Lqh4F0QmQZmmPNIqgGhD8QQxSh7m4dSljvEMKy8FOGZolxymKobT3FK7w09Yn2W1i+
 b2OAVfKGd/x9kGo/eQU7sl2GuUilp+Wmt6wZy0ZyxV7k6FocrY69hKNyQdkYVkKaHmkJ
 wZK8S170O0DYbL2tcgVQzP8gP9iAQJFqLrPMlt9DrJEytDgbG44Eh5dll775IhnBwxGB
 ow9FbWEfXNgBRJ2AzWEzYCF7+ZpzYiN/lNAMrVLYhBW+wNJbWE0cD9WYlG/wcJ671dA2
 45lzsgHi8f1fRceGGyXuP582fpzsgSuzuLavOk17t9oPnnx4WEw0z/Y8d02vgOTbhkJa
 nrIQ==
X-Gm-Message-State: AOAM530Z+4j9XJZxLuBtZL1y1QznhLPtOkfvJ8mUUiUGUFqmWUEm0MVM
 PYgSWGtZTkEdviwolvZZ0c+X3A==
X-Google-Smtp-Source: ABdhPJwY1VwCaeicuUaF81DtyNHoytPnwg1ChKYNRaLZMBOfmfRGpwZrDQOfSYMT+wziMZUympMZGg==
X-Received: by 2002:a65:4508:: with SMTP id n8mr745832pgq.294.1615950277599;
 Tue, 16 Mar 2021 20:04:37 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-b14c-f6f0-24fb-9b97.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b14c:f6f0:24fb:9b97])
 by smtp.gmail.com with ESMTPSA id z27sm16670536pff.111.2021.03.16.20.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 20:04:37 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: He Ying <heying24@huawei.com>, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, npiggin@gmail.com, akpm@linux-foundation.org,
 aneesh.kumar@linux.ibm.com, rppt@kernel.org, ardb@kernel.org, clg@kaod.org,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
In-Reply-To: <20210316041148.29694-1-heying24@huawei.com>
References: <20210316041148.29694-1-heying24@huawei.com>
Date: Wed, 17 Mar 2021 14:04:33 +1100
Message-ID: <87wnu6bhvi.fsf@dja-thinkpad.axtens.net>
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi He Ying,

Thank you for this patch.

I'm not sure what the precise rules for Fixes are, but I wonder if this
should have:

Fixes: 9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")
Fixes: f79643787e0a ("powerpc/64s: flush L1D on kernel entry")

Those are the commits that added the entry_flush and uaccess_flush
symbols. Perhaps one for rfi_flush too but I'm not sure what commit
introduced that.

Kind regards,
Daniel

> warning: symbol 'rfi_flush' was not declared.
> warning: symbol 'entry_flush' was not declared.
> warning: symbol 'uaccess_flush' was not declared.
> We found warnings above in arch/powerpc/kernel/setup_64.c by using
> sparse tool.
>
> Define 'entry_flush' and 'uaccess_flush' as static because they are not
> referenced outside the file. Include asm/security_features.h in which
> 'rfi_flush' is declared.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 560ed8b975e7..f92d72a7e7ce 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -68,6 +68,7 @@
>  #include <asm/early_ioremap.h>
>  #include <asm/pgalloc.h>
>  #include <asm/asm-prototypes.h>
> +#include <asm/security_features.h>
>  
>  #include "setup.h"
>  
> @@ -949,8 +950,8 @@ static bool no_rfi_flush;
>  static bool no_entry_flush;
>  static bool no_uaccess_flush;
>  bool rfi_flush;
> -bool entry_flush;
> -bool uaccess_flush;
> +static bool entry_flush;
> +static bool uaccess_flush;
>  DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
>  EXPORT_SYMBOL(uaccess_flush_key);
>  
> -- 
> 2.17.1
