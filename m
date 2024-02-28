Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E18CF86AA81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 09:54:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4AFaMl6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4AFaMl6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl7TV3DwQz3dWK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 19:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4AFaMl6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4AFaMl6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl7Sh17zwz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:54:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709110444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4bhVktrS6dMSA/g0STyv8QBeTwQNCemSRg5EzlavLyM=;
	b=S4AFaMl6PPv7xZ2auviHWL2aHn/HDG8lU3puBJVif3gI6H8B0roDc8iAk9zukOODjEYtvo
	uNKTVgqhZD+cGl0X2x3seTv1drM3WFAax1rfxXE6RL/hlDeQTTtyG+LOldC6MIjCDXehGW
	ZkIHlncCpM4pQ05zQNI73DdG0EEZZfA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709110444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4bhVktrS6dMSA/g0STyv8QBeTwQNCemSRg5EzlavLyM=;
	b=S4AFaMl6PPv7xZ2auviHWL2aHn/HDG8lU3puBJVif3gI6H8B0roDc8iAk9zukOODjEYtvo
	uNKTVgqhZD+cGl0X2x3seTv1drM3WFAax1rfxXE6RL/hlDeQTTtyG+LOldC6MIjCDXehGW
	ZkIHlncCpM4pQ05zQNI73DdG0EEZZfA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-_q4xEYi-M2ObYOFyZZeH3A-1; Wed,
 28 Feb 2024 03:53:59 -0500
X-MC-Unique: _q4xEYi-M2ObYOFyZZeH3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A3691C0CCB4;
	Wed, 28 Feb 2024 08:53:58 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 409942022AAA;
	Wed, 28 Feb 2024 08:53:52 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] mm/treewide: Replace pXd_large() with pXd_leaf()
Date: Wed, 28 Feb 2024 16:53:45 +0800
Message-ID: <20240228085350.520953-1-peterx@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

These two APIs are mostly always the same.  It's confusing to have both of
them.  Merge them into one.  Here I used pXd_leaf() only because pXd_leaf()
is a global API which is always defined, while pXd_large() is not.

We have yet one more API that is similar which is pXd_huge(), but that's
even trickier, so let's do it step by step.

Some cautions are needed on either x86 or ppc: x86 is currently the only
user of p4d_large(), while ppc used to define pXd_large() only with THP,
while it is not the case for pXd_leaf().  For the rest archs, afaict
they're 100% identical.

Only lightly tested on x86.

Please have a look, thanks.

Peter Xu (5):
  mm/ppc: Define pXd_large() with pXd_leaf()
  mm/x86: Replace p4d_large() with p4d_leaf()
  mm/treewide: Replace pmd_large() with pmd_leaf()
  mm/treewide: Replace pud_large() with pud_leaf()
  mm/treewide: Drop pXd_large()

 arch/arm/include/asm/pgtable-2level.h        |  1 -
 arch/arm/include/asm/pgtable-3level.h        |  1 -
 arch/arm/mm/dump.c                           |  4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h | 14 --------------
 arch/powerpc/include/asm/pgtable.h           |  4 ----
 arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  2 +-
 arch/powerpc/mm/pgtable_64.c                 |  2 +-
 arch/s390/boot/vmem.c                        |  4 ++--
 arch/s390/include/asm/pgtable.h              | 20 ++++++++++----------
 arch/s390/mm/gmap.c                          | 14 +++++++-------
 arch/s390/mm/hugetlbpage.c                   |  6 +++---
 arch/s390/mm/pageattr.c                      |  4 ++--
 arch/s390/mm/pgtable.c                       |  8 ++++----
 arch/s390/mm/vmem.c                          | 12 ++++++------
 arch/sparc/include/asm/pgtable_64.h          |  8 ++++----
 arch/sparc/mm/init_64.c                      |  6 +++---
 arch/x86/boot/compressed/ident_map_64.c      |  2 +-
 arch/x86/include/asm/pgtable.h               | 15 +++++++--------
 arch/x86/kvm/mmu/mmu.c                       |  4 ++--
 arch/x86/mm/fault.c                          | 16 ++++++++--------
 arch/x86/mm/ident_map.c                      |  2 +-
 arch/x86/mm/init_32.c                        |  2 +-
 arch/x86/mm/init_64.c                        | 14 +++++++-------
 arch/x86/mm/kasan_init_64.c                  |  4 ++--
 arch/x86/mm/mem_encrypt_identity.c           |  6 +++---
 arch/x86/mm/pat/set_memory.c                 | 14 +++++++-------
 arch/x86/mm/pgtable.c                        |  4 ++--
 arch/x86/mm/pti.c                            |  8 ++++----
 arch/x86/power/hibernate.c                   |  6 +++---
 arch/x86/xen/mmu_pv.c                        | 10 +++++-----
 drivers/misc/sgi-gru/grufault.c              |  2 +-
 32 files changed, 101 insertions(+), 122 deletions(-)

-- 
2.43.0

