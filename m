Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4549616597B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 09:44:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NSnR3fH7zDqSq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 19:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hJHLugvr; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NSlb5TLmzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 19:42:51 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id y8so1262751pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 00:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69/MEN6neJrLZVOcMniBR+jEMvQQCzDsFJ5/OiGkBEs=;
 b=hJHLugvr5EFeG98iJbvNbllv7jxne0v7fJITPHxEGcbbif0l40t17D3thwvnIrrx3t
 zG0fM3HyxLt+MV4Er4momgpBguYXCjK5s2uqPu50480xLDetTD+Z4EF1Uocq9bSLTH3x
 KnnWv+8n7Dy8tKK/vz+j67hWtrHhh940qgxAYSvaM5AeN/6x030RnNZdlucSOYZhrg8l
 EHpi9stwZYNiymBpBEFpDTvgYjBvOv99F/uj7ezNRaB2YUS29OOSsAyZ4NfUf8X85z/7
 +2sGStvfmZmzIjW4+b448s9vyvpYH1RbCaoTDGyM8s99r/ODa8ffyH0DGuYmc2VgrHvO
 FSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69/MEN6neJrLZVOcMniBR+jEMvQQCzDsFJ5/OiGkBEs=;
 b=QQKIERJwlgNYmnUkRczCsyGCrL5XL3VwfA/HP5HFv45JdwnF2ukCo1c0WZG9WGA/t+
 cTyi+I1JgnC1On5Kq7+xcOe4SCg/wArvrsFdkcPGFW8j8mHDMne1H58zudxT5S92yqRq
 9DB8z5tscimPJdQdP+SPKtlT3vyX3QfZIvRcgNKBNEnzZQ5ZcKF5fMYH2xGJrsRSeMYN
 Rb9ZcDWBLwdGNP1pCttObws1vPKzon8rTVzbSEbgh6gVoOsoFJs8G98J/fxsT0UBPuCi
 JiRmMAjoqvgaJzm60mRzsr8/jhBDug3PfEUKZkBiCaWhnZ+lU0vRUP3u/fMG9oaZeSgv
 BBPQ==
X-Gm-Message-State: APjAAAXDlgz0omE93zb9yHW0psP030wH3HWR8OJ16gZoMdUzhhf11isL
 D/TmY3ON3iymDvS8qv6uEynGJfVPtzM=
X-Google-Smtp-Source: APXvYqxIywrcJiE2qVrEL0AV3O2DTy1jKzE72CSoV5+AEciC+I2Hxko/sbu3um9n9QGZEAL+B1Wytg==
X-Received: by 2002:a17:90a:af81:: with SMTP id
 w1mr2414350pjq.14.1582188169086; 
 Thu, 20 Feb 2020 00:42:49 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.72])
 by smtp.gmail.com with ESMTPSA id r145sm2512381pfr.5.2020.02.20.00.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 00:42:48 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 0/6] Memory corruption may occur due to incorrent tlb flush
Date: Thu, 20 Feb 2020 14:12:23 +0530
Message-Id: <20200220084229.1278137-1-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
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
Cc: peterz@infradead.org, aneesh.kumar@linux.ibm.com,
 akshay.adiga@linux.ibm.com, gregkh@linuxfoundation.org
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

[1] https://patchwork.kernel.org/cover/11284843/

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
 arch/powerpc/include/asm/tlb.h               |  11 ++
 arch/powerpc/mm/pgtable-book3s64.c           |   7 --
 arch/sparc/include/asm/tlb_64.h              |   9 ++
 arch/x86/Kconfig                             |   1 -
 include/asm-generic/tlb.h                    | 103 ++++++++++++++++---
 mm/memory.c                                  |  20 ++--
 10 files changed, 122 insertions(+), 44 deletions(-)

-- 
2.24.1

