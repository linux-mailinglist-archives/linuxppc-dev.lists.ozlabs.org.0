Return-Path: <linuxppc-dev+bounces-7996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12EA9D054
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 20:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkgzR3pJbz2xl6;
	Sat, 26 Apr 2025 04:17:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745605027;
	cv=none; b=VylhbvyqWITcllRHYB5O4St5VgSWY0FwDv/OEch9y9+i8bjSzZGnDF69dmmokdOJML2W/bzOTzGA2C4Hx57dpRcUcrr61CeGsSJKhWf8/hu5JRhihjKWzNQohQ/OEjbje4RS+SSSA3eki0MgZFmdrMi45/fHfEfyBJ7qpJeAl/CRindVa/QLxTEJB7UafDBpXUbLf0UbIM9ORPmdY9Q7Up3nB4t9V0XlWy0TNhSba8sa856Z2L5p/SX248rHm8wUgos+c9smrTm9givMGSiXeqk1N5IpI8lSV935LT3A2xBaER44Le4/7tKUBb/NhghvhZRpMdHw1ggYFn/6+8qntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745605027; c=relaxed/relaxed;
	bh=3/H3vr0OCdDcR3s3PDhlvbwdaoTNbpfjoBVpx9IMnBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=if2mhjcqmmOLOKBdJ58Unf3b4moXiqrxkeL2nEQvNmLqSD+cd2FhlbOHp7zLOad2TLD/g+0mgpfgYha0x0LJ91mylE6uLDefNAXZ5uxxKgAjiZCRj7MVkD9l1cllughXJJq27Vq+Nsnn2ol60liAMhp51p6v7saCfynRdn4Tk6Rg8uirV7hpa5tuvPIbNIeOUJtMtn3O5lnpeWpb3cavOI7omxChW4pkFKjQ6hi3DBr4STP+rcRMN3A7dGL2jntT36RkdsdUFhUc39klRRNkS7HWLncT5ikQO92J2k3T3bv4A+2iAAwwMLbggQ+6qV/XhZkhZGybp/CwuMiKJ6VhWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eu41pvHa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eu41pvHa; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eu41pvHa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eu41pvHa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkgzP73LTz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 04:17:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745605019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/H3vr0OCdDcR3s3PDhlvbwdaoTNbpfjoBVpx9IMnBk=;
	b=Eu41pvHaDdJYI1lLa2xmhnIOjHjuXo1wt+FiqaCGOB4V6/EIfrXhWE/KRLsI/AM842J6z5
	/pH4OEwUDR5lkRn6bThG9+jWPb1INm4ULI1+FpKawJ9Ak1k/5WgKoAZvCZMhNXMCy2wosc
	9e55Ryy54AZIBXlQmWVYRc3y9yFnoWI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745605019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/H3vr0OCdDcR3s3PDhlvbwdaoTNbpfjoBVpx9IMnBk=;
	b=Eu41pvHaDdJYI1lLa2xmhnIOjHjuXo1wt+FiqaCGOB4V6/EIfrXhWE/KRLsI/AM842J6z5
	/pH4OEwUDR5lkRn6bThG9+jWPb1INm4ULI1+FpKawJ9Ak1k/5WgKoAZvCZMhNXMCy2wosc
	9e55Ryy54AZIBXlQmWVYRc3y9yFnoWI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-aodAv8xON_-e9gnnprheRw-1; Fri, 25 Apr 2025 14:16:55 -0400
X-MC-Unique: aodAv8xON_-e9gnnprheRw-1
X-Mimecast-MFC-AGG-ID: aodAv8xON_-e9gnnprheRw_1745605014
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6caf952d7so253774266b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 11:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745605014; x=1746209814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/H3vr0OCdDcR3s3PDhlvbwdaoTNbpfjoBVpx9IMnBk=;
        b=OvD60iIo6lLNX1biu6xNzt+hbDtj4LkqHGeDZYnpc3gW32sadHSTqpfCbaMkQlhN/s
         ars2GBmNCdgBXMtnF4kRqXOl88WkT6rxHAqTCpzEvan95y0EeSZp0sIusaFzBeGo9dEk
         oeDNiW/PtB9JrwmzGDOgMGPRSfxWi3fZP3O/bfU7IXoSCCs4WNixFH75+Ta0IHEbhHR3
         JrdUQv3DF1VoCO+xDbObSvLe21kRa7zvtCcnwbrFDwxEnSp0+e8HPdu91JfjGisjqF1w
         ZQ1bQ/VqR6C3588WHbgl8bZMGUSDs7vztsHtsxVgn+5SOtlQNvnNx64CjLrkY6dELb0T
         Mmpw==
