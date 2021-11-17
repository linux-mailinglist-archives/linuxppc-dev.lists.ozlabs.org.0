Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A908453EFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 04:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv7js0qdpz30RS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 14:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.176;
 helo=mail-pf1-f176.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv7jM1Tndz2yHl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 14:30:13 +1100 (AEDT)
Received: by mail-pf1-f176.google.com with SMTP id g19so1305928pfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 19:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=895YRPhGbbjFFaWKhBPRuX0mIQNHTjsRgPz9absSumc=;
 b=hayJm6TFn2EIZ4zinQQDTVTa/Mc8lKH6yhis2BANAosD6bRrxsdZLnxZCEAn9y5j9O
 L/LhxPmGXDE8mZVjNiBd5Ry6h7RjeAeeQhPH1yy+H8kr9oPBQRcbYEiiiBw1cW0jCqH0
 3pH1yXLMr3UHReqJDkR0EgXnN16pi/1Y3z3tt5bOu1s6PKMQPBZTTU248XAeH4oweEDE
 pK/aEC2W88Vzr1gHaKkzVb2pLHD0Pn1BKIcGrYiClWMPw8WBu08ZSjjrG19WgJsC5YUa
 Ge6NTJ0nMdGIKe2+MvR6ZM57H+lQJbtversPV7ZnCyCFj1OZuxAtOVpU+dw9u14z06U5
 EX5w==
X-Gm-Message-State: AOAM532KsTdq5SXy8lTs7aj5hh2XVtUJbgrC0BeuxmKdH3vAnHEAud9z
 snJAReYmF7tbjOjmAsznf8k=
X-Google-Smtp-Source: ABdhPJwU/IwET3zdClUb2Z5KLHH7EaHhfI8Rb/CQE2Ip9HWx6ygcuQpN7cUyD79BCdr2B54OGTZmNQ==
X-Received: by 2002:a63:f94d:: with SMTP id q13mr2926410pgk.13.1637119809592; 
 Tue, 16 Nov 2021 19:30:09 -0800 (PST)
Received: from garbanzo (136-24-173-63.cab.webpass.net. [136.24.173.63])
 by smtp.gmail.com with ESMTPSA id j7sm3623767pjf.41.2021.11.16.19.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 19:30:08 -0800 (PST)
Date: Tue, 16 Nov 2021 19:30:06 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 12/13] sysctl: add helper to register empty subdir
Message-ID: <20211117033006.qct3ve3tknfy3xy7@garbanzo>
References: <20200529074108.16928-1-mcgrof@kernel.org>
 <20200529074108.16928-13-mcgrof@kernel.org>
 <878shasxkp.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878shasxkp.fsf@x220.int.ebiederm.org>
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
 jani.nikula@linux.intel.com, julia.lawall@lip6.fr, viro@zeniv.linux.org.uk,
 rodrigo.vivi@intel.com, nixiaoming@huawei.com, vbabka@suse.cz, axboe@kernel.dk,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 08:03:02AM -0500, Eric W. Biederman wrote:
> Luis Chamberlain <mcgrof@kernel.org> writes:
> 
> > The way to create a subdirectory from the base set of directories
> > is a bit obscure, so provide a helper which makes this clear, and
> > also helps remove boiler plate code required to do this work.
> 
> I agreee calling:
> register_sysctl("fs/binfmt_misc", sysctl_mount_point)
> is a bit obscure but if you are going to make a wrapper
> please make it the trivial one liner above.
> 
> Say something that looks like:
> 	struct sysctl_header *register_sysctl_mount_point(const char *path)
>         {
>         	return register_sysctl(path, sysctl_mount_point);
>         }
> 
> And yes please talk about a mount point and not an empty dir, as these
> are permanently empty directories to serve as mount points.  There are
> some subtle but important permission checks this allows in the case of
> unprivileged mounts.
> 
> Further code like this belong in proc_sysctl.c next to all of the code
> it is related to so that it is easier to see how to refactor the code if
> necessary.

Alrighty, it's been a while since this kernel/sysctl.c kitchen sink
cleanup... so it's time to respin this now that the merge window is
open.  I already rebased patches, addressed all input and now just
waiting to fix any compilation errors.  I'm going to split the patches
up into real small sets so to ensure we just get this through becauase
getting this in otherwise is going to be hard.

I'd appreciate folk's review once the patches start going out. I think
a hard part will be deciding what tree this should got through.

  Luis
