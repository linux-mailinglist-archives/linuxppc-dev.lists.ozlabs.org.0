Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E31FA819
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 07:08:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mGSB64FwzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 15:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=nixiaoming@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mCn60052zDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 13:07:53 +1000 (AEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9AE7864955D9665B464A;
 Tue, 16 Jun 2020 11:07:46 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 11:07:36 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <rth@twiddle.net>, <ink@jurassic.park.msu.ru>, <mattst88@gmail.com>,
 <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <tony.luck@intel.com>, <fenghua.yu@intel.com>, <geert@linux-m68k.org>,
 <monstr@monstr.eu>, <tsbogend@alpha.franken.de>,
 <James.Bottomley@HansenPartnership.com>, <deller@gmx.de>,
 <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>, <borntraeger@de.ibm.com>,
 <ysato@users.sourceforge.jp>, <dalias@libc.org>, <davem@davemloft.net>,
 <luto@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
 <hpa@zytor.com>, <chris@zankel.net>, <jcmvbkbc@gmail.com>,
 <mcgrof@kernel.org>, <keescook@chromium.org>, <yzaikin@google.com>,
 <peterz@infradead.org>, <acme@kernel.org>, <mark.rutland@arm.com>,
 <alexander.shishkin@linux.intel.com>, <jolsa@redhat.com>,
 <namhyung@kernel.org>, <christian@brauner.io>, <dhowells@redhat.com>,
 <arnd@arndb.de>, <minchan@kernel.org>, <nixiaoming@huawei.com>,
 <cyphar@cyphar.com>, <mszeredi@redhat.com>, <krzk@kernel.org>,
 <olof@lixom.net>, <sudeep.holla@arm.com>, <ebiederm@xmission.com>,
 <oleg@redhat.com>, <viro@zeniv.linux.org.uk>, <sargun@sargun.me>,
 <sfr@canb.auug.org.au>, <akpm@linux-foundation.org>, <jongk@linux-m68k.org>,
 <paulburton@kernel.org>, <zhouyanjie@wanyeetech.com>, <svens@stackframe.org>, 
 <npiggin@gmail.com>, <martin.petersen@oracle.com>, <flameeyes@flameeyes.com>, 
 <axboe@kernel.dk>, <bin.meng@windriver.com>, <vbabka@suse.cz>,
 <brgerst@gmail.com>, <samitolvanen@google.com>, <linux@dominikbrodowski.net>, 
 <rdunlap@infradead.org>, <paulmck@kernel.org>, <elver@google.com>,
 <bauerman@linux.ibm.com>, <yamada.masahiro@socionext.com>,
 <dvyukov@google.com>, <ak@linux.intel.com>, <ravi.bangoria@linux.ibm.com>,
 <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v3] All arch: remove system call sys_sysctl
Date: Tue, 16 Jun 2020 11:07:34 +0800
Message-ID: <20200616030734.87257-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 16 Jun 2020 15:06:54 +1000
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-api@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 alex.huangjianhui@huawei.com, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, chenzefeng2@huawei.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
sys_sysctl is actually unavailable: any input can only return an error.

We have been warning about people using the sysctl system call for years
and believe there are no more users.  Even if there are users of this
interface if they have not complained or fixed their code by now they
probably are not going to, so there is no point in warning them any
longer.

So completely remove sys_sysctl on all architectures.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

changes in v3:
  restore include/uapi/linux/sysctl.h
  rebase on commit bc7d17d55762 ("Add linux-next specific files for 20200615")
  Conflicts:
    arch/sh/include/uapi/asm/unistd_64.h
    arch/sh/kernel/syscalls_64.S

v2:
  According to Kees Cook's suggestion, completely remove sys_sysctl on all arch
  According to Eric W. Biederman's suggestion, update the commit log

V1: https://lore.kernel.org/lkml/1591683605-8585-1-git-send-email-nixiaoming@huawei.com/
  Delete the code of sys_sysctl and return -ENOSYS directly at the function entry
