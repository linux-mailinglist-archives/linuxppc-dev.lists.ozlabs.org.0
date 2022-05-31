Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F70538D97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 11:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC6Gr2TmBz3bt8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 19:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=meizu.com (client-ip=157.122.146.251; helo=mail.meizu.com; envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
X-Greylist: delayed 67 seconds by postgrey-1.36 at boromir; Tue, 31 May 2022 19:21:15 AEST
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC6GM6Mn9z3000
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 19:21:15 +1000 (AEST)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 May
 2022 17:19:53 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 May
 2022 17:19:51 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc/papr_scm: use dev_get_drvdata
Date: Tue, 31 May 2022 17:19:50 +0800
Message-ID: <1653988790-19999-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linuxppc-dev@lists.ozlabs.org, Haowen Bai <baihaowen@meizu.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eliminate direct accesses to the driver_data field.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 181b855b3050..4e793e6e7d11 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -354,7 +354,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
 {
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
-	struct papr_scm_priv *p = (struct papr_scm_priv *)dev->driver_data;
+	struct papr_scm_priv *p = dev_get_drvdata(dev);
 	int rc, size;
 
 	/* Allocate request buffer enough to hold single performance stat */
-- 
2.7.4

