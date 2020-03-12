Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 784241831B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 14:37:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dVHq3k1gzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 00:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WFCwvHbl; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dV586F8czDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 00:28:11 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id h8so3081966pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4VdmTlclfqBiP5LOajS/XPffvzKnb6GJIIt3I40wSSs=;
 b=WFCwvHblrJSKQIDlt/hX02LJlwQAq677cdprHXNImlMFLDZdkO6G45TwtzyC2CRhql
 +CGJDYID2ASbqNRAoaAQ4cXnoTm0MIXziOiSXlaJXHGd5mYSzIRdGiqeBIw3Gs+IzzTR
 HV8YwVSF+yNFk0kPmTCaPNRzjwKq5bkduW2IdNycoB+77uzWfiizFswht23+mybAJX6W
 ip76UALSdYKLeKL/cZlqjYkIu5KtmxedegXqVMkX1/vY1WGfO6ADyC9sXOu+oMitmEG/
 7U+8sP7yTXCwxaftPS6IBRVSMONGQLQde3zssOKWScNxijsRHhKCrL3jpZ7WkHuhaP9N
 r9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4VdmTlclfqBiP5LOajS/XPffvzKnb6GJIIt3I40wSSs=;
 b=tIDIOBNSg4nyIJqBP7KoSoyxh/e67+fGZuWgnlOaEqAcamG8oLYwTg+VQPRWmXdSow
 In9VrXzOdIVW/92DZ7a5bfCGYPNhVRvqn9ezBFjv1kC7KgvtMQR+8WdzqgSoewIbCqRY
 X+KPAV90o1bRL3FsaTZ0n88Z+JxxE0O2BR9tWvDHeixyApRlOQzAlJeaP2Fiqb1cW6n2
 rvcXGHLZNFZMB1yxdQffRRaH5lyE0tbXuz3o9xEyHBShDQnusSdUaAPUTPXmig9xmbyV
 9vzbniLjNd1Nx9Z+RVhK3aaJA6DOTarKTnUQ3vxNExB/7XO7WxW8RNKcBww6/x+rnc0A
 Uc8A==
X-Gm-Message-State: ANhLgQ2UwPzDUkygUvO0PC5QiaZ8gl0UYWj5ucKWis6TJFdOd8x/KOM7
 /rVuHeHz8FWu/fNcq0oslCvr5w==
X-Google-Smtp-Source: ADFU+vs+dkfC8kvX6zcvX/2C+oWzwklyfMbqTvUZyYGRexQtGI4PyoTbHCCB7KVCz9ZSJsxgBl5B6g==
X-Received: by 2002:a63:cc0d:: with SMTP id x13mr7482346pgf.388.1584019686536; 
 Thu, 12 Mar 2020 06:28:06 -0700 (PDT)
Received: from santosiv.in.ibm.com ([111.125.206.208])
 by smtp.gmail.com with ESMTPSA id w206sm13007435pfc.54.2020.03.12.06.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:28:04 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 0/6] Memory corruption may occur due to incorrent tlb flush
Date: Thu, 12 Mar 2020 18:57:34 +0530
Message-Id: <20200312132740.225241-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Greg KH <greg@kroah.com>
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
Changelog:
v2: Send the patches with the correct format (commit sha1 upstream) for stable
v3: Fix compilation issue on ppc40x_defconfig and ppc44x_defconfig

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
 arch/powerpc/include/asm/nohash/64/pgalloc.h |   9 +-
 arch/powerpc/include/asm/tlb.h               |  11 ++
 arch/powerpc/mm/pgtable-book3s64.c           |   7 --
 arch/sparc/include/asm/tlb_64.h              |   9 ++
 arch/x86/Kconfig                             |   1 -
 include/asm-generic/tlb.h                    | 103 ++++++++++++++++---
 mm/memory.c                                  |  20 ++--
 12 files changed, 123 insertions(+), 60 deletions(-)

-- 
2.24.1

