Return-Path: <linuxppc-dev+bounces-6426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32EA42729
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 17:00:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1lnL6Zkxz304x;
	Tue, 25 Feb 2025 03:00:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740412822;
	cv=none; b=auu72Rzm6oDhWPkI0UMZuVJ2Lf8xJXPLVK7tzv2EqQ0tUgakZdpVZuas4TN8pARNr01ZIttFZe40tcupDYxkMq+VNMEqm/uSfCkPzqC3yM288owa5n1NarGdS3DM7gTSUBKZUZeztsHzWD9xsso0wabsS00kF6TBLAWgLIY5GJt6TMfkzM2u8Ja0xfQjIe59Om0tHwALSXKW78AST2RiufnZFFx5mOaGF6aeve0oZc/5nXQq5tct6vEKiPI4V/Ze7A6YrWaw+zW5cbdkNIWf5lxZWGJEFFakPNDGmo3WfR/zTn9fpOaHDcFZ8Orgqh0cluMmdL/jsM/0pyHbnyIy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740412822; c=relaxed/relaxed;
	bh=gpJsnx/DlFS+m2+wC+CtveEzavYNI09p8+P4b7TZQL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nt2fsbPVtz1qETtMO2gkkBpbFncXeB908fbGOd67JJ7tO9cUEy08iS5ZaoVeR3VqFnxVVxkcdP6XqRL1r7LmiIlbBchoPJHNPEf1MRvGkTfjXq5CbYvUmE6Z2tyN64b7b4u39W/qoaJxyxn4/ffaLF57dn5IUabWYgkWd9kw790sO5bPk5KP9ckj26qeifWOgcrVCaJOlEMgdKFiUppFNCSWSpr/GVNJ0ej50/kqM+li7o9IKOzMY4gFDmn9ap/RVUM4F9rb+m+ElnDAhD7Hr3a4C7MoQZGbXMjwwzb5dYyh4Nm0kdfGAGrHUWXhXrcRY6TqAOFQx7FcRPs3Z5+7uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=itoLOEfA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=itoLOEfA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=itoLOEfA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=itoLOEfA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1lnJ6nFKz2ykT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 03:00:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740412814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpJsnx/DlFS+m2+wC+CtveEzavYNI09p8+P4b7TZQL4=;
	b=itoLOEfAF8YA+8RQ4sqlqtDqdwkiWEFVrZLg9UcKWEW10rJ6+TLME/D+kS0YWO6e8UGmy3
	4EEgA4GLLFH8YGyG2LhjAjC21Jbn5VBk2K3/TkWgfvzRIqoDsFSNPqtav5FoDhub6XEYpM
	T742BRJdbjAWpm5e28hz5WfIHVtknUs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740412814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpJsnx/DlFS+m2+wC+CtveEzavYNI09p8+P4b7TZQL4=;
	b=itoLOEfAF8YA+8RQ4sqlqtDqdwkiWEFVrZLg9UcKWEW10rJ6+TLME/D+kS0YWO6e8UGmy3
	4EEgA4GLLFH8YGyG2LhjAjC21Jbn5VBk2K3/TkWgfvzRIqoDsFSNPqtav5FoDhub6XEYpM
	T742BRJdbjAWpm5e28hz5WfIHVtknUs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-qi1hWTqtMxS9rESmNrMyBQ-1; Mon, 24 Feb 2025 11:00:10 -0500
X-MC-Unique: qi1hWTqtMxS9rESmNrMyBQ-1
X-Mimecast-MFC-AGG-ID: qi1hWTqtMxS9rESmNrMyBQ_1740412809
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f2f438fb6so5133659f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 08:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740412809; x=1741017609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpJsnx/DlFS+m2+wC+CtveEzavYNI09p8+P4b7TZQL4=;
        b=HcRL8/aquDUa0xFeMfVMNoU3CHUyKnBIN5tJb0vKH4GYL2LncbXyC7yL5jivyrV/rV
         4HSZHpLPx10Mn31ccP7FamUs/Xk9XmTDvAtywJFPAV/ARdiz0ZEQ5vbhMV/LyTf4nqAj
         8+c1y14ezTKE2zuAS9fCdc2z+rwZcLtUrIedJDJoO+9K6Bq16ZfZsOmS+xRFqDZi+IzZ
         PflgpeXgHu60oN5ATq6JulN756YZJGJ/R5LoufE7yyI9KktRV6LcSpRX0itiZwbFa60E
         Z/bdkyPZ0Gg1WO8qPUqF9JMT9RRoNFajqg4GWWSkRrwdHYzNOxgPc7aiD3PRyW9lZ1+h
         TWmA==
