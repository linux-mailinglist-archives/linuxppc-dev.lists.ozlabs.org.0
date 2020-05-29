Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 824FC1E7A97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 12:29:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YLR14WMWzDqjR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 20:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=faxcz92s; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YLMr3d06zDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 20:26:48 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C26F9206A4;
 Fri, 29 May 2020 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590748006;
 bh=8bEWlZvRJTJSN5EFbE7fd2XRTFiSJ+Enlo+N8agFquw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faxcz92sMN7eOu8oBUxaAuviQDXXeCuF2ty48gOQVoG5HKyRtgx+1j3jYaEufgT4v
 ps9TDuc6AUOCKrsn9WS7bIWuM8CHQAcMiGCY1kLVP1M2yVXU9+iLCJ5JPtqGZK78wI
 pz+6O4DU0xL3evrZoQJnm3ddwYf+9VKFG7x8HgYY=
Date: Fri, 29 May 2020 12:26:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 11/13] random: simplify sysctl declaration with
 register_sysctl_subdir()
Message-ID: <20200529102644.GB1345939@kroah.com>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-12-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529074108.16928-12-mcgrof@kernel.org>
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
 keescook@chromium.org, arnd@arndb.de, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, julia.lawall@lip6.fr, jlbec@evilplan.org,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 07:41:06AM +0000, Luis Chamberlain wrote:
> From: Xiaoming Ni <nixiaoming@huawei.com>
> 
> Move random_table sysctl from kernel/sysctl.c to drivers/char/random.c
> and use register_sysctl_subdir() to help remove the clutter out of
> kernel/sysctl.c.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/char/random.c  | 14 ++++++++++++--
>  include/linux/sysctl.h |  1 -
>  kernel/sysctl.c        |  5 -----
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index a7cf6aa65908..73fd4b6e9c18 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -2101,8 +2101,7 @@ static int proc_do_entropy(struct ctl_table *table, int write,
>  }
>  
>  static int sysctl_poolsize = INPUT_POOL_WORDS * 32;
> -extern struct ctl_table random_table[];
> -struct ctl_table random_table[] = {
> +static struct ctl_table random_table[] = {
>  	{
>  		.procname	= "poolsize",
>  		.data		= &sysctl_poolsize,
> @@ -2164,6 +2163,17 @@ struct ctl_table random_table[] = {
>  #endif
>  	{ }
>  };
> +
> +/*
> + * rand_initialize() is called before sysctl_init(),
> + * so we cannot call register_sysctl_init() in rand_initialize()
> + */
> +static int __init random_sysctls_init(void)
> +{
> +	register_sysctl_subdir("kernel", "random", random_table);

No error checking?

:(

