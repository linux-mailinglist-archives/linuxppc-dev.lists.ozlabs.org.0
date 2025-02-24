Return-Path: <linuxppc-dev+bounces-6408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD11A41CDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 12:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1drN0fRYz2yDH;
	Mon, 24 Feb 2025 22:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740396756;
	cv=none; b=ez+V17UOHxoTbfMoXuyGk34fIEEEydhnSmaPNsJZ6dF+/6diSKPNsO1Ui0nzBMSKWXfkxuUalw3viCd94rz7l1ihHwrtYuR/mKqZa4Dx8eabL7byo/643fjnuzyIgvI1RQNdMwyIEDv/3uwCsJG05+omcCkj/eZB0AEWMrZMJAO4iTPwPkI+1iBzPWDbdUsWVrGZTiB8IDEYQyiwN3R3JtWGVccywVuRf3Kkh7+dngvQ0BV8C2Ly89pRck0jTtbw7P78pkroXJnJSG1AZk1BJ+NqI6g0maF83o+M0Heh8Bx7sq7VXjwExp1JN0VXJOO5aS7yvcsv7va0sMUq7dwPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740396756; c=relaxed/relaxed;
	bh=Fi7SA/mP8keo380+EBsAPPwB9EDZ3Cnm+EitBoBKPR4=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lygNY2kVFXNgD1dL0ThIPaqhgKFK0f/Zj47/gbs5NKYUU1w5sWCmF1ukPltpdwuMrSR6Wgzmsu+JXzwfdCXM2HXt25u7Qt0PtnetzyLJ2tte8m0vMvQO8/sYOYyi78aFVfVZvudhLUiJ0q+eo5Uzk09Ke8iR1iTzABzHKxsK/R/XuBhOoUWe+THWACeUA7KQrhIMM1w8GKgNYo96DqFs5z183n3pSafTfNUif/Wkw3MLncseshBqSyyV1WvBni8gc4VVwM6plT1ce8ULK0FjPpMAdymtcbRU73h/B4zyZb2PwexHv3+Fo77zaNUL+T3SvVrMPyaOohLy7CEQnqHGeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVWfNpja; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVWfNpja;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1drM184qz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 22:32:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B97B95C03DF;
	Mon, 24 Feb 2025 11:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E138C4CED6;
	Mon, 24 Feb 2025 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740396752;
	bh=/3Mh6pug+713M2/VDC4hgpIDh9F4ngYOQu3zb5WfebM=;
	h=Date:From:Cc:Subject:References:In-Reply-To:From;
	b=hVWfNpjapTs9Gzqso9NB1m1ULW6zQPSObcIfIOnmoo3UgEOo4r/dmDmSaSI9IfwTP
	 Ar8P2zDogME/kiUPhwy10R9KxLU//uhD6zuPOnNL0o/8YC/3Xlkw+2iGAx7Bv2r0JI
	 BRT5sV8wVLMC9dcbIUVu95Kd0KhrHyroW35DBtfhLb2axglzIrroUkqae91AxOZwtp
	 6t0UHwqaSbVkll8v4gtSgLaV36jXEMXEJBOJStRzYCLO239Fvq6RByGaH9nO9bwvFd
	 vytICMqj4HwAT3wRKsBcKZpqc8CSaDQOQWo5JwkzT3mWostsHNatJX17ydAshLFWah
	 mqN8YB3Ihk8MQ==
