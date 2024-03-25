Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFD88A59A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:01:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TO7mgnCp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LLnsVTvq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GN63wPSz3w7m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:01:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TO7mgnCp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LLnsVTvq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHm1NGPz3vgB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DL/tRS+4pUx9m3XgAdE8DYrulXqMo6B5z0clIVzdqIA=;
	b=TO7mgnCpwpyswvvF2CjCm/OxYMACvGUy5UDMhJ3VuPz79hREonO9FSBglTxqjd9gDLC4dS
	VuxWQQPsH9muZN1wli0+GkzIA8jn1rGez6zmFW+BgkP9jnAWQYxEOBJFUYiVMulb2KP2tC
	FrR4PAcu0xFX9WzvFMJH431mL8frH3A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711378640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DL/tRS+4pUx9m3XgAdE8DYrulXqMo6B5z0clIVzdqIA=;
	b=LLnsVTvq9ANRuR8/xMEG6bnLY7dTVtoxTgrVh56XSoIHq7B/dof4XTowfqhoVScjcLNLkU
	tnOQr1vUf8Euh+RLCcXJpz5vPAV3QeLvgDhOui5ihwXHRkFFMTxUQeZUfzVhcpzj6Nth2N
	PATKJaYsh0Hzoz+H+YZxpGcGtD7VEqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-8fUELVHUOWGLH-ZeoGwWYw-1; Mon, 25 Mar 2024 10:57:15 -0400
X-MC-Unique: 8fUELVHUOWGLH-ZeoGwWYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8914E800264;
	Mon, 25 Mar 2024 14:57:15 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15D883C20;
	Mon, 25 Mar 2024 14:57:10 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 0/6] mm/mm_init.c: refactor free_area_init_core()
Date: Mon, 25 Mar 2024 22:56:40 +0800
Message-ID: <20240325145646.1044760-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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
Cc: Baoquan He <bhe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In function free_area_init_core(), the code calculating
zone->managed_pages and the subtracting dma_reserve from DMA zone looks
very confusing.

From git history, the code calculating zone->managed_pages was for
zone->present_pages originally. The early rough assignment is for
optimize zone's pcp and water mark setting. Later, managed_pages was
introduced into zone to represent the number of managed pages by buddy.
Now, zone->managed_pages is zeroed out and reset in mem_init() when
calling memblock_free_all(). zone's pcp and wmark setting relying on
actual zone->managed_pages are done later than mem_init() invocation.
So we don't need rush to early calculate and set zone->managed_pages,
just set it as zone->present_pages, will adjust it in mem_init().

And also add a new function calc_nr_kernel_pages() to count up free but
not reserved pages in memblock, then assign it to nr_all_pages and
nr_kernel_pages after memmap pages are allocated.

Changelog:
----------
v1->v2:
=======
These are all suggested by Mike, thanks to him.
- Swap the order of patch 1 and 2 in v1 to describe code change better,
  Mike suggested this.
- Change to initializ zone->managed_pages as 0 in free_area_init_core()
  as there isn't any page added into buddy system. And also improve the
  ambiguous description in log. These are all in patch 4.

Baoquan He (6):
  x86: remove unneeded memblock_find_dma_reserve()
  mm/mm_init.c: remove the useless dma_reserve
  mm/mm_init.c: add new function calc_nr_all_pages()
  mm/mm_init.c: remove meaningless calculation of zone->managed_pages in
    free_area_init_core()
  mm/mm_init.c: remove unneeded calc_memmap_size()
  mm/mm_init.c: remove arch_reserved_kernel_pages()

 arch/powerpc/include/asm/mmu.h |   4 --
 arch/powerpc/kernel/fadump.c   |   5 --
 arch/x86/include/asm/pgtable.h |   1 -
 arch/x86/kernel/setup.c        |   2 -
 arch/x86/mm/init.c             |  47 -------------
 include/linux/mm.h             |   4 --
 mm/mm_init.c                   | 125 ++++++++-------------------------
 7 files changed, 29 insertions(+), 159 deletions(-)

-- 
2.41.0

