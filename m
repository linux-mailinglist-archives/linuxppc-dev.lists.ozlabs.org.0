Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCBE4F13E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 13:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX7xV4ZpZz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 21:35:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IVCExeAv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IVCExeAv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX7wp12bxz2xDl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 21:34:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2349GJB8031958; 
 Mon, 4 Apr 2022 11:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=z3Sfn4YW0o7P8kBvBOPmwjAYhi5tC4sDdnuVpERy0zg=;
 b=IVCExeAvSvXT4DZwJul7FeoOC11wv8j+dT5FKePvi41wCWlR3aMcYkD/mw3aNg2uhewV
 3C1NPzcp5x8p/6hwtsCqlGyrjrX+adEVkqev7lf1oTupnj7UpQiEZOhA67UjWUwM+A0x
 VrUDn/8Qzm/IYOqhNJZgc4rWilCm4tyW0PSjREelBzQSkX6RddxjzF10Ore5c79qSkLT
 4zi5qnZbyNVUa198xzqT3AAdd2W8WNMssxHGrb/NHzTOPmIrZA5xMwbnVK9W9LO7W7KD
 zzKCrr2BQ3299T7bRPaKSdTiyoo013gzO9uElfyRDzzXtQWLSn5jOEhTx2n2Q7vKgTDt 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f702q0u1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 11:34:45 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 234AUtcG009897;
 Mon, 4 Apr 2022 11:34:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f702q0u0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 11:34:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234BXSdM032193;
 Mon, 4 Apr 2022 11:34:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3f6e48twy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 11:34:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 234BYdcC49545564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 11:34:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B032A11C054;
 Mon,  4 Apr 2022 11:34:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82D2611C050;
 Mon,  4 Apr 2022 11:34:37 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.181.230])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 11:34:37 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: [powerpc]Kernel crash while running xfstests (generic/250)
 [next-20220404]
Message-Id: <A3B628C9-A20B-4621-BC8C-C79B270297E1@linux.ibm.com>
Date: Mon, 4 Apr 2022 17:04:35 +0530
To: linux-block@vger.kernel.org, snitzer@redhat.com
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iFFfqOApfYy2xa18rALLAzVDcBfYQyVA
X-Proofpoint-ORIG-GUID: KWJLFJkh8frgZPjeJ58DYsCi1rCJ43tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_03,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=934 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040065
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
Cc: dm-devel@redhat.com, riteshh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running xfstests(ext4 or XFS as fs) on a Power10 LPAR booted with =
today=E2=80=99s
next (5.18.0-rc1-next-20220404) following crash is seen.=20