X-Forwarded-Encrypted: i=1; AJvYcCVHmGJwE48MkQVPPgHYmFJkrbDWplJd5buGVzUxI/7G/fZyJlmsxaJDtyJKKWzB3O2icnxR14Z7vUgH1R4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+K9yRdM3movR+Abv748ZFg3/tR66zGbIJM+kAF12TGqwM1Zih
	rXIXYMvNlbmlyhglKDBayobWx8X1Fmglv2UxN19+btTg1Xk/YCGMg54hPVPK9JYiZgfw3pMa/RZ
	+QFHZuahig2HNeqFG5ACMJb/qNm8d7JYhPBv1JoE6so7YVwLv0iUePnCIQ8PlJQ==
X-Gm-Gg: ASbGnctvtOXwphCPITjgShxzeM168XFkqi5uj7MLT/8eFY6piAULxriZv4fSYFygnZ9
	Ck+F3A7TiTNq7cOZ0cXoojKJU6ci2lzIEjdeMiK2jJeK0zVJywutpwFL/pXWl5LTqD8w1gxBZMv
	z5BJYHms5wl5+FwPQQ2zHgNgKu0vsIlZg3dTyMC69FuAGvH8lsutE8Ktm+GPWIi8pmnFrRegbLg
	/kOH9nyo8Vxp4IG7z6yicjVeLQmKB+KpS/TEoHfAq7bBY6xtJTPYn6WZ7OAfodcdRfA3erW+/l5
	+omqntTbL2XWFVnCflOGaMXjt35j0pQ=
X-Received: by 2002:a17:907:720d:b0:ac7:eb12:dc69 with SMTP id a640c23a62f3a-ace7110bb7emr344211566b.28.1745605013811;
        Fri, 25 Apr 2025 11:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwZ2uBmoBZxtvmd2g+z9kEiApYvdSEco/tISBfW2KUfnlzh1cUwx+QqrN8Zv6maFk6XK8qg==
