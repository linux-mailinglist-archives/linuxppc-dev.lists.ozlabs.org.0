Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDCD5D94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 10:35:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sBhQ3YkCzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 19:35:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rFnb1Ijo"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sBfP1xF2zDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 19:33:30 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q12so9973560pff.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=spiyR7phEd+F5UPvSSzYYiVKM1p+8Dq3IVuEyi3f1wA=;
 b=rFnb1Ijow6i2Cl8vtpAXVx5BCDyOTZsePFsF3JuFaXjwKogTDYdYDCI9bNfOq3xRY7
 lLx42TlxI86mGWBVcJ1nxzCOBkJ8moUHuo0LG2Clqyybccb6K7nnXoXD4YuMRO0t6Vkq
 2v7LBjkQkCws2iwM9QbAXRgQ7NboRyEZZdNpAp4NhfSc4/8tmmyG3sBpMWb2kP/+RLW4
 GkSekaI8Cev1XcBVoX2jy8bLLF3wA2+d7zRJq66FMQYbU8uhwVcqtEVJkM5cceRrc60q
 9nxEjpqFGDFwXflLRlFSA342BeDW1UHouuRko3/WUWerpPmdnTH6uu5B6AKrsNR5+3+z
 LWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=spiyR7phEd+F5UPvSSzYYiVKM1p+8Dq3IVuEyi3f1wA=;
 b=rBf1ErF0Hu2v14ZzaGUQ6rTKpItcIr9lO4cmC2QHKbuTZk1hxiAUI5nXFfvU9n7T3l
 NzMabTEh5HznrCU4i6fQOMLb2spYDReFoVHN4KBLPpC8Iz7sUFF2cUSGdiwcH/KIGsHd
 Mw7Orzz7S4X1JUKbJxW7rT9vMz/e0UNMQzKpRJTzgiUB265WPOW51VcKR7L595aKpYmm
 30pDxO2yHNKJ+oi0BBSsVvS4IOKbBBDQzczDifkLU7uHiiyjOyIyI0UkgZz7t11V3gCm
 kmzXhNkwB2qnUb0KB1KHle+Qg36pjl25xGUkh5naZ4vv0/H8hOMw2ib2FPLQOqjqGTYa
 9vfg==
X-Gm-Message-State: APjAAAUpXGH00O4VVK/KmpjEz+L/G1Jdulj1vAjzBvqk6uyZvjDayc6V
 r2gtkgyqL/EawP3QiMSTAz1WKZQ=
X-Google-Smtp-Source: APXvYqx5vmDUy+m+Bda/d6VNQg7//NaxLe07eZci1+AKagtbYwNsisTUX9xCJqxddg19dzfKb5FdrQ==
X-Received: by 2002:a17:90a:c684:: with SMTP id
 n4mr34844259pjt.33.1571042006613; 
 Mon, 14 Oct 2019 01:33:26 -0700 (PDT)
Received: from mypc ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r28sm21797162pfg.62.2019.10.14.01.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 01:33:25 -0700 (PDT)
Date: Mon, 14 Oct 2019 16:33:15 +0800
From: Pingfan Liu <kernelfans@gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191014083315.GA10091@mypc>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
 <20191013163417.GQ13108@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191013163417.GQ13108@magnolia>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Eric Sandeen <esandeen@redhat.com>, Jan Kara <jack@suse.com>,
 linux-xfs@vger.kernel.org, Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 13, 2019 at 09:34:17AM -0700, Darrick J. Wong wrote:
