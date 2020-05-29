Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41D1E7836
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:25:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YHgF6zBbzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:24:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=V5cw7BLL; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YHdT5WwPzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 18:23:24 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id fs4so917249pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AIdQINovPOSOTJO7LcbhlxJUhgtHjantuh4CQ+iWOIk=;
 b=V5cw7BLL23TyvF7XSXItctQqYMbZHnd3YzoANtt528V7qq7xu1e8i/d5BPhYuuzcJA
 S4SZfsMhz56qz6LHdqb9P3YxO98X4/nyW5suGrtljbQRKiFaxDCQddMjE6qySAsDecYm
 59mGjrKtcG0wLlb2EG+x0AmjGyZj6GcSpchSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AIdQINovPOSOTJO7LcbhlxJUhgtHjantuh4CQ+iWOIk=;
 b=AtITElXN6pQYv2IrSHZRMokJGG5/6R6l049inp1kawxN65ZgAmRAH66rKeQkgWt3u4
 jhzodW4fkGzvYiLjTB/UgMOHaIxxqx6vhNLv0Zg3Zo/OONZxTgtvi3vy6jFT7YIEIxwn
 hbWD8xm4KGVLlLp94iny1/1I4ivG7/0Wh/+zNi8XkO/VSF3ioAktlfoDjf8jgw2Jnr6t
 xamRjY0UzXevfqWnYO4t3qPkU/fM2n5Cu7tWh0nFco8K+M+LNP1ZMgkAwij+zDH49rSS
 vev1N1ehmzXeYi4KYvHB0crgOmQcGpav465QH/Fanx1T9yAI0zj0+ZoDc6ZwXqNykW4x
 U8lA==
X-Gm-Message-State: AOAM5323KrOLu+7CaBVFm4ntKIS8C2Vm4GhNHdkMxUA5cw1zD1OTG9dj
 s3D3+6ghvQuc3Hd8LfeBG89t2w==
X-Google-Smtp-Source: ABdhPJxhe+HLIcubMtL5eQGoTBqj0FU4LjvgWIjKqizFmhGngk4G6mh/yk/MZlVlYeZObWjd5EoKaQ==
X-Received: by 2002:a17:90a:2e8a:: with SMTP id
 r10mr8137536pjd.33.1590740601487; 
 Fri, 29 May 2020 01:23:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id gd1sm7532180pjb.14.2020.05.29.01.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 01:23:20 -0700 (PDT)
Date: Fri, 29 May 2020 01:23:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 06/13] ocfs2: use new sysctl subdir helper
 register_sysctl_subdir()
Message-ID: <202005290121.C78B4AC@keescook>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-7-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529074108.16928-7-mcgrof@kernel.org>
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

On Fri, May 29, 2020 at 07:41:01AM +0000, Luis Chamberlain wrote:
> This simplifies the code considerably. The following coccinelle
> SmPL grammar rule was used to transform this code.
> 
> // pycocci sysctl-subdir.cocci fs/ocfs2/stackglue.c
> 
> @c1@
> expression E1;
> identifier subdir, sysctls;
> @@
> 
> static struct ctl_table subdir[] = {
> 	{
> 		.procname = E1,
> 		.maxlen = 0,
> 		.mode = 0555,
> 		.child = sysctls,
> 	},
> 	{ }
> };
> 
> @c2@
> identifier c1.subdir;
> 
> expression E2;
> identifier base;
> @@
> 
> static struct ctl_table base[] = {
> 	{
> 		.procname = E2,
> 		.maxlen = 0,
> 		.mode = 0555,
> 		.child = subdir,
> 	},
> 	{ }
> };
> 
> @c3@
> identifier c2.base;
> identifier header;
> @@
> 
> header = register_sysctl_table(base);
> 
> @r1 depends on c1 && c2 && c3@
> expression c1.E1;
> identifier c1.subdir, c1.sysctls;
> @@
> 
> -static struct ctl_table subdir[] = {
> -	{
> -		.procname = E1,
> -		.maxlen = 0,
> -		.mode = 0555,
> -		.child = sysctls,
> -	},
> -	{ }
> -};
> 
> @r2 depends on c1 && c2 && c3@
> identifier c1.subdir;
> 
> expression c2.E2;
> identifier c2.base;
> @@
> -static struct ctl_table base[] = {
> -	{
> -		.procname = E2,
> -		.maxlen = 0,
> -		.mode = 0555,
> -		.child = subdir,
> -	},
> -	{ }
> -};
> 
> @r3 depends on c1 && c2 && c3@
> expression c1.E1;
> identifier c1.sysctls;
> expression c2.E2;
> identifier c2.base;
> identifier c3.header;
> @@
> 
> header =
> -register_sysctl_table(base);
> +register_sysctl_subdir(E2, E1, sysctls);
> 
> Generated-by: Coccinelle SmPL
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  fs/ocfs2/stackglue.c | 27 ++++-----------------------
>  1 file changed, 4 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
> index a191094694c6..addafced7f59 100644
> --- a/fs/ocfs2/stackglue.c
> +++ b/fs/ocfs2/stackglue.c
> @@ -677,28 +677,8 @@ static struct ctl_table ocfs2_mod_table[] = {
>  	},
>  	{ }
>  };
> -
> -static struct ctl_table ocfs2_kern_table[] = {
> -	{
> -		.procname	= "ocfs2",
> -		.data		= NULL,
> -		.maxlen		= 0,
> -		.mode		= 0555,
> -		.child		= ocfs2_mod_table
> -	},
> -	{ }
> -};
> -
> -static struct ctl_table ocfs2_root_table[] = {
> -	{
> -		.procname	= "fs",
> -		.data		= NULL,
> -		.maxlen		= 0,
> -		.mode		= 0555,
> -		.child		= ocfs2_kern_table
> -	},
> -	{ }
> -};
> +	.data		= NULL,
> +	.data		= NULL,

The conversion script doesn't like the .data field assignments. ;)

Was this series built with allmodconfig? I would have expected this to
blow up very badly. :)

-- 
Kees Cook
