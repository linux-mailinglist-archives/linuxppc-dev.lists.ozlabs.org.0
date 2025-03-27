Return-Path: <linuxppc-dev+bounces-7350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50247A72FF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 12:39:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNhXM4Przz2yfp;
	Thu, 27 Mar 2025 22:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743075587;
	cv=none; b=AOALcsJ040P/N7i+3/euOw8vfyoTthnhCbz9Ki5XWBLVlwrnciVFBC38dR0fotukYVL5+FXxNjZUyk1X+ivy2DbRmMu60UIZbwSA95BpP3rm6hMPYvRwrr87qeAitKoqXsuV90aupwF5aSwZG6W4YXaqH1oDFMj+d6f7HQ9DgnMaRBcxAOPZhYd8lce785yox12qFIAZlgt0/nqNBdKdLMm01WZcrWZObo9bjfevYdI8x7/Kic4gz/TS9PWNsNhgb0qW5PN+ekw2TMwGf2u13Grqa/4MnjgpeqW2+7PQDnLoiNwxPBBmnpoIhBEYoeGlpm+KnxvdWBsAZeU9mjxu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743075587; c=relaxed/relaxed;
	bh=H5YJ+HIPr7Xtl+bdBaUXFEAtySXgJKTavR2pWedTVNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXq2FpHkl97HzIWcR9Ln72herLrwN7NcDo/p5WuYIWj6cVxrSMjmpgficHN+KQKUnw3dBGfEL/quq5XMlwjKOcQZOustoZ9TpkJaPuaiHULKcMCBXeoU4+ss/YIOWnt06vMusVY3NURGPLsuSbjCFgfG07jQDDv/a3JWpXN5oRR6kJS/lAj12IUPj6Qq1WuDRERJullgLaTrJ2qeR4IKvU2gNTrkdvUzqEYHiXoT/yg3l8ar45VWsV8OZ0Ryz++v0DDmMl4LtyL5JGOFutODmq7rj3rkTmxkPG2ApEXS2+Ur4ab7pjyBuB/kZRaToQcDrYCaftXnFLWUrAAM4NyL8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i4/usCjN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i4/usCjN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNhXK697Xz2yfV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 22:39:45 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso1499614a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075581; x=1743680381; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5YJ+HIPr7Xtl+bdBaUXFEAtySXgJKTavR2pWedTVNo=;
        b=i4/usCjNZJgnSmbOk2s2GkBuNo+c59WZW02TPdGnjDl6UmS2eBP4mGXp0jrQnto9E2
         LiK8T9H0SrNyB98QKidTGKQUbI+Bh87bHL8Q4dBekWBjUW2+ksSmRLmQrpIN1B8fW5RI
         PWAb6oosuR0aEMGJYRX4ixNb92MlHXUm/Ey3zFuWVPb8FZ3g2MnfCTfyHpteofQPQIUz
         etFHaktEhSr/Mmj/n/pWpk1iR7bC9UJZ3V6uLV4ilzIt/T3t+pmAhVpRybRUGI5/Drts
         hc4SGeXobIDDC8koYAAHrgScr3LQq7udJ/ure1nZHNgRtyPUkCc10uNitYDcxI3L9g4W
         OBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075581; x=1743680381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5YJ+HIPr7Xtl+bdBaUXFEAtySXgJKTavR2pWedTVNo=;
        b=RPqNzPgW8+j33KL54x9p1NPtU98bl1jfU1QCfGrfImmyvbOOPjjNaxPGM7W8aGzZ89
         s5Me18kcte517raOUyPQ9vX13b1S+pUBmXD9SODJJUS3mK3m3fuVY1WKlctorXjtZeQA
         +2oULol6aMH+30wv5Py79zme2gTLyey2c2T3+3qMtZs+eZyg21bAAfCRxndS4JN47fq7
         n9vr3jzOBer0IroTDwIUOn7SS2DdxzJSxVr4o0ZQAuu9XB4T/+srTPuAdW6pj7Vj7Pxj
         LwEmQcb3oyiv8HjSOmK0415ETErCtR2A/BmFDBKjIW2EV+BA0AORpAkrcW0+9wCCRqiq
         jYyw==
