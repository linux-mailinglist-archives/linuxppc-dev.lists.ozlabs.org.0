Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C7D5683
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 16:39:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rkpq4zCHzDqfy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 01:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lj8zukym"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rkml36mczDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 01:37:24 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id w3so1656865pgt.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/B2mtONxD2aUUUWc6yHqo7WZ2+z/3rGUm8xsJdHeFlE=;
 b=Lj8zukymA0sDB06/PVyFl2qC1tTNBj6EDTo6/J2hETeYV78fHolsai0mr03eaIArja
 KsK277Aa7y+wLCvLSsjjmwXZCl5MfOO4yZei/2qOQQW5QjrLA8p/U0F11dOKYZCopHuy
 4M2zPtiHVp5IiR6PSry+bPusCLE8Q8RsT84e0kXw0vHZTJDBTDiy6RJsmtCYYno7jl6A
 FbkrpUDhISVKBdun1GeluJF7/JLBk1VPwP4cIpXygR4pmqBzp42Avg5C1SObJWziSQ8G
 k6chHBqqyyiiIptQResLsm2xDHx3RFC8nu43yybhuWwrcXlW3mO/s7MvXtL17g9U52dp
 +u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/B2mtONxD2aUUUWc6yHqo7WZ2+z/3rGUm8xsJdHeFlE=;
 b=DYn3oBQcizqmtH8YaAuK7XbFhWXJUiX7LQEkEHYfFZmetnCibYrDT/ErtE/cBqRO8Q
 huk82lR328B1bhjKdQG3/pdjoudXfXQ0do0BmezUeee2JiMAbJrX0S077xzXhsnynKoz
 U7obUHajKuxbqmOJJbEV6BczztqYg9b3DKQSBmBkp4X7DSI+DQuuYLJ/q5TMstJ21L/6
 wMWy9+TIvIIYfCuaa2hfikxEV+53SpW87td+xfmsJGGChrKnlT0RyhgBLwzdHCAwri+1
 npEu7RVdKzrXxHGWVU32r2NrbG7OZ+5MwQCcRtc67cyihWgrqJK6ZxBtKJQeRVweSAEQ
 crLQ==
X-Gm-Message-State: APjAAAUUCjbYD0Lr+epUXeR4/eUwoGefJxpGh1+RQuZe1DaoMSdsEzs2
 RdIFu4HbR8WMLGM60cIr8w==
X-Google-Smtp-Source: APXvYqxtd4iYq8d229eM8HohdPVRKToCp0NPU4y8AkzdtstFyKEKZZPr2hY1yjXR0hNSOMBwFslpKg==
X-Received: by 2002:a63:6d0:: with SMTP id 199mr27268024pgg.96.1570977439548; 
 Sun, 13 Oct 2019 07:37:19 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q132sm14914966pfq.16.2019.10.13.07.37.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Oct 2019 07:37:18 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linux-xfs@vger.kernel.org
Subject: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Date: Sun, 13 Oct 2019 22:37:00 +0800
Message-Id: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
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
Cc: Eric Sandeen <esandeen@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Pingfan Liu <kernelfans@gmail.com>, Dave Chinner <dchinner@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When using fadump (fireware assist dump) mode on powerpc, a mismatch
between grub xfs driver and kernel xfs driver has been obsevered.  Note:
fadump boots up in the following sequence: fireware -> grub reads kernel
and initramfs -> kernel boots.

The process to reproduce this mismatch:
  - On powerpc, boot kernel with fadump=on and edit /etc/kdump.conf.
  - Replacing "path /var/crash" with "path /var/crashnew", then, "kdumpctl
    restart" to rebuild the initramfs. Detail about the rebuilding looks
    like: mkdumprd /boot/initramfs-`uname -r`.img.tmp;
          mv /boot/initramfs-`uname -r`.img.tmp /boot/initramfs-`uname -r`.img
          sync
  - "echo c >/proc/sysrq-trigger".

