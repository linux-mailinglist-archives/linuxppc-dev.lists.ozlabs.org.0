Return-Path: <linuxppc-dev+bounces-8374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35221AADA66
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 10:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZspjS3kp3z2xlL;
	Wed,  7 May 2025 18:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746607484;
	cv=none; b=VZgTo5lj4MVGWF04Mgpp26AOEunLUba2kI3CBya8JNDZZEiS7yeD7lLpEYegCOQ/Uv+rjW1DuWo79uLXWI0dKXxegflbRXJE/7oyyrdCWH6o7jVg7Cv+b4S071gpIC6SnoYXgHSDT0g5H9rHPKqHpQ089v0sRzOaPsicX6BUfQHmq0MuKodiQ+1R9Wqhw4w31BiTll5SzGD2Sxx7J51Q/vnCW/LWHaaSvjX/Y2IJv5t2ryZ8oAZjbjUBUm9WGJMZ61gyks2GE9APbXfkuArsxDzCeqy5dfimJNPncJiIa1R83G+kHWvK68OO2C7PmycwbkeOH/FEPl8VonwHxtkVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746607484; c=relaxed/relaxed;
	bh=FO0fjrYVKp8xGIN/2Gqnbgr69KrWHFR/beTQuzDyhBY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=C93dZrB7czmYYiKGJr8OGC3rwojok+tZ6b+KTwGQTCV9+KdSSavmyaytp8MVJWcFE0yDev8q997fQQCObrhFgPcvWoyDS6d0c4VfaqXx1Hi2SJXc5YOr2DdypvPMMn6dwi0M6E1zEmbnNatnXsOZTkdf0nvA+WgqenjypIjaeQbX9TkLO8yK9GbB+B1Im08/yiO4o6f/lfd6Cp7F9kX17DnNQldU7n7EzKU9GupICG3hNZxxYlR7vKKFEAw+yIw7DA8A64gf/eBqnYaVdF1ksXtKvJFI4MKzS166yqLXOwnVTmKg/F4CYCfuoS/vf16WlmLwdVsRP3fJBK49NsO/uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQIYEICk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQIYEICk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZspjR3pMWz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 18:44:43 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5475Ij2f010427;
	Wed, 7 May 2025 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=FO0fjrYVKp8xGIN/2Gqnbgr69KrW
	HFR/beTQuzDyhBY=; b=iQIYEICk59Wutt7kEO9PpERcRMlZOculkpuYYN49Wq1/
	dZDDRMUyuACsZ5Op+2591XF6yLTzAwPFLkEiB7EWrNCf+VxHoRAf+AYBwwDrlGyj
	HlYSzEnwYi+ymNTizgfUETIAX4bzSaMVA2OCiX770k+emtT63JZuGw/5otFoy+I4
	IVEdr7CdkbiS6yaQXbny5Um0/bPe+LlQN3d0YbYerNlnVt9UGFslqgrb6iQZicTw
	fe3YSO/kTkAo8uaM/+6OhKfx8c2AXBojUJTLZrtasQzh+/rQAWRL5es25XLHwlwm
	UzlIS2MUQUYF7p1dP+DoKDToI4YCGgl29WMIjvaaeg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgbjdm2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 08:44:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5478QTfl026578;
	Wed, 7 May 2025 08:44:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgbjdm2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 08:44:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476WFr8013770;
	Wed, 7 May 2025 08:44:39 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e062fehx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 08:44:39 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5478iccG23593280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 08:44:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DD6F58055;
	Wed,  7 May 2025 08:44:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DC815804B;
	Wed,  7 May 2025 08:44:36 +0000 (GMT)
