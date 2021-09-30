Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C641D76C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 12:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKpyL2HBhz30JK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 20:14:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=monstr-eu.20210112.gappssmtp.com header.i=@monstr-eu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ppyHc1xu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20210112.gappssmtp.com
 header.i=@monstr-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ppyHc1xu; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKpwY3BB5z2yKV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 20:13:14 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id r18so19848775edv.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=di22f+1qtT1rJlDsDU5gv52bfkIzi99/0/f5YELZTOw=;
 b=ppyHc1xu2ZjQ/kTBT2c/n07AkMuYUtXvdy0s7QXVTxECAFMjweuXUCK7xVE+xwaX0C
 6o8ZrsH3/9Aynnbf9fMbiY9C8vrkZKxMS2dYyF99LaMNbMDmo+1MshkoCVBu64oPE6ga
 zFJAQfJwiWTcCZsmLrqej5kKbY2vHfu7puIu4/K01CNJFBuzzGgBrIqsTKFJtWl1D8WY
 Zs33o3bUzbg+B6tae1aWxdGoSxVf8Jp54BcOj5rIAhOIm93rKhQ0OmZemre71DGprt/y
 YIumJdsINVkRuayzKbrt7Bx5i0AKwik6J4Ki1n3eaMHv8bBS9zWjaa6znfhzuZJX3poI
 GbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=di22f+1qtT1rJlDsDU5gv52bfkIzi99/0/f5YELZTOw=;
 b=wulXeRpwAfGBVRZBx5xqqHYh3mBhYBD9eXii5oW7JXflEfJfP6PfYNFiLLzyDllJ31
 3HVwkQRpsaQEDHd6+Z/Ip3jfthI5m+FV4plZnpGtVtJTCzFeZDB2K57K09iYzL+R/XML
 JWcpj5OXHJHs0mQGkxZKokbZHT6A4bwsSohLsR0b54jGhtNcBlkpSM8Ppb6XM86Mh8ud
 3gI9nBJn5WXCJ8fzzKjfwORGWRExVxgUL8YctRKBnjeXmeWz0Vmi6NglOXWk7nqnQ4Yf
 48sN9seClK0nlDv8ZBx6cSbeGge4vflMpjiHuf4PNAxe6GBFO+FxicmfUh7rYnkJeh/y
 ZeLQ==
X-Gm-Message-State: AOAM5316DbhwlGqDMGyxcaRYsABuI0QJk3cC3Y8G7u6SBtg9dNQE2YEq
 rrsp476D2WjN/1kgr+X9e2FKPA==
X-Google-Smtp-Source: ABdhPJzUmXdUqIGI8syP1K7qbkNoLgpokgx7oGftLZ5Q5kO7Xtw6c5x1cXA4qfoDB4xaMGW2mjnWyg==
X-Received: by 2002:a17:906:4d99:: with SMTP id
 s25mr5632392eju.175.1632996789937; 
 Thu, 30 Sep 2021 03:13:09 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::45a? ([2a02:768:2307:40d6::45a])
 by smtp.gmail.com with ESMTPSA id j14sm1265961edl.21.2021.09.30.03.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 03:13:09 -0700 (PDT)
Subject: Re: [PATCH v4 10/11] microblaze: Use is_kernel_text() helper
To: Kefeng Wang <wangkefeng.wang@huawei.com>, arnd@arndb.de,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com,
 davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
 <20210930071143.63410-11-wangkefeng.wang@huawei.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <2a23c06c-62e5-d4f8-4c7c-4e5c055a9e69@monstr.eu>
Date: Thu, 30 Sep 2021 12:13:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210930071143.63410-11-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: paulus@samba.org, linux-alpha@vger.kernel.org, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/30/21 9:11 AM, Kefeng Wang wrote:
> Use is_kernel_text() helper to simplify code.
> 
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/microblaze/mm/pgtable.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/mm/pgtable.c b/arch/microblaze/mm/pgtable.c
> index c1833b159d3b..9f73265aad4e 100644
> --- a/arch/microblaze/mm/pgtable.c
> +++ b/arch/microblaze/mm/pgtable.c
> @@ -34,6 +34,7 @@
>  #include <linux/mm_types.h>
>  #include <linux/pgtable.h>
>  #include <linux/memblock.h>
> +#include <linux/kallsyms.h>
>  
>  #include <asm/pgalloc.h>
>  #include <linux/io.h>
> @@ -171,7 +172,7 @@ void __init mapin_ram(void)
>  	for (s = 0; s < lowmem_size; s += PAGE_SIZE) {
>  		f = _PAGE_PRESENT | _PAGE_ACCESSED |
>  				_PAGE_SHARED | _PAGE_HWEXEC;
> -		if ((char *) v < _stext || (char *) v >= _etext)
> +		if (!is_kernel_text(v))
>  			f |= _PAGE_WRENABLE;
>  		else
>  			/* On the MicroBlaze, no user access
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

