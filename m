Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E624193D5A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 17:08:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XRacDgs/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lk6cstPj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVrjv6GlRz3dRK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 01:08:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XRacDgs/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lk6cstPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVrjB2wd2z3dHL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 01:07:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722006472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hcrSbRRNq3UgkpcRSzhVfFxj5WTgmNA01IUpGR6Hr34=;
	b=XRacDgs/Mzs2TRDlJQVyC6a336xwSil5aqS5yuXTP8IVRDDjK1CGK+fzRS2R9garMIlqId
	Ftt8/bEmY7kyYiLWHzzLMACB1LAHJe4oFhkYhHpbgkVeNl3BiHMrGx38tBiFL545r38ZM1
	Rg0QMMalGMXndwZxIiq5YWPQeaE2AdE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722006473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hcrSbRRNq3UgkpcRSzhVfFxj5WTgmNA01IUpGR6Hr34=;
	b=Lk6cstPjmM1DXWOsys3KBBDGHMJ4EYSWckPfXqTmUMYtltUFUrLZhFWCe4H+hOxRTfte23
	r/zmAQDi4xK58Z1EcsG7EjGqoj3nJQ1glgstqmRHL6Z5rci/m9tnyVU/hBDOEkMTu2PqyH
	R989LvV2Zs5g5dUYz0/Zk5+p+X8au48=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-uU9eNeBmOBmxsbHiNspYkQ-1; Fri,
 26 Jul 2024 11:07:47 -0400
X-MC-Unique: uU9eNeBmOBmxsbHiNspYkQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 396AC1955D4D;
	Fri, 26 Jul 2024 15:07:42 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.153])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AF9BB1955D45;
	Fri, 26 Jul 2024 15:07:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] mm: split PTE/PMD PT table Kconfig cleanups+clarifications
Date: Fri, 26 Jul 2024 17:07:25 +0200
Message-ID: <20240726150728.3159964-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, xen-devel@lists.xenproject.org, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>, Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is a follow up to the fixes:
	"[PATCH v1 0/2] mm/hugetlb: fix hugetlb vs. core-mm PT locking"

When working on the fixes, I wondered why 8xx is fine (-> never uses split
PT locks) and how PT locking even works properly with PMD page table
sharing (-> always requires split PMD PT locks).

Let's improve the split PT lock detection, make hugetlb properly depend
on it and make 8xx bail out if it would ever get enabled by accident.

As an alternative to patch #3 we could extend the Kconfig SPLIT_PTE_PTLOCKS
option from patch #2 -- but enforcing it closer to the code that actually
implements it feels a bit nicer for documentation purposes, and there
is no need to actually disable it because it should always be disabled
(!SMP).

Did a bunch of cross-compilations to make sure that split PTE/PMD
PT locks are still getting used where we would expect them.

[1] https://lkml.kernel.org/r/20240725183955.2268884-1-david@redhat.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Peter Xu <peterx@redhat.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>

David Hildenbrand (3):
  mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig
    options
  mm/hugetlb: enforce that PMD PT sharing has split PMD PT locks
  powerpc/8xx: document and enforce that split PT locks are not used

 arch/arm/mm/fault-armv.c      |  6 +++---
 arch/powerpc/mm/pgtable.c     |  6 ++++++
 arch/x86/xen/mmu_pv.c         |  7 ++++---
 fs/Kconfig                    |  4 ++++
 include/linux/hugetlb.h       |  5 ++---
 include/linux/mm.h            |  8 ++++----
 include/linux/mm_types.h      |  2 +-
 include/linux/mm_types_task.h |  3 ---
 kernel/fork.c                 |  4 ++--
 mm/Kconfig                    | 18 +++++++++++-------
 mm/hugetlb.c                  |  8 ++++----
 mm/memory.c                   |  2 +-
 12 files changed, 42 insertions(+), 31 deletions(-)

-- 
2.45.2

