Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EA2872E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:56:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Sms5wC8zDqVr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:56:13 +1100 (AEDT)
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
 header.s=pp1 header.b=II8JJ+HV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6ShR49P2zDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:52:23 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 098Ae0xn094444; Thu, 8 Oct 2020 06:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=/SJKaw6QfrPVbX6LHATRRbyzL9MFwLU6w0fwK9y2I+g=;
 b=II8JJ+HVWRMNyiAcy+2SmADxI+k5F4XKZV20tY0eOkkZIVW5Ohy2K/GeA8+LsAWE11zA
 3JOqoG88pgIGnSlYVZa9CFm+t69t1gGiAnYmCdpztwOTOk+fE/D6xNvKUcEzYYuYA2M0
 WMfjdnilv80BnudS2WshkwgoMP6Zufq4ulkTLRZJN6vbJW99lkGAJeY4USLCwES/F9Dp
 FDEscZ0OdOP/w5t49IJqf00y4SsIFJcQGfy7wT288juDh1uLbXB11IMv0Rqvmj/3KwkE
 Z4p6/aHSQT0io7srylfJYThvNTQFFYvmdBz/LisOzY2QcnPSrH3SfZG/CDWzLBJG9mYM Kg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341yb2bt0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 06:52:18 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 098ApsAK022667;
 Thu, 8 Oct 2020 10:52:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx8d8gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 10:52:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 098AqEx729557228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 10:52:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED47B4C04A;
 Thu,  8 Oct 2020 10:52:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 990C64C046;
 Thu,  8 Oct 2020 10:52:12 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.255.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 10:52:12 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/4] powerpc/perf: Add new power pmu flag "PPMU_P10_DD1" for
 power10 DD1
Date: Thu,  8 Oct 2020 06:52:06 -0400
Message-Id: <1602154329-2092-2-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_07:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010080077
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new power PMU flag "PPMU_P10_DD1" which can be
used to conditionally add any code path for power10 DD1 processor
version. Also modify power10 PMU driver code to set this
flag only for DD1, based on the Processor Version Register (PVR)
value.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h | 1 +
 arch/powerpc/perf/power10-pmu.c              | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index f6acabb..3b7baba 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -82,6 +82,7 @@ struct power_pmu {
 #define PPMU_ARCH_207S		0x00000080 /* PMC is architecture v2.07S */
 #define PPMU_NO_SIAR		0x00000100 /* Do not use SIAR */
 #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
+#define PPMU_P10_DD1		0x00000400 /* Is power10 DD1 processor version */
 
 /*
  * Values for flags to get_alternatives()
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 8314865..47d930a 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -404,6 +404,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
 
 int init_power10_pmu(void)
 {
+	unsigned int pvr;
 	int rc;
 
 	/* Comes from cpu_specs[] */
@@ -411,6 +412,11 @@ int init_power10_pmu(void)
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power10"))
 		return -ENODEV;
 
+	pvr = mfspr(SPRN_PVR);
+	/* Add the ppmu flag for power10 DD1 */
+	if ((PVR_CFG(pvr) == 1))
+		power10_pmu.flags |= PPMU_P10_DD1;
+
 	/* Set the PERF_REG_EXTENDED_MASK here */
 	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
 
-- 
1.8.3.1

