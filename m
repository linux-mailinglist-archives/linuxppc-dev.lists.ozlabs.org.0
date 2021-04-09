Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F5359885
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGsbR4BcLz3c5s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=cuibixuan@huawei.com; receiver=<UNKNOWN>)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGsZm3g1yz30Cs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:02:07 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGsXY4WQXzlWHR;
 Fri,  9 Apr 2021 17:00:13 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:01:53 +0800
From: Bixuan Cui <cuibixuan@huawei.com>
To: <cuibixuan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, "Gautham
 R. Shenoy" <ego@linux.vnet.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Subject: [PATCH -next] powerpc/pseries/pmem: Make symbol 'drc_pmem_match'
 static
Date: Fri, 9 Apr 2021 17:01:14 +0800
Message-ID: <20210409090114.59396-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sparse tool complains as follows:

arch/powerpc/platforms/pseries/pmem.c:142:27: warning:
 symbol 'drc_pmem_match' was not declared. Should it be static?

This symbol is not used outside of pmem.c, so this
commit marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 arch/powerpc/platforms/pseries/pmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index e1dc5d3254df..439ac72c2470 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -139,7 +139,7 @@ int dlpar_hp_pmem(struct pseries_hp_errorlog *hp_elog)
 	return rc;
 }
 
-const struct of_device_id drc_pmem_match[] = {
+static const struct of_device_id drc_pmem_match[] = {
 	{ .type = "ibm,persistent-memory", },
 	{}
 };

