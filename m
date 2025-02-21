Return-Path: <linuxppc-dev+bounces-6379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47DA3FF7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2025 20:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z00G71zMbz2yn9;
	Sat, 22 Feb 2025 06:15:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740165343;
	cv=none; b=A7cdJvrVQ+7PCzHoLIdEUdc129Yuuz5Ehpa4nl81Rc7ucwc36QkcwTJgNI5FH7f68YpOpZesa+DoG100QjV7zxtKERXFGsBWVYPdXLp2uZP5926iZKG7LQb6gix9IGiiczTUucCnGHbWtDl7aNzITBoeDG5RAWhyDw5vrC15Fdo+EuBL51Fea5hzw3bjYKkLej8RgJe5fB1LQmHSrr4F9KTmp27hwby29tDh4P4MbGljWh3n0Ksb3xU/aLCYdjzmccEJedEd/oBhXHK+GYJ/pQMf1FmhU/fjx0eajOBYrC72B8BPCXq6G5L8TEudJlXjjCFjWChQ50LLqRBebvYZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740165343; c=relaxed/relaxed;
	bh=iZ4qzcaVyk05FmCACIvsQQhed5C/TdPL3HUS3iSi4mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMX35rOIjvKCkgpFAU6Z6T3uJ1oYJ5X1gUb4SVdpgXZn+3qciu1qh6dQstihFyT8qDHlnQxVbVTfIfGtgsS6WzgHo7nEf9mY2PUJCs6ap/ARCH1CLp4VTuo9ZvV2MGVMf42uWtzW6r0+1s69o5vI4sdbEsVRrIqxvpRyW0pCXltvUesMXe4CzWmZC0jlh5Q9QApYJpDx6bgn72lfJXU/H7R39NxsSX5XersSygKdKWrwNhFDgwH7lNGKLtL84RGFUKUIr7oK/sNA4UJpwotAmcYusCoO8XjU/4A4D+shEL6fgNi5LKPAXl1PE4Fx9bDvzePs38jXTGfUpcWpxxL88A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bqoSAKMd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bqoSAKMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z00G53HTTz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 06:15:41 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso417410966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2025 11:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165336; x=1740770136; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ4qzcaVyk05FmCACIvsQQhed5C/TdPL3HUS3iSi4mM=;
        b=bqoSAKMdiizdtzKcVvn39+z10IHcByyP5i140QSgi7vFgobnm0pAZNsJhitE39dV0W
         h4LVthgo90WrlCr/E8rRSJ0JTauAccMcfTEwDSY47BVO+H65KdU/lFUFBXhLhje8gbV0
         FfpLR9C7LuoPH3Z1rOM4JjyjfMejClrhMbmqNXCyC3ajwX/nQ/DpMGvqZDONJ6lYfKlp
         Q1OPtX+mvyjT6Ydlev3y5VJvMqMjpNPDZRbw8Zfoom2+/tbM9ZPGZfMzibyW+7y7pmiW
         WbneIZTRsfNlSpyCCbqWnmVXIj0UYPVEcVmr+fCTdXfYzm4e1fC1LW3QJpNjtZ9zngPp
         Xcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165336; x=1740770136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ4qzcaVyk05FmCACIvsQQhed5C/TdPL3HUS3iSi4mM=;
        b=FF0RqtC+eOnKQ0h0kMdqjsmUH28NAxHV9hOlC/6euxuqkfNzKHVD8H+8fgfoDsHpmu
         MPetWQnP8eUZkpJeGjnMLrqgyDO4JJc5ErcJ5dlfosGo1o2T25O5G/axIveTaD03p+o/
         G3FTgT3DkVNyM+khfxAHS3FvFyiraBiZG7k2NNvwYmTTlpOGvrtn5g+PHw8X91oXhujY
         uOiTxPjCEqmBgtTSjCOuraHOqE76ZOrsA+9pQpHjzPPV6J9P6zo5yYYBmKr15RIp3iFL
         4wZJDaY1AK4L7wJHt8c88NeL6k8z29CKzZZkGSwMXfxE6xGZoH066Ax/XW8w61DA5g8Q
         AuPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCjAxnNnPujYS4ZX9WHD7v/nYhygRNjR/hvwguSbkHR3bvMwVWolhoSnQFLqe/QB2ohgi9wnlzkYtrQII=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhgxJ3fM5zVjY3CRP6vk9pXze+5yUNMJFsjz5mG3Zp6hNvzA0D
	NEn7wbEnJlpBIhGW8dt2/apinvqVy8aXZ2h+RzsqkZVmWgyKxgUZD45g/7hWR98beuY6PeJI1tw
	Dgua4B1U2gyHrj8qIvSQLqaGDwv8=
