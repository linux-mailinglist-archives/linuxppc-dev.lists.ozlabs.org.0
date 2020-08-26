Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5267252799
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 08:44:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbxD21LdkzDqX2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 16:44:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JokruuZa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbx7x0vT5zDqWf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 16:40:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q6ZJWv100114; Wed, 26 Aug 2020 02:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=bH4YZiMI8XKV3eq888TjkD+jN4u7JvGQ2UQfTqCR1JA=;
 b=JokruuZamI98dX9I7AqV/1P9V78RBp005///fKFUHGCQkNQnJ6XukMJ+60bzv+mCoHlQ
 QLUyDviiir9xVpPRBKYMROGzReCH5TGMnC7aHm+/Urck0vmqtj+kPu4JwXeeqFXLW6eu
 vYjeDDy4JAGipP0LqMh0OAd9y+8MJhRp/VSq49M2v6y/+XJM7k+rU4XSCRtB5GZ/xpIL
 YlSy6lPmhlR3xnOVMaSByLlkfrpKSjNWKtbWvvL7Xm0k+MnJ4DPrI0zHw7bMwlNP20sa
 mPBSH1EbfDEjyJqCUThd9IfYlLPjBTTmn2PvzTIiKd3OtRIJ2Etjt2xGUHAwZn6nLmPX CA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335hwghd75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 02:40:36 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q6Vp1L025433;
 Wed, 26 Aug 2020 06:40:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 332ujkv6u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 06:40:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07Q6eWR033030648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Aug 2020 06:40:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E8494C059;
 Wed, 26 Aug 2020 06:40:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACE3C4C04E;
 Wed, 26 Aug 2020 06:40:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.102.19.237])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Aug 2020 06:40:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix reading of MSR[HV PR] bits in trace-imc
Date: Wed, 26 Aug 2020 02:40:29 -0400
Message-Id: <1598424029-1662-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_03:2020-08-25,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=1 priorityscore=1501
 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260050
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IMC trace-mode uses MSR[HV PR] bits to set the cpumode
for the instruction pointer captured in each sample.
The bits are fetched from third DW of the trace record.
Reading third DW from IMC trace record should use be64_to_cpu
along with READ_ONCE inorder to fetch correct MSR[HV PR] bits.
Patch addresses this change.

Currently we are using `PERF_RECORD_MISC_HYPERVISOR` as
cpumode if MSR HV is 1 and PR is 0 which means the address is from
host counter. But using `PERF_RECORD_MISC_HYPERVISOR` for host
counter data will fail to resolve the `address -> symbol` during
`perf report` because perf tools side uses `PERF_RECORD_MISC_KERNEL`
to represent the host counter data. Therefore, fix the trace imc
sample data to use `PERF_RECORD_MISC_KERNEL` as cpumode for
host kernel information.

Fixes: 77ca3951cc37 ("powerpc/perf: Add kernel support for new
MSR[HV PR] bits in trace-imc")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/imc-pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index a45d694..62d0b54 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1289,7 +1289,7 @@ static int trace_imc_prepare_sample(struct trace_imc_data *mem,
 	header->misc = 0;
 
 	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		switch (IMC_TRACE_RECORD_VAL_HVPR(mem->val)) {
+		switch (IMC_TRACE_RECORD_VAL_HVPR(be64_to_cpu(READ_ONCE(mem->val)))) {
 		case 0:/* when MSR HV and PR not set in the trace-record */
 			header->misc |= PERF_RECORD_MISC_GUEST_KERNEL;
 			break;
@@ -1297,7 +1297,7 @@ static int trace_imc_prepare_sample(struct trace_imc_data *mem,
 			header->misc |= PERF_RECORD_MISC_GUEST_USER;
 			break;
 		case 2: /* MSR HV is 1 and PR is 0 */
-			header->misc |= PERF_RECORD_MISC_HYPERVISOR;
+			header->misc |= PERF_RECORD_MISC_KERNEL;
 			break;
 		case 3: /* MSR HV is 1 and PR is 1 */
 			header->misc |= PERF_RECORD_MISC_USER;
-- 
1.8.3.1

