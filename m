Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92027523B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 09:21:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx8k759bnzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 17:21:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=wangwensheng4@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx8fW4V7CzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 17:18:10 +1000 (AEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0D831B5F63FC6E501F08;
 Wed, 23 Sep 2020 15:17:45 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 15:17:35 +0800
From: Wang Wensheng <wangwensheng4@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <atrajeev@linux.vnet.ibm.com>, <maddy@linux.ibm.com>,
 <wangwensheng4@huawei.com>, <anju@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v2] powerpc/perf: Fix symbol undeclared warning
Date: Wed, 23 Sep 2020 07:14:53 +0000
Message-ID: <20200923071453.2540-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
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
Cc: rui.xiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Build kernel with `C=2`:
arch/powerpc/perf/isa207-common.c:24:18: warning: symbol
'isa207_pmu_format_attr' was not declared. Should it be static?
arch/powerpc/perf/power9-pmu.c:101:5: warning: symbol 'p9_dd21_bl_ev'
was not declared. Should it be static?
arch/powerpc/perf/power9-pmu.c:115:5: warning: symbol 'p9_dd22_bl_ev'
was not declared. Should it be static?

Those symbols are used only in the files that define them so we declare
them as static to fix the warnings.

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 arch/powerpc/perf/isa207-common.c | 2 +-
 arch/powerpc/perf/power9-pmu.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 964437adec18..85dc860b265b 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -21,7 +21,7 @@ PMU_FORMAT_ATTR(thresh_stop,	"config:32-35");
 PMU_FORMAT_ATTR(thresh_start,	"config:36-39");
 PMU_FORMAT_ATTR(thresh_cmp,	"config:40-49");
 
-struct attribute *isa207_pmu_format_attr[] = {
+static struct attribute *isa207_pmu_format_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_pmcxsel.attr,
 	&format_attr_mark.attr,
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 2a57e93a79dc..4a315fad1f99 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -98,7 +98,7 @@ extern u64 PERF_REG_EXTENDED_MASK;
 /* PowerISA v2.07 format attribute structure*/
 extern struct attribute_group isa207_pmu_format_group;
 
-int p9_dd21_bl_ev[] = {
+static int p9_dd21_bl_ev[] = {
 	PM_MRK_ST_DONE_L2,
 	PM_RADIX_PWC_L1_HIT,
 	PM_FLOP_CMPL,
@@ -112,7 +112,7 @@ int p9_dd21_bl_ev[] = {
 	PM_DISP_HELD_SYNC_HOLD,
 };
 
-int p9_dd22_bl_ev[] = {
+static int p9_dd22_bl_ev[] = {
 	PM_DTLB_MISS_16G,
 	PM_DERAT_MISS_2M,
 	PM_DTLB_MISS_2M,
-- 
2.25.0

