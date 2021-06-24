Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24963B2595
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 05:41:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Qsk54Dqz3bs6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:41:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=bPxUvfH1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=bPxUvfH1; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QsB2DgJz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:41:00 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id y14so3555509pgs.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 20:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZ+5u/3FQBWJpz6rgvDEPJOqY9HFVit9UNSurv/3XAo=;
 b=bPxUvfH1hicKqr/5RLTN+v5d3hmJtqKPBLhqt/aILJcVbY0xZwO8QSexq6qypSpAwm
 jz4dCpf47RokwWM2HQbvGJEOYum/WZ93e1ypJ/AsOlOm+rOeqlvmPZqDfZdSSWZ3AWrq
 T6joaO8GE6iurLPFBq+F+CzwbczEAmP++IXXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZ+5u/3FQBWJpz6rgvDEPJOqY9HFVit9UNSurv/3XAo=;
 b=bzxpz/A9UNJBC3JgDveOMwcHM3C/8sgKc6TFP3RdjCpDJOUM375Y9NKSWjSnqkYF0X
 NEaOAVe6tHSEfgtOsf+BbyDuSW5nChun509T4qYl/CUjh9rrZbPWfxAz2+9VT/DS2H10
 UVHKj6DsJhrHEhHuQUXa8QezVwe3VHbaPT43KnXIIMQ/X2ci4ML49Zheeq2WRYMNHAPT
 DM1ivrEuF+55QdnjO8I/7KJgH/7XxRA9uAkhbkSDyRfxAjhFQVYECnXGEesqqHmQeMpD
 Lozr7WUA84tPATkTMxvQ9wxUYGXWL9pUi+ksQ7UtO24Cca4KRO9VeLUdRU+v4YNVP4Fj
 90WQ==
X-Gm-Message-State: AOAM531QzfzENhIX609Rle0d9BuYmkfIowXyInlJxHOneBAQ3c7+WQds
 y22yZteH0Kk45U0Q3DIX3SAKRw==
X-Google-Smtp-Source: ABdhPJxKBNUxj9TLBqOZ1Vsk97fOuZIzqqF6nxVKDlcrkJNJ1knxKZtKY350l3cH6JZ4bwXM1c3X2A==
X-Received: by 2002:a62:ce83:0:b029:306:f58:aa14 with SMTP id
 y125-20020a62ce830000b02903060f58aa14mr2705692pfg.67.1624506056039; 
 Wed, 23 Jun 2021 20:40:56 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id k9sm563729pgq.27.2021.06.23.20.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 20:40:55 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v16 0/4] KASAN core changes for ppc64 radix KASAN
Date: Thu, 24 Jun 2021 13:40:46 +1000
Message-Id: <20210624034050.511391-1-dja@axtens.net>
X-Mailer: git-send-email 2.30.2
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU. I've been
trying this for a while, but we keep having collisions between the
kasan code in the mm tree and the code I want to put in to the ppc
tree.

This series just contains the kasan core changes that we need. These
can go in via the mm tree. I will then propose the powerpc changes for
a later cycle. (The most recent RFC for the powerpc changes is in the
v12 series at
https://lore.kernel.org/linux-mm/20210615014705.2234866-1-dja@axtens.net/
)

v16 applies to next-20210622. There should be no noticeable changes to
other platforms.

Changes since v15: Review comments from Andrey. Thanks Andrey.

Changes since v14: Included a bunch of Reviewed-by:s, thanks
Christophe and Marco. Cleaned up the build time error #ifdefs, thanks
Christophe.

Changes since v13: move the MAX_PTR_PER_* definitions out of kasan and
into pgtable.h. Add a build time error to hopefully prevent any
confusion about when the new hook is applicable. Thanks Marco and
Christophe.

Changes since v12: respond to Marco's review comments - clean up the
help for ARCH_DISABLE_KASAN_INLINE, and add an arch readiness check to
the new granule poisioning function. Thanks Marco.

Daniel Axtens (4):
  kasan: allow an architecture to disable inline instrumentation
  kasan: allow architectures to provide an outline readiness check
  mm: define default MAX_PTRS_PER_* in include/pgtable.h
  kasan: use MAX_PTRS_PER_* for early shadow tables

 arch/s390/include/asm/pgtable.h     |  2 --
 include/asm-generic/pgtable-nop4d.h |  1 -
 include/linux/kasan.h               |  6 +++---
 include/linux/pgtable.h             | 22 ++++++++++++++++++++++
 lib/Kconfig.kasan                   | 12 ++++++++++++
 mm/kasan/common.c                   |  3 +++
 mm/kasan/generic.c                  |  3 +++
 mm/kasan/init.c                     |  6 +++---
 mm/kasan/kasan.h                    |  6 ++++++
 mm/kasan/shadow.c                   |  6 ++++++
 10 files changed, 58 insertions(+), 9 deletions(-)

-- 
2.30.2

