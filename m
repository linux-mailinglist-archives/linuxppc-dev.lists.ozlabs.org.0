Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67C394C42
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 14:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FshC14gdNz304J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 22:46:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=ZWtID4dG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZWtID4dG; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FshBV6xpLz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 22:46:19 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d16so5310674pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=q2WQb6X7gSDL5fCT6m0PosKh8nct9yQ+snRn6XzZdWo=;
 b=ZWtID4dGN+4PWpIahT59tuqEjJOQ9mzTMM8RVS8nDJ/ffCdKr+3K4UjcevRdOMO3FZ
 aGdKJdrmA/YZNgz01LrkOfqYphzdKgTTVBGouUWx+yzWmVMk34XdSGY3y6WkPvKCwZEy
 b4wxKS1k0Xwdj7RzQHEFeDug8Tj9wTTii2hD6/Yb37/4Yuvdm+xY42JjiIQF9rpSuW/2
 jn2CCKYYtw5Yh+DilXNpEhLgPPwhYNqGQpLaLC5+m0l67NqDirGQaOTHg/bdymQ17W/C
 /evXPcUFXVdCRFw+WTwf9dNFsEiWvIhK1oU+God+RChcDDZt87Fs/WBrUHQa3H95Omm1
 0Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=q2WQb6X7gSDL5fCT6m0PosKh8nct9yQ+snRn6XzZdWo=;
 b=Hibd0SRIcTdDyTuxw6C3r4mMLYvG8t1xWW4O9F9fUJx3Bxr1VgUevv16/VZG6k4sZ+
 b9IY5g4/91rLXphKfTHmzhzFcNG+/ABmaFGRObYPFrEZ2Ire/W+vKqMLodU2ANe1eKwn
 jHqmkSvKbMvgcl4hLwaa8r+wfIaBLu9CpcqSwa9DywBoPPBzAQRvfc2aqRnRdyn7u+B1
 LhWpipHu9rn85y1PCExVjuXHEaxB/ZInqZzyt85bSEXoE82uotljCzMvIC8QdfDM7Mpy
 tlnp1zVFW4ibm6NY6CUea7j2pXQbPtMJrab5tQ3XZ/iZc94FwXTF84mvuJsSqYxLW4EU
 n96A==
X-Gm-Message-State: AOAM530KgzlDqs/K+FvQ8wT8jiXuqAmsMZtYt4OuONrnE6BgYLQ1PTh4
 1b+VLGjmEIElpW5g+hX35BXiCQ==
X-Google-Smtp-Source: ABdhPJyTISm9ZwCFE3HdXhDPYiT3p2pN/rNjFJtytGsllZgOrJ/eLekfEpFeA7u+E/K+gIEZUYyTmA==
X-Received: by 2002:a65:4689:: with SMTP id h9mr13808278pgr.347.1622292376296; 
 Sat, 29 May 2021 05:46:16 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id i5sm1939012pfc.139.2021.05.29.05.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 05:46:15 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/15] powerpc: convert to setup_initial_init_mm()
In-Reply-To: <20210529105504.180544-12-wangkefeng.wang@huawei.com>
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
 <20210529105504.180544-12-wangkefeng.wang@huawei.com>
Date: Sat, 29 May 2021 18:16:11 +0530
Message-ID: <87y2bxemi4.fsf@fossix.org>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kefeng Wang <wangkefeng.wang@huawei.com> writes:

> Use setup_initial_init_mm() helper to simplify code.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/powerpc/kernel/setup-common.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 046fe21b5c3b..c046d99efd18 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -928,10 +928,7 @@ void __init setup_arch(char **cmdline_p)
>  
>  	klp_init_thread_info(&init_task);
>  
> -	init_mm.start_code = (unsigned long)_stext;
> -	init_mm.end_code = (unsigned long) _etext;
> -	init_mm.end_data = (unsigned long) _edata;
> -	init_mm.brk = klimit;
> +	setup_initial_init_mm(_stext, _etext, _edata, _end);

This function definition is not visible for those who have subscribed only to
linuxppc-dev mailing list. I had to do a web-search with the ID. 

Thanks,
Santosh

>  
>  	mm_iommu_init(&init_mm);
>  	irqstack_early_init();
> -- 
> 2.26.2