[   51.260209] XFS (dm-0): Unmounting Filesystem
[   51.262949] XFS (dm-0): Mounting V5 Filesystem
[   51.270524] XFS (dm-0): Ending clean mount
[   51.272641] xfs filesystem being mounted at /mnt/scratch supports =
timestamps until 2038 (0x7fffffff)
[   51.377505] XFS (dm-0): Unmounting Filesystem
[   51.397584] BUG: Unable to handle kernel data access at =
0x5deadbeef0000122
[   51.397591] Faulting instruction address: 0xc0000000001561bc
[   51.397595] Oops: Kernel access of bad area, sig: 11 [#1]
[   51.397598] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[   51.397602] Modules linked in: xfs dm_mod ip_set rfkill nf_tables =
bonding libcrc32c nfnetlink sunrpc pseries_rng xts vmx_crypto =
uio_pdrv_genirq uio sch_fq_codel ext4 mbcache jbd2 sd_mod t10_pi =
crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp fuse
[   51.397626] CPU: 3 PID: 3448 Comm: dmsetup Not tainted =
5.18.0-rc1-next-20220404 #16
[   51.397630] NIP:  c0000000001561bc LR: c0000000001560e8 CTR: =
c000000000672ef0
[   51.397633] REGS: c000000095c9b610 TRAP: 0380   Not tainted  =
(5.18.0-rc1-next-20220404)
[   51.397636] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24024824  XER: 00000000
[   51.397646] CFAR: c0000000001560f0 IRQMASK: 0=20
[   51.397646] GPR00: c0000000001560e8 c000000095c9b8b0 c000000002a03800 =
0000000000000000=20
[   51.397646] GPR04: c000000017a1ab78 0000000000000000 c00000002cab6ac0 =
c000000093e73900=20
[   51.397646] GPR08: c000000093e73900 5deadbeef0000100 5deadbeef0000122 =
c008000001b5a4e8=20
[   51.397646] GPR12: c000000000672ef0 c000000abfff8e80 000000013dbd0b60 =
00007fff849e9da8=20
[   51.397646] GPR16: 00007fff849e9da8 00007fff849e9da8 00007fff84a23670 =
0000000000000000=20
[   51.397646] GPR20: 00007fff849f3388 00007fff84a22040 000000013dbd0b90 =
0000000000000131=20
[   51.397646] GPR24: c00000000254d768 ffffffffffff0000 c00000000254d730 =
c000000027668e00=20
[   51.397646] GPR28: c0000000029b0170 c000000017a1ab78 0000000000000017 =
0000000000000000=20
[   51.397684] NIP [c0000000001561bc] =
__cpuhp_state_remove_instance+0x19c/0x2c0
[   51.397692] LR [c0000000001560e8] =
__cpuhp_state_remove_instance+0xc8/0x2c0
[   51.397697] Call Trace:
[   51.397698] [c000000095c9b8b0] [c0000000001560e8] =
__cpuhp_state_remove_instance+0xc8/0x2c0 (unreliable)
[   51.397705] [c000000095c9b920] [c000000000672f4c] =
bioset_exit+0x5c/0x280
[   51.397709] [c000000095c9b9c0] [c008000001b433f4] =
cleanup_mapped_device+0x4c/0x1a0 [dm_mod]
[   51.397721] [c000000095c9ba00] [c008000001b436f0] =
__dm_destroy+0x1a8/0x360 [dm_mod]
[   51.397730] [c000000095c9baa0] [c008000001b50e90] =
dev_remove+0x1a8/0x280 [dm_mod]
[   51.397740] [c000000095c9bb30] [c008000001b5115c] =
ctl_ioctl+0x1f4/0x7c0 [dm_mod]
[   51.397750] [c000000095c9bd40] [c008000001b51748] =
dm_ctl_ioctl+0x20/0x40 [dm_mod]
[   51.397759] [c000000095c9bd60] [c0000000004b1f68] =
sys_ioctl+0xf8/0x150
[   51.397763] [c000000095c9bdb0] [c00000000003373c] =
system_call_exception+0x18c/0x390
[   51.397767] [c000000095c9be10] [c00000000000c64c] =
system_call_common+0xec/0x270
[   51.397772] --- interrupt: c00 at 0x7fff84329210
[   51.397776] NIP:  00007fff84329210 LR: 00007fff849e6824 CTR: =
0000000000000000
[   51.397780] REGS: c000000095c9be80 TRAP: 0c00   Not tainted  =
(5.18.0-rc1-next-20220404)
[   51.397785] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24004484  XER: 00000000
[   51.397795] IRQMASK: 0=20
[   51.397795] GPR00: 0000000000000036 00007ffffdb43030 00007fff84407300 =
0000000000000003=20
[   51.397795] GPR04: 00000000c138fd04 000000013dbd0b60 0000000000000004 =
00007fff849f3f98=20
[   51.397795] GPR08: 0000000000000003 0000000000000000 0000000000000000 =
0000000000000000=20
[   51.397795] GPR12: 0000000000000000 00007fff84acfa80 000000013dbd0b60 =
00007fff849e9da8=20
[   51.397795] GPR16: 00007fff849e9da8 00007fff849e9da8 00007fff84a23670 =
0000000000000000=20
[   51.397795] GPR20: 00007fff849f3388 00007fff84a22040 000000013dbd0b90 =
000000013dbd02e0=20
[   51.397795] GPR24: 00007fff849e9da8 00007fff849e9da8 00007fff849e9da8 =
00007fff849e9da8=20
[   51.397795] GPR28: 0000000000000001 00007fff849e9da8 0000000000000000 =
00007fff849e9da8=20
[   51.397829] NIP [00007fff84329210] 0x7fff84329210
[   51.397831] LR [00007fff849e6824] 0x7fff849e6824
[   51.397834] --- interrupt: c00
[   51.397835] Instruction dump:
[   51.397838] 60000000 7f69db78 7f83e040 7c7f07b4 7bea1f24 419cffb4 =
eae10028 eb210038=20
[   51.397844] eb610048 e93d0000 e95d0008 2fa90000 <f92a0000> 419e0008 =
f9490008 3d405dea=20
[   51.397850] ---[ end trace 0000000000000000 ]---
[   51.400133]=20
[   52.400136] Kernel panic - not syncing: Fatal exception

This problem was possibly introduced with 5.17.0-next-20220330.=20
Git bisect leads me to following patch
commit 1d158814db8e7b3cbca0f2c8d9242fbec4fbc57e
    dm: conditionally enable BIOSET_PERCPU_CACHE for dm_io bioset

-Sachin=
