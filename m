Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B47B3898
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 19:25:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UXaK8yjf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxy0x6fTbz3cch
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 03:25:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UXaK8yjf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxxz43HmZz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 03:24:00 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38TGhnsC012554;
	Fri, 29 Sep 2023 17:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Gk4ZHt3MTuWoi7y6+C5IwawFLRF+6dy1zufE7xwekcE=;
 b=UXaK8yjfA3iNytPHPOE6F9MeZ287l2Jj/bI0QVL1cYeV3evFEn+yaZepB31rJEY5F8AH
 uC5Tb7u7SJIQeZKxfmqkO/h/jH0wF3pCArcxh4ECw2dpM4LjBDH9aDUalSxzlHZqjGXp
 UifDUpUVDxqIJDx3ifuky9aFCyzQC9qDD3/FvAlojVzt53D7C7ciBG9M1Hw2/qjJ99OW
 vuD5lGNFYI9S5XjKNZNMmqrlggJNM9GI1omX2lDIMcMfGbrwSq/ZJ6mmF+O9D5T9iQt5
 pF6Dl4FObyFr3tCkqreZ/rk8+Xaf7eGVHiJSsoM2q8FBLVx327zm+FGtAJYlpxFx/Q3R QQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3te1mja89k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 17:23:48 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38TFQeac008253;
	Fri, 29 Sep 2023 17:23:47 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabbnxb3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 17:23:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38THNipg17302100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Sep 2023 17:23:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 700AB2004B;
	Fri, 29 Sep 2023 17:23:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD0C820040;
	Fri, 29 Sep 2023 17:23:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.101.140])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Sep 2023 17:23:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/platforms/pseries: Fix STK_PARAM access in the hcall tracing code
Date: Fri, 29 Sep 2023 22:53:36 +0530
Message-Id: <20230929172337.7906-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M_IRifdDBn4KIkhlzVdycDshh6X8jSox
X-Proofpoint-ORIG-GUID: M_IRifdDBn4KIkhlzVdycDshh6X8jSox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_15,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309290147
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, Naveen N Rao <naveen@kernel.org>, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In powerpc pseries system, below behaviour is observed while
enabling tracing on hcall:
	# cd /sys/kernel/debug/tracing/
	# cat events/powerpc/hcall_exit/enable
	0
	# echo 1 > events/powerpc/hcall_exit/enable

	# ls
	-bash: fork: Bad address

Above is from power9 lpar with latest kernel. Past this, softlockup
is observed. Initially while attempting via perf_event_open to
use "PERF_TYPE_TRACEPOINT", kernel panic was observed.

perf config used:
================
	memset(&pe[1],0,sizeof(struct perf_event_attr));
	pe[1].type=PERF_TYPE_TRACEPOINT;
	pe[1].size=96;
	pe[1].config=0x26ULL; /* 38 raw_syscalls/sys_exit */
	pe[1].sample_type=0; /* 0 */
	pe[1].read_format=PERF_FORMAT_TOTAL_TIME_ENABLED|PERF_FORMAT_TOTAL_TIME_RUNNING|PERF_FORMAT_ID|PERF_FORMAT_GROUP|0x10ULL; /* 1f */
	pe[1].inherit=1;
	pe[1].precise_ip=0; /* arbitrary skid */
	pe[1].wakeup_events=0;
	pe[1].bp_type=HW_BREAKPOINT_EMPTY;
	pe[1].config1=0x1ULL;

