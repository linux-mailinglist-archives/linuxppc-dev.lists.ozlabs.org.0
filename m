Return-Path: <linuxppc-dev+bounces-2626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80A9B2397
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 04:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcK6111Jxz2xrv;
	Mon, 28 Oct 2024 14:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730087113;
	cv=none; b=oO1e43AV5EpHrQpGhwuc2D1cGYf5SeApFUxsS7L3kfZZUCwFV1Q3hmEVTeB+ukHZxpadfcoAXiWB/Q3GTpalOF9OPB/vdFiojRlbeMYxs02EURNeTufH79iSkxq1K51M+sSn7fsLWFMOW19URaX3yZPm3OdwM2J98K2l6ObDZRVuMlU0NHKps/mf8vyk5/4ezcy3Nj2ocznxh6UuakOTWblQ/mexPklq2t0qNFmV3uL+6j3Up3DwzHbo5rj3ZfqCn1K1+MQtF4m8Q8ufs26CCVB6lJsQ964s47FFxTarBA/JP+k+I8pyRlHcDy9XdGTcOsb1fIfehaXFp3aKyTxi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730087113; c=relaxed/relaxed;
	bh=SBe5aS+44FsgeWkrDDWZbGKgu33QWTjE5Z3OiByZNqA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=YP2ATcx68rkRB5uERLFbdoZ5bTvrGQSNF+59fWBL4wGNtrSOqATLLPzdWtpis/GwLt18apDII2zlO7UfeY7aK4+fQW27GHBOUa44ymFdQHnVNNmMgeD+ZiUXp6yDE+1boDEAY0p0VYIvhQ7STpzAlf7noBoMjgVs5oCJUT3hfP0RZLK2PD62WbR8CMe4BPI0n3gw3DVMsns8nHkUKVOa8APlmD8tSiqM20HfFgvbINDirvZTo/djxCTih3cZMuoklozHMtxP7CUqR9W5L0C2VGekFS/SmI1ypvDOdI58Z5eNjRZlyAVI+z2RvHfoO00l/JK6luYpD8pCC5Sk4OXiyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IXzovQrc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IXzovQrc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcK5z6QLRz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 14:45:09 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso3216175b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 20:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087107; x=1730691907; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SBe5aS+44FsgeWkrDDWZbGKgu33QWTjE5Z3OiByZNqA=;
        b=IXzovQrckwAQlazniwszRxocXtgHq7P9TjyONeA76UIN4BG+j5f28qstWT70E5h2OY
         w4Q59bCa3TZXvk5C7nIUEz3tvnQpsUySqb1Zj4hpkUwbj/9r553qbXxEEBJWhDNJB86k
         wuskK7fwrMWkKsbW/nDDVxtSI36Q/JhhElWL9ovfT9vh69DU7je1TLB9hm36c+GCS0z+
         PIB1oIIvHJ9lG6VSETQxUXfAwG3Lpi70b7jC9wEIlvm8br7FdLAeJSVYpxf1jiuC3OGo
         f+cFNz0I36o33UhUkc+sPMmkGGHYROsrYg2Mk0fzgFpFhRHTuQvutX11JgQyTM2SZAai
         Wuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087107; x=1730691907;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBe5aS+44FsgeWkrDDWZbGKgu33QWTjE5Z3OiByZNqA=;
        b=YWFxsY3nZgpixJkPPmQAt5OlyOl2zmaZowX5EXDoK/RWITn5pLrTlvKs35CAh0yTy2
         M0d9QnpdGY0JzpKUblNereB+BNBuZSR4S9b+9aZQUs7Jv2iss69B2xqCXMxEbBdbvcqu
         qu2gUtdhEA0IRiGEQcDbkh2PHYhUyUKllE8DgXebnL0qo7QWLTYgVLmgE0t8xFM8/Ktz
         p4dMwCisguKAicigA+R882YIgiTQPxoxTJleM+/lP3Svf+HYnhAQxR0kc/kVkmGYSQV/
         xfcD9sRzM9Z1D70BueyiXGvlP9hOIyLa3/x6M3FXh057H+WqXN/83pqbrkPXA+TDi0i4
         Y9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCX2WQHJ2EsmMFKCZA3Hh+Tn3cC9lR5Ani08uwNf9laMKo8rWOKTVaKyhr/2xigxGehH7baUDQENkW2sMKw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxk5S0AcTf5MvZHwkPUSM6Wtb3VN1ab5+33rgpGEWFxJ9oA4qZ7
	h1QVG69jCvaLPUZA6qUArZSX6eCrKKpd0max8mfEhmTHjoU+qgpK
X-Google-Smtp-Source: AGHT+IHikqwwIGdrqzMja/5LLlC97wlhEbRkjlCYndUFINes0Clw7nkOmZY01tjIWb/SSvH3GnTqVw==
X-Received: by 2002:a05:6a00:1a88:b0:71e:4dc5:259a with SMTP id d2e1a72fcca58-72062fb3c72mr9690869b3a.7.1730087106916;
        Sun, 27 Oct 2024 20:45:06 -0700 (PDT)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e468sm4768150b3a.21.2024.10.27.20.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:45:06 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Use str_enabled_disabled() helper function
In-Reply-To: <20241027222219.1173-2-thorsten.blum@linux.dev>
Date: Mon, 28 Oct 2024 09:10:03 +0530
Message-ID: <87h68wnbe4.fsf@gmail.com>
References: <20241027222219.1173-2-thorsten.blum@linux.dev>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Thorsten Blum <thorsten.blum@linux.dev> writes:

> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
>

Looks like now a days LKP also reports this - e.g. [1] "opportunity for str_enabled_disabled(enable)" 

[1]: https://lore.kernel.org/all/202410071601.TFpXoqgW-lkp@intel.com/

I see more such oppotunities for later improvements in arch/powerpc/
root-> git grep "\"enabled\" : \"disabled\"" arch/powerpc/
arch/powerpc/kernel/secure_boot.c:      pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
arch/powerpc/kernel/secure_boot.c:      pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
arch/powerpc/platforms/powermac/setup.c:                                        "enabled" : "disabled");
arch/powerpc/sysdev/mpic.c:             flags & HT_MSI_FLAGS_ENABLE ? "enabled" : "disabled", addr);

> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/powerpc/kernel/secure_boot.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

For this patch it looks good to me. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
> index 9e0efb657f39..3a28795b4ed8 100644
> --- a/arch/powerpc/kernel/secure_boot.c
> +++ b/arch/powerpc/kernel/secure_boot.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/types.h>
>  #include <linux/of.h>
> +#include <linux/string_choices.h>
>  #include <asm/secure_boot.h>
>  
>  static struct device_node *get_ppc_fw_sb_node(void)
> @@ -38,7 +39,7 @@ bool is_ppc_secureboot_enabled(void)
>  	of_node_put(node);
>  
>  out:
> -	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
> +	pr_info("Secure boot mode %s\n", str_enabled_disabled(enabled));
>  
>  	return enabled;
>  }
> @@ -62,7 +63,7 @@ bool is_ppc_trustedboot_enabled(void)
>  	of_node_put(node);
>  
>  out:
> -	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
> +	pr_info("Trusted boot mode %s\n", str_enabled_disabled(enabled));
>  
>  	return enabled;
>  }
> -- 
> 2.47.0