> On Sun, Oct 13, 2019 at 10:37:00PM +0800, Pingfan Liu wrote:
> > When using fadump (fireware assist dump) mode on powerpc, a mismatch
> > between grub xfs driver and kernel xfs driver has been obsevered.  Note:
> > fadump boots up in the following sequence: fireware -> grub reads kernel
> > and initramfs -> kernel boots.
> > 
> > The process to reproduce this mismatch:
> >   - On powerpc, boot kernel with fadump=on and edit /etc/kdump.conf.
> >   - Replacing "path /var/crash" with "path /var/crashnew", then, "kdumpctl
> >     restart" to rebuild the initramfs. Detail about the rebuilding looks
> >     like: mkdumprd /boot/initramfs-`uname -r`.img.tmp;
> >           mv /boot/initramfs-`uname -r`.img.tmp /boot/initramfs-`uname -r`.img
> >           sync
> >   - "echo c >/proc/sysrq-trigger".
> > 
> > The result:
> > The dump image will not be saved under /var/crashnew/* as expected, but
> > still saved under /var/crash.
> > 
> > The root cause:
> > As Eric pointed out that on xfs, 'sync' ensures the consistency by writing
> > back metadata to xlog, but not necessary to fsblock. This raises issue if
> > grub can not replay the xlog before accessing the xfs files. Since the
> > above dir entry of initramfs should be saved as inline data with xfs_inode,
> > so xfs_fs_sync_fs() does not guarantee it written to fsblock.
> > 
> > umount can be used to write metadata fsblock, but the filesystem can not be
> > umounted if still in use.
> > 
> > There are two ways to fix this mismatch, either grub or xfs. It may be
> > easier to do this in xfs side by introducing an interface to flush metadata
> > to fsblock explicitly.
> > 
> > With this patch, metadata can be written to fsblock by:
> >   # update AIL
> >   sync
> >   # new introduced interface to flush metadata to fsblock
> >   mount -o remount,metasync mountpoint
> 
> I think this ought to be an ioctl or some sort of generic call since the
> jbd2 filesystems (ext3, ext4, ocfs2) suffer from the same "$BOOTLOADER
> is too dumb to recover logs but still wants to write to the fs"
> checkpointing problem.
Yes, a syscall sounds more reasonable.
> 
> (Or maybe we should just put all that stuff in a vfat filesystem, I
> don't know...)
I think it is unavoidable to involve in each fs' implementation. What
about introducing an interface sync_to_fsblock(struct super_block *sb) in
the struct super_operations, then let each fs manage its own case?
> 
> --D
> 
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
> > Cc: Dave Chinner <dchinner@redhat.com>
> > Cc: Eric Sandeen <esandeen@redhat.com>
> > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > To: linux-xfs@vger.kernel.org
> > ---
> >  fs/xfs/xfs_mount.h      |  1 +
> >  fs/xfs/xfs_super.c      | 15 ++++++++++++++-
> >  fs/xfs/xfs_trans.h      |  2 ++
> >  fs/xfs/xfs_trans_ail.c  | 26 +++++++++++++++++++++++++-
> >  fs/xfs/xfs_trans_priv.h |  1 +
> >  5 files changed, 43 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
> > index fdb60e0..85f32e6 100644
> > --- a/fs/xfs/xfs_mount.h
> > +++ b/fs/xfs/xfs_mount.h
> > @@ -243,6 +243,7 @@ typedef struct xfs_mount {
> >  #define XFS_MOUNT_FILESTREAMS	(1ULL << 24)	/* enable the filestreams
> >  						   allocator */
> >  #define XFS_MOUNT_NOATTR2	(1ULL << 25)	/* disable use of attr2 format */
> > +#define XFS_MOUNT_METASYNC	(1ull << 26)	/* write meta to fsblock */
> >  
> >  #define XFS_MOUNT_DAX		(1ULL << 62)	/* TEST ONLY! */
> >  
> > diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> > index 8d1df9f..41df810 100644
> > --- a/fs/xfs/xfs_super.c
> > +++ b/fs/xfs/xfs_super.c
> > @@ -59,7 +59,7 @@ enum {
> >  	Opt_filestreams, Opt_quota, Opt_noquota, Opt_usrquota, Opt_grpquota,
> >  	Opt_prjquota, Opt_uquota, Opt_gquota, Opt_pquota,
> >  	Opt_uqnoenforce, Opt_gqnoenforce, Opt_pqnoenforce, Opt_qnoenforce,
> > -	Opt_discard, Opt_nodiscard, Opt_dax, Opt_err,
> > +	Opt_discard, Opt_nodiscard, Opt_dax, Opt_metasync, Opt_err
> >  };
> >  
> >  static const match_table_t tokens = {
> > @@ -106,6 +106,7 @@ static const match_table_t tokens = {
> >  	{Opt_discard,	"discard"},	/* Discard unused blocks */
> >  	{Opt_nodiscard,	"nodiscard"},	/* Do not discard unused blocks */
> >  	{Opt_dax,	"dax"},		/* Enable direct access to bdev pages */
> > +	{Opt_metasync,	"metasync"},	/* one shot to write meta to fsblock */
> >  	{Opt_err,	NULL},
> >  };
> >  
> > @@ -338,6 +339,9 @@ xfs_parseargs(
> >  			mp->m_flags |= XFS_MOUNT_DAX;
> >  			break;
> >  #endif
> > +		case Opt_metasync:
> > +			mp->m_flags |= XFS_MOUNT_METASYNC;
> > +			break;
> >  		default:
> >  			xfs_warn(mp, "unknown mount option [%s].", p);
> >  			return -EINVAL;
> > @@ -1259,6 +1263,9 @@ xfs_fs_remount(
> >  			mp->m_flags |= XFS_MOUNT_SMALL_INUMS;
> >  			mp->m_maxagi = xfs_set_inode_alloc(mp, sbp->sb_agcount);
> >  			break;
> > +		case Opt_metasync:
> > +			mp->m_flags |= XFS_MOUNT_METASYNC;
> > +			break;
> >  		default:
> >  			/*
> >  			 * Logically we would return an error here to prevent
> > @@ -1286,6 +1293,12 @@ xfs_fs_remount(
> >  		}
> >  	}
> >  
> > +	if (mp->m_flags & XFS_MOUNT_METASYNC) {
> > +		xfs_ail_push_sync(mp->m_ail);
> > +		/* one shot flag */
> > +		mp->m_flags &= ~XFS_MOUNT_METASYNC;
> 
> Wait, so the mount flag magically disables itself?
> 
> This really sounds like a system call, not the kinds of long term
> behavioral modifications that mount options are for.
> 
Yeah, this one-shot behavior is not suitable for mount.
> > +	}
> > +
> >  	/* ro -> rw */
> >  	if ((mp->m_flags & XFS_MOUNT_RDONLY) && !(*flags & SB_RDONLY)) {
> >  		if (mp->m_flags & XFS_MOUNT_NORECOVERY) {
> > diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> > index 64d7f17..fcdb902 100644
> > --- a/fs/xfs/xfs_trans.h
> > +++ b/fs/xfs/xfs_trans.h
> > @@ -242,6 +242,8 @@ void		xfs_trans_buf_set_type(struct xfs_trans *, struct xfs_buf *,
> >  void		xfs_trans_buf_copy_type(struct xfs_buf *dst_bp,
> >  					struct xfs_buf *src_bp);
> >  
> > +void		xfs_ail_push_sync(struct xfs_ail *ailp);
> > +
> >  extern kmem_zone_t	*xfs_trans_zone;
> >  
> >  #endif	/* __XFS_TRANS_H__ */
> > diff --git a/fs/xfs/xfs_trans_ail.c b/fs/xfs/xfs_trans_ail.c
> > index 6ccfd75..b8d8df1 100644
> > --- a/fs/xfs/xfs_trans_ail.c
> > +++ b/fs/xfs/xfs_trans_ail.c
> > @@ -488,7 +488,11 @@ xfsaild_push(
> >  	xfs_trans_ail_cursor_done(&cur);
> >  	spin_unlock(&ailp->ail_lock);
> >  
> > -	if (xfs_buf_delwri_submit_nowait(&ailp->ail_buf_list))
> > +	if (unlikely(mp->m_flags & XFS_MOUNT_METASYNC)) {
> > +		xfs_buf_delwri_submit(&ailp->ail_buf_list);
> 
> I guess this never fails, because write IO is 100% successful?
No, unfortunately, xfs_buf_delwri_submit() can return error. Do you
suggest to pass the error to the sync call?

Thanks for your kindly review.

Regards,
	Pingfan

[Keep the following original content unchanged. And cc Jan Kara, linux-fsdevel due to this
design may touch the vfs layer]
> 
> --D
> 
> > +		ailp->ail_log_flush++;
> > +		wake_up_all(&ailp->pushed_que);
> > +	} else if (xfs_buf_delwri_submit_nowait(&ailp->ail_buf_list))
> >  		ailp->ail_log_flush++;
> >  
> >  	if (!count || XFS_LSN_CMP(lsn, target) >= 0) {
> > @@ -641,6 +645,25 @@ xfs_ail_push(
> >  	wake_up_process(ailp->ail_task);
> >  }
> >  
> > +void
> > +xfs_ail_push_sync(
> > +	struct xfs_ail		*ailp)
> > +{
> > +	xfs_lsn_t		sync_lsn;
> > +	DEFINE_WAIT(wait);
> > +
> > +	sync_lsn = xfs_ail_max_lsn(ailp);
> > +	for (;;) {
> > +		xfs_ail_push(ailp, sync_lsn);
> > +		prepare_to_wait(&ailp->pushed_que, &wait, TASK_INTERRUPTIBLE);
> > +		if (XFS_LSN_CMP(READ_ONCE(ailp->ail_target_prev),
> > +			sync_lsn) >= 0)
> > +			break;
> > +		schedule();
> > +	}
> > +	finish_wait(&ailp->pushed_que, &wait);
> > +}
> > +
> >  /*
> >   * Push out all items in the AIL immediately
> >   */
> > @@ -834,6 +857,7 @@ xfs_trans_ail_init(
> >  	spin_lock_init(&ailp->ail_lock);
> >  	INIT_LIST_HEAD(&ailp->ail_buf_list);
> >  	init_waitqueue_head(&ailp->ail_empty);
> > +	init_waitqueue_head(&ailp->pushed_que);
> >  
> >  	ailp->ail_task = kthread_run(xfsaild, ailp, "xfsaild/%s",
> >  			ailp->ail_mount->m_fsname);
> > diff --git a/fs/xfs/xfs_trans_priv.h b/fs/xfs/xfs_trans_priv.h
> > index 2e073c1..9fe3cc6 100644
> > --- a/fs/xfs/xfs_trans_priv.h
> > +++ b/fs/xfs/xfs_trans_priv.h
> > @@ -61,6 +61,7 @@ struct xfs_ail {
> >  	int			ail_log_flush;
> >  	struct list_head	ail_buf_list;
> >  	wait_queue_head_t	ail_empty;
> > +	wait_queue_head_t	pushed_que;
> >  };
> >  
> >  /*
> > -- 
> > 2.7.5
> > 