---
 arch/alpha/kernel/syscalls/syscall.tbl        |   2 +-
 arch/arm/configs/am200epdkit_defconfig        |   1 -
 arch/arm/tools/syscall.tbl                    |   2 +-
 arch/arm64/include/asm/unistd32.h             |   4 +-
 arch/ia64/kernel/syscalls/syscall.tbl         |   2 +-
 arch/m68k/kernel/syscalls/syscall.tbl         |   2 +-
 arch/microblaze/kernel/syscalls/syscall.tbl   |   2 +-
 arch/mips/configs/cu1000-neo_defconfig        |   1 -
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   2 +-
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   2 +-
 arch/parisc/kernel/syscalls/syscall.tbl       |   2 +-
 arch/powerpc/kernel/syscalls/syscall.tbl      |   2 +-
 arch/s390/kernel/syscalls/syscall.tbl         |   2 +-
 arch/sh/configs/dreamcast_defconfig           |   1 -
 arch/sh/configs/espt_defconfig                |   1 -
 arch/sh/configs/hp6xx_defconfig               |   1 -
 arch/sh/configs/landisk_defconfig             |   1 -
 arch/sh/configs/lboxre2_defconfig             |   1 -
 arch/sh/configs/microdev_defconfig            |   1 -
 arch/sh/configs/migor_defconfig               |   1 -
 arch/sh/configs/r7780mp_defconfig             |   1 -
 arch/sh/configs/r7785rp_defconfig             |   1 -
 arch/sh/configs/rts7751r2d1_defconfig         |   1 -
 arch/sh/configs/rts7751r2dplus_defconfig      |   1 -
 arch/sh/configs/se7206_defconfig              |   1 -
 arch/sh/configs/se7343_defconfig              |   1 -
 arch/sh/configs/se7619_defconfig              |   1 -
 arch/sh/configs/se7705_defconfig              |   1 -
 arch/sh/configs/se7750_defconfig              |   1 -
 arch/sh/configs/se7751_defconfig              |   1 -
 arch/sh/configs/secureedge5410_defconfig      |   1 -
 arch/sh/configs/sh03_defconfig                |   1 -
 arch/sh/configs/sh7710voipgw_defconfig        |   1 -
 arch/sh/configs/sh7757lcr_defconfig           |   1 -
 arch/sh/configs/sh7763rdp_defconfig           |   1 -
 arch/sh/configs/shmin_defconfig               |   1 -
 arch/sh/configs/titan_defconfig               |   1 -
 arch/sh/kernel/syscalls/syscall.tbl           |   2 +-
 arch/sparc/kernel/syscalls/syscall.tbl        |   2 +-
 arch/x86/entry/syscalls/syscall_32.tbl        |   2 +-
 arch/x86/entry/syscalls/syscall_64.tbl        |   2 +-
 arch/xtensa/kernel/syscalls/syscall.tbl       |   2 +-
 include/linux/compat.h                        |   1 -
 include/linux/syscalls.h                      |   2 -
 include/linux/sysctl.h                        |   6 +-
 kernel/Makefile                               |   2 +-
 kernel/sys_ni.c                               |   1 -
 kernel/sysctl_binary.c                        | 171 ------------------
 .../arch/powerpc/entry/syscalls/syscall.tbl   |   2 +-
 .../perf/arch/s390/entry/syscalls/syscall.tbl |   2 +-
 .../arch/x86/entry/syscalls/syscall_64.tbl    |   2 +-
 52 files changed, 24 insertions(+), 227 deletions(-)
 delete mode 100644 kernel/sysctl_binary.c

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index b249824c8267..0da7f1c61529 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -249,7 +249,7 @@
 316	common	mlockall			sys_mlockall
 317	common	munlockall			sys_munlockall
 318	common	sysinfo				sys_sysinfo
-319	common	_sysctl				sys_sysctl
+319	common	_sysctl				sys_ni_syscall
 # 320 was sys_idle
 321	common	oldumount			sys_oldumount
 322	common	swapon				sys_swapon
diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index f56ac394caf1..4e49d6cb2f62 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -3,7 +3,6 @@ CONFIG_LOCALVERSION="gum"
 CONFIG_SYSVIPC=y
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_EXPERT=y
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SHMEM is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index 7b3832d920ee..f36fda68fbe0 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -162,7 +162,7 @@
 146	common	writev			sys_writev
 147	common	getsid			sys_getsid
 148	common	fdatasync		sys_fdatasync
