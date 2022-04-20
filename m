Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A9509338
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 00:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkGFq2k4Kz3bYM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 08:54:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PErqBP2j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkGFC4gWPz2xYB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 08:54:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PErqBP2j; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KkGF85JJwz4xR9;
 Thu, 21 Apr 2022 08:54:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650495246;
 bh=qLGjkp6XaJCG2v9la8Z0Z1LTGbSB3IZhkcSgJ6/yvwg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PErqBP2jpEF4B/n7y1EbTTycn/YDD/Zd3naDd0QJs/z4v+AgYgf9XdgIVCdUtaQYw
 4FwVbt6qqTFcXzCRMll0FheC6mKtJ84MyV8b5nTEWTGu9PDEQnaCO5sjpy9o0l2VQV
 ykE3BoykcnWH3H6ui7YZ3wgsN+SkhCW3ufppgnNXNINAtxQ3zaFhH+uRrSUzwZw038
 HELDg4p9aNQbWegyo7fkesOFjSbjds8lhcI2wm/UAeN3K0AMVhwo4oodnoiiBpuELi
 qSre6nYZRuZGYhZASVtnmuQAmRsx2Ul3t4e+zw1IQlN+XJTlYQYc7zhVXaKe9fndkh
 ayhFeoZcy4c2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hangyu Hua <hbh25y@gmail.com>, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, alastair@d-silva.org
Subject: Re: [PATCH] misc: ocxl: fix possible double free in
 ocxl_file_register_afu
In-Reply-To: <20220418085758.38145-1-hbh25y@gmail.com>
References: <20220418085758.38145-1-hbh25y@gmail.com>
Date: Thu, 21 Apr 2022 08:54:04 +1000
Message-ID: <87czhbfjsj.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hangyu Hua <hbh25y@gmail.com> writes:
> info_release() will be called in device_unregister() when info->dev's
> reference count is 0. So there is no need to call ocxl_afu_put() and
> kfree() again.

Double frees are often exploitable. But it looks to me like this error
path is not easily reachable by an attacker.

ocxl_file_register_afu() is only called from ocxl_probe(), and we only
go to err_unregister if the sysfs or cdev initialisation fails, which
should only happen if we hit ENOMEM, or we have a duplicate device which
would be a device-tree/hardware error. But maybe Fred can check more
closely, I don't know the driver that well.

cheers


> Fix this by adding free_minor() and return to err_unregister error path.
>
> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  drivers/misc/ocxl/file.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index d881f5e40ad9..6777c419a8da 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -556,7 +556,9 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
>  
>  err_unregister:
>  	ocxl_sysfs_unregister_afu(info); // safe to call even if register failed
> +	free_minor(info);
>  	device_unregister(&info->dev);
> +	return rc;
>  err_put:
>  	ocxl_afu_put(afu);
>  	free_minor(info);
> -- 
> 2.25.1
