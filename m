Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854D2DF253
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 00:51:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cz2Z45sLtzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 10:51:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o6f56TU/; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cz2Vf51llzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 10:48:24 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id x12so3487920plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=59LXSfg6CIbQBLKaaDO0fOmP9mpUddrVZQLGzzVW5no=;
 b=o6f56TU/HNtk+MujwrDIZpGlrkqlIPUSD1CqDmvm+2LCEWto7G4yrRk2J+NB37B6XT
 jW0rBYyKeMVR/2UGocnfVjv3MUIvnW7sZxQuvuvSOIOcGop8LspzHUHeQtQFMR69MJDT
 ibhEI7JKAZ/Pe3xyt0T6sW5SFn42sEa48TsPO11w78m1VBa+wcExFXi73dx2R5q0CN8S
 cpYc1gRA7tZj/MKyFjrgNC2KohLkzyXHULmD/KgwJJOtDZKw7EKfOOzzFKBXgQoHCRJ+
 0wzwRyq3uXVqY9J5F8kqBrzsqTZOsfd5NtDUhRtKLZfRaz2vih/HKanGUoG7vR+xPaRS
 2jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=59LXSfg6CIbQBLKaaDO0fOmP9mpUddrVZQLGzzVW5no=;
 b=MGo75qiDoZSoMT4/BtlmzBX3uj7oWdhPANV//T6go6AIjpsuKnw25g/2Dz0ze6G92p
 4313ueyrM+EnNQh0llDuA3nksbI0d9ZZKI6SV3w7nCwhpgyaLH4ZGYxudsOYrNm7Vzbk
 5hEpons7EXk9pJspcRF0B+k+RRYapk3Jl4mM0hRALCTNR4JdIUAjfe5DXveDGI2+XRPQ
 A8ANKX5WkKNvDwSWyOcRauNFwg+r6EPCtYQFo4HC7pWtAQU0ae0OTzVdNPN7XsiaMBVa
 YdUoP/9OjikPJyXgH52I84qy2K4WcvZuQWQmlLTf/TGtpVxo8dn2lfGCcmvwe5GjdC3M
 CQqA==
X-Gm-Message-State: AOAM533bYlC0Oc6v8sWHg515eo2mgvQODMaNPu1phGOc7wG56jfVbJ1i
 VdiX7/nbos7Aa5gvj1omRREcMt7Kzpg=
X-Google-Smtp-Source: ABdhPJzIQ1cmwmMfdZ6SVjIDzizMVyWZqqd9ynZ7M23EfczxpaTFxhH5zlAe1Qt30RKZm5B/VN//EQ==
X-Received: by 2002:a17:90a:f404:: with SMTP id
 ch4mr10555422pjb.78.1608421700760; 
 Sat, 19 Dec 2020 15:48:20 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id k15sm12729275pfh.40.2020.12.19.15.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 15:48:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/5] powerpc/64s/radix: Use non-atomic ops for PTE
Date: Sun, 20 Dec 2020 09:48:08 +1000
Message-Id: <20201219234813.830747-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is not entirely settled because of future compatibility concern
but in terms of Linux code and existing processors I think the approach
works.

Thanks,
Nick

Nicholas Piggin (5):
  powerpc/64s: update_mmu_cache inline the radix test
  powerpc/64s: implement mm_nmmu_has_tlbs
  powerpc/64s: add CONFIG_PPC_NMMU for nest MMU support
  powerpc/64s/radix: implement complete radix__ptep_get_and_clear_full
  powerpc/64s/radix: Use non-atomic PTE updates if the MMU does not
    modify the PTE

 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |  2 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 10 +--
 arch/powerpc/include/asm/book3s/64/radix.h    | 50 +++++------
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 11 ++-
 arch/powerpc/include/asm/book3s/pgtable.h     | 11 ++-
 arch/powerpc/include/asm/mmu_context.h        |  5 +-
 arch/powerpc/mm/book3s32/mmu.c                |  4 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  7 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  3 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 82 +++++++++++++++----
 arch/powerpc/mm/book3s64/radix_tlb.c          | 26 +++---
 arch/powerpc/platforms/Kconfig                |  3 +
 arch/powerpc/platforms/powernv/Kconfig        |  1 +
 14 files changed, 134 insertions(+), 82 deletions(-)

-- 
2.23.0

