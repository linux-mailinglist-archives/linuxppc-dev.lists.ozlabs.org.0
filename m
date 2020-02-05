Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59F15252F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 04:16:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48C6CR16PYzDq7j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 14:16:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C67G3qKQzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 14:12:22 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A0E227E85F07CB2E5BCB;
 Wed,  5 Feb 2020 10:56:36 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 5 Feb 2020
 10:56:26 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
Subject: [PATCH v2 0/6] implement KASLR for powerpc/fsl_booke/64
Date: Wed, 5 Feb 2020 10:55:21 +0800
Message-ID: <20200205025527.28640-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
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
Cc: Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a try to implement KASLR for Freescale BookE64 which is based on
my earlier implementation for Freescale BookE32:
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718

The implementation for Freescale BookE64 is similar as BookE32. One
difference is that Freescale BookE64 set up a TLB mapping of 1G during
booting. Another difference is that ppc64 needs the kernel to be
64K-aligned. So we can randomize the kernel in this 1G mapping and make
it 64K-aligned. This can save some code to creat another TLB map at
early boot. The disadvantage is that we only have about 1G/64K = 16384
slots to put the kernel in.

    KERNELBASE

          64K                     |--> kernel <--|
           |                      |              |
        +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
        |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
        +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
        |                         |                        1G
        |----->   offset    <-----|

                              kernstart_virt_addr

I'm not sure if the slot numbers is enough or the design has any
defects. If you have some better ideas, I would be happy to hear that.

Thank you all.

v1->v2:
  Add __kaslr_offset for the secondary cpu boot up.

Jason Yan (6):
  powerpc/fsl_booke/kaslr: refactor kaslr_legal_offset() and
    kaslr_early_init()
  powerpc/fsl_booke/64: introduce reloc_kernel_entry() helper
  powerpc/fsl_booke/64: implement KASLR for fsl_booke64
  powerpc/fsl_booke/64: do not clear the BSS for the second pass
  powerpc/fsl_booke/64: clear the original kernel if randomized
  powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst
    and add 64bit part

 .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 +++++++--
 arch/powerpc/Kconfig                          |  2 +-
 arch/powerpc/kernel/exceptions-64e.S          | 21 ++++++
 arch/powerpc/kernel/head_64.S                 | 14 ++++
 arch/powerpc/kernel/setup_64.c                |  4 +-
 arch/powerpc/mm/mmu_decl.h                    |  3 +-
 arch/powerpc/mm/nohash/kaslr_booke.c          | 71 +++++++++++++------
 7 files changed, 122 insertions(+), 28 deletions(-)
 rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)

-- 
2.17.2

