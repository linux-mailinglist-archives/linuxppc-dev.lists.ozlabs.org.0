Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062CF480A71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 15:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNchy69xNz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 01:43:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lIcujQoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lIcujQoX; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNcf118Gbz3bW9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 01:40:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7597FB8117D;
 Tue, 28 Dec 2021 14:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAA3C36AE8;
 Tue, 28 Dec 2021 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640702436;
 bh=/gHh6wSsqs7tsKhQECNsvfkpI3mijjU4046ayPB9qjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lIcujQoXkybS88D+3KbHT9b+X3jx6JgeDBumRRBG/5h6lgxA26Q8V1GwgWWhF3ggb
 Basa8mTZ547KkCVlqJ3r7GmB6TcMbx4yfr34gk+qudSwJ3AcuyTzoUcIETtHJ0+LgQ
 yaDmTBimhNrwH19+mnEXRT6/AMrlWJUFm3AYa3qCEJQgTKJSnc8bv4rineJVevAxKc
 Gfh+9R+UVN7DfdlmBYaOU3Fgys1MlCLnt09FS5cIWpxVxslpbsYr7lHmjoc/NW8tY0
 kWBB4705iWRdOIGbD1nr4jGzolBttE2V3YkOR+0j4o7hpcXm4qew/Nwp4wiMg7C2DO
 HasSZgDdhjKtA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@infradead.org
Subject: [PATCH V2 04/17] asm-generic: compat: Cleanup duplicate definitions
Date: Tue, 28 Dec 2021 22:39:45 +0800
Message-Id: <20211228143958.3409187-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228143958.3409187-1-guoren@kernel.org>
References: <20211228143958.3409187-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

There are 7 64bit architectures that support Linux COMPAT mode to
run 32bit applications. A lot of definitions are duplicate:
 - COMPAT_USER_HZ
 - COMPAT_RLIM_INFINITY
 - COMPAT_OFF_T_MAX
 - __compat_uid_t, __compat_uid_t
 - compat_dev_t
 - compat_ipc_pid_t
 - struct compat_flock
 - struct compat_flock64
 - struct compat_statfs
 - struct compat_ipc64_perm, compat_semid64_ds,
	  compat_msqid64_ds, compat_shmid64_ds

Cleanup duplicate definitions and merge them into asm-generic.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/compat.h   | 108 +++-----------------------
 arch/mips/include/asm/compat.h    |  24 ++----
 arch/parisc/include/asm/compat.h  |  47 ++----------
 arch/powerpc/include/asm/compat.h |  47 ++----------
 arch/s390/include/asm/compat.h    | 109 +++-----------------------
 arch/sparc/include/asm/compat.h   |  39 ++++------
 arch/x86/include/asm/compat.h     | 114 +++-------------------------
 include/asm-generic/compat.h      | 122 ++++++++++++++++++++++++++++++
 8 files changed, 191 insertions(+), 419 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index 276328765408..f896486c80a9 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -5,9 +5,18 @@
 #ifndef __ASM_COMPAT_H
 #define __ASM_COMPAT_H
 
+#define COMPAT_RLIM_INFINITY		0xffffffff
+
 #define compat_mode_t compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
 #include <asm-generic/compat.h>
 
 #ifdef CONFIG_COMPAT
@@ -19,21 +28,15 @@ typedef u16		compat_mode_t;
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 
-#define COMPAT_USER_HZ		100
 #ifdef __AARCH64EB__
 #define COMPAT_UTS_MACHINE	"armv8b\0\0"
 #else
 #define COMPAT_UTS_MACHINE	"armv8l\0\0"
 #endif
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
 typedef u16		__compat_uid16_t;
 typedef u16		__compat_gid16_t;
-typedef u32		compat_dev_t;
 typedef s32		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
-typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
 #ifdef __AARCH64EB__
