Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174939C4DE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 03:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxj7g702Yz30BM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 11:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N0fg6MCu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N0fg6MCu; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxj7D2g8lz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 11:42:30 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so6847075pjq.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 18:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HN/yxlFRhCXI2lz6pRuRsVES8dA6IrWBhzB/BkiqJsM=;
 b=N0fg6MCuH9s4HsYj1nxf2+QZ+2ZtLPsunpN49Xp5z9VUsR5/shhK52a/meE/srVFid
 ft3AwOKvuTu/Ow2IgqFiVkW+hUu4T7Ionoz8cv1WWEoa5akwrzvX7R5m2v5rgExT+PF/
 80Sawjo8WzzUNSO196wSDIAJeVG//SnGL/MQYgOknM38h4n7joShRzKzbxANFS1n4ErI
 0waMLNoO0AdM0p+GbsvLSeQQaM3zAG+RNT/VsygJupHzRbiVdrvw3HkJXTiRWHSSZE2N
 SYuLVx7C6U51dFDBdLP7UeYGg5fDNixmKSsgJtcyUcv3cfd2uaIt1Nmq+H0oB3m4TYVt
 wCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HN/yxlFRhCXI2lz6pRuRsVES8dA6IrWBhzB/BkiqJsM=;
 b=s41B3Eg864JePWHrM7iVFNIBAbHAvcs+6eVJadfqXUyr8r//oxfoDvlIuQWCff8lwv
 BJKKNa1OxNYXyLTtz4CHtEDDqO4/05GRa0IG/fYgQ/Lc0wPPHWeu1rQlD9h6EhES8gcG
 G5hbIy2RxTPQhDuYHkOYKcXDVMomVNknTU9Py/k+I76nGzX+neWKHAcQKfBpJ+A4OB6j
 aKYkLkQ+rvRPJUkhPWSVPR7HZziTucLdK/nW33uLJdZy+OQI3ANuO+qHuuiZgLaIAmbG
 /AlNa4LRZusYXu7YpUlXuu/uhO/tOcetwRRZc7JsQX/EUUHvBgtX21BTU1HN9EVyoy/c
 q/7w==
X-Gm-Message-State: AOAM531KYVHYjPhuD8rBx8igX0TH+dFSCOsoioWe4RSyV3HvcJyjsmNO
 eqKLb4fzIAx/8nEKZLwqvAY=
X-Google-Smtp-Source: ABdhPJzIPBaIsLM9CINwZgXyOGPdZc74cQHpiU2KKEGygcnKSh9Gm9bVFr7pTSjQUx6UdhKyvKVXDg==
X-Received: by 2002:a17:902:eccb:b029:106:def0:2717 with SMTP id
 a11-20020a170902eccbb0290106def02717mr7216193plh.66.1622857346021; 
 Fri, 04 Jun 2021 18:42:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q68sm5779056pjq.45.2021.06.04.18.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 18:42:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 0/4] shoot lazy tlbs
Date: Sat,  5 Jun 2021 11:42:12 +1000
Message-Id: <20210605014216.446867-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The additional unused config option was a valid criticism, so this now
purely just toggles refcounting of the lazy tlb mm.

Thanks,
Nick

Since v3:
- Removed the extra config option, MMU_LAZY_TLB=n. This can be
  resurrected if an arch wants it.

Nicholas Piggin (4):
  lazy tlb: introduce lazy mm refcount helper functions
  lazy tlb: allow lazy tlb mm refcounting to be configurable
  lazy tlb: shoot lazies, a non-refcounting lazy tlb option
  powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN

 arch/Kconfig                         | 17 ++++++++++
 arch/arm/mach-rpc/ecard.c            |  2 +-
 arch/powerpc/Kconfig                 |  1 +
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c |  4 +--
 fs/exec.c                            |  4 +--
 include/linux/sched/mm.h             | 20 +++++++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/fork.c                        | 51 ++++++++++++++++++++++++++++
 kernel/kthread.c                     | 11 +++---
 kernel/sched/core.c                  | 35 +++++++++++++------
 kernel/sched/sched.h                 |  4 ++-
 13 files changed, 132 insertions(+), 23 deletions(-)

-- 
2.23.0