-149	common	_sysctl			sys_sysctl
+149	common	_sysctl			sys_ni_syscall
 150	common	mlock			sys_mlock
 151	common	munlock			sys_munlock
 152	common	mlockall		sys_mlockall
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index f8dafe900cb9..ca41bb747e9d 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -308,8 +308,8 @@ __SYSCALL(__NR_writev, compat_sys_writev)
 __SYSCALL(__NR_getsid, sys_getsid)
 #define __NR_fdatasync 148
 __SYSCALL(__NR_fdatasync, sys_fdatasync)
-#define __NR__sysctl 149
-__SYSCALL(__NR__sysctl, compat_sys_sysctl)
+			/* 149 was sys_sysctl */
+__SYSCALL(149, sys_ni_syscall)
 #define __NR_mlock 150
 __SYSCALL(__NR_mlock, sys_mlock)
 #define __NR_munlock 151
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index 6636a1aef36b..75b880b8516f 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -135,7 +135,7 @@
 123	common	writev				sys_writev
 124	common	pread64				sys_pread64
 125	common	pwrite64			sys_pwrite64
-126	common	_sysctl				sys_sysctl
+126	common	_sysctl				sys_ni_syscall
 127	common	mmap				sys_mmap
 128	common	munmap				sys_munmap
 129	common	mlock				sys_mlock
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 8cd84a7fbf57..91b21ad18d2d 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -156,7 +156,7 @@
 146	common	writev				sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
-149	common	_sysctl				sys_sysctl
+149	common	_sysctl				sys_ni_syscall
 150	common	mlock				sys_mlock
 151	common	munlock				sys_munlock
 152	common	mlockall			sys_mlockall
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index f581a02257ec..dc5f9fb0dac1 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -156,7 +156,7 @@
 146	common	writev				sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
-149	common	_sysctl				sys_sysctl
+149	common	_sysctl				sys_ni_syscall
 150	common	mlock				sys_mlock
 151	common	munlock				sys_munlock
 152	common	mlockall			sys_mlockall
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 9b05a8fdabe1..244654ce7e7c 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -17,7 +17,6 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_SYSCTL_SYSCALL=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index c85bdc3abe55..2653b28167ba 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -159,7 +159,7 @@
 149	n32	munlockall			sys_munlockall
 150	n32	vhangup				sys_vhangup
 151	n32	pivot_root			sys_pivot_root
-152	n32	_sysctl				compat_sys_sysctl
+152	n32	_sysctl				sys_ni_syscall
 153	n32	prctl				sys_prctl
 154	n32	adjtimex			sys_adjtimex_time32
 155	n32	setrlimit			compat_sys_setrlimit
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 9e08c40d3cb9..a4fd3bfc840f 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -159,7 +159,7 @@
 149	n64	munlockall			sys_munlockall
 150	n64	vhangup				sys_vhangup
 151	n64	pivot_root			sys_pivot_root
-152	n64	_sysctl				sys_sysctl
+152	n64	_sysctl				sys_ni_syscall
 153	n64	prctl				sys_prctl
 154	n64	adjtimex			sys_adjtimex
 155	n64	setrlimit			sys_setrlimit
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index a2b591d7c874..a30cfd414147 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -164,7 +164,7 @@
 150	o32	unused150			sys_ni_syscall
 151	o32	getsid				sys_getsid
 152	o32	fdatasync			sys_fdatasync
-153	o32	_sysctl				sys_sysctl			compat_sys_sysctl
+153	o32	_sysctl				sys_ni_syscall
 154	o32	mlock				sys_mlock
 155	o32	munlock				sys_munlock
 156	o32	mlockall			sys_mlockall
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 98e7442e4d7a..a47bc1906be5 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -163,7 +163,7 @@
 146	common	writev			sys_writev			compat_sys_writev
 147	common	getsid			sys_getsid
 148	common	fdatasync		sys_fdatasync
-149	common	_sysctl			sys_sysctl			compat_sys_sysctl
+149	common	_sysctl			sys_ni_syscall
 150	common	mlock			sys_mlock
 151	common	munlock			sys_munlock
 152	common	mlockall		sys_mlockall
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 72fb9dd88e16..a60163f22d89 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -197,7 +197,7 @@
 146	common	writev				sys_writev			compat_sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
-149	nospu	_sysctl				sys_sysctl			compat_sys_sysctl
+149	nospu	_sysctl				sys_ni_syscall
 150	common	mlock				sys_mlock
 151	common	munlock				sys_munlock
 152	common	mlockall			sys_mlockall
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index b731fcb03f1b..f17aaf6fe5de 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -138,7 +138,7 @@
 146  common	writev			sys_writev			compat_sys_writev
 147  common	getsid			sys_getsid			sys_getsid
 148  common	fdatasync		sys_fdatasync			sys_fdatasync
