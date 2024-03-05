Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 924FB8714D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:38:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e+wP/vvU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e+wP/vvU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpjWC2yTFz3dWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e+wP/vvU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e+wP/vvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpjVR4kblz3cZD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 15:38:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YPd4GFiSShJn+ZRqzxhUGsjklTy+tvdVZ7YEdaffubE=;
	b=e+wP/vvUrt3TdJ84C4CNxOg2Z2KKrRrogTgc0PUm/8h/cM3n2mMYamnpvypdzar0kKw/Mz
	SZ0bj8DcOHvmdZyKd/GOHjiysZYhsmOZ113m3j/B9izFHAPFN62fSp2etxkX28QlECOOzo
	yOewe4UAdrcc26rOQCoa3G0JbHL3XVA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YPd4GFiSShJn+ZRqzxhUGsjklTy+tvdVZ7YEdaffubE=;
	b=e+wP/vvUrt3TdJ84C4CNxOg2Z2KKrRrogTgc0PUm/8h/cM3n2mMYamnpvypdzar0kKw/Mz
	SZ0bj8DcOHvmdZyKd/GOHjiysZYhsmOZ113m3j/B9izFHAPFN62fSp2etxkX28QlECOOzo
	yOewe4UAdrcc26rOQCoa3G0JbHL3XVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-ls-yFlXOMLKW33D-c7G0hg-1; Mon, 04 Mar 2024 23:37:59 -0500
X-MC-Unique: ls-yFlXOMLKW33D-c7G0hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDAC780F7EC;
	Tue,  5 Mar 2024 04:37:58 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E712C1F086;
	Tue,  5 Mar 2024 04:37:52 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] mm/treewide: Replace pXd_large() with pXd_leaf()
Date: Tue,  5 Mar 2024 12:37:40 +0800
Message-ID: <20240305043750.93762-1-peterx@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

[based on latest akpm/mm-unstable, commit b38c34939fe4]

v3:
- Added three patches
  - mm/treewide: Align up pXd_leaf() retval across archs
    Per request from Jason to further cleanup the retvals
  - mm/kasan: Use pXd_leaf() in shadow_mapped()
    Something I spot when saw a pXd_large() comment block, put it as a
    separate patch to cleanup.
  - mm/x86: Replace pgd_large() with pgd_leaf()
    Overlooked we even have pgd_leaf() defined for x86, added one more
    patch for it.  Now I'm pretty sure p?d_large() all gone for good.
- Collected R-bs / A-bs

v2: https://lore.kernel.org/r/20240229084258.599774-1-peterx@redhat.com
v1: https://lore.kernel.org/r/20240228085350.520953-1-peterx@redhat.com

These two APIs are mostly always the same.  It's confusing to have both of
them.  Merge them into one.  Here I used pXd_leaf() only because pXd_leaf()
is a global API which is always defined, while pXd_large() is not.

We have yet one more API that is similar which is pXd_huge(), but that's
even trickier, so let's do it step by step.

Some special cares are taken for ppc and x86, they're done as separate
cleanups first.  Only lightly tested on x86.

Please have a look, thanks.

Peter Xu (10):
  mm/ppc: Define pXd_large() with pXd_leaf()
  mm/ppc: Replace pXd_is_leaf() with pXd_leaf()
  mm/x86: Replace p4d_large() with p4d_leaf()
  mm/x86: Replace pgd_large() with pgd_leaf()
  mm/x86: Drop two unnecessary pud_leaf() definitions
  mm/kasan: Use pXd_leaf() in shadow_mapped()
  mm/treewide: Replace pmd_large() with pmd_leaf()
  mm/treewide: Replace pud_large() with pud_leaf()
  mm/treewide: Drop pXd_large()
  mm/treewide: Align up pXd_leaf() retval across archs

 arch/arm/include/asm/pgtable-2level.h        |  1 -
 arch/arm/include/asm/pgtable-3level.h        |  1 -
 arch/arm/mm/dump.c                           |  4 +--
 arch/loongarch/kvm/mmu.c                     |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 26 ++++--------------
 arch/powerpc/include/asm/pgtable.h           | 28 --------------------
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 ++++-----
 arch/powerpc/mm/book3s64/pgtable.c           |  4 +--
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 16 +++++------
 arch/powerpc/mm/pgtable.c                    |  6 ++---
 arch/powerpc/mm/pgtable_64.c                 |  8 +++---
 arch/powerpc/xmon/xmon.c                     |  6 ++---
 arch/riscv/include/asm/pgtable-64.h          |  2 +-
 arch/riscv/include/asm/pgtable.h             |  2 +-
 arch/s390/boot/vmem.c                        |  4 +--
 arch/s390/include/asm/pgtable.h              | 20 +++++++-------
 arch/s390/mm/gmap.c                          | 14 +++++-----
 arch/s390/mm/hugetlbpage.c                   |  6 ++---
 arch/s390/mm/pageattr.c                      |  4 +--
 arch/s390/mm/pgtable.c                       |  8 +++---
 arch/s390/mm/vmem.c                          | 12 ++++-----
 arch/sparc/include/asm/pgtable_64.h          |  8 +++---
 arch/sparc/mm/init_64.c                      |  6 ++---
 arch/x86/boot/compressed/ident_map_64.c      |  2 +-
 arch/x86/include/asm/pgtable.h               | 24 +++++++----------
 arch/x86/kvm/mmu/mmu.c                       |  6 ++---
 arch/x86/mm/fault.c                          | 16 +++++------
 arch/x86/mm/ident_map.c                      |  2 +-
 arch/x86/mm/init_32.c                        |  2 +-
 arch/x86/mm/init_64.c                        | 14 +++++-----
 arch/x86/mm/kasan_init_64.c                  |  4 +--
 arch/x86/mm/mem_encrypt_identity.c           |  6 ++---
 arch/x86/mm/pat/set_memory.c                 | 14 +++++-----
 arch/x86/mm/pgtable.c                        |  4 +--
 arch/x86/mm/pti.c                            | 10 +++----
 arch/x86/power/hibernate.c                   |  6 ++---
 arch/x86/xen/mmu_pv.c                        | 10 +++----
 drivers/misc/sgi-gru/grufault.c              |  2 +-
 include/asm-generic/pgtable-nopmd.h          |  1 -
 include/linux/pgtable.h                      |  8 +++---
 mm/kasan/shadow.c                            | 11 ++------
 41 files changed, 141 insertions(+), 201 deletions(-)

-- 
2.44.0

