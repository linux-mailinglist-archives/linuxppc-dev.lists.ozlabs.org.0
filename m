Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58839891567
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 10:09:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dlLyt+eE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5ZNc0vr8z3vl6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 20:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dlLyt+eE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5ZMn594Jz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 20:08:52 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42T72xjI006247;
	Fri, 29 Mar 2024 09:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=ORNZsXaAlcrVpKaV2uZR6K/0qkeC26TdqjsjsYyFbGw=;
 b=dlLyt+eEh1qmjZ9Np8WqCIMDg97rhu3qjLlrd6+lcgDsd94Y6/LCHwxm0jcv+egVIxbr
 OK5wML8kEHeAG8QbrqGMhUKjh1bBmyweLL8wpV0JN2AxQCqTLX121SSzFFYaDyTovVX8
 MTSWkeeEu9+2jrHtQe4KwuLMMgrgl5kzfH57y830BiY5M6MEw1wJqX5Mm1uxWbIcmivn
 xlk4v+KpB6h/S/apFiE5u6myTVXcCJv5+Xlj6yjSTvF7Qx78uGZcg7O9KKUDBFsxINGS
 S79X6Dsn7BttKvV0Z061EHs26rFovtfzoeGLSsuwf/b818uD+R6h7ZWavOhHOVIiS3HO Zg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x5rw888fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 09:08:35 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42T8VZqQ012965;
	Fri, 29 Mar 2024 09:08:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x29t138xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 09:08:34 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42T98Ubo28901700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Mar 2024 09:08:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B21F20043;
	Fri, 29 Mar 2024 09:08:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE0C32004F;
	Fri, 29 Mar 2024 09:08:28 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.42])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Mar 2024 09:08:28 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: [powerpc] WARN at drivers/scsi/sg.c:2236 (sg_remove_sfp_usercontext)
Message-Id: <5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com>
Date: Fri, 29 Mar 2024 14:38:17 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-scsi@vger.kernel.org
X-Mailer: Apple Mail (2.3774.400.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3_0kOFuIrZ3inV6eh0C5pG0QbG5vq53r
X-Proofpoint-GUID: 3_0kOFuIrZ3inV6eh0C5pG0QbG5vq53r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_08,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2403290079
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
Cc: Alexander Wetzel <Alexander@wetzel-home.de>, Bart Van Assche <bvanassche@acm.org>, "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following WARN_ON_ONCE is triggered while running LTP tests
(specifically ioctl_sg01) on IBM Power booted with =
6.9.0-rc1-next-20240328

[   64.230233] ------------[ cut here ]------------
[   64.230269] WARNING: CPU: 10 PID: 452 at drivers/scsi/sg.c:2236 =
sg_remove_sfp_usercontext+0x270/0x280 [sg]
[   64.230302] Modules linked in: rpadlpar_io rpaphp xsk_diag =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding tls rfkill ip_set =
nf_tables nfnetlink sunrpc binfmt_misc pseries_rng vmx_crypto xfs =
libcrc32c sd_mod sr_mod t10_pi crc64_rocksoft_generic cdrom =
crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp fuse
[   64.230420] CPU: 10 PID: 452 Comm: kworker/10:1 Kdump: loaded Not =
tainted 6.9.0-rc1-next-20240328 #2
[   64.230438] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
[   64.230449] Workqueue: events sg_remove_sfp_usercontext [sg]
[   64.230468] NIP:  c008000015c34110 LR: c008000015c33ffc CTR: =
c0000000005393b0
[   64.230485] REGS: c00000000c1efae0 TRAP: 0700   Not tainted  =
(6.9.0-rc1-next-20240328)
[   64.230498] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 44000408  XER: 00000000
[   64.230535] CFAR: c008000015c3400c IRQMASK: 0
[   64.230535] GPR00: c008000015c33ffc c00000000c1efd80 c008000015c58900 =
c00000000ca8ae98
[   64.230535] GPR04: 00000000c0000000 0000000000000023 c000000007c2e000 =
0000000000000022
[   64.230535] GPR08: 000000038a130000 0000000000000002 0000000000000000 =
c008000015c38bc0
[   64.230535] GPR12: c0000000005393b0 c00000038fff3f00 c0000000001a2bac =
c000000007c7a9c0
[   64.230535] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   64.230535] GPR20: c00000038c3f3b00 c000000007c10030 c000000007c10000 =
c0000000901c0000
[   64.230535] GPR24: 0000000000000000 c00000000ca8ae00 c0000000045a5805 =
c000000007c11330
[   64.230535] GPR28: c00000038c3f3b00 c000000007c10080 c000000007c11328 =
c000000002fdee54
[   64.230671] NIP [c008000015c34110] =
sg_remove_sfp_usercontext+0x270/0x280 [sg]
[   64.230690] LR [c008000015c33ffc] =
sg_remove_sfp_usercontext+0x15c/0x280 [sg]
[   64.230709] Call Trace:
[   64.230716] [c00000000c1efd80] [c008000015c33ffc] =
sg_remove_sfp_usercontext+0x15c/0x280 [sg] (unreliable)
[   64.230740] [c00000000c1efe40] [c00000000019337c] =
process_one_work+0x20c/0x4f4
[   64.230767] [c00000000c1efef0] [c0000000001942fc] =
worker_thread+0x378/0x544
[   64.230787] [c00000000c1eff90] [c0000000001a2cdc] kthread+0x138/0x140
[   64.230801] [c00000000c1effe0] [c00000000000df98] =
start_kernel_thread+0x14/0x18
[   64.230819] Code: e8c98310 3d220000 e8698010 480044bd e8410018 =
7ec3b378 48004ac9 e8410018 38790098 81390098 2c090001 4182ff04 =
<0fe00000> 4bfffefc 000247e0 00000000
[   64.230857] ---[ end trace 0000000000000000 ]=E2=80=94

This WARN_ON was introduced with
commit 27f58c04a8f438078583041468ec60597841284d
    scsi: sg: Avoid sg device teardown race

Reverting the patch avoids the warning. The test case passes =
irrespective of the
patch is present of not.=20

-- Sachin=
