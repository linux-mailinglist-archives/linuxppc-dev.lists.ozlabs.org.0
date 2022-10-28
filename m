Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179B6109BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 07:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzB34120Cz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 16:30:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ea06Zx8s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ea06Zx8s;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzB235Hygz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 16:29:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S5Ik0B021769
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 05:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=GvYePZU6Zm7c3AzBM9qcuuLWLt+TNR/ozwMeDqQZBas=;
 b=ea06Zx8spSOecFZ8e6Q1yIZDH4Q+897HPh69K7u5oWBToZBd4RLzxcs55Fm8AlwL8gFv
 DSrq1Nc3eSHhPdm5FPxohdKR4kDic9xKeT+yDZFXerwjG6TRnFBND/O6EQb2jnA2sKNj
 Igk2iJ3hj3Vc3RVWGzGTK6p2c002pkvtRXNYLuhxIj7oegZiwi6N7iXPYa2trvwRAYsJ
 +wDu/VxSRwWzM8rfrjiG+0zu2xyMdIjYl01CATW7e3CLHzZKn8IiHNm0JV+MqRjnsO2a
 6+OPAvCj05rfYYeUbhmYnLOcM9le0QFtQh8DqJDp12Ev+dcXKmTvOgBCAW2y1MRwZqdk +A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kg8tvgc6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 05:29:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29S5L9SJ025842
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 05:28:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3kfahqk5wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 05:28:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29S5Sgkh63045986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 05:28:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA8D642045;
	Fri, 28 Oct 2022 05:28:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7B9C42041;
	Fri, 28 Oct 2022 05:28:41 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.54])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 05:28:41 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [6.1.0-rc2] insecure W+X mapping warning during kdump kernel boot
Message-Id: <48206911-FD3D-401A-A69D-1A79403E79E2@linux.ibm.com>
Date: Fri, 28 Oct 2022 10:58:40 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bq0rX4OdA66iQEJlT0NFgpY70ZSI4F-x
X-Proofpoint-ORIG-GUID: bq0rX4OdA66iQEJlT0NFgpY70ZSI4F-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=813 lowpriorityscore=0 clxscore=1011 malwarescore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280031
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_DEBUG_WX=3Dy I am observing following warning
During kdump kernel boot. This warning is not seen during production
kernel boot. Kernel crash dump is captured correctly.

------------[ cut here ]------------
[   11.541311] powerpc/mm: Found insecure W+X mapping at address =
00000000749d3849/0xc000000000000000
[   11.541328] WARNING: CPU: 28 PID: 1 at =
arch/powerpc/mm/ptdump/ptdump.c:194 note_page+0x408/0x430
[   11.541342] Modules linked in:
[   11.541348] CPU: 28 PID: 1 Comm: swapper/28 Not tainted =
6.1.0-rc2-gb229b6ca5abb #1
[   11.541356] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[   11.541364] NIP:  c0000000100b1ac8 LR: c0000000100b1ac4 CTR: =
0000000000725d90
[   11.541370] REGS: c0000000156f7720 TRAP: 0700   Not tainted  =
(6.1.0-rc2-gb229b6ca5abb)
[   11.541377] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28000822  XER: 00000006
[   11.541393] CFAR: c000000010157514 IRQMASK: 0=20
[   11.541393] GPR00: c0000000100b1ac4 c0000000156f79c0 c00000001135eb00 =
0000000000000055=20
[   11.541393] GPR04: 00000000fffeffff c0000000156f7780 c0000000156f7778 =
0000000000000000=20
[   11.541393] GPR08: 00000000fffeffff 0000000000000000 c0000000125d73b8 =
c000000083dfffe8=20
[   11.541393] GPR12: 0000000000000000 c000000012e12400 c000000010f3b5f0 =
c0000000001f0000=20
[   11.541393] GPR16: c000000012b2dba0 0000000000000001 c0000000156f7bd8 =
c00000008ffc0010=20
[   11.541393] GPR20: c000000010f3b5f0 c00000003fffffff c000000000010000 =
c000000012b2dbb0=20
[   11.541393] GPR24: c000000012b2dba8 c00000008ffe0000 c000000000200000 =
c000000000010000=20
[   11.541393] GPR28: c00000000001018e 0000000000000004 c00000000001018e =
c0000000156f7cc0=20
[   11.541462] NIP [c0000000100b1ac8] note_page+0x408/0x430
[   11.541469] LR [c0000000100b1ac4] note_page+0x404/0x430
[   11.541476] Call Trace:
[   11.541478] [c0000000156f79c0] [c0000000100b1ac4] =
note_page+0x404/0x430 (unreliable)
[   11.541488] [c0000000156f7a70] [c000000010550a14] =
ptdump_pte_entry+0xa4/0x100
[   11.541498] [c0000000156f7ab0] [c00000001049849c] =
walk_pgd_range+0x8ec/0xb20
[   11.541507] [c0000000156f7bb0] [c000000010498bf4] =
walk_page_range_novma+0x74/0xc0
[   11.541515] [c0000000156f7c10] [c000000010550e48] =
ptdump_walk_pgd+0x98/0x170
[   11.541523] [c0000000156f7c60] [c0000000100b1b84] =
ptdump_check_wx+0x94/0x100
[   11.541532] [c0000000156f7d40] [c000000010094cb0] =
mark_rodata_ro+0x30/0x70
[   11.541540] [c0000000156f7da0] [c00000001001282c] =
kernel_init+0x8c/0x1b0
[   11.541548] [c0000000156f7e10] [c00000001000cf60] =
ret_from_kernel_thread+0x5c/0x64
[   11.541556] Instruction dump:
[   11.541560] eb410080 ebc100a0 7c0803a6 4bfffc94 3c62ffe1 39200001 =
3d42016b 7ca42b78=20
[   11.541571] 3863e5c0 992a9e23 480a59ed 60000000 <0fe00000> fae10068 =
fb010070 fb210078=20
[   11.541583] ---[ end trace 0000000000000000 ]=E2=80=94


- Sachin

