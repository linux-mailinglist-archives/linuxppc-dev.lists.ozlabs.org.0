Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9419D793
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:28:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v13V0xJhzDrVn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P/QJjAMf; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11J682gzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:26:44 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id t4so2675699plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vn7Em6Z0BXPDGNXBPr8b4cQGyK1HyY9xP1okBIiqESs=;
 b=P/QJjAMfDlKTH+nyiY0KpCYS/GQTZcOJwsPQZQGVZnngvXen+8bvnLT/k/UxwU0pJ2
 g4/I+FsPsDODelxM9B6IDBY3ie/PqFkZ07yNS1rELswrKDuNDh0MmhYgK+xYvCuzqhQJ
 NkOZyWYRPUUj8i+yltVkWWE6SUfdvqcota+I7R7DsYazznAHwj9dtjHKG2o+ntS2sZaI
 REMuqOySpYsF2B2dyThHT/6fqxyOsx9vXpEIQ+BGC65vGg9wwXL0BrU4uv0SPa4jsi68
 pHi4Hab/J/t4XcMtXdY5tWupdNZzLE9b3gY6wwPojEWHSBFMEvvVXPt4SDO45CIU5v8f
 aegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vn7Em6Z0BXPDGNXBPr8b4cQGyK1HyY9xP1okBIiqESs=;
 b=QzyWFIBfllKMqS/Xm16cGdAnO5DVP8WMqW+AuHFMAii5UzhfJ/8sYdHzOWdLWaije6
 i+lrZOsNpnz/vUNey2q96ZrsdT/ZPr4DuNVzlP7MrtxhwiAd1mvwp852IEYP7I1GCvH8
 zYTXzkuzLTz7SM/ZfJka90U0odlbIUClYGcMNB/ETj2gUT+DWkbIPMiapoQFLPk1YZIa
 6VtnP0sxTNlyoILCcVOVoqgLja9kJvARwGcAYvYycqqnvAkFAWuGgNy2xAJBiMIUswe8
 hypEcsaGZZy4eb1VF4GfAiUgpIRpRACLtPFYNRHFpXe1Gw9ntiryA7AWSEHbdNlszxnr
 BM3Q==
X-Gm-Message-State: AGi0PuZCHFaPYBEZo2yX0EOQHxFTOOf0RMy5su4j7v64YhpUvjCP03lA
 Ee3/hsYDZmSYucK8r/N/vhf9FtIZ
X-Google-Smtp-Source: APiQypK/NGJexhuvP0dMq1DiHpdXqD4890gHP+xDp1+91FEt9EF/zh+SNWaV9oxG77RIXJ4pLfPZsQ==
X-Received: by 2002:a17:902:bd85:: with SMTP id
 q5mr8101597pls.326.1585920400835; 
 Fri, 03 Apr 2020 06:26:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:26:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/14] powerpc/64: machine check and system reset fixes
Date: Fri,  3 Apr 2020 23:26:08 +1000
Message-Id: <20200403132622.130394-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a bunch of problems we hit bringing up fwnmi sreset and testing
with mce injection on QEMU. Mostly pseries issues.

This series of fixes applies on top of next-test, the machine
check reconcile patch won't apply cleanly to previous kernels but
it might want to be backported. We can do that after upstreaming.

This doesn't solve all known problems yet, but fwnmi machine check
and system reset injection in QEMU is significantly better. There
will be more to come but these should be ready for review now.

Thanks,
Nick

v2:
- Added a couple more fixes
- Review comments and tags
- Re-tested with some fixes to my qemu machine check injection patches


Nicholas Piggin (14):
  powerpc/64s/exception: Fix machine check no-loss idle wakeup
  powerpc/64s/exceptions: Fix in_mce accounting in unrecoverable path
  powerpc/64s/exceptions: Change irq reconcile for NMIs from reusing
    _DAR to RESULT
  powerpc/64s/exceptions: machine check reconcile irq state
  powerpc/pseries/ras: avoid calling rtas_token in NMI paths
  powerpc/pseries/ras: FWNMI_VALID off by one
  powerpc/pseries/ras: fwnmi avoid modifying r3 in error case
  powerpc/pseries/ras: fwnmi sreset should not interlock
  powerpc/pseries: limit machine check stack to 4GB
  powerpc/pseries: machine check use rtas_call_unlocked with args on
    stack
  powerpc/64s: machine check interrupt update NMI accounting
  powerpc/64s: machine check do not trace real-mode handler
  powerpc/64s: system reset do not trace
  powerpc: make unrecoverable NMIs die instead of panic

 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/kernel/exceptions-64s.S   | 47 ++++++++++++++-----
 arch/powerpc/kernel/mce.c              | 13 +++++-
 arch/powerpc/kernel/process.c          |  2 +-
 arch/powerpc/kernel/setup_64.c         | 17 ++++++-
 arch/powerpc/kernel/traps.c            | 24 ++++------
 arch/powerpc/platforms/pseries/ras.c   | 62 +++++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c | 13 ++++--
 8 files changed, 131 insertions(+), 48 deletions(-)

-- 
2.23.0

