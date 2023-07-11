Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B540074ED75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:59:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fYD4pv9z3cdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:59:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=207.211.30.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dsZ4bbyz30N3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:28:18 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-ROUVyocrPEib07JOo9uXSQ-1; Tue, 11 Jul 2023 07:27:05 -0400
X-MC-Unique: ROUVyocrPEib07JOo9uXSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B15488D1A3;
	Tue, 11 Jul 2023 11:27:03 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C29E0F66B9;
	Tue, 11 Jul 2023 11:26:50 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 4/5] tools headers UAPI: Sync files changed by new fchmodat4 syscall
Date: Tue, 11 Jul 2023 13:25:45 +0200
Message-Id: <1d92a38d1f447ef49ff420847faad7bf2bd4e281.1689074739.git.legion@kernel.org>
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

That add support for this new syscall in tools such as 'perf trace'.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 tools/include/uapi/asm-generic/unistd.h             | 5 ++++-
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 1 +
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 1 +
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 1 +
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/a=
sm-generic/unistd.h
index 45fa180cc56a..b7978b3ce3f1 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
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
diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/pe=
rf/arch/mips/entry/syscalls/syscall_n64.tbl
index 3f1886ad9d80..6356c0a6cda0 100644
--- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -365,3 +365,4 @@
 448=09n64=09process_mrelease=09=09sys_process_mrelease
 449=09n64=09futex_waitv=09=09=09sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09n64=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/per=
f/arch/powerpc/entry/syscalls/syscall.tbl
index a0be127475b1..ee23866fa1c8 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -537,3 +537,4 @@
 448=09common=09process_mrelease=09=09sys_process_mrelease
 449=09common  futex_waitv                     sys_futex_waitv
 450 =09nospu=09set_mempolicy_home_node=09=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09=09sys_fchmodat4
diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/a=
rch/s390/entry/syscalls/syscall.tbl
index b68f47541169..d5ce80065ece 100644
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@ -453,3 +453,4 @@
 448  common=09process_mrelease=09sys_process_mrelease=09=09sys_process_mre=
lease
 449  common=09futex_waitv=09=09sys_futex_waitv=09=09=09sys_futex_waitv
 450  common=09set_mempolicy_home_node=09sys_set_mempolicy_home_node=09sys_=
set_mempolicy_home_node
+451  common=09fchmodat4=09=09sys_fchmodat4=09=09=09sys_fchmodat4
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf=
/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..17047878293c 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -372,6 +372,7 @@
 448=09common=09process_mrelease=09sys_process_mrelease
 449=09common=09futex_waitv=09=09sys_futex_waitv
 450=09common=09set_mempolicy_home_node=09sys_set_mempolicy_home_node
+451=09common=09fchmodat4=09=09sys_fchmodat4
=20
 #
 # Due to a historical design error, certain syscalls are numbered differen=
tly
--=20
2.33.8

