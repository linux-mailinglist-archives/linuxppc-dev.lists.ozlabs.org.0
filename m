Return-Path: <linuxppc-dev+bounces-8516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0966AB3915
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:28:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0mJ4cwqz2yrL;
	Mon, 12 May 2025 23:28:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747056496;
	cv=none; b=cWGVok2rRIhGLuNNFdUbuPIDPmfYeHL+GXFIKBWPfAtJQNy2rSUny1kOpgPQIMDr2Mqtq35fyqFCeQT3mQkh0HY4RJTE4PycfKbn2yj1LWoPv6Woe03POujKXESIqiAwMb7T0dsuKadzhqkNilgTyQFaauiRxM5DM03IH7pSeOHxz4RfaLLCbPN368Rk6JrkIqg8S/Tq7Es0qzgFq/K2KD7XD5wvzlG1ZRe6G0qPkiYQ48QLz22CFZtMVfsdqoteD92jYrAXogFvdAbE2Z+Wd+KhMPTIRY9MrcbDc1XoWO0WjED60LNCEamKjlDC+qO1Sd68xG8ikUP7w/ZQxXBzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747056496; c=relaxed/relaxed;
	bh=hcnvSuplSyay+P2opMqH32jrlib56+gcaC7o9TzxSEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L6nhjaU8k+RP+ASoO0iHn6IbDFUL+f10KHv0At/8ONlZnqxY57IqfZ6g5MW5rUapxyBbcm4UnKOilFW7hmZLonDP2xpdOSqA3uzDcfwVHdetvpxJpNKTtAV0sxyG2bYFHJ/l7ju1kUEvhR6T8NkxEbfI2O700cTd0oLhBBWYMYYaUpgTNS3oy1DuYfV/aeH3fpqo3YdfmwfbdVclKY1aqGVE1ykgWwyzotzzPyFdQU5piErD9heRqPeroNMvAjScSuc6jftS5+xJRuxgd1HNlTe/W6G6XC5xX/prOXkjsSaCFdWdf5jj+B2HyJ3fiiInNZ9Z+06cM+pMesexr+w4gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JSszf/sP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JSszf/sP; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JSszf/sP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JSszf/sP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0mH4ydYz2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:28:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hcnvSuplSyay+P2opMqH32jrlib56+gcaC7o9TzxSEk=;
	b=JSszf/sPnNZxBnADfn/R8p1c6vPBDbKXr49oUeE0SfqiHX4nHa1vEdTQbFhc9cD6xsKsOc
	EG14TUVZ3/CaIGoLnrbLHXrxQ/YgP9n3tCvnuhD0tnFllyAOL7XpXDLy/szQHAdmaIsWKF
	P0+pZiyKT3RwLkkDNAhfBWwy1aprGQw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hcnvSuplSyay+P2opMqH32jrlib56+gcaC7o9TzxSEk=;
	b=JSszf/sPnNZxBnADfn/R8p1c6vPBDbKXr49oUeE0SfqiHX4nHa1vEdTQbFhc9cD6xsKsOc
	EG14TUVZ3/CaIGoLnrbLHXrxQ/YgP9n3tCvnuhD0tnFllyAOL7XpXDLy/szQHAdmaIsWKF
	P0+pZiyKT3RwLkkDNAhfBWwy1aprGQw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-AJ8-owPwNxGa_0S6uPR4cg-1; Mon, 12 May 2025 09:28:11 -0400
