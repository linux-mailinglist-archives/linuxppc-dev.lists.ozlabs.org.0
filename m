Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DBD59BD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:43:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZxJf2ZJszDqC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 22:43:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="jOK9yEio"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zx3H2yWnzDqh2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 22:31:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HNTqLR7YTpiCGsfcYzZ23NBv7IuWobNYT8gokGCe3wo=; b=jOK9yEioolCXopD1Wq607Z9fR/
 HdMohOTqYZUqXwti9GCkq6A/d0XRGI45pI0UuIi32KZf8+8qIJi/BsB/AXDe18qx+EYe0Kb3wSpax
 BC4JBaEQFMDtp2rNHNAnVRNUlknvpaqomnsjSBYvbRksF4hQ8rk5FWq7VHR0xaVHdGiXcLi1mhWOL
 7W1t49Fu8buHnGzEJsAmMVi6F8H7jPn2lzXVU6ILBj0+0XL7flg8ydZvEIxgxJvmRKTD407ivUgCs
 DzquqTFZLZPqC91AwCHE5X0N6bEReQ7mAXvdb4/R1QTVyQNWjSXZTkOmieePIKqiGiHsO2c6fu0nx
 yzEbLWYg==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgq1U-00055N-Fq; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgq1S-0005SM-DP; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 18/39] docs: admin-guide: add kdump documentation into it
Date: Fri, 28 Jun 2019 09:30:11 -0300
Message-Id: <654e7591c044632c06257e0f069a52c0bb993554.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>, Harry Wei <harryxiyou@gmail.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Kdump documentation describes procedures with admins use
in order to solve issues on their systems.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/bug-hunting.rst            | 4 ++--
 Documentation/admin-guide/index.rst                  | 1 +
 Documentation/{ => admin-guide}/kdump/gdbmacros.txt  | 0
 Documentation/{ => admin-guide}/kdump/index.rst      | 1 -
 Documentation/{ => admin-guide}/kdump/kdump.rst      | 0
 Documentation/{ => admin-guide}/kdump/vmcoreinfo.rst | 0
 Documentation/admin-guide/kernel-parameters.txt      | 6 +++---
 Documentation/powerpc/firmware-assisted-dump.rst     | 2 +-
 Documentation/translations/zh_CN/oops-tracing.txt    | 4 ++--
 Documentation/watchdog/hpwdt.rst                     | 2 +-
 MAINTAINERS                                          | 2 +-
 arch/arm/Kconfig                                     | 2 +-
 arch/arm64/Kconfig                                   | 2 +-
 arch/sh/Kconfig                                      | 2 +-
 arch/x86/Kconfig                                     | 4 ++--
 15 files changed, 16 insertions(+), 16 deletions(-)
 rename Documentation/{ => admin-guide}/kdump/gdbmacros.txt (100%)
 rename Documentation/{ => admin-guide}/kdump/index.rst (97%)
 rename Documentation/{ => admin-guide}/kdump/kdump.rst (100%)
 rename Documentation/{ => admin-guide}/kdump/vmcoreinfo.rst (100%)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index b761aa2a51d2..44b8a4edd348 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -90,9 +90,9 @@ the disk is not available then you have three options:
     run a null modem to a second machine and capture the output there
     using your favourite communication program.  Minicom works well.
 
-(3) Use Kdump (see Documentation/kdump/kdump.rst),
+(3) Use Kdump (see Documentation/admin-guide/kdump/kdump.rst),
     extract the kernel ring buffer from old memory with using dmesg
-    gdbmacro in Documentation/kdump/gdbmacros.txt.
+    gdbmacro in Documentation/admin-guide/kdump/gdbmacros.txt.
 
 Finding the bug's location
 --------------------------
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 9899b78dbe50..65e821a03aca 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -39,6 +39,7 @@ problems and bugs in particular.
    ramoops
    dynamic-debug-howto
    init
+   kdump/index
    perf/index
 
 This is the beginning of a section with information of interest to
diff --git a/Documentation/kdump/gdbmacros.txt b/Documentation/admin-guide/kdump/gdbmacros.txt
similarity index 100%
rename from Documentation/kdump/gdbmacros.txt
rename to Documentation/admin-guide/kdump/gdbmacros.txt
diff --git a/Documentation/kdump/index.rst b/Documentation/admin-guide/kdump/index.rst
similarity index 97%
rename from Documentation/kdump/index.rst
rename to Documentation/admin-guide/kdump/index.rst
index 2b17fcf6867a..8e2ebd0383cd 100644
--- a/Documentation/kdump/index.rst
+++ b/Documentation/admin-guide/kdump/index.rst
@@ -1,4 +1,3 @@
-:orphan:
 
 ================================================================
 Documentation for Kdump - The kexec-based Crash Dumping Solution
diff --git a/Documentation/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
similarity index 100%
rename from Documentation/kdump/kdump.rst
rename to Documentation/admin-guide/kdump/kdump.rst
diff --git a/Documentation/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
similarity index 100%
rename from Documentation/kdump/vmcoreinfo.rst
rename to Documentation/admin-guide/kdump/vmcoreinfo.rst
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e38b96d061f4..9b535c0e22f3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -708,14 +708,14 @@
 			[KNL, x86_64] select a region under 4G first, and
 			fall back to reserve region above 4G when '@offset'
 			hasn't been specified.
