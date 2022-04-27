Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87751291B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:51:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpdrC0d5Hz3ftK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:51:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XhhicIla;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=XhhicIla; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpZbD63fcz3bcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 09:24:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r/T7YOY0VHwWAfHSEqxJa3Wt3qfvSExYRCUKLKE/qpM=; b=XhhicIlaxPAENQgGkNSZu/8JWa
 MoKMtLET2WEey/cUMjdoOeeZp/qIHF9AnIAQ1U9UG9ceTx5YsNvbqlEug3W8sTqjMADP3kqZkWGXE
 81ePHhsZB9/Fl6O5VwXVIzqdUd2GxbFqpTJI3oISOjep5UHhEIJ1gEAyfbzeKWGz11qqm1H8SqNmy
 PIXViapEJaVN3g1qVA0ll8xOHoXY2Fth5HpQAgahG3Orvdyx32C20SUgZY0+6ymNqW2eIcskQ9hv0
 PnRYqaVu+GNdXU/wxDKHHXg22u4+P2b/VN7O5/RK6RnCNvbziWOBIpkgY1JIKXd1EMfFHtVMCWu3y
 LPmztM1w==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqTt-0001xj-VW; Thu, 28 Apr 2022 00:49:58 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 01/30] x86/crash,
 reboot: Avoid re-disabling VMX in all CPUs on crash/restart
Date: Wed, 27 Apr 2022 19:48:55 -0300
Message-Id: <20220427224924.592546-2-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Apr 2022 11:34:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, "David P . Reed" <dpreed@deepplum.com>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, Sean Christopherson <seanjc@google.com>,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the panic path we have a list of functions to be called, the panic
notifiers - such callbacks perform various actions in the machine's
last breath, and sometimes users want them to run before kdump. We
have the parameter "crash_kexec_post_notifiers" for that. When such
parameter is used, the function "crash_smp_send_stop()" is executed
to poweroff all secondary CPUs through the NMI-shootdown mechanism;
part of this process involves disabling virtualization features in
all CPUs (except the main one).

Now, in the emergency restart procedure we have also a way of
disabling VMX in all CPUs, using the same NMI-shootdown mechanism;
what happens though is that in case we already NMI-disabled all CPUs,
the emergency restart fails due to a second addition of the same items
in the NMI list, as per the following log output:

sysrq: Trigger a crash
Kernel panic - not syncing: sysrq triggered crash
[...]
Rebooting in 2 seconds..
list_add double add: new=<addr1>, prev=<addr2>, next=<addr1>.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:29!
invalid opcode: 0000 [#1] PREEMPT SMP PTI

In order to reproduce the problem, users just need to set the kernel
parameter "crash_kexec_post_notifiers" *without* kdump set in any
system with the VMX feature present.

Since there is no benefit in re-disabling VMX in all CPUs in case
it was already done, this patch prevents that by guarding the restart
routine against doubly issuing NMIs unnecessarily. Notice we still
need to disable VMX locally in the emergency restart.

Fixes: ed72736183c4 ("x86/reboot: Force all cpus to exit VMX root if VMX is supported)
Fixes: 0ee59413c967 ("x86/panic: replace smp_send_stop() with kdump friendly version in panic path")
Cc: David P. Reed <dpreed@deepplum.com>
Cc: Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/x86/include/asm/cpu.h |  1 +
 arch/x86/kernel/crash.c    |  8 ++++----
 arch/x86/kernel/reboot.c   | 14 ++++++++++++--
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index 86e5e4e26fcb..b6a9062d387f 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -36,6 +36,7 @@ extern int _debug_hotplug_cpu(int cpu, int action);
 #endif
 #endif
 
+extern bool crash_cpus_stopped;
 int mwait_usable(const struct cpuinfo_x86 *);
 
 unsigned int x86_family(unsigned int sig);
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e8326a8d1c5d..71dd1a990e8d 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -42,6 +42,8 @@
 #include <asm/crash.h>
 #include <asm/cmdline.h>
 
+bool crash_cpus_stopped;
+
 /* Used while preparing memory map entries for second kernel */
 struct crash_memmap_data {
 	struct boot_params *params;
@@ -108,9 +110,7 @@ void kdump_nmi_shootdown_cpus(void)
 /* Override the weak function in kernel/panic.c */
 void crash_smp_send_stop(void)
 {
-	static int cpus_stopped;
-
-	if (cpus_stopped)
+	if (crash_cpus_stopped)
 		return;
 
 	if (smp_ops.crash_stop_other_cpus)
@@ -118,7 +118,7 @@ void crash_smp_send_stop(void)
 	else
 		smp_send_stop();
 
-	cpus_stopped = 1;
+	crash_cpus_stopped = true;
 }
 
 #else
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index fa700b46588e..2fc42b8402ac 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -589,8 +589,18 @@ static void native_machine_emergency_restart(void)
 	int orig_reboot_type = reboot_type;
 	unsigned short mode;
 
-	if (reboot_emergency)
-		emergency_vmx_disable_all();
+	/*
+	 * We can reach this point in the end of panic path, having
+	 * NMI-disabled all secondary CPUs. This process involves
+	 * disabling the CPU virtualization technologies, so if that
+	 * is the case, we only miss disabling the local CPU VMX...
+	 */
+	if (reboot_emergency) {
+		if (!crash_cpus_stopped)
+			emergency_vmx_disable_all();
+		else
+			cpu_emergency_vmxoff();
+	}
 
 	tboot_shutdown(TB_SHUTDOWN_REBOOT);
 
-- 
2.36.0

