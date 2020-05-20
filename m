Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F31DAD92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:34:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RmJd1wv1zDqYL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WO/OCEZI; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RmGh4kHgzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:32:56 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id s20so1028290plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uRm0inOSA1wLGYru+EKiLEAH9ZxFBx8He5GrcjTmYus=;
 b=WO/OCEZIeElldrwdIFdxzh908eQBMlf6SmXSXuIfbLwu0S7nFkhTkEgstqatXlhiRg
 1OZI5xPAWZPQCp/gFf6XKAAjEfKf9Eg1g+1pJOETOUlLtV5gEFl8+jkHxvK6JVTPAQOi
 3qxU/G/DvxGnumfVjtCJG0eSywHv2+fz/ZqX5QXV+NpLDMKm2h/9X1V26zVXFjfM3wTf
 p/vDVYu6Q+OKv3AXCG18QpCePkL5ImYlo0luE6KUMtqOzt4hFR3tlym/4srFfBjDQ5BD
 Gfx1zOiaj/sEl9a22iFKCbR4wH42V9rtTYn0usEpJ53ZOgEr8bgSzkECpjrnsh9UkNHT
 JfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uRm0inOSA1wLGYru+EKiLEAH9ZxFBx8He5GrcjTmYus=;
 b=h3039GAMSsehTW8e561KYSYe+qqBXXOofMqAdjJbJGS0H18OO6qEnO4JhQL5CP0PA8
 twhIIxwb+/neGCpzq/hQQ6n4nQa5NffbevzKrfetkt2NFn3e/46tkRSvohdGewcWxA6C
 5eIk4xzJy1h0jXGA085tZ0s8F4oOjtY2kxu2nuItKr9YGFtGN39HC5MRFCxIt9cML0S5
 44cfeMrN3O6/y15KD322dcZ+BgyGPrrsClhv2Pw0zaz3TyTQuYVDBQNTudnm12I6kFH5
 KrW+cg283T2BtlAzRBjZXM9twDXFMMYzqS7vQwiy4UPPEra1l7fcXPD2Q3iv2roP7RHK
 t+9Q==
X-Gm-Message-State: AOAM532VQfQwdFy4NYI1S1gbqHbWjPknb8oYVTgSWGzj75ars+ELf68L
 sswEqVJdWnRmrvBZOXMCd0pP/Q==
X-Google-Smtp-Source: ABdhPJzgcCjz7zz8c2cxioxRyVBVr9+N8S0eez6HpqMHxLFb5u5xJNRkDGfYVqT/uZaIpWt9cSD1xg==
X-Received: by 2002:a17:90a:648c:: with SMTP id
 h12mr4123185pjj.229.1589963573220; 
 Wed, 20 May 2020 01:32:53 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([223.181.246.139])
 by smtp.gmail.com with ESMTPSA id 2sm1553980pfz.39.2020.05.20.01.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:32:52 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 0/6] Memory corruption may occur due to incorrent tlb flush
Date: Wed, 20 May 2020 14:00:19 +0530
Message-Id: <20200520083025.229011-1-santosh@fossix.org>
X-Mailer: git-send-email 2.25.4
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
Cc: Sasha Levin <sashal@kernel.org>, Santosh Sivaraj <santosh@fossix.org>,
 Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TLB flush optimisation (a46cc7a90f: powerpc/mm/radix: Improve TLB/PWC
flushes) may result in random memory corruption. Any concurrent page-table walk
could end up with a Use-after-Free. Even on UP this might give issues, since
mmu_gather is preemptible these days. An interrupt or preempted task accessing
user pages might stumble into the free page if the hardware caches page
directories.

The series is a backport of the fix sent by Peter [1].

The first three patches are dependencies for the last patch (avoid potential
double flush). If the performance impact due to double flush is considered
trivial then the first three patches and last patch may be dropped.

This is only for v4.19 stable.
--
Changelog:
 v2: Send the patches with the correct format (commit sha1 upstream) for stable
 v3: Fix compilation for ppc44x_defconfig and mpc885_ads_defconfig
 v4: No change, Resend.

--
Aneesh Kumar K.V (1):
  powerpc/mmu_gather: enable RCU_TABLE_FREE even for !SMP case

Peter Zijlstra (4):
  asm-generic/tlb: Track freeing of page-table directories in struct
    mmu_gather
  asm-generic/tlb, arch: Invert CONFIG_HAVE_RCU_TABLE_INVALIDATE
  mm/mmu_gather: invalidate TLB correctly on batch allocation failure
    and flush
  asm-generic/tlb: avoid potential double flush

Will Deacon (1):
  asm-generic/tlb: Track which levels of the page tables have been
    cleared

 arch/Kconfig                                 |   3 -
 arch/powerpc/Kconfig                         |   2 +-
 arch/powerpc/include/asm/book3s/32/pgalloc.h |   8 --
 arch/powerpc/include/asm/book3s/64/pgalloc.h |   2 -
 arch/powerpc/include/asm/nohash/32/pgalloc.h |   8 --
 arch/powerpc/include/asm/tlb.h               |  11 ++
 arch/powerpc/mm/pgtable-book3s64.c           |   7 --
 arch/sparc/include/asm/tlb_64.h              |   9 ++
 arch/x86/Kconfig                             |   1 -
 include/asm-generic/tlb.h                    | 103 ++++++++++++++++---
 mm/memory.c                                  |  20 ++--
 11 files changed, 122 insertions(+), 52 deletions(-)

-- 
2.25.4

