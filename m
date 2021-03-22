Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B134370F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 04:03:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3fT66bK7z303X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:03:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gzrjPqdc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=gzrjPqdc; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3fSd6k7wz2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 14:02:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=PvE96ntsEZmCkQyTvzYblPmwgkpkwSuUISXQXJ8/0WE=; b=gzrjPqdcfDBFHkNhzP7aP0R7zp
 dl0EJjbKcybjcXnM8df5PjIq0KyotWvgGf7vBPg3hvxgJG+g+V0PCWziq6+r1+WB4FEFxLwl+F80X
 J+W9WXVaVz3rgHzGGjlK1UBx17R3bDeU1QpBH8juwPlpcRk99Dkc5jPdJne6mcB/dDEwOwq7/qba+
 HHd32Viq+AoFTUvySeLGchOHBLcPd267kqeUG2sXYR3oGAGSosIzRpLOLAanfw+1GN/cIsxIzbZ0f
 fo4Nh9VNllK8EOBh6Xhp1FpuGcO4NkS13yRo9KK1pfifLscnvv6e/b+HduTptiHxba9ICn6bjmxz2
 3NyrjYVw==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOAq5-00AjuL-NN; Mon, 22 Mar 2021 03:02:47 +0000
Subject: Re: [PATCH] cxl: Fix couple of spellings
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, fbarrat@linux.ibm.com,
 ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210322023307.168754-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <132af432-56a3-5435-06cd-25c8427f654b@infradead.org>
Date: Sun, 21 Mar 2021 20:02:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322023307.168754-1-unixbhaskar@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/21/21 7:33 PM, Bhaskar Chowdhury wrote:
> 
> s/filesytem/filesystem/
> s/symantics/semantics/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/misc/cxl/context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/cxl/context.c b/drivers/misc/cxl/context.c
> index fb2eff69e449..e627b4056623 100644
> --- a/drivers/misc/cxl/context.c
> +++ b/drivers/misc/cxl/context.c
> @@ -52,7 +52,7 @@ int cxl_context_init(struct cxl_context *ctx, struct cxl_afu *afu, bool master)
>  		 * can always access it when dereferenced from IDR. For the same
>  		 * reason, the segment table is only destroyed after the context is
>  		 * removed from the IDR.  Access to this in the IOCTL is protected by
> -		 * Linux filesytem symantics (can't IOCTL until open is complete).
> +		 * Linux filesystem semantics (can't IOCTL until open is complete).
>  		 */
>  		i = cxl_alloc_sst(ctx);
>  		if (i)
> --


-- 
~Randy

