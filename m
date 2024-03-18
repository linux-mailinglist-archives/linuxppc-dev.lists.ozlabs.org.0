Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9087EACC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:22:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NhwipeGv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NhwipeGv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyxrr01lzz30Dg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:22:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NhwipeGv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NhwipeGv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyxr54mmQz307y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:21:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F5ye388VWoErT8xKd/JXdRVRXGFtTvAxoGWVnY3cKSY=;
	b=NhwipeGvrm54kiBMjob5kJxMv5bDvidUCd6ySMnKjB0BZagGY7ni2d5J06ypc4A672hju1
	eQ/VaWwRIdfTtoW0mgJfQf1n7x2YL9/nVb3luyfI4crQsV19H31dzkqwSJSPJoOLOvpfcB
	vYPlMOiaXaLb4LL7pAk6MU+6h7SN7xc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710771713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F5ye388VWoErT8xKd/JXdRVRXGFtTvAxoGWVnY3cKSY=;
	b=NhwipeGvrm54kiBMjob5kJxMv5bDvidUCd6ySMnKjB0BZagGY7ni2d5J06ypc4A672hju1
	eQ/VaWwRIdfTtoW0mgJfQf1n7x2YL9/nVb3luyfI4crQsV19H31dzkqwSJSPJoOLOvpfcB
	vYPlMOiaXaLb4LL7pAk6MU+6h7SN7xc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-wJFmYP1ANHGgSGjgt3Fcnw-1; Mon,
 18 Mar 2024 10:21:49 -0400
X-MC-Unique: wJFmYP1ANHGgSGjgt3Fcnw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C8F3C0F180;
	Mon, 18 Mar 2024 14:21:49 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C88FE492BD0;
	Mon, 18 Mar 2024 14:21:45 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: [PATCH 0/6] mm/mm_init.c: refactor free_area_init_core()
Date: Mon, 18 Mar 2024 22:21:32 +0800
Message-ID: <20240318142138.783350-1-bhe@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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


Baoquan He (6):
  mm/mm_init.c: remove the useless dma_reserve
  x86: remove unneeded memblock_find_dma_reserve()
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
 mm/mm_init.c                   | 117 +++++++++------------------------
 7 files changed, 30 insertions(+), 150 deletions(-)

-- 
2.41.0

