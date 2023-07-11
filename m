Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CD74F541
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mcR24WTz3cc7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=205.139.111.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0mbx2sRLz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:31:57 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (66.187.233.88 [66.187.233.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-as8gT4mYNRCpOZzkVb8UAQ-1; Tue, 11 Jul 2023 12:18:36 -0400
X-MC-Unique: as8gT4mYNRCpOZzkVb8UAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0B20809F8F;
	Tue, 11 Jul 2023 16:17:51 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4558200AD6E;
	Tue, 11 Jul 2023 16:17:23 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v4 4/5] tools headers UAPI: Sync files changed by new fchmodat2 syscall
Date: Tue, 11 Jul 2023 18:16:06 +0200
Message-Id: <22294b3b68050a70eaaa962eff46b8672bc2f7e8.1689092120.git.legion@kernel.org>
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
References: <cover.1689074739.git.legion@kernel.org> <cover.1689092120.git.legion@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.
 org, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@sifive.com>

That add support for this new syscall in tools such as 'perf trace'.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 tools/include/uapi/asm-generic/unistd.h             | 5 ++++-
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 ++
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 ++
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 ++
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 ++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index dd7d8e10f16d..76b5922b0d39 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -817,8 +817,11 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 
+#define __NR_fchmodat2 452
+__SYSCALL(__NR_fchmodat2, sys_fchmodat2)
+
 #undef __NR_syscalls
-#define __NR_syscalls 451
+#define __NR_syscalls 453
 
 /*
  * 32 bit systems traditionally used different
diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
index 3f1886ad9d80..434728af4eaa 100644
--- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -365,3 +365,5 @@
 448	n64	process_mrelease		sys_process_mrelease
 449	n64	futex_waitv			sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+# 451 reserved for cachestat
+452	n64	fchmodat2			sys_fchmodat2
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index a0be127475b1..6b70b6705bd7 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -537,3 +537,5 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450 	nospu	set_mempolicy_home_node		sys_set_mempolicy_home_node
+# 451 reserved for cachestat
+452	common	fchmodat2			sys_fchmodat2
diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
index b68f47541169..0ed90c9535b0 100644
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@ -453,3 +453,5 @@
 448  common	process_mrelease	sys_process_mrelease		sys_process_mrelease
 449  common	futex_waitv		sys_futex_waitv			sys_futex_waitv
 450  common	set_mempolicy_home_node	sys_set_mempolicy_home_node	sys_set_mempolicy_home_node
+# 451 reserved for cachestat
+452  common	fchmodat2		sys_fchmodat2			sys_fchmodat2
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..a008724a1f48 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -372,6 +372,8 @@
 448	common	process_mrelease	sys_process_mrelease
 449	common	futex_waitv		sys_futex_waitv
 450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
+# 451 reserved for cachestat
+452	common	fchmodat2		sys_fchmodat2
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
-- 
2.33.8

