Return-Path: <linuxppc-dev+bounces-16301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BtEGYdseGlSpwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 08:43:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37690CB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 08:43:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0cnt05gCz2xjP;
	Tue, 27 Jan 2026 18:42:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769499777;
	cv=none; b=h8ILQkS+NXIXbrsB1s6+GWUPXRx9x8be54itVWgcIVM2AUUsSjPl/Bui9x2V1BM4OiyKAPjfAY5QoHlPUHNb+jsT3c/2pUPCxyUBm9nkxlSvuFt/bdpUWLjavEK+v1gz3V5XRxtuZb0WrtU7uPdihZJ0nRlLuDakaM0h31tNTLI3mOJr1Lz+ybC9WCKiemz84zXH1f7iKKv38PFlzT8hRtANcYUBZVf4osILUcroVAtDW/b8uT4XC/12wezYr+VRzjdaWTjNNqvU8svHabFCAeSuoihB8wSdHv1+gUGxC891okNauXGsfE7jfDqXV8bnUcJmEt55zlFhGlJm4Y3OwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769499777; c=relaxed/relaxed;
	bh=MLvDpIJpiTbYuOeN/1CV6jFHqGVNaZBLf9/cHhTYJFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFM5Rcci8RZffOXe8fP8fXATkbUsIzbR3V+46Xp5U2zs3qa4wW01OQsQIohWYp52A0ys6+boVG2ObOBmyUttZyV9iegWiixtkIxPA8WVB6em0WR/7vexVKvtOupxo/1aOgltF/49P6UcPOEqgGjfdSIakofoYUppX6k0vtkK0oaM9rVpFxB6nD2XoWvzEPB8gAtFZ8Xs2uF9i+EhOtoyTWPCsb4mN+NkjCM703Dp1RQ3LkMSg4ellAFZXGDiaz/IiHIhu8+s2jJsZW5Q0a6cianzuJN6A0oaxtl2xoiBKSwIpLAy3/BDLfx3ztKh/By24ZYyYZJtmlVXHBMI/hx7Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gD2FZ48F; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gD2FZ48F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0cnr5cM0z2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 18:42:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8815143D98;
	Tue, 27 Jan 2026 07:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC89C116C6;
	Tue, 27 Jan 2026 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769499773;
	bh=ikQcR87yl+GoM9FcMFnkrg0jZI4+AeTioVcdiBeKjEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gD2FZ48FJPvi7t/psx/HALGN/uZFOf3AhJtiZANeDXFi2C/lZm/CgH20rka87o0fd
	 5vDMhti0sCNGoMz1k/ShZSdEFYf1yEk0SvAsfjXTH7FmmbBK+p8vrnCzcNkHYSxz2O
	 DYQ3Lr8e1TJKhviH1CIRD5w5GuZv0R6SCjkw3mAI=
Date: Tue, 27 Jan 2026 08:42:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samuel Wu <wusamuel@google.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, clm@meta.com,
	android-kernel-team <android-kernel-team@google.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