X-Forwarded-Encrypted: i=1; AJvYcCWsyU4yhmIzj2NLMm++6ZcALGMblDkODgjsiSEtcKtRmb46CcZLIb8YeCn6KhomyWZGigiVuSUfW6Ms/5I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxfra+SOdciDMxkFY35kJdtDLTwOugWldanDwtPJXWCZKqWDCQ4
	jXKjuMeDZYu9RHs8DWea/MXJr6ufVsOXSY0xLnX6jZsSlsgmcwt6zhokhiTxV7p0h8bFJFt4hLo
	woBCftzJT/bDwUW5z1LTkM73hTRTnv6k2E3OptldE3V17llr3dPmWA5bDHBXlOg==
X-Gm-Gg: ASbGncucSEWuEtgw6AfYbyU+FAYaCe/9mCWnxBLI+jbCWxdAot0pZ51LYz71dkTHNkE
	PgLLbLOLiaN5gPE4UkT5kR4lAvTMoHXR/5XSRiNg3cNtGfCSnX8jFRgEx2vGi6K9dYrf8o9R7xd
	xY5fErOFqmevdjoXXtB7TfgyYg0dGL2VU93AQAd0JbRKy7WTBFhiizCgPAZVbgB/NpnvSqYbjA2
	wt6+WGEnyG3pSgSdMxOmM1liPNhDIo5qDhkBkAEnp5dY5tDXxoFxD/axdHJctOb+qArX9pxHP4R
	n9NtTswqxTBHLmrfbAkDdrP0kROZNVRBIiw=
X-Received: by 2002:a05:6000:1fa1:b0:38f:4cdc:5d21 with SMTP id ffacd0b85a97d-38f6e97a9dcmr12224826f8f.24.1740412809233;
        Mon, 24 Feb 2025 08:00:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRB2XHSy5TyYjE+T5i1FHBWJzQQ+oKxvmCxdX7G981Poru458aCvgYJqnx5VUZ7SWREA2qKg==
X-Received: by 2002:a05:6000:1fa1:b0:38f:4cdc:5d21 with SMTP id ffacd0b85a97d-38f6e97a9dcmr12224740f8f.24.1740412808720;
        Mon, 24 Feb 2025 08:00:08 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbab9e9863sm1469799966b.64.2025.02.24.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:00:08 -0800 (PST)