-149  common	_sysctl			sys_sysctl			compat_sys_sysctl
+149  common	_sysctl			sys_ni_syscall
 150  common	mlock			sys_mlock			sys_mlock
 151  common	munlock			sys_munlock			sys_munlock
 152  common	mlockall		sys_mlockall			sys_mlockall
diff --git a/arch/sh/configs/dreamcast_defconfig b/arch/sh/configs/dreamcast_defconfig
index ae067e0b15e3..6a82c7b8ff32 100644
--- a/arch/sh/configs/dreamcast_defconfig
+++ b/arch/sh/configs/dreamcast_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/espt_defconfig b/arch/sh/configs/espt_defconfig
index a5b865a75d22..9a988c347e9d 100644
--- a/arch/sh/configs/espt_defconfig
+++ b/arch/sh/configs/espt_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
 CONFIG_IPC_NS=y
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/arch/sh/configs/hp6xx_defconfig b/arch/sh/configs/hp6xx_defconfig
index a92db6694ce2..70e6605d7f7e 100644
--- a/arch/sh/configs/hp6xx_defconfig
+++ b/arch/sh/configs/hp6xx_defconfig
@@ -3,7 +3,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7709=y
diff --git a/arch/sh/configs/landisk_defconfig b/arch/sh/configs/landisk_defconfig
index 567af752b1bb..ba6ec042606f 100644
--- a/arch/sh/configs/landisk_defconfig
+++ b/arch/sh/configs/landisk_defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_KALLSYMS_EXTRA_PASS=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/lboxre2_defconfig b/arch/sh/configs/lboxre2_defconfig
index 10f6d371ce2c..05e4ac6fed5f 100644
--- a/arch/sh/configs/lboxre2_defconfig
+++ b/arch/sh/configs/lboxre2_defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_KALLSYMS_EXTRA_PASS=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/microdev_defconfig b/arch/sh/configs/microdev_defconfig
index ed84d1303acf..c65667d00313 100644
--- a/arch/sh/configs/microdev_defconfig
+++ b/arch/sh/configs/microdev_defconfig
@@ -2,7 +2,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH4_202=y
diff --git a/arch/sh/configs/migor_defconfig b/arch/sh/configs/migor_defconfig
index 494a1675c226..dec9316f65d5 100644
--- a/arch/sh/configs/migor_defconfig
+++ b/arch/sh/configs/migor_defconfig
@@ -4,7 +4,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/arch/sh/configs/r7780mp_defconfig b/arch/sh/configs/r7780mp_defconfig
index c97ec60cff27..e922659fdadb 100644
--- a/arch/sh/configs/r7780mp_defconfig
+++ b/arch/sh/configs/r7780mp_defconfig
@@ -3,7 +3,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 CONFIG_SLAB=y
diff --git a/arch/sh/configs/r7785rp_defconfig b/arch/sh/configs/r7785rp_defconfig
index 55fce65eb454..5978866358ec 100644
--- a/arch/sh/configs/r7785rp_defconfig
+++ b/arch/sh/configs/r7785rp_defconfig
@@ -7,7 +7,6 @@ CONFIG_RCU_TRACE=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/arch/sh/configs/rts7751r2d1_defconfig b/arch/sh/configs/rts7751r2d1_defconfig
index 6a3cfe08295f..fc9c22152b08 100644
--- a/arch/sh/configs/rts7751r2d1_defconfig
+++ b/arch/sh/configs/rts7751r2d1_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/arch/sh/configs/rts7751r2dplus_defconfig b/arch/sh/configs/rts7751r2dplus_defconfig
index 2b3d7d280672..ff3fd6787fd6 100644
--- a/arch/sh/configs/rts7751r2dplus_defconfig
+++ b/arch/sh/configs/rts7751r2dplus_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/arch/sh/configs/se7206_defconfig b/arch/sh/configs/se7206_defconfig
index 21a43f14ffac..ff5bb4489922 100644
--- a/arch/sh/configs/se7206_defconfig
+++ b/arch/sh/configs/se7206_defconfig
@@ -18,7 +18,6 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_UID16 is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_ELF_CORE is not set
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/sh/configs/se7343_defconfig b/arch/sh/configs/se7343_defconfig
index 4e794e719a28..5d6c19338ebf 100644
--- a/arch/sh/configs/se7343_defconfig
+++ b/arch/sh/configs/se7343_defconfig
@@ -2,7 +2,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SHMEM is not set
diff --git a/arch/sh/configs/se7619_defconfig b/arch/sh/configs/se7619_defconfig
index 3264415a5931..71a672c30716 100644
--- a/arch/sh/configs/se7619_defconfig
+++ b/arch/sh/configs/se7619_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_UID16 is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_HOTPLUG is not set
 # CONFIG_ELF_CORE is not set
