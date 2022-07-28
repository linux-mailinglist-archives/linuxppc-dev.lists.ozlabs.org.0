Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D69D58444B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 18:38:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtxDH6J1nz2xkm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 02:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Refw3u2e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Refw3u2e;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtxCY4DWmz2xJK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 02:38:00 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SGMExh018283;
	Thu, 28 Jul 2022 16:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VFhKwOpfGkSbdZ+zh1Oe6mjZy+iDgtKtlY1hNRyM8tU=;
 b=Refw3u2eIjjUlugzrKWPkhm54NPCV7pOvVLl1IcHLl8b9cfs9ZwhjlLcmoAQU8+MI6qi
 aDSrXgoIqx5KSEV4jVa/nP3O1T2WSKrd4x2zK7zO6MexOMXUs4znr4kDFSc9elKO1MDm
 vpXB028xX/RCjNPPvagWNcF+O/XWarjQqNvHtMjAgLRjNenCZl2e6CJqGrqj1pZBSRje
 njlW0eBdGl1fITlRxdy2V3yIVgBLOZWlBiAK+FqIjLe8xfpqwZ3UcC/t9wN0abTsaj1i
 TgxaQd0c1VSicQIFJ+IalAc1nwF090k7x/QGJFtwGr0CH3sXk01u2IWee8kezhlyfM8g wA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkwsxgrrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Jul 2022 16:37:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26SGZLkY002712;
	Thu, 28 Jul 2022 16:37:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3hg98nen7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Jul 2022 16:37:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26SGbnXK28377454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Jul 2022 16:37:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 410564C046;
	Thu, 28 Jul 2022 16:37:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 142E64C040;
	Thu, 28 Jul 2022 16:37:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.94.246])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 28 Jul 2022 16:37:47 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Include caps feature for power10 DD1 version
Date: Thu, 28 Jul 2022 22:07:46 +0530
Message-Id: <20220728163746.85062-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JjU1RF6Ff_yR5K5G9HKbiHjqDp5-oZd_
X-Proofpoint-GUID: JjU1RF6Ff_yR5K5G9HKbiHjqDp5-oZd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207280075
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 6320e693d98c ("powerpc/perf: Add support for caps
under sysfs in powerpc") added support for caps under sysfs
in powerpc. This added caps directory to:
/sys/bus/event_source/devices/cpu/ for power8, power9, power10
and generic compat PMU in respective PMU driver code.

For power10, it is added under "power10_pmu_attr_groups". But
for DD1 version, attr_groups are defined under dd1 array:
"power10_pmu_attr_groups_dd1". Since caps is not added for DD1,
it fails to include "cpu/caps" in DD1 model. Also issue was
observed while booting power10 pseries with qemu version6,
where as not observed with qemu version7. This could be because
of support for the model in old qemu version. Below is the
trace log:

<<>>
[    2.125323][    T1] Can't update unknown attr grp name: cpu/caps^M
[    2.127748][    T1] ------------[ cut here ]------------^M
[    2.127764][    T1] Failed to register pmu: cpu, reason -22^M
[    2.129255][    T1] WARNING: CPU: 1 PID: 1 at kernel/events/core.c:13427 perf_event_sysfs_init+0xbc/0x108^M
[    2.131007][    T1] Modules linked in:^M
[    2.131434][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc2-00111-g6320e693d98c #148^M
[    2.131837][    T1] NIP:  c0000000020391f4 LR: c0000000020391f0 CTR: c0000000008c9c30^M
[    2.131924][    T1] REGS: c0000000044c38c0 TRAP: 0700   Not tainted  (5.19.0-rc2-00111-g6320e693d98c)^M
[    2.132048][    T1] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000281  XER: 20040000^M
[    2.132422][    T1] CFAR: c00000000013feac IRQMASK: 0 ^M
[    2.132422][    T1] GPR00: c0000000020391f0 c0000000044c3b60 c00000000283db00 0000000000000027 ^M
[    2.132422][    T1] GPR04: 80000000ffffe0a8 0000000000000000 0000000000000004 00000000fdcd0000 ^M
[    2.132422][    T1] GPR08: 0000000000000027 c0000000ffe07e08 0000000000000001 0000000000000000 ^M
[    2.132422][    T1] GPR12: c00000000035dd90 c0000000fffff300 c000000000012478 0000000000000000 ^M
[    2.132422][    T1] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 ^M
[    2.132422][    T1] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 ^M
[    2.132422][    T1] GPR24: c000000002003480 0000000000000007 c0000000012a78d0 c000000001170a80 ^M
[    2.132422][    T1] GPR28: c0000000026c4df8 c0000000026c4e68 0000000000000000 c0000000025a8628 ^M
[    2.133404][    T1] NIP [c0000000020391f4] perf_event_sysfs_init+0xbc/0x108^M
[    2.133479][    T1] LR [c0000000020391f0] perf_event_sysfs_init+0xb8/0x108^M
[    2.133729][    T1] Call Trace:^M
[    2.133879][    T1] [c0000000044c3b60] [c0000000020391f0] perf_event_sysfs_init+0xb8/0x108 (unreliable)^M
[    2.134113][    T1] [c0000000044c3bf0] [c000000000011ec4] do_one_initcall+0x64/0x2d0^M
[    2.134279][    T1] [c0000000044c3cd0] [c0000000020049fc] kernel_init_freeable+0x338/0x3e0^M
[    2.134362][    T1] [c0000000044c3db0] [c0000000000124a0] kernel_init+0x30/0x1a0^M
[    2.134440][    T1] [c0000000044c3e10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64^M
[    2.134676][    T1] Instruction dump:^M
[    2.134878][    T1] 813f0038 2c090000 4180002c 7fe3fb78 4a3280c5 2c030000 7c651b78 41820018 ^M
[    2.135068][    T1] e89f0030 7f63db78 4a106c59 60000000 <0fe00000> ebff0000 4bffffb4 39200001 ^M
[    2.135305][    T1] ---[ end trace 0000000000000000 ]---^M
<<>>

Patch fixes this by adding caps for dd1 attr_groups in power10
PMU driver.

Fixes: 6320e693d98c ("powerpc/perf: Add support for caps under sysfs in powerpc")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Note: The patch is on top of powerpc-next tree

 arch/powerpc/perf/power10-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 403ba3a69512..9b5133e361a7 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -270,6 +270,7 @@ static struct attribute_group power10_pmu_caps_group = {
 static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
 	&power10_pmu_format_group,
 	&power10_pmu_events_group_dd1,
+	&power10_pmu_caps_group,
 	NULL,
 };
 
-- 
2.31.1

