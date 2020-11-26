Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3912C51FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:27:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChYpk3JznzDrBk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:27:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rPfENJFj; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChYn26F9QzDr5h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:25:42 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id m9so1371754pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/H4fzWOIvjm0GlmUsGYa86Vm0aoa2RjL3rn0BPkvb0=;
 b=rPfENJFjyp69YINW/XU6ep/NQsTeTyY6FuwWqSfcOaKVWbvNWIT6kz2H5D0a47zvn3
 ssDwVSsrdvbhWjFsfpC2vyzG7lkdUtjtF8STHCBsY0fiN35SJZHhiN3JT/iOkWDG3X+p
 8+ijRQHT+3zdvyMcv3vBhliiHIBql6Q/Q3D61B+dk07dDevqnafhPkEE1+TCSlyYcYGr
 acOyiUnRcbC3b15pf4hmBytQE3VVbkqzcBJCqwSkwKPM9sKe9LsuXeMAljRSMyd1WKG5
 oWlXIjxWS34yxlIGODN9R7ySuUy3SxxhgYBqqFSRRJqv16gVcjL+Axa4VlRx0048/orQ
 20mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/H4fzWOIvjm0GlmUsGYa86Vm0aoa2RjL3rn0BPkvb0=;
 b=nmH+Mpc5D+E8ove2E+JxC0ttMMDkEio3CbOSab2ikYHHKueKBOdtduBLu33R28/NjY
 gKPYDcdPwPVO4LSTXMCJt0mFQYalkfUripvtgTU5F5fjc51+gPJzNpD0UMUPT7V6jGRs
 PQx8aFAW4K7PZbo/33LbZCrABmB1xOo9XXVK0SOSZQtHhG3ggSarOoYf5idMdixhNxcj
 Y7OfKIfv3FOW/E4xtYR8HIsvdssnWPvMBDimEYwx2krZsvqymOdE/RasZJlHS7wxLRTW
 +Hg5HQsziOVHejJ+M5vDgDGm5OEU7+l7Z2b70Ff9OMDHQqXRfbb9/JeNWHjnLU6VyjyP
 qQcA==
X-Gm-Message-State: AOAM533welh9EbEhFu8tWda1CVFydrot6oVE/ik8AFvHxswZDvv1Ou/3
 WbzY4MEZoQjdGtFL2dBxeHucLd/Ibjw=
X-Google-Smtp-Source: ABdhPJwR6VtQUgnvUw4OSH/8GtxzRt1jPG4ghue4eh2U/inWEl9yWVvM0yH2Vxir1XybGCewOQKjvg==
X-Received: by 2002:aa7:9387:0:b029:18b:42dd:41c with SMTP id
 t7-20020aa793870000b029018b42dd041cmr2204425pfe.60.1606386337889; 
 Thu, 26 Nov 2020 02:25:37 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id h7sm4338134pgr.33.2020.11.26.02.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 02:25:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc/64s: Fix for radix TLB invalidation bug
Date: Thu, 26 Nov 2020 20:25:26 +1000
Message-Id: <20201126102530.691335-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Milton Miller <miltonm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a tricky bug that was noticed by TLB multi-hits in a guest
stress testing CPU hotplug, but TLB invalidation means any kind of
data corruption is possible.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64s: Fix hash ISA v3.0 TLBIEL instruction generation
  powerpc/64s/pseries: Fix hash tlbiel_all_isa300 for guest kernels
  kernel/cpu: add arch override for clear_tasks_mm_cpumask() mm handling
  powerpc/64s: Trim offlined CPUs from mm_cpumasks

 arch/powerpc/include/asm/book3s/64/mmu.h     | 12 ++++++++++
 arch/powerpc/mm/book3s64/hash_native.c       | 23 +++++++++++++-------
 arch/powerpc/mm/book3s64/mmu_context.c       | 20 +++++++++++++++++
 arch/powerpc/platforms/powermac/smp.c        |  2 ++
 arch/powerpc/platforms/powernv/smp.c         |  3 +++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  3 +++
 kernel/cpu.c                                 |  6 ++++-
 7 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.23.0

