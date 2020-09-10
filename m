Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9313265287
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:19:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnWxF67XtzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnWYy0yPczDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:03:01 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 66D9559C2E58;
 Thu, 10 Sep 2020 23:02:56 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Sep
 2020 23:02:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005bef2e0af-7bb4-4c13-93ec-1b8aab30c13b,
 8FE11AEDAF16247B821E16C08928A26F58BE1972) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 6/7] powerpc/perf: Fix W=1 compile warning
Date: Thu, 10 Sep 2020 23:02:49 +0200
Message-ID: <20200910210250.1962595-7-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200910210250.1962595-1-clg@kaod.org>
References: <20200910210250.1962595-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2d7c2a24-98f4-412a-887f-1b64b81d7128
X-Ovh-Tracer-Id: 10700271241053178848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CC      arch/powerpc/perf/imc-pmu.o
../arch/powerpc/perf/imc-pmu.c: In function ‘trace_imc_event_init’:
../arch/powerpc/perf/imc-pmu.c:1429:22: error: variable ‘target’ set but not used [-Werror=unused-but-set-variable]
  struct task_struct *target;
                      ^~~~~~

Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/perf/imc-pmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 62d0b54086f8..9ed4fcccf8a9 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1426,8 +1426,6 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 
 static int trace_imc_event_init(struct perf_event *event)
 {
-	struct task_struct *target;
-
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
 
@@ -1458,7 +1456,6 @@ static int trace_imc_event_init(struct perf_event *event)
 	mutex_unlock(&imc_global_refc.lock);
 
 	event->hw.idx = -1;
-	target = event->hw.target;
 
 	event->pmu->task_ctx_nr = perf_hw_context;
 	event->destroy = reset_global_refc;
-- 
2.25.4