Date: Mon, 24 Feb 2025 12:32:17 +0100
From: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, 
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
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Theodore Tso <tytso@mit.edu>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 08:15:24PM +0100, Amir Goldstein wrote:
> On Fri, Feb 21, 2025 at 7:13 PM Darrick J. Wong <djwong@kernel.org> wrote:
> >
> > On Tue, Feb 11, 2025 at 06:22:47PM +0100, Andrey Albershteyn wrote:
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
> > > Also, as vfs_fileattr_set() is now will be called on special files
> > > too, let's forbid any other attributes except projid and nextents
> > > (symlink can have an extent).
> > >
> > > CC: linux-api@vger.kernel.org
> > > CC: linux-fsdevel@vger.kernel.org
> > > CC: linux-xfs@vger.kernel.org
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > ---
> > > v1:
> > > https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/
> > >
> > > Previous discussion:
> > > https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/
> > >
> > > XFS has project quotas which could be attached to a directory. All
> > > new inodes in these directories inherit project ID set on parent
> > > directory.
> > >
> > > The project is created from userspace by opening and calling
> > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > with empty project ID. Those inodes then are not shown in the quota
> > > accounting but still exist in the directory. Moreover, in the case
> > > when special files are created in the directory with already
> > > existing project quota, these inode inherit extended attributes.
> > > This than leaves them with these attributes without the possibility
> > > to clear them out. This, in turn, prevents userspace from
> > > re-creating quota project on these existing files.
> > > ---
> > > Changes in v3:
> > > - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> > > - Remove unnecessary "same filesystem" check
> > > - Use CLASS() instead of directly calling fdget/fdput
> > > - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org
> > > ---
> > >  arch/alpha/kernel/syscalls/syscall.tbl      |  2 +
> > >  arch/arm/tools/syscall.tbl                  |  2 +
> > >  arch/arm64/tools/syscall_32.tbl             |  2 +
> > >  arch/m68k/kernel/syscalls/syscall.tbl       |  2 +
> > >  arch/microblaze/kernel/syscalls/syscall.tbl |  2 +
> > >  arch/mips/kernel/syscalls/syscall_n32.tbl   |  2 +
> > >  arch/mips/kernel/syscalls/syscall_n64.tbl   |  2 +
> > >  arch/mips/kernel/syscalls/syscall_o32.tbl   |  2 +
> > >  arch/parisc/kernel/syscalls/syscall.tbl     |  2 +
> > >  arch/powerpc/kernel/syscalls/syscall.tbl    |  2 +
> > >  arch/s390/kernel/syscalls/syscall.tbl       |  2 +
> > >  arch/sh/kernel/syscalls/syscall.tbl         |  2 +
> > >  arch/sparc/kernel/syscalls/syscall.tbl      |  2 +
> > >  arch/x86/entry/syscalls/syscall_32.tbl      |  2 +
> > >  arch/x86/entry/syscalls/syscall_64.tbl      |  2 +
> > >  arch/xtensa/kernel/syscalls/syscall.tbl     |  2 +
> > >  fs/inode.c                                  | 75 +++++++++++++++++++++++++++++
> > >  fs/ioctl.c                                  | 16 +++++-
> > >  include/linux/fileattr.h                    |  1 +
> > >  include/linux/syscalls.h                    |  4 ++
> > >  include/uapi/asm-generic/unistd.h           |  8 ++-
> > >  21 files changed, 133 insertions(+), 3 deletions(-)
> > >
> >
> > <cut to the syscall definitions>
> >
> > > diff --git a/fs/inode.c b/fs/inode.c
> > > index 6b4c77268fc0ecace4ac78a9ca777fbffc277f4a..b2dddd9db4fabaf67a6cbf541a86978b290411ec 100644
> > > --- a/fs/inode.c
> > > +++ b/fs/inode.c
> > > @@ -23,6 +23,9 @@
> > >  #include <linux/rw_hint.h>
> > >  #include <linux/seq_file.h>
> > >  #include <linux/debugfs.h>
> > > +#include <linux/syscalls.h>
> > > +#include <linux/fileattr.h>
> > > +#include <linux/namei.h>
> > >  #include <trace/events/writeback.h>
> > >  #define CREATE_TRACE_POINTS
> > >  #include <trace/events/timestamp.h>
> > > @@ -2953,3 +2956,75 @@ umode_t mode_strip_sgid(struct mnt_idmap *idmap,
> > >       return mode & ~S_ISGID;
> > >  }
> > >  EXPORT_SYMBOL(mode_strip_sgid);
> > > +
> > > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > > +             struct fsxattr __user *, fsx, unsigned int, at_flags)
> >
> > Should the kernel require userspace to pass the size of the fsx buffer?
> > That way we avoid needing to rev the interface when we decide to grow
> > the structure.

Please version the struct by size as we do for clone3(),
mount_setattr(), listmount()'s struct mnt_id_req, sched_setattr(), all
the new xattrat*() system calls and a host of others. So laying out the
struct 64bit and passing a size alongside it.

This is all handled by copy_struct_from_user() and copy_struct_to_user()
so nothing to reinvent. And it's easy to copy from existing system
calls.

