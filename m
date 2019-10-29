Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8FAE7F29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 05:23:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472JNl4VX7zF0dl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 15:23:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="kjSFsu5l"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472JLJ0FHlzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 15:21:09 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id d13so7525610pfq.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 21:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQ4pMzGN2GdDuONqdL7jGr9z3ckVwTP2I22ymxPUf70=;
 b=kjSFsu5lfogxvrqtja7CdREfAAJGFvDZhN5x/U9HPImneeDVXbXL3+UXKvS/p9hLF8
 qOq64dVqVl0+oZE+pEioENvIgZhVgt5IwHKz2kGiGcoGsETAe/Q75KpYNo6B9UMwX+me
 7fkD1R+k2EDmZaP0QuAB4yrDjLVhcIT/8wiEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQ4pMzGN2GdDuONqdL7jGr9z3ckVwTP2I22ymxPUf70=;
 b=Ywaf4I4RlspSTPBLhLBLvyMe1rDnDSlOEMNa0bMMxnzBydg23XQX7iVc3rOKe478sI
 bh2nxwRqDYNjR7XJEI4d9wQFmuMOPez37fN/q7OGH4UkQIyAVDW99gbzMpc/Dtf7qFoh
 wIQuYm/cZYoifTHDW7QyCm1XJOPEEIY/wF397G5KfHJujA8E6gXmeaYAs1QvJrtE0zOG
 pXcWKe59JsBUOAmNltuYqetmwktopYZCupE2QJFc4Ox88BsP3tNCBQBzN+eqN1HYn7oL
 c9Q1Z+GHG4VWEkrFKSDmTiA0GqKfJKAMD1BfEVoTUm2gj1ICXINoBAjMFjN+akR8DS5h
 /D5w==
X-Gm-Message-State: APjAAAUaonzD24yJUkVMY7Kb/gl91UFV/Rg83PeC+5HxGj224mkzzYkr
 F5amJvQb2g7R/DEg6aCy3gDBPQ==
X-Google-Smtp-Source: APXvYqyBpRaSgYBzIdz3dtaj3H2tdNpX20my5AQ2b8q9icz+RK1eMt6UEIZ/h0E1Rd0JstGCqWa+LA==
X-Received: by 2002:a63:311:: with SMTP id 17mr24417658pgd.327.1572322866102; 
 Mon, 28 Oct 2019 21:21:06 -0700 (PDT)
Received: from localhost ([2001:44b8:802:1120:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id c1sm1013409pjc.23.2019.10.28.21.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 21:21:05 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v10 0/5] kasan: support backing vmalloc space with real shadow
 memory
Date: Tue, 29 Oct 2019 15:20:54 +1100
Message-Id: <20191029042059.28541-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, vmalloc space is backed by the early shadow page. This
means that kasan is incompatible with VMAP_STACK.

This series provides a mechanism to back vmalloc space with real,
dynamically allocated memory. I have only wired up x86, because that's
the only currently supported arch I can work with easily, but it's
very easy to wire up other architectures, and it appears that there is
some work-in-progress code to do this on arm64 and s390.

This has been discussed before in the context of VMAP_STACK:
 - https://bugzilla.kernel.org/show_bug.cgi?id=202009
 - https://lkml.org/lkml/2018/7/22/198
 - https://lkml.org/lkml/2019/7/19/822

In terms of implementation details:

Most mappings in vmalloc space are small, requiring less than a full
page of shadow space. Allocating a full shadow page per mapping would
therefore be wasteful. Furthermore, to ensure that different mappings
use different shadow pages, mappings would have to be aligned to
KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.

Instead, share backing space across multiple mappings. Allocate a
backing page when a mapping in vmalloc space uses a particular page of
the shadow region. This page can be shared by other vmalloc mappings
later on.

We hook in to the vmap infrastructure to lazily clean up unused shadow
memory.

Daniel Axtens (5):
  kasan: support backing vmalloc space with real shadow memory
  kasan: add test for vmalloc
  fork: support VMAP_STACK with KASAN_VMALLOC
  x86/kasan: support KASAN_VMALLOC
  kasan debug: track pages allocated for vmalloc shadow

 Documentation/dev-tools/kasan.rst |  63 ++++++++
 arch/Kconfig                      |   9 +-
 arch/x86/Kconfig                  |   1 +
 arch/x86/mm/kasan_init_64.c       |  60 +++++++
 include/linux/kasan.h             |  31 ++++
 include/linux/moduleloader.h      |   2 +-
 include/linux/vmalloc.h           |  12 ++
 kernel/fork.c                     |   4 +
 lib/Kconfig.kasan                 |  16 ++
 lib/test_kasan.c                  |  26 +++
 mm/kasan/common.c                 | 254 ++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |   3 +
 mm/kasan/kasan.h                  |   1 +
 mm/vmalloc.c                      |  53 ++++++-
 14 files changed, 522 insertions(+), 13 deletions(-)

-- 
2.20.1

