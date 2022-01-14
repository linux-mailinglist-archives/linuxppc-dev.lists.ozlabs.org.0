Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4048E2E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 04:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZmcy6RKHz3cTw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 14:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pq4fzVnW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pq4fzVnW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZmcB1jd7z30RR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 14:14:17 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20E2rvfS008330; 
 Fri, 14 Jan 2022 03:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Dn5oECVEjEGAX8NTYdmcEw7ACz8sZLQqTGH/KQeCTIk=;
 b=pq4fzVnWeYj2ik3Zeo1EmaLWTYGg546luu3lrpNghqxo/GPIpvzx0xmtOoJPorCU5vUO
 wWxGtb2rMvssLMpYTm1KDxUMp9/bIm8J6fSE/bCvDsIR6M8OWQ9jAg2pvQ8etX/htg4S
 5bDfORhJY/xAP1qRHLjaF4BuKMPG9MQ+5EW9hL8wJ9EL7xjpa5ODJ4gZ19uMatnpmGD3
 ZxHAyMi8oEIYldjC/AYYsZ1X7zPoXCqLbxMSdMFgC9kTUnVU9XhzO+CZNLYRn2/4plpw
 4WIECmMBM05vnwpZRT+KbJEVwyCwfbaB0bKnPy9tPoo8RK7pdrDXwnXz6/z/xNmv1pzM 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dk0t009xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 03:14:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20E37nmm004350;
 Fri, 14 Jan 2022 03:14:09 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dk0t009xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 03:14:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20E3DdSJ031995;
 Fri, 14 Jan 2022 03:14:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3djq1mm20m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 03:14:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20E3E4Nh48497138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 03:14:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3317252050;
 Fri, 14 Jan 2022 03:14:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.120.106])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 71AC45204E;
 Fri, 14 Jan 2022 03:14:00 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix power_pmu_wants_prompt_pmi to be defined
 only for CONFIG_PPC64
Date: Fri, 14 Jan 2022 08:43:55 +0530
Message-Id: <20220114031355.87480-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -fxXjOzM58V_1lHji7JjWHg1bgWgZSha
X-Proofpoint-ORIG-GUID: HRRkW_ZmKx2jBVGjL7Jf8fM7vMDsbzWe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=923 spamscore=0
 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140018
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

power_pmu_wants_prompt_pmi is used to decide if PMI should
be taken prompt. This is valid only for ppc64 and is used
in CONFIG_PPC_BOOK3S_64 context. Hence include the function
under config check for PPC64

Fixes warning for 32-bit compilation:

>> arch/powerpc/perf/core-book3s.c:2455:6: warning: no previous prototype for 'power_pmu_wants_prompt_pmi' [-Wmissing-prototypes]
    2455 | bool power_pmu_wants_prompt_pmi(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 5a7745b96f43 ("powerpc/64s/perf: add power_pmu_wants_prompt_pmi to say whether perf wants PMIs to be soft-NMI")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
Note: Address compilation warning reported here:
 https://lore.kernel.org/lkml/202112220137.X16y07Dp-lkp@intel.com/ 
Patch is based on powerpc/merge

 arch/powerpc/perf/core-book3s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index a684901b6965..b7160fae58c6 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2452,6 +2452,7 @@ static void perf_event_interrupt(struct pt_regs *regs)
  * could possibly return false if only events are being counted rather than
  * samples being taken, but for now this is good enough.
  */
+#ifdef CONFIG_PPC64
 bool power_pmu_wants_prompt_pmi(void)
 {
 	struct cpu_hw_events *cpuhw;
@@ -2467,6 +2468,7 @@ bool power_pmu_wants_prompt_pmi(void)
 	cpuhw = this_cpu_ptr(&cpu_hw_events);
 	return cpuhw->n_events;
 }
+#endif
 
 static int power_pmu_prepare_cpu(unsigned int cpu)
 {
-- 
2.33.0

