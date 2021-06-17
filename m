Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A93AAFBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 11:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5GyL5WPpz3c1x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 19:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=pyG2ezEo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=pyG2ezEo; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Gxt6FHsz3076
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 19:30:41 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id t9so4476203pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SYbkYhz8dgvzCxm2xx3ltQCVLS/WASlN9bfsoiUbbWc=;
 b=pyG2ezEonhSZpmiR9w4aRgJpSw8RrKIDfEN/1ZUcre+W2p6ZZp510AFg5X+vESCJmb
 DHG57hmznembCe+kf0HzmpX+0NbvWrMoC1SgDOwiwp3p+Mn6W5adffrRP22cXsE4JyRZ
 B1E116SwPNZiYGO0a+nvyOoy173iS+c0O04a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SYbkYhz8dgvzCxm2xx3ltQCVLS/WASlN9bfsoiUbbWc=;
 b=akPoFl9vZldEcHJZdFUxMrD0rWzE2EsOqm0pkZ6zb/u3TWIlqeKGKobqPKMdBhcQ6G
 cj2yZDYwGIDWTU/ciKDY8t1lhjqgoqvKDd/hrL7+lamB6xbyUboOqz4m1K7qAJ/OQwVe
 yGuxUavNNpkm+OPlEZoiaviZFW51leGnJK68cQTXrduckZtZdXRA2oj8OAOqNiZ/jDw1
 2vtXXl6v1uIL+sOR6MEANbgX8Vyf4046SEzNJgtxeTlkiQxW+h6PoWx01NnaPHCe3iLR
 hFX72tc7n4EgnkphqVYs70qnfaFkiQD5CHmJM7rua1BX+C4J+Ut42GwVFUhfoNs6WmjY
 m5HA==
X-Gm-Message-State: AOAM530y3Cqu0HlqSl2wQOsRatOPNw8dyeWzk23DS3rXWAJ6NYhzApYr
 wlqm8vNqHepXhZVSIpNVtwZDYQ==
X-Google-Smtp-Source: ABdhPJw/s1VjEh3D7QkWvCRIIEN5527xrRUM8tuxsJLqyJbkFYCVDMC6zwTDygQITZ2gT3hpvoSTwA==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr4319275pfe.37.1623922237921; 
 Thu, 17 Jun 2021 02:30:37 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id fs10sm7733847pjb.31.2021.06.17.02.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:30:37 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, elver@google.com, akpm@linux-foundation.org,
 andreyknvl@gmail.com
Subject: [PATCH v15 0/4] KASAN core changes for ppc64 radix KASAN
Date: Thu, 17 Jun 2021 19:30:28 +1000
Message-Id: <20210617093032.103097-1-dja@axtens.net>
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

v15 applies to next-20210611. There should be no noticeable changes to
other platforms.

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
 lib/Kconfig.kasan                   | 14 ++++++++++++++
 mm/kasan/common.c                   |  4 ++++
 mm/kasan/generic.c                  |  3 +++
 mm/kasan/init.c                     |  6 +++---
 mm/kasan/kasan.h                    |  6 ++++++
 mm/kasan/shadow.c                   |  8 ++++++++
 10 files changed, 63 insertions(+), 9 deletions(-)

-- 
2.30.2