Received: from [9.204.204.179] (unknown [9.204.204.179])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 May 2025 08:44:35 +0000 (GMT)
Message-ID: <75b94ef2-752b-4018-9b2a-148ecda5e8f4@linux.ibm.com>
Date: Wed, 7 May 2025 14:14:34 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-btrfs@vger.kernel.org, riteshh@linux.ibm.com,
        Qu Wenruo <quwenruo.btrfs@gmx.com>, disgoel@linux.vnet.ibm.com
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [next-20250506][btrfs] Kernel OOPS while btrfs/001 TC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NmLre71nuBKqpkRRyNXeHHYzCJKbKSmm
X-Proofpoint-GUID: Pt44Bp16xx9yccZZJROR44K9cdhvcQyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3OSBTYWx0ZWRfX81a4ZT0S0PSv Y4t5UQCBOS8r2qqMKE8Qs1NHtmIh9wDvryUx+jH5qh/cLrUZVyzsaIilvUNcgpqB4wthqQmFbpO Qri+cJ8rvHbR24Tbl//90Ta/6OJs7/JStVhKY5D9FDT4/cIe76OVkyyVHWFTpybHXG3/JVVlytp
 vkjWT/gZItBIWXlTrYtS9+/EOO0dea6aw5hXhf/mDJ9fZjfoY4TOOuq4RpS4tH2l+S6prejTn3k thAsGFW6sElBZeyGzJpn3WcXB50FCTG7Z6F/qSMj+6NnyxXG+jnNYzVrs1ZiuUzmKnIasHP3fQP GFoXiUrzA6G/mq/+HJs3E+ap0MvestszpHmmHlShxKI0sy7hTM/AM5/TkaBAWorwgxpVhmXJ5mc
 itrdAxMFGIPbDWTf2YIRpyyntLq6SWZegrJHxsyKRDSgFEDlR9xJl9wG3iZu2e39dXXX3xF9
X-Authority-Analysis: v=2.4 cv=FJcbx/os c=1 sm=1 tr=0 ts=681b1d78 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=UIzWbI13G1sJYqkSAR8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=812 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,


I am observing kernel OOPS, while running btrfs/001 TC, from xfstests suite.


This issue is introduced in next-20250506. This issue is not seen on 
next-20250505 kernel.


Steps to repro:


1. git clone git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
2. cd xfstests-dev/
3. mkdir /mnt/loop-device /mnt/test /mnt/scratch
4. for i in $(seq 0 5); do fallocate -o 0 -l 5GiB 
/mnt/loop-device/file-$i.img; done
5. for i in $(seq 0 5); do losetup /dev/loop$i 
/mnt/loop-device/file-$i.img; done
6. mkfs.btrfs -f -s 65536 -n 65536 /dev/loop0; mkfs.btrfs -f /dev/loop1; 
mkfs.btrfs -f /dev/loop2; mkfs.btrfs -f /dev/loop3; mkfs.btrfs -f 
/dev/loop4; mkfs.btrfs -f /dev/loop5
8. vi local.config
9. make
10. ./check tools/btrfs/001


local.config contents:


export RECREATE_TEST_DEV=true
export TEST_DEV=/dev/loop0
export TEST_DIR=/mnt/test
export SCRATCH_DEV_POOL="/dev/loop1 /dev/loop2 /dev/loop3 /dev/loop4 
/dev/loop5"
export SCRATCH_MNT=/mnt/scratch
export MKFS_OPTIONS="-f -s 4096 -n 4096"
export FSTYP=btrfs
export MOUNT_OPTIONS=""


Crash:


