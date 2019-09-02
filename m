Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 804E8A5AE5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:58:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZVt25MnzDqhT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ne/LrcnQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxT1B6JzDqdS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:34 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id 4so6707623pld.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8RMEy0Hn9HwQ4BJH9uqc9fzTLvTAbfVdcN1CDgOxO6c=;
 b=ne/LrcnQrPJgqgDo0eoMgqeiK8cAgDRPtzOMTwK7c2JKZq5qKI4sKu74mLIsnm+zp7
 znyBQ/Xd2KgohTR2GMfFFWpYA+DZBJWpIVhMGTl+HqmbE+LWf4Qkj8MRK8tvc9PQLUHj
 aPkvD0SRaMH6l79RLMcs7qDmt4oQ+CJzwxs+dNpeRSunW180qO07jMdMpRiY100VQwZD
 wAOa9twR7vKbkSlzTAGnJwjc1P+Nesn79G/PuHGd4/9MT1Mn258KqgIn54tZPfvrX0Gm
 F14diFyIpx7f1jXv4GlSIBaDQqqKPsQ+D/GXJ5G3fNcR2tDNTha6QpPnFIOiU6iJo6Qv
 aT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8RMEy0Hn9HwQ4BJH9uqc9fzTLvTAbfVdcN1CDgOxO6c=;
 b=MYh6yEx0cPqUV6gYYBzPRZtinXz9+Qhac+q1uJwZxkmImWMaZ0viOn85XdP+fzQt3j
 kfLGhcdzKRJMb/mstLQWruW7cw9Dq55tnwp8cHWtVUljpWCc/PGYmwvVy0lo6bXzds2K
 sBEh32Gu+ZeAlgZZ3uEcqJY6WZRVdrgX+7FXOfe6lUsEv+o3+LV1nb7COThwCCYPnx85
 NSn5m8BHgPyYTmrW6ZeJcKRbZGSbQVgHSlis4W6QZb6PI9/KgimlNC33eZBQdpi/FQcX
 iL659O+t1TFV9PFf1uqxjoC9J2HDOyIgjkx79GRTzPQbwshPaooJcyBMBx5wOKiGaZLG
 IuXA==
X-Gm-Message-State: APjAAAXHsTrSqh5qLyWzpqIgbP1fleZwr1YUYvHm3xizA1BfBjmDMftA
 1Bm7fGaYmK5PLNXJBPm4M+mOFXdapfc=
X-Google-Smtp-Source: APXvYqx57ZxAVQo93kSY3ScDrt/kCMqKD4MTEA5hTsJcVWb2Lr1JKBl0/Uyov5ku2LI0vOEZ6GamqQ==
X-Received: by 2002:a17:902:ff0c:: with SMTP id
 f12mr23869662plj.67.1567438350434; 
 Mon, 02 Sep 2019 08:32:30 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] Making tlbie optional for radix
Date: Tue,  3 Sep 2019 01:29:25 +1000
Message-Id: <20190902152931.17840-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a rebase of the series against the the powerpc next branch
with ultravisor changes. Main improvements are implementing and
splitting out the precursor patches better.

KVM still requires tlbie to run radix guests. A naive implementation
of tlbiel + IPI for LPID flushes was crashing so requires more
investigation.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/64s: remove register_process_table callback
  powerpc/64s/radix: tidy up TLB flushing code
  powerpc/64s: make mmu_partition_table_set_entry TLB flush optional
  powerpc/64s/pseries: radix flush translations before MMU is enabled at
    boot
  powerpc/64s: remove unnecessary translation cache flushes at boot
  powerpc/64s/radix: introduce options to disable use of the tlbie
    instruction

 .../admin-guide/kernel-parameters.txt         |   4 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   4 -
 .../include/asm/book3s/64/tlbflush-radix.h    |  12 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   9 +
 arch/powerpc/include/asm/mmu.h                |   2 +-
 arch/powerpc/kvm/book3s_hv.c                  |   6 +
 arch/powerpc/kvm/book3s_hv_nested.c           |   4 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |   8 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  72 ++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  45 +--
 arch/powerpc/mm/book3s64/radix_tlb.c          | 303 ++++++++++++------
 arch/powerpc/platforms/pseries/lpar.c         |  12 +-
 drivers/misc/cxl/main.c                       |   4 +
 drivers/misc/ocxl/main.c                      |   4 +
 14 files changed, 308 insertions(+), 181 deletions(-)

-- 
2.22.0

