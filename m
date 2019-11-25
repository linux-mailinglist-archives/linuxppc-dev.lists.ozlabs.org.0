Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C619108D11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 12:34:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M4h81BpxzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 22:34:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=qais.yousef@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47M4Xd1g8kzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 22:28:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71001045;
 Mon, 25 Nov 2019 03:28:14 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44ACF3F52E;
 Mon, 25 Nov 2019 03:28:13 -0800 (PST)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 06/14] powerpc: Replace cpu_up/down with
 device_online/offline
Date: Mon, 25 Nov 2019 11:27:46 +0000
Message-Id: <20191125112754.25223-7-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125112754.25223-1-qais.yousef@arm.com>
References: <20191125112754.25223-1-qais.yousef@arm.com>
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
Cc: Ram Pai <linuxram@us.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Enrico Weigelt <info@metux.net>,
 Qais Yousef <qais.yousef@arm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The core device API performs extra housekeeping bits that are missing
from directly calling cpu_up/down.

See commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and
serialization during LPM") for an example description of what might go
wrong.

This also prepares to make cpu_up/down a private interface for anything
but the cpu subsystem.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Qais Yousef <qais.yousef@arm.com>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Enrico Weigelt <info@metux.net>
CC: Ram Pai <linuxram@us.ibm.com>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Thiago Jung Bauermann <bauerman@linux.ibm.com>
CC: Christophe Leroy <christophe.leroy@c-s.fr>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
---
 arch/powerpc/kernel/machine_kexec_64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/machine_kexec_64.c b/arch/powerpc/kernel/machine_kexec_64.c
index 04a7cba58eff..ebf8cc7acc4d 100644
--- a/arch/powerpc/kernel/machine_kexec_64.c
+++ b/arch/powerpc/kernel/machine_kexec_64.c
@@ -208,13 +208,15 @@ static void wake_offline_cpus(void)
 {
 	int cpu = 0;
 
+	lock_device_hotplug();
 	for_each_present_cpu(cpu) {
 		if (!cpu_online(cpu)) {
 			printk(KERN_INFO "kexec: Waking offline cpu %d.\n",
 			       cpu);
-			WARN_ON(cpu_up(cpu));
+			WARN_ON(device_online(get_cpu_device(cpu)));
 		}
 	}
+	unlock_device_hotplug();
 }
 
 static void kexec_prepare_cpus(void)
-- 
2.17.1

