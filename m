Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C20577D01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 10:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZDL0y1sz3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 18:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mail104.syd.optusnet.com.au (client-ip=211.29.132.246; helo=mail104.syd.optusnet.com.au; envelope-from=david@fromorbit.com; receiver=<UNKNOWN>)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au [211.29.132.246])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZCw3k0Zz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 18:01:16 +1000 (AEST)
Received: from dread.disaster.area (pa49-181-2-147.pa.nsw.optusnet.com.au [49.181.2.147])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 9D31C62C7A1;
	Mon, 18 Jul 2022 18:01:14 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1oDLgm-002IGb-SV; Mon, 18 Jul 2022 18:01:12 +1000
Date: Mon, 18 Jul 2022 18:01:12 +1000
From: Dave Chinner <david@fromorbit.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: BUG xfs_buf while running tests/xfs/435 (next-20220715)
Message-ID: <20220718080112.GS3861211@dread.disaster.area>
References: <C6CAF8E3-0447-465D-9C83-F55910739BE2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C6CAF8E3-0447-465D-9C83-F55910739BE2@linux.ibm.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=62d5134b
	a=ivVLWpVy4j68lT4lJFbQgw==:117 a=ivVLWpVy4j68lT4lJFbQgw==:17
	a=kj9zAlcOel0A:10 a=RgO8CyIxsXoA:10 a=7-415B0cAAAA:8 a=20KFwNOVAAAA:8
	a=VnNF1IyMAAAA:8 a=HLe1o-Eu0s_4hV-mcYgA:9 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: linux-xfs@vger.kernel.org, riteshh@linux.ibm.com, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dchinner@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 12:01:53PM +0530, Sachin Sant wrote:
