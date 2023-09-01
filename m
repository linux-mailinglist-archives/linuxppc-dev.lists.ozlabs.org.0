Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69178F74D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 04:45:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcMny5Sycz3c9t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 12:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.154.54.12; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcMmX2KXqz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 12:43:56 +1000 (AEST)
X-QQ-mid: bizesmtp77t1693536209t8i43xj8
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Sep 2023 10:43:26 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: QityeSR92A0LOme/49hD1dohgKPUj6JFZbPA6VXALGirx2d9SGmHC4LPSlhoU
	vMq4vEqz1ROL+SpIvLl0a+/+eeOy6xbdAUAPetw8n4bF9Ive3MyQJpJYbNvtlPFV7LE9dLO
	uR2HdijIKe9vEeds/ifikTIA5fL1B5wwRq33VFA+BhsuzW00D1XUGPNU58heRTZ1CV9aGuq
	UqTR9gT6tVPFperJe9++X7kT8rwfzXhPpO1R23+ansfsvUccRLAPsJV3XESMjSsAslaWfq8
	xEdHtz/KkcNq6wxRvuHKHakDHy5sZ5arD6qUkRrH1QIoRaJrbaEwgK60RnIMNHH1neVfPvz
	yOObQBJcRvkpFx9eBT0F9LWRK1iDyZde2vzawjAYWq5wbiFFVA=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6151706240093031970
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	tsbogend@alpha.franken.de,
	hdegoede@redhat.com
Subject: [PATCH v2 3/3] kconfig: add dependencies of POWER_RESET for PowerMac
Date: Fri,  1 Sep 2023 10:43:25 +0800
Message-Id: <60cbfd566777a6d6e3664d7f29fa91424716c873.1693535514.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693535514.git.tanyuan@tinylab.org>
References: <cover.1693535514.git.tanyuan@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux@weissschuh.net, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, Yuan Tan <tanyuan@tinylab.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerMac's power off depends on ADB_CUDA to work. Enable it when
POWER_RESET is set for convenience.

Suggested-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/powerpc/platforms/powermac/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
index 130707ec9f99..9e633d7e8367 100644
--- a/arch/powerpc/platforms/powermac/Kconfig
+++ b/arch/powerpc/platforms/powermac/Kconfig
@@ -2,6 +2,7 @@
 config PPC_PMAC
 	bool "Apple PowerMac based machines"
 	depends on PPC_BOOK3S && CPU_BIG_ENDIAN
+	select ADB_CUDA if POWER_RESET
 	select MPIC
 	select FORCE_PCI
 	select PPC_INDIRECT_PCI if PPC32
-- 
2.34.1


