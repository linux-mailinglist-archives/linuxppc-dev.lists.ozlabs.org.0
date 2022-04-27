Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12744512917
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpdpt0351z3fmj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:49:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=S+EoVVMb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=S+EoVVMb; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpZZX5tj5z3bbV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 09:24:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9bJIN4/MOEhLx8CsVfKAquGTzb1mVDbHr+j6ymCNHAs=; b=S+EoVVMbG0R6l0pBfRnMsKZosp
 2PXBHwhmghS5Lvs4v4GQMUSqpGyoQ5U6Zbnyj6sMhUP4BCGILxO7PkeMyVqV/H8eeh+l7ihT1MYQn
 6lRWijWvq/MbBgY8W5xo5rf6VIJ8bQ3A6HUNn+RlRorsijlroe/vsascbDWK+dCTLeTv/edmbXzZt
 IkkQl7Ezob0EK5zEWLgIk+XPPHoVSiw2Ov7kaRBDa36NQrRgmO2O3HFxvBLZEYb5QzmHEcsWLMOdr
 YdjDzKF3as62X+/HBzxjW/bJqz3Ux15HOHGOCZtJDgeQcPUWNNi8PdpLZsxk0QJWHs39xjqIBwc58
 XGSV7jaw==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqU9-0001ye-3z; Thu, 28 Apr 2022 00:50:14 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs
 shutdown path
Date: Wed, 27 Apr 2022 19:48:56 -0300
Message-Id: <20220427224924.592546-3-gpiccoli@igalia.com>
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
 fabiomirmar@gmail.com, x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the regular CPU shutdown path for ARM disables IRQs/FIQs
in the secondary CPUs - smp_send_stop() calls ipi_cpu_stop(), which
is responsible for that. This makes sense, since we're turning off
such CPUs, putting them in an endless busy-wait loop.

Problem is that there is an alternative path for disabling CPUs,
in the form of function crash_smp_send_stop(), used for kexec/panic
paths. This functions relies in a SMP call that also triggers a
busy-wait loop [at machine_crash_nonpanic_core()], but *without*
disabling interrupts. This might lead to odd scenarios, like early
interrupts in the boot of kexec'd kernel or even interrupts in
other CPUs while the main one still works in the panic path and
assumes all secondary CPUs are (really!) off.

This patch mimics the ipi_cpu_stop() interrupt disable mechanism
in the crash CPU shutdown path, hence disabling IRQs/FIQs in all
secondary CPUs in the kexec/panic path as well.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/arm/kernel/machine_kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index f567032a09c0..ef788ee00519 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -86,6 +86,9 @@ void machine_crash_nonpanic_core(void *unused)
 	set_cpu_online(smp_processor_id(), false);
 	atomic_dec(&waiting_for_crash_ipi);
 
+	local_fiq_disable();
+	local_irq_disable();
+
 	while (1) {
 		cpu_relax();
 		wfe();
-- 
2.36.0