> While running xfstests (specifically xfs/435) on a IBM Power server booted with
> 5.19.0-rc6-next-20220715 following warnings are seen:
> 
> 
> [  110.954136] XFS (sdb2): Unmounting Filesystem
> [  110.968860] XFS (sdb1): Unmounting Filesystem
> [  111.115807] =============================================================================
> [  111.115817] BUG xfs_buf (Tainted: G            E     ): Objects remaining in xfs_buf on __kmem_cache_shutdown()
> [  111.115824] -----------------------------------------------------------------------------
> [  111.115824] 
> [  111.115828] Slab 0x0000000074cdc09a objects=170 used=1 fp=0x000000005f24a5e1 flags=0x13ffff800000200(slab|node=1|zone=0|lastcpupid=0x7ffff)
> [  111.115840] CPU: 26 PID: 4704 Comm: modprobe Tainted: G            E      5.19.0-rc6-next-20220715 #3
> [  111.115849] Call Trace:
> [  111.115852] [c00000002985b9a0] [c000000000830bec] dump_stack_lvl+0x70/0xa4 (unreliable)
> [  111.115867] [c00000002985b9e0] [c0000000004ef6f8] slab_err+0xd8/0xf0
> [  111.115877] [c00000002985bad0] [c0000000004f6cbc] __kmem_cache_shutdown+0x1fc/0x560
> [  111.115884] [c00000002985bbf0] [c0000000004534c8] kmem_cache_destroy+0xa8/0x1f0
> [  111.115893] [c00000002985bc80] [c00800000ccf30e4] xfs_buf_terminate+0x2c/0x48 [xfs]
> [  111.115977] [c00000002985bca0] [c00800000cd6f55c] exit_xfs_fs+0x90/0x20b34 [xfs]
> [  111.116045] [c00000002985bcd0] [c00000000023b7e0] sys_delete_module+0x1e0/0x3c0
> [  111.116053] [c00000002985bdb0] [c00000000003302c] system_call_exception+0x17c/0x350
> [  111.116062] [c00000002985be10] [c00000000000c53c] system_call_common+0xec/0x270
> [  111.116070] --- interrupt: c00 at 0x7fff8c158b88
> [  111.116075] NIP:  00007fff8c158b88 LR: 000000013adb0398 CTR: 0000000000000000
> [  111.116080] REGS: c00000002985be80 TRAP: 0c00   Tainted: G            E       (5.19.0-rc6-next-20220715)
> [  111.116086] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24008282  XER: 00000000
> [  111.116103] IRQMASK: 0 
> [  111.116103] GPR00: 0000000000000081 00007ffffe17dff0 00007fff8c227300 000001003f2f0c18 
> [  111.116103] GPR04: 0000000000000800 000000000000000a 1999999999999999 0000000000000000 
> [  111.116103] GPR08: 00007fff8c1b7830 0000000000000000 0000000000000000 0000000000000000 
> [  111.116103] GPR12: 0000000000000000 00007fff8c72ca50 000000013adba650 000000013adba648 
> [  111.116103] GPR16: 0000000000000000 0000000000000001 0000000000000000 000000013adba428 
> [  111.116103] GPR20: 000000013ade0068 0000000000000000 00007ffffe17f948 000001003f2f02a0 
> [  111.116103] GPR24: 0000000000000000 00007ffffe17f948 000001003f2f0c18 0000000000000000 
> [  111.116103] GPR28: 0000000000000000 000001003f2f0bb0 000001003f2f0c18 000001003f2f0bb0 
> [  111.116162] NIP [00007fff8c158b88] 0x7fff8c158b88
> [  111.116166] LR [000000013adb0398] 0x13adb0398
> [  111.116170] --- interrupt: c00
> [  111.116173] Disabling lock debugging due to kernel taint
> [  111.116184] Object 0x000000007e079655 @offset=18816
> [  111.116189] =============================================================================
> [  111.116193] BUG xfs_buf (Tainted: G    B       E     ): Objects remaining in xfs_buf on __kmem_cache_shutdown()
> [  111.116198] -----------------------------------------------------------------------------
> [  111.116198] 
> [  111.116202] Slab 0x000000008186f78a objects=170 used=12 fp=0x000000008233ac7d flags=0x13ffff800000200(slab|node=1|zone=0|lastcpupid=0x7ffff)
> [  111.116210] CPU: 26 PID: 4704 Comm: modprobe Tainted: G    B       E      5.19.0-rc6-next-20220715 #3
> [  111.116216] Call Trace:
> [  111.116218] [c00000002985b9a0] [c000000000830bec] dump_stack_lvl+0x70/0xa4 (unreliable)
> [  111.116227] [c00000002985b9e0] [c0000000004ef6f8] slab_err+0xd8/0xf0
> [  111.116234] [c00000002985bad0] [c0000000004f6cbc] __kmem_cache_shutdown+0x1fc/0x560
> [  111.116241] [c00000002985bbf0] [c0000000004534c8] kmem_cache_destroy+0xa8/0x1f0
> [  111.116248] [c00000002985bc80] [c00800000ccf30e4] xfs_buf_terminate+0x2c/0x48 [xfs]
> [  111.116312] [c00000002985bca0] [c00800000cd6f55c] exit_xfs_fs+0x90/0x20b34 [xfs]
> [  111.116379] [c00000002985bcd0] [c00000000023b7e0] sys_delete_module+0x1e0/0x3c0
> [  111.116386] [c00000002985bdb0] [c00000000003302c] system_call_exception+0x17c/0x350
> [  111.116392] [c00000002985be10] [c00000000000c53c] system_call_common+0xec/0x270
> [  111.116400] --- interrupt: c00 at 0x7fff8c158b88
> [  111.116404] NIP:  00007fff8c158b88 LR: 000000013adb0398 CTR: 0000000000000000
> [  111.116409] REGS: c00000002985be80 TRAP: 0c00   Tainted: G    B       E       (5.19.0-rc6-next-20220715)
> [  111.116414] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24008282  XER: 00000000
> [  111.116430] IRQMASK: 0 
> [  111.116430] GPR00: 0000000000000081 00007ffffe17dff0 00007fff8c227300 000001003f2f0c18 
> [  111.116430] GPR04: 0000000000000800 000000000000000a 1999999999999999 0000000000000000 
> [  111.116430] GPR08: 00007fff8c1b7830 0000000000000000 0000000000000000 0000000000000000 
> [  111.116430] GPR12: 0000000000000000 00007fff8c72ca50 000000013adba650 000000013adba648 
> [  111.116430] GPR16: 0000000000000000 0000000000000001 0000000000000000 000000013adba428 
> [  111.116430] GPR20: 000000013ade0068 0000000000000000 00007ffffe17f948 000001003f2f02a0 
> [  111.116430] GPR24: 0000000000000000 00007ffffe17f948 000001003f2f0c18 0000000000000000 
> [  111.116430] GPR28: 0000000000000000 000001003f2f0bb0 000001003f2f0c18 000001003f2f0bb0 
> [  111.116488] NIP [00007fff8c158b88] 0x7fff8c158b88
> [  111.116492] LR [000000013adb0398] 0x13adb0398
> [  111.116496] --- interrupt: c00
> [  111.116504] Object 0x000000002b93c535 @offset=5376
> [  111.116508] Object 0x000000009be4058b @offset=16896
> [  111.116511] Object 0x00000000c1d5c895 @offset=24960
> [  111.116515] Object 0x0000000097fb6f84 @offset=30336
> [  111.116518] Object 0x00000000213fb535 @offset=43008
> [  111.116521] Object 0x0000000045473fa3 @offset=43392
> [  111.116525] Object 0x000000006462ef89 @offset=44160
> [  111.116528] Object 0x000000000c85ce0b @offset=44544
> [  111.116531] Object 0x0000000059166af4 @offset=45312
> [  111.116535] Object 0x00000000e7b40b45 @offset=46848
> [  111.116538] Object 0x00000000bc6ce716 @offset=54528
> [  111.116541] Object 0x000000005f7be1fa @offset=64512
> [  111.116546] ------------[ cut here ]------------