X-MC-Unique: AJ8-owPwNxGa_0S6uPR4cg-1
X-Mimecast-MFC-AGG-ID: AJ8-owPwNxGa_0S6uPR4cg_1747056490
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acbbb00099eso414965966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056490; x=1747661290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcnvSuplSyay+P2opMqH32jrlib56+gcaC7o9TzxSEk=;
        b=e9qoAOVPpcHu9uHfnwa2cq+tQ6cQ3Pfqthc+WuGQiXLYgXfj/DbgdYUWLltALRSYgn
         PpAuUHAA6Py7UOgVRlPeF5ZQzpe1uwGjMqomEuLptMmdy18t4q2x+Eye5vConlrQRZfB
         QVRe05DEs5YGb4u6OCiAkR+3GRJovB56mIL0D8jtItuBswHK9gmNdRAflhAUlHYIwz/4
         mb2bAOZZeDNgrUFJJeRXuwoKmuRtGikjpqXLkl7X1Ag+jnlZPPlzIOLwHwPLjkK5njmT
         tlPiY3z5PmeT/CMwi28x5cEiYWWIQX/upP4J9nHmZmwC/qj0PRFNWrMdlGj2f/yJqT5t
         dBDg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Kxo2dcx+Z+9NFLTOVWrQYLDsdE35EzF4SlDfn+KWW26J7orqUTDpNTARZBKNSsxhaqHlbJ9K/IgtAc4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEtiu7qKNFX8SWUXuH7u4gj52Pg8xstzX+OK6Ur0rSV7QcoCTR
	AjKxuEsPhnEJ8S5C7pwPFWst9FaqegU8VhHJEiA7NSgRoBDuV22Nqjp6YSrVC9TbigvIr+HKNP4
	3y7SM77UhBQ9T2V3y2HaD5Ky8MnP2SnprxHeAWUTM58z3Tlr7GpSKfGhc3kC9Jg==
X-Gm-Gg: ASbGncuiCMCoQxrJ0NGgOYeuePOEuR5jASvBKL9nwX3scTYBRBzK1NohL2lZQR20Z3o
	DpoWrSmxUcX+ZHnq6YFK84mIHPsNN/aA4AdEjOfo+Kf2imuFVpaDiVdZ+lz0HmNaE6stu29DTOd
	w1nrAM+ZhEaFKLFzDyYJtx23mNUNsN7S6gn6YnAuUi9smiFIz/pIKkdphmuv5JvU4UVUleEn4P4
	RggfeHY+lNNE9nVHUH0WLuvgNAJB81RNcMUyKwZ5fKwNcAgWljBcoWQUy6vXK6t4rpmcjpiKaCS
	WlHqIFuNqHzK+wqC8g0Esztgsket5mj31o8qMJFg
X-Received: by 2002:a05:6402:3587:b0:5fb:ad3c:d0c0 with SMTP id 4fb4d7f45d1cf-5fca073083emr11051348a12.1.1747056490106;
        Mon, 12 May 2025 06:28:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/W3zfYCJV6dhk/YZKJFqJ9p8o4bGVFJt+zvzzr59oo3YaKk/Q+HsESIm+YNLNDtoLhaP3/g==
X-Received: by 2002:a05:6402:3587:b0:5fb:ad3c:d0c0 with SMTP id 4fb4d7f45d1cf-5fca073083emr11051305a12.1.1747056489536;
        Mon, 12 May 2025 06:28:09 -0700 (PDT)
