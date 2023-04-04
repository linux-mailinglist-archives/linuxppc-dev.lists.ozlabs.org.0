Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DF6D71EC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 03:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Prmwn1m9zz3fFM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 11:18:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iDsOQTsh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iDsOQTsh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iDsOQTsh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iDsOQTsh;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrTVN6lYHz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 23:43:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680615786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOxp/loUVwjuOPGUeDlb03eqt//Xsq563D9HmMeX0kc=;
	b=iDsOQTsh2CjlMvP1ZuqT8+MgSaTWBdVnUUU6aE5cwuV3jbQmEtsuXODxzrdhPSqdOO0VVa
	aVI/WT/pKuSj/LFZyYN/J3T8UpgB1XZlh6bwFI+Mt2+N/liN7BIDv4Tpa4I/1J9GBrGfO9
	LTnO0Qlkxi7xFZ5W0/+v/jCalFFQ8jc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680615786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOxp/loUVwjuOPGUeDlb03eqt//Xsq563D9HmMeX0kc=;
	b=iDsOQTsh2CjlMvP1ZuqT8+MgSaTWBdVnUUU6aE5cwuV3jbQmEtsuXODxzrdhPSqdOO0VVa
	aVI/WT/pKuSj/LFZyYN/J3T8UpgB1XZlh6bwFI+Mt2+N/liN7BIDv4Tpa4I/1J9GBrGfO9
	LTnO0Qlkxi7xFZ5W0/+v/jCalFFQ8jc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-pi0Svwr4ODigORJ7n6yb0Q-1; Tue, 04 Apr 2023 09:42:59 -0400
X-MC-Unique: pi0Svwr4ODigORJ7n6yb0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FC07101A54F;
	Tue,  4 Apr 2023 13:42:57 +0000 (UTC)
Received: from ypodemsk.tlv.csb (unknown [10.39.194.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 390002166B26;
	Tue,  4 Apr 2023 13:42:49 +0000 (UTC)
From: Yair Podemsky <ypodemsk@redhat.com>
To: linux@armlinux.org.uk,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	will@kernel.org,
	aneesh.kumar@linux.ibm.com,
	akpm@linux-foundation.org,
	peterz@infradead.org,
	arnd@arndb.de,
	keescook@chromium.org,
	paulmck@kernel.org,
	jpoimboe@kernel.org,
	samitolvanen@google.com,
	frederic@kernel.org,
	ardb@kernel.org,
	juerg.haefliger@canonical.com,
	rmk+kernel@armlinux.org.uk,
	geert+renesas@glider.be,
	tony@atomide.com,
	linus.walleij@linaro.org,
	sebastian.reichel@collabora.com,
	nick.hawkins@hpe.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	mtosatti@redhat.com,
	vschneid@redhat.com,
	dhildenb@redhat.com
Subject: [PATCH 1/3] arch: Introduce ARCH_HAS_CPUMASK_BITS
Date: Tue,  4 Apr 2023 16:42:22 +0300
Message-Id: <20230404134224.137038-2-ypodemsk@redhat.com>
In-Reply-To: <20230404134224.137038-1-ypodemsk@redhat.com>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 05 Apr 2023 11:17:04 +1000
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
Cc: alougovs@redhat.com, ypodemsk@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures set and maintain the mm_cpumask bits when loading
or removing process from cpu.
This Kconfig will mark those to allow different behavior between
kernels that maintain the mm_cpumask and those that do not.

Signed-off-by: Yair Podemsky <ypodemsk@redhat.com>
---
 arch/Kconfig         | 8 ++++++++
 arch/arm/Kconfig     | 1 +
 arch/powerpc/Kconfig | 1 +
 arch/s390/Kconfig    | 1 +
 arch/sparc/Kconfig   | 1 +
 arch/x86/Kconfig     | 1 +
 6 files changed, 13 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index e3511afbb7f2..ec5559779e9f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1434,6 +1434,14 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_CPUMASK_BITS
+	bool
+	help
+	  Architectures that select this option set bits on the mm_cpumask
+	  to mark which cpus loaded the mm, The mask can then be used to
+	  control mm specific actions such as tlb_flush.
+
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e24a9820e12f..6111059a68a3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -70,6 +70,7 @@ config ARM
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select HARDIRQS_SW_RESEND
+	select ARCH_HAS_CPUMASK_BITS
 	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
 	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a6c4407d3ec8..2fd0160f4f8e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -144,6 +144,7 @@ config PPC
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_CPUMASK_BITS
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 9809c74e1240..b2de5ee07faf 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -86,6 +86,7 @@ config S390
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_CPUMASK_BITS
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK
 	select ARCH_INLINE_READ_LOCK_BH
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 84437a4c6545..f9e0cf26d447 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -98,6 +98,7 @@ config SPARC64
 	select ARCH_HAS_PTE_SPECIAL
 	select PCI_DOMAINS if PCI
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_CPUMASK_BITS
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index a825bf031f49..d98dfdf9c6b4 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -183,6 +183,7 @@ config X86
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_STACKLEAK
 	select HAVE_ARCH_TRACEHOOK
+	select ARCH_HAS_CPUMASK_BITS
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if X86_64
 	select HAVE_ARCH_USERFAULTFD_WP         if X86_64 && USERFAULTFD
-- 
2.31.1

