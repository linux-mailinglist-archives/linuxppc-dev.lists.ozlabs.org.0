Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9378F74C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 04:44:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcMnR69SVz3dFj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 12:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.154.54.12; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcMmX23pjz3cF4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 12:43:52 +1000 (AEST)
X-QQ-mid: bizesmtp63t1693536189tkmoq9aj
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Sep 2023 10:43:07 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: ILHsT53NKPikqRpUmb/Bp53N8fIQVxFdzsSSCoNVCrrOuCQAPrZzIqNQMmXwh
	2cV4ZEwYZsYDQmtjeppHl/NApjVDPAdVhhpFCD37BgPgcrX9ja0sDgD9L53lCv2duFPC7QU
	pTf5+ppcjZhGpfNJgSNWigrh8XfRNQMhxSAX9DTC3enppkezGVfjYcNALFtMKJPkiEoq0ib
	flW6ae+jepw1MRUmD1R/OcufJgeeBoktpaZmEOGJI1NKKFocM0lhYPf+fj2Sz13ClBt6Eik
	au13Z20pASB3EzZdYDbEG+MjzNS4kPfJ9070Psa7xZ35BCxgmHDyu9yJxjTERumeM0sPNxi
	/SBvwLBhKEesfAaAVcGFeatQEAzEDTBgkRs1fpZPr8X4R8DIoPmDJ+Dje+7pw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17786608530106017216
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	tsbogend@alpha.franken.de,
	hdegoede@redhat.com
Subject: [PATCH v2 2/3] kconfig: add dependencies of POWER_RESET for x86
Date: Fri,  1 Sep 2023 10:43:05 +0800
Message-Id: <0ae69e7038e64c0b068d86301084bc336d30675c.1693535514.git.tanyuan@tinylab.org>
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

x86 and x86_64's power off depends on ACPI and PCI to work. Enable them
when POWER_RESET is set for convenience.

Suggested-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/x86/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 982b777eadc7..5c1632e40bf2 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -58,6 +58,7 @@ config X86
 	#
 	# Note: keep this list sorted alphabetically
 	#
+	select ACPI		if POWER_RESET
 	select ACPI_LEGACY_TABLES_LOOKUP	if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_32BIT_OFF_T			if X86_32
@@ -286,6 +287,7 @@ config X86
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
+	select PCI		if POWER_RESET
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
 	select PERF_EVENTS
-- 
2.34.1