X-Forwarded-Encrypted: i=1; AJvYcCXHVmBRB91Red8QP6bUWkICfd9DlyBDxo8jYo/cmb20UHMgZJOHtxKPsMfkCWBoQ6B4WgWxX6MI0+HVg6U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzn5yDzVyN3omxfItkJTptK+hn4BkV8dW/v53tpdO4KI8Geb1xY
	z6rtEJK+q5E/+bWzZB5PvSiyof/gXwCOCzOLtXZyZbfJhzHPKFJw58ENm76c6LLKAz6b3EfJG2e
	Ik1MUWhdFKoS71UeRB0NrcImyojQ=
X-Gm-Gg: ASbGncvq34cY0SCyTYKHGt9mdqh3B0r7f/Hk1x7jIT2yCC9wUQTW+N/+HRAPhGpqv3E
	ARVVvuBgwRcL3xJvGLhoPgcFupuxC7zEocUSjF5glff96lfGkJRY+GPKYqw2OEDkKhOpLTUoyvn
	kyaLr2duulxhA/4LmXKJjXHhYdeQ==
X-Google-Smtp-Source: AGHT+IGgy/miY5V7+MPkH09VPO41DMi/jMR8Bk4E49dQyif98hlWpMqsre9jbg/TLCs8zzkfhNjlalqvBIB5xRYILRM=
X-Received: by 2002:a05:6402:518d:b0:5e7:b02b:6430 with SMTP id
 4fb4d7f45d1cf-5ed8f3fd122mr2772445a12.23.1743075580404; Thu, 27 Mar 2025
 04:39:40 -0700 (PDT)
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
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org> <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
 <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
In-Reply-To: <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 27 Mar 2025 12:39:28 +0100
X-Gm-Features: AQ5f1JofzJgaxJ0LZuoFvXDiOPJAJ8w60JwbZ8r4It-kQ_jhprqRZDypv8Lufbk
Message-ID: <CAOQ4uxjs=Gg-ocwx_fkzc0gxQ_dHx-P9EAgz5ZwbdbrxV0T_EA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 27, 2025 at 10:33=E2=80=AFAM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> On 2025-03-23 09:56:25, Amir Goldstein wrote:
> > On Fri, Mar 21, 2025 at 8:49=E2=80=AFPM Andrey Albershteyn <aalbersh@re=
dhat.com> wrote:
> > >
> > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > >
> > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > extended attributes/flags. The syscalls take parent directory fd and
> > > path to the child together with struct fsxattr.
> > >
> > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > that file don't need to be open as we can reference it with a path
> > > instead of fd. By having this we can manipulated inode extended
> > > attributes not only on regular files but also on special ones. This
> > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > we can not call ioctl() directly on the filesystem inode using fd.
> > >
> > > This patch adds two new syscalls which allows userspace to get/set
> > > extended inode attributes on special files by using parent directory
> > > and a path - *at() like syscall.
> > >
> > > CC: linux-api@vger.kernel.org
> > > CC: linux-fsdevel@vger.kernel.org
> > > CC: linux-xfs@vger.kernel.org
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > ...
> > > +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filenam=
e,
> > > +               struct fsxattr __user *, ufsx, size_t, usize,
> > > +               unsigned int, at_flags)
> > > +{
> > > +       struct fileattr fa;
> > > +       struct path filepath;
> > > +       int error;
> > > +       unsigned int lookup_flags =3D 0;
> > > +       struct filename *name;
> > > +       struct mnt_idmap *idmap;.
> >
> > > +       struct dentry *dentry;
> > > +       struct vfsmount *mnt;
> > > +       struct fsxattr fsx =3D {};
> > > +
> > > +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > > +       BUILD_BUG_ON(sizeof(struct fsxattr) !=3D FSXATTR_SIZE_LATEST)=
;
> > > +
> > > +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) !=3D =
0)
> > > +               return -EINVAL;
> > > +
> > > +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > > +               lookup_flags |=3D LOOKUP_FOLLOW;
> > > +
> > > +       if (at_flags & AT_EMPTY_PATH)
> > > +               lookup_flags |=3D LOOKUP_EMPTY;
> > > +
> > > +       if (usize > PAGE_SIZE)
> > > +               return -E2BIG;
> > > +
> > > +       if (usize < FSXATTR_SIZE_VER0)
> > > +               return -EINVAL;
> > > +
> > > +       error =3D copy_struct_from_user(&fsx, sizeof(struct fsxattr),=
 ufsx, usize);