diff --git a/arch/sh/configs/se7705_defconfig b/arch/sh/configs/se7705_defconfig
index 4496b94b7d88..ed00a6eeadf5 100644
--- a/arch/sh/configs/se7705_defconfig
+++ b/arch/sh/configs/se7705_defconfig
@@ -2,7 +2,6 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_HOTPLUG is not set
 CONFIG_SLAB=y
diff --git a/arch/sh/configs/se7750_defconfig b/arch/sh/configs/se7750_defconfig
index b23f67542728..3f1c13799d79 100644
--- a/arch/sh/configs/se7750_defconfig
+++ b/arch/sh/configs/se7750_defconfig
@@ -5,7 +5,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_HOTPLUG is not set
 CONFIG_SLAB=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/se7751_defconfig b/arch/sh/configs/se7751_defconfig
index 162343683937..4a024065bb75 100644
--- a/arch/sh/configs/se7751_defconfig
+++ b/arch/sh/configs/se7751_defconfig
@@ -3,7 +3,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_HOTPLUG is not set
 CONFIG_SLAB=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/secureedge5410_defconfig b/arch/sh/configs/secureedge5410_defconfig
index 360592d63a2f..8422599cfb04 100644
--- a/arch/sh/configs/secureedge5410_defconfig
+++ b/arch/sh/configs/secureedge5410_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_SWAP is not set
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_HOTPLUG is not set
 CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/sh03_defconfig b/arch/sh/configs/sh03_defconfig
index 87db9a84b5ec..f0073ed39947 100644
--- a/arch/sh/configs/sh03_defconfig
+++ b/arch/sh/configs/sh03_defconfig
@@ -3,7 +3,6 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=m
diff --git a/arch/sh/configs/sh7710voipgw_defconfig b/arch/sh/configs/sh7710voipgw_defconfig
index 08426913c0e3..0d814770b07f 100644
--- a/arch/sh/configs/sh7710voipgw_defconfig
+++ b/arch/sh/configs/sh7710voipgw_defconfig
@@ -2,7 +2,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SHMEM is not set
diff --git a/arch/sh/configs/sh7757lcr_defconfig b/arch/sh/configs/sh7757lcr_defconfig
index d0933a9b9799..a2700ab165af 100644
--- a/arch/sh/configs/sh7757lcr_defconfig
+++ b/arch/sh/configs/sh7757lcr_defconfig
@@ -8,7 +8,6 @@ CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_KALLSYMS_ALL=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/sh7763rdp_defconfig b/arch/sh/configs/sh7763rdp_defconfig
index d0a0aa74cecf..26c5fd02c87a 100644
--- a/arch/sh/configs/sh7763rdp_defconfig
+++ b/arch/sh/configs/sh7763rdp_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
 CONFIG_IPC_NS=y
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
diff --git a/arch/sh/configs/shmin_defconfig b/arch/sh/configs/shmin_defconfig
index a27b129b93c5..c0b6f40d01cc 100644
--- a/arch/sh/configs/shmin_defconfig
+++ b/arch/sh/configs/shmin_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_SWAP is not set
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_UID16 is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_HOTPLUG is not set
 # CONFIG_BUG is not set
diff --git a/arch/sh/configs/titan_defconfig b/arch/sh/configs/titan_defconfig
index 4ec961ace688..ba887f1351be 100644
--- a/arch/sh/configs/titan_defconfig
+++ b/arch/sh/configs/titan_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index e7a4804e23cf..745684512d5b 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -156,7 +156,7 @@
 146	common	writev				sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
