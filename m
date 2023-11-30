Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345197FEE47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 12:53:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gHV+fgws;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOsjB0Qv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgvjT56S8z3cTr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 22:53:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gHV+fgws;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOsjB0Qv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgr2C44hlz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 20:08:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701335279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4nHD6xp8X2yJHS+fHE3T4M28AQPTuEx9q4DHnzUWjC0=;
	b=gHV+fgwsF1CFHkbDHZeY5WIwVrdKwjSyWkWiaAfoWVtdE87O4rFS8yipwxur3ZFnlxXe+J
	p2kWbsm9tQAkpFjcOMoWIPzq2cOFtsJimFa4QPqMn6HBOqigrNf3L3ClCjLxK8Cqcoewb3
	s5nlQTX9f+8P3TJDu+Ww8gDXdjtegPQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701335280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4nHD6xp8X2yJHS+fHE3T4M28AQPTuEx9q4DHnzUWjC0=;
	b=bOsjB0QvKbgaSyGaB/VF5UfTJmocUD1rMM5hbDUo4cc6oLIqq4puhR+rvGuuiM2x19SsXy
	v84e4JYIkMYDgJD+PTR0WRfqBNNYblZ7TzazzoeBegV1bDDVTXmHuPkw2BBovySASQJzr8
	bqU8jAtxt8x0x12S4KbuhaYKQVjzLcY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-4b-230RXNOKhzbCPlDrO7A-1; Thu, 30 Nov 2023 04:07:56 -0500
X-MC-Unique: 4b-230RXNOKhzbCPlDrO7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99EA2101A529;
	Thu, 30 Nov 2023 09:07:55 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 759FE1C060AE;
	Thu, 30 Nov 2023 09:07:55 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: Andrew Jones <andrew.jones@linux.dev>,
	kvmarm@lists.linux.dev
Subject: [kvm-unit-tests PATCH v1 00/18] arm/arm64: Rework cache maintenance at boot
Date: Thu, 30 Nov 2023 04:07:02 -0500
Message-Id: <20231130090722.2897974-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 30 Nov 2023 22:53:06 +1100
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, Eric Auger <eric.auger@redhat.com>, Nadav Amit <namit@vmware.com>, Alexandru Elisei <alexandru.elisei@arm.com>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I'm posting Alexandru's patch set[1] rebased on the latest branch with the
conflicts being resolved. No big changes compare to its original code.

As this version 1 of this series was posted one years ago, I would first let you
recall it, what's the intention of this series and what this series do. You can
view it by click the link[2] and view the cover-letter.

Since when writing the series[1], the efi support for arm64[3] hasn't been
merged into the kvm-unit-tests, but now the efi support for arm64 has been
merged. Directly rebase the series[1] onto the latest branch will break the efi
tests. This is mainly because the Patch #15 ("arm/arm64: Enable the MMU early")
moves the mmu_enable() out of the setup_mmu(), which causes the efi test will
not enable the mmu. So I do a small change in the efi_mem_init() which makes the
efi test also enable the MMU early, and make it works.

And another change should be noticed is in the Patch #17 ("arm/arm64: Perform
dcache maintenance"). In the efi_mem_init(), it will disable the mmu, and build
a new pagetable and re-enable the mmu, if the asm_mmu_disable clean and
invalidate the data caches for entire memory, we don't need to care the dcache
and after mmu disabled, we use the mmu_setup_early() to re-enable the mmu, which
takes care all the cache maintenance. But the situation changes since the Patch
#18 ("arm/arm64: Rework the cache maintenance in asm_mmu_disable") only clean
and invalidate the data caches for the stack memory area. So we need to clean
and invalidate the data caches manually before disable the mmu, I'm not
confident about current cache maintenance at the efi setup patch, so I ask for
your help to review it if it's right or not.

And I also drop one patch ("s390: Do not use the physical allocator") from[1]
since this cause s390 test to fail.

This series may include bug, so I really appreciate your review to improve this
series together.

You can get the code from:

$ git clone https://gitlab.com/shahuang/kvm-unit-tests.git \
	-b arm-arm64-rework-cache-maintenance-at-boot-v1

[1] https://gitlab.arm.com/linux-arm/kvm-unit-tests-ae/-/tree/arm-arm64-rework-cache-maintenance-at-boot-v2-wip2
[2] https://lore.kernel.org/all/20220809091558.14379-1-alexandru.elisei@arm.com/
[3] https://patchwork.kernel.org/project/kvm/cover/20230530160924.82158-1-nikos.nikoleris@arm.com/

