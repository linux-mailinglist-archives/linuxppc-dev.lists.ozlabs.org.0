Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5003595FD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 09:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGpwd1jgsz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 17:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=pulehui@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGpwF6FwCz30BM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 17:02:05 +1000 (AEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGpsW3GSXz1BGM9;
 Fri,  9 Apr 2021 14:59:43 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 15:01:46 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <jniethe5@gmail.com>, <alistair@popple.id.au>, <ravi.bangoria@linux.ibm.com>, 
 <pmladek@suse.com>, <john.ogness@linutronix.de>, <npiggin@gmail.com>,
 <christophe.leroy@csgroup.eu>, <rppt@kernel.org>, <maddy@linux.ibm.com>
Subject: [PATCH -next] powerpc/xmon: Make symbol 'spu_inst_dump' static
Date: Fri, 9 Apr 2021 15:01:51 +0800
Message-ID: <20210409070151.163424-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.98]
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
Cc: zhangjinhao2@huawei.com, yangjihong1@huawei.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix sparse warning:

arch/powerpc/xmon/xmon.c:4216:1: warning:
 symbol 'spu_inst_dump' was not declared. Should it be static?

This symbol is not used outside of xmon.c, so make it static.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/powerpc/xmon/xmon.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index bf7d69625a2e..d4ae2a25781f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -4212,8 +4212,7 @@ static void dump_spu_fields(struct spu *spu)
 	DUMP_FIELD(spu, "0x%p", pdata);
 }
 
-int
-spu_inst_dump(unsigned long adr, long count, int praddr)
+static int spu_inst_dump(unsigned long adr, long count, int praddr)
 {
 	return generic_inst_dump(adr, count, praddr, print_insn_spu);
 }
-- 
2.17.1

