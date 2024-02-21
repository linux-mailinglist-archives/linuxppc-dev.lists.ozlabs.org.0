Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3787785D054
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 07:17:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iC8vNIYf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfmKR10G7z3cFf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 17:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iC8vNIYf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=geetika@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfmJd54NFz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 17:17:05 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41L5thN9005344
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 06:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : cc : from : to : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=IJTFmUJyCBkLDYF7Deb0JTKErpdzRrSlJe2bm+/i4W8=;
 b=iC8vNIYfb9fGq+WMaNX1EGPjhpYhR6Amm8YHcXIdA0Mx0wJuU1BB6xrGHckRjhLq4qlr
 hF4JHz16jwwWpCmk1/6r3Eo19YUKmVxyppC/J/HXTLScPR6voLwYkDdL7Vi+ZFmhpRm8
 3p1w8TJGRBOiZujYw/hhxlqM1PdHU5gx4LDL2InHxddQxeiG/M4I5gisI8/dOnN3opjM
 HsWbxN7KKqBaAQ6U441Oqs1dYGzD5pluuHZui3mKI2Cqu0OdKRKGt2eJhxHNU+0rGWiz
 +nYIgb2LEMze2/z/fC8QjwwchLCTA3F4aL+AdEDwtiJkwQgLi1zkDH0TqY13B2H/9W27 vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wd973313m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 06:17:02 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41L6DEMk028248
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 06:17:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wd9733136-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 06:17:01 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41L61KSN009547;
	Wed, 21 Feb 2024 06:17:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb84pd7m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 06:17:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41L6Gs4124379958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Feb 2024 06:16:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A37542004B;
	Wed, 21 Feb 2024 06:16:54 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C5E20040;
	Wed, 21 Feb 2024 06:16:53 +0000 (GMT)
Received: from [9.43.82.166] (unknown [9.43.82.166])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Feb 2024 06:16:53 +0000 (GMT)
Message-ID: <1d80f9dd-f36e-41a7-aef6-35e8e1b159ba@linux.ibm.com>
Date: Wed, 21 Feb 2024 11:46:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Geetika M <geetika@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc] WARNING at arch/powerpc/mm/mmu_context.c:106
 switch_mm_irqs_off+0x140/0x17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5-KidTQvuarAjzA8ZvoEyFo2zyy7TdAX
X-Proofpoint-ORIG-GUID: pvSAKrfdU8Dq-2GF4DwW-VX6pjalm6z0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 mlxscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=594 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402210046
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
Cc: shirisha@linux.ibm.com, sachinp@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running DLPAR CPU remove test on a IBM Power10 server (6.8.0-rc2) 
following warning is seen :

[ 2334.165288][ T0] ------------[ cut here ]------------
[ 2334.165302][ T0] WARNING: CPU: 45 PID: 0 at 
arch/powerpc/mm/mmu_context.c:106 switch_mm_irqs_off+0x140/0x170
[ 2334.165316][ T0] Modules linked in: rpadlpar_io rpaphp bonding 
nfnetlink pseries_rng rng_core vmx_crypto gf128mul aes_gcm_p10_crypto 
crct10dif_vpmsum crct10dif_common binfmt_misc crc32c_vpmsum fuse autofs4
[ 2334.165337][ T0] CPU: 45 PID: 0 Comm: swapper/45 Not tainted 
6.8.0-rc2 #1
[ 2334.165342][ T0] Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 
0xf000006 of:IBM,FW1060.00 (NL1060_024) hv:phyp pSeries
[ 2334.165345][ T0] NIP: c00000000008c5f0 LR: c00000000008c590 CTR: 
c0000000000fa084
[ 2334.165347][ T0] REGS: c000000003e67b40 TRAP: 0700 Not tainted 
(6.8.0-rc2)
[ 2334.165351][ T0] MSR: 800000000282b033 
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 24000222 XER: 00000000
[ 2334.165365][ T0] CFAR: c00000000008c5a4 IRQMASK: 1
[ 2334.165365][ T0] GPR00: c00000000008c590 c000000003e67de0 
c000000001559700 c000000008c12700
[ 2334.165365][ T0] GPR04: c000000002986480 c000000003ccff00 
000000000000002d 0000000000000000
[ 2334.165365][ T0] GPR08: 000000000000002d 0000000000000000 
c000000002986a80 0000000000000000
[ 2334.165365][ T0] GPR12: c0000000000fa084 c000000efff88700 
0000000000000000 000000002eede6a0
[ 2334.165365][ T0] GPR16: 0000000000000000 0000000000000000 
0000000000000000 0000000000000000
[ 2334.165365][ T0] GPR20: 0000000000000000 0000000000000000 
0000000000000000 0000000000000001
[ 2334.165365][ T0] GPR24: 000000000000002d 000000000000dedc 
c000000002a62cc8 c0000000029dcc68
[ 2334.165365][ T0] GPR28: c0000000029e1340 0000000000000000 
000000000000002d c000000008c12d00
[ 2334.165407][ T0] NIP [c00000000008c5f0] switch_mm_irqs_off+0x140/0x170
[ 2334.165412][ T0] LR [c00000000008c590] switch_mm_irqs_off+0xe0/0x170
[ 2334.165417][ T0] Call Trace:
[ 2334.165418][ T0] [c000000003e67de0] [c000000003e67e30] 
0xc000000003e67e30 (unreliable)
[ 2334.165425][ T0] [c000000003e67e20] [c0000000001a7bb4] 
idle_task_exit+0x90/0xb4
[ 2334.165433][ T0] [c000000003e67e50] [c0000000000fa0b8] 
pseries_cpu_offline_self+0x34/0xec
[ 2334.165440][ T0] [c000000003e67ec0] [c00000000005cbb0] 
arch_cpu_idle_dead+0x48/0x98
[ 2334.165446][ T0] [c000000003e67ee0] [c0000000001cacb4] 
do_idle+0x2c0/0x3c0
[ 2334.165451][ T0] [c000000003e67f60] [c0000000001cb044] 
cpu_startup_entry+0x4c/0x50
[ 2334.165457][ T0] [c000000003e67f90] [c00000000005c798] 
start_secondary+0x2b4/0x2c4
[ 2334.165461][ T0] [c000000003e67fe0] [c00000000000e258] 
start_secondary_prolog+0x10/0x14
[ 2334.165466][ T0] Code: 4e800020 60000000 60000000 60000000 7ca32b78 
48008eb9 60000000 4bffffb8 0fe00000 4bffff1c 60000000 60000000 
<0fe00000> e8010050 ebe10038 7c0803a6

[ 2334.165481][ T0] ---[ end trace 0000000000000000 ]---

- Geetika
