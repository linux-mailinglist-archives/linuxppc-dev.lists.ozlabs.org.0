Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8F254068
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:14:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcb9d0wKqzDqfy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.72;
 helo=se15-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se15-1.privateemail.com (se15-1.privateemail.com
 [198.54.127.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZwb4VPxzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 18:03:10 +1000 (AEST)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se15.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>)
 id 1kBAOl-0002Gu-Df; Wed, 26 Aug 2020 22:24:33 -0700
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 57494A76;
 Thu, 27 Aug 2020 05:24:31 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id CE1F18004B;
 Thu, 27 Aug 2020 01:24:28 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.231])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 3933B80053;
 Thu, 27 Aug 2020 05:24:22 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/6] powerpc: Initialize a temporary mm for code patching
Date: Thu, 27 Aug 2020 00:26:58 -0500
Message-Id: <20200827052659.24922-6-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827052659.24922-1-cmr@codefail.de>
References: <20200827052659.24922-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00776017203759)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhVv7rlXgnegPp0
 HsLwAHEZaUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kq02yUY2BU41HLqp9U+7si8M8
 LdvJpZ7k99Lvu8YZXeI6p5bbhGYzvfahQ7X4A9L0Ye/JicEYVQv1wTfnWwJUGLoHT+TiZ2cHCmVO
 a6Hj9oipjXdGD/4stwDWza1vvIswJODXbtOodkPED+RkHjVGH2xZ/WG2ZLv5RT/cF5Q6687AHRjU
 JmjnvGEokRBTZJpViFKfD1jKgYfH+6S5qDVYoHta8E9ScH7TtyK/xsUDPODbhw3Crbac1ieeuRax
 ITFpzO11BRKqT8B4uLrn7iz8uvLBMzbIQcSG8L0jOzL80Q1MxDcqDeEvahfPkDkTlH91LgaQnmF8
 H6pa6B8MTK1ligAJ9G0GMvMSOAhk0taEj8weJNI+C0vMCMVtmGEXbiaCRPGqg4v6OwYy/yt5Cj+T
 3txbXpCgbiKBsA+Ddi6maweYdUirBly/K12a4uqqibUj/dHBojDbLVZkEx6TcwTT039q0aZI3qbh
 XsaDdLgW9brs8lq6YeUVTmb2st+aVE9JYOaeuiH/yEdZH8S1+TgcJBOjh0vPxcQOjKKOrYIQYpwa
 mUdylUIKhf3z2GAHxH7IMNrut00GZ5qvF8IF7tMR7zZ0OXNO45l0fhWSb7cPfaFqshmoTS0FU6vE
 Cbg2Clldwov2GavqJ07j7hZY8mVbefiuK2KN35hXmy7nXQ2QuBuxX4OQOI/UQ6jnFfMBgzwOw1To
 H/cUtROfGg27pVfRPjU3fSpvtX7kDRT+AqQr2T3rxJw/s9JEmzH0m3M+UGtqY+MEFEMbQyzq3WYA
 UeYsX5BtyrbC60lIMha6/GOK3MlDPDo3pDJlUlQ25PasjIMI9uAIvgWsH+Wq0zDLDi3S8euO5TcD
 eKjrEmYPn2IVWRsZR6NeDQwp7lDA8K9tDm+p97/T4LRRVYxF+VXiiOfHJN40eTXlWiUAYdLmsJdA
 oPKCpWwKtkkGG+bEnfOEkWTNI3SjTCvjMfNBc9ze9o81pXKSQ+GI7QB7PH97h6/L6Wb57LVs51cV
 C2TOjdXlLnr1FFwa8AyQYqjO7qYtiXb+9Q==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When code patching a STRICT_KERNEL_RWX kernel the page containing the
address to be patched is temporarily mapped with permissive memory
protections. Currently, a per-cpu vmalloc patch area is used for this
purpose. While the patch area is per-cpu, the temporary page mapping is
inserted into the kernel page tables for the duration of the patching.
The mapping is exposed to CPUs other than the patching CPU - this is
undesirable from a hardening perspective.

Use the `poking_init` init hook to prepare a temporary mm and patching
address. Initialize the temporary mm by copying the init mm. Choose a
randomized patching address inside the temporary mm userspace address
portion. The next patch uses the temporary mm and patching address for
code patching.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/lib/code-patching.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 89b37ece6d2f..051d7ae6d8ee 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -11,6 +11,8 @@
 #include <linux/cpuhotplug.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/sched/task.h>
+#include <linux/random.h>
 
 #include <asm/tlbflush.h>
 #include <asm/page.h>
@@ -109,6 +111,44 @@ static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
 	}
 }
 
+static struct mm_struct *patching_mm __ro_after_init;
+static unsigned long patching_addr __ro_after_init;
+
+void __init poking_init(void)
+{
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+
+	/*
+	 * Some parts of the kernel (static keys for example) depend on
+	 * successful code patching. Code patching under STRICT_KERNEL_RWX
+	 * requires this setup - otherwise we cannot patch at all. We use
+	 * BUG_ON() here and later since an early failure is preferred to
+	 * buggy behavior and/or strange crashes later.
+	 */
+	patching_mm = copy_init_mm();
+	BUG_ON(!patching_mm);
+
+	/*
+	 * Choose a randomized, page-aligned address from the range:
+	 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE]
+	 * The lower address bound is PAGE_SIZE to avoid the zero-page.
+	 * The upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to stay
+	 * under DEFAULT_MAP_WINDOW in hash.
+	 */
+	patching_addr = PAGE_SIZE + ((get_random_long() & PAGE_MASK)
+			% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
+
+	/*
+	 * PTE allocation uses GFP_KERNEL which means we need to pre-allocate
+	 * the PTE here. We cannot do the allocation during patching with IRQs
+	 * disabled (ie. "atomic" context).
+	 */
+	ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
+	BUG_ON(!ptep);
+	pte_unmap_unlock(ptep, ptl);
+}
+
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
 #ifdef CONFIG_LKDTM
-- 
2.28.0