[  953.799060] Btrfs loaded, zoned=yes, fsverity=no
[  968.070858] BTRFS: device fsid 3813dc53-a2f3-4342-b44e-c9349f17f991 
devid 1 transid 8 /dev/loop0 (7:0) scanned by mount (25422)
[  968.072561] BTRFS info (device loop0): first mount of filesystem 
3813dc53-a2f3-4342-b44e-c9349f17f991
[  968.072584] BTRFS info (device loop0): using crc32c (crc32c-powerpc) 
checksum algorithm
[  968.072594] BTRFS info (device loop0): forcing free space tree for 
sector size 4096 with page size 65536
[  968.072599] BTRFS info (device loop0): using free-space-tree
[  968.073867] BTRFS info (device loop0): checking UUID tree
[  968.074000] Kernel attempted to read user page (68) - exploit 
attempt? (uid: 0)
[  968.074009] BUG: Kernel NULL pointer dereference on read at 0x00000068
[  968.074013] Faulting instruction address: 0xc00800000f7fb5e0
[  968.074019] Oops: Kernel access of bad area, sig: 11 [#1]
[  968.074022] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
[  968.074028] Modules linked in: btrfs blake2b_generic xor raid6_pq 
zstd_compress loop dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib 
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct sunrpc 
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding 
tls rfkill ip_set nf_tables nfnetlink pseries_rng vmx_crypto fuse ext4 
crc16 mbcache jbd2 sd_mod sg ibmvscsi scsi_transport_srp ibmveth
[  968.074074] CPU: 0 UID: 0 PID: 25422 Comm: mount Kdump: loaded Not 
tainted 6.15.0-rc5-next-20250506 #1 VOLUNTARY

[  968.074087] NIP:  c00800000f7fb5e0 LR: c00800000f7fb3b4 CTR: 
c00000000047862c
[  968.074091] REGS: c000000154747920 TRAP: 0300   Not tainted 
(6.15.0-rc5-next-20250506)
[  968.074096] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 24022882  XER: 00000000
[  968.074109] CFAR: c00800000f7fb650 DAR: 0000000000000068 DSISR: 
40000000 IRQMASK: 0
[  968.074109] GPR00: c00800000f7fb3b4 c000000154747bc0 c0080000099da600 
0000000000000000
[  968.074109] GPR04: c000000008570c20 7fffffffffffffff 0000000000000000 
c0000000068e3a00
[  968.074109] GPR08: 0000000000000000 0000000000000000 c0000000068e3a00 
0000000000002000
[  968.074109] GPR12: c00000000047862c c000000003020000 0000000000000000 
0000000000000000
[  968.074109] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  968.074109] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  968.074109] GPR24: 0000000000000000 c000000015b00000 c00000007a38ac00 
0000000000000020
[  968.074109] GPR28: c000000008560a00 c00000006b1784c0 0000000000000000 
c000000063147980
[  968.074163] NIP [c00800000f7fb5e0] btrfs_get_tree_subvol+0x32c/0x544 
[btrfs]
[  968.074205] LR [c00800000f7fb3b4] btrfs_get_tree_subvol+0x100/0x544 
[btrfs]
[  968.074241] Call Trace:
[  968.074244] [c000000154747bc0] [c00800000f7fb3b4] 
btrfs_get_tree_subvol+0x100/0x544 [btrfs] (unreliable)
[  968.074282] [c000000154747cb0] [c000000000630da4] vfs_get_tree+0x48/0x15c
[  968.074291] [c000000154747d30] [c00000000067675c] 
do_new_mount+0x234/0x438
[  968.074297] [c000000154747da0] [c000000000678298] sys_mount+0x164/0x1b0
[  968.074303] [c000000154747e10] [c000000000033338] 
system_call_exception+0x138/0x330
[  968.074311] [c000000154747e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[  968.074319] ---- interrupt: 3000 at 0x7fff89d4edf4
[  968.074323] NIP:  00007fff89d4edf4 LR: 00007fff89d4edf4 CTR: 
0000000000000000
[  968.074328] REGS: c000000154747e80 TRAP: 3000   Not tainted 
(6.15.0-rc5-next-20250506)
[  968.074333] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44022804  XER: 00000000
[  968.074345] IRQMASK: 0
[  968.074345] GPR00: 0000000000000015 00007fffc25e41b0 00007fff89e37d00 
000000015e810710
[  968.074345] GPR04: 000000015e810730 000000015e8106f0 0000000000000000 
000000015e810690
[  968.074345] GPR08: 000000015e8106f0 0000000000000000 0000000000000000 
0000000000000000
[  968.074345] GPR12: 0000000000000000 00007fff8a03c140 0000000000000000 
0000000000000000
[  968.074345] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000125d1f298
[  968.074345] GPR20: 0000000000000000 0000000000000000 000000015e810530 
000000015e810730
[  968.074345] GPR24: 00007fff89f38e68 00007fff89f38e78 00007fff89f3dfe8 
00007fff89f60240
[  968.074345] GPR28: 000000015e8106f0 0000000000000000 000000015e810710 
0000000000100000
[  968.074396] NIP [00007fff89d4edf4] 0x7fff89d4edf4
[  968.074399] LR [00007fff89d4edf4] 0x7fff89d4edf4
[  968.074403] ---- interrupt: 3000
[  968.074406] Code: 4bffeffd 3920f000 7c234840 7c7e1b78 41810144 
7c7a1b78 4bfffe30 60000000 813f0088 71290001 41820068 e93d0040 
<e8690068> 38630070 481416e1 e8410018
[  968.074425] ---[ end trace 0000000000000000 ]---
[  968.076694] pstore: backend (nvram) writing error (-1)
[  968.076698]



If you happent to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


