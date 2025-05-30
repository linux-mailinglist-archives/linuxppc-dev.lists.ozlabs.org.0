Return-Path: <linuxppc-dev+bounces-9033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA0AC9104
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 16:05:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84l875PGz2xHv;
	Sat, 31 May 2025 00:05:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748613940;
	cv=none; b=NansVN0QFfXgUd0LVVnyPgyLADXNIZs1or8XnoFB6au6SVq8i4Srm7dj6gRB0ZYQ8fV8rxS7kHC6pVoEGQT+2e1onyFisQAnVSurRQFYztH7uKQHDqlX3Nh5m9rzm8QSBop465Wv8SxvErT7l4tcaLMoWB+icnDpwigpQZ6/g1hAP5iLF0aZOmeLfbqIVkicghpGGXBJLCpMueuRgqPorZgm5x1t6PAA/MmXOEQhihke8nw6KAD6X5oMmZPsOqxd7iX5Zqh4PHgHSAb1G7r8W81jV4ncuTs3JSVql+B0/3W0iNdQD4YXXXFbKb8Hk796GSwt7iela7LB5pRnvk55Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748613940; c=relaxed/relaxed;
	bh=m/1XyZhkINgjqjL6rNsMcBMnKJ0gfD5AmRtZg+RBhuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmVX8vc/LZxi/j+Z7iJAHYsHTfHmZ8jUju6yhELr32ytRH35t6/BiEvkx2n9VpUXAioXWr1TqgVa9g7KcE83USqUn09aNkuxY5F8mmSxuQiOLrso1hMIMC+oFPODZzobw7di/oI94dHbzLjzBEIZL4IoKQ3ECehnZh0SwpHE8fxa8j9L2oVOrWaX8jZvdSD6gdq8ypZop4UtrPY/f1tyLf0V76DpwQwXeb4AzPOLa3mAaibx46pCiRLKZiO9QmnjrJO84YOp0JN79/tHTVBhq94V4lupIB2vTzWHLbBMUYurIhOFyMFIbVnZseP93NsFi+Z3MHIVdJi5Gj8e56+Dlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84l75vnWz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 00:05:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82C55169C;
	Fri, 30 May 2025 07:04:48 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E5D3F673;
	Fri, 30 May 2025 07:04:59 -0700 (PDT)
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
Subject: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Date: Fri, 30 May 2025 15:04:38 +0100
Message-ID: <20250530140446.2387131-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
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

Hi All,

I recently added support for lazy mmu mode on arm64. The series is now in
Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
found some ugly corners (unexpected nesting). I was able to fix those issues by
making the arm64 implementation more permissive (like the other arches). But
this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
lazy mmu mode never nests, and more importantly, that code never makes pgtable
modifications expecting them to be immediate, not knowing that it's actually in
lazy mmu mode so the changes get deferred.

The first 2 patches are unrelated, very obvious bug fixes. They don't affect
arm64 because arm64 only uses lazy mmu for kernel mappings. But I noticed them
during code review and think they should be fixed.

The next 3 patches are aimed at solving the nesting issue.

And the final patch is reverting the "permissive" fix I did for arm64, which is
no longer needed after the previous 3 patches.

I've labelled this RFC for now because it depends on the arm64 lazy mmu patches
in Linus's master, so it won't apply to mm-unstable. But I'm keen to get review
and siince I'm touching various arches and modifying some core mm stuff, I
thought that might take a while so thought I'd beat the rush and get a first
version out early.

I've build-tested all the affected arches. And I've run mm selftests for the
arm64 build, with no issues (with DEBUG_PAGEALLOC and KFENCE enabled).

Applies against Linus's master branch (f66bc387efbe).

Thanks,
Ryan


Ryan Roberts (6):
  fs/proc/task_mmu: Fix pte update and tlb maintenance ordering in
    pagemap_scan_pmd_entry()
  mm: Fix pte update and tlb maintenance ordering in
    migrate_vma_collect_pmd()
  mm: Avoid calling page allocator from apply_to_page_range()
  mm: Introduce arch_in_lazy_mmu_mode()
  mm: Avoid calling page allocator while in lazy mmu mode
  Revert "arm64/mm: Permit lazy_mmu_mode to be nested"

 arch/arm64/include/asm/pgtable.h              | 22 ++++----
 .../include/asm/book3s/64/tlbflush-hash.h     | 15 ++++++
 arch/sparc/include/asm/tlbflush_64.h          |  1 +
 arch/sparc/mm/tlb.c                           | 12 +++++
 arch/x86/include/asm/paravirt.h               |  5 ++
 arch/x86/include/asm/paravirt_types.h         |  1 +
 arch/x86/kernel/paravirt.c                    |  6 +++
 arch/x86/xen/mmu_pv.c                         |  6 +++
 fs/proc/task_mmu.c                            |  3 +-
 include/asm-generic/tlb.h                     |  2 +
 include/linux/mm.h                            |  6 +++
 include/linux/pgtable.h                       |  1 +
 kernel/bpf/arena.c                            |  6 +--
 mm/kasan/shadow.c                             |  2 +-
 mm/memory.c                                   | 54 ++++++++++++++-----
 mm/migrate_device.c                           |  3 +-
 mm/mmu_gather.c                               | 15 ++++++
 17 files changed, 128 insertions(+), 32 deletions(-)

--
2.43.0