Yup, Darrick reported this once and couldn't reproduce it. We know
it's a result of result of converting the xfs_buffer cache to
rcu-protected lockless lookups and for some reason and the rcu
callbacks that free these objects seem not to have been processed
before the module is removed. We have an rcu_barrier() in
xfs_destroy_caches() to avoid this ......

Wait. What is xfs_buf_terminate()? I don't recall that function....

Yeah, there's the bug.

exit_xfs_fs(void)
{
....
        xfs_buf_terminate();
        xfs_mru_cache_uninit();
        xfs_destroy_workqueues();
        xfs_destroy_caches();
....

xfs_buf_terminate() calls kmem_cache_destroy() before the
rcu_barrier() call in xfs_destroy_caches().....

Try the (slightly smoke tested only) patch below.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

xfs: xfs_buf cache destroy isn't RCU safe

From: Dave Chinner <dchinner@redhat.com>

Darrick and Sachin Sant reported that xfs/435 and xfs/436 would
report an non-empty xfs_buf slab on module remove. This isn't easily
to reproduce, but is clearly a side effect of converting the buffer
caceh to RUC freeing and lockless lookups. Sachin bisected and
Darrick hit it when testing the patchset directly.

Turns out that the xfs_buf slab is not destroyed when all the other
XFS slab caches are destroyed. Instead, it's got it's own little
wrapper function that gets called separately, and so it doesn't have
an rcu_barrier() call in it that is needed to drain all the rcu
callbacks before the slab is destroyed.

Fix it by removing the xfs_buf_init/terminate wrappers that just
allocate and destroy the xfs_buf slab, and move them to the same
place that all the other slab caches are set up and destroyed.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: 298f34224506 ("xfs: lockless buffer lookup")
Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/xfs_buf.c   | 25 +------------------------
 fs/xfs/xfs_buf.h   |  6 ++----
 fs/xfs/xfs_super.c | 22 +++++++++++++---------
 3 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 4affba7c6669..f8bdc4698492 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -21,7 +21,7 @@
 #include "xfs_error.h"
 #include "xfs_ag.h"
 
-static struct kmem_cache *xfs_buf_cache;
+struct kmem_cache *xfs_buf_cache;
 
 /*
  * Locking orders
@@ -2300,29 +2300,6 @@ xfs_buf_delwri_pushbuf(
 	return error;
 }
 
-int __init
-xfs_buf_init(void)
-{
-	xfs_buf_cache = kmem_cache_create("xfs_buf", sizeof(struct xfs_buf), 0,
-					 SLAB_HWCACHE_ALIGN |
-					 SLAB_RECLAIM_ACCOUNT |
-					 SLAB_MEM_SPREAD,
-					 NULL);
-	if (!xfs_buf_cache)
-		goto out;
-
-	return 0;
-
- out:
-	return -ENOMEM;
-}
-
-void
-xfs_buf_terminate(void)
-{
-	kmem_cache_destroy(xfs_buf_cache);
-}
-
 void xfs_buf_set_ref(struct xfs_buf *bp, int lru_ref)
 {
 	/*
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index f65ef4d34ff7..04ff86a8eeef 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -15,6 +15,8 @@
 #include <linux/uio.h>
 #include <linux/list_lru.h>
 
+extern struct kmem_cache *xfs_buf_cache;
+
 /*
  *	Base types
  */
@@ -307,10 +309,6 @@ extern int xfs_buf_delwri_submit(struct list_head *);
 extern int xfs_buf_delwri_submit_nowait(struct list_head *);
 extern int xfs_buf_delwri_pushbuf(struct xfs_buf *, struct list_head *);
 
-/* Buffer Daemon Setup Routines */
-extern int xfs_buf_init(void);
-extern void xfs_buf_terminate(void);
-
 static inline xfs_daddr_t xfs_buf_daddr(struct xfs_buf *bp)
 {
 	return bp->b_maps[0].bm_bn;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 4edee1d3784a..3d27ba1295c9 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -1967,11 +1967,19 @@ xfs_init_caches(void)
 {
 	int		error;
 
+	xfs_buf_cache = kmem_cache_create("xfs_buf", sizeof(struct xfs_buf), 0,
+					 SLAB_HWCACHE_ALIGN |
+					 SLAB_RECLAIM_ACCOUNT |
+					 SLAB_MEM_SPREAD,
+					 NULL);
+	if (!xfs_buf_cache)
+		goto out;
+
 	xfs_log_ticket_cache = kmem_cache_create("xfs_log_ticket",
 						sizeof(struct xlog_ticket),
 						0, 0, NULL);
 	if (!xfs_log_ticket_cache)
-		goto out;
+		goto out_destroy_buf_cache;
 
 	error = xfs_btree_init_cur_caches();
 	if (error)
@@ -2145,6 +2153,8 @@ xfs_init_caches(void)
 	xfs_btree_destroy_cur_caches();
  out_destroy_log_ticket_cache:
 	kmem_cache_destroy(xfs_log_ticket_cache);
+ out_destroy_buf_cache:
+	kmem_cache_destroy(xfs_buf_cache);
  out:
 	return -ENOMEM;
 }
@@ -2178,6 +2188,7 @@ xfs_destroy_caches(void)
 	xfs_defer_destroy_item_caches();
 	xfs_btree_destroy_cur_caches();
 	kmem_cache_destroy(xfs_log_ticket_cache);
+	kmem_cache_destroy(xfs_buf_cache);
 }
 
 STATIC int __init
@@ -2283,13 +2294,9 @@ init_xfs_fs(void)
 	if (error)
 		goto out_destroy_wq;
 
-	error = xfs_buf_init();
-	if (error)
-		goto out_mru_cache_uninit;
-
 	error = xfs_init_procfs();
 	if (error)
-		goto out_buf_terminate;
+		goto out_mru_cache_uninit;
 
 	error = xfs_sysctl_register();
 	if (error)
@@ -2346,8 +2353,6 @@ init_xfs_fs(void)
 	xfs_sysctl_unregister();
  out_cleanup_procfs:
 	xfs_cleanup_procfs();
- out_buf_terminate:
-	xfs_buf_terminate();
  out_mru_cache_uninit:
 	xfs_mru_cache_uninit();
  out_destroy_wq:
@@ -2373,7 +2378,6 @@ exit_xfs_fs(void)
 	kset_unregister(xfs_kset);
 	xfs_sysctl_unregister();
 	xfs_cleanup_procfs();
-	xfs_buf_terminate();
 	xfs_mru_cache_uninit();
 	xfs_destroy_workqueues();
 	xfs_destroy_caches();
