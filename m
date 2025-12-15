Return-Path: <linuxppc-dev+bounces-14766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FFCCBE7BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 16:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNdX62nHz2yYq;
	Tue, 16 Dec 2025 02:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765811088;
	cv=none; b=lGkT9BQAVagscSGQftcI3Z2qU1IQttVQMEaM2ycrrBL0FT1nvjwHoQon73B4Y1IGQl0Vph05BFbFIAAtq6+DWy/j4fYNWhYe3PeuQSNCjwEF9a/6hV/WtgdzD2XVJItUJQd+AsSHgh+sSC9IQITUUQx33CGBE976c0OxpB8Awq/Y4HWdHfxrOie+oyywJvmZ6itXLoY5VTGiCn4u+JCgdJ31BHaDvSw8DOyKaqBBX6TffCZZLNq/C/Zty8r8cqtZOnP/CMdfEQFoHWd8babHAbqrz+eAbZ1/GZ6GhcmkJSVHExYwxKv7bEO2hWT7FOxD4OdWBDBpOh47PrTEuqXbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765811088; c=relaxed/relaxed;
	bh=8PjcRxlbU/ydtWRj6Ipq1dnPy+qOjNejDozpydmwU0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aaqv350wr7kk/pUtMWK0eMvA6WHMXpta+WAfq23808Qmid4/hxaJCqrs7Zm+a2IMNPUqWkEPi/zyqttp5mQr37egMUNCMYvN0YdXJ6RW2DXcV+FVMv886zY5X1wmlNgNvZbdCfVESD83o60oUz1gNTbDVVU539xALloI/gBKCCXd43w06urkOikJlxTZyrNi7H2pxvMrIqGFBjlBrtGea+i/1H3u/YMlCVVRyHQmrBRtvI/zy0vea6iNsOWmcJ3wZS5i8ajDhOL2NrxZs5gVogjcb6qGfFpjXQQBdAcWfuSXn/zCSP1m8EqHxqxW8g6QiAdWSmRBdXj7hNsqhF3HqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNdX05JLz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 02:04:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B751168F;
	Mon, 15 Dec 2025 07:03:58 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0493F73B;
	Mon, 15 Dec 2025 07:04:00 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v6 05/14] mm: clarify lazy_mmu sleeping constraints
Date: Mon, 15 Dec 2025 15:03:14 +0000
Message-ID: <20251215150323.2218608-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The lazy MMU mode documentation makes clear that an implementation
should not assume that preemption is disabled or any lock is held
upon entry to the mode; however it says nothing about what code
using the lazy MMU interface should expect.

In practice sleeping is forbidden (for generic code) while the lazy
MMU mode is active: say it explicitly.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/pgtable.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 652f287c1ef6..1abc4a1c3d72 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -225,11 +225,15 @@ static inline int pmd_dirty(pmd_t pmd)
  * up to date.
  *
  * In the general case, no lock is guaranteed to be held between entry and exit
- * of the lazy mode. So the implementation must assume preemption may be enabled
- * and cpu migration is possible; it must take steps to be robust against this.
- * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
- * and the mode cannot be used in interrupt context.
+ * of the lazy mode. (In practice, for user PTE updates, the appropriate page
+ * table lock(s) are held, but for kernel PTE updates, no lock is held).
+ * The implementation must therefore assume preemption may be enabled upon
+ * entry to the mode and cpu migration is possible; it must take steps to be
+ * robust against this. An implementation may handle this by disabling
+ * preemption, as a consequence generic code may not sleep while the lazy MMU
+ * mode is active.
+ *
+ * Nesting is not permitted and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void) {}
-- 
2.51.2


