Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082A895412
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 14:57:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RtiiEDox;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RtiiEDox;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V87FY02NZz3vbZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 23:57:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RtiiEDox;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RtiiEDox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V87Cy2Sx5z3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 23:55:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mcxjCOywRtLdiEcHC2fGLUZpoWNnKmQE4MNGQaUK4kg=;
	b=RtiiEDox/NKwD55cu4iJUw6XBfJQksFyyAyMiyZ2jPEEpJq7qYlfGg0U+4hh+Sosu2kZ2X
	Oa5yS30az1FGDY31hSMyggZp+ntRWrl4zWuvE/hZwESDTM0hcqIwzSIdw9rg1gYMMOJas7
	PJUcw3IQL8N6xOhio87dKBHxoisl0GI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mcxjCOywRtLdiEcHC2fGLUZpoWNnKmQE4MNGQaUK4kg=;
	b=RtiiEDox/NKwD55cu4iJUw6XBfJQksFyyAyMiyZ2jPEEpJq7qYlfGg0U+4hh+Sosu2kZ2X
	Oa5yS30az1FGDY31hSMyggZp+ntRWrl4zWuvE/hZwESDTM0hcqIwzSIdw9rg1gYMMOJas7
	PJUcw3IQL8N6xOhio87dKBHxoisl0GI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-jrB5cRd5NSepbRcVx10PBw-1; Tue, 02 Apr 2024 08:55:43 -0400
X-MC-Unique: jrB5cRd5NSepbRcVx10PBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57030881F00;
	Tue,  2 Apr 2024 12:55:42 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.247])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3917D3C21;
	Tue,  2 Apr 2024 12:55:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] mm/gup: consistently call it GUP-fast
Date: Tue,  2 Apr 2024 14:55:13 +0200
Message-ID: <20240402125516.223131-1-david@redhat.com>
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some cleanups around function names, comments and the config option of
"GUP-fast" -- GUP without "lock" safety belts on.

With this cleanup it's easy to judge which functions are GUP-fast specific.
We now consistently call it "GUP-fast", avoiding mixing it with "fast GUP",
"lockless", or simply "gup" (which I always considered confusing in the
ode).

So the magic now happens in functions that contain "gup_fast", whereby
gup_fast() is the entry point into that magic. Comments consistently
reference either "GUP-fast" or "gup_fast()".

Based on mm-unstable from today. I won't CC arch maintainers, but only
arch mailing lists, to reduce noise.

Tested on x86_64, cross compiled on a bunch of archs.

RFC -> v1:
* Rebased on latest mm/mm-unstable
* "mm/gup: consistently name GUP-fast functions"
 -> "internal_get_user_pages_fast()" -> "gup_fast_fallback()"
 -> "undo_dev_pagemap()" -> "gup_fast_undo_dev_pagemap()"
 -> Fixup a bunch more comments
* "mm/treewide: rename CONFIG_HAVE_FAST_GUP to CONFIG_HAVE_GUP_FAST"
 -> Take care of RISCV

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport (IBM) <rppt@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-perf-users@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org

David Hildenbrand (3):
  mm/gup: consistently name GUP-fast functions
  mm/treewide: rename CONFIG_HAVE_FAST_GUP to CONFIG_HAVE_GUP_FAST
  mm: use "GUP-fast" instead "fast GUP" in remaining comments

 arch/arm/Kconfig       |   2 +-
 arch/arm64/Kconfig     |   2 +-
 arch/loongarch/Kconfig |   2 +-
 arch/mips/Kconfig      |   2 +-
 arch/powerpc/Kconfig   |   2 +-
 arch/riscv/Kconfig     |   2 +-
 arch/s390/Kconfig      |   2 +-
 arch/sh/Kconfig        |   2 +-
 arch/x86/Kconfig       |   2 +-
 include/linux/rmap.h   |   8 +-
 kernel/events/core.c   |   4 +-
 mm/Kconfig             |   2 +-
 mm/filemap.c           |   2 +-
 mm/gup.c               | 215 +++++++++++++++++++++--------------------
 mm/internal.h          |   2 +-
 mm/khugepaged.c        |   2 +-
 16 files changed, 127 insertions(+), 126 deletions(-)

-- 
2.44.0