Changelog:
----------
RFC->v1:
  - Gathered Reviewed-by tags.
  - Various changes to commit messages and comments to hopefully make the code
    easier to understand.
  - Patches #8 ("lib/alloc_phys: Expand documentation with usage and limitations")
    are new.
  - Folded patch "arm: page.h: Add missing libcflat.h include" into #17
    ("arm/arm64: Perform dcache maintenance at boot").
  - Reordered the series to group patches that touch aproximately the same code
    together - the patches that change the physical allocator are now first,
    followed come the patches that change how the secondaries are brought online.
  - Fixed several nasty bugs where the r4 register was being clobbered in the arm
    assembly.
  - Unmap the early UART address if the DTB address does not match the early
    address.
  - Added dcache maintenance when a page table is modified with the MMU disabled.
  - Moved the cache maintenance when disabling the MMU to be executed before the
    MMU is disabled.
  - Rebase it on lasted branch which efi support has been merged.
  - Make the efi test also enable MMU early.
  - Add cache maintenance on efi setup path especially before mmu_disable.

RFC: https://lore.kernel.org/all/20220809091558.14379-1-alexandru.elisei@arm.com/

Alexandru Elisei (18):
  Makefile: Define __ASSEMBLY__ for assembly files
  powerpc: Replace the physical allocator with the page allocator
  lib/alloc_phys: Initialize align_min
  lib/alloc_phys: Consolidate allocate functions into memalign_early()
  lib/alloc_phys: Remove locking
  lib/alloc_phys: Remove allocation accounting
  lib/alloc_phys: Add callback to perform cache maintenance
  lib/alloc_phys: Expand documentation with usage and limitations
  arm/arm64: Zero secondary CPUs' stack
  arm/arm64: Allocate secondaries' stack using the page allocator
  arm/arm64: assembler.h: Replace size with end address for
    dcache_by_line_op
  arm/arm64: Add C functions for doing cache maintenance
  arm/arm64: Configure secondaries' stack before enabling the MMU
  arm/arm64: Use pgd_alloc() to allocate mmu_idmap
  arm/arm64: Enable the MMU early
  arm/arm64: Map the UART when creating the translation tables
  arm/arm64: Perform dcache maintenance at boot
  arm/arm64: Rework the cache maintenance in asm_mmu_disable

 Makefile                   |   5 +-
 arm/Makefile.arm           |   4 +-
 arm/Makefile.arm64         |   4 +-
 arm/Makefile.common        |   6 +-
 arm/cstart.S               |  71 +++++++++++++++------
 arm/cstart64.S             |  76 +++++++++++++++++------
 lib/alloc_phys.c           | 122 ++++++++++++-------------------------
 lib/alloc_phys.h           |  28 ++++++---
 lib/arm/asm/assembler.h    |  15 ++---
 lib/arm/asm/cacheflush.h   |   1 +
 lib/arm/asm/mmu-api.h      |   1 +
 lib/arm/asm/mmu.h          |   6 --
 lib/arm/asm/page.h         |   2 +
 lib/arm/asm/pgtable.h      |  39 ++++++++++--
 lib/arm/asm/thread_info.h  |   3 +-
 lib/arm/cache.S            |  89 +++++++++++++++++++++++++++
 lib/arm/io.c               |  31 ++++++++++
 lib/arm/io.h               |   3 +
 lib/arm/mmu.c              |  37 ++++++++---
 lib/arm/processor.c        |   1 -
 lib/arm/setup.c            |  82 +++++++++++++++++++++----
 lib/arm/smp.c              |   5 ++
 lib/arm64/asm/assembler.h  |  11 ++--
 lib/arm64/asm/cacheflush.h |  37 +++++++++++
 lib/arm64/asm/mmu.h        |   5 --
 lib/arm64/asm/pgtable.h    |  50 +++++++++++++--
 lib/arm64/cache.S          |  85 ++++++++++++++++++++++++++
 lib/arm64/processor.c      |   1 -
 lib/devicetree.c           |   2 +-
 lib/powerpc/setup.c        |   9 ++-
 powerpc/Makefile.common    |   1 +
 powerpc/cstart64.S         |   1 -
 powerpc/spapr_hcall.c      |   5 +-
 33 files changed, 642 insertions(+), 196 deletions(-)
 create mode 100644 lib/arm/asm/cacheflush.h
 create mode 100644 lib/arm/cache.S
 create mode 100644 lib/arm64/asm/cacheflush.h
 create mode 100644 lib/arm64/cache.S

-- 
2.40.1

