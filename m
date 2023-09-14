Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C17A0153
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmY5C6yDfz3dXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:11:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmY4P3GJ5z3dHH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 20:11:01 +1000 (AEST)
X-QQ-mid: bizesmtp80t1694686235tv24onfr
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 18:10:33 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: D2GZf6M6C/jEf5dgdkfxbCYflqBn47liM3u22OICM3qFIgIPe30JgWG0WdUMP
	nzAwwCET4MeQPZtn7NJpNiRKgSuxBj9mFB8uAOuE8SbteXuCMyBqMmEaJELI4A66py1/EfO
	XJuPE8DnDTzcVtNCOReTcSor/gmRd3Q6QIKmLzaWAtuxzo79qaXuHDefWG2U1DSvl9oLglN
	cXRwYQBmbazi8IJRg73ZewaEXX9oJRrozUPmZOXSOAn6yh3dqgZmq59VrTt9fSafFbHBHDO
	Z4+7neDlTrK0toV//xbK7bL/wG6zNdVmnsvhp5YB+NaBgwo3lQHTnb38Yf5iJcw6NfWIfTa
	DIQCuW6fh4C/TvuIOf4WwKYGs2oz+912Rc+osCQe9UVrIojgAUe5Rmip+6f7g==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4024459364246311610
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Subject: [PATCH v3 2/3] Kconfig: Add dependencies of POWER_RESET for pmac32
Date: Thu, 14 Sep 2023 18:10:31 +0800
Message-Id: <0cca5d5afb6c4a1b78648e98339b4b7c9def46d5.1694685860.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694685860.git.tanyuan@tinylab.org>
References: <cover.1694685860.git.tanyuan@tinylab.org>
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
Cc: linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, tanyuan@tinylab.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pmac32's power off depends on ADB_CUDA to work. Enable it when
POWER_RESET is set for convenience.

Suggested-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/powerpc/platforms/powermac/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
index 130707ec9f99..8bdae0caf21e 100644
--- a/arch/powerpc/platforms/powermac/Kconfig
+++ b/arch/powerpc/platforms/powermac/Kconfig
@@ -2,6 +2,7 @@
 config PPC_PMAC
 	bool "Apple PowerMac based machines"
 	depends on PPC_BOOK3S && CPU_BIG_ENDIAN
+	select ADB_CUDA if POWER_RESET && PPC32
 	select MPIC
 	select FORCE_PCI
 	select PPC_INDIRECT_PCI if PPC32
-- 
2.34.1