Kernel panic logs:
==================

	Kernel attempted to read user page (8) - exploit attempt? (uid: 0)
	 BUG: Kernel NULL pointer dereference on read at 0x00000008
	 Faulting instruction address: 0xc0000000004c2814
	 Oops: Kernel access of bad area, sig: 11 [#1]
	 LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
 	Modules linked in: nfnetlink bonding tls rfkill sunrpc dm_service_time dm_multipath pseries_rng xts vmx_crypto xfs libcrc32c sd_mod t10_pi crc64_rocksoft crc64 sg ibmvfc scsi_transport_fc ibmveth dm_mirror dm_region_hash dm_log dm_mod fuse
 	CPU: 0 PID: 1431 Comm: login Not tainted 6.4.0+ #1
 	Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 0xf000005 of:IBM,FW950.30 (VL950_892) hv:phyp pSeries
 	NIP [c0000000004c2814] page_remove_rmap+0x44/0x320
	LR [c00000000049c2a4] wp_page_copy+0x384/0xec0
	Call Trace:
	[c0000000098c7ad0] [c00000001416e400] 0xc00000001416e400 (unreliable)
	[c0000000098c7b20] [c00000000049c2a4] wp_page_copy+0x384/0xec0
	[c0000000098c7bf0] [c0000000004a4f64] __handle_mm_fault+0x9d4/0xfb0
	[c0000000098c7cf0] [c0000000004a5630] handle_mm_fault+0xf0/0x350
	[c0000000098c7d40] [c000000000094e8c] ___do_page_fault+0x48c/0xc90
	[c0000000098c7df0] [c0000000000958a0] hash__do_page_fault+0x30/0x70
	[c0000000098c7e20] [c00000000009e244] do_hash_fault+0x1a4/0x330
	[c0000000098c7e50] [c000000000008918] data_access_common_virt+0x198/0x1f0
	 --- interrupt: 300 at 0x7fffae971abc

git bisect tracked this down to below commit:
'commit baa49d81a94b ("powerpc/pseries: hvcall stack frame overhead")'

This commit changed STACK_FRAME_OVERHEAD (112 ) to
STACK_FRAME_MIN_SIZE (32 ) since 32 bytes is the minimum size
for ELFv2 stack. With the latest kernel, when running on ELFv2,
STACK_FRAME_MIN_SIZE is used to allocate stack size.

During plpar_hcall_trace, first call is made to HCALL_INST_PRECALL
which saves the registers and allocates new stack frame. In the
plpar_hcall_trace code, STK_PARAM is accessed at two places.
	1. To save r4: std     r4,STK_PARAM(R4)(r1)
	2. To access r4 back: ld      r12,STK_PARAM(R4)(r1)

HCALL_INST_PRECALL precall allocates a new stack frame. So all
the stack parameter access after the precall, needs to be accessed
with +STACK_FRAME_MIN_SIZE. So the store instruction should be:
	std     r4,STACK_FRAME_MIN_SIZE+STK_PARAM(R4)(r1)

If the "std" is not updated with STACK_FRAME_MIN_SIZE, we will
end up with overwriting stack contents and cause corruption.
But instead of updating 'std', we can instead remove it since
HCALL_INST_PRECALL already saves it to the correct location.

similarly load instruction should be:
	ld      r12,STACK_FRAME_MIN_SIZE+STK_PARAM(R4)(r1)

Fix the load instruction to correctly access the stack parameter
with +STACK_FRAME_MIN_SIZE and remove the store of r4 since the
precall saves it correctly.

Cc: stable@vger.kernel.org
Fixes: baa49d81a94b ("powerpc/pseries: hvcall stack frame overhead")
Co-developed-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/hvCall.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index bae45b358a09..2addf2ea03f0 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -184,7 +184,6 @@ _GLOBAL_TOC(plpar_hcall)
 plpar_hcall_trace:
 	HCALL_INST_PRECALL(R5)
 
-	std	r4,STK_PARAM(R4)(r1)
 	mr	r0,r4
 
 	mr	r4,r5
@@ -196,7 +195,7 @@ plpar_hcall_trace:
 
 	HVSC
 
-	ld	r12,STK_PARAM(R4)(r1)
+	ld	r12,STACK_FRAME_MIN_SIZE+STK_PARAM(R4)(r1)
 	std	r4,0(r12)
 	std	r5,8(r12)
 	std	r6,16(r12)
@@ -296,7 +295,6 @@ _GLOBAL_TOC(plpar_hcall9)
 plpar_hcall9_trace:
 	HCALL_INST_PRECALL(R5)
 
-	std	r4,STK_PARAM(R4)(r1)
 	mr	r0,r4
 
 	mr	r4,r5
-- 
2.39.3

