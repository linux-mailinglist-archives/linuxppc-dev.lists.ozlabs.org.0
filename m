Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28265AC9AC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 06:55:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLbn64DFdz30By
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 14:55:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AiwutqEP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AiwutqEP;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLbmP6lflz2xjl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 14:55:01 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2853qmnX018055;
	Mon, 5 Sep 2022 04:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=i5EpblQSbOUqNFYTc2V6KR2nrpdpilQ94YWgIpRfy0Y=;
 b=AiwutqEPJWuXBR5I1I0e8wql9bIQ1tow+pzJyt0Und4101PnhOaBp8+FZyAR9ibrKjqA
 LuMfwlp6X8+t9gVKhvtzaZzIvIywqTEkvSVwkI5uMVXhs8MU4wgj60x6iXeWB+ahd55l
 Fb8QWhBSb0x1OSIj/l7S+iI5LhX3PNuR8TnufaER+C4fT6/WTIpEvRSREGPdX8kmDst2
 Hjr6YXLxO+ga99D5pxTEjYKKOInZS2/DYj1OL/He3mN1iKBvDR1mPkcj0QB5k+1vifGC
 8lf0HBRq4uZZzW7HytWpp3vWYQBs3+f1BYknpfNOCEQXmPNA6WtPT3t33jhraPlqYICF 2w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jd9k21ajd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 04:54:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2854nvWE013853;
	Mon, 5 Sep 2022 04:54:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hhwpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 04:54:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2854sk8N35127654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 04:54:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87B13A4055;
	Mon,  5 Sep 2022 04:54:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78C1CA4040;
	Mon,  5 Sep 2022 04:54:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.52.217])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  5 Sep 2022 04:54:44 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 1/2] tools/perf: Fix out of bound access to affinity "sched_cpus"
Date: Mon,  5 Sep 2022 10:24:40 +0530
Message-Id: <20220905045441.1643-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EZMuXz4lUdrfK4tJMUpP_CX0S0UcD36k
X-Proofpoint-GUID: EZMuXz4lUdrfK4tJMUpP_CX0S0UcD36k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_04,2022-09-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209050022
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The affinity code in "affinity_set" function access array
named "sched_cpus". The size for this array is allocated in
affinity_setup function which is nothing but value from
get_cpu_set_size. This is used to contain the cpumask value
for each cpu. While setting bit for each cpu, it calls
"set_bit" function which access index in sched_cpus array.
If we provide a command-line option to -C which is more than
the number of CPU's present in the system, the set_bit could
access an array member which is out-of the array size. This
is because currently, there is no boundary check for the CPU.
This will result in seg fault:

<<>>
 ./perf stat -C 12323431 ls
Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
Segmentation fault (core dumped)
<<>>

Fix this by adding boundary check for the array.

After the fix from powerpc system:

<<>>
./perf stat -C 12323431 ls 1>out
Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS

 Performance counter stats for 'CPU(s) 12323431':

   <not supported> msec cpu-clock
   <not supported>      context-switches
   <not supported>      cpu-migrations
   <not supported>      page-faults
   <not supported>      cycles
   <not supported>      instructions
   <not supported>      branches
   <not supported>      branch-misses

       0.001192373 seconds time elapsed
<<>>

Reported-by: Nageswara Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/affinity.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/affinity.c b/tools/perf/util/affinity.c
index 4d216c0dc425..a1dd37347abc 100644
--- a/tools/perf/util/affinity.c
+++ b/tools/perf/util/affinity.c
@@ -49,8 +49,14 @@ void affinity__set(struct affinity *a, int cpu)
 {
 	int cpu_set_size = get_cpu_set_size();
 
-	if (cpu == -1)
+	/*
+	 * Return:
+	 * - if cpu is -1
+	 * - restrict out of bound access to sched_cpus
+	 */
+	if (cpu == -1 || ((cpu / __BITS_PER_LONG) >= (cpu_set_size / 8)))
 		return;
+
 	a->changed = true;
 	set_bit(cpu, a->sched_cpus);
 	/*
-- 
2.35.1

