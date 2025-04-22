Return-Path: <linuxppc-dev+bounces-7912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D0A9702D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 17:14:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhm4525cZz3bsK;
	Wed, 23 Apr 2025 01:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745334869;
	cv=none; b=NR5LJAoy23J//pZPgGkshaJm05YLb4iI0opyuSJyUFXd4SHq6b3mlLII9pwrq++HAyjHfH0YjRrt1FtSohC1uUbcGo+chC6xvCnoHXlukwCBgWd9GiWgIkpEaw0HA3WFZ7skNgJ0jcK1GeEd9KpWlkWlgM51dSQSFh07R9w813YwIwhq4Xja3UjVuzJ7foNxNL9Fg6gXExRQ2Ej3+bpA3iyrSsjkKvY0FJ2gZPCiGcyjLlerL2f+UBs+MEtKIGmVtlkvmyuhHA4XvcY/sOaGRVliRkwzMdaNObZRrJBysn4YtZJVAtiS+pawXiC+HGUEosVUHxRUNq2duLc3LoSzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745334869; c=relaxed/relaxed;
	bh=f6r6INJFswIQ6ysfL39EjsadQis1krWqOeC44Si/2HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPsAz4v/8NoMeP6ZBmwKZIpFDl268o5KsP87geM63opNOTyiQArREvr9SAX99SstD+vts/r5xhcWJfqg3DP2SdTyfHDH0NIzvtA6GH6sB7YGEaVRQyZJb8dKBWhIWyUPdGh/9+9ZSfzlCY/Hi02UtFUhBSVoNZPM7h1Fn4/2n4po1RLPycYUCJFFbe/GElJIpl+1ihruT2Y0RPyJ+2aW+YV1Rfp4J0/u+zhTp08Y2wiuLIzw9kYhpR3jdWuHCV9dGzfXfY67lCfUsawgV7b9haqN6Ie0s1yo8XQK9/XQNKbZUw4dabS08jLaXegcXjRTTVxz9NW3iie9uxiCBcu/7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=beZ7LsdS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=beZ7LsdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhm442BShz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 01:14:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B219161160;
	Tue, 22 Apr 2025 15:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08793C4CEE9;
	Tue, 22 Apr 2025 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745334865;
	bh=lSbO7DQOl7qwT5MJRJMvfW/c1+fnMb2KJJ+xVIINpPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beZ7LsdSi9ogRm6COvjTgxTx5DUokGe1NIskhD1Sd/cUrpINh5Hi7ZbRSC4/d84j3
	 Ti74rBHoDCX2uKhMLA8RFoi78F7zLpulfvYbxiyuPWCTHUpt91JmFCCnNIFMiC63ZJ
	 fyxIf7YwMCDjLqs9yBdshcKBulenxdLGzicBlGS67FqAeCgpdPVW3CnOPj8McMU0xZ
	 /UoW6DW244fMiDspWdMKq+cgwRtWXK/9CerZk9TzlxdZvhc1TFxwQh4aqam93ykR8i
	 kvlXyyWfPalvpguNSnuCK53W3jm5GQYs/SST8d1Bw9P7SIMsJ4KVF3iaBJBWxd9cuE
	 HiB5wuAvJto0g==