> > > +       if (error)
> > > +               return error;
> > > +
> > > +       fsxattr_to_fileattr(&fsx, &fa);
> > > +
> > > +       name =3D getname_maybe_null(filename, at_flags);
> > > +       if (!name) {
> > > +               CLASS(fd, f)(dfd);
> > > +
> > > +               if (fd_empty(f))
> > > +                       return -EBADF;
> > > +
> > > +               idmap =3D file_mnt_idmap(fd_file(f));
> > > +               dentry =3D file_dentry(fd_file(f));
> > > +               mnt =3D fd_file(f)->f_path.mnt;
> > > +       } else {
> > > +               error =3D filename_lookup(dfd, name, lookup_flags, &f=
ilepath,
> > > +                                       NULL);
> > > +               if (error)
> > > +                       return error;
> > > +
> > > +               idmap =3D mnt_idmap(filepath.mnt);
> > > +               dentry =3D filepath.dentry;
> > > +               mnt =3D filepath.mnt;
> > > +       }
> > > +
> > > +       error =3D mnt_want_write(mnt);
> > > +       if (!error) {
> > > +               error =3D vfs_fileattr_set(idmap, dentry, &fa);
> > > +               if (error =3D=3D -ENOIOCTLCMD)
> > > +                       error =3D -EOPNOTSUPP;
> >
> > This is awkward.
> > vfs_fileattr_set() should return -EOPNOTSUPP.
> > ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
> > but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
> > ioctl returns -EOPNOTSUPP.
> >
> > I don't think it is necessarily a bad idea to start returning
> >  -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
> > because that really reflects the fact that the ioctl is now implemented
> > in vfs and not in the specific fs.
> >
> > and I think it would not be a bad idea at all to make that change
> > together with the merge of the syscalls as a sort of hint to userspace
> > that uses the ioctl, that the sycalls API exists.
> >
> > Thanks,
> > Amir.
> >
>
> Hmm, not sure what you're suggesting here. I see it as:
> - get/setfsxattrat should return EOPNOTSUPP as it make more sense
>   than ENOIOCTLCMD
> - ioctl_setflags returns ENOIOCTLCMD which also expected
>
> Don't really see a reason to change what vfs_fileattr_set() returns
> and then copying this if() to other places or start returning
> EOPNOTSUPP.

ENOIOCTLCMD conceptually means that the ioctl command is unknown
This is not the case since ->fileattr_[gs]et() became a vfs API
the ioctl command is handled by vfs and it is known, but individual
filesystems may not support it, so conceptually, returning EOPNOTSUPP
from ioctl() is more correct these days, exactly as is done with the ioctls
FS_IOC_FIEMAP and FIFREEZE which were also historically per fs
ioctls and made into a vfs API.

The fact that bcachefs does not implement ->fileattr_[gs]et() and does
implement FS_IOC_FS[GS]ETXATTR is an oversight IMO, since it
was probably merged after the vfs conversion patch.

This mistake means that bcachefs fileattr cannot be copied up by
ovl_copy_fileattr() which uses the vfs API and NOT the ioctl.

However, if you would made the internal vfs API change that I suggested,
it will have broken ovl_real_fileattr_get() and ovl_copy_fileattr(),
so leave it for now - if I care enough I can do it later together with
fixing the overlayfs and fuse code.

Thanks,
Amir.