-149	common	_sysctl				sys_sysctl
+149	common	_sysctl				sys_ni_syscall
 150	common	mlock				sys_mlock
 151	common	munlock				sys_munlock
 152	common	mlockall			sys_mlockall
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index d6126ee2f51d..74adaeca2d89 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -300,7 +300,7 @@
 249	64	nanosleep		sys_nanosleep
 250	32	mremap			sys_mremap
 250	64	mremap			sys_64_mremap
-251	common	_sysctl			sys_sysctl			compat_sys_sysctl
+251	common	_sysctl			sys_ni_syscall
 252	common	getsid			sys_getsid
 253	common	fdatasync		sys_fdatasync
 254	32	nfsservctl		sys_ni_syscall			sys_nis_syscall
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 686d59df1e12..ef76360bc5e9 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -160,7 +160,7 @@
 146	i386	writev			sys_writev			compat_sys_writev
 147	i386	getsid			sys_getsid
 148	i386	fdatasync		sys_fdatasync
-149	i386	_sysctl			sys_sysctl			compat_sys_sysctl
+149	i386	_sysctl			sys_ni_syscall
 150	i386	mlock			sys_mlock
 151	i386	munlock			sys_munlock
 152	i386	mlockall		sys_mlockall
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index b345b35b3308..6a3b0b3ffbaa 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -164,7 +164,7 @@
 153	common	vhangup			sys_vhangup
 154	common	modify_ldt		sys_modify_ldt
 155	common	pivot_root		sys_pivot_root
-156	64	_sysctl			sys_sysctl
+156	64	_sysctl			sys_ni_syscall
 157	common	prctl			sys_prctl
 158	common	arch_prctl		sys_arch_prctl
 159	common	adjtimex		sys_adjtimex
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index 96cb07095e4c..34cbbf52d670 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -222,7 +222,7 @@
 204	common	quotactl			sys_quotactl
 # 205 was old nfsservctl
 205	common	nfsservctl			sys_ni_syscall
