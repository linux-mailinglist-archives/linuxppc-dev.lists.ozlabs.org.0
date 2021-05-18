Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 966093876F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 12:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FktCX4Rjdz3byZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 20:53:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mediatek.com (client-ip=210.61.82.184;
 helo=mailgw02.mediatek.com; envelope-from=miles.chen@mediatek.com;
 receiver=<UNKNOWN>)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Fkrhf2L1Gz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 19:45:22 +1000 (AEST)
X-UUID: c8d085b27e6f43a3b8daca99f7e1c1a8-20210518
X-UUID: c8d085b27e6f43a3b8daca99f7e1c1a8-20210518
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1650008695; Tue, 18 May 2021 17:40:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 17:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 May 2021 17:40:08 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal
 <vgoyal@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Mike
 Rapoport <rppt@kernel.org>
Subject: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
Date: Tue, 18 May 2021 17:24:44 +0800
Message-ID: <20210518092446.16382-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Tue, 18 May 2021 20:53:09 +1000
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
Cc: linux-doc@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patches is created to fix the __pa() warning messages when
CONFIG_DEBUG_VIRTUAL=y by unifying the allocation of pglist_data
instances.

In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
pglist_data is allocated by a memblock API. If CONFIG_NEED_MULTIPLE_NODES=n,
we use a global variable named "contig_page_data".

If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both
allocation and symbol cases. But if CONFIG_DEBUG_VIRTUAL is set,
we will have the "virt_to_phys used for non-linear address" warning
when booting.

To fix the warning, always allocate pglist_data by memblock APIs and
remove the usage of contig_page_data.

Warning message:
[    0.000000] ------------[ cut here ]------------
[    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : __virt_to_phys+0x58/0x68
[    0.000000] lr : __virt_to_phys+0x54/0x68
[    0.000000] sp : ffff800011833e70
[    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
[    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
[    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
[    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
[    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
[    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
[    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
[    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
[    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
[    0.000000] Call trace:
[    0.000000]  __virt_to_phys+0x58/0x68
[    0.000000]  check_usemap_section_nr+0x50/0xfc
[    0.000000]  sparse_init_nid+0x1ac/0x28c
[    0.000000]  sparse_init+0x1c4/0x1e0
[    0.000000]  bootmem_init+0x60/0x90
[    0.000000]  setup_arch+0x184/0x1f0
[    0.000000]  start_kernel+0x78/0x488
[    0.000000] ---[ end trace f68728a0d3053b60 ]---

[1] https://lore.kernel.org/patchwork/patch/1425110/

Change since v1:
- use memblock_alloc() to create pglist_data when CONFIG_NUMA=n

Miles Chen (2):
  mm: introduce prepare_node_data
  mm: replace contig_page_data with node_data

 Documentation/admin-guide/kdump/vmcoreinfo.rst | 13 -------------
 arch/powerpc/kexec/core.c                      |  5 -----
 include/linux/gfp.h                            |  3 ---
 include/linux/mm.h                             |  2 ++
 include/linux/mmzone.h                         |  4 ++--
 kernel/crash_core.c                            |  1 -
 mm/memblock.c                                  |  3 +--
 mm/page_alloc.c                                | 16 ++++++++++++++++
 mm/sparse.c                                    |  2 ++
 9 files changed, 23 insertions(+), 26 deletions(-)


base-commit: 8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
-- 
2.18.0

