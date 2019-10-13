Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A14ECD587C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 00:06:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rwkV6qPQzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 09:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=darrick.wong@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="NX/0fXXP"; 
 dkim-atps=neutral
X-Greylist: delayed 19799 seconds by postgrey-1.36 at bilbo;
 Mon, 14 Oct 2019 09:04:30 AEDT
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rwhZ35dWzDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:29 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9DGYQO8050048;
 Sun, 13 Oct 2019 16:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=3I9jUL+494RvQfSIeQYXiSrwTDK3GAYZqSrS2hnhCX8=;
 b=NX/0fXXPQCOwAhrtHWIdpbPXxBpZoDRkGrhqlDHko2xMSu6Y5XJHpOSWbMPqqTkMJ4B0
 EFYcPQAgE1GDHBixv9+t52BXDlu71lzGuIMadMpJYp1IARJAPfME+IYX3C4n+AfiIWDi
 bTP71vkwms8WLbpx64goIzUuA9Qb/9tswG73Sy962hJCJq7Em5u/Q1Obdjik8kJB59g5
 9OiwyiLRFxhHXYrJR76fLVcfl+oJeZaWIf3piRoPbtLR0m8I4sSa7CqVT2RAONBch3BS
 3ShoSburswS3RAz6yr54i3B6DsQDll0395tM9PBa/5LbcNFUyzjAH8A1AM3lCwriOVVE Hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vk68u4g0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Oct 2019 16:34:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9DGX3oX107583;
 Sun, 13 Oct 2019 16:34:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vkrbh62qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Oct 2019 16:34:25 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9DGYIeV008400;
 Sun, 13 Oct 2019 16:34:18 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Oct 2019 09:34:18 -0700
