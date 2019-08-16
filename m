Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9B8F99B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:09:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468qZy4vlszDrDy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:09:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aLkfZORj"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468qY46LqTzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:07:52 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id u17so2275668pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nFEM/d7HA8S025LPfsz2KN5UKEOo8SVPz08/9wibTs8=;
 b=aLkfZORjgZLqWShU3gWEKEin71YSrlPYtJ+6jHfehxPGNO4uF3t0IC4Han+2vjKMPM
 VejsTz3Ur+L9u8wOPn76TAYnqlt57X9zIPalr075FFntJeaSZOQ73E8itF1Kdprn5JD8
 xK+Nw9mftagtTKlFuu5OS9u07KRdxV87jmOBAJTSu9V/rxomRDWAvVyeKpIBK5OTX3aD
 9FBvpyGkxvo3RaK2cu4PSR8sDBUJi6PTTW5yAlI59ZM6uhNj+mTt1BG5SF9WDl3U4xJt
 FpqlLpvyEJLWLFAWntrjgaXSSKcxdsR36L4H8/IOtxent63QooPYSJr5plpLYJXejs+p
 CM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nFEM/d7HA8S025LPfsz2KN5UKEOo8SVPz08/9wibTs8=;
 b=jV0NKNY3WpRfINPEL7Cbv9n1vXaYhPyT6S3sk8IBGP7ly3kMcXNE1uA2fgi9W/OPDI
 nF0oXciy4UvBw/yqZKQo2dv/Hvfc4efxzE4Tr4eD/6KC9kh2mnygxSyFNCYwRPlvb75V
 OL5b8MTz6amCg8n8Tpnj764ZuIfReYx363o8HX6tyyduPpezciHqtb3LDiNm5LVia59+
 wArlqIak4dBJpwOPtZcrQX08rlM0kvTq/nJbUjjQqGmwfSBYTG3CNe/z03DAB0jmAVVn
 fAfmKKkFIPdxL8naFY8cLsTyP0JlOzQhd9/kyxKQorQQqNLmn1RaOQitdPSW0tH4O7n2
 yURA==
X-Gm-Message-State: APjAAAUht3zemTGhZm+D9Pe0MAKA4rQ50M6xgIpAxY0S0CXZntQOsvDz
 YC6YJOBBD6YI1rLEM0yTiSqO8YF4
X-Google-Smtp-Source: APXvYqyqsaeaJfJYViB7G0cDITZyTzhnYbuDI1mcX7bVMo8T0rL3K694o7uEAMO6A/2ltFcjXBQcJw==
X-Received: by 2002:aa7:9483:: with SMTP id z3mr8888700pfk.104.1565928467479; 
 Thu, 15 Aug 2019 21:07:47 -0700 (PDT)
Received: from bobo.local0.net (61-68-63-22.tpgi.com.au. [61.68.63.22])
 by smtp.gmail.com with ESMTPSA id j187sm4994850pfg.178.2019.08.15.21.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:07:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] series to optionally disable tlbie for 64s/radix
Date: Fri, 16 Aug 2019 14:07:30 +1000
Message-Id: <20190816040733.5737-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the RFC I accounted for feedback, and also made the patch more
complete so we can actually boot and run a 64s/radix kernel without
using tlbie at all.

KVM and bare metal hash are harder to support. Bare metal hash because
it does some TLB invation with interrupts disabled (can't use IPIs).
It might be possible those invalidates could be avoided or the paths
changed to enable interrupts, but it would be a much bigger change.

KVM with radix guests might be acutally quite simple to support, so I
can look at that next if we get this merged.

KVM with hash guests might not be feasible to do in a performant way,
because of the design of virtualised hash architecture (host flushes
guest effective addresses), at least it would need special real mode
IPI handlers for TLB flushes.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc/64s: Remove mmu_partition_table_set
  powerpc/64s/radix: all CPUs should flush local translation structure
    before turning MMU on
  powerpc/64s: introduce options to disable use of the tlbie instruction

 .../admin-guide/kernel-parameters.txt         |   4 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   9 +
 arch/powerpc/include/asm/mmu.h                |   2 -
 arch/powerpc/kvm/book3s_hv.c                  |  10 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |  35 +++-
 arch/powerpc/mm/book3s64/hash_utils.c         |   4 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |   4 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  77 +++++---
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  22 +--
 arch/powerpc/mm/book3s64/radix_tlb.c          | 182 ++++++++++++++++--
 arch/powerpc/mm/pgtable_64.c                  |   5 +-
 drivers/misc/cxl/main.c                       |   4 +
 drivers/misc/ocxl/main.c                      |   4 +
 13 files changed, 282 insertions(+), 80 deletions(-)

-- 
2.22.0