The result:
The dump image will not be saved under /var/crashnew/* as expected, but
still saved under /var/crash.

The root cause:
As Eric pointed out that on xfs, 'sync' ensures the consistency by writing
back metadata to xlog, but not necessary to fsblock. This raises issue if
grub can not replay the xlog before accessing the xfs files. Since the
above dir entry of initramfs should be saved as inline data with xfs_inode,
so xfs_fs_sync_fs() does not guarantee it written to fsblock.

umount can be used to write metadata fsblock, but the filesystem can not be
umounted if still in use.

There are two ways to fix this mismatch, either grub or xfs. It may be
easier to do this in xfs side by introducing an interface to flush metadata
to fsblock explicitly.

With this patch, metadata can be written to fsblock by:
  # update AIL
  sync
  # new introduced interface to flush metadata to fsblock
  mount -o remount,metasync mountpoint

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Dave Chinner <dchinner@redhat.com>
Cc: Eric Sandeen <esandeen@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
To: linux-xfs@vger.kernel.org
---
 fs/xfs/xfs_mount.h      |  1 +
 fs/xfs/xfs_super.c      | 15 ++++++++++++++-
 fs/xfs/xfs_trans.h      |  2 ++
 fs/xfs/xfs_trans_ail.c  | 26 +++++++++++++++++++++++++-
 fs/xfs/xfs_trans_priv.h |  1 +
 5 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index fdb60e0..85f32e6 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -243,6 +243,7 @@ typedef struct xfs_mount {
 #define XFS_MOUNT_FILESTREAMS	(1ULL << 24)	/* enable the filestreams
 						   allocator */
 #define XFS_MOUNT_NOATTR2	(1ULL << 25)	/* disable use of attr2 format */
