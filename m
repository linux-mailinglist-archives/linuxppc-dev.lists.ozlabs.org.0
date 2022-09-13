Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7A5B68FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRbJ74LNfz3chB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRbHM2ydBz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:50:37 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MRbDt2bnPzHns8;
	Tue, 13 Sep 2022 15:48:30 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 15:50:30 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<geoff@infradead.org>, <jk@ozlabs.org>, <arnd@arndb.de>, <clg@kaod.org>,
	<aik@ozlabs.ru>, <maciej.szmigiero@oracle.com>, <seanjc@google.com>,
	<jgg@ziepe.ca>, <willy@infradead.org>, <nick.child@ibm.com>,
	<bsingharora@gmail.com>, <michael@ellerman.id.au>,
	<arnd.bergmann@de.ibm.com>, <paulus@samba.org>, <benh@kernel.crashing.org>,
	<alistair@popple.id.au>, <miltonm@bga.com>, <Geert.Uytterhoeven@sonycom.com>,
	<geoffrey.levand@am.sony.com>, <yu.liu@freescale.com>,
	<scottwood@freescale.com>, <hollisb@us.ibm.com>, <avi@redhat.com>,
	<agraf@suse.de>, <cuigaosheng1@huawei.com>
Subject: [PATCH 0/9] Remove unused declarations for powerpc
Date: Tue, 13 Sep 2022 15:50:20 +0800
Message-ID: <20220913075029.682327-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series contains a few cleanup patches, to remove unused
declarations which have been removed. Thanks!

Gaosheng Cui (9):
  powerpc/xmon: remove unused ppc_parse_cpu() declaration
  powerpc/spufs: remove orphan declarations from spufs.h
  powerpc: remove unused chrp_event_scan() declaration
  powerpc: remove unused udbg_init_debug_beat() declaration
  powerpc/mm: remove orphan declarations from mmu_context.h
  powerpc/powernv: remove orphan declarations from opal.h
  powerpc/sysdev: remove unused xics_ipi_dispatch() declaration
  powerpc/ps3: remove orphan declarations from ps3av.h
  KVM: PPC: remove orphan declarations from kvm_ppc.h

 arch/powerpc/include/asm/kvm_ppc.h        | 4 ----
 arch/powerpc/include/asm/mmu_context.h    | 2 --
 arch/powerpc/include/asm/opal.h           | 6 ------
 arch/powerpc/include/asm/ps3av.h          | 2 --
 arch/powerpc/include/asm/udbg.h           | 1 -
 arch/powerpc/include/asm/xics.h           | 1 -
 arch/powerpc/platforms/cell/spufs/spufs.h | 2 --
 arch/powerpc/platforms/chrp/chrp.h        | 1 -
 arch/powerpc/xmon/ppc.h                   | 2 --
 9 files changed, 21 deletions(-)

-- 
2.25.1