Received: from thinky (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc2633bsm5791532a12.20.2025.05.12.06.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:28:09 -0700 (PDT)
Date: Mon, 12 May 2025 15:28:05 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 5/7] fs: make vfs_fileattr_[get|set] return -EOPNOSUPP
Message-ID: <ayokvlxinxeoehids35l62ollqdwvai7jorefi7s4k263vvztp@hdfwbsmmfdba>
References: <20250512-xattrat-syscall-v5-0-ffbc7c477332@kernel.org>
 <20250512-xattrat-syscall-v5-5-ffbc7c477332@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20250512-xattrat-syscall-v5-5-ffbc7c477332@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aVJRqB8Z-oOxXizeh28WBwgnvPvLDs-NnYPCUGUPAGg_1747056490
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-12 15:22:52, Andrey Albershteyn wrote:
> Future patches will add new syscalls which use these functions. As
> this interface won't be used for ioctls only the EOPNOSUPP is more
> appropriate return code.
> 
> This patch coverts return code from ENOIOCTLCMD to EOPNOSUPP for
> vfs_fileattr_get and vfs_fileattr_set. To save old behavior
> translate EOPNOSUPP back for current users - overlayfs, encryptfs
> and fs/ioctl.c.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/ecryptfs/inode.c  |  8 +++++++-
>  fs/file_attr.c       | 12 ++++++++++--
>  fs/overlayfs/inode.c |  2 +-
>  3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
> index 51a5c54eb740..6bf08ff4d7f7 100644
> --- a/fs/ecryptfs/inode.c
> +++ b/fs/ecryptfs/inode.c
> @@ -1124,7 +1124,13 @@ static int ecryptfs_removexattr(struct dentry *dentry, struct inode *inode,
>  
>  static int ecryptfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>  {
> -	return vfs_fileattr_get(ecryptfs_dentry_to_lower(dentry), fa);
> +	int rc;
> +
> +	rc = vfs_fileattr_get(ecryptfs_dentry_to_lower(dentry), fa);
> +	if (rc == -EOPNOTSUPP)
> +		rc = -ENOIOCTLCMD;
> +
> +	return rc;
>  }
>  
>  static int ecryptfs_fileattr_set(struct mnt_idmap *idmap,
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index d9eab553dc25..d696f440fa4f 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -79,7 +79,7 @@ int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>  	int error;
>  
>  	if (!inode->i_op->fileattr_get)
> -		return -ENOIOCTLCMD;
> +		return -EOPNOTSUPP;
>  
>  	error = security_inode_file_getattr(dentry, fa);
>  	if (error)
> @@ -239,7 +239,7 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>  	int err;
>  
>  	if (!inode->i_op->fileattr_set)
> -		return -ENOIOCTLCMD;
> +		return -EOPNOTSUPP;
>  
>  	if (!inode_owner_or_capable(idmap, inode))
>  		return -EPERM;
> @@ -281,6 +281,8 @@ int ioctl_getflags(struct file *file, unsigned int __user *argp)
>  	int err;
>  
>  	err = vfs_fileattr_get(file->f_path.dentry, &fa);
> +	if (err == -EOPNOTSUPP)
> +		err = -ENOIOCTLCMD;
>  	if (!err)
>  		err = put_user(fa.flags, argp);
>  	return err;
> @@ -302,6 +304,8 @@ int ioctl_setflags(struct file *file, unsigned int __user *argp)
>  			fileattr_fill_flags(&fa, flags);
>  			err = vfs_fileattr_set(idmap, dentry, &fa);
>  			mnt_drop_write_file(file);
> +			if (err == -EOPNOTSUPP)
> +				err = -ENOIOCTLCMD;
>  		}
>  	}
>  	return err;
> @@ -314,6 +318,8 @@ int ioctl_fsgetxattr(struct file *file, void __user *argp)
>  	int err;
>  
>  	err = vfs_fileattr_get(file->f_path.dentry, &fa);
> +	if (err == -EOPNOTSUPP)
> +		err = -ENOIOCTLCMD;
>  	if (!err)
>  		err = copy_fsxattr_to_user(&fa, argp);
>  
> @@ -334,6 +340,8 @@ int ioctl_fssetxattr(struct file *file, void __user *argp)
>  		if (!err) {
>  			err = vfs_fileattr_set(idmap, dentry, &fa);
>  			mnt_drop_write_file(file);
> +			if (err == -EOPNOTSUPP)
> +				err = -ENOIOCTLCMD;
>  		}
>  	}
>  	return err;
> diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
> index 6f0e15f86c21..096d44712bb1 100644
> --- a/fs/overlayfs/inode.c
> +++ b/fs/overlayfs/inode.c
> @@ -721,7 +721,7 @@ int ovl_real_fileattr_get(const struct path *realpath, struct fileattr *fa)
>  		return err;
>  
>  	err = vfs_fileattr_get(realpath->dentry, fa);
> -	if (err == -ENOIOCTLCMD)
> +	if (err == -EOPNOTSUPP)
>  		err = -ENOTTY;
>  	return err;
>  }
> 
> -- 
> 2.47.2
> 
> 
> -- 
> - Andrey

Ignore please, sorry, wrong in-reply-to

-- 
- Andrey


