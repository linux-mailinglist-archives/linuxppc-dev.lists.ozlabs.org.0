Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E473F8501
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 12:05:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwJPH50jtz2yPd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 20:05:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LxNfaSUU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LxNfaSUU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwJNY0lXPz2xs3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:04:28 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QA2Wn2141375; Thu, 26 Aug 2021 06:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=t9ZzEvTVDYyFQRJ1/YVPpWwM5KjUvsZTD1KbInLsSNw=;
 b=LxNfaSUU5kmMZvCVczhTBUumnjlebnOPfznsFrdl4Xyn0AehnFHl31aZTGSDfy2P4Rjp
 J4us6bvHx1DrqasCdjUB7j7g0Im7G0FGlh2U7usa6ebtp0msVfYqLiH4Q8zqZPQwa60J
 73kc5RoNvgroxgaZLHh3P3RO2YOEAkTuCjBHCotm+ulZDEJ89smdtF/jTgK4wPz+iU4A
 YwqLu0NmPbfuvlbyrXBXovYvRJ84XW3gQN5lLgWM5m+ffmrHh/C4lYHrRoc3OuTuzmDn
 5JQwDlyEIKmuNqOatyHaceiUdgEu77e5L9q5maxJ+MyHLnz/FBEX73AuFigt68moRP2m 4Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap8tv82nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 06:04:12 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QA32s1010998;
 Thu, 26 Aug 2021 10:04:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3ajs4914kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 10:04:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17QA47lj54591866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 10:04:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 886F752071;
 Thu, 26 Aug 2021 10:04:07 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.43.205])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BAED252078;
 Thu, 26 Aug 2021 10:04:04 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/3] powerpc/smp: Misc fixes
Date: Thu, 26 Aug 2021 15:33:58 +0530
Message-Id: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sqeNkA5HNTnVFdSK5z5nrklGgxiN1esp
X-Proofpoint-GUID: sqeNkA5HNTnVFdSK5z5nrklGgxiN1esp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_02:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=446 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260061
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog : v1 -> v2:
v1: https://lore.kernel.org/linuxppc-dev/20210821092419.167454-1-srikar@linux.vnet.ibm.com/t/#u``
[ patch 1: Updated to use DIV_ROUND_UP instead of max to handle more situations ]
[ patch 2: updated changelog to make it more generic powerpc issue ]

The 1st patch fixes a regression which causes a crash when booted with
nr_cpus=2.

The 2nd patch fixes a regression where lscpu on PowerVM reports more
number of sockets that are available.

The 3rd patch updates the fallback when L2-cache properties are not
explicitly exposed to be the cpu_sibling_mask.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>

Srikar Dronamraju (3):
  powerpc/smp: Fix a crash while booting kvm guest with nr_cpus=2
  powerpc/smp: Update cpu_core_map on all PowerPc systems
  powerpc/smp: Enable CACHE domain for shared processor

 arch/powerpc/kernel/smp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.18.2

