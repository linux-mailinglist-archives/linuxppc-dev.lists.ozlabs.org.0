Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AECBD84076C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 14:51:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDDkoG2Z;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDDkoG2Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNqTW4c9Fz3cVV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 00:51:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDDkoG2Z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDDkoG2Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNqSm2TMGz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 00:50:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706536244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jc8Yx5eNW+ZkMcLwS9vYyBi1Ha2SHd226WdxPKcg/iA=;
	b=EDDkoG2ZVEaO5gAg+hR6D0mB//MB1WW4U0v7E5vlKvn1Mpl1PurByNejIiyPrrgCIipPPO
	Q0SfnpTtYfW9qqRyNBvGpi1SWu3poiKjiflmF3juBlMdrKlKYFbs2ADeIE3DlUwCMfJSV5
	Bg5BqyalqIPkmEdq3FrmYEAbitTAv64=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706536244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jc8Yx5eNW+ZkMcLwS9vYyBi1Ha2SHd226WdxPKcg/iA=;
	b=EDDkoG2ZVEaO5gAg+hR6D0mB//MB1WW4U0v7E5vlKvn1Mpl1PurByNejIiyPrrgCIipPPO
	Q0SfnpTtYfW9qqRyNBvGpi1SWu3poiKjiflmF3juBlMdrKlKYFbs2ADeIE3DlUwCMfJSV5
	Bg5BqyalqIPkmEdq3FrmYEAbitTAv64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-_OvrGVNDO9avpejqoLvkvw-1; Mon, 29 Jan 2024 08:50:40 -0500
X-MC-Unique: _OvrGVNDO9avpejqoLvkvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EA1B101A526;
	Mon, 29 Jan 2024 13:50:40 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECEBAA26;
	Mon, 29 Jan 2024 13:50:35 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kexec@lists.infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP ifdef inside CONFIG_KEXEC_CODE ifdef scope
Date: Mon, 29 Jan 2024 21:50:31 +0800
Message-ID: <20240129135033.157195-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, mhklinux@outlook.com, x86@kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested inside
arch/x86/xen/enlighten_hvm.c.

Although the nesting works well too since CONFIG_CRASH_DUMP has
dependency on CONFIG_KEXEC_CORE, it may cause confuse because there
are places where it's not nested, and people may think it need be nested
even though it doesn't have to.

Fix that by moving  CONFIG_CRASH_DUMP ifdeffery of codes out of
CONFIG_KEXEC_CODE ifdeffery scope.

And also fix a building error Nathan reported as below by replacing
CONFIG_KEXEC_CORE ifdef with CONFIG_VMCORE_INFO ifdef.

====
$ curl -LSso .config https://git.alpinelinux.org/aports/plain/community/linux-edge/config-edge.x86_64
$ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- olddefconfig all
...
x86_64-linux-ld: arch/x86/xen/mmu_pv.o: in function `paddr_vmcoreinfo_note':
mmu_pv.c:(.text+0x3af3): undefined reference to `vmcoreinfo_note'
====

Link: https://lore.kernel.org/all/SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com/T/#u
Link: https://lore.kernel.org/all/20240126045551.GA126645@dev-arch.thelio-3990X/T/#u
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/kernel/cpu/mshyperv.c | 10 ++++++----
 arch/x86/kernel/reboot.c       |  2 +-
 arch/x86/xen/enlighten_hvm.c   |  4 ++--
 arch/x86/xen/mmu_pv.c          |  2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index f8163a59026b..2e8cd5a4ae85 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -209,6 +209,7 @@ static void hv_machine_shutdown(void)
 	if (kexec_in_progress)
 		hyperv_cleanup();
 }
+#endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_CRASH_DUMP
 static void hv_machine_crash_shutdown(struct pt_regs *regs)
@@ -222,8 +223,7 @@ static void hv_machine_crash_shutdown(struct pt_regs *regs)
 	/* Disable the hypercall page when there is only 1 active CPU. */
 	hyperv_cleanup();
 }
-#endif
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_DUMP */
 #endif /* CONFIG_HYPERV */
 
 static uint32_t  __init ms_hyperv_platform(void)
@@ -497,9 +497,11 @@ static void __init ms_hyperv_init_platform(void)
 	no_timer_check = 1;
 #endif
 
-#if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
+#if IS_ENABLED(CONFIG_HYPERV)
+#if defined(CONFIG_KEXEC_CORE)
 	machine_ops.shutdown = hv_machine_shutdown;
-#ifdef CONFIG_CRASH_DUMP
+#endif
+#if defined(CONFIG_CRASH_DUMP)
 	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
 #endif
 #endif
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 1287b0d5962f..f3130f762784 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -826,7 +826,7 @@ void machine_halt(void)
 	machine_ops.halt();
 }
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
 {
 	machine_ops.crash_shutdown(regs);
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 09e3db7ff990..0b367c1e086d 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -148,6 +148,7 @@ static void xen_hvm_shutdown(void)
 	if (kexec_in_progress)
 		xen_reboot(SHUTDOWN_soft_reset);
 }
+#endif
 
 #ifdef CONFIG_CRASH_DUMP
 static void xen_hvm_crash_shutdown(struct pt_regs *regs)
@@ -156,7 +157,6 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
 	xen_reboot(SHUTDOWN_soft_reset);
 }
 #endif
-#endif
 
 static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 {
@@ -238,10 +238,10 @@ static void __init xen_hvm_guest_init(void)
 
 #ifdef CONFIG_KEXEC_CORE
 	machine_ops.shutdown = xen_hvm_shutdown;
+#endif
 #ifdef CONFIG_CRASH_DUMP
 	machine_ops.crash_shutdown = xen_hvm_crash_shutdown;
 #endif
-#endif
 }
 
 static __init int xen_parse_nopv(char *arg)
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 218773cfb009..e21974f2cf2d 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2520,7 +2520,7 @@ int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(xen_remap_pfn);
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_VMCORE_INFO
 phys_addr_t paddr_vmcoreinfo_note(void)
 {
 	if (xen_pv_domain())
-- 
2.41.0

