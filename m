Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A34396D9B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 08:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvND90dPMz302l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 16:53:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hisilicon.com (client-ip=45.249.212.187;
 helo=szxga01-in.huawei.com; envelope-from=zhangshaokun@hisilicon.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 972 seconds by postgrey-1.36 at boromir;
 Tue, 01 Jun 2021 16:53:26 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvNCp6cWlz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 16:53:22 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FvMlT49QGzWqM5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 14:32:21 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 14:36:37 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 14:36:37 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Remove the repeated declaration
Date: Tue, 1 Jun 2021 14:36:25 +0800
Message-ID: <1622529385-5938-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function 'event_ebb_init' and 'event_leader_ebb_init' are declared
twice in the header file, so remove the repeated declaration.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 tools/testing/selftests/powerpc/pmu/ebb/ebb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.h b/tools/testing/selftests/powerpc/pmu/ebb/ebb.h
index b5bc2b616075..2c803b5b48d6 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.h
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.h
@@ -55,8 +55,6 @@ void ebb_global_disable(void);
 bool ebb_is_supported(void);
 void ebb_freeze_pmcs(void);
 void ebb_unfreeze_pmcs(void);
-void event_ebb_init(struct event *e);
-void event_leader_ebb_init(struct event *e);
 int count_pmc(int pmc, uint32_t sample_period);
 void dump_ebb_state(void);
 void dump_summary_ebb_state(void);
-- 
2.7.4

