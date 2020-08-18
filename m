Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73261248F06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:48:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWM0r3xXkzDqpq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FB2IyJSY; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLwQ2jVyzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:44:53 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bh1so9692941plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i1d+U+ecDxUFOWl6onxWX2qBK/sZMPkIFOLpUTyn6uQ=;
 b=FB2IyJSYdn0VUofa7i8Z80/FH61STbjzPiTrV7pXJ9/PanWHP8N2HBymNiDeDrDJZv
 +bo27DTYRBIRVYJdtoXyyWfeS36z89yBxiuaIdCQyk9PY/jIhvuLnozoYsLcv/l7l7+3
 H8tWRysm6mi5Tfast76wQOHwKrqDkZ0EWMgMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i1d+U+ecDxUFOWl6onxWX2qBK/sZMPkIFOLpUTyn6uQ=;
 b=Y3EP8pze2R8tmfr5i6vBtEadpmPn6FzBL+OinY+Iw3MSU4GCsP1M5nyKRgxMPhjdaj
 IRa9YtlV1I12L6fd8gAovxiyKqguURk09xh/Ll+QXQR8RFN2lSd+cSTjO084zu2X4H5J
 nRxgoKNL/wUNeqoFttmFWXNRW7IDWmkLKCxCm2PYZyLv4yFSHkqFXxKA67iRddhYIiix
 2iTc3lwbMoqqeiYQKaNNTe2gKyBjpvpB4pRwX3WFkUJhieosIx7uf7J59YovHAA7vx2C
 i3HmI66+lHW6M7zurrKBmSUVQOWJUnrQaZgcOfW5MWmObCpiue95gTfnUo8mURV/XvFm
 07GA==
X-Gm-Message-State: AOAM532UbPzYLazhAtFZDsQxRIdLxIygNJW1oqP7xVue0N/Z8WZ6ckSG
 nRaGbM6YD9kQUdPUzrOOc5W5KKux2fSosA==
X-Google-Smtp-Source: ABdhPJy5tKx9/xkhHJM6Odv3AsGblbIMbyJc2oObFFznMoC2GzzBneeXHhCf+Coy4KEA+Rmx1fZaDw==
X-Received: by 2002:a17:90a:7488:: with SMTP id
 p8mr1244035pjk.158.1597779891291; 
 Tue, 18 Aug 2020 12:44:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b12sm22351411pga.87.2020.08.18.12.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:44:50 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:44:49 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/11] x86: make TASK_SIZE_MAX usable from assembly code
Message-ID: <202008181244.BBDA7DAB@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-9-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 09:32:09AM +0200, Christoph Hellwig wrote:
> For 64-bit the only hing missing was a strategic _AC, and for 32-bit we

typo: thing

> need to use __PAGE_OFFSET instead of PAGE_OFFSET in the TASK_SIZE
> definition to escape the explicit unsigned long cast.  This just works
> because __PAGE_OFFSET is defined using _AC itself and thus never needs
> the cast anyway.

Shouldn't this be folded into the prior patch so there's no bisection
problem?

-Kees

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/include/asm/page_32_types.h | 4 ++--
>  arch/x86/include/asm/page_64_types.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/include/asm/page_32_types.h b/arch/x86/include/asm/page_32_types.h
> index 26236925fb2c36..f462895a33e452 100644
> --- a/arch/x86/include/asm/page_32_types.h
> +++ b/arch/x86/include/asm/page_32_types.h
> @@ -44,8 +44,8 @@
>  /*
>   * User space process size: 3GB (default).
>   */
> -#define IA32_PAGE_OFFSET	PAGE_OFFSET
> -#define TASK_SIZE		PAGE_OFFSET
> +#define IA32_PAGE_OFFSET	__PAGE_OFFSET
> +#define TASK_SIZE		__PAGE_OFFSET
>  #define TASK_SIZE_LOW		TASK_SIZE
>  #define TASK_SIZE_MAX		TASK_SIZE
>  #define DEFAULT_MAP_WINDOW	TASK_SIZE
> diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
> index 996595c9897e0a..838515daf87b36 100644
> --- a/arch/x86/include/asm/page_64_types.h
> +++ b/arch/x86/include/asm/page_64_types.h
> @@ -76,7 +76,7 @@
>   *
>   * With page table isolation enabled, we map the LDT in ... [stay tuned]
>   */
> -#define TASK_SIZE_MAX	((1UL << __VIRTUAL_MASK_SHIFT) - PAGE_SIZE)
> +#define TASK_SIZE_MAX	((_AC(1,UL) << __VIRTUAL_MASK_SHIFT) - PAGE_SIZE)
>  
>  #define DEFAULT_MAP_WINDOW	((1UL << 47) - PAGE_SIZE)
>  
> -- 
> 2.28.0
> 

-- 
Kees Cook
