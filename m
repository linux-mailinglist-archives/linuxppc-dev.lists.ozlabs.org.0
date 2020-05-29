Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966B1E780A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:17:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YHVf3jDGzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GEzFK/LK; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YHRh54X3zDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 18:14:56 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id p21so1058330pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SKFY0Nk0lzZnsZYwS+0R6Jqxi22p/kGuawoexff+HFM=;
 b=GEzFK/LKfNFU6UJpyxaByBf5ZKjfm5yaMIo+HTxEbbGqjeJ2NKC1wQHBTEziYuM2/c
 zdLFnp7ddR2lTanx16yKCGNuhGrn+P++lavG8tEoUTeqsy/vItUpiclup3Hw3sRiYEui
 6wOwumpgIOr98WMOxg6/ewEsbQVEUFI/4pWuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SKFY0Nk0lzZnsZYwS+0R6Jqxi22p/kGuawoexff+HFM=;
 b=NJQXSqSZrUtF8su/RyucafnP0YfMRZ1ZjSe0CH/WbknQiSv9ZPABPzsFRBuPtkNzNF
 wMR4DZh1GC3C6YkFeWkkV1qqx2CZOwkJdVpZdgr3eHNEgIsVbH0H8BuDKrBaFI4cVNZw
 Er82qUUJBzqQyBA2OSMZh1ky7qmghrFjE5kpNtabidBV9BFdjwr6BX96FdETkg9MRWGT
 5V1ehKjp5RKuKEHxgrgCdUE+t4jMxkvdPUZxIpDeX+6cZBT2Dwf3BalbHCka8cDvJODm
 z6BwX7aC3zkK1o712JuV48/EBvThthc/iweHv981ZgbGOJl2XH3EvUNdXXJWkMeBD0Jv
 qyHA==
X-Gm-Message-State: AOAM531uUbU0mCx7cegqBNE0QJ19XIXGTBfblJBowVAjP7XvnOX5Ek+C
 xfG1SRKzjVjKZ1IzwzSUir9g0Q==
X-Google-Smtp-Source: ABdhPJyK2FUwFmtdobHKhZ8I1QHoKW4hEbYErArP63rQknnJfHipw8t38GV0zrMxKfzrK+yxeI5VDw==
X-Received: by 2002:a62:8703:: with SMTP id i3mr7543110pfe.212.1590740092307; 
 Fri, 29 May 2020 01:14:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b140sm6448091pfb.119.2020.05.29.01.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 01:14:51 -0700 (PDT)
Date: Fri, 29 May 2020 01:14:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 13/13] fs: move binfmt_misc sysctl to its own file
Message-ID: <202005290113.53AEED2176@keescook>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-14-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529074108.16928-14-mcgrof@kernel.org>
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, joonas.lahtinen@linux.intel.com,
 arnd@arndb.de, intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 julia.lawall@lip6.fr, jlbec@evilplan.org, rodrigo.vivi@intel.com,
 nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk, tytso@mit.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, daniel@ffwll.ch, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 07:41:08AM +0000, Luis Chamberlain wrote:
> This moves the binfmt_misc sysctl to its own file to help remove
> clutter from kernel/sysctl.c.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  fs/binfmt_misc.c | 1 +
>  kernel/sysctl.c  | 7 -------
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index f69a043f562b..656b3f5f3bbf 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -821,6 +821,7 @@ static int __init init_misc_binfmt(void)
>  	int err = register_filesystem(&bm_fs_type);
>  	if (!err)
>  		insert_binfmt(&misc_format);
> +	register_sysctl_empty_subdir("fs", "binfmt_misc");
>  	return err;

Nit: let's make the dir before registering the filesystem. I can't
imagine a realistic situation where userspace is reacting so fast it
would actually fail to mount the fs on /proc/sys/fs/binfmt_misc, but why
risk it?

-Kees

>  }
>  
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index 460532cd5ac8..7714e7b476c2 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -3042,13 +3042,6 @@ static struct ctl_table fs_table[] = {
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_TWO,
>  	},
> -#if defined(CONFIG_BINFMT_MISC) || defined(CONFIG_BINFMT_MISC_MODULE)
> -	{
> -		.procname	= "binfmt_misc",
> -		.mode		= 0555,
> -		.child		= sysctl_mount_point,
> -	},
> -#endif
>  	{
>  		.procname	= "pipe-max-size",
>  		.data		= &pipe_max_size,
> -- 
> 2.26.2
> 

-- 
Kees Cook
