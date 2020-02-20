Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97F165702
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 06:38:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NNfS1Pv8zDqW6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 16:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=LiGpsSJw; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NNb756z2zDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 16:35:10 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 84so1329295pfy.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 21:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKm1MlIEqICiKl98BAwahnWrPOiQX0P3G2oQRircgsw=;
 b=LiGpsSJwILX3x1TKtOk/SWkE5PqYzjYz/HztQvxKIryNvRRtPJjg/T9i0J+AYg7Tpy
 1PmfPb037cZZVu3DojOYSZVhVWeW86Wz47YRR/RtqiWIBlpPW6qFHFpux6UB0zR1SVHz
 S1NuwBUumoQzgs/BN39mCEogaqAdT9oBbuFI8yD5+10nq0i8m9tJURtjMBeGTASnQqPF
 U/WI8Nw4bQ7CjEfjSnmH8Iz0VWYLM1QFXedk2lafFjh1kr1j8pEo6FoIH2I7w8mbtt4y
 Ot/32mfDt+QGsTpgqcssXHV1YGMyj/EUTUqX/FM9K22OaxEGAn72lxNnrCX5c5OIdZFm
 dM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKm1MlIEqICiKl98BAwahnWrPOiQX0P3G2oQRircgsw=;
 b=G0rE1ipdvjWHIxF8D2HaeGmaoRIVtQSrupy7GvMwMv/YqMtUJ2rYh6t0vQwcBdyr4C
 WxDh7GTbupWna21PtdHQXDmab5cnBJBU+BRcQKbsb3vCagSnsZPI7fLhevcSk2NOV7Ii
 wDXSOLTxQIHZs6jlq4ME1EsGQql+raZ8q8LKdEO7CRLHFgwwPhJDSHHq0+IUz8kF0r4E
 2YQGfFSSDNJ3yB72RS2Ubr6E+kI8T0mmfZ6yd5NvCd9cM/1X4vW2+AZZTyd8hVO+qnFH
 pYDqVoxdl8bDvuYSNYDKFlaT5L75ZnDOFduvVCU7cwSaTTi1Wwzlnblx3kAPuj1fsPW9
 ib/A==
X-Gm-Message-State: APjAAAXKdoVdOKjiyVIAgGhYSytET6h6UB2+VP87bZKlkQBvDNIiwDBg
 AnsXMJCU6o/sXmDWdYLY53Un30VjX24=
X-Google-Smtp-Source: APXvYqwsLC75ue0/RjU/zYa6DFXsUaBkkmJb0okKfCSO8U9YZFIgVVg1vqpuT6zDnmq1RZ3r45NA5Q==
X-Received: by 2002:a62:7a8a:: with SMTP id
 v132mr31783219pfc.111.1582176906864; 
 Wed, 19 Feb 2020 21:35:06 -0800 (PST)
Received: from santosiv.in.ibm.com ([129.41.84.71])
 by smtp.gmail.com with ESMTPSA id r11sm1664262pgi.9.2020.02.19.21.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 21:35:06 -0800 (PST)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: [PATCH 0/6] Memory corruption may occur due to incorrent tlb flush
Date: Thu, 20 Feb 2020 11:04:51 +0530
Message-Id: <20200220053457.930231-1-santosh@fossix.org>
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
 akshay.adiga@linux.ibm.com
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