-			See Documentation/kdump/kdump.rst for further details.
+			See Documentation/admin-guide/kdump/kdump.rst for further details.
 
 	crashkernel=range1:size1[,range2:size2,...][@offset]
 			[KNL] Same as above, but depends on the memory
 			in the running system. The syntax of range is
 			start-[end] where start and end are both
 			a memory unit (amount[KMG]). See also
-			Documentation/kdump/kdump.rst for an example.
+			Documentation/admin-guide/kdump/kdump.rst for an example.
 
 	crashkernel=size[KMG],high
 			[KNL, x86_64] range could be above 4G. Allow kernel
@@ -1207,7 +1207,7 @@
 			Specifies physical address of start of kernel core
 			image elf header and optionally the size. Generally
 			kexec loader will pass this option to capture kernel.
-			See Documentation/kdump/kdump.rst for details.
+			See Documentation/admin-guide/kdump/kdump.rst for details.
 
 	enable_mtrr_cleanup [X86]
 			The kernel tries to adjust MTRR layout from continuous
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index d7fa7c35dd12..9ca12830a48e 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -61,7 +61,7 @@ as follows:
          the default calculated size. Use this option if default
          boot memory size is not sufficient for second kernel to
          boot successfully. For syntax of crashkernel= parameter,
-         refer to Documentation/kdump/kdump.rst. If any offset is
+         refer to Documentation/admin-guide/kdump/kdump.rst. If any offset is
          provided in crashkernel= parameter, it will be ignored
          as fadump uses a predefined offset to reserve memory
          for boot memory dump preservation in case of a crash.
diff --git a/Documentation/translations/zh_CN/oops-tracing.txt b/Documentation/translations/zh_CN/oops-tracing.txt
index 368ddd05b304..c5f3bda7abcb 100644
--- a/Documentation/translations/zh_CN/oops-tracing.txt
+++ b/Documentation/translations/zh_CN/oops-tracing.txt
@@ -53,8 +53,8 @@ cat /proc/kmsg > file， 然而你必须介入中止传输， kmsg是一个“
 （2）用串口终端启动（请参看Documentation/admin-guide/serial-console.rst），运行一个null
 modem到另一台机器并用你喜欢的通讯工具获取输出。Minicom工作地很好。
 
-（3）使用Kdump（请参看Documentation/kdump/kdump.rst），
-使用在Documentation/kdump/gdbmacros.txt中定义的dmesg gdb宏，从旧的内存中提取内核
+（3）使用Kdump（请参看Documentation/admin-guide/kdump/kdump.rst），
+使用在Documentation/admin-guide/kdump/gdbmacros.txt中定义的dmesg gdb宏，从旧的内存中提取内核
 环形缓冲区。
 
 完整信息
diff --git a/Documentation/watchdog/hpwdt.rst b/Documentation/watchdog/hpwdt.rst
index 94a96371113e..49c647dba8aa 100644
--- a/Documentation/watchdog/hpwdt.rst
+++ b/Documentation/watchdog/hpwdt.rst
@@ -59,7 +59,7 @@ Last reviewed: 08/20/2018
  and loop forever.  This is generally not what a watchdog user wants.
 
  For those wishing to learn more please see:
-	Documentation/kdump/kdump.rst
+	Documentation/admin-guide/kdump/kdump.rst
 	Documentation/admin-guide/kernel-parameters.txt (panic=)
 	Your Linux Distribution specific documentation.
 
diff --git a/MAINTAINERS b/MAINTAINERS
index d35ff73f718a..4c622a19ab7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8622,7 +8622,7 @@ R:	Vivek Goyal <vgoyal@redhat.com>
 L:	kexec@lists.infradead.org
 W:	http://lse.sourceforge.net/kdump/
 S:	Maintained
-F:	Documentation/kdump/
+F:	Documentation/admin-guide/kdump/
 
 KEENE FM RADIO TRANSMITTER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8bf8985ec667..d5bd4350fcbd 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2025,7 +2025,7 @@ config CRASH_DUMP
 	  kdump/kexec. The crash dump kernel must be compiled to a
 	  memory address not used by the main kernel
 
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index accb045997c6..e1ea69994e0f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -997,7 +997,7 @@ config CRASH_DUMP
 	  reserved region and then later executed after a crash by
 	  kdump/kexec.
 
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config XEN_DOM0
 	def_bool y
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 31a7d12db705..c2858ac6a46a 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -626,7 +626,7 @@ config CRASH_DUMP
 	  to a memory address not used by the main kernel using
 	  PHYSICAL_START.
 
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config KEXEC_JUMP
 	bool "kexec jump (EXPERIMENTAL)"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index c9d59ca5e3ac..489fd833b980 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2057,7 +2057,7 @@ config CRASH_DUMP
 	  to a memory address not used by the main kernel or BIOS using
 	  PHYSICAL_START, or it must be built as a relocatable image
 	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config KEXEC_JUMP
 	bool "kexec jump"
@@ -2094,7 +2094,7 @@ config PHYSICAL_START
 	  the reserved region.  In other words, it can be set based on
 	  the "X" value as specified in the "crashkernel=YM@XM"
 	  command line boot parameter passed to the panic-ed
-	  kernel. Please take a look at Documentation/kdump/kdump.rst
+	  kernel. Please take a look at Documentation/admin-guide/kdump/kdump.rst
 	  for more details about crash dumps.
 
 	  Usage of bzImage for capturing the crash dump is recommended as
-- 
2.21.0