X-Received: by 2002:a17:907:720d:b0:ac7:eb12:dc69 with SMTP id a640c23a62f3a-ace7110bb7emr344205866b.28.1745605013200;
        Fri, 25 Apr 2025 11:16:53 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70606sm168961166b.160.2025.04.25.11.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:16:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:16:48 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, 
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
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <l33napyvz5fwbcdju4otllbu4zr6faaz6mufz652alpxnjjfvl@h7j4hu4uwqwv>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
 <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
 <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
 <CAOQ4uxjs=Gg-ocwx_fkzc0gxQ_dHx-P9EAgz5ZwbdbrxV0T_EA@mail.gmail.com>
 <20250422-suchen-filmpreis-3573a913457c@brauner>
 <20250422-gefressen-faucht-8ded2c9a5375@brauner>
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
In-Reply-To: <20250422-gefressen-faucht-8ded2c9a5375@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a6M-wsJYuKBASXgvMvIbxcT5JH9AV6AssFawb05CeAM_1745605014
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-22 17:14:10, Christian Brauner wrote:
> On Tue, Apr 22, 2025 at 04:31:29PM +0200, Christian Brauner wrote:
> > On Thu, Mar 27, 2025 at 12:39:28PM +0100, Amir Goldstein wrote:
> > > On Thu, Mar 27, 2025 at 10:33 AM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > >
> > > > On 2025-03-23 09:56:25, Amir Goldstein wrote:
> > > > > On Fri, Mar 21, 2025 at 8:49 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > > > >
> > > > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > > > >
> > > > > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > > > > extended attributes/flags. The syscalls take parent directory fd and
> > > > > > path to the child together with struct fsxattr.
> > > > > >
> > > > > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > > > > that file don't need to be open as we can reference it with a path
> > > > > > instead of fd. By having this we can manipulated inode extended
> > > > > > attributes not only on regular files but also on special ones. This
> > > > > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > > > > we can not call ioctl() directly on the filesystem inode using fd.
> > > > > >
> > > > > > This patch adds two new syscalls which allows userspace to get/set
> > > > > > extended inode attributes on special files by using parent directory
> > > > > > and a path - *at() like syscall.
> > > > > >
> > > > > > CC: linux-api@vger.kernel.org
> > > > > > CC: linux-fsdevel@vger.kernel.org
> > > > > > CC: linux-xfs@vger.kernel.org
> > > > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > > > > ---
> > > > > ...
> > > > > > +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> > > > > > +               struct fsxattr __user *, ufsx, size_t, usize,
> > > > > > +               unsigned int, at_flags)
> > > > > > +{
> > > > > > +       struct fileattr fa;
> > > > > > +       struct path filepath;
> > > > > > +       int error;
> > > > > > +       unsigned int lookup_flags = 0;
> > > > > > +       struct filename *name;
> > > > > > +       struct mnt_idmap *idmap;.
> > > > >
> > > > > > +       struct dentry *dentry;
> > > > > > +       struct vfsmount *mnt;
> > > > > > +       struct fsxattr fsx = {};
> > > > > > +
> > > > > > +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > > > > > +       BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> > > > > > +
> > > > > > +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > > +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > > > > > +               lookup_flags |= LOOKUP_FOLLOW;
> > > > > > +
> > > > > > +       if (at_flags & AT_EMPTY_PATH)
> > > > > > +               lookup_flags |= LOOKUP_EMPTY;
> > > > > > +
> > > > > > +       if (usize > PAGE_SIZE)
> > > > > > +               return -E2BIG;
> > > > > > +
> > > > > > +       if (usize < FSXATTR_SIZE_VER0)
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > > +       error = copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufsx, usize);
> > > > > > +       if (error)
> > > > > > +               return error;
> > > > > > +
> > > > > > +       fsxattr_to_fileattr(&fsx, &fa);
> > > > > > +
> > > > > > +       name = getname_maybe_null(filename, at_flags);
> > > > > > +       if (!name) {
> > > > > > +               CLASS(fd, f)(dfd);
> > > > > > +
> > > > > > +               if (fd_empty(f))
> > > > > > +                       return -EBADF;
> > > > > > +
> > > > > > +               idmap = file_mnt_idmap(fd_file(f));
> > > > > > +               dentry = file_dentry(fd_file(f));
> > > > > > +               mnt = fd_file(f)->f_path.mnt;
> > > > > > +       } else {
> > > > > > +               error = filename_lookup(dfd, name, lookup_flags, &filepath,
> > > > > > +                                       NULL);
> > > > > > +               if (error)
> > > > > > +                       return error;
> > > > > > +
> > > > > > +               idmap = mnt_idmap(filepath.mnt);
> > > > > > +               dentry = filepath.dentry;
> > > > > > +               mnt = filepath.mnt;
> > > > > > +       }
> > > > > > +
> > > > > > +       error = mnt_want_write(mnt);
> > > > > > +       if (!error) {
> > > > > > +               error = vfs_fileattr_set(idmap, dentry, &fa);
> > > > > > +               if (error == -ENOIOCTLCMD)
> > > > > > +                       error = -EOPNOTSUPP;
> > > > >
> > > > > This is awkward.
> > > > > vfs_fileattr_set() should return -EOPNOTSUPP.
> > > > > ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
> > > > > but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
> > > > > ioctl returns -EOPNOTSUPP.
> > > > >
> > > > > I don't think it is necessarily a bad idea to start returning
> > > > >  -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
> > > > > because that really reflects the fact that the ioctl is now implemented
> > > > > in vfs and not in the specific fs.
> > > > >
> > > > > and I think it would not be a bad idea at all to make that change
> > > > > together with the merge of the syscalls as a sort of hint to userspace
> > > > > that uses the ioctl, that the sycalls API exists.
> > > > >
> > > > > Thanks,
> > > > > Amir.
> > > > >
> > > >
> > > > Hmm, not sure what you're suggesting here. I see it as:
> > > > - get/setfsxattrat should return EOPNOTSUPP as it make more sense
> > > >   than ENOIOCTLCMD
> > > > - ioctl_setflags returns ENOIOCTLCMD which also expected
> > > >
> > > > Don't really see a reason to change what vfs_fileattr_set() returns
> > > > and then copying this if() to other places or start returning
> > > > EOPNOTSUPP.
> > > 
> > > ENOIOCTLCMD conceptually means that the ioctl command is unknown
> > > This is not the case since ->fileattr_[gs]et() became a vfs API
> > 
> > vfs_fileattr_{g,s}et() should not return ENOIOCTLCMD. Change the return
> > code to EOPNOTSUPP and then make EOPNOTSUPP be translated to ENOTTY on
> > on overlayfs and to ENOIOCTLCMD in ecryptfs and in fs/ioctl.c. This way
> > we get a clean VFS api while retaining current behavior. Amir can do his
> > cleanup based on that.
> 
> Also this get/set dance is not something new apis should do. It should
> be handled like setattr_prepare() or generic_fillattr() where the
> filesystem calls a VFS helper and that does all of this based on the
> current state of the inode instead of calling into the filesystem twice:
> 
> int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> 		     struct fileattr *fa)
> {
> <snip>
> 	inode_lock(inode);
> 	err = vfs_fileattr_get(dentry, &old_ma);
> 	if (!err) {
> 		/* initialize missing bits from old_ma */
> 		if (fa->flags_valid) {
> <snip>
> 		err = fileattr_set_prepare(inode, &old_ma, fa);
> 		if (!err && !security_inode_setfsxattr(inode, fa))
> 			err = inode->i_op->fileattr_set(idmap, dentry, fa);
> 

You mean something like this? (not all fs are done)

-- 

From 421445f054ccad3116d55ae22c8995a48bb753fd Mon Sep 17 00:00:00 2001
From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Fri, 25 Apr 2025 17:20:42 +0200
Subject: [PATCH] fs: push retrieval of fileattr down to filesystems

Currently, vfs_fileattr_set() calls twice to the file system. Firstly,
to retrieve current state of the inode extended attributes and secondly
to set the new ones.

This patch refactors this in a way that filesystem firstly gets current
inode attribute state and then calls VFS helper to verify them. This way
vfs_fileattr_set() will call filesystem just once.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/ext2/ioctl.c          |  9 ++++++
 fs/ext4/ioctl.c          |  9 ++++++
 fs/f2fs/file.c           | 12 +++++++-
 fs/file_attr.c           | 62 ++++++++++++++++++++++++----------------
 fs/gfs2/file.c           |  9 ++++++
 fs/hfsplus/inode.c       |  9 ++++++
 fs/jfs/ioctl.c           |  9 +++++-
 fs/ntfs3/file.c          | 12 +++++++-
 fs/orangefs/inode.c      |  9 ++++++
 fs/ubifs/ioctl.c         | 12 +++++++-
 fs/xfs/xfs_ioctl.c       |  6 ++++
 include/linux/fileattr.h |  2 ++
 mm/shmem.c               |  8 ++++++
 13 files changed, 140 insertions(+), 28 deletions(-)

diff --git a/fs/ext2/ioctl.c b/fs/ext2/ioctl.c
index 44e04484e570..3a45ed9c12b7 100644
--- a/fs/ext2/ioctl.c
+++ b/fs/ext2/ioctl.c
@@ -32,6 +32,15 @@ int ext2_fileattr_set(struct mnt_idmap *idmap,
 {
 	struct inode *inode = d_inode(dentry);
 	struct ext2_inode_info *ei = EXT2_I(inode);
+	struct fileattr cfa;
+	int err;
+
+	err = ext2_fileattr_get(dentry, &cfa);
+	if (err)
+		return err;
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index d17207386ead..f988ff4d7256 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1002,6 +1002,15 @@ int ext4_fileattr_set(struct mnt_idmap *idmap,
 	struct inode *inode = d_inode(dentry);
 	u32 flags = fa->flags;
 	int err = -EOPNOTSUPP;
+	struct fileattr cfa;
+
+	err = ext4_fileattr_get(dentry, &cfa);
+	if (err)
+		return err;
+
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
 
 	if (flags & ~EXT4_FL_USER_VISIBLE)
 		goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..f196a07f1f17 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3371,14 +3371,24 @@ int f2fs_fileattr_set(struct mnt_idmap *idmap,
 		      struct dentry *dentry, struct fileattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
-	u32 fsflags = fa->flags, mask = F2FS_SETTABLE_FS_FL;
+	u32 fsflags, mask = F2FS_SETTABLE_FS_FL;
 	u32 iflags;
+	struct fileattr cfa;
 	int err;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		return -EIO;
 	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
 		return -ENOSPC;
+
+	err = f2fs_fileattr_get(dentry, &cfa);
+	if (err)
+		return err;
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
+	fsflags = fa->flags;
+
 	if (fsflags & ~F2FS_GETTABLE_FS_FL)
 		return -EOPNOTSUPP;
 	fsflags &= F2FS_SETTABLE_FS_FL;
diff --git a/fs/file_attr.c b/fs/file_attr.c
index 5e51c5b851ef..d0a01377bca8 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -7,6 +7,8 @@
 #include <linux/fileattr.h>
 #include <linux/namei.h>
 
+#include "internal.h"
+
 /**
  * fileattr_fill_xflags - initialize fileattr with xflags
  * @fa:		fileattr pointer
@@ -225,6 +227,36 @@ static int fileattr_set_prepare(struct inode *inode,
 	return 0;
 }
 
+/**
+ * vfs_fileattr_set_prepare - merge new filettr state and check for validity
+ * @idmap:	idmap of the mount
+ * @dentry:	the object to change
+ * @cfa:	current fileattr state
+ * @fa:		fileattr pointer with new values
+ *
+ * Return: 0 on success, or a negative error on failure.
+ */
+int vfs_fileattr_set_prepare(struct mnt_idmap *idmap, struct dentry *dentry,
+			     struct fileattr *cfa, struct fileattr *fa)
+{
+	int err;
+
+	/* initialize missing bits from cfa */
+	if (fa->flags_valid) {
+		fa->fsx_xflags |= cfa->fsx_xflags & ~FS_XFLAG_COMMON;
+		fa->fsx_extsize = cfa->fsx_extsize;
+		fa->fsx_nextents = cfa->fsx_nextents;
+		fa->fsx_projid = cfa->fsx_projid;
+		fa->fsx_cowextsize = cfa->fsx_cowextsize;
+	} else {
+		fa->flags |= cfa->flags & ~FS_COMMON_FL;
+	}
+
+	err = fileattr_set_prepare(d_inode(dentry), cfa, fa);
+	return err;
+}
+EXPORT_SYMBOL(vfs_fileattr_set_prepare);
+
 /**
  * vfs_fileattr_set - change miscellaneous file attributes
  * @idmap:	idmap of the mount
@@ -245,7 +277,6 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct fileattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
-	struct fileattr old_ma = {};
 	int err;
 
 	if (!inode->i_op->fileattr_set)
@@ -255,29 +286,12 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	inode_lock(inode);
-	err = vfs_fileattr_get(dentry, &old_ma);
-	if (!err) {
-		/* initialize missing bits from old_ma */
-		if (fa->flags_valid) {
-			fa->fsx_xflags |= old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
-			fa->fsx_extsize = old_ma.fsx_extsize;
-			fa->fsx_nextents = old_ma.fsx_nextents;
-			fa->fsx_projid = old_ma.fsx_projid;
-			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-		} else {
-			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
-		}
-
-		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (err)
-			goto out;
-		err = security_inode_file_setattr(dentry, fa);
-		if (err)
-			goto out;
-		err = inode->i_op->fileattr_set(idmap, dentry, fa);
-		if (err)
-			goto out;
-	}
+	err = security_inode_file_setattr(dentry, fa);
+	if (err)
+		goto out;
+	err = inode->i_op->fileattr_set(idmap, dentry, fa);
+	if (err)
+		goto out;
 
 out:
 	inode_unlock(inode);
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index fd1147aa3891..cf796fa73af2 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -282,10 +282,19 @@ int gfs2_fileattr_set(struct mnt_idmap *idmap,
 	u32 fsflags = fa->flags, gfsflags = 0;
 	u32 mask;
 	int i;
+	struct fileattr cfa;
+	int error;
 
 	if (d_is_special(dentry))
 		return -ENOTTY;
 
+	error = gfs2_fileattr_get(dentry, &cfa);
+	if (error)
+		return error;
+	error = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (error)
+		return error;
+
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index f331e9574217..cdb11d00faea 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -678,6 +678,15 @@ int hfsplus_fileattr_set(struct mnt_idmap *idmap,
 	struct inode *inode = d_inode(dentry);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
 	unsigned int new_fl = 0;
+	struct fileattr cfa;
+	int err;
+
+	err = hfsplus_fileattr_get(dentry, &cfa);
+	if (err)
+		return err;
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
diff --git a/fs/jfs/ioctl.c b/fs/jfs/ioctl.c
index f7bd7e8f5be4..4c62c14d15b0 100644
--- a/fs/jfs/ioctl.c
+++ b/fs/jfs/ioctl.c
@@ -75,11 +75,18 @@ int jfs_fileattr_set(struct mnt_idmap *idmap,
 {
 	struct inode *inode = d_inode(dentry);
 	struct jfs_inode_info *jfs_inode = JFS_IP(inode);
-	unsigned int flags;
+	unsigned int flags = jfs_inode->mode2 & JFS_FL_USER_VISIBLE;
+	struct fileattr cfa;
+	int err;
 
 	if (d_is_special(dentry))
 		return -ENOTTY;
 
+	fileattr_fill_flags(&cfa, jfs_map_ext2(flags, 0));
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
+
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 9b6a3f8d2e7c..bc7ee7595b70 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -83,12 +83,22 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct ntfs_inode *ni = ntfs_i(inode);
-	u32 flags = fa->flags;
+	u32 flags;
 	unsigned int new_fl = 0;
+	struct fileattr cfa;
+	int err;
+
+	err = ntfs_fileattr_get(dentry, &cfa);
+	if (err)
+		return err;
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
+	flags = fa->flags;
 	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_COMPR_FL))
 		return -EOPNOTSUPP;
 
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 5ac743c6bc2e..aecb61146443 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -910,6 +910,15 @@ static int orangefs_fileattr_set(struct mnt_idmap *idmap,
 				 struct dentry *dentry, struct fileattr *fa)
 {
 	u64 val = 0;
+	struct fileattr cfa;
+	int error = 0;
+
+	error = orangefs_fileattr_get(dentry, &cfa);
+	if (error)
+		return error;
+	error = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (error)
+		return error;
 
 	gossip_debug(GOSSIP_FILE_DEBUG, "%s: called on %pd\n", __func__,
 		     dentry);
diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 2c99349cf537..e71e362c786b 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -148,14 +148,24 @@ int ubifs_fileattr_set(struct mnt_idmap *idmap,
 		       struct dentry *dentry, struct fileattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
-	int flags = fa->flags;
+	int flags;
+	struct fileattr cfa;
+	int err;
 
 	if (d_is_special(dentry))
 		return -ENOTTY;
 
+	err = ubifs_fileattr_get(dentry, &cfa);
+	if (err)
+		return err;
+	err = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (err)
+		return err;
+
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
+	flags = fa->flags;
 	if (flags & ~UBIFS_GETTABLE_IOCTL_FLAGS)
 		return -EOPNOTSUPP;
 
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index d250f7f74e3b..c861dc1c3cf0 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -733,12 +733,18 @@ xfs_fileattr_set(
 	struct xfs_dquot	*pdqp = NULL;
 	struct xfs_dquot	*olddquot = NULL;
 	int			error;
+	struct fileattr		cfa;
 
 	trace_xfs_ioctl_setattr(ip);
 
 	if (d_is_special(dentry))
 		return -ENOTTY;
 
+	xfs_fill_fsxattr(ip, XFS_DATA_FORK, &cfa);
+	error = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (error)
+		return error;
+
 	if (!fa->fsx_valid) {
 		if (fa->flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL |
 				  FS_NOATIME_FL | FS_NODUMP_FL |
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index f62a5143eb2d..aba76d897533 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -75,6 +75,8 @@ static inline bool fileattr_has_fsx(const struct fileattr *fa)
 }
 
 int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa);
+int vfs_fileattr_set_prepare(struct mnt_idmap *idmap, struct dentry *dentry,
+			     struct fileattr *cfa, struct fileattr *fa);
 int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct fileattr *fa);
 int ioctl_getflags(struct file *file, unsigned int __user *argp);
diff --git a/mm/shmem.c b/mm/shmem.c
index 99327c30507c..c2a5991f944f 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4199,6 +4199,14 @@ static int shmem_fileattr_set(struct mnt_idmap *idmap,
 	struct inode *inode = d_inode(dentry);
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	int ret, flags;
+	struct fileattr cfa;
+
+	ret = shmem_fileattr_get(dentry, &cfa);
+	if (ret)
+		return ret;
+	ret = vfs_fileattr_set_prepare(idmap, dentry, &cfa, fa);
+	if (ret)
+		return ret;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
-- 
2.47.2


