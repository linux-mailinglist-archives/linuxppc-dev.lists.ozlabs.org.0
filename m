Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4C573CCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 20:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljmxm65Nvz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 04:54:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fsmkGrkz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fsmkGrkz;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljmx63kwjz3blJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 04:53:43 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id a15so10981326pfv.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GeV2tFKBcVMa4ZCzocYwtGdNsZHtwglU+ZOuhzOWglM=;
        b=fsmkGrkzthQjZwIcIwegSlkzJgod4muvky/93KjoZs9q8nfTKRg3mXSQnQTz1w6BbJ
         iQJRqGUrgZZ2RAAuLBHCIrXvXXMv8QZBXR3QfSMVRbplSYjwMeYFbHu5Ub88grCdCa2A
         +qcaspBGuWupKXJ0g1t5438TSo0VCs0izOQOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GeV2tFKBcVMa4ZCzocYwtGdNsZHtwglU+ZOuhzOWglM=;
        b=CVmeB1xZzsnSkzwr4fhdl72UOK0c6b+R2w7sD0NpCCseAMpn/Q/FFvhoJoFJFHgt6Y
         /svCHT+WePfuipQ4vxWEQKggh3ojg2YC93Hw5IeCMOGeE4CWUKhv1Ku93HfaBW9QO2zI
         DeuY8CfB7c/lzTZDvhcuRjrj+Yq0aDI5JpgAOL1nRX7gfeDDZIoNJLFKwzeVUSp0NmYU
         PtI1swZY9kvpWpepzSFVxh0wspjTHrv0iyizOUeTKZ3mTy8EXjTlmzlZti++9934VnuK
         Y5N4H/c6o8GAA44NPEfxig52yxuWzpBqGbIu/BUKytCgLOCufBuzJx17TmNYAPJktuJA
         8gTQ==
X-Gm-Message-State: AJIora+dWYrMyRQ4bpWxgHn0vQHLMDuWYSu3mg/Va49j0RHpzefQygXN
	S2RSUj8wLicM62yyCSxDIHSs/A==
X-Google-Smtp-Source: AGRyM1tyW/e/Gu78Q+yh5cSQTQQPTE5CBcgxMmQ977sNgJVjqs3mfr5hqoBTeXwo+EBVMBnzgUGfKw==
X-Received: by 2002:a63:2b85:0:b0:419:7b8c:ac58 with SMTP id r127-20020a632b85000000b004197b8cac58mr4041562pgr.230.1657738420702;
        Wed, 13 Jul 2022 11:53:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 205-20020a6217d6000000b0052af2e8bb9csm2865321pfx.16.2022.07.13.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 11:53:40 -0700 (PDT)
Date: Wed, 13 Jul 2022 11:53:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Ning Qiang <sohu0106@126.com>
Subject: Re: [PATCH] macintosh:fix oob read in do_adb_query function
Message-ID: <202207131149.606A481BD8@keescook>
References: <20220713153734.2248-1-sohu0106@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713153734.2248-1-sohu0106@126.com>
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
Cc: security@kernel.org, linuxppc-dev@lists.ozlabs.org, greg@kroah.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 13, 2022 at 11:37:34PM +0800, Ning Qiang wrote:
> In do_adb_query function of drivers/macintosh/adb.c, req->data is copy
> form userland. the  parameter "req->data[2]" is Missing check, the
> array size of adb_handler[] is 16, so "adb_handler[
> req->data[2]].original_address" and "adb_handler[
> req->data[2]].handler_id" will lead to oob read.
> 
> Signed-off-by: Ning Qiang <sohu0106@126.com>

Thanks for catching this!

Do you have a reproducer for this? I'd expect CONFIG_UBSAN_BOUNDS=y to
notice this at runtime, at least.


> ---
>  drivers/macintosh/adb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
> index 439fab4eaa85..1bbb9ca08d40 100644
> --- a/drivers/macintosh/adb.c
> +++ b/drivers/macintosh/adb.c
> @@ -647,7 +647,7 @@ do_adb_query(struct adb_request *req)
>  
>  	switch(req->data[1]) {
>  	case ADB_QUERY_GETDEVINFO:
> -		if (req->nbytes < 3)
> +		if (req->nbytes < 3 || req->data[2] >= 16)

I'd prefer this was:

+		if (req->nbytes < 3 || req->data[2] >= ARRAY_SIZE(adb_handler))

so it's tied to the actual variable (if its size ever changes).

With that:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

>  			break;
>  		mutex_lock(&adb_handler_mutex);
>  		req->reply[0] = adb_handler[req->data[2]].original_address;
> -- 
> 2.25.1
> 

-- 
Kees Cook
