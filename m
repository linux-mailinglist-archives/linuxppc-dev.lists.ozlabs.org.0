Return-Path: <linuxppc-dev+bounces-9034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD6AC9107
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 16:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84l96tlVz2x9N;
	Sat, 31 May 2025 00:05:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748613941;
	cv=none; b=UM02I2MzOBGtx5HzWrIHoy0tI9/fOzyyZkSPL8JoFarDaDVJ5L3Pha9NTP8zNiBaOf+mfCVKN15FNcilp+u99psH9LmitAH0z39LLh4AGBzVr08gFy+nPzTZ+QZoeChK5VjD3nsvgH/YkoT+tANziqt44AHKkNOhS5K8Ttcm1MW71YmIB9g+8WND3ZEogRs55GDv27h50FcToScWXJkT++FfT5FSZ9N2aTdGHbbGBEcups/4KWBBbyU0GKBDkoT8PLO0NFdWQCyjBlbZ9jzVch5KnofBtYYqE0DY/3pAwt79KbbhGeVTzO9/YBybSpfUmPRNbAf8k4VoLdpMnHUXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748613941; c=relaxed/relaxed;
	bh=XjhsWzhDn2/IdvEGoCA1LXmpq5wNTlbc1U/aO2JV9HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhHwLF+R1fXRgIYnbSCRyk3VGX/FVrouuwWmaBjMrXbzN6cPOtrMXgWqsGTq3bgdFjwv+jYliboeQAp7N+IWSZtetSN/kWq7qDoWIxwhigyX8rikorrHjJqozjLvrfri+38GjNT/EgKLuH1mn/bg1UbV5V0Z1CS7TnaELl2COG8FCIuAAWa22id2fmHhVWxDXPTA4LE+liZ4bEsEuDvtMv336oUm/kb46l+apnSUX20jrtbQFq44FSXBuFQHDk7h+s8+Tl0duppCH7pS8BuTx038DibxrVDxdtukm0GjIcioQcph0oH1dLy8CSRA3l1zjrM2algd9/WsGnhoa6aEMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84l936Fxz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 00:05:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1E0E16F8;
	Fri, 30 May 2025 07:04:53 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3973B3F673;
	Fri, 30 May 2025 07:05:05 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb maintenance ordering in pagemap_scan_pmd_entry()
Date: Fri, 30 May 2025 15:04:39 +0100
Message-ID: <20250530140446.2387131-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
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

pagemap_scan_pmd_entry() was previously modifying ptes while in lazy mmu
mode, then performing tlb maintenance for the modified ptes, then
leaving lazy mmu mode. But any pte modifications during lazy mmu mode
may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
ordering between pte modificaiton and tlb maintenance.

Let's fix that by leaving mmu mode, forcing all the pte updates to be
actioned, before doing the tlb maintenance.

This is a theorectical bug discovered during code review.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 fs/proc/task_mmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 994cde10e3f4..361f3ffd9a0c 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2557,10 +2557,9 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
 	}
 
 flush_and_return:
+	arch_leave_lazy_mmu_mode();
 	if (flush_end)
 		flush_tlb_range(vma, start, addr);
-
-	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(start_pte, ptl);
 
 	cond_resched();
-- 
2.43.0