@@ -65,102 +68,9 @@ struct compat_stat {
 	compat_ulong_t	__unused4[2];
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_statfs {
-	int		f_type;
-	int		f_bsize;
-	int		f_blocks;
-	int		f_bfree;
-	int		f_bavail;
-	int		f_files;
-	int		f_ffree;
-	compat_fsid_t	f_fsid;
-	int		f_namelen;	/* SunOS ignores this field. */
-	int		f_frsize;
-	int		f_flags;
-	int		f_spare[4];
-};
-
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 #define compat_user_stack_pointer() (user_stack_pointer(task_pt_regs(current)))
 #define COMPAT_MINSIGSTKSZ	2048
 
-struct compat_ipc64_perm {
-	compat_key_t key;
-	__compat_uid32_t uid;
-	__compat_gid32_t gid;
-	__compat_uid32_t cuid;
-	__compat_gid32_t cgid;
-	unsigned short mode;
-	unsigned short __pad1;
-	unsigned short seq;
-	unsigned short __pad2;
-	compat_ulong_t unused1;
-	compat_ulong_t unused2;
-};
-
-struct compat_semid64_ds {
-	struct compat_ipc64_perm sem_perm;
-	compat_ulong_t sem_otime;
-	compat_ulong_t sem_otime_high;
-	compat_ulong_t sem_ctime;
-	compat_ulong_t sem_ctime_high;
-	compat_ulong_t sem_nsems;
-	compat_ulong_t __unused3;
-	compat_ulong_t __unused4;
-};
-
-struct compat_msqid64_ds {
-	struct compat_ipc64_perm msg_perm;
-	compat_ulong_t msg_stime;
-	compat_ulong_t msg_stime_high;
-	compat_ulong_t msg_rtime;
-	compat_ulong_t msg_rtime_high;
-	compat_ulong_t msg_ctime;
-	compat_ulong_t msg_ctime_high;
-	compat_ulong_t msg_cbytes;
-	compat_ulong_t msg_qnum;
-	compat_ulong_t msg_qbytes;
-	compat_pid_t   msg_lspid;
-	compat_pid_t   msg_lrpid;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
-struct compat_shmid64_ds {
-	struct compat_ipc64_perm shm_perm;
-	compat_size_t  shm_segsz;
-	compat_ulong_t shm_atime;
-	compat_ulong_t shm_atime_high;
-	compat_ulong_t shm_dtime;
-	compat_ulong_t shm_dtime_high;
-	compat_ulong_t shm_ctime;
-	compat_ulong_t shm_ctime_high;
-	compat_pid_t   shm_cpid;
-	compat_pid_t   shm_lpid;
-	compat_ulong_t shm_nattch;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
 static inline int is_compat_task(void)
 {
 	return test_thread_flag(TIF_32BIT);
diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/compat.h
index bbb3bc5a42fd..cc2d76953792 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -9,12 +9,17 @@
 #include <asm/page.h>
 #include <asm/ptrace.h>
 
+#define __compat_uid_t	__compat_uid_t
 typedef s32		__compat_uid_t;
 typedef s32		__compat_gid_t;
+
+#define __compat_uid32_t __compat_uid32_t
 typedef __compat_uid_t	__compat_uid32_t;
 typedef __compat_gid_t	__compat_gid32_t;
-#define __compat_uid32_t __compat_uid32_t
-#define __compat_gid32_t __compat_gid32_t
+
+#define compat_flock		compat_flock
+#define compat_statfs		compat_statfs
+#define compat_ipc64_perm	compat_ipc64_perm
 
 #define _COMPAT_NSIG		128		/* Don't ask !$@#% ...	*/
 #define _COMPAT_NSIG_BPW	32
@@ -22,12 +27,9 @@ typedef u32		compat_sigset_word;
 
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"mips\0\0\0"
 
-typedef u32		compat_dev_t;
 typedef u32		compat_nlink_t;
-typedef s32		compat_ipc_pid_t;
 typedef struct {
 	s32	val[2];
 } compat_fsid_t;
@@ -69,14 +71,6 @@ struct compat_flock {
 #define F_SETLK64	34
 #define F_SETLKW64	35
 
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
 struct compat_statfs {
 	int		f_type;
 	int		f_bsize;
@@ -92,10 +86,6 @@ struct compat_statfs {
 	int		f_spare[5];
 };
 
-#define COMPAT_RLIM_INFINITY	0x7fffffffUL
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 struct compat_ipc64_perm {
 	compat_key_t key;
 	__compat_uid32_t uid;
diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index c04f5a637c39..113476345c76 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -8,19 +8,21 @@
 #include <linux/sched.h>
 #include <linux/thread_info.h>
 
+#define COMPAT_RLIM_INFINITY	0xffffffff
+
 #define compat_mode_t compat_mode_t
 typedef u16	compat_mode_t;
 
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16	compat_ipc_pid_t;
+
+#define compat_ipc64_perm compat_ipc64_perm
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ 		100
 #define COMPAT_UTS_MACHINE	"parisc\0\0"
 
-typedef u32	__compat_uid_t;
-typedef u32	__compat_gid_t;
-typedef u32	compat_dev_t;
 typedef u16	compat_nlink_t;
-typedef u16	compat_ipc_pid_t;
 
 struct compat_stat {
 	compat_dev_t		st_dev;	/* dev_t is 32 bits on parisc */
@@ -53,37 +55,6 @@ struct compat_stat {
 	u32			st_spare4[3];
 };
 
-struct compat_flock {
-	short			l_type;
-	short			l_whence;
-	compat_off_t		l_start;
-	compat_off_t		l_len;
-	compat_pid_t		l_pid;
-};
-
-struct compat_flock64 {
-	short			l_type;
-	short			l_whence;
-	compat_loff_t		l_start;
-	compat_loff_t		l_len;
-	compat_pid_t		l_pid;
-};
-
-struct compat_statfs {
-	s32		f_type;
-	s32		f_bsize;
-	s32		f_blocks;
-	s32		f_bfree;
-	s32		f_bavail;
-	s32		f_files;
-	s32		f_ffree;
-	__kernel_fsid_t	f_fsid;
-	s32		f_namelen;
-	s32		f_frsize;
-	s32		f_flags;
-	s32		f_spare[4];
-};
-
 struct compat_sigcontext {
 	compat_int_t sc_flags;
 	compat_int_t sc_gr[32]; /* PSW in sc_gr[0] */
@@ -93,10 +64,6 @@ struct compat_sigcontext {
 	compat_int_t sc_sar; /* cr11 */
 };
 
-#define COMPAT_RLIM_INFINITY 0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 struct compat_ipc64_perm {
 	compat_key_t key;
 	__compat_uid_t uid;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 83d8f70779cb..cda6e6ef6478 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -8,20 +8,22 @@
 #include <linux/types.h>
 #include <linux/sched.h>
 
+#define COMPAT_RLIM_INFINITY		0xffffffff
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		compat_ipc_pid_t;
+
+#define compat_ipc64_perm compat_ipc64_perm
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #ifdef __BIG_ENDIAN__
 #define COMPAT_UTS_MACHINE	"ppc\0\0"
 #else
 #define COMPAT_UTS_MACHINE	"ppcle\0\0"
 #endif
 
-typedef u32		__compat_uid_t;
-typedef u32		__compat_gid_t;
-typedef u32		compat_dev_t;
 typedef s16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
 typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
@@ -44,41 +46,6 @@ struct compat_stat {
 	u32		__unused4[2];
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_statfs {
-	int		f_type;
-	int		f_bsize;
-	int		f_blocks;
-	int		f_bfree;
-	int		f_bavail;
-	int		f_files;
-	int		f_ffree;
-	compat_fsid_t	f_fsid;
-	int		f_namelen;	/* SunOS ignores this field. */
-	int		f_frsize;
-	int		f_flags;
-	int		f_spare[4];
-};
-
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 /*
  * ipc64_perm is actually 32/64bit clean but since the compat layer refers to
  * it we may as well define it.
diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
index 0f14b3188b1b..23e27ca1439c 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -9,9 +9,21 @@
 #include <linux/sched/task_stack.h>
 #include <linux/thread_info.h>
 
+#define COMPAT_RLIM_INFINITY	0xffffffff
+
 #define compat_mode_t	compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_dev_t	compat_dev_t
+typedef u16		compat_dev_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
 #include <asm-generic/compat.h>
 
 #define __TYPE_IS_PTR(t) (!__builtin_types_compatible_p( \
@@ -53,14 +65,9 @@ typedef u16		compat_mode_t;
 			 PSW32_MASK_MCHECK | PSW32_MASK_PSTATE | \
 			 PSW32_ASC_PRIMARY)
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"s390\0\0\0\0"
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
-typedef u16		compat_dev_t;
 typedef u16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
 typedef __kernel_fsid_t	compat_fsid_t;
 
 typedef struct {
@@ -102,37 +109,6 @@ struct compat_stat {
 	u32		__unused5;
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-struct compat_statfs {
-	u32		f_type;
-	u32		f_bsize;
-	u32		f_blocks;
-	u32		f_bfree;
-	u32		f_bavail;
-	u32		f_files;
-	u32		f_ffree;
-	compat_fsid_t	f_fsid;
-	u32		f_namelen;
-	u32		f_frsize;
-	u32		f_flags;
-	u32		f_spare[4];
-};
-
 struct compat_statfs64 {
 	u32		f_type;
 	u32		f_bsize;
@@ -148,10 +124,6 @@ struct compat_statfs64 {
 	u32		f_spare[4];
 };
 
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 /*
  * A pointer passed in from user mode. This should not
  * be used for syscall parameters, just declare them
@@ -174,61 +146,4 @@ static inline int is_compat_task(void)
 
 #endif
 
-struct compat_ipc64_perm {
-	compat_key_t key;
-	__compat_uid32_t uid;
-	__compat_gid32_t gid;
-	__compat_uid32_t cuid;
-	__compat_gid32_t cgid;
-	compat_mode_t mode;
-	unsigned short __pad1;
-	unsigned short seq;
-	unsigned short __pad2;
-	unsigned int __unused1;
-	unsigned int __unused2;
-};
-
-struct compat_semid64_ds {
-	struct compat_ipc64_perm sem_perm;
-	compat_ulong_t sem_otime;
-	compat_ulong_t sem_otime_high;
-	compat_ulong_t sem_ctime;
-	compat_ulong_t sem_ctime_high;
-	compat_ulong_t sem_nsems;
-	compat_ulong_t __unused1;
-	compat_ulong_t __unused2;
-};
-
-struct compat_msqid64_ds {
-	struct compat_ipc64_perm msg_perm;
-	compat_ulong_t msg_stime;
-	compat_ulong_t msg_stime_high;
-	compat_ulong_t msg_rtime;
-	compat_ulong_t msg_rtime_high;
-	compat_ulong_t msg_ctime;
-	compat_ulong_t msg_ctime_high;
-	compat_ulong_t msg_cbytes;
-	compat_ulong_t msg_qnum;
-	compat_ulong_t msg_qbytes;
-	compat_pid_t   msg_lspid;
-	compat_pid_t   msg_lrpid;
-	compat_ulong_t __unused1;
-	compat_ulong_t __unused2;
-};
-
-struct compat_shmid64_ds {
-	struct compat_ipc64_perm shm_perm;
-	compat_size_t  shm_segsz;
-	compat_ulong_t shm_atime;
-	compat_ulong_t shm_atime_high;
-	compat_ulong_t shm_dtime;
-	compat_ulong_t shm_dtime_high;
-	compat_ulong_t shm_ctime;
-	compat_ulong_t shm_ctime_high;
-	compat_pid_t   shm_cpid;
-	compat_pid_t   shm_lpid;
-	compat_ulong_t shm_nattch;
-	compat_ulong_t __unused1;
-	compat_ulong_t __unused2;
-};
 #endif /* _ASM_S390X_COMPAT_H */
diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
index 108078751bb5..00650d21cc51 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -9,16 +9,26 @@
 #define compat_mode_t	compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_dev_t	compat_dev_t
+typedef u16		compat_dev_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
+#define compat_flock	compat_flock
+#define compat_flock64	compat_flock64
+
+#define compat_ipc64_perm compat_ipc64_perm
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"sparc\0\0"
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
-typedef u16		compat_dev_t;
 typedef s16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
 typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
@@ -93,25 +103,6 @@ struct compat_flock64 {
 	short		__unused;
 };
 
-struct compat_statfs {
-	int		f_type;
-	int		f_bsize;
-	int		f_blocks;
-	int		f_bfree;
-	int		f_bavail;
-	int		f_files;
-	int		f_ffree;
-	compat_fsid_t	f_fsid;
-	int		f_namelen;	/* SunOS ignores this field. */
-	int		f_frsize;
-	int		f_flags;
-	int		f_spare[4];
-};
-
-#define COMPAT_RLIM_INFINITY 0x7fffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 struct compat_ipc64_perm {
 	compat_key_t key;
 	__compat_uid32_t uid;
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 8d19a212f4f2..bd3d9a33ffd0 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -12,19 +12,26 @@
 #include <asm/user32.h>
 #include <asm/unistd.h>
 
+#define COMPAT_RLIM_INFINITY	0xffffffff
+
 #define compat_mode_t	compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_dev_t	compat_dev_t
+typedef u16		compat_dev_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"i686\0\0"
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
-typedef u16		compat_dev_t;
 typedef u16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
 typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
@@ -50,103 +57,6 @@ struct compat_stat {
 	u32		__unused5;
 };
 
-struct compat_flock {
-	short		l_type;
-	short		l_whence;
-	compat_off_t	l_start;
-	compat_off_t	l_len;
-	compat_pid_t	l_pid;
-};
-
-/*
- * IA32 uses 4 byte alignment for 64 bit quantities,
- * so we need to pack this structure.
- */
-struct compat_flock64 {
-	short		l_type;
-	short		l_whence;
-	compat_loff_t	l_start;
-	compat_loff_t	l_len;
-	compat_pid_t	l_pid;
-} __attribute__((packed));
-
-struct compat_statfs {
-	int		f_type;
-	int		f_bsize;
-	int		f_blocks;
-	int		f_bfree;
-	int		f_bavail;
-	int		f_files;
-	int		f_ffree;
-	compat_fsid_t	f_fsid;
-	int		f_namelen;	/* SunOS ignores this field. */
-	int		f_frsize;
-	int		f_flags;
-	int		f_spare[4];
-};
-
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
-struct compat_ipc64_perm {
-	compat_key_t key;
-	__compat_uid32_t uid;
-	__compat_gid32_t gid;
-	__compat_uid32_t cuid;
-	__compat_gid32_t cgid;
-	unsigned short mode;
-	unsigned short __pad1;
-	unsigned short seq;
-	unsigned short __pad2;
-	compat_ulong_t unused1;
-	compat_ulong_t unused2;
-};
-
-struct compat_semid64_ds {
-	struct compat_ipc64_perm sem_perm;
-	compat_ulong_t sem_otime;
-	compat_ulong_t sem_otime_high;
-	compat_ulong_t sem_ctime;
-	compat_ulong_t sem_ctime_high;
-	compat_ulong_t sem_nsems;
-	compat_ulong_t __unused3;
-	compat_ulong_t __unused4;
-};
-
-struct compat_msqid64_ds {
-	struct compat_ipc64_perm msg_perm;
-	compat_ulong_t msg_stime;
-	compat_ulong_t msg_stime_high;
-	compat_ulong_t msg_rtime;
-	compat_ulong_t msg_rtime_high;
-	compat_ulong_t msg_ctime;
-	compat_ulong_t msg_ctime_high;
-	compat_ulong_t msg_cbytes;
-	compat_ulong_t msg_qnum;
-	compat_ulong_t msg_qbytes;
-	compat_pid_t   msg_lspid;
-	compat_pid_t   msg_lrpid;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
-struct compat_shmid64_ds {
-	struct compat_ipc64_perm shm_perm;
-	compat_size_t  shm_segsz;
-	compat_ulong_t shm_atime;
-	compat_ulong_t shm_atime_high;
-	compat_ulong_t shm_dtime;
-	compat_ulong_t shm_dtime_high;
-	compat_ulong_t shm_ctime;
-	compat_ulong_t shm_ctime_high;
-	compat_pid_t   shm_cpid;
-	compat_pid_t   shm_lpid;
-	compat_ulong_t shm_nattch;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
 #ifdef CONFIG_X86_X32_ABI
 #define COMPAT_USE_64BIT_TIME \
 	(!!(task_pt_regs(current)->orig_ax & __X32_SYSCALL_BIT))
diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
index d46c0201cc34..5d4cb53e4dfc 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -2,6 +2,18 @@
 #ifndef __ASM_GENERIC_COMPAT_H
 #define __ASM_GENERIC_COMPAT_H
 
+#ifndef COMPAT_USER_HZ
+#define COMPAT_USER_HZ		100
+#endif
+
+#ifndef COMPAT_RLIM_INFINITY
+#define COMPAT_RLIM_INFINITY	0x7fffffff
+#endif
+
+#ifndef COMPAT_OFF_T_MAX
+#define COMPAT_OFF_T_MAX	0x7fffffff
+#endif
+
 /* These types are common across all compat ABIs */
 typedef u32 compat_size_t;
 typedef s32 compat_ssize_t;
@@ -24,6 +36,11 @@ typedef u32 compat_caddr_t;
 typedef u32 compat_aio_context_t;
 typedef u32 compat_old_sigset_t;
 
+#ifndef __compat_uid_t
+typedef u32 __compat_uid_t;
+typedef u32 __compat_gid_t;
+#endif
+
 #ifndef __compat_uid32_t
 typedef u32 __compat_uid32_t;
 typedef u32 __compat_gid32_t;
@@ -47,4 +64,109 @@ typedef u32 compat_sigset_word;
 #define _COMPAT_NSIG_BPW 32
 #endif
 
+#ifndef compat_dev_t
+typedef u32 compat_dev_t;
+#endif
+
+#ifndef compat_ipc_pid_t
+typedef s32 compat_ipc_pid_t;
+#endif
+
+#ifndef compat_flock
+struct compat_flock {
+	compat_short_t	l_type;
+	compat_short_t	l_whence;
+	compat_off_t	l_start;
+	compat_off_t	l_len;
+	compat_pid_t	l_pid;
+} __attribute__((packed));
+#endif
+
+#ifndef compat_flock64
+struct compat_flock64 {
+	compat_short_t	l_type;
+	compat_short_t	l_whence;
+	compat_loff_t	l_start;
+	compat_loff_t	l_len;
+	compat_pid_t	l_pid;
+} __attribute__((packed));
+#endif
+
+#ifndef compat_statfs
+struct compat_statfs {
+	compat_uint_t	f_type;
+	compat_uint_t	f_bsize;
+	compat_uint_t	f_blocks;
+	compat_uint_t	f_bfree;
+	compat_uint_t	f_bavail;
+	compat_uint_t	f_files;
+	compat_uint_t	f_ffree;
+	__kernel_fsid_t	f_fsid;
+	compat_uint_t	f_namelen;
+	compat_uint_t	f_frsize;
+	compat_uint_t	f_flags;
+	compat_uint_t	f_spare[4];
+} __attribute__((packed));
+#endif
+
+#ifndef compat_ipc64_perm
+struct compat_ipc64_perm {
+	compat_key_t key;
+	__compat_uid32_t uid;
+	__compat_gid32_t gid;
+	__compat_uid32_t cuid;
+	__compat_gid32_t cgid;
+	compat_mode_t	mode;
+	unsigned char	__pad1[4 - sizeof(compat_mode_t)];
+	compat_ushort_t	seq;
+	compat_ushort_t	__pad2;
+	compat_ulong_t	unused1;
+	compat_ulong_t	unused2;
+} __attribute__((packed));
+
+struct compat_semid64_ds {
+	struct compat_ipc64_perm sem_perm;
+	compat_ulong_t sem_otime;
+	compat_ulong_t sem_otime_high;
+	compat_ulong_t sem_ctime;
+	compat_ulong_t sem_ctime_high;
+	compat_ulong_t sem_nsems;
+	compat_ulong_t __unused3;
+	compat_ulong_t __unused4;
+} __attribute__((packed));
+
+struct compat_msqid64_ds {
+	struct compat_ipc64_perm msg_perm;
+	compat_ulong_t msg_stime;
+	compat_ulong_t msg_stime_high;
+	compat_ulong_t msg_rtime;
+	compat_ulong_t msg_rtime_high;
+	compat_ulong_t msg_ctime;
+	compat_ulong_t msg_ctime_high;
+	compat_ulong_t msg_cbytes;
+	compat_ulong_t msg_qnum;
+	compat_ulong_t msg_qbytes;
+	compat_pid_t   msg_lspid;
+	compat_pid_t   msg_lrpid;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+} __attribute__((packed));
+
+struct compat_shmid64_ds {
+	struct compat_ipc64_perm shm_perm;
+	compat_size_t  shm_segsz;
+	compat_ulong_t shm_atime;
+	compat_ulong_t shm_atime_high;
+	compat_ulong_t shm_dtime;
+	compat_ulong_t shm_dtime_high;
+	compat_ulong_t shm_ctime;
+	compat_ulong_t shm_ctime_high;
+	compat_pid_t   shm_cpid;
+	compat_pid_t   shm_lpid;
+	compat_ulong_t shm_nattch;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+} __attribute__((packed));
+#endif
+
 #endif
-- 
2.25.1

