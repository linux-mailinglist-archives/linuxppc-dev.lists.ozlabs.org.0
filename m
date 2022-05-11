Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F85228F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 03:28:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyck36C6tz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 11:28:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=meizu.com (client-ip=14.29.68.187; helo=mail.meizu.com;
 envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
Received: from mail.meizu.com (unknown [14.29.68.187])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kycjg3CKhz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 11:28:03 +1000 (AEST)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 11 May
 2022 09:27:59 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 May
 2022 09:27:58 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <tyreld@linux.ibm.com>
Subject: [PATCH V2] powerpc/eeh: Drop redundant spinlock initialization
Date: Wed, 11 May 2022 09:27:56 +0800
Message-ID: <1652232476-9696-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <08d9470c-20db-52b8-7015-84f0ed29ad0c@linux.ibm.com>
References: <08d9470c-20db-52b8-7015-84f0ed29ad0c@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
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
Cc: baihaowen@meizu.com, linux-kernel@vger.kernel.org, oohall@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

slot_errbuf_lock has declared and initialized by DEFINE_SPINLOCK,
so we don't need to spin_lock_init again, drop it.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
V1->V2: update comment

 arch/powerpc/platforms/pseries/eeh_pseries.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index f9af879c0222..abf0b577d055 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -847,8 +847,7 @@ static int __init eeh_pseries_init(void)
 		return -EINVAL;
 	}
 
-	/* Initialize error log lock and size */
-	spin_lock_init(&slot_errbuf_lock);
+	/* Initialize error log size */
 	eeh_error_buf_size = rtas_token("rtas-error-log-max");
 	if (eeh_error_buf_size == RTAS_UNKNOWN_SERVICE) {
 		pr_info("%s: unknown EEH error log size\n",
-- 
2.7.4

