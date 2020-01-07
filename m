Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF71334D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 22:31:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sltH3SCWzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 08:31:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=207.54.116.67; helo=ale.deltatee.com;
 envelope-from=gunthorp@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deltatee.com
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47slBn443FzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 08:00:17 +1100 (AEDT)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1iovxO-0007vp-Dz; Tue, 07 Jan 2020 14:00:08 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1iovxI-0001z2-AY; Tue, 07 Jan 2020 14:00:00 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  7 Jan 2020 13:59:51 -0700
Message-Id: <20200107205959.7575-1-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, dan.j.williams@intel.com, akpm@linux-foundation.org,
 hch@lst.de, catalin.marinas@arm.com, benh@kernel.crashing.org,
 tglx@linutronix.de, david@redhat.com, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, mhocko@kernel.org, will@kernel.org,
 luto@kernel.org, peterz@infradead.org, ebadger@gigaio.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE,MYRULES_NO_TEXT autolearn=ham autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 0/8] Allow setting caching mode in arch_add_memory() for
 P2PDMA
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Eric Badger <ebadger@gigaio.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

The main feedback from v1 was around the interface for arch_add_memory().
Per Dan's suggestions I've renamed the mhp_restrictions structure to
mhp_modifiers and put a pgprot_t field in that structure. I've also
included patch to drop the unused flags field.

Thanks,

Logan

--

Changes in v2:
 * Rebased onto v5.5-rc5
 * Renamed mhp_restrictions to mhp_modifiers and added the pgprot field
   to that structure instead of using an argument for
   arch_add_memory().
 * Add patch to drop the unused flags field in mhp_restrictions

A git branch is available here:

https://github.com/sbates130272/linux-p2pmem remap_pages_cache_v2

--

Currently, the page tables created using memremap_pages() are always
created with the PAGE_KERNEL cacheing mode. However, the P2PDMA code
is creating pages for PCI BAR memory which should never be accessed
through the cache and instead use either WC or UC. This still works in
most cases, on x86, because the MTRR registers typically override the
caching settings in the page tables for all of the IO memory to be
UC-. However, this tends not to work so well on other arches or
some rare x86 machines that have firmware which does not setup the
MTRR registers in this way.

Instead of this, this series proposes a change to arch_add_memory()
to take the pgprot required by the mapping which allows us to
explicitly set pagetable entries for P2PDMA memory to WC.

This changes is pretty routine for most of the arches: x86_64, s390, arm64
and powerpc simply need to thread the pgprot through to where the page
tables are setup. x86_32 unfortunately sets up the page tables at boot so
must use _set_memory_prot() to change their caching mode. ia64 and sh
don't appear to have an easy way to change the page tables so, for now
at least, we just return -EINVAL on such mappings and thus they will
not support P2PDMA memory until the work for this is done.

--

Logan Gunthorpe (8):
  mm/memory_hotplug: Drop the flags field from struct mhp_restrictions
  mm/memory_hotplug: Rename mhp_restrictions to mhp_modifiers
  x86/mm: Thread pgprot_t through init_memory_mapping()
  x86/mm: Introduce _set_memory_prot()
  powerpc/mm: Thread pgprot_t through create_section_mapping()
  s390/mm: Thread pgprot_t through vmem_add_mapping()
  mm/memory_hotplug: Add pgprot_t to mhp_modifiers
  mm/memremap: Set caching mode for PCI P2PDMA memory to WC

 arch/arm64/mm/mmu.c                        |  7 ++--
 arch/ia64/mm/init.c                        |  6 +++-
 arch/powerpc/include/asm/book3s/64/hash.h  |  3 +-
 arch/powerpc/include/asm/book3s/64/radix.h |  3 +-
 arch/powerpc/include/asm/sparsemem.h       |  3 +-
 arch/powerpc/mm/book3s64/hash_utils.c      |  5 +--
 arch/powerpc/mm/book3s64/pgtable.c         |  7 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 18 ++++++----
 arch/powerpc/mm/mem.c                      | 10 +++---
 arch/s390/include/asm/pgtable.h            |  3 +-
 arch/s390/mm/extmem.c                      |  3 +-
 arch/s390/mm/init.c                        |  8 ++---
 arch/s390/mm/vmem.c                        | 10 +++---
 arch/sh/mm/init.c                          |  7 ++--
 arch/x86/include/asm/page_types.h          |  3 --
 arch/x86/include/asm/pgtable.h             |  3 ++
 arch/x86/include/asm/set_memory.h          |  1 +
 arch/x86/kernel/amd_gart_64.c              |  3 +-
 arch/x86/mm/init.c                         |  9 ++---
 arch/x86/mm/init_32.c                      | 12 +++++--
 arch/x86/mm/init_64.c                      | 40 ++++++++++++----------
 arch/x86/mm/mm_internal.h                  |  3 +-
 arch/x86/mm/pageattr.c                     |  7 ++++
 arch/x86/platform/efi/efi_64.c             |  3 +-
 include/linux/memory_hotplug.h             | 16 ++++-----
 mm/memory_hotplug.c                        |  8 ++---
 mm/memremap.c                              | 17 +++++----
 27 files changed, 132 insertions(+), 86 deletions(-)

--
2.20.1
