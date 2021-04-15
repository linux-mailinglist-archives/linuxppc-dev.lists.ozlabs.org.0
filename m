Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A16360663
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 12:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLZgX24x6z3c2g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 20:04:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=jianlin.lv@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FLZ0Q4y48z2xfv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 19:33:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58113106F;
 Thu, 15 Apr 2021 02:33:40 -0700 (PDT)
Received: from net-arm-thunderx2-02.shanghai.arm.com
 (net-arm-thunderx2-02.shanghai.arm.com [10.169.208.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 225E33F694;
 Thu, 15 Apr 2021 02:33:22 -0700 (PDT)
From: Jianlin Lv <Jianlin.Lv@arm.com>
To: bpf@vger.kernel.org
Subject: [PATCH bpf-next 2/2] docs: bpf: bpf_jit_enable mode changed
Date: Thu, 15 Apr 2021 17:32:50 +0800
Message-Id: <20210415093250.3391257-2-Jianlin.Lv@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Apr 2021 20:03:30 +1000
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
Cc: irogers@google.com, songliubraving@fb.com, catalin.marinas@arm.com,
 linux-doc@vger.kernel.org, zlim.lnx@gmail.com, paul.walmsley@sifive.com,
 ast@kernel.org, andrii@kernel.org, paulus@samba.org, sandipan@linux.ibm.com,
 hpa@zytor.com, sparclinux@vger.kernel.org, illusionist.neo@gmail.com,
 maheshb@google.com, will@kernel.org, nicolas.dichtel@6wind.com,
 linux-s390@vger.kernel.org, iii@linux.ibm.com, paulburton@kernel.org,
 corbet@lwn.net, mchehab+huawei@kernel.org, masahiroy@kernel.org,
 x86@kernel.org, john.fastabend@gmail.com, linux@armlinux.org.uk,
 linux-riscv@lists.infradead.org, borntraeger@de.ibm.com, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, naveen.n.rao@linux.ibm.com,
 kuba@kernel.org, tklauser@distanz.ch, linux-mips@vger.kernel.org,
 grantseltzer@gmail.com, xi.wang@gmail.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, gor@linux.ibm.com, luke.r.nels@gmail.com,
 linux-kernel@vger.kernel.org, hca@linux.ibm.com, kpsingh@kernel.org,
 iecedge@gmail.com, horms@verge.net.au, bp@alien8.de, viro@zeniv.linux.org.uk,
 yhs@fb.com, Jianlin.Lv@arm.com, tglx@linutronix.de, dvyukov@google.com,
 tsbogend@alpha.franken.de, daniel@iogearbox.net, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, udknight@gmail.com, kafai@fb.com,
 bjorn@kernel.org, palmer@dabbelt.com, quentin@isovalent.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove information about bpf_jit_enable=2 mode and added description for
how to use the bpf_jit_disasm tool after get rid of =2 mode.

Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
---
 Documentation/admin-guide/sysctl/net.rst |  1 -
 Documentation/networking/filter.rst      | 25 ++++++------------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index c941b214e0b7..a39f99deac38 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -86,7 +86,6 @@ Values:
 
 	- 0 - disable the JIT (default value)
 	- 1 - enable the JIT
-	- 2 - enable the JIT and ask the compiler to emit traces on kernel log.
 
 bpf_jit_harden
 --------------
diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 251c6bd73d15..86954f922168 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -504,25 +504,12 @@ been previously enabled by root::
 
   echo 1 > /proc/sys/net/core/bpf_jit_enable
 
-For JIT developers, doing audits etc, each compile run can output the generated
-opcode image into the kernel log via::
-
-  echo 2 > /proc/sys/net/core/bpf_jit_enable
-
-Example output from dmesg::
-
-    [ 3389.935842] flen=6 proglen=70 pass=3 image=ffffffffa0069c8f
-    [ 3389.935847] JIT code: 00000000: 55 48 89 e5 48 83 ec 60 48 89 5d f8 44 8b 4f 68
-    [ 3389.935849] JIT code: 00000010: 44 2b 4f 6c 4c 8b 87 d8 00 00 00 be 0c 00 00 00
-    [ 3389.935850] JIT code: 00000020: e8 1d 94 ff e0 3d 00 08 00 00 75 16 be 17 00 00
-    [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00
-    [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
-
-When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is permanently set to 1 and
-setting any other value than that will return in failure. This is even the case for
-setting bpf_jit_enable to 2, since dumping the final JIT image into the kernel log
-is discouraged and introspection through bpftool (under tools/bpf/bpftool/) is the
-generally recommended approach instead.
+When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is permanently set
+to 1 and setting any other value than that will return in failure.
+For debugging JITs, the introspection through bpftool (tools/bpf/bpftool/)
+is the generally recommended approach instead. For JIT developers, doing
+audits etc, you can insert bpf_jit_dump() and recompile the kernel to
+output the generated opcode image into the kernel log.
 
 In the kernel source tree under tools/bpf/, there's bpf_jit_disasm for
 generating disassembly out of the kernel log's hexdump::
-- 
2.25.1