-206	common	_sysctl				sys_sysctl
+206	common	_sysctl				sys_ni_syscall
 207	common	bdflush				sys_bdflush
 208	common	uname				sys_newuname
 209	common	sysinfo				sys_sysinfo
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 86b61e873947..c55d2459809d 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -859,7 +859,6 @@ asmlinkage long compat_sys_select(int n, compat_ulong_t __user *inp,
 asmlinkage long compat_sys_ustat(unsigned dev, struct compat_ustat __user *u32);
 asmlinkage long compat_sys_recv(int fd, void __user *buf, compat_size_t len,
 				unsigned flags);
-asmlinkage long compat_sys_sysctl(struct compat_sysctl_args __user *args);
 
 /* obsolete: fs/readdir.c */
 asmlinkage long compat_sys_old_readdir(unsigned int fd,
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 63ffa6dc9da3..915233a188e1 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -48,7 +48,6 @@ struct statfs;
 struct statfs64;
 struct statx;
 struct fsinfo_params;
-struct __sysctl_args;
 struct sysinfo;
 struct timespec;
 struct __kernel_old_timeval;
@@ -1125,7 +1124,6 @@ asmlinkage long sys_send(int, void __user *, size_t, unsigned);
 asmlinkage long sys_bdflush(int func, long data);
 asmlinkage long sys_oldumount(char __user *name);
 asmlinkage long sys_uselib(const char __user *library);
-asmlinkage long sys_sysctl(struct __sysctl_args __user *args);
 asmlinkage long sys_sysfs(int option,
 				unsigned long arg1, unsigned long arg2);
 asmlinkage long sys_fork(void);
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 50bb7f383a1b..51298a4f4623 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -74,15 +74,13 @@ int proc_do_static_key(struct ctl_table *table, int write, void *buffer,
  * sysctl names can be mirrored automatically under /proc/sys.  The
  * procname supplied controls /proc naming.
  *
- * The table's mode will be honoured both for sys_sysctl(2) and
- * proc-fs access.
+ * The table's mode will be honoured for proc-fs access.
  *
  * Leaf nodes in the sysctl tree will be represented by a single file
  * under /proc; non-leaf nodes will be represented by directories.  A
  * null procname disables /proc mirroring at this node.
  *
- * sysctl(2) can automatically manage read and write requests through
- * the sysctl table.  The data and maxlen fields of the ctl_table
+ * The data and maxlen fields of the ctl_table
  * struct enable minimal validation of the values being written to be
  * performed, and the mode field allows minimal authentication.
  * 
diff --git a/kernel/Makefile b/kernel/Makefile
index f3218bc5ec69..d13e01b0e07e 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -5,7 +5,7 @@
 
 obj-y     = fork.o exec_domain.o panic.o \
 	    cpu.o exit.o softirq.o resource.o \
-	    sysctl.o sysctl_binary.o capability.o ptrace.o user.o \
+	    sysctl.o capability.o ptrace.o user.o \
 	    signal.o sys.o umh.o workqueue.o pid.o task_work.o \
 	    extable.o params.o \
 	    kthread.o sys_ni.o nsproxy.o \
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index fad48ace1123..c935c1819ba3 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -373,7 +373,6 @@ COND_SYSCALL(socketcall);
 COND_SYSCALL_COMPAT(socketcall);
 
 /* compat syscalls for arm64, x86, ... */
-COND_SYSCALL_COMPAT(sysctl);
 COND_SYSCALL_COMPAT(fanotify_mark);
 
 /* x86 */
diff --git a/kernel/sysctl_binary.c b/kernel/sysctl_binary.c
deleted file mode 100644
index 7d550cc76a3b..000000000000
--- a/kernel/sysctl_binary.c
+++ /dev/null
@@ -1,171 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/stat.h>
-#include <linux/sysctl.h>
-#include "../fs/xfs/xfs_sysctl.h"
-#include <linux/sunrpc/debug.h>
-#include <linux/string.h>
-#include <linux/syscalls.h>
-#include <linux/namei.h>
-#include <linux/mount.h>
-#include <linux/fs.h>
-#include <linux/nsproxy.h>
-#include <linux/pid_namespace.h>
-#include <linux/file.h>
-#include <linux/ctype.h>
-#include <linux/netdevice.h>
-#include <linux/kernel.h>
-#include <linux/uuid.h>
-#include <linux/slab.h>
-#include <linux/compat.h>
-
-static ssize_t binary_sysctl(const int *name, int nlen,
-	void __user *oldval, size_t oldlen, void __user *newval, size_t newlen)
-{
-	return -ENOSYS;
-}
-
-static void deprecated_sysctl_warning(const int *name, int nlen)
-{
-	int i;
-
-	/*
-	 * CTL_KERN/KERN_VERSION is used by older glibc and cannot
-	 * ever go away.
-	 */
-	if (nlen >= 2 && name[0] == CTL_KERN && name[1] == KERN_VERSION)
-		return;
-
-	if (printk_ratelimit()) {
-		printk(KERN_INFO
-			"warning: process `%s' used the deprecated sysctl "
-			"system call with ", current->comm);
-		for (i = 0; i < nlen; i++)
-			printk(KERN_CONT "%d.", name[i]);
-		printk(KERN_CONT "\n");
-	}
-	return;
-}
-
-#define WARN_ONCE_HASH_BITS 8
-#define WARN_ONCE_HASH_SIZE (1<<WARN_ONCE_HASH_BITS)
-
-static DECLARE_BITMAP(warn_once_bitmap, WARN_ONCE_HASH_SIZE);
-
-#define FNV32_OFFSET 2166136261U
-#define FNV32_PRIME 0x01000193
-
-/*
- * Print each legacy sysctl (approximately) only once.
- * To avoid making the tables non-const use a external
- * hash-table instead.
- * Worst case hash collision: 6, but very rarely.
- * NOTE! We don't use the SMP-safe bit tests. We simply
- * don't care enough.
- */
-static void warn_on_bintable(const int *name, int nlen)
-{
-	int i;
-	u32 hash = FNV32_OFFSET;
-
-	for (i = 0; i < nlen; i++)
-		hash = (hash ^ name[i]) * FNV32_PRIME;
-	hash %= WARN_ONCE_HASH_SIZE;
-	if (__test_and_set_bit(hash, warn_once_bitmap))
-		return;
-	deprecated_sysctl_warning(name, nlen);
-}
-
-static ssize_t do_sysctl(int __user *args_name, int nlen,
-	void __user *oldval, size_t oldlen, void __user *newval, size_t newlen)
-{
-	int name[CTL_MAXNAME];
-	int i;
-
-	/* Check args->nlen. */
-	if (nlen < 0 || nlen > CTL_MAXNAME)
-		return -ENOTDIR;
-	/* Read in the sysctl name for simplicity */
-	for (i = 0; i < nlen; i++)
-		if (get_user(name[i], args_name + i))
-			return -EFAULT;
-
-	warn_on_bintable(name, nlen);
-
-	return binary_sysctl(name, nlen, oldval, oldlen, newval, newlen);
-}
-
-SYSCALL_DEFINE1(sysctl, struct __sysctl_args __user *, args)
-{
-	struct __sysctl_args tmp;
-	size_t oldlen = 0;
-	ssize_t result;
-
-	if (copy_from_user(&tmp, args, sizeof(tmp)))
-		return -EFAULT;
-
-	if (tmp.oldval && !tmp.oldlenp)
-		return -EFAULT;
-
-	if (tmp.oldlenp && get_user(oldlen, tmp.oldlenp))
-		return -EFAULT;
-
-	result = do_sysctl(tmp.name, tmp.nlen, tmp.oldval, oldlen,
-			   tmp.newval, tmp.newlen);
-
-	if (result >= 0) {
-		oldlen = result;
-		result = 0;
-	}
-
-	if (tmp.oldlenp && put_user(oldlen, tmp.oldlenp))
-		return -EFAULT;
-
-	return result;
-}
-
-
-#ifdef CONFIG_COMPAT
-
-struct compat_sysctl_args {
-	compat_uptr_t	name;
-	int		nlen;
-	compat_uptr_t	oldval;
-	compat_uptr_t	oldlenp;
-	compat_uptr_t	newval;
-	compat_size_t	newlen;
-	compat_ulong_t	__unused[4];
-};
-
-COMPAT_SYSCALL_DEFINE1(sysctl, struct compat_sysctl_args __user *, args)
-{
-	struct compat_sysctl_args tmp;
-	compat_size_t __user *compat_oldlenp;
-	size_t oldlen = 0;
-	ssize_t result;
-
-	if (copy_from_user(&tmp, args, sizeof(tmp)))
-		return -EFAULT;
-
-	if (tmp.oldval && !tmp.oldlenp)
-		return -EFAULT;
-
-	compat_oldlenp = compat_ptr(tmp.oldlenp);
-	if (compat_oldlenp && get_user(oldlen, compat_oldlenp))
-		return -EFAULT;
-
-	result = do_sysctl(compat_ptr(tmp.name), tmp.nlen,
-			   compat_ptr(tmp.oldval), oldlen,
-			   compat_ptr(tmp.newval), tmp.newlen);
-
-	if (result >= 0) {
-		oldlen = result;
-		result = 0;
-	}
-
-	if (compat_oldlenp && put_user(oldlen, compat_oldlenp))
-		return -EFAULT;
-
-	return result;
-}
-
-#endif /* CONFIG_COMPAT */
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 35b61bfc1b1a..6d29d9a6bc60 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -193,7 +193,7 @@
 146	common	writev				sys_writev			compat_sys_writev
 147	common	getsid				sys_getsid
 148	common	fdatasync			sys_fdatasync
-149	nospu	_sysctl				sys_sysctl			compat_sys_sysctl
+149	nospu	_sysctl				sys_ni_syscall
 150	common	mlock				sys_mlock
 151	common	munlock				sys_munlock
 152	common	mlockall			sys_mlockall
diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
index b38d48464368..0193f9b98753 100644
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@ -138,7 +138,7 @@
 146  common	writev			sys_writev			compat_sys_writev
 147  common	getsid			sys_getsid			sys_getsid
 148  common	fdatasync		sys_fdatasync			sys_fdatasync
-149  common	_sysctl			sys_sysctl			compat_sys_sysctl
+149  common	_sysctl			sys_ni_syscall
 150  common	mlock			sys_mlock			compat_sys_mlock
 151  common	munlock			sys_munlock			compat_sys_munlock
 152  common	mlockall		sys_mlockall			sys_mlockall
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index 37b844f839bc..4e5006256193 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -164,7 +164,7 @@
 153	common	vhangup			sys_vhangup
 154	common	modify_ldt		sys_modify_ldt
 155	common	pivot_root		sys_pivot_root
-156	64	_sysctl			sys_sysctl
+156	64	_sysctl			sys_ni_syscall
 157	common	prctl			sys_prctl
 158	common	arch_prctl		sys_arch_prctl
 159	common	adjtimex		sys_adjtimex
-- 
2.27.0

