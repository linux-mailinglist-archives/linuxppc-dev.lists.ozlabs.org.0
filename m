Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209039B37B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 08:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxDBT48Kmz3cBg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 16:58:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxD9h5J2nz2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 16:58:00 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FxD5B749vz63gb;
 Fri,  4 Jun 2021 14:54:06 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:53 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:52 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
Date: Fri, 4 Jun 2021 15:06:18 +0800
Message-ID: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-sh@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add setup_initial_init_mm() helper, then use it
to cleanup the text, data and brk setup code.

v2:
- change argument from "char *" to "void *" setup_initial_init_mm()
  suggested by Geert Uytterhoeven
- use NULL instead of (void *)0 on h8300 and m68k
- collect ACKs

Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-m68k@lists.linux-m68k.org
Cc: openrisc@lists.librecores.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Kefeng Wang (15):
  mm: add setup_initial_init_mm() helper
  arc: convert to setup_initial_init_mm()
  arm: convert to setup_initial_init_mm()
  arm64: convert to setup_initial_init_mm()
  csky: convert to setup_initial_init_mm()
  h8300: convert to setup_initial_init_mm()
  m68k: convert to setup_initial_init_mm()
  nds32: convert to setup_initial_init_mm()
  nios2: convert to setup_initial_init_mm()
  openrisc: convert to setup_initial_init_mm()
  powerpc: convert to setup_initial_init_mm()
  riscv: convert to setup_initial_init_mm()
  s390: convert to setup_initial_init_mm()
  sh: convert to setup_initial_init_mm()
  x86: convert to setup_initial_init_mm()

 arch/arc/mm/init.c                 | 5 +----
 arch/arm/kernel/setup.c            | 5 +----
 arch/arm64/kernel/setup.c          | 5 +----
 arch/csky/kernel/setup.c           | 5 +----
 arch/h8300/kernel/setup.c          | 5 +----
 arch/m68k/kernel/setup_mm.c        | 5 +----
 arch/m68k/kernel/setup_no.c        | 5 +----
 arch/nds32/kernel/setup.c          | 5 +----
 arch/nios2/kernel/setup.c          | 5 +----
 arch/openrisc/kernel/setup.c       | 5 +----
 arch/powerpc/kernel/setup-common.c | 5 +----
 arch/riscv/kernel/setup.c          | 5 +----
 arch/s390/kernel/setup.c           | 5 +----
 arch/sh/kernel/setup.c             | 5 +----
 arch/x86/kernel/setup.c            | 5 +----
 include/linux/mm_types.h           | 8 ++++++++
 16 files changed, 23 insertions(+), 60 deletions(-)

-- 
2.26.2