Date: Tue, 22 Apr 2025 17:14:10 +0200
From: Christian Brauner <brauner@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, 
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
Message-ID: <20250422-gefressen-faucht-8ded2c9a5375@brauner>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
 <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
 <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
 <CAOQ4uxjs=Gg-ocwx_fkzc0gxQ_dHx-P9EAgz5ZwbdbrxV0T_EA@mail.gmail.com>
 <20250422-suchen-filmpreis-3573a913457c@brauner>
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
In-Reply-To: <20250422-suchen-filmpreis-3573a913457c@brauner>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 22, 2025 at 04:31:29PM +0200, Christian Brauner wrote:
> On Thu, Mar 27, 2025 at 12:39:28PM +0100, Amir Goldstein wrote:
> > On Thu, Mar 27, 2025 at 10:33 AM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > >
> > > On 2025-03-23 09:56:25, Amir Goldstein wrote:
> > > > On Fri, Mar 21, 2025 at 8:49 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > > >
> > > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > > >
> > > > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > > > extended attributes/flags. The syscalls take parent directory fd and
> > > > > path to the child together with struct fsxattr.
> > > > >
> > > > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > > > that file don't need to be open as we can reference it with a path
> > > > > instead of fd. By having this we can manipulated inode extended
> > > > > attributes not only on regular files but also on special ones. This
> > > > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > > > we can not call ioctl() directly on the filesystem inode using fd.
> > > > >
> > > > > This patch adds two new syscalls which allows userspace to get/set
> > > > > extended inode attributes on special files by using parent directory
> > > > > and a path - *at() like syscall.
> > > > >
> > > > > CC: linux-api@vger.kernel.org
> > > > > CC: linux-fsdevel@vger.kernel.org
> > > > > CC: linux-xfs@vger.kernel.org
> > > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > > > ---
> > > > ...
> > > > > +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> > > > > +               struct fsxattr __user *, ufsx, size_t, usize,
> > > > > +               unsigned int, at_flags)
> > > > > +{
> > > > > +       struct fileattr fa;
> > > > > +       struct path filepath;
> > > > > +       int error;
> > > > > +       unsigned int lookup_flags = 0;
> > > > > +       struct filename *name;
> > > > > +       struct mnt_idmap *idmap;.
> > > >
> > > > > +       struct dentry *dentry;
> > > > > +       struct vfsmount *mnt;
> > > > > +       struct fsxattr fsx = {};
> > > > > +
> > > > > +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > > > > +       BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> > > > > +
> > > > > +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > > > > +               lookup_flags |= LOOKUP_FOLLOW;
> > > > > +
> > > > > +       if (at_flags & AT_EMPTY_PATH)
> > > > > +               lookup_flags |= LOOKUP_EMPTY;
> > > > > +
> > > > > +       if (usize > PAGE_SIZE)
> > > > > +               return -E2BIG;
> > > > > +
> > > > > +       if (usize < FSXATTR_SIZE_VER0)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       error = copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufsx, usize);
> > > > > +       if (error)
> > > > > +               return error;
> > > > > +
> > > > > +       fsxattr_to_fileattr(&fsx, &fa);
> > > > > +
> > > > > +       name = getname_maybe_null(filename, at_flags);
> > > > > +       if (!name) {
> > > > > +               CLASS(fd, f)(dfd);
> > > > > +
> > > > > +               if (fd_empty(f))
> > > > > +                       return -EBADF;
> > > > > +
> > > > > +               idmap = file_mnt_idmap(fd_file(f));
> > > > > +               dentry = file_dentry(fd_file(f));
> > > > > +               mnt = fd_file(f)->f_path.mnt;
> > > > > +       } else {
> > > > > +               error = filename_lookup(dfd, name, lookup_flags, &filepath,
> > > > > +                                       NULL);
> > > > > +               if (error)
> > > > > +                       return error;
> > > > > +
> > > > > +               idmap = mnt_idmap(filepath.mnt);
> > > > > +               dentry = filepath.dentry;
> > > > > +               mnt = filepath.mnt;
> > > > > +       }
> > > > > +
> > > > > +       error = mnt_want_write(mnt);
> > > > > +       if (!error) {
> > > > > +               error = vfs_fileattr_set(idmap, dentry, &fa);
> > > > > +               if (error == -ENOIOCTLCMD)
> > > > > +                       error = -EOPNOTSUPP;
> > > >
> > > > This is awkward.
> > > > vfs_fileattr_set() should return -EOPNOTSUPP.
> > > > ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
> > > > but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
> > > > ioctl returns -EOPNOTSUPP.
> > > >
> > > > I don't think it is necessarily a bad idea to start returning
> > > >  -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
> > > > because that really reflects the fact that the ioctl is now implemented
> > > > in vfs and not in the specific fs.
> > > >
> > > > and I think it would not be a bad idea at all to make that change
> > > > together with the merge of the syscalls as a sort of hint to userspace
> > > > that uses the ioctl, that the sycalls API exists.
> > > >
> > > > Thanks,
> > > > Amir.
> > > >
> > >
> > > Hmm, not sure what you're suggesting here. I see it as:
> > > - get/setfsxattrat should return EOPNOTSUPP as it make more sense
> > >   than ENOIOCTLCMD
> > > - ioctl_setflags returns ENOIOCTLCMD which also expected
> > >
> > > Don't really see a reason to change what vfs_fileattr_set() returns
> > > and then copying this if() to other places or start returning
> > > EOPNOTSUPP.
> > 
> > ENOIOCTLCMD conceptually means that the ioctl command is unknown
> > This is not the case since ->fileattr_[gs]et() became a vfs API
> 
> vfs_fileattr_{g,s}et() should not return ENOIOCTLCMD. Change the return
> code to EOPNOTSUPP and then make EOPNOTSUPP be translated to ENOTTY on
> on overlayfs and to ENOIOCTLCMD in ecryptfs and in fs/ioctl.c. This way
> we get a clean VFS api while retaining current behavior. Amir can do his
> cleanup based on that.

Also this get/set dance is not something new apis should do. It should
be handled like setattr_prepare() or generic_fillattr() where the
filesystem calls a VFS helper and that does all of this based on the
current state of the inode instead of calling into the filesystem twice:

int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
		     struct fileattr *fa)
{
<snip>
	inode_lock(inode);
	err = vfs_fileattr_get(dentry, &old_ma);
	if (!err) {
		/* initialize missing bits from old_ma */
		if (fa->flags_valid) {
<snip>
		err = fileattr_set_prepare(inode, &old_ma, fa);
		if (!err && !security_inode_setfsxattr(inode, fa))
			err = inode->i_op->fileattr_set(idmap, dentry, fa);

