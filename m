Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8628BB8E06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 11:48:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZTRx0GBszF3RC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 19:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZSxY3bzgzF1Hj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 19:25:37 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 94655D4E98180711ED44;
 Fri, 20 Sep 2019 17:25:34 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Sep 2019
 17:25:26 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [PATCH v7 11/12] powerpc/fsl_booke/kaslr: export offset in VMCOREINFO
 ELF notes
Date: Fri, 20 Sep 2019 17:45:45 +0800
Message-ID: <20190920094546.44948-12-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190920094546.44948-1-yanaijie@huawei.com>
References: <20190920094546.44948-1-yanaijie@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com, oss@buserror.net,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Like all other architectures such as x86 or arm64, include KASLR offset
in VMCOREINFO ELF notes to assist in debugging. After this, we can use
crash --kaslr option to parse vmcore generated from a kaslr kernel.

Note: The crash tool needs to support --kaslr too.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
Cc: Diana Craciun <diana.craciun@nxp.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/machine_kexec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
index c4ed328a7b96..078fe3d76feb 100644
--- a/arch/powerpc/kernel/machine_kexec.c
+++ b/arch/powerpc/kernel/machine_kexec.c
@@ -86,6 +86,7 @@ void arch_crash_save_vmcoreinfo(void)
 	VMCOREINFO_STRUCT_SIZE(mmu_psize_def);
 	VMCOREINFO_OFFSET(mmu_psize_def, shift);
 #endif
+	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
 }
 
 /*
-- 
2.17.2