Date: Sun, 13 Oct 2019 09:34:17 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191013163417.GQ13108@magnolia>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9409
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910130166
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9409
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910130166
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
Cc: linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Eric Sandeen <esandeen@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Dave Chinner <dchinner@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 13, 2019 at 10:37:00PM +0800, Pingfan Liu wrote:
> When using fadump (fireware assist dump) mode on powerpc, a mismatch
> between grub xfs driver and kernel xfs driver has been obsevered.  Note:
> fadump boots up in the following sequence: fireware -> grub reads kernel
> and initramfs -> kernel boots.
> 
> The process to reproduce this mismatch:
>   - On powerpc, boot kernel with fadump=on and edit /etc/kdump.conf.
>   - Replacing "path /var/crash" with "path /var/crashnew", then, "kdumpctl
>     restart" to rebuild the initramfs. Detail about the rebuilding looks
>     like: mkdumprd /boot/initramfs-`uname -r`.img.tmp;
>           mv /boot/initramfs-`uname -r`.img.tmp /boot/initramfs-`uname -r`.img
>           sync
>   - "echo c >/proc/sysrq-trigger".
> 
> The result:
> The dump image will not be saved under /var/crashnew/* as expected, but
> still saved under /var/crash.
> 
> The root cause:
> As Eric pointed out that on xfs, 'sync' ensures the consistency by writing
> back metadata to xlog, but not necessary to fsblock. This raises issue if
> grub can not replay the xlog before accessing the xfs files. Since the
> above dir entry of initramfs should be saved as inline data with xfs_inode,
> so xfs_fs_sync_fs() does not guarantee it written to fsblock.
> 
> umount can be used to write metadata fsblock, but the filesystem can not be
> umounted if still in use.
> 
> There are two ways to fix this mismatch, either grub or xfs. It may be
> easier to do this in xfs side by introducing an interface to flush metadata
> to fsblock explicitly.
> 
> With this patch, metadata can be written to fsblock by:
>   # update AIL
>   sync
>   # new introduced interface to flush metadata to fsblock
>   mount -o remount,metasync mountpoint

I think this ought to be an ioctl or some sort of generic call since the
jbd2 filesystems (ext3, ext4, ocfs2) suffer from the same "$BOOTLOADER
is too dumb to recover logs but still wants to write to the fs"
checkpointing problem.

(Or maybe we should just put all that stuff in a vfat filesystem, I
don't know...)

--D

> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
> Cc: Dave Chinner <dchinner@redhat.com>
> Cc: Eric Sandeen <esandeen@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> To: linux-xfs@vger.kernel.org
> ---
>  fs/xfs/xfs_mount.h      |  1 +
>  fs/xfs/xfs_super.c      | 15 ++++++++++++++-
>  fs/xfs/xfs_trans.h      |  2 ++
>  fs/xfs/xfs_trans_ail.c  | 26 +++++++++++++++++++++++++-
>  fs/xfs/xfs_trans_priv.h |  1 +
>  5 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
> index fdb60e0..85f32e6 100644
> --- a/fs/xfs/xfs_mount.h
> +++ b/fs/xfs/xfs_mount.h
> @@ -243,6 +243,7 @@ typedef struct xfs_mount {
>  #define XFS_MOUNT_FILESTREAMS	(1ULL << 24)	/* enable the filestreams
>  						   allocator */
>  #define XFS_MOUNT_NOATTR2	(1ULL << 25)	/* disable use of attr2 format */
> +#define XFS_MOUNT_METASYNC	(1ull << 26)	/* write meta to fsblock */
>  
>  #define XFS_MOUNT_DAX		(1ULL << 62)	/* TEST ONLY! */
>  
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 8d1df9f..41df810 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -59,7 +59,7 @@ enum {
>  	Opt_filestreams, Opt_quota, Opt_noquota, Opt_usrquota, Opt_grpquota,
>  	Opt_prjquota, Opt_uquota, Opt_gquota, Opt_pquota,
>  	Opt_uqnoenforce, Opt_gqnoenforce, Opt_pqnoenforce, Opt_qnoenforce,
> -	Opt_discard, Opt_nodiscard, Opt_dax, Opt_err,
> +	Opt_discard, Opt_nodiscard, Opt_dax, Opt_metasync, Opt_err
>  };
>  
>  static const match_table_t tokens = {
> @@ -106,6 +106,7 @@ static const match_table_t tokens = {
>  	{Opt_discard,	"discard"},	/* Discard unused blocks */
>  	{Opt_nodiscard,	"nodiscard"},	/* Do not discard unused blocks */
>  	{Opt_dax,	"dax"},		/* Enable direct access to bdev pages */
> +	{Opt_metasync,	"metasync"},	/* one shot to write meta to fsblock */
>  	{Opt_err,	NULL},
>  };
>  
> @@ -338,6 +339,9 @@ xfs_parseargs(
>  			mp->m_flags |= XFS_MOUNT_DAX;
>  			break;
>  #endif
> +		case Opt_metasync:
> +			mp->m_flags |= XFS_MOUNT_METASYNC;
> +			break;
>  		default:
>  			xfs_warn(mp, "unknown mount option [%s].", p);
>  			return -EINVAL;
> @@ -1259,6 +1263,9 @@ xfs_fs_remount(
>  			mp->m_flags |= XFS_MOUNT_SMALL_INUMS;
>  			mp->m_maxagi = xfs_set_inode_alloc(mp, sbp->sb_agcount);
>  			break;
> +		case Opt_metasync:
> +			mp->m_flags |= XFS_MOUNT_METASYNC;
> +			break;
>  		default:
>  			/*
>  			 * Logically we would return an error here to prevent
> @@ -1286,6 +1293,12 @@ xfs_fs_remount(
>  		}
>  	}
>  
> +	if (mp->m_flags & XFS_MOUNT_METASYNC) {
> +		xfs_ail_push_sync(mp->m_ail);
> +		/* one shot flag */
> +		mp->m_flags &= ~XFS_MOUNT_METASYNC;

Wait, so the mount flag magically disables itself?

This really sounds like a system call, not the kinds of long term
behavioral modifications that mount options are for.

> +	}
> +
>  	/* ro -> rw */
>  	if ((mp->m_flags & XFS_MOUNT_RDONLY) && !(*flags & SB_RDONLY)) {
>  		if (mp->m_flags & XFS_MOUNT_NORECOVERY) {
> diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
> index 64d7f17..fcdb902 100644
> --- a/fs/xfs/xfs_trans.h
> +++ b/fs/xfs/xfs_trans.h
> @@ -242,6 +242,8 @@ void		xfs_trans_buf_set_type(struct xfs_trans *, struct xfs_buf *,
>  void		xfs_trans_buf_copy_type(struct xfs_buf *dst_bp,
>  					struct xfs_buf *src_bp);
>  
> +void		xfs_ail_push_sync(struct xfs_ail *ailp);
> +
>  extern kmem_zone_t	*xfs_trans_zone;
>  
>  #endif	/* __XFS_TRANS_H__ */
> diff --git a/fs/xfs/xfs_trans_ail.c b/fs/xfs/xfs_trans_ail.c
> index 6ccfd75..b8d8df1 100644
> --- a/fs/xfs/xfs_trans_ail.c
> +++ b/fs/xfs/xfs_trans_ail.c
> @@ -488,7 +488,11 @@ xfsaild_push(
>  	xfs_trans_ail_cursor_done(&cur);
>  	spin_unlock(&ailp->ail_lock);
>  
> -	if (xfs_buf_delwri_submit_nowait(&ailp->ail_buf_list))
> +	if (unlikely(mp->m_flags & XFS_MOUNT_METASYNC)) {
> +		xfs_buf_delwri_submit(&ailp->ail_buf_list);

I guess this never fails, because write IO is 100% successful?

--D

> +		ailp->ail_log_flush++;
> +		wake_up_all(&ailp->pushed_que);
> +	} else if (xfs_buf_delwri_submit_nowait(&ailp->ail_buf_list))
>  		ailp->ail_log_flush++;
>  
>  	if (!count || XFS_LSN_CMP(lsn, target) >= 0) {
> @@ -641,6 +645,25 @@ xfs_ail_push(
>  	wake_up_process(ailp->ail_task);
>  }
>  
> +void
> +xfs_ail_push_sync(
> +	struct xfs_ail		*ailp)
> +{
> +	xfs_lsn_t		sync_lsn;
> +	DEFINE_WAIT(wait);
> +
> +	sync_lsn = xfs_ail_max_lsn(ailp);
> +	for (;;) {
> +		xfs_ail_push(ailp, sync_lsn);
> +		prepare_to_wait(&ailp->pushed_que, &wait, TASK_INTERRUPTIBLE);
> +		if (XFS_LSN_CMP(READ_ONCE(ailp->ail_target_prev),
> +			sync_lsn) >= 0)
> +			break;
> +		schedule();
> +	}
> +	finish_wait(&ailp->pushed_que, &wait);
> +}
> +
>  /*
>   * Push out all items in the AIL immediately
>   */
> @@ -834,6 +857,7 @@ xfs_trans_ail_init(
>  	spin_lock_init(&ailp->ail_lock);
>  	INIT_LIST_HEAD(&ailp->ail_buf_list);
>  	init_waitqueue_head(&ailp->ail_empty);
> +	init_waitqueue_head(&ailp->pushed_que);
>  
>  	ailp->ail_task = kthread_run(xfsaild, ailp, "xfsaild/%s",
>  			ailp->ail_mount->m_fsname);
> diff --git a/fs/xfs/xfs_trans_priv.h b/fs/xfs/xfs_trans_priv.h
> index 2e073c1..9fe3cc6 100644
> --- a/fs/xfs/xfs_trans_priv.h
> +++ b/fs/xfs/xfs_trans_priv.h
> @@ -61,6 +61,7 @@ struct xfs_ail {
>  	int			ail_log_flush;
>  	struct list_head	ail_buf_list;
>  	wait_queue_head_t	ail_empty;
> +	wait_queue_head_t	pushed_que;
>  };
>  
>  /*
> -- 
> 2.7.5
> 
