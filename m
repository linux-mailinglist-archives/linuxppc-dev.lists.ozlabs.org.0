Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA84E1EA2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 02:23:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMH1r3vxjz30HJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 12:23:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Teh+nVdS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=Teh+nVdS; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMH162LZ3z2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 12:22:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7sdUiS9GK2a9IHOMaMalD7HEg3D293dhjq705r7V1jI=; b=Teh+nVdS5SpmsugSPBqwZ2vtd0
 +SGAN9nxcaeCe3VA5LVBeMAqUMzhmVKv18sUTKrjFyfop5ThCr3djxe15ixxXfRpem7/MuQEdzgWz
 CVVcIg/Dch7Ogyg+3sapjfNxUUDzrh6kqHpmGT/15Av4lUe5Po/R4ahBZ/grelV6Q9zF++WT96mDL
 qDvwtntshBNv3Lov8iKnswDa+tIeVHsiF49D5oIp90upBOF+zD3Hv6fsXXgxliPO9mluIobGUwGk8
 3w5ldhwx4uHqWlFkNFKTwU9EfAI9a78p51Qfnkle88ey82rLKhI4AvArMYd3vzuZBsHFh1y7detFW
 24gPw2vA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW6kU-006Dnt-Sg; Mon, 21 Mar 2022 01:22:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Docs: admin/kernel-parameters: edit a few boot options
Date: Sun, 20 Mar 2022 18:22:16 -0700
Message-Id: <20220321012216.23724-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Len Brown <lenb@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Randy Dunlap <rdunlap@infradead.org>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clean up some of admin-guide/kernel-parameters.txt:

a. "smt" should be "smt=" (S390)
b. add "smt-enabled" for POWERPC
c. Sparc supports the vdso= boot option
d. make the tp_printk options (2) formatting similar to other options
   by adding spacing
e. add "trace_clock=" with a reference to Documentation/trace/ftrace.rst
f. use [IA-64] as documented instead of [ia64]
g. fix formatting and text for test_suspend=
h. fix formatting for swapaccount=
i. fix formatting and grammar for video.brightness_switch_enabled=

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-ia64@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Len Brown <lenb@kernel.org>
Cc: linux-pm@vger.kernel.org
Cc: linux-acpi@vger.kernel.org
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |   33 +++++++++-----
 1 file changed, 22 insertions(+), 11 deletions(-)

--- linux-next-20220318.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20220318/Documentation/admin-guide/kernel-parameters.txt
@@ -2814,7 +2814,7 @@
 			different yeeloong laptops.
 			Example: machtype=lemote-yeeloong-2f-7inch
 
-	max_addr=nn[KMG]	[KNL,BOOT,ia64] All physical memory greater
+	max_addr=nn[KMG]	[KNL,BOOT,IA-64] All physical memory greater
 			than or equal to this physical address is ignored.
 
 	maxcpus=	[SMP] Maximum number of processors that	an SMP kernel
@@ -3057,7 +3057,7 @@
 
 	mga=		[HW,DRM]
 
-	min_addr=nn[KMG]	[KNL,BOOT,ia64] All physical memory below this
+	min_addr=nn[KMG]	[KNL,BOOT,IA-64] All physical memory below this
 			physical address is ignored.
 
 	mini2440=	[ARM,HW,KNL]
@@ -5382,13 +5382,19 @@
 				1: Fast pin select (default)
 				2: ATC IRMode
 
-	smt		[KNL,S390] Set the maximum number of threads (logical
+	smt=		[KNL,S390] Set the maximum number of threads (logical
 			CPUs) to use per physical CPU on systems capable of
 			symmetric multithreading (SMT). Will be capped to the
 			actual hardware limit.
 			Format: <integer>
 			Default: -1 (no limit)
 
+	smt-enabled=	[PPC 64-bit] Enable SMT, disable SMT, or set the
+			maximum number of threads. This can be used to override
+			the Open Firmware (OF) option.
+			Format: on | off | <integer>
+			Default: all threads enabled
+
 	softlockup_panic=
 			[KNL] Should the soft-lockup detector generate panics.
 			Format: 0 | 1
@@ -5768,8 +5774,9 @@
 			This parameter controls use of the Protected
 			Execution Facility on pSeries.
 
-	swapaccount=[0|1]
-			[KNL] Enable accounting of swap in memory resource
+	swapaccount=	[KNL]
+			Format: [0|1]
+			Enable accounting of swap in memory resource
 			controller if no parameter or 1 is given or disable
 			it if 0 is given (See Documentation/admin-guide/cgroup-v1/memory.rst)
 
@@ -5815,7 +5822,8 @@
 
 	tdfx=		[HW,DRM]
 
-	test_suspend=	[SUSPEND][,N]
+	test_suspend=	[SUSPEND]
+			Format: { "mem" | "standby" | "freeze" }[,N]
 			Specify "mem" (for Suspend-to-RAM) or "standby" (for
 			standby suspend) or "freeze" (for suspend type freeze)
 			as the system sleep state during system startup with
@@ -5902,6 +5910,8 @@
 	trace_buf_size=nn[KMG]
 			[FTRACE] will set tracing buffer size on each cpu.
 
+	trace_clock=	[FTRACE] See Documentation/trace/ftrace.rst
+
 	trace_event=[event-list]
 			[FTRACE] Set and start specified trace events in order
 			to facilitate early boot debugging. The event-list is a
@@ -5924,7 +5934,7 @@
 			See also Documentation/trace/ftrace.rst "trace options"
 			section.
 
-	tp_printk[FTRACE]
+	tp_printk	[FTRACE]
 			Have the tracepoints sent to printk as well as the
 			tracing ring buffer. This is useful for early boot up
 			where the system hangs or reboots and does not give the
@@ -5946,7 +5956,7 @@
 			frequency tracepoints such as irq or sched, can cause
 			the system to live lock.
 
-	tp_printk_stop_on_boot[FTRACE]
+	tp_printk_stop_on_boot [FTRACE]
 			When tp_printk (above) is set, it can cause a lot of noise
 			on the console. It may be useful to only include the
 			printing of events during boot up, as user space may
@@ -6295,7 +6305,7 @@
 					HIGHMEM regardless of setting
 					of CONFIG_HIGHPTE.
 
-	vdso=		[X86,SH]
+	vdso=		[X86,SH,SPARC]
 			On X86_32, this is an alias for vdso32=.  Otherwise:
 
 			vdso=1: enable VDSO (the default)
@@ -6321,11 +6331,12 @@
 	video=		[FB] Frame buffer configuration
 			See Documentation/fb/modedb.rst.
 
-	video.brightness_switch_enabled= [0,1]
+	video.brightness_switch_enabled= [ACPI]
+			Format: [0|1]
 			If set to 1, on receiving an ACPI notify event
 			generated by hotkey, video driver will adjust brightness
 			level and then send out the event to user space through
-			the allocated input device; If set to 0, video driver
+			the allocated input device. If set to 0, video driver
 			will only send out the event without touching backlight
 			brightness level.
 			default: 1
