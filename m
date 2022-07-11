Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C759156D38B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:47:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8wj4KkMz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:47:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UY5oZcsZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UY5oZcsZ;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh8vQ1GKXz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:46:41 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so7102786pjl.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmBhjPhdel7Ory0h+LtHmaoT8CpQHwHtjRSzAczsGS8=;
        b=UY5oZcsZHFdGH9KcetDN8dqr2Mf0qiwqMqlLdkQ+0PNZPPWK8nytWfBrVg68lCyEAN
         jrVXhCD+p/9vhueaNcEswnstaaqhbi96KvKB1URC0IEAGTbb7bQ3L2sJKv8fP4/q3fdz
         qnhDuiRe5eJunmVyfmUC7y6G6huMy6rKKY2vpo7MUN+GN+8Yg69bDGSpiExtmJG6nmwc
         HGrj6W5Zy4EILKOUdTTBtFEUayRpo9P6vRZIShjByCsnQmdWy7cHknQIBwTn6y+6JaHt
         7Jslc7TiuDWWVL3D1WVwoeXWF4xp0s+zIBfTFhbW89tgNx9jEYuB6VyOj7QkOyyjH+tF
         MEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmBhjPhdel7Ory0h+LtHmaoT8CpQHwHtjRSzAczsGS8=;
        b=1DP407iCzOW9xfA5X/uunvpLeyuofmFohvOQzqcEQef5iK3YomNh8kgf0lU6gPbLpg
         7zw1Xwvcmx8VGIPeaAZD5FI2ggdHFe2Jrg76aCgILuGIou/VkV3HUESprmedN6QlROwW
         cJ6ea8AlWiT5MASnnI0xjo66AB5ft6O72aajv8cAmhBDomR8QoNGpb359HKyWN+wEjCB
         Z2CWPfjpJoD1pVW9Osbqy/vN6ky0QnjiExvc66bCHpuvaMoB4YmHwEHPu54vCk2g32W0
         35CtrpD+RC9BJSWL/tZI1enCT2cPfDVDntrHJcjMp7dGqyeQj9mzWpjt/vbLLsRQIbmW
         j58g==
X-Gm-Message-State: AJIora8ldW4zLLMGwibb+Cz3J9/7B3mH28Jtk5KQbW+2tZYNMH8Ny1AW
	MIM2Mx6i8mAvmcNnXynuj9We2ZWKIonPOg==
X-Google-Smtp-Source: AGRyM1uXqBxzEnWgTK+S6bqpqoqltGNYamS7CTaFawotYp6lLuQkplQPx4DboSyk03U1rFf9/7Vqqw==
X-Received: by 2002:a17:90b:1b48:b0:1ef:a90d:eae1 with SMTP id nv8-20020a17090b1b4800b001efa90deae1mr15050227pjb.68.1657511198328;
        Sun, 10 Jul 2022 20:46:38 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz. [47.72.206.164])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:46:37 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
Date: Mon, 11 Jul 2022 15:46:11 +1200
Message-Id: <20220711034615.482895-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, arnd@arndb.de, corbet@lwn.net, realmz6@gmail.com, Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, yangyicong@hisilicon.com, openrisc@lists.librecores.org, darren@os.amperecomputing.com, huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Though ARM64 has the hardware to do tlb shootdown, the hardware
broadcasting is not free.
A simplest micro benchmark shows even on snapdragon 888 with only
8 cores, the overhead for ptep_clear_flush is huge even for paging
out one page mapped by only one process:
5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush

While pages are mapped by multiple processes or HW has more CPUs,
the cost should become even higher due to the bad scalability of
tlb shootdown.

The same benchmark can result in 16.99% CPU consumption on ARM64
server with around 100 cores according to Yicong's test on patch
4/4.

This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
1. only send tlbi instructions in the first stage -
	arch_tlbbatch_add_mm()
2. wait for the completion of tlbi by dsb while doing tlbbatch
	sync in arch_tlbbatch_flush()
My testing on snapdragon shows the overhead of ptep_clear_flush
is removed by the patchset. The micro benchmark becomes 5% faster
even for one page mapped by single process on snapdragon 888.


-v2:
1. Collected Yicong's test result on kunpeng920 ARM64 server;
2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
   according to the comments of Peter Zijlstra and Dave Hansen
3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
   is empty according to the comments of Nadav Amit

Thanks, Yicong, Peter, Dave and Nadav for your testing or reviewing
, and comments.

-v1:
https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/

Barry Song (4):
  Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
    apply to ARM64"
  mm: rmap: Allow platforms without mm_cpumask to defer TLB flush
  mm: rmap: Extend tlbbatch APIs to fit new platforms
  arm64: support batched/deferred tlb shootdown during page reclamation

 Documentation/features/arch-support.txt       |  1 -
 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm/Kconfig                              |  1 +
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++++
 arch/arm64/include/asm/tlbflush.h             | 23 +++++++++++++++++--
 arch/loongarch/Kconfig                        |  1 +
 arch/mips/Kconfig                             |  1 +
 arch/openrisc/Kconfig                         |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/riscv/Kconfig                            |  1 +
 arch/s390/Kconfig                             |  1 +
 arch/um/Kconfig                               |  1 +
 arch/x86/Kconfig                              |  1 +
 arch/x86/include/asm/tlbflush.h               |  3 ++-
 mm/Kconfig                                    |  3 +++
 mm/rmap.c                                     | 14 +++++++----
 17 files changed, 59 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

-- 
2.25.1

