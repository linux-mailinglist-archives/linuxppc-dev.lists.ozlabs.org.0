Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D41E7C4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 13:51:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YNDx42wGzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 21:50:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.67; helo=mail-pj1-f67.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YNC35j2xzDqLW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 21:49:17 +1000 (AEST)
Received: by mail-pj1-f67.google.com with SMTP id h95so356743pje.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 04:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tKgvLnMoVN03KmyidTRu63JbswSykU0phmRWaMSE1pQ=;
 b=Ar3yIJx/T/SChh1cR5tveNNOQHuMe5UQbJdlZ68k4CEPF6JlFH5HR7M6HS2Ouu6r4m
 NkRFkS6+pbIhL4QEnCq2DoqjF6QiyzqsFUO6YT7C+7Ge1dAQ+9dzkmK3pOMbpGyzfeLu
 r11bVT+epWG7O3hD2ZsP/glcYgCFFgClLXqq80T9UWo1W3vySsxrpjItKWN35isoiyr8
 5QsCVVf+siqy0XrVDMQbn0NOwyGg4SC/zx/4NPO6xvxWXLXYrE9WA85FhZSe5NhAmDkL
 HNEbyB0mAeiHTn+qwxsMyBaVNGCBX5SmTgal5ucIe+R6IEHEF8cPI1XS8hTarbyBX7qV
 JNPg==
X-Gm-Message-State: AOAM533Lb8zl+k4RuzY24lsZV79XHFI/N4VxAkot4Iued7jpiN3v7zEM
 4EWKPXxebb/KiFvTuBqDQZ8=
X-Google-Smtp-Source: ABdhPJxrT0WKEXd0Z0T8tqO8BKoAs/7a7rNPvktegNOfLVWuhUKQCRCyfP/hkaSF2EJJ+Sxqdt5Lrw==
X-Received: by 2002:a17:90a:c7d8:: with SMTP id
 gf24mr8959455pjb.218.1590752955275; 
 Fri, 29 May 2020 04:49:15 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id go1sm7188741pjb.26.2020.05.29.04.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 04:49:13 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id D2F254046C; Fri, 29 May 2020 11:49:12 +0000 (UTC)
Date: Fri, 29 May 2020 11:49:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [Intel-gfx] [PATCH 06/13] ocfs2: use new sysctl subdir helper
 register_sysctl_subdir()
Message-ID: <20200529114912.GC11244@42.do-not-panic.com>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-7-mcgrof@kernel.org>
 <202005290121.C78B4AC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202005290121.C78B4AC@keescook>
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
Cc: jack@suse.cz, rafael@kernel.org, airlied@linux.ie, amir73il@gmail.com,
 clemens@ladisch.de, dri-devel@lists.freedesktop.org,
 joseph.qi@linux.alibaba.com, sfr@canb.auug.org.au, mark@fasheh.com,
 rdna@fb.com, yzaikin@google.com, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, julia.lawall@lip6.fr, jlbec@evilplan.org,
 nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk, tytso@mit.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 01:23:19AM -0700, Kees Cook wrote:
> On Fri, May 29, 2020 at 07:41:01AM +0000, Luis Chamberlain wrote:
> > This simplifies the code considerably. The following coccinelle
> > SmPL grammar rule was used to transform this code.
> > 
> > // pycocci sysctl-subdir.cocci fs/ocfs2/stackglue.c
> > 
> > @c1@
> > expression E1;
> > identifier subdir, sysctls;
> > @@
> > 
> > static struct ctl_table subdir[] = {
> > 	{
> > 		.procname = E1,
> > 		.maxlen = 0,
> > 		.mode = 0555,
> > 		.child = sysctls,
> > 	},
> > 	{ }
> > };
> > 
> > @c2@
> > identifier c1.subdir;
> > 
> > expression E2;
> > identifier base;
> > @@
> > 
> > static struct ctl_table base[] = {
> > 	{
> > 		.procname = E2,
> > 		.maxlen = 0,
> > 		.mode = 0555,
> > 		.child = subdir,
> > 	},
> > 	{ }
> > };
> > 
> > @c3@
> > identifier c2.base;
> > identifier header;
> > @@
> > 
> > header = register_sysctl_table(base);
> > 
> > @r1 depends on c1 && c2 && c3@
> > expression c1.E1;
> > identifier c1.subdir, c1.sysctls;
> > @@
> > 
> > -static struct ctl_table subdir[] = {
> > -	{
> > -		.procname = E1,
> > -		.maxlen = 0,
> > -		.mode = 0555,
> > -		.child = sysctls,
> > -	},
> > -	{ }
> > -};
> > 
> > @r2 depends on c1 && c2 && c3@
> > identifier c1.subdir;
> > 
> > expression c2.E2;
> > identifier c2.base;
> > @@
> > -static struct ctl_table base[] = {
> > -	{
> > -		.procname = E2,
> > -		.maxlen = 0,
> > -		.mode = 0555,
> > -		.child = subdir,
> > -	},
> > -	{ }
> > -};
> > 
> > @r3 depends on c1 && c2 && c3@
> > expression c1.E1;
> > identifier c1.sysctls;
> > expression c2.E2;
> > identifier c2.base;
> > identifier c3.header;
> > @@
> > 
> > header =
> > -register_sysctl_table(base);
> > +register_sysctl_subdir(E2, E1, sysctls);
> > 
> > Generated-by: Coccinelle SmPL
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  fs/ocfs2/stackglue.c | 27 ++++-----------------------
> >  1 file changed, 4 insertions(+), 23 deletions(-)
> > 
> > diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
> > index a191094694c6..addafced7f59 100644
> > --- a/fs/ocfs2/stackglue.c
> > +++ b/fs/ocfs2/stackglue.c
> > @@ -677,28 +677,8 @@ static struct ctl_table ocfs2_mod_table[] = {
> >  	},
> >  	{ }
> >  };
> > -
> > -static struct ctl_table ocfs2_kern_table[] = {
> > -	{
> > -		.procname	= "ocfs2",
> > -		.data		= NULL,
> > -		.maxlen		= 0,
> > -		.mode		= 0555,
> > -		.child		= ocfs2_mod_table
> > -	},
> > -	{ }
> > -};
> > -
> > -static struct ctl_table ocfs2_root_table[] = {
> > -	{
> > -		.procname	= "fs",
> > -		.data		= NULL,
> > -		.maxlen		= 0,
> > -		.mode		= 0555,
> > -		.child		= ocfs2_kern_table
> > -	},
> > -	{ }
> > -};
> > +	.data		= NULL,
> > +	.data		= NULL,
> 
> The conversion script doesn't like the .data field assignments. ;)
> 
> Was this series built with allmodconfig? I would have expected this to
> blow up very badly. :)

Yikes, sense, you're right. Nope, I left the random config tests to
0day. Will fix, thanks!

  Luis
