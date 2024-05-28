Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 9831C8D173F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 11:26:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpRjS2YXLz87ZC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 19:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpRhb51ndz7B5B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 19:16:15 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VpRDF0V3xzlX8L;
	Tue, 28 May 2024 16:55:09 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 013A5141EC8;
	Tue, 28 May 2024 16:59:30 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 16:59:28 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: [PATCH v12 6/6] arm64: send SIGBUS to user process for SEA exception
Date: Tue, 28 May 2024 16:59:15 +0800
Message-ID: <20240528085915.1955987-7-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240528085915.1955987-1-tongtiangen@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Tong Tiangen <tongtiangen@huawei.com>, Guohanjun <guohanjun@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For SEA exception, kernel require take some action to recover from memory
error, such as isolate poison page adn kill failure thread, which are done
in memory_failure().

During our test, the failure thread cannot be killed due to this issue[1],
Here, I temporarily workaround this issue by sending signals to user
processes in do_sea(). After [1] is merged, this patch can be rolled back
or the SIGBUS will be sent repeated.

[1]https://lore.kernel.org/lkml/20240204080144.7977-1-xueshuai@linux.alibaba.com/

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/mm/fault.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 2dc65f99d389..37d7e74d9aee 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -730,9 +730,6 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
 	const struct fault_info *inf;
 	unsigned long siaddr;
 
-	if (do_apei_claim_sea(regs))
-		return 0;
-
 	inf = esr_to_fault_info(esr);
 	if (esr & ESR_ELx_FnV) {
 		siaddr = 0;
@@ -744,6 +741,17 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
 		 */
 		siaddr  = untagged_addr(far);
 	}
+
+	if (do_apei_claim_sea(regs)) {
+		if (current->mm) {
+			set_thread_esr(0, esr);
+			arm64_force_sig_fault(inf->sig, inf->code, siaddr,
+				"Uncorrected memory error on access \
+				 to poison memory\n");
+		}
+		return 0;
+	}
+
 	arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
 
 	return 0;
-- 
2.25.1

