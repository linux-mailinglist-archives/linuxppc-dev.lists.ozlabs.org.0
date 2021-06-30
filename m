Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F073B7E42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFCrS4PnVz3048
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bAgfi6v4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bAgfi6v4; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFCr05PCkz2yN7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:38:07 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15U7Xdal011668; Wed, 30 Jun 2021 03:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=Mdl64loD7I/KZKBDCpNO0zTN0oJBO+ZQUeC5V3W0tVc=;
 b=bAgfi6v4pDF9u3ZO5aeG+6WmDn8YkJ6ZxX2gYGiCiGce/LrydyOXqeHqCU7c7SWoCiS9
 Cm1/ckCF3hmI46B+JlDKqIborCLB0EPvtHzhzqT59p3yvGWzkEKBSMou10cgoD6gj4XP
 VQ2DihpeGz0bE1J/Z9aBCdXZwhiU5ZTLNXBzLGVSEg/T6ogqsApae3jrAWOUwEQ5xIIk
 QAyrhDjjEQvxKaClwyAWPsfPBwpvazh1MeKffPOdX7fDWQNzmsHv6M8dh+3k7bNnd34X
 9JWZxfNbyXXD5IqZ8yob1OuKPINKTA8IBzGJJT6d1w96Itqa52wiOnQ/ggQ6fT/iWItI KQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gfc272j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 03:38:02 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15U7c1MQ009937;
 Wed, 30 Jun 2021 07:38:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 39ft8era31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 07:38:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15U7aNDY36700418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 07:36:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FC5D5207D;
 Wed, 30 Jun 2021 07:37:58 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.88.152])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A84AA5206C;
 Wed, 30 Jun 2021 07:37:57 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [powerpc][5.13.0-next20210629] Kernel WARN crypto/testmgr.c:5653
 during boot
Message-Id: <73D2DF91-CC7A-46CD-8D48-63FFB1857D24@linux.vnet.ibm.com>
Date: Wed, 30 Jun 2021 13:07:56 +0530
To: linux-crypto@vger.kernel.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yzP7B1Xmk-8PsB1OPuGf7mvuhX2HbQVE
X-Proofpoint-ORIG-GUID: yzP7B1Xmk-8PsB1OPuGf7mvuhX2HbQVE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_01:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300049
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
Cc: smueller@chronox.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting 5.13.0-next20210629 on a Power server, following
warning is seen:

[    0.076955] DRBG: could not allocate digest TFM handle: hmac(sha512)
[    0.076960] alg: drbg: Failed to reset rng
[    0.076963] alg: drbg: Test 0 failed for drbg_nopr_hmac_sha512
[    0.076967] ------------[ cut here ]------------
[    0.076970] alg: self-tests for drbg_nopr_hmac_sha512 (stdrng) failed =
(rc=3D-22)
[    0.076977] WARNING: CPU: 10 PID: 153 at crypto/testmgr.c:5653 =
alg_test+0x484/0x860
[    0.076989] Modules linked in:
[    0.076993] CPU: 10 PID: 153 Comm: cryptomgr_test Not tainted =
5.13.0-next-20210629 #1
[    0.076998] NIP:  c00000000063ea44 LR: c00000000063ea40 CTR: =
c000000000730b40
[    0.077003] REGS: c00000000e7ff960 TRAP: 0700   Not tainted  =
(5.13.0-next-20210629)
[    0.077007] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
28008222  XER: 20040005
[    0.077018] CFAR: c000000000150a00 IRQMASK: 0=20
[    0.077018] GPR00: c00000000063ea40 c00000000e7ffc00 c0000000029bc300 =
0000000000000042=20
[    0.077018] GPR04: 00000000ffff7fff c00000000e7ff8c0 c00000000e7ff8b8 =
0000000000000000=20
[    0.077018] GPR08: 00000009f98e0000 c0000000024f66f0 c0000000024f66f0 =
c000000002876838=20
[    0.077018] GPR12: 0000000000008000 c00000001ec7a280 c00000000018ce88 =
c000000003b300c0=20
[    0.077018] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    0.077018] GPR20: 0000000000000000 0000000000000000 c000000002a9ab20 =
c000000000fb5278=20
[    0.077018] GPR24: c000000010a85200 c000000000d61fa8 c000000010a85280 =
0000000000000400=20
[    0.077018] GPR28: c000000010a85200 000000000000000c c000000002ccf230 =
ffffffffffffffea=20
[    0.077072] NIP [c00000000063ea44] alg_test+0x484/0x860
[    0.077077] LR [c00000000063ea40] alg_test+0x480/0x860
[    0.077082] Call Trace:
[    0.077085] [c00000000e7ffc00] [c00000000063ea40] =
alg_test+0x480/0x860 (unreliable)
[    0.077091] [c00000000e7ffd70] [c00000000063ca60] =
cryptomgr_test+0x40/0x70
[    0.077097] [c00000000e7ffda0] [c00000000018d014] kthread+0x194/0x1a0
[    0.077103] [c00000000e7ffe10] [c00000000000c750] =
ret_from_kernel_thread+0x5c/0x6c
[    0.077110] Instruction dump:
[    0.077113] 409e0298 3d220031 89292f56 2f890000 409e0288 3c62fe63 =
7f45d378 7f84e378=20
[    0.077121] 7fe6fb78 38633260 4bb11f5d 60000000 <0fe00000> e8010180 =
eb210138 7c0803a6=20
[    0.077131] ---[ end trace a1cc3999f90f0962 ]---
[    0.077585] iommu: Default domain type: Translated=20

This new self test was introduced with
commit 8833272d876e
         crypto: drbg - self test for HMAC(SHA-512)

Thanks
-Sachin

