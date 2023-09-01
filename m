Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99078F74A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 04:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcMmx1lT5z3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 12:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcMlx4XRCz2yVm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 12:43:25 +1000 (AEST)
X-QQ-mid: bizesmtp64t1693536174t9044o1z
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Sep 2023 10:42:51 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: Il1yX1zTS2BHWSstdcCt5mY0CNhZNgSeowA3XGKAQPor4pdSSfB5hjGUTUdBR
	1/LR4dIewrobsjxgeoON5/mNLRFCOACkmeERHihf+EEuqKH4chhMidlUyysBENPMT5zIzj7
	MJpMAZZjnqJwPR+wBk9heRNrwEsh7EeR3hEjYERdXwQpFM6hUgHiFxWf4/W0vsrTtDi6f4w
	Ju5fJnbSsKeUx6v9+HBC2QLVYgn+QURGyQ0x8HqZ2IDJ+kGgXt0b1szXOuLF5uZr6QcmWNH
	+5ZfQ3x0w5vQnMwliDK9dlUGCgKnSU1o+TUU3LYBDaAc+S/TaMnxhYRVVVwX/M9TL6FvKPz
	FP/dqcBBZ+7hta/oN9WXV2KIDKkjePDCcUQzojWK86UJT1sa4k=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5453615526016975982
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	tsbogend@alpha.franken.de,
	hdegoede@redhat.com
Subject: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips malta
Date: Fri,  1 Sep 2023 10:42:49 +0800
Message-Id: <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
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

MIPS Malta's power off depends on PCI, PCI_QUIRKS, and
POWER_RESET_PIIX4_POWEROFF to work. Enable them when POWER_RESET is set
for convenience.

Suggested-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index bc8421859006..13bacbd05125 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -547,6 +547,9 @@ config MIPS_MALTA
 	select MIPS_L1_CACHE_SHIFT_6
 	select MIPS_MSC
 	select PCI_GT64XXX_PCI0
+	select PCI if POWER_RESET
+	select PCI_QUIRKS if POWER_RESET
+	select POWER_RESET_PIIX4_POWEROFF if POWER_RESET
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_MIPS32_R1
-- 
2.34.1

