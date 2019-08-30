Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CFAA2B89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 02:40:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KLHg2jxBzDrgf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 10:40:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="pu31SPJC"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KLFG1yYhzDrgY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 10:38:40 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w2so3321488pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 17:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSLyHXthXaKXOQZ8SFsqItHK5pHRiDWtPuxcUQu12HE=;
 b=pu31SPJCi+AOP3zXr9+aDjC5rxpyExfuNsXBpNJ+U/17mstU+JX99GwniAgq5X7Pa5
 yWJd36SGMJDkYzN0HburXGQx9v3j6tk4ubUO1WEIePNUdsLuWxfV6CECGk+H9RDp/4Wa
 KMmLen85d+fQ7Ang26OUP+xrxgFhMbghKZgII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSLyHXthXaKXOQZ8SFsqItHK5pHRiDWtPuxcUQu12HE=;
 b=O598ZF+ZDs8tAPC5lWeA/SK7tOy1h9+cU7MuzSp3iWuZ16Z8jjkeYmRTMMCBH3uZf7
 QOZrePMqf4mINFiRWbrxivjK+oS/mhMbEBbgJXr7bWYTXQvvq0mVLbpT6GM4rwUdgRGJ
 x2nckoRJgHIT4UN24m215ijVZsdtHNzSyaGO6IspOOyv5xa+Hkzbip0h+Kr5HKcTA7JK
 esFoA4qvzad1Qd3ttPIRwe8EacvA77DNeImm+NYkDyv/zYBhsE7QUVpWvFIeFzOF1Mfg
 pm9D7IGkt0ccrNlPe0MyANZmo/v+deCSm7Sb4YtFzsjfKDbL6jwS92JTrDZdkJy4tGan
 ZGiA==
X-Gm-Message-State: APjAAAWznK2GFyeMDOPFerRH2UCBaVdaKlhfbk08z1wglMBsehRhLr2H
 tCFo9KxOkgCFnZu+9gFpjOKmmw==
X-Google-Smtp-Source: APXvYqySp87qZozbuG9m12UZb0GG3l4jvENITo2xlt52HkVNyUOk8lyBYyVA9FdFCHiOprawlyDAQA==
X-Received: by 2002:a63:9245:: with SMTP id s5mr10952781pgn.123.1567125517640; 
 Thu, 29 Aug 2019 17:38:37 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id a16sm4341162pfk.5.2019.08.29.17.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 17:38:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v5 0/5] kasan: support backing vmalloc space with real shadow
 memory
Date: Fri, 30 Aug 2019 10:38:16 +1000
Message-Id: <20190830003821.10737-1-dja@axtens.net>
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
v5: Address comments from Christophe Leroy:
 - Fix some issues with my descriptions in commit messages and docs
 - Dynamically free unused shadow pages by hooking into the vmap book-keeping
 - Split out the test into a separate patch
 - Optional patch to track the number of pages allocated
 - minor checkpatch cleanups

Daniel Axtens (5):
  kasan: support backing vmalloc space with real shadow memory
  kasan: add test for vmalloc
  fork: support VMAP_STACK with KASAN_VMALLOC
  x86/kasan: support KASAN_VMALLOC
  kasan debug: track pages allocated for vmalloc shadow

 Documentation/dev-tools/kasan.rst |  63 +++++++++++
 arch/Kconfig                      |   9 +-
 arch/x86/Kconfig                  |   1 +
 arch/x86/mm/kasan_init_64.c       |  60 +++++++++++
 include/linux/kasan.h             |  31 ++++++
 include/linux/moduleloader.h      |   2 +-
 include/linux/vmalloc.h           |  12 +++
 kernel/fork.c                     |   4 +
 lib/Kconfig.kasan                 |  16 +++
 lib/test_kasan.c                  |  26 +++++
 mm/kasan/common.c                 | 170 ++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |   3 +
 mm/kasan/kasan.h                  |   1 +
 mm/vmalloc.c                      |  45 +++++++-
 14 files changed, 437 insertions(+), 6 deletions(-)

-- 
2.20.1

