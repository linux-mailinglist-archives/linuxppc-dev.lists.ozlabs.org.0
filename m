Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B33B81A2BF6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 00:42:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yK6k3r6CzDrBY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:42:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yJyw5XPGzDr58
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 08:36:08 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038MZ2TD133971; Wed, 8 Apr 2020 18:36:02 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309202kdg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:36:02 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038MZZfK010744;
 Wed, 8 Apr 2020 22:36:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3091mdtndh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 22:36:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038MZxrs49349068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 22:35:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B65547805F;
 Wed,  8 Apr 2020 22:35:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 074A47805E;
 Wed,  8 Apr 2020 22:35:58 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.85.206.148])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 22:35:57 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] selftests/powerpc: ensure PMC reads are set and ordered
 on count_pmc
Date: Wed,  8 Apr 2020 19:35:43 -0300
Message-Id: <20200408223543.21168-4-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200408223543.21168-1-desnesn@linux.ibm.com>
References: <20200408223543.21168-1-desnesn@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-08_09:2020-04-07,
 2020-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=853 spamscore=0
 suspectscore=1 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080152
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
Cc: desnesn@linux.ibm.com, shuah@kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function count_pmc() needs a memory barrier to ensure that PMC reads are
fully consistent. The lack of it can occasionally fail pmc56_overflow test,
since depending on the workload on the system, PMC5 & 6 can have past val-
ues from the time the counters are frozen and turned back on. These past
values will be accounted as overflows and make the test fail.

=========
test: pmc56_overflow
...
ebb_state:
...
>>pmc[5] count = 0xfd4cbc8c
>>pmc[6] count = 0xddd8b3b6
HW state:
MMCR0 0x0000000084000000 FC PMAE
MMCR2 0x0000000000000000
EBBHR 0x0000000010003f68
BESCR 0x8000000000000000 GE
...
PMC5  0x0000000000000000
PMC6  0x0000000000000000
SIAR  0x0000000010003398
...
  [3]: register SPRN_PMC2  = 0x0000000080000003
  [4]: register SPRN_PMC5  = 0x0000000000000000
  [5]: register SPRN_PMC6  = 0x0000000000000000
  [6]: register SPRN_PMC2  = 0x0000000080000003
>>[7]: register SPRN_PMC5  = 0x000000008f21266d
>>[8]: register SPRN_PMC6  = 0x000000000da80f8d
  [9]: register SPRN_PMC2  = 0x0000000080000003
>>[10]: register SPRN_PMC5  = 0x000000006e2b961f
>>[11]: register SPRN_PMC6  = 0x00000000d030a429
  [12]: register SPRN_PMC2  = 0x0000000080000003
  [13]: register SPRN_PMC5  = 0x0000000000000000
  [14]: register SPRN_PMC6  = 0x0000000000000000
...
PMC5/6 overflow 2
[FAIL] Test FAILED on line 87
failure: pmc56_overflow
=========

Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
---
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
index bf6f25dfcf7b..6199f3cea0f9 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
@@ -258,6 +258,10 @@ int count_pmc(int pmc, uint32_t sample_period)
 	start_value = pmc_sample_period(sample_period);
 
 	val = read_pmc(pmc);
+
+	/* Ensure pmc value is consistent between freezes */
+	mb();
+
 	if (val < start_value)
 		ebb_state.stats.negative++;
 	else
-- 
2.21.1

