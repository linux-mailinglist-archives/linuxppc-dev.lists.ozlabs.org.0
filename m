Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC375DA321
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:28:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ts3z0J2TzDqnK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 12:27:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="LV/Egggh"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ts0t1n9CzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 12:25:15 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id c3so297983plo.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/v+BCQB3jIKYbebgETHehC+eMOtsuCBonYyqEVSANPw=;
 b=LV/EggghB5YYxtKuJ/LvnxysgWk5pxfpi5U0lFTwP5L4jb+dLK1jFqZF9wtgl9cEP/
 09jKJ6qhDu5PS1CdAAeVPY3mDM0e6Dz79kDzbQ3hf4bh5cTnYDQqX4tkAmehjs+h6iTi
 3HKPUk8ednFCcNziNFhBeAks1FZirphABNHf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/v+BCQB3jIKYbebgETHehC+eMOtsuCBonYyqEVSANPw=;
 b=OgGBhxbab7yqt0CswUNLAch1oiCFZlLHANBx+sMXvgwi5sZDzwQ1ZjO+McGlMtPJp+
 +Xm/CR8OWZxS+74524sxKmwa8PBeRlKkBwIGGFq7YisPecKFXwtRGaxlM39mpNoyrwNs
 2nf08XIfk5dmV9OOsMq7R6d5d/DUGZH8bhF7eRE3ImjqH+sbfb7kd76r2wEX57TD5Oio
 XJLcXo2/QOYwo2sVnHwISdGCys0E6WpDuTlRWHXzMvKc9WrnfbWh3BAhHHb9WVBij4O4
 LNTaHTkstVsg+JzPWUofPWEFHN97po9ONcANgiWz4TnT2Wq0QOMv4A49e+Y9ReI6t32Q
 gsbw==
X-Gm-Message-State: APjAAAUQH+w9qVw07F7jesdhEfLbQvUtHlAszrzJ4G/5LqOkNPY1altc
 HQhjtBzPebQgDTDtxJfAxBmRmw==
X-Google-Smtp-Source: APXvYqw2hw68VBwTW/kez9n9cft5vFWTQykyH+UoMnHxawQYo6U32sk95vHd3z2UOFYlf40phgA0EA==
X-Received: by 2002:a17:902:bd08:: with SMTP id
 p8mr1254986pls.248.1571275513540; 
 Wed, 16 Oct 2019 18:25:13 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id h14sm348412pfo.15.2019.10.16.18.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 18:25:12 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v9 0/5] kasan: support backing vmalloc space with real shadow
 memory
Date: Thu, 17 Oct 2019 12:25:01 +1100
Message-Id: <20191017012506.28503-1-dja@axtens.net>
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

v1: https://lore.kernel.org/linux-mm/20190725055503.19507-1-dja@axtens.net/
v2: https://lore.kernel.org/linux-mm/20190729142108.23343-1-dja@axtens.net/
 Address review comments:
 - Patch 1: use kasan_unpoison_shadow's built-in handling of
            ranges that do not align to a full shadow byte
 - Patch 3: prepopulate pgds rather than faulting things in
v3: https://lore.kernel.org/linux-mm/20190731071550.31814-1-dja@axtens.net/
 Address comments from Mark Rutland:
 - kasan_populate_vmalloc is a better name
 - handle concurrency correctly
 - various nits and cleanups
 - relax module alignment in KASAN_VMALLOC case
v4: https://lore.kernel.org/linux-mm/20190815001636.12235-1-dja@axtens.net/
 Changes to patch 1 only:
 - Integrate Mark's rework, thanks Mark!
 - handle the case where kasan_populate_shadow might fail
 - poision shadow on free, allowing the alloc path to just
     unpoision memory that it uses
v5: https://lore.kernel.org/linux-mm/20190830003821.10737-1-dja@axtens.net/
 Address comments from Christophe Leroy:
 - Fix some issues with my descriptions in commit messages and docs
 - Dynamically free unused shadow pages by hooking into the vmap book-keeping
 - Split out the test into a separate patch
 - Optional patch to track the number of pages allocated
 - minor checkpatch cleanups
v6: https://lore.kernel.org/linux-mm/20190902112028.23773-1-dja@axtens.net/
 Properly guard freeing pages in patch 1, drop debugging code.
v7: https://lore.kernel.org/linux-mm/20190903145536.3390-1-dja@axtens.net/
    Add a TLB flush on freeing, thanks Mark Rutland.
    Explain more clearly how I think freeing is concurrency-safe.
v8: https://lore.kernel.org/linux-mm/20191001065834.8880-1-dja@axtens.net/
    rename kasan_vmalloc/shadow_pages to kasan/vmalloc_shadow_pages
v9: address a number of review comments for patch 1.

Daniel Axtens (5):
  kasan: support backing vmalloc space with real shadow memory
  kasan: add test for vmalloc
  fork: support VMAP_STACK with KASAN_VMALLOC
  x86/kasan: support KASAN_VMALLOC
  kasan debug: track pages allocated for vmalloc shadow

 Documentation/dev-tools/kasan.rst |  63 ++++++++
 arch/Kconfig                      |   9 +-
 arch/x86/Kconfig                  |   1 +
 arch/x86/mm/kasan_init_64.c       |  60 ++++++++
 include/linux/kasan.h             |  31 ++++
 include/linux/moduleloader.h      |   2 +-
 include/linux/vmalloc.h           |  12 ++
 kernel/fork.c                     |   4 +
 lib/Kconfig.kasan                 |  16 ++
 lib/test_kasan.c                  |  26 ++++
 mm/kasan/common.c                 | 237 ++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |   3 +
 mm/kasan/kasan.h                  |   1 +
 mm/vmalloc.c                      |  48 +++++-
 14 files changed, 503 insertions(+), 10 deletions(-)

-- 
2.20.1

