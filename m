Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64AF86C3F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:43:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WmNXy6ZD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JhC8LPR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TllBG2SV8z3vYh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:43:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WmNXy6ZD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JhC8LPR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tll9Y4vrgz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:43:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V2zDOtq/zMs9EWQrhRs/fjSpny2ZJnGnEwNBTlsPnCA=;
	b=WmNXy6ZDPXu8D/RABUNI9IGfO9j/kOML47lvl/wZ4dvsYGlJeR06ILbhRJ+APiB5zI5K8s
	qloKONgvlu0CSMz9KhgANcUC7Suf2BPAMv57QbjgucXNfi0EABCmHUpg8BXj5QJI3lqgxE
	y2VceO94UeEfSmLsGSl6GdUP5HOQMAU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V2zDOtq/zMs9EWQrhRs/fjSpny2ZJnGnEwNBTlsPnCA=;
	b=JhC8LPR+GKSWkC0fWV6IHEDvao89+I6nZhkAcbtZCYrtktv1G8ObxIr/D1DKwiQKrZ/3pG
	x/VFxzvfSGoOyDQDzcd+FdxMjvZYxDPV3bcr6OQ8JGnt9SkA8NFMDeFemyiQecAEoJl/x/
	FvqrBm1aW78w1W2ZJ8vwPxlnmX8yBkA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-WTxOHKzPMra3bRoOtE4B5g-1; Thu,
 29 Feb 2024 03:43:07 -0500
X-MC-Unique: WTxOHKzPMra3bRoOtE4B5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A97DD2932483;
	Thu, 29 Feb 2024 08:43:06 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4B028D;
	Thu, 29 Feb 2024 08:43:00 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] mm/treewide: Replace pXd_large() with pXd_leaf()
Date: Thu, 29 Feb 2024 16:42:51 +0800
Message-ID: <20240229084258.599774-1-peterx@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

[based on latest akpm/mm-unstable, commit 1274e7646240]

v2:
- Added patch "mm/ppc: Replace pXd_is_leaf() with pXd_leaf()" [Christophe]
- Added patch "mm/x86: Drop two unnecessary pud_leaf() definitions" [syzbot]
- Touched up two more comments which also referenced pmd_large()

These two APIs are mostly always the same.  It's confusing to have both of
them.  Merge them into one.  Here I used pXd_leaf() only because pXd_leaf()
is a global API which is always defined, while pXd_large() is not.

We have yet one more API that is similar which is pXd_huge(), but that's
even trickier, so let's do it step by step.

Some special cares are taken for ppc and x86, they're done as separate
cleanups first.  Only lightly tested on x86.

Please have a look, thanks.

Peter Xu (7):
  mm/ppc: Define pXd_large() with pXd_leaf()
  mm/ppc: Replace pXd_is_leaf() with pXd_leaf()
  mm/x86: Replace p4d_large() with p4d_leaf()
  mm/x86: Drop two unnecessary pud_leaf() definitions
  mm/treewide: Replace pmd_large() with pmd_leaf()
  mm/treewide: Replace pud_large() with pud_leaf()
  mm/treewide: Drop pXd_large()

 arch/arm/include/asm/pgtable-2level.h        |  1 -
 arch/arm/include/asm/pgtable-3level.h        |  1 -
 arch/arm/mm/dump.c                           |  4 +--
 arch/powerpc/include/asm/book3s/64/pgtable.h | 26 ++++--------------
 arch/powerpc/include/asm/pgtable.h           | 28 --------------------
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 ++++-----
 arch/powerpc/mm/book3s64/pgtable.c           |  4 +--
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 16 +++++------
 arch/powerpc/mm/pgtable.c                    |  6 ++---
 arch/powerpc/mm/pgtable_64.c                 |  8 +++---
 arch/powerpc/xmon/xmon.c                     |  6 ++---
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
 arch/x86/include/asm/pgtable.h               | 20 +++++---------
 arch/x86/kvm/mmu/mmu.c                       |  4 +--
 arch/x86/mm/fault.c                          | 16 +++++------
 arch/x86/mm/ident_map.c                      |  2 +-
 arch/x86/mm/init_32.c                        |  2 +-
 arch/x86/mm/init_64.c                        | 14 +++++-----
 arch/x86/mm/kasan_init_64.c                  |  4 +--
 arch/x86/mm/mem_encrypt_identity.c           |  6 ++---
 arch/x86/mm/pat/set_memory.c                 | 14 +++++-----
 arch/x86/mm/pgtable.c                        |  4 +--
 arch/x86/mm/pti.c                            |  8 +++---
 arch/x86/power/hibernate.c                   |  6 ++---
 arch/x86/xen/mmu_pv.c                        | 10 +++----
 drivers/misc/sgi-gru/grufault.c              |  2 +-
 include/asm-generic/pgtable-nopmd.h          |  1 -
 36 files changed, 128 insertions(+), 181 deletions(-)

-- 
2.43.0

