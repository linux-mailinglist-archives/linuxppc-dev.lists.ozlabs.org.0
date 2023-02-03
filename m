Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C83F76890A5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 08:19:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Rqm4y2pz3f72
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 18:19:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fknWjk6d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fknWjk6d;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Rpq4B9Pz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 18:18:57 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so8023895pjq.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 23:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLYNxN+89Z9I2MvycqY9goYhkfwarRJMT/94Xq9kdE4=;
        b=fknWjk6dL5edxfKxDS5Rs5o8++Qprn0+hg/MmDkKE/a3jok8QnDK4GXiRe2ULmBeBb
         r3AuZ/P9LO8LzKC9NfLKoesrb9aZHs64mLBnC24H1Czlpx7VypPdpfU0qNMI+lIwPDma
         8leU9efusRQrRNFqgL0/9ES/Oktaei06ROJx9nOPXjjV8ygBOXdXf68QcQBQFGNZQoxx
         zL5/x4XAHO6NyoNRy7qX8L/1OtMC5tu/lQ3zY7P0RnL8Sa0/pIWrHTFCLfhYx+gp3SQC
         r4sCVpiPX5GoJ6flZz5XYEM23RAQ6PCuB/FhPZS8G0B/9Lv4MihQxroiH169o+4gRXxU
         Y1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLYNxN+89Z9I2MvycqY9goYhkfwarRJMT/94Xq9kdE4=;
        b=Mud6sa/pTIsTKhE1MRCx1ZhBVhQgu+f+/cOEUutAn+un3KevP7Sw0LbTw1r29fODkH
         +HRueiZHUq9Giu+L5PGZwaXiKmAPcAmL3Qsei/ozxIAZaOqq1ZhtHIJtECtf5h5MJtvM
         6mRoj25cBbExAaxq5EK3quFBDYhN9/lz3OnDQ2Q6X3gbGtYdfqrrUy3BfjlCuaQdhzxO
         ivVaWQnPbugDUT/SP1MU7kasyuSu/xeIEtzcTo93TTGHhbkwXt/BsqAC51KIAw/iqwMw
         GEJPkuRe1x0sr95SfLIb4RUk724YBDPNTgGtfZaglML61bQLYJNVrtuD06EA0/qYqya3
         Jt4Q==
X-Gm-Message-State: AO0yUKWB1m9Pkxd+jBTz2/kzi1S6+ddKuMyrFPiFBZbYOyKPGMNn+E+Z
	Bax+P4ikUfvfIt4tGmRSLSI=
X-Google-Smtp-Source: AK7set8UmQdNB4VaSy6Fxb5wxUcSBgBrZDhP2Lw7G1Jnu8w+a6SsBl4amQbJ+dEOBbUxVNaibU8ezg==
X-Received: by 2002:a05:6a20:548c:b0:be:a082:670f with SMTP id i12-20020a056a20548c00b000bea082670fmr4974581pzk.28.1675408734548;
        Thu, 02 Feb 2023 23:18:54 -0800 (PST)
Received: from bobo.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id f20-20020a637554000000b004df4ba1ebfesm877558pgn.66.2023.02.02.23.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:18:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 0/5] shoot lazy tlbs (lazy tlb refcount scalability improvement)
Date: Fri,  3 Feb 2023 17:18:32 +1000
Message-Id: <20230203071837.1136453-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@redhat.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <nadav.amit@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Sorry about the double send)

Hi Andrew,

This series improves scalability of context switching between user and
kernel threads on large systems with a threaded process spread across a
lot of CPUs.

Please consider these patches for mm. Discussion of v6 here:

https://lore.kernel.org/linux-mm/20230118080011.2258375-1-npiggin@gmail.com/

No objections so far, Linus think they look okay in principle but has
not reviewed in detail.

With the exception of patch 1, there should be no functional change
on non-powerpc archs with this series.

Changes since v6:
- Dropped the final patch to optimise powerpc more, as mentioned this
  will be taken through the powerpc tree after the base series is
  upstream.
- Split the first patch into patch 1 and 2 in this series so the
  functional change is isolated to minimal patch.
- Removed ifdefs and churn from sched/core.c that were not required
  because ifdefs in .h refcount functions do the same job.
- Split DEBUG_VM option out to its own sub-option because it IPIs all
  CPUs on on every process exit which is pretty heavy.
- Changed comment style as noted by Nadav.
- Added description about how to test it, requested by Linus.
- Added link and credit to Rik's earlier work in the same vein.
- Did a pass over comments and changelogs to improve readability.

Nicholas Piggin (5):
  kthread: simplify kthread_use_mm refcounting
  lazy tlb: introduce lazy tlb mm refcount helper functions
  lazy tlb: allow lazy tlb mm refcounting to be configurable
  lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling
    scheme
  powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN

 Documentation/mm/active_mm.rst       |  6 +++
 arch/Kconfig                         | 32 ++++++++++++++
 arch/arm/mach-rpc/ecard.c            |  2 +-
 arch/powerpc/Kconfig                 |  1 +
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c |  4 +-
 fs/exec.c                            |  2 +-
 include/linux/sched/mm.h             | 28 ++++++++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/fork.c                        | 65 ++++++++++++++++++++++++++++
 kernel/kthread.c                     | 22 ++++++----
 kernel/sched/core.c                  | 15 ++++---
 lib/Kconfig.debug                    | 10 +++++
 14 files changed, 170 insertions(+), 23 deletions(-)

-- 
2.37.2