+#define XFS_MOUNT_METASYNC	(1ull << 26)	/* write meta to fsblock */
 
 #define XFS_MOUNT_DAX		(1ULL << 62)	/* TEST ONLY! */
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 8d1df9f..41df810 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -59,7 +59,7 @@ enum {
 	Opt_filestreams, Opt_quota, Opt_noquota, Opt_usrquota, Opt_grpquota,
 	Opt_prjquota, Opt_uquota, Opt_gquota, Opt_pquota,
 	Opt_uqnoenforce, Opt_gqnoenforce, Opt_pqnoenforce, Opt_qnoenforce,
-	Opt_discard, Opt_nodiscard, Opt_dax, Opt_err,
+	Opt_discard, Opt_nodiscard, Opt_dax, Opt_metasync, Opt_err
 };
 
 static const match_table_t tokens = {
@@ -106,6 +106,7 @@ static const match_table_t tokens = {
 	{Opt_discard,	"discard"},	/* Discard unused blocks */
 	{Opt_nodiscard,	"nodiscard"},	/* Do not discard unused blocks */
 	{Opt_dax,	"dax"},		/* Enable direct access to bdev pages */
+	{Opt_metasync,	"metasync"},	/* one shot to write meta to fsblock */
 	{Opt_err,	NULL},
 };
 
@@ -338,6 +339,9 @@ xfs_parseargs(
 			mp->m_flags |= XFS_MOUNT_DAX;
 			break;
 #endif
+		case Opt_metasync:
+			mp->m_flags |= XFS_MOUNT_METASYNC;
+			break;
 		default:
 			xfs_warn(mp, "unknown mount option [%s].", p);
 			return -EINVAL;
@@ -1259,6 +1263,9 @@ xfs_fs_remount(
 			mp->m_flags |= XFS_MOUNT_SMALL_INUMS;
 			mp->m_maxagi = xfs_set_inode_alloc(mp, sbp->sb_agcount);
 			break;
+		case Opt_metasync:
+			mp->m_flags |= XFS_MOUNT_METASYNC;
+			break;
 		default:
 			/*
 			 * Logically we would return an error here to prevent
@@ -1286,6 +1293,12 @@ xfs_fs_remount(
 		}
 	}
 
+	if (mp->m_flags & XFS_MOUNT_METASYNC) {
+		xfs_ail_push_sync(mp->m_ail);
+		/* one shot flag */
+		mp->m_flags &= ~XFS_MOUNT_METASYNC;
+	}
+
 	/* ro -> rw */
 	if ((mp->m_flags & XFS_MOUNT_RDONLY) && !(*flags & SB_RDONLY)) {
 		if (mp->m_flags & XFS_MOUNT_NORECOVERY) {
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 64d7f17..fcdb902 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -242,6 +242,8 @@ void		xfs_trans_buf_set_type(struct xfs_trans *, struct xfs_buf *,
 void		xfs_trans_buf_copy_type(struct xfs_buf *dst_bp,
 					struct xfs_buf *src_bp);
 
+void		xfs_ail_push_sync(struct xfs_ail *ailp);
+
 extern kmem_zone_t	*xfs_trans_zone;
 
 #endif	/* __XFS_TRANS_H__ */
diff --git a/fs/xfs/xfs_trans_ail.c b/fs/xfs/xfs_trans_ail.c
index 6ccfd75..b8d8df1 100644
--- a/fs/xfs/xfs_trans_ail.c
+++ b/fs/xfs/xfs_trans_ail.c
@@ -488,7 +488,11 @@ xfsaild_push(
 	xfs_trans_ail_cursor_done(&cur);
 	spin_unlock(&ailp->ail_lock);
 
-	if (xfs_buf_delwri_submit_nowait(&ailp->ail_buf_list))
+	if (unlikely(mp->m_flags & XFS_MOUNT_METASYNC)) {
+		xfs_buf_delwri_submit(&ailp->ail_buf_list);
+		ailp->ail_log_flush++;
+		wake_up_all(&ailp->pushed_que);
+	} else if (xfs_buf_delwri_submit_nowait(&ailp->ail_buf_list))
 		ailp->ail_log_flush++;
 
 	if (!count || XFS_LSN_CMP(lsn, target) >= 0) {
@@ -641,6 +645,25 @@ xfs_ail_push(
 	wake_up_process(ailp->ail_task);
 }
 
+void
+xfs_ail_push_sync(
+	struct xfs_ail		*ailp)
+{
+	xfs_lsn_t		sync_lsn;
+	DEFINE_WAIT(wait);
+
+	sync_lsn = xfs_ail_max_lsn(ailp);
+	for (;;) {
+		xfs_ail_push(ailp, sync_lsn);
+		prepare_to_wait(&ailp->pushed_que, &wait, TASK_INTERRUPTIBLE);
+		if (XFS_LSN_CMP(READ_ONCE(ailp->ail_target_prev),
+			sync_lsn) >= 0)
+			break;
+		schedule();
+	}
+	finish_wait(&ailp->pushed_que, &wait);
+}
+
 /*
  * Push out all items in the AIL immediately
  */
@@ -834,6 +857,7 @@ xfs_trans_ail_init(
 	spin_lock_init(&ailp->ail_lock);
 	INIT_LIST_HEAD(&ailp->ail_buf_list);
 	init_waitqueue_head(&ailp->ail_empty);
+	init_waitqueue_head(&ailp->pushed_que);
 
 	ailp->ail_task = kthread_run(xfsaild, ailp, "xfsaild/%s",
 			ailp->ail_mount->m_fsname);
diff --git a/fs/xfs/xfs_trans_priv.h b/fs/xfs/xfs_trans_priv.h
index 2e073c1..9fe3cc6 100644
--- a/fs/xfs/xfs_trans_priv.h
+++ b/fs/xfs/xfs_trans_priv.h
@@ -61,6 +61,7 @@ struct xfs_ail {
 	int			ail_log_flush;
 	struct list_head	ail_buf_list;
 	wait_queue_head_t	ail_empty;
+	wait_queue_head_t	pushed_que;
 };
 
 /*
-- 
2.7.5

