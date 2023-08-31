Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E178F3D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 22:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcCFR4q7Yz3cCH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 06:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.154.54.12; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcCDt3bWvz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 06:19:17 +1000 (AEST)
X-QQ-mid: bizesmtp90t1693513106tayols77
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Sep 2023 04:18:24 +0800 (CST)
X-QQ-SSF: 01200000000000907000B00A0000000
X-QQ-FEAT: 0laiA9+vjAD+dTjgZHIguMRpVXcACiRiQGF39CDjBBbmU1RPhqOWYLj6R7uve
	0iwIOgdKTGEFfm3SNcrx1AcnKACEyRBJXHT2Y3cS1wWj3hlu4PvmvD3BwWCcdZErTAl9P7D
	yqR/bpWpbgmK9hRg0SubA8TleklfF6Gx2vnYJp3CsWa0zTr+dla1TdMd+Tdlf1TBpyVqzXU
	ZQCekK9QPK15yq6naSaFOTudNuJ77FNLxSxodgy4wvZowaaq/00vUlONL7BLNgKQNYzOdDW
	cX+wskHSlItuHaNAsLb8zgvw+q/iarh/VsP9BAMPTtsBMttOW01NYd1swTWOL6rKye3x1o5
	+rZlMseYhTz+kGioldQaVelHlGsDZTCJDan/6XIKpfBn2dsTgDFCXL88cSmiQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10361205484968947270
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	tsbogend@alpha.franken.de,
	hdegoede@redhat.com
Subject: [PATCH v1 3/3] kconfig: add dependencies of POWER_RESET for PowerMac
Date: Fri,  1 Sep 2023 04:18:23 +0800
Message-Id: <20230831201823.3178131-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
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


