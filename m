Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B55630C2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 11:55:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ9YR4mpQz3dw1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 19:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=wangdeming@inspur.com; receiver=<UNKNOWN>)
X-Greylist: delayed 517 seconds by postgrey-1.36 at boromir; Fri, 01 Jul 2022 19:54:59 AEST
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ9Xz1RKhz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 19:54:55 +1000 (AEST)
Received: from ([60.208.111.195])
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id WIW00101;
        Fri, 01 Jul 2022 17:46:01 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.9; Fri, 1 Jul 2022 17:46:05 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Fix formatting problems to make code look more beautiful
Date: Fri, 1 Jul 2022 05:45:53 -0400
Message-ID: <20220701094553.1722-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 20227011746015071030bb3701dfeb457290dce6ab190
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: Deming Wang <wangdeming@inspur.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Operators should be separated by spaces in tce_buildmulti_pSeriesLP

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index fba64304e859..d09c8bb06e5b 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -248,7 +248,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		 * Set up the page with TCE data, looping through and setting
 		 * the values.
 		 */
-		limit = min_t(long, npages, 4096/TCE_ENTRY_SIZE);
+		limit = min_t(long, npages, 4096 / TCE_ENTRY_SIZE);
 
 		for (l = 0; l < limit; l++) {
 			tcep[l] = cpu_to_be64(proto_tce | rpn << tceshift);
-- 
2.27.0

