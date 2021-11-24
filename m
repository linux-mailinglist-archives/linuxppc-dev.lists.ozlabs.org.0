Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E545B7BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzbkB1XkPz3dgV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Fa3DfqPo;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jBk0LyCf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=Fa3DfqPo; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jBk0LyCf; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzbgf014Vz3cYp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:44:13 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 57BF02193C;
 Wed, 24 Nov 2021 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637747050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjctS9e3aLk//fWwNzII/UY4G5OnovggWZdyEKD1t34=;
 b=Fa3DfqPoxkPRyFtLFipUAPsRoQ7583RIvIkjGcirn+ZDIVuZJxTkgHZCWQWJkaYcgx/XTF
 6Tg+qvMREmzgGwP+y0PqF0I8yljZj0emBD/1N75E2fyVfhSwuHdlW27Cq87y3T4+dKDpTg
 m3CDIAdfVxCay7j/D++92R/TIMACYbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637747050;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjctS9e3aLk//fWwNzII/UY4G5OnovggWZdyEKD1t34=;
 b=jBk0LyCfiE1g4jR+z/f8PsVbXLRirmoGyBWY3eutEhQ8eC54ZtfGnQdZjQkRNSqRSaajn0
 YL6WjUHTxaO0ZHAA==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id A4AA0A3B8E;
 Wed, 24 Nov 2021 09:44:09 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 844E41E14AC; Wed, 24 Nov 2021 10:44:09 +0100 (CET)
Date: Wed, 24 Nov 2021 10:44:09 +0100
From: Jan Kara <jack@suse.cz>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v2 6/8] inotify: simplify subdirectory registration with
 register_sysctl()
Message-ID: <20211124094409.GF8583@quack2.suse.cz>
References: <20211123202422.819032-1-mcgrof@kernel.org>
 <20211123202422.819032-7-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123202422.819032-7-mcgrof@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jack@suse.cz, airlied@linux.ie, amir73il@gmail.com, clemens@ladisch.de,
 dri-devel@lists.freedesktop.org, phil@philpotter.co.uk,
 joseph.qi@linux.alibaba.com, mark@fasheh.com, yzaikin@google.com,
 joonas.lahtinen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 viro@zeniv.linux.org.uk, rodrigo.vivi@intel.com, nixiaoming@huawei.com,
 tvrtko.ursulin@linux.intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, julia.lawall@inria.fr, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 23-11-21 12:24:20, Luis Chamberlain wrote:
> From: Xiaoming Ni <nixiaoming@huawei.com>
> 
> There is no need to user boiler plate code to specify a set of base
> directories we're going to stuff sysctls under. Simplify this by using
> register_sysctl() and specifying the directory path directly.
> 
> Move inotify_user sysctl to inotify_user.c while at it to remove clutter
> from kernel/sysctl.c.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> [mcgrof: update commit log to reflect new path we decided to take]
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

This looks fishy. You register inotify_table but not fanotify_table and
remove both...

								Honza

> ---
>  fs/notify/inotify/inotify_user.c | 11 ++++++++++-
>  include/linux/inotify.h          |  3 ---
>  kernel/sysctl.c                  | 21 ---------------------
>  3 files changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
> index 29fca3284bb5..54583f62dc44 100644
> --- a/fs/notify/inotify/inotify_user.c
> +++ b/fs/notify/inotify/inotify_user.c
> @@ -58,7 +58,7 @@ struct kmem_cache *inotify_inode_mark_cachep __read_mostly;
>  static long it_zero = 0;
>  static long it_int_max = INT_MAX;
>  
> -struct ctl_table inotify_table[] = {
> +static struct ctl_table inotify_table[] = {
>  	{
>  		.procname	= "max_user_instances",
>  		.data		= &init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES],
> @@ -87,6 +87,14 @@ struct ctl_table inotify_table[] = {
>  	},
>  	{ }
>  };
> +
> +static void __init inotify_sysctls_init(void)
> +{
> +	register_sysctl("fs/inotify", inotify_table);
> +}
> +
> +#else
> +#define inotify_sysctls_init() do { } while (0)
>  #endif /* CONFIG_SYSCTL */
>  
>  static inline __u32 inotify_arg_to_mask(struct inode *inode, u32 arg)
> @@ -849,6 +857,7 @@ static int __init inotify_user_setup(void)
>  	inotify_max_queued_events = 16384;
>  	init_user_ns.ucount_max[UCOUNT_INOTIFY_INSTANCES] = 128;
>  	init_user_ns.ucount_max[UCOUNT_INOTIFY_WATCHES] = watches_max;
> +	inotify_sysctls_init();
>  
>  	return 0;
>  }
> diff --git a/include/linux/inotify.h b/include/linux/inotify.h
> index 6a24905f6e1e..8d20caa1b268 100644
> --- a/include/linux/inotify.h
> +++ b/include/linux/inotify.h
> @@ -7,11 +7,8 @@
>  #ifndef _LINUX_INOTIFY_H
>  #define _LINUX_INOTIFY_H
>  
> -#include <linux/sysctl.h>
>  #include <uapi/linux/inotify.h>
>  
> -extern struct ctl_table inotify_table[]; /* for sysctl */
> -
>  #define ALL_INOTIFY_BITS (IN_ACCESS | IN_MODIFY | IN_ATTRIB | IN_CLOSE_WRITE | \
>  			  IN_CLOSE_NOWRITE | IN_OPEN | IN_MOVED_FROM | \
>  			  IN_MOVED_TO | IN_CREATE | IN_DELETE | \
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index 7a90a12b9ea4..6aa67c737e4e 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -125,13 +125,6 @@ static const int maxolduid = 65535;
>  static const int ngroups_max = NGROUPS_MAX;
>  static const int cap_last_cap = CAP_LAST_CAP;
>  
> -#ifdef CONFIG_INOTIFY_USER
> -#include <linux/inotify.h>
> -#endif
> -#ifdef CONFIG_FANOTIFY
> -#include <linux/fanotify.h>
> -#endif
> -
>  #ifdef CONFIG_PROC_SYSCTL
>  
>  /**
> @@ -3099,20 +3092,6 @@ static struct ctl_table fs_table[] = {
>  		.proc_handler	= proc_dointvec,
>  	},
>  #endif
> -#ifdef CONFIG_INOTIFY_USER
> -	{
> -		.procname	= "inotify",
> -		.mode		= 0555,
> -		.child		= inotify_table,
> -	},
> -#endif
> -#ifdef CONFIG_FANOTIFY
> -	{
> -		.procname	= "fanotify",
> -		.mode		= 0555,
> -		.child		= fanotify_table,
> -	},
> -#endif
>  #ifdef CONFIG_EPOLL
>  	{
>  		.procname	= "epoll",
> -- 
> 2.33.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
