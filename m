Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9B997B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 17:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DnvF6c6wzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 01:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DnS858g9zDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 00:47:18 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EEFB67D1A43D9EF16AEE;
 Thu, 22 Aug 2019 22:47:13 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 22 Aug 2019
 22:47:03 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <leitao@debian.org>, <nayna@linux.ibm.com>, <pfsmorigo@gmail.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>
Subject: [PATCH -next] crypto: nx - remove unused variables 'nx_driver_string'
 and 'nx_driver_version'
Date: Thu, 22 Aug 2019 22:46:49 +0800
Message-ID: <20190822144649.19880-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/crypto/nx/nx.h:12:19: warning:
 nx_driver_string defined but not used [-Wunused-const-variable=]
drivers/crypto/nx/nx.h:13:19: warning:
 nx_driver_version defined but not used [-Wunused-const-variable=]

They are never used, so just remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/crypto/nx/nx.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
index c6b5a3b..7ecca16 100644
--- a/drivers/crypto/nx/nx.h
+++ b/drivers/crypto/nx/nx.h
@@ -9,9 +9,6 @@
 #define NX_STRING	"IBM Power7+ Nest Accelerator Crypto Driver"
 #define NX_VERSION	"1.0"
 
-static const char nx_driver_string[] = NX_STRING;
-static const char nx_driver_version[] = NX_VERSION;
-
 /* a scatterlist in the format PHYP is expecting */
 struct nx_sg {
 	u64 addr;
-- 
2.7.4