Message-ID: <2026012715-mantra-pope-9431@gregkh>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16301-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:wusamuel@google.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0B37690CB5
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:56:42PM -0800, Samuel Wu wrote:
> On Mon, Nov 17, 2025 at 9:15 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Some filesystems use a kinda-sorta controlled dentry refcount leak to pin
> > dentries of created objects in dcache (and undo it when removing those).
> > Reference is grabbed and not released, but it's not actually _stored_
> > anywhere.  That works, but it's hard to follow and verify; among other
> > things, we have no way to tell _which_ of the increments is intended
> > to be an unpaired one.  Worse, on removal we need to decide whether
> > the reference had already been dropped, which can be non-trivial if
> > that removal is on umount and we need to figure out if this dentry is
> > pinned due to e.g. unlink() not done.  Usually that is handled by using
> > kill_litter_super() as ->kill_sb(), but there are open-coded special
> > cases of the same (consider e.g. /proc/self).
> >
> > Things get simpler if we introduce a new dentry flag (DCACHE_PERSISTENT)
> > marking those "leaked" dentries.  Having it set claims responsibility
> > for +1 in refcount.
> >
> > The end result this series is aiming for:
> >
> > * get these unbalanced dget() and dput() replaced with new primitives that
> >   would, in addition to adjusting refcount, set and clear persistency flag.
> > * instead of having kill_litter_super() mess with removing the remaining
> >   "leaked" references (e.g. for all tmpfs files that hadn't been removed
> >   prior to umount), have the regular shrink_dcache_for_umount() strip
> >   DCACHE_PERSISTENT of all dentries, dropping the corresponding
> >   reference if it had been set.  After that kill_litter_super() becomes
> >   an equivalent of kill_anon_super().
> >
> > Doing that in a single step is not feasible - it would affect too many places
> > in too many filesystems.  It has to be split into a series.
> >
> > This work has really started early in 2024; quite a few preliminary pieces
> > have already gone into mainline.  This chunk is finally getting to the
> > meat of that stuff - infrastructure and most of the conversions to it.
> >
> > Some pieces are still sitting in the local branches, but the bulk of
> > that stuff is here.
> >
> > Compared to v3:
> >         * fixed a functionfs braino around ffs_epfiles_destroy() (in #40/54,
> > used to be #36/50).
> >         * added fixes for a couple of UAF in functionfs (##36--39); that
> > does *NOT* include any fixes for dmabuf bugs Chris posted last week, though.
> >
> > The branch is -rc5-based; it lives in
> > git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.persistency
> > individual patches in followups.
> >
> > Please, help with review and testing.  If nobody objects, in a few days it
> > goes into #for-next.
> >
> > Shortlog:
> >       fuse_ctl_add_conn(): fix nlink breakage in case of early failure
> >       tracefs: fix a leak in eventfs_create_events_dir()
> >       new helper: simple_remove_by_name()
> >       new helper: simple_done_creating()
> >       introduce a flag for explicitly marking persistently pinned dentries
> >       primitives for maintaining persisitency
> >       convert simple_{link,unlink,rmdir,rename,fill_super}() to new primitives
> >       convert ramfs and tmpfs
> >       procfs: make /self and /thread_self dentries persistent
> >       configfs, securityfs: kill_litter_super() not needed
> >       convert xenfs
> >       convert smackfs
> >       convert hugetlbfs
> >       convert mqueue
> >       convert bpf
> >       convert dlmfs
> >       convert fuse_ctl
> >       convert pstore
> >       convert tracefs
> >       convert debugfs
> >       debugfs: remove duplicate checks in callers of start_creating()
> >       convert efivarfs
> >       convert spufs
> >       convert ibmasmfs
> >       ibmasmfs: get rid of ibmasmfs_dir_ops
> >       convert devpts
> >       binderfs: use simple_start_creating()
> >       binderfs_binder_ctl_create(): kill a bogus check
> >       convert binderfs
> >       autofs_{rmdir,unlink}: dentry->d_fsdata->dentry == dentry there
> >       convert autofs
> >       convert binfmt_misc
> >       selinuxfs: don't stash the dentry of /policy_capabilities
> >       selinuxfs: new helper for attaching files to tree
> >       convert selinuxfs
> >       functionfs: don't abuse ffs_data_closed() on fs shutdown
> >       functionfs: don't bother with ffs->ref in ffs_data_{opened,closed}()
> >       functionfs: need to cancel ->reset_work in ->kill_sb()
> >       functionfs: fix the open/removal races
> >       functionfs: switch to simple_remove_by_name()
> >       convert functionfs
> >       gadgetfs: switch to simple_remove_by_name()
> >       convert gadgetfs
> >       hypfs: don't pin dentries twice
> >       hypfs: switch hypfs_create_str() to returning int
> >       hypfs: swich hypfs_create_u64() to returning int
> >       convert hypfs
> >       convert rpc_pipefs
> >       convert nfsctl
> >       convert rust_binderfs
> >       get rid of kill_litter_super()
> >       convert securityfs
> >       kill securityfs_recursive_remove()
> >       d_make_discardable(): warn if given a non-persistent dentry
> >
> > Diffstat:
> >  Documentation/filesystems/porting.rst     |   7 ++
> >  arch/powerpc/platforms/cell/spufs/inode.c |  17 ++-
> >  arch/s390/hypfs/hypfs.h                   |   6 +-
> >  arch/s390/hypfs/hypfs_diag_fs.c           |  60 ++++------
> >  arch/s390/hypfs/hypfs_vm_fs.c             |  21 ++--
> >  arch/s390/hypfs/inode.c                   |  82 +++++--------
> >  drivers/android/binder/rust_binderfs.c    | 121 ++++++-------------
> >  drivers/android/binderfs.c                |  82 +++----------
> >  drivers/base/devtmpfs.c                   |   2 +-
> >  drivers/misc/ibmasm/ibmasmfs.c            |  24 ++--
> >  drivers/usb/gadget/function/f_fs.c        | 144 +++++++++++++----------
> >  drivers/usb/gadget/legacy/inode.c         |  49 ++++----
> >  drivers/xen/xenfs/super.c                 |   2 +-
> >  fs/autofs/inode.c                         |   2 +-
> >  fs/autofs/root.c                          |  11 +-
> >  fs/binfmt_misc.c                          |  69 ++++++-----
> >  fs/configfs/dir.c                         |  10 +-
> >  fs/configfs/inode.c                       |   3 +-
> >  fs/configfs/mount.c                       |   2 +-
> >  fs/dcache.c                               | 111 +++++++++++-------
> >  fs/debugfs/inode.c                        |  32 ++----
> >  fs/devpts/inode.c                         |  57 ++++-----
> >  fs/efivarfs/inode.c                       |   7 +-
> >  fs/efivarfs/super.c                       |   5 +-
> >  fs/fuse/control.c                         |  38 +++---
> >  fs/hugetlbfs/inode.c                      |  12 +-
> >  fs/internal.h                             |   1 -
> >  fs/libfs.c                                |  52 +++++++--
> >  fs/nfsd/nfsctl.c                          |  18 +--
> >  fs/ocfs2/dlmfs/dlmfs.c                    |   8 +-
> >  fs/proc/base.c                            |   6 +-
> >  fs/proc/internal.h                        |   1 +
> >  fs/proc/root.c                            |  14 +--
> >  fs/proc/self.c                            |  10 +-
> >  fs/proc/thread_self.c                     |  11 +-
> >  fs/pstore/inode.c                         |   7 +-
> >  fs/ramfs/inode.c                          |   8 +-
> >  fs/super.c                                |   8 --
> >  fs/tracefs/event_inode.c                  |   7 +-
> >  fs/tracefs/inode.c                        |  13 +--
> >  include/linux/dcache.h                    |   4 +-
> >  include/linux/fs.h                        |   6 +-
> >  include/linux/proc_fs.h                   |   2 -
> >  include/linux/security.h                  |   2 -
> >  init/do_mounts.c                          |   2 +-
> >  ipc/mqueue.c                              |  12 +-
> >  kernel/bpf/inode.c                        |  15 +--
> >  mm/shmem.c                                |  38 ++----
> >  net/sunrpc/rpc_pipe.c                     |  27 ++---
> >  security/apparmor/apparmorfs.c            |  13 ++-
> >  security/inode.c                          |  35 +++---
> >  security/selinux/selinuxfs.c              | 185 +++++++++++++-----------------
> >  security/smack/smackfs.c                  |   2 +-
> >  53 files changed, 649 insertions(+), 834 deletions(-)
> >
> >         Overview:
> >
> > First two commits are bugfixes (fusectl and tracefs resp.)
> >
> > [1/54] fuse_ctl_add_conn(): fix nlink breakage in case of early failure
> > [2/54] tracefs: fix a leak in eventfs_create_events_dir()
> >
> > Next, two commits adding a couple of useful helpers, the next three adding
> > the infrastructure and the rest consists of per-filesystem conversions.
> >
> > [3/54] new helper: simple_remove_by_name()
> > [4/54] new helper: simple_done_creating()
> >         end_creating_path() analogue for internal object creation; unlike
> > end_creating_path() no mount is passed to it (or guaranteed to exist, for
> > that matter - it might be used during the filesystem setup, before the
> > superblock gets attached to any mounts).
> >
> > Infrastructure:
> > [5/54] introduce a flag for explicitly marking persistently pinned dentries
> >         * introduce the new flag
> >         * teach shrink_dcache_for_umount() to handle it (i.e. remove
> > and drop refcount on anything that survives to umount with that flag
> > still set)
> >         * teach kill_litter_super() that anything with that flag does
> > *not* need to be unpinned.
> > [6/54] primitives for maintaining persisitency
> >         * d_make_persistent(dentry, inode) - bump refcount, mark persistent
> > and make hashed positive.  Return value is a borrowed reference to dentry;
> > it can be used until something removes persistency (at the very least,
> > until the parent gets unlocked, but some filesystems may have stronger
> > exclusion).
> >         * d_make_discardable() - remove persistency mark and drop reference.
> >
> > NOTE: at that stage d_make_discardable() does not reject dentries not
> > marked persistent - it acts as if the mark been set.
> >
> > Rationale: less noise in series splitup that way.  We want (and on the
> > next commit will get) simple_unlink() to do the right thing - remove
> > persistency, if it's there.  However, it's used by many filesystems.
> > We would have either to convert them all at once or split simple_unlink()
> > into "want persistent" and "don't want persistent" versions, the latter
> > being the old one.  In the course of the series almost all callers
> > would migrate to the replacement, leaving only two pathological cases
> > with the old one.  The same goes for simple_rmdir() (two callers left in
> > the end), simple_recursive_removal() (all callers gone in the end), etc.
> > That's a lot of noise and it's easier to start with d_make_discardable()
> > quietly accepting non-persistent dentries, then, in the end, add private
> > copies of simple_unlink() and simple_rmdir() for two weird users (configfs
> > and apparmorfs) and have those use dput() instead of d_make_discardable().
> > At that point we'd be left with all callers of d_make_discardable()
> > always passing persistent dentries, allowing to add a warning in it.
> >
> > [7/54] convert simple_{link,unlink,rmdir,rename,fill_super}() to new primitives
> >         See above re quietly accepting non-peristent dentries in
> > simple_unlink(), simple_rmdir(), etc.
> >
> >         Converting filesystems:
> > [8/54] convert ramfs and tmpfs
> > [9/54] procfs: make /self and /thread_self dentries persistent
> > [10/54] configfs, securityfs: kill_litter_super() not needed
> > [11/54] convert xenfs
> > [12/54] convert smackfs
> > [13/54] convert hugetlbfs
> > [14/54] convert mqueue
> > [15/54] convert bpf
> > [16/54] convert dlmfs
> > [17/54] convert fuse_ctl
> > [18/54] convert pstore
> > [19/54] convert tracefs
> > [20/54] convert debugfs
> > [21/54] debugfs: remove duplicate checks in callers of start_creating()
> > [22/54] convert efivarfs
> > [23/54] convert spufs
> > [24/54] convert ibmasmfs
> > [25/54] ibmasmfs: get rid of ibmasmfs_dir_ops
> > [26/54] convert devpts
> > [27/54] binderfs: use simple_start_creating()
> > [28/54] binderfs_binder_ctl_create(): kill a bogus check
> > [29/54] convert binderfs
> > [30/54] autofs_{rmdir,unlink}: dentry->d_fsdata->dentry == dentry there
> > [31/54] convert autofs
> > [32/54] convert binfmt_misc
> > [33/54] selinuxfs: don't stash the dentry of /policy_capabilities
> > [34/54] selinuxfs: new helper for attaching files to tree
> > [35/54] convert selinuxfs
> >
> >         Several functionfs fixes, before converting it, to make life
> > simpler for backporting:
> > [36/54] functionfs: don't abuse ffs_data_closed() on fs shutdown
> > [37/54] functionfs: don't bother with ffs->ref in ffs_data_{opened,closed}()
> > [38/54] functionfs: need to cancel ->reset_work in ->kill_sb()
> > [39/54] functionfs: fix the open/removal races
> >
> >         ... and back to filesystems conversions:
> >
> > [40/54] functionfs: switch to simple_remove_by_name()
> > [41/54] convert functionfs
> > [42/54] gadgetfs: switch to simple_remove_by_name()
> > [43/54] convert gadgetfs
> > [44/54] hypfs: don't pin dentries twice
> > [45/54] hypfs: switch hypfs_create_str() to returning int
> > [46/54] hypfs: swich hypfs_create_u64() to returning int
> > [47/54] convert hypfs
> > [48/54] convert rpc_pipefs
> > [49/54] convert nfsctl
> > [50/54] convert rust_binderfs
> >
> >         ... and no kill_litter_super() callers remain, so we
> > can take it out:
> > [51/54] get rid of kill_litter_super()
> >
> >         Followups:
> > [52/54] convert securityfs
> >         That was the last remaining user of simple_recursive_removal()
> > that did *not* mark things persistent.  Now the only places where
> > d_make_discardable() is still called for dentries that are not marked
> > persistent are the calls of simple_{unlink,rmdir}() in configfs and
> > apparmorfs.
> >
> > [53/54] kill securityfs_recursive_remove()
> >         Unused macro...
> >
> > [54/54] d_make_discardable(): warn if given a non-persistent dentry
> >
> > At this point there are very few call chains that might lead to
> > d_make_discardable() on a dentry that hadn't been made persistent:
> > calls of simple_unlink() and simple_rmdir() in configfs and
> > apparmorfs.
> >
> > Both filesystems do pin (part of) their contents in dcache, but
> > they are currently playing very unusual games with that.  Converting
> > them to more usual patterns might be possible, but it's definitely
> > going to be a long series of changes in both cases.
> >
> > For now the easiest solution is to have both stop using simple_unlink()
> > and simple_rmdir() - that allows to make d_make_discardable() warn
> > when given a non-persistent dentry.
> >
> > Rather than giving them full-blown private copies (with calls of
> > d_make_discardable() replaced with dput()), let's pull the parts of
> > simple_unlink() and simple_rmdir() that deal with timestamps and link
> > counts into separate helpers (__simple_unlink() and __simple_rmdir()
> > resp.) and have those used by configfs and apparmorfs.
> >
> 
> Hi Al, when I apply this patchset my Pixel 6 no longer enumerates on
> lsusb or ADB. It was quite hard to bisect to this point, as this is
> non-deterministic and seems to be setup specific. Note, I am using
> android-mainline, but my understanding is that this build does not
> have any out-of-tree USB patches, and that there are no vendor hooks
> in the build.
> 
> My apologies as I can't offer any other clues; there are no obviously
> bad dmesg logs and I'm still working on narrowing down the exact
> commit(s) that started this, but just wanted to send a FYI in case
> something stands out as obvious.

Note that I had to revert commit e5bf5ee26663 ("functionfs: fix the
open/removal races") from the stable backports, as it was causing issues
on the pixel devices it got backported to.  So perhaps look there?

thanks,

greg k-h

