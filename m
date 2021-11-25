Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80A45D985
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 12:47:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0GMK54H5z3051
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 22:47:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=philpotter-co-uk.20210112.gappssmtp.com header.i=@philpotter-co-uk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4mJ9AwSH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=philpotter.co.uk (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=phil@philpotter.co.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=philpotter-co-uk.20210112.gappssmtp.com
 header.i=@philpotter-co-uk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4mJ9AwSH; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0C905klpz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:23:13 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id 193so10767757qkh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6cQ2VBT6GEq5IzxtMFOrkAmdfUkzXXUJICym+jfQClw=;
 b=4mJ9AwSHB31PIpdJFgjtZiPI3O5U6l1D0qy0KW0UNf5MH6ozT0e6B86+3bb+ubsNsn
 bM94zULnP3/Sn5TW2sU/aVPK6VkQM9qy7472OA32+vcwka6MF4HPtv3JEMMLnnF7wmI8
 ICnVsm3JYbKZ1EmnKJc5Z6apqZ2RUZkPkq+9OUBvr5SxgxoGUUCPzzNRjS9cNIPRmf9W
 FkRzAaXZcf5J4VFjOvxT6jDJIPAkJGMRS0lNjaglMXitLBGhfTqTjyAGLSVTx96zOYvc
 geD85MYGed6A2vdWo2NGX8n2KXD9U2AGeoO0+MzV1KSKw8zpkUNflxlTE2C1KHr75DOI
 PH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6cQ2VBT6GEq5IzxtMFOrkAmdfUkzXXUJICym+jfQClw=;
 b=g4K4LOH8QZp5pF9ncafwDbVrQGneSW/o0ZhQ60SDrepJEMOr8TLdkAFSAMGGPemdlP
 DC7SBCJAmSKkRraIBtBCD7u/qeveBRPFFNtbnxIy/k/AeZrqmmI0vp9Db7/pen3vx3La
 FRtGFNYn3wc3H1FYwwgO/tsa8XK/CZZuzlTm52UhJNwosZ7nj5S7PcwIbHpBuqcU2Dmj
 pzcCXfvCgxNWpzfQTNKWxP5nhEcsSzb2T+apbL5W+fmp88cByZIq1q+DRbD9+3Z9FG2y
 vZXhkUML+aYEjdcicI2QVmassPF2bjpoOW2DFJ//OTYY9e6Xw5B7ri2s6I+mGeqoONHi
 0mBw==
X-Gm-Message-State: AOAM531IK5cqYBc9xDMXDqeJMq1C8wCkkTaAWFYvFATBrM3Q6pUw+ce5
 XwaNH1crS4xmP0S1DDEf9eZlrQ==
X-Google-Smtp-Source: ABdhPJwrHAepVsZs+KL0K+Dovd/v3IZvIaLP3c/YHUpcEAnEaPTq5AjU/2Qs0P+96c5OryJ5OBqRAA==
X-Received: by 2002:a05:620a:f8b:: with SMTP id
 b11mr13482119qkn.81.1637832189250; 
 Thu, 25 Nov 2021 01:23:09 -0800 (PST)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2])
 by smtp.gmail.com with ESMTPSA id 16sm1314112qty.2.2021.11.25.01.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 01:23:08 -0800 (PST)
Date: Thu, 25 Nov 2021 09:23:03 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk
Subject: Re: [PATCH v2 7/8] cdrom: simplify subdirectory registration with
 register_sysctl()
Message-ID: <YZ9V9yxGapfPF4+g@equinox>
References: <20211123202422.819032-1-mcgrof@kernel.org>
 <20211123202422.819032-8-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123202422.819032-8-mcgrof@kernel.org>
X-Mailman-Approved-At: Thu, 25 Nov 2021 22:46:50 +1100
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
 linux-block@vger.kernel.org, viro@zeniv.linux.org.uk, rodrigo.vivi@intel.com,
 nixiaoming@huawei.com, tvrtko.ursulin@linux.intel.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 julia.lawall@inria.fr, ebiederm@xmission.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 23, 2021 at 12:24:21PM -0800, Luis Chamberlain wrote:
> There is no need to user boiler plate code to specify a set of base
> directories we're going to stuff sysctls under. Simplify this by using
> register_sysctl() and specifying the directory path directly.
> 
> // pycocci sysctl-subdir-register-sysctl-simplify.cocci PATH
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
> @initialize:python@
> @@
> 
> def make_my_fresh_expression(s1, s2):
>   return '"' + s1.strip('"') + "/" + s2.strip('"') + '"'
> 
> @r3 depends on c1 && c2 && c3@
> expression c1.E1;
> identifier c1.sysctls;
> expression c2.E2;
> identifier c2.base;
> identifier c3.header;
> fresh identifier E3 = script:python(E2, E1) { make_my_fresh_expression(E2, E1) };
> @@
> 
> header =
> -register_sysctl_table(base);
> +register_sysctl(E3, sysctls);
> 
> Generated-by: Coccinelle SmPL
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/cdrom/cdrom.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 9877e413fce3..1b57d4666e43 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3691,27 +3691,6 @@ static struct ctl_table cdrom_table[] = {
>  	},
>  	{ }
>  };
> -
> -static struct ctl_table cdrom_cdrom_table[] = {
> -	{
> -		.procname	= "cdrom",
> -		.maxlen		= 0,
> -		.mode		= 0555,
> -		.child		= cdrom_table,
> -	},
> -	{ }
> -};
> -
> -/* Make sure that /proc/sys/dev is there */
> -static struct ctl_table cdrom_root_table[] = {
> -	{
> -		.procname	= "dev",
> -		.maxlen		= 0,
> -		.mode		= 0555,
> -		.child		= cdrom_cdrom_table,
> -	},
> -	{ }
> -};
>  static struct ctl_table_header *cdrom_sysctl_header;
>  
>  static void cdrom_sysctl_register(void)
> @@ -3721,7 +3700,7 @@ static void cdrom_sysctl_register(void)
>  	if (!atomic_add_unless(&initialized, 1, 1))
>  		return;
>  
> -	cdrom_sysctl_header = register_sysctl_table(cdrom_root_table);
> +	cdrom_sysctl_header = register_sysctl("dev/cdrom", cdrom_table);
>  
>  	/* set the defaults */
>  	cdrom_sysctl_settings.autoclose = autoclose;
> -- 
> 2.33.0
> 

Dear Luis,

Thank you for the patch. Tested and working, looks good to me. As this
has already been pulled into Andrew Morton's tree, I have added in Jens
and the linux-block list so there is awareness that the patch will go
via -mm then linux-next tree.

For what it's worth (although guess it won't be in the commit now):
Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