Date: Mon, 24 Feb 2025 17:00:06 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <jvo6uj7ro5czlo5ukw3vtf5mpqgrbuksqq4j63s2i6gwrjpz4m@kghpcqyi7gwb>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221.ahB8jei2Chie@digikod.net>
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
MIME-Version: 1.0
In-Reply-To: <20250221.ahB8jei2Chie@digikod.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E9TGbaWsPRPv_BK6_vt-M3UsFqQpbkcclGO5ZfyZks0_1740412809
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-02-21 16:08:33, Mickaël Salaün wrote:
> It looks security checks are missing.  With IOCTL commands, file
> permissions are checked at open time, but with these syscalls the path
> is only resolved but no specific access seems to be checked (except
> inode_owner_or_capable via vfs_fileattr_set).
> 
> On Tue, Feb 11, 2025 at 06:22:47PM +0100, Andrey Albershteyn wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > extended attributes/flags. The syscalls take parent directory fd and
> > path to the child together with struct fsxattr.
> > 
> > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > that file don't need to be open as we can reference it with a path
> > instead of fd. By having this we can manipulated inode extended
> > attributes not only on regular files but also on special ones. This
> > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > we can not call ioctl() directly on the filesystem inode using fd.
> > 
> > This patch adds two new syscalls which allows userspace to get/set
> > extended inode attributes on special files by using parent directory
> > and a path - *at() like syscall.
> > 
> > Also, as vfs_fileattr_set() is now will be called on special files
> > too, let's forbid any other attributes except projid and nextents
> > (symlink can have an extent).
> > 
> > CC: linux-api@vger.kernel.org
> > CC: linux-fsdevel@vger.kernel.org
> > CC: linux-xfs@vger.kernel.org
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> > v1:
> > https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/
> > 
> > Previous discussion:
> > https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/
> > 
> > XFS has project quotas which could be attached to a directory. All
> > new inodes in these directories inherit project ID set on parent
> > directory.
> > 
> > The project is created from userspace by opening and calling
> > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > with empty project ID. Those inodes then are not shown in the quota
> > accounting but still exist in the directory. Moreover, in the case
> > when special files are created in the directory with already
> > existing project quota, these inode inherit extended attributes.
> > This than leaves them with these attributes without the possibility
> > to clear them out. This, in turn, prevents userspace from
> > re-creating quota project on these existing files.
> > ---
> > Changes in v3:
> > - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> > - Remove unnecessary "same filesystem" check
> > - Use CLASS() instead of directly calling fdget/fdput
> > - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org
> > ---
> >  arch/alpha/kernel/syscalls/syscall.tbl      |  2 +
> >  arch/arm/tools/syscall.tbl                  |  2 +
> >  arch/arm64/tools/syscall_32.tbl             |  2 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       |  2 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl |  2 +
> >  arch/mips/kernel/syscalls/syscall_n32.tbl   |  2 +
> >  arch/mips/kernel/syscalls/syscall_n64.tbl   |  2 +
> >  arch/mips/kernel/syscalls/syscall_o32.tbl   |  2 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     |  2 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    |  2 +
> >  arch/s390/kernel/syscalls/syscall.tbl       |  2 +
> >  arch/sh/kernel/syscalls/syscall.tbl         |  2 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      |  2 +
> >  arch/x86/entry/syscalls/syscall_32.tbl      |  2 +
> >  arch/x86/entry/syscalls/syscall_64.tbl      |  2 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     |  2 +
> >  fs/inode.c                                  | 75 +++++++++++++++++++++++++++++
> >  fs/ioctl.c                                  | 16 +++++-
> >  include/linux/fileattr.h                    |  1 +
> >  include/linux/syscalls.h                    |  4 ++
> >  include/uapi/asm-generic/unistd.h           |  8 ++-
> >  21 files changed, 133 insertions(+), 3 deletions(-)
> > 
> 
> [...]
> 
> > diff --git a/fs/inode.c b/fs/inode.c
> > index 6b4c77268fc0ecace4ac78a9ca777fbffc277f4a..b2dddd9db4fabaf67a6cbf541a86978b290411ec 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -23,6 +23,9 @@
> >  #include <linux/rw_hint.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/debugfs.h>
> > +#include <linux/syscalls.h>
> > +#include <linux/fileattr.h>
> > +#include <linux/namei.h>
> >  #include <trace/events/writeback.h>
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/timestamp.h>
> > @@ -2953,3 +2956,75 @@ umode_t mode_strip_sgid(struct mnt_idmap *idmap,
> >  	return mode & ~S_ISGID;
> >  }
> >  EXPORT_SYMBOL(mode_strip_sgid);
> > +
> > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > +		struct fsxattr __user *, fsx, unsigned int, at_flags)
> > +{
> > +	CLASS(fd, dir)(dfd);
> > +	struct fileattr fa;
> > +	struct path filepath;
> > +	int error;
> > +	unsigned int lookup_flags = 0;
> > +
> > +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > +		return -EINVAL;
> > +
> > +	if (at_flags & AT_SYMLINK_FOLLOW)
> > +		lookup_flags |= LOOKUP_FOLLOW;
> > +
> > +	if (at_flags & AT_EMPTY_PATH)
> > +		lookup_flags |= LOOKUP_EMPTY;
> > +
> > +	if (fd_empty(dir))
> > +		return -EBADF;
> > +
> > +	error = user_path_at(dfd, filename, lookup_flags, &filepath);
> > +	if (error)
> > +		return error;
> 
> security_inode_getattr() should probably be called here.
> 
> > +
> > +	error = vfs_fileattr_get(filepath.dentry, &fa);
> > +	if (!error)
> > +		error = copy_fsxattr_to_user(&fa, fsx);
> > +
> > +	path_put(&filepath);
> > +	return error;
> > +}
> > +
> > +SYSCALL_DEFINE4(setfsxattrat, int, dfd, const char __user *, filename,
> > +		struct fsxattr __user *, fsx, unsigned int, at_flags)
> > +{
> > +	CLASS(fd, dir)(dfd);
> > +	struct fileattr fa;
> > +	struct path filepath;
> > +	int error;
> > +	unsigned int lookup_flags = 0;
> > +
> > +	if ((at_flags & ~(AT_SYMLINK_FOLLOW | AT_EMPTY_PATH)) != 0)
> > +		return -EINVAL;
> > +
> > +	if (at_flags & AT_SYMLINK_FOLLOW)
> > +		lookup_flags |= LOOKUP_FOLLOW;
> > +
> > +	if (at_flags & AT_EMPTY_PATH)
> > +		lookup_flags |= LOOKUP_EMPTY;
> > +
> > +	if (fd_empty(dir))
> > +		return -EBADF;
> > +
> > +	if (copy_fsxattr_from_user(&fa, fsx))
> > +		return -EFAULT;
> > +
> > +	error = user_path_at(dfd, filename, lookup_flags, &filepath);
> > +	if (error)
> > +		return error;
> > +
> > +	error = mnt_want_write(filepath.mnt);
> > +	if (!error) {
> 
> security_inode_setattr() should probably be called too.

Aren't those checks for something different - inode attributes
ATTR_*?
(sorry, the naming can't be more confusing)

Looking into security_inode_setattr() it seems to expect struct
iattr, which works with inode attributes (mode, time, uid/gid...).
These new syscalls work with filesystem inode extended flags/attributes
FS_XFLAG_* in fsxattr->fsx_xflags. Let me know if I missing
something here

-- 
- Andrey


