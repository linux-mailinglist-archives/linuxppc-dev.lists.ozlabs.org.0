Return-Path: <linuxppc-dev+bounces-14775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C1CBE7E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 16:06:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNfJ0Zwbz30Ff;
	Tue, 16 Dec 2025 02:05:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765811127;
	cv=none; b=kKGx51xjV7SaxXDe4+FzSjnjeDL/aMBjyxX/md2baC1Ul7sWA7HjL9vfztbItt9Bve7/FQ4XBn3brtdtI4ojRs6LAbp+sf0qjCag1aizoKmEXeOFKdHspK5nmVBApoLsfNyluSXgC+JAq46ANtJgKshM82k9FXa6th/2XN8R+rOQme1ezRCBfMXEbzHGRxsUmfaLWELeV5TYpL2vXccCBJL13OG0KOvb0b7+UI7S8t/mbeQ818hp4nhLluBebV2+cN3EivyPVmUUEoi5rn1q1yd8s+mlaMJKMMq3apau7smtZulCqofQZFfJk6XY7ILvoC1DwK8aizLcQCEHYEOpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765811127; c=relaxed/relaxed;
	bh=c1HVE5iTJsVXawLpc/SH/1Lz2/bA9CTwze4YimX69RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRxop493OKieVZYMTgO2iKpgjVzIqi5WBVj52z24HIM1yQot6n7bz1hqOP760YhFDUZ2jKT00r5PTqXlM6MVZ+KQR4xSlN7+K1gIxZqGTfRW+7GqOT70ONsK73vFvLvVvgjeLrnsqW8DiwIOEtmagNRQrPgzILqWxZTF9TD7JX4DLDMjjW1wrubJ4KCRp02bUYw89cPs3T+6GqhCzyeA2840mistj1eEggGScbpyPEGsSf53WEy7DKTbiRAAFxE2I7Q/XHSWQFc9lW/0dZB6lbZEK61FlvRDW0gIsINBqkkqTowje5SoiYF5aL7O9c2EI/qwHfaDhoQOgsk6WahAIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNfH2n29z2yvN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 02:05:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D991713;
	Mon, 15 Dec 2025 07:04:49 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F803F73B;
	Mon, 15 Dec 2025 07:04:51 -0800 (PST)
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
Subject: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Date: Mon, 15 Dec 2025 15:03:23 +0000
Message-ID: <20251215150323.2218608-15-kevin.brodsky@arm.com>
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

Add basic KUnit tests for the generic aspects of the lazy MMU mode:
ensure that it appears active when it should, depending on how
enable/disable and pause/resume pairs are nested.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/Kconfig                     | 12 ++++++
 mm/Makefile                    |  1 +
 mm/tests/lazy_mmu_mode_kunit.c | 71 ++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 mm/tests/lazy_mmu_mode_kunit.c

diff --git a/mm/Kconfig b/mm/Kconfig
index 62073bd61544..ac48deb44884 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1471,6 +1471,18 @@ config ARCH_HAS_LAZY_MMU_MODE
 	  MMU-related architectural state to be deferred until the mode is
 	  exited. See <linux/pgtable.h> for details.
 
+config LAZY_MMU_MODE_KUNIT_TEST
+	tristate "KUnit tests for the lazy MMU mode" if !KUNIT_ALL_TESTS
+	depends on ARCH_HAS_LAZY_MMU_MODE
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to check that the lazy MMU mode interface behaves
+	  as expected. Only tests for the generic interface are included (not
+	  architecture-specific behaviours).
+
+	  If unsure, say N.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 2d0570a16e5b..9175f8cc6565 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,3 +147,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
+obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
new file mode 100644
index 000000000000..2720eb995714
--- /dev/null
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/pgtable.h>
+
+static void expect_not_active(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, is_lazy_mmu_mode_active());
+}
+
+static void expect_active(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, is_lazy_mmu_mode_active());
+}
+
+static void lazy_mmu_mode_active(struct kunit *test)
+{
+	expect_not_active(test);
+
+	lazy_mmu_mode_enable();
+	expect_active(test);
+
+	{
+		/* Nested section */
+		lazy_mmu_mode_enable();
+		expect_active(test);
+
+		lazy_mmu_mode_disable();
+		expect_active(test);
+	}
+
+	{
+		/* Paused section */
+		lazy_mmu_mode_pause();
+		expect_not_active(test);
+
+		{
+			/* No effect (paused) */
+			lazy_mmu_mode_enable();
+			expect_not_active(test);
+
+			lazy_mmu_mode_disable();
+			expect_not_active(test);
+
+			lazy_mmu_mode_pause();
+			expect_not_active(test);
+
+			lazy_mmu_mode_resume();
+			expect_not_active(test);
+		}
+
+		lazy_mmu_mode_resume();
+		expect_active(test);
+	}
+
+	lazy_mmu_mode_disable();
+	expect_not_active(test);
+}
+
+static struct kunit_case lazy_mmu_mode_test_cases[] = {
+	KUNIT_CASE(lazy_mmu_mode_active),
+	{}
+};
+
+static struct kunit_suite lazy_mmu_mode_test_suite = {
+	.name = "lazy_mmu_mode",
+	.test_cases = lazy_mmu_mode_test_cases,
+};
+kunit_test_suite(lazy_mmu_mode_test_suite);
+
+MODULE_DESCRIPTION("Tests for the lazy MMU mode");
+MODULE_LICENSE("GPL");
-- 
2.51.2


