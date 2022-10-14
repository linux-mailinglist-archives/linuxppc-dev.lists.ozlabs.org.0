Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B0B5FE61F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpRnR1mvFz3ds4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:18:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n6XyFQbL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n6XyFQbL;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpRmW6YcNz302k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:17:47 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so3309459pjo.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7ptp1USOXgNwVjshHmZaCW6p+yN/bVBulJsF0ld/uI=;
        b=n6XyFQbLhco4tav/w5dTfC2rycU06OCuf9USVDqjPOoijJ6mdYlCxGZKPe1Dn+ueAu
         Cm4CsPKDWqtUs+GZ9cP9yzRq0RQrNybjztj+bUZiKVKbom/l4lmSMXF4AhOQqQQkiDts
         ZwLUAazysJDEpGi/qZWKb8q4fpUjgscJiyaea1TWFtKBd5GUZ9Qj9aRIkPu05a3wj+W1
         kd8zPd+7HbjEXJUWoU6LYwcR50VicP2nNkou2AsKRoYVn+UU1ZzWXVmQgAADq2QfcXZs
         qhZjSZPgDv7yn8DhLLNjBoY2NRxGiTFjGNGS0RLEfOqXEyQFIN5iyZpKXRMbFeXRT+Db
         BgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7ptp1USOXgNwVjshHmZaCW6p+yN/bVBulJsF0ld/uI=;
        b=47Ctz/RREH7Fh8VDqfDCnNjM4klGqRt0ecUJWbtF/f/HXgc4kA8vbNEtoCPHd8oNRq
         Zbd5RP+/Z/yyUDF1lzag4ReVNXMzm6dqhjdkO0xqnhpk35gDJtmagce4HeT9Gd9WIWu5
         mYcCcOIU1wWXuWADN2hz+NuvmHx5CeW0pAqgUWZKDuazihd5IfZOeRwj2e4rCfnu7QsQ
         gf/s0NHZWZB9ciZDwVJiiz/3a/B7Nix1Np0b6IrioC/CR7ZPuWqqqnNDZyAJte0Gw8Z0
         6i9jFsYv1Rkr71l+UE1gRApstgDY1xlG2DiwxwpWvLmKQUCftm8RmnNstlld8miVmfC5
         3lrw==
X-Gm-Message-State: ACrzQf0gT4RE1bIXq3rj+bh5giah1gcMnZByTGI9szdEf0hY7fOQsHOD
	JwQY6sqOxiL/6Nvz2Skupgs=
X-Google-Smtp-Source: AMsMyM6k5YC4lBUCNPfBd40Ut+6TVprTY3JVqfSuDDXKC7AWz5maSUceIl7Vh/DrnhH3X2v+yYFsfw==
X-Received: by 2002:a17:902:d504:b0:184:87ca:7856 with SMTP id b4-20020a170902d50400b0018487ca7856mr2534249plg.14.1665706664701;
        Thu, 13 Oct 2022 17:17:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e24-20020a656798000000b00454f8a8cc24sm281217pgr.12.2022.10.13.17.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 17:17:43 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:17:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/64s: Disable preemption in hash lazy mmu mode
Message-ID: <20221014001742.GA412544@roeck-us.net>
References: <20221013151647.1857994-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151647.1857994-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 01:16:45AM +1000, Nicholas Piggin wrote:
> apply_to_page_range on kernel pages does not disable preemption, which
> is a requirement for hash's lazy mmu mode, which keeps track of the
> TLBs to flush with a per-cpu array.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index fab8332fe1ad..751921f6db46 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -32,6 +32,11 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  
>  	if (radix_enabled())
>  		return;
> +	/*
> +	 * apply_to_page_range can call us this preempt enabled when
> +	 * operating on kernel page tables.
> +	 */
> +	preempt_disable();
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>  	batch->active = 1;
>  }
> @@ -47,6 +52,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	if (batch->index)
>  		__flush_tlb_pending(batch);
>  	batch->active = 0;
> +	preempt_enable();
>  }
>  
>  #define arch_flush_lazy_mmu_mode()      do {} while (0)
> -- 
> 2.37.2
> 
