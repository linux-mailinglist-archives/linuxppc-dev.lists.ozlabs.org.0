Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF291ABB11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:23:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492sgc1nPtzDrK0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.194;
 helo=mail-pg1-f194.google.com; envelope-from=mcgrof@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492qSv25nVzDqvy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 16:44:10 +1000 (AEST)
Received: by mail-pg1-f194.google.com with SMTP id n16so1184421pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 23:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eihWpoiPluNClprWA5IrbR8QX54DG9JK4Pz3fjQ6jyU=;
 b=toiqgrE4HsT0d3Nm9iwrWt5/VIiA6xV4QcmBpvXVqoP5Fknl+FTYH3W3EmbF98YlhH
 OZ5TBYZt6oelYHIbv8NpBbdqvAcZcGy3cK9aH/wxSQiCI/WUaPyAES/vLRiZL3r3v3oZ
 Ehfz0/ngrjQpaEiC80RkC0lbt+6l/p7ouoJgDFWv/EUIZNARNLn+FFrH9cYRBjMQy90K
 Q+fh5mv/Q0NGVfCL6OFzDjD3awqB95T+kv2scz9p5vC9ZZppc3AYoGk1Q1zSxze4Atgh
 wj2W9w4bY34NYbd25sx/I4APDaSfOhgAQziLt7DuGlLZ9J0EeRu1jjNPJAz12oJnUDxY
 0bAQ==
X-Gm-Message-State: AGi0PuY6+wUL5CQT64/7L0WFMHQciEF7636vEKCnCPtirhNlvXlBNsQg
 3xT+Bki+Ml4tlcjTNdYkjGE=
X-Google-Smtp-Source: APiQypKU4BlzlMTwCZuRiYybUlVtNoxZaoUABDWWVme+WqLsgGvZg5mtQywjuvphRIQcwraiu04gQg==
X-Received: by 2002:a63:6604:: with SMTP id a4mr28659379pgc.381.1587019447416; 
 Wed, 15 Apr 2020 23:44:07 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id ml24sm1413754pjb.48.2020.04.15.23.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 23:44:05 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 4F61640277; Thu, 16 Apr 2020 06:44:05 +0000 (UTC)
Date: Thu, 16 Apr 2020 06:44:05 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Goldwyn Rodrigues <goldwynr@gmail.com>
Subject: Re: [PATCH 1/8] apparmor: just use vfs_kern_mount to make .null
Message-ID: <20200416064405.GP11244@42.do-not-panic.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414124304.4470-2-eesposit@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 16 Apr 2020 18:10:13 +1000
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, oprofile-list@lists.sf.net,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, Iurii Zaikin <yzaikin@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 02:42:55PM +0200, Emanuele Giuseppe Esposito wrote:
> aa_mk_null_file is using simple_pin_fs/simple_release_fs with local
> variables as arguments, for what would amount to a simple
> vfs_kern_mount/mntput pair if everything was inlined.  Just use
> the normal filesystem API since the reference counting is not needed
> here.

*Why* is refcounting not needed here?

   Luis

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  security/apparmor/apparmorfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 280741fc0f5f..828bb1eb77ea 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -2525,14 +2525,14 @@ struct path aa_null;
>  
>  static int aa_mk_null_file(struct dentry *parent)
>  {
> -	struct vfsmount *mount = NULL;
> +	struct file_system_type *type = parent->d_sb->s_type;
> +	struct vfsmount *mount;
>  	struct dentry *dentry;
>  	struct inode *inode;
> -	int count = 0;
> -	int error = simple_pin_fs(parent->d_sb->s_type, &mount, &count);
>  
> -	if (error)
> -		return error;
> +	mount = vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
> +	if (IS_ERR(mount))
> +		return PTR_ERR(mount);
>  
>  	inode_lock(d_inode(parent));
>  	dentry = lookup_one_len(NULL_FILE_NAME, parent, strlen(NULL_FILE_NAME));
> @@ -2561,7 +2561,7 @@ static int aa_mk_null_file(struct dentry *parent)
>  	dput(dentry);
>  out:
>  	inode_unlock(d_inode(parent));
> -	simple_release_fs(&mount, &count);
> +	mntput(mount);
>  	return error;
>  }
>  
> -- 
> 2.25.2
> 