X-Gm-Gg: ASbGncuTwHf8WJsz/OLehVT4WrLu12v6NGEDZuyJogFzkmQbjlawcUEYl382OfhCQAX
	t0wv/nBjhGjBhgCVdvmAlJpqizqkgBtVAfaGnCIi0MJnNP0MTaNTDDvEjoe/hEdTE9nqPZJ5Fyh
	cJ75u6KcE=
X-Google-Smtp-Source: AGHT+IFWDn5RXyBT2VBc0JnIa0dvQSE5CN14Z1A/WEoUOuvFw2fX/qPzzDoEoQ7kDiO+vVIgCpjqmVbZCbaRSc500nk=
X-Received: by 2002:a17:907:2daa:b0:ab7:10e1:8779 with SMTP id
 a640c23a62f3a-abc09a9c58emr545901766b.27.1740165335746; Fri, 21 Feb 2025
 11:15:35 -0800 (PST)
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
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org> <20250221181135.GW21808@frogsfrogsfrogs>
In-Reply-To: <20250221181135.GW21808@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 21 Feb 2025 20:15:24 +0100
X-Gm-Features: AWEUYZl6ee15urB13zi6bMenPf2pKrOJTL6JxjfoDGHoEUCbXunWqtruY9b7YnQ
Message-ID: <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
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
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 7:13=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
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
> > https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@k=
ernel.org/
> >
> > Previous discussion:
> > https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redh=
at.com/
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
> > - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5=
b360d4fbcb2@kernel.org
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
> >  fs/inode.c                                  | 75 +++++++++++++++++++++=
++++++++
> >  fs/ioctl.c                                  | 16 +++++-
> >  include/linux/fileattr.h                    |  1 +
> >  include/linux/syscalls.h                    |  4 ++
> >  include/uapi/asm-generic/unistd.h           |  8 ++-
> >  21 files changed, 133 insertions(+), 3 deletions(-)
> >
>
> <cut to the syscall definitions>
>
> > diff --git a/fs/inode.c b/fs/inode.c
> > index 6b4c77268fc0ecace4ac78a9ca777fbffc277f4a..b2dddd9db4fabaf67a6cbf5=
41a86978b290411ec 100644
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
> >       return mode & ~S_ISGID;
> >  }
> >  EXPORT_SYMBOL(mode_strip_sgid);
> > +
> > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > +             struct fsxattr __user *, fsx, unsigned int, at_flags)
>
> Should the kernel require userspace to pass the size of the fsx buffer?
> That way we avoid needing to rev the interface when we decide to grow
> the structure.
>

This makes sense to me, but I see that Andreas proposed other ways,
as long as we have a plan on how to extend the struct if we need more space=
.

Andrey, I am sorry to bring this up in v3, but I would like to request
two small changes before merging this API.

This patch by Pali [1] adds fsx_xflags_mask for the filesystem to
report the supported set of xflags.

It was argued that we can make this change with the existing ioctl,
because it is not going to break xfs_io -c lsattr/chattr, which is fine,
but I think that we should merge the fsx_xflags_mask change along
with getfsxattrat() which is a new UAPI.

The second request is related to setfsxattrat().
With current FS_IOC_FSSETXATTR, IIUC, xfs ignores unsupported
fsx_xflags. I think this needs to be fixed before merging setfsxattrat().
It's ok that a program calling FS_IOC_FSSETXATTR will not know
if unsupported flags will be ignored, because that's the way it is,
but I think that setfsxattrat() must return -EINVAL for trying to
set unsupported xflags.

As I explained in [2] I think it is fine if FS_IOC_FSSETXATTR
will also start returning -EINVAL for unsupported flags, but I would
like setfsxattrat() to make that a guarantee.

There was an open question, what does fsx_xflags_mask mean
for setfsxattrat() - it is a mask like in inode_set_flags() as Andreas
suggested? I think that would be a good idea.

Thanks,
Amir.

[1] https://lore.kernel.org/linux-fsdevel/20250216164029.20673-4-pali@kerne=
l.org/
[2] https://lore.kernel.org/linux-fsdevel/CAOQ4uxjwQJiKAqyjEmKUnq-VihyeSsxy=
Ey2F+J38NXwrAXurFQ@mail.gmail.com/

