Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C08E1C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:19:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4686Wz6RWmzDr28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:19:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="bkxZ5igs"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686T52znkzDr0w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:16:56 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x15so441098pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8E+rJpVyLTQoZWEfd9l8Yi8PuLGKA2rJdGSnf5/Kng=;
 b=bkxZ5igsnh/JD58DPxcoPBhAYK+BQz7ACNUwxMf4gk/u5FymercBQR2KhZyxjb3FYZ
 JZiSHpTCCg8aHADYLHwUnJnHM7kGthaas1W4MEHaFCqGHoLPtqhU1KS6EmzyAUUCSNl7
 U9mjMa7MurDWuAxEGYohe9KDTOS+ATs8gCAcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8E+rJpVyLTQoZWEfd9l8Yi8PuLGKA2rJdGSnf5/Kng=;
 b=mc3jSv10zOqOGp1C76hAKX/r+lCrwUjSBEeq7uOI3nEbfzmB08Q7G8/Siul1jAJDO6
 GdS8XNkFlFS09rqcRPYEKDosjv7cKaUiYG9zEqIDnAXIZkX6q74s8mfLgOskOkW+oeQ2
 09yaH0/skzkuHdbwixGJl5z/gCbt8XyZn+pOHpROOfXXFzH7sGfWT3mQ+AOUO1vltquD
 ee5ETP6HuVWcP4BXC949vmWmxZbQDUw9CeLpv2pAAqolWZYYUJNIXcoEkPNMblTa3ESE
 CI60tipEEsPZbVCjAOhsNCppjuz1LQ7mnF0WkUugSToig61TQXpj8q0F980M7BZYh62N
 qtCA==
X-Gm-Message-State: APjAAAW9XOJOKaqyl43PFQVZjnhEQxkF2qI1Uo/7Gm4GNpvWiqKc65oX
 Vw/2Iv/VoOLGncfxp6LrRYIa5Q==
X-Google-Smtp-Source: APXvYqzPn+wvrZiTi8+K95Bh/aZxRdY7i083QL+BtsT3mL9jZmsLF7wA0MTHcqpa0AC2oHg2i6qA/Q==
X-Received: by 2002:a62:b60e:: with SMTP id j14mr2722718pff.54.1565828213449; 
 Wed, 14 Aug 2019 17:16:53 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id m4sm1197573pff.108.2019.08.14.17.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:16:52 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com
Subject: [PATCH v4 0/3] kasan: support backing vmalloc space with real shadow
 memory
Date: Thu, 15 Aug 2019 10:16:33 +1000
Message-Id: <20190815001636.12235-1-dja@axtens.net>
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
means that kasan is incompatible with VMAP_STACK, and it also provides
a hurdle for architectures that do not have a dedicated module space
(like powerpc64).

This series provides a mechanism to back vmalloc space with real,
dynamically allocated memory. I have only wired up x86, because that's
the only currently supported arch I can work with easily, but it's
very easy to wire up other architectures.

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

Instead, share backing space across multiple mappings. Allocate
a backing page the first time a mapping in vmalloc space uses a
particular page of the shadow region. Keep this page around
regardless of whether the mapping is later freed - in the mean time
the page could have become shared by another vmalloc mapping.

This can in theory lead to unbounded memory growth, but the vmalloc
allocator is pretty good at reusing addresses, so the practical memory
usage appears to grow at first but then stay fairly stable.

If we run into practical memory exhaustion issues, I'm happy to
consider hooking into the book-keeping that vmap does, but I am not
convinced that it will be an issue.

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
v4: Changes to patch 1 only:
 - Integrate Mark's rework, thanks Mark!
 - handle the case where kasan_populate_shadow might fail
 - poision shadow on free, allowing the alloc path to just
     unpoision memory that it uses

Daniel Axtens (3):
  kasan: support backing vmalloc space with real shadow memory
  fork: support VMAP_STACK with KASAN_VMALLOC
  x86/kasan: support KASAN_VMALLOC

 Documentation/dev-tools/kasan.rst | 60 +++++++++++++++++++++++++++
 arch/Kconfig                      |  9 +++--
 arch/x86/Kconfig                  |  1 +
 arch/x86/mm/kasan_init_64.c       | 61 ++++++++++++++++++++++++++++
 include/linux/kasan.h             | 24 +++++++++++
 include/linux/moduleloader.h      |  2 +-
 include/linux/vmalloc.h           | 12 ++++++
 kernel/fork.c                     |  4 ++
 lib/Kconfig.kasan                 | 16 ++++++++
 lib/test_kasan.c                  | 26 ++++++++++++
 mm/kasan/common.c                 | 67 +++++++++++++++++++++++++++++++
 mm/kasan/generic_report.c         |  3 ++
 mm/kasan/kasan.h                  |  1 +
 mm/vmalloc.c                      | 28 ++++++++++++-
 14 files changed, 308 insertions(+), 6 deletions(-)

-- 
2.20.1

