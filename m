Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D809474ED70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fWd5qCkz3cN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:57:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=205.139.111.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 21:28:06 AEST
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dsM05RXz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:28:06 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-0AFh6vecM-iT5qRLVmkLkQ-1; Tue, 11 Jul 2023 07:26:52 -0400
X-MC-Unique: 0AFh6vecM-iT5qRLVmkLkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 639B01C0E0C7;
	Tue, 11 Jul 2023 11:26:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEB8CF66B9;
	Tue, 11 Jul 2023 11:26:38 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 3/5] arch: Register fchmodat4, usually as syscall 451
Date: Tue, 11 Jul 2023 13:25:44 +0200
Message-Id: <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
In-Reply-To: <cover.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com> <cover.1689074739.git.legion@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
X-Mailman-Approved-At: Tue, 11 Jul 2023 21:56:57 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, Jame
 s.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@sifive.com>

This registers the new fchmodat4 syscall in most places as nuber 451,
with alpha being the exception where it's 561.  I found all these sites
by grepping for fspick, which I assume has found me everything.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
 arch/arm/tools/syscall.tbl                  | 1 +
 arch/arm64/include/asm/unistd32.h           | 2 ++
 arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
 arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
 arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
 arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
 arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
 arch/s390/kernel/syscalls/syscall.tbl       | 1 +
 arch/sh/kernel/syscalls/syscall.tbl         | 1 +
 arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
 arch/x86/entry/syscalls/syscall_32.tbl      | 1 +
 arch/x86/entry/syscalls/syscall_64.tbl      | 1 +
 arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
 include/uapi/asm-generic/unistd.h           | 5 ++++-
 18 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/sys=
calls/syscall.tbl
index 8ebacf37a8cf..00ceeffec7ff 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -490,3 +490,4 @@
 558=09common=09process_mrelease=09=09sys_process_mrelease
 559=09common  futex_waitv                     sys_futex_waitv
 560=09common=09set_mempolicy_home_node=09=09sys_ni_syscall
+561=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index ac964612d8b0..0b9702d5c425 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -464,3 +464,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common=09futex_waitv=09=09=09sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/uni=
std32.h
index 604a2053d006..49c65d935049 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -907,6 +907,8 @@ __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
 __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
+#define __NR_fchmodat4 451
+__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
=20
 /*
  * Please add new compat syscalls above this comment and update
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/sysca=
lls/syscall.tbl
index 72c929d9902b..b35225c64781 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -371,3 +371,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/sysca=
lls/syscall.tbl
index b1f3940bc298..4d80cd87e089 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -450,3 +450,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/=
kernel/syscalls/syscall.tbl
index 820145e47350..306bd18e5b52 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -456,3 +456,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/s=
yscalls/syscall_n32.tbl
index 253ff994ed2e..2ef47a546fd3 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -389,3 +389,4 @@
 448=09n32=09process_mrelease=09=09sys_process_mrelease
 449=09n32=09futex_waitv=09=09=09sys_futex_waitv
 450=09n32=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09n32=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/s=
yscalls/syscall_n64.tbl
index 3f1886ad9d80..6356c0a6cda0 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -365,3 +365,4 @@
 448=09n64=09process_mrelease=09=09sys_process_mrelease
 449=09n64=09futex_waitv=09=09=09sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09n64=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/s=
yscalls/syscall_o32.tbl
index 8f243e35a7b2..d1111edba47e 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -438,3 +438,4 @@
 448=09o32=09process_mrelease=09=09sys_process_mrelease
 449=09o32=09futex_waitv=09=09=09sys_futex_waitv
 450=09o32=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09o32=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/s=
yscalls/syscall.tbl
index 0e42fceb2d5e..0a1c13744c32 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -448,3 +448,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common=09futex_waitv=09=09=09sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel=
/syscalls/syscall.tbl
index a0be127475b1..ee23866fa1c8 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -537,3 +537,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450 =09nospu=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/sysca=
lls/syscall.tbl
index b68f47541169..d5ce80065ece 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -453,3 +453,4 @@
 448  common=09process_mrelease=09sys_process_mrelease=09=09sys_process_mre=
lease
 449  common=09futex_waitv=09=09sys_futex_waitv=09=09=09sys_futex_waitv
 450  common=09set_mempolicy_home_node=09sys_set_mempolicy_home_node=09sys_=
set_mempolicy_home_node
+451  common=09fchmodat4=09=09sys_fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/=
syscall.tbl
index 2de85c977f54..697b914f5c33 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -453,3 +453,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/sys=
calls/syscall.tbl
index 4398cc6fb68d..79be56831f39 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -496,3 +496,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscal=
ls/syscall_32.tbl
index 320480a8db4f..3ab07bd87ea9 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -455,3 +455,4 @@
 448=09i386=09process_mrelease=09sys_process_mrelease
 449=09i386=09futex_waitv=09=09sys_futex_waitv
 450=09i386=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09i386=09fchmodat4=09=09sys_fchmodat4
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscal=
ls/syscall_64.tbl
index c84d12608cd2..17047878293c 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -372,6 +372,7 @@
 448=09common=09process_mrelease=09sys_process_mrelease
 449=09common=09futex_waitv=09=09sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09sys_fchmodat4
=20
 #
 # Due to a historical design error, certain syscalls are numbered differen=
tly
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/s=
yscalls/syscall.tbl
index 52c94ab5c205..ed47fd3b2293 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -421,3 +421,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/u=
nistd.h
index 45fa180cc56a..b7978b3ce3f1 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -886,8 +886,11 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
=20
+#define __NR_fchmodat4 451
+__SYSCALL(__NR_fchmodat4, sys_fchmodat4)
+
 #undef __NR_syscalls
-#define __NR_syscalls 451
+#define __NR_syscalls 452
=20
 /*
  * 32 bit systems traditionally used different
--=20
2.33.8

