Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7995E203
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 12:26:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dy2R2glFzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 20:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dy0p44SgzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 20:25:13 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63AKdwj102886
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 06:25:08 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tgqxyxuxd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 06:25:08 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 11:25:06 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 11:25:03 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63AP1Oc36700160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 10:25:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F5F7A4062;
 Wed,  3 Jul 2019 10:25:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB3A2A4060;
 Wed,  3 Jul 2019 10:25:00 +0000 (GMT)
Received: from [9.109.244.53] (unknown [9.109.244.53])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 10:25:00 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Kernel Bug/oops during boot (PowerVM LPAR w/vTPM)
Date: Wed, 3 Jul 2019 15:54:59 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19070310-0016-0000-0000-0000028EBFF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070310-0017-0000-0000-000032EC5844
Message-Id: <49B804EE-726B-4EB4-9BED-116F8FB5B374@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=761 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030125
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
Cc: nayna@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting mainline kernel on PowerVM LPAR with vTPM enabled results
into a kernel crash.

[    0.365989] BUG: Kernel NULL pointer dereference at 0x00000012
[    0.365995] Faulting instruction address: 0xc00000000073dd80
[    0.366000] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.366005] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[    0.366010] Modules linked in:
[    0.366015] CPU: 1 PID: 1 Comm: swapper/0 Not tainted =
5.2.0-rc7-autotest-autotest #1
[    0.366020] NIP:  c00000000073dd80 LR: c00000000073dcd0 CTR: =
0000000000000000
[    0.366026] REGS: c0000018ed8e7550 TRAP: 0380   Not tainted  =
(5.2.0-rc7-autotest-autotest)
[    0.366031] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28002448  XER: 20040001
[    0.366038] CFAR: c000000000b6d1c4 IRQMASK: 0
[    0.366038] GPR00: c00000000073dcd0 c0000018ed8e77e0 c000000001524a00 =
0000000000000000
[    0.366038] GPR04: 0000000000000003 0000000000000000 0000000000010000 =
000000000000000e
[    0.366038] GPR08: 0000000000000022 0000000000010000 c0000018e5510000 =
00000000883bfecd
[    0.366038] GPR12: 0000000048002448 c00000001ec6ee00 c0000000000107a8 =
0000000000000000
[    0.366038] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[    0.366038] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[    0.366038] GPR24: c0000018eb9eaaa0 0000000000000000 c000000000bce810 =
c000000000e2ed28
[    0.366038] GPR28: c0000018e70a4000 000000000000000a 0000000000000012 =
c0000018e5510000
[    0.366085] NIP [c00000000073dd80] tpm1_pcr_extend+0x130/0x230
[    0.366090] LR [c00000000073dcd0] tpm1_pcr_extend+0x80/0x230
[    0.366094] Call Trace:
[    0.366098] [c0000018ed8e77e0] [c00000000073dcd0] =
tpm1_pcr_extend+0x80/0x230 (unreliable)
[    0.366105] [c0000018ed8e7890] [c00000000073c8c4] =
tpm_pcr_extend+0xd4/0x180
[    0.366111] [c0000018ed8e78d0] [c0000000005745f8] =
ima_add_template_entry+0x198/0x320
[    0.366117] [c0000018ed8e79b0] [c000000000577058] =
ima_store_template+0xc8/0x160
[    0.366124] [c0000018ed8e7a30] [c000000000f6081c] =
ima_add_boot_aggregate+0xf8/0x184
[    0.366130] [c0000018ed8e7b30] [c000000000f6093c] ima_init+0x94/0xbc
[    0.366135] [c0000018ed8e7b90] [c000000000f60aac] init_ima+0x44/0xe8
[    0.366140] [c0000018ed8e7c10] [c000000000010448] =
do_one_initcall+0x68/0x2c0
[    0.366146] [c0000018ed8e7ce0] [c000000000f14738] =
kernel_init_freeable+0x318/0x47c
[    0.366152] [c0000018ed8e7db0] [c0000000000107c4] =
kernel_init+0x24/0x150
[    0.366158] [c0000018ed8e7e20] [c00000000000ba54] =
ret_from_kernel_thread+0x5c/0x68
[    0.366163] Instruction dump:
[    0.366167] 7d404d2c 81210068 792a07e1 e9410070 392a0002 7d004c2c =
79070020 40c20048
[    0.366174] 39080014 3d200001 7f884840 419d00a4 <807e0000> 809e0004 =
80be0008 80de000c
[    0.366182] ---[ end trace ec40127c4fe87b2c ]=E2=80=94

Thanks
-Sachin=

