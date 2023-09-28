Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E35167B213A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:26:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxHQP6RLhz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 01:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.49; helo=mail-ot1-f49.google.com; envelope-from=wei.liu.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxHPq0ltkz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 01:26:21 +1000 (AEST)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c620883559so1754826a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 08:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914779; x=1696519579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYPUiAEm0lZNQbU6hKmoJKqPGRAnrTCwSSHfRdZ7LfA=;
        b=Z2TcS20yFuRrO21rYECGr3H+jVYmqCTlKIcEAfaeDkQcUbZGFEYltRrl03Azd/1Oam
         F+NqdnSyHya0m9mEc2w3Dml36F7g87J1ff+ZY18TVTiOuxuSdcDwvNg2XQ3CAs6IpXOC
         DkzdML2GOIQ/QfE49NB4HulBXqMDSOz9ZKxGwwysQqLWuVxcBf83WQ1Xjq12ZtGJhsfa
         awBcd4r9qJ8OYwK7qpABGdQ6P++IMgce+5yUHvkmcaMyqlY6mJlhwfkTER4y9QI6yNlF
         0+BmtKJpxfeNxJZSXbZ10PFqkT6ToaxXaIAURl7CsZBIeC2X7Nfg+W1QXSYi+ujR+a61
         f5Rg==
X-Gm-Message-State: AOJu0Yzlj8rknt96AeDhTzZ8JSVnyAS2c5WN8QvkFArR20iQnWBUoXER
	GvQHnGlryy7jxsKyRPv6CeI=
X-Google-Smtp-Source: AGHT+IEkFDTusLpYox11EoA1Tl2MJIdC5Ad7Ua286wH6ql8JYqDg2cQ1Wc6Zlzvv071aY+VufA88gQ==
X-Received: by 2002:a9d:73d5:0:b0:6c4:b339:2528 with SMTP id m21-20020a9d73d5000000b006c4b3392528mr1632381otk.16.1695914778722;
        Thu, 28 Sep 2023 08:26:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id j14-20020aa78dce000000b006906aaf1e4dsm13514673pfr.150.2023.09.28.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:26:18 -0700 (PDT)
Date: Thu, 28 Sep 2023 15:26:16 +0000
From: Wei Liu <wei.liu@kernel.org>
To: j.granados@samsung.com
Subject: Re: [PATCH 14/15] hyper-v/azure: Remove now superfluous sentinel
 element from ctl_table array
Message-ID: <ZRWbGDlXCS4t8tMf@liuwe-devbox-debian-v2>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd 
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please change the prefix to "Drivers: hv:" in the subject line in the
two patches.

On Thu, Sep 28, 2023 at 03:21:39PM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from hv_ctl_table
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/hv/hv_common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index ccad7bca3fd3..bc7d678030aa 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -147,8 +147,7 @@ static struct ctl_table hv_ctl_table[] = {
>  		.proc_handler	= proc_dointvec_minmax,
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE
> -	},
> -	{}
> +	}

Please keep the comma at the end.

>  };
>  
>  static int hv_die_panic_notify_crash(struct notifier_block *self,
> 
> -- 
> 2.30.2
> 
