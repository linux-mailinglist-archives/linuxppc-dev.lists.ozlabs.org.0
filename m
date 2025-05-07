Return-Path: <linuxppc-dev+bounces-8399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C6BAAE4EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:35:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zszqr5kkZz30DL;
	Thu,  8 May 2025 01:35:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746632152;
	cv=none; b=gbpDnGVAO9H379IBU+CyRhpAvUic4Ok9BVAkdOdkLwGZbp8zvnnPgoZ8UXNBMOgYU3w+syDhb9xZA9xr0/pNJigh1rT/allWi80MemUC388xkxFUYFalUhxxS1gQxTP8PSBAPKAZPHk9gwrR+kMEDAszI5D9hdE12frIajM63iRi5oBqnFyLGwN0pTlPXEpUDOGtpN7rx/oQLIuZ+zvG1AMSyHz2268DMqHsHO/ewfL7nesf9Akik+4q1PFwSvlUSVvJLpL0T/1z1aZRCODHgY91K4YW6C1It7pQIGlWLAGc6qHAJxdJMqRkvkz7Eyd2+3g71RVM1NzxRVxrMLvC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746632152; c=relaxed/relaxed;
	bh=g6ui48CEyp4+SYwXoh+HY/hFCaSs30FReWsdX+wX9BE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=c+42bL8TQTpFaVaTi3DV/VZ/8zIv7kdzP2hLM1Z0w63tZBSkGaPk4w74H83XA5Bh/siYkpXIb16jbQUpDmAzFaAqhvc93dRxWtGCeyoeuTm3w1jhrScpAEiykU3Jgr8BVJYMOFyVqYSBcz9rU+V7G87CIjDbmFJwzAOhY+4gAYzXawjZsovb6f/QEo2g7fyXXn1B6LCRSvSOECppdPFCDWFo8Kj6kGvJrHVHxnLJFXZ2OiXfLopRvhBjdAeyp9hOOPlGLzvvfENGEos87WlNB0IZFkELotE0mclv40YN2iR4NJzt1szYhToKtpO27g8ObOIcA4UtTIAvvSDiYV2oGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yoiob9l4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yoiob9l4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zszqq2LJ3z30D3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:35:50 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547CHYwE016760;
	Wed, 7 May 2025 15:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=g6ui48
	CEyp4+SYwXoh+HY/hFCaSs30FReWsdX+wX9BE=; b=Yoiob9l4fwojvxi9KxXiun
	Gdr37iNbEGGtDgBUTTZLj3MSu49wOVuSDegw7EaQslkAwujfifVyxyDOn/AM57ok
	5t7eU6nHk4mN4PwaldBof06/eGdiEcSunsF9nqVyMwpglsQ6OpuuF/MIptLFPD2f
	mgqX3WTKf1OgAZYIFTpukKY/XAUxw2gBOhWs6vrtwgB8IdvEK6G3V02WoFkouZcP
	ybcB7xCJgOU3q18Bz1SxlBNw7LtiLh2KlfYSFdYKuP1Q8vlvw6qrgnzzWT4W0Pvn
	0uB+v86kkfCNMPGp8909uxELxhT1kqlIVchVrlxuswLoS+XndCCLvOm3+8QL71eA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fvd0m1xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:35:47 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 547FW27h015100;
	Wed, 7 May 2025 15:35:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fvd0m1xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:35:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 547FDGoC001304;
	Wed, 7 May 2025 15:35:46 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwfthk6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:35:46 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 547FZkMM29688464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 15:35:46 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58D5D5805C;
	Wed,  7 May 2025 15:35:46 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6B6458051;
	Wed,  7 May 2025 15:35:43 +0000 (GMT)
Received: from [9.61.241.123] (unknown [9.61.241.123])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 May 2025 15:35:43 +0000 (GMT)
Message-ID: <2a17b9b1-c490-4571-8f6a-fa567ed0b57e@linux.ibm.com>
Date: Wed, 7 May 2025 21:05:42 +0530
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
Subject: Re: [next-20250506][btrfs] Kernel OOPS while btrfs/001 TC
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-btrfs@vger.kernel.org, riteshh@linux.ibm.com,
        Qu Wenruo <quwenruo.btrfs@gmx.com>, disgoel@linux.vnet.ibm.com,
        viro@zeniv.linux.org.uk, dsterba@suse.com
References: <75b94ef2-752b-4018-9b2a-148ecda5e8f4@linux.ibm.com>
In-Reply-To: <75b94ef2-752b-4018-9b2a-148ecda5e8f4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GGOCG1nCfCO_1y2u1oTYzwNmFv48Q_r9
X-Proofpoint-GUID: wDTdeb9W6Ou_-sPa6o07b06Wl7yc7FVn
X-Authority-Analysis: v=2.4 cv=LYc86ifi c=1 sm=1 tr=0 ts=681b7dd4 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=CZZ_5JIpypcmvY0KRe0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0MiBTYWx0ZWRfX6aas+zrw/GuJ O85OUX+TJPDzkcdwCkymJx5Od2c5rP6hAstGS1LMN5Ys5j7I1YrSDNbE31Ra3uCkzz9FiU74t81 S3K3ZFtfSjMDDRinN7FxXtax+7s1eoqwCEuc+cbf5MTi2oJ2u4cgzII17xsciF0gDxB/qxQmVzV
 AZrW8k6vcm6GocTwCFYnXpng8ww1nxO1Z7wg38+1vTZA/klj0W/r5VM6ftESPP5w2ZWYEgHsqI1 z7rAUllIhELFWcLn8mJIHfRnqceI1uAr2oFArtMfKzH03zKmhv2GAMiLzLMoTibIAFD/jXZAD2Z nuqn8NMn3wcOGWE+p+sHgTQdr9RG1hhPzsvXB7pYA0/YjUirNtyoy9cQ54R09hw0uV6rVYfXqFy
 50pEWWZiSITOGsjOO8N8YRCGUVx7qY3OjrRtwYhllMzzcZC8FdwLf4lExVupl+hk494JWj8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1011 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070142
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07/05/25 2:14 pm, Venkat Rao Bagalkote wrote:
> Hello,
>
>
> I am observing kernel OOPS, while running btrfs/001 TC, from xfstests 
> suite.
>
>
> This issue is introduced in next-20250506. This issue is not seen on 
> next-20250505 kernel.
>
>
> Steps to repro:
>
>
> 1. git clone git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> 2. cd xfstests-dev/
> 3. mkdir /mnt/loop-device /mnt/test /mnt/scratch
> 4. for i in $(seq 0 5); do fallocate -o 0 -l 5GiB 
> /mnt/loop-device/file-$i.img; done
> 5. for i in $(seq 0 5); do losetup /dev/loop$i 
> /mnt/loop-device/file-$i.img; done
> 6. mkfs.btrfs -f -s 65536 -n 65536 /dev/loop0; mkfs.btrfs -f 
> /dev/loop1; mkfs.btrfs -f /dev/loop2; mkfs.btrfs -f /dev/loop3; 
> mkfs.btrfs -f /dev/loop4; mkfs.btrfs -f /dev/loop5
> 8. vi local.config
> 9. make
> 10. ./check tools/btrfs/001
>
>
> local.config contents:
>
>
> export RECREATE_TEST_DEV=true
> export TEST_DEV=/dev/loop0
> export TEST_DIR=/mnt/test
> export SCRATCH_DEV_POOL="/dev/loop1 /dev/loop2 /dev/loop3 /dev/loop4 
> /dev/loop5"
> export SCRATCH_MNT=/mnt/scratch
> export MKFS_OPTIONS="-f -s 4096 -n 4096"
> export FSTYP=btrfs
> export MOUNT_OPTIONS=""
>
>
> Crash:
>
>
> [  953.799060] Btrfs loaded, zoned=yes, fsverity=no
> [  968.070858] BTRFS: device fsid 3813dc53-a2f3-4342-b44e-c9349f17f991 
> devid 1 transid 8 /dev/loop0 (7:0) scanned by mount (25422)
> [  968.072561] BTRFS info (device loop0): first mount of filesystem 
> 3813dc53-a2f3-4342-b44e-c9349f17f991
> [  968.072584] BTRFS info (device loop0): using crc32c 
> (crc32c-powerpc) checksum algorithm
> [  968.072594] BTRFS info (device loop0): forcing free space tree for 
> sector size 4096 with page size 65536
> [  968.072599] BTRFS info (device loop0): using free-space-tree
> [  968.073867] BTRFS info (device loop0): checking UUID tree
> [  968.074000] Kernel attempted to read user page (68) - exploit 
> attempt? (uid: 0)
> [  968.074009] BUG: Kernel NULL pointer dereference on read at 0x00000068
> [  968.074013] Faulting instruction address: 0xc00800000f7fb5e0
> [  968.074019] Oops: Kernel access of bad area, sig: 11 [#1]
> [  968.074022] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
> [  968.074028] Modules linked in: btrfs blake2b_generic xor raid6_pq 
> zstd_compress loop dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 
> nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject 
> nft_ct sunrpc nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
> nf_defrag_ipv4 bonding tls rfkill ip_set nf_tables nfnetlink 
> pseries_rng vmx_crypto fuse ext4 crc16 mbcache jbd2 sd_mod sg ibmvscsi 
> scsi_transport_srp ibmveth
> [  968.074074] CPU: 0 UID: 0 PID: 25422 Comm: mount Kdump: loaded Not 
> tainted 6.15.0-rc5-next-20250506 #1 VOLUNTARY
>
> [  968.074087] NIP:  c00800000f7fb5e0 LR: c00800000f7fb3b4 CTR: 
> c00000000047862c
> [  968.074091] REGS: c000000154747920 TRAP: 0300   Not tainted 
> (6.15.0-rc5-next-20250506)
> [  968.074096] MSR:  800000000280b033 
> <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24022882  XER: 00000000
> [  968.074109] CFAR: c00800000f7fb650 DAR: 0000000000000068 DSISR: 
> 40000000 IRQMASK: 0
> [  968.074109] GPR00: c00800000f7fb3b4 c000000154747bc0 
> c0080000099da600 0000000000000000
> [  968.074109] GPR04: c000000008570c20 7fffffffffffffff 
> 0000000000000000 c0000000068e3a00
> [  968.074109] GPR08: 0000000000000000 0000000000000000 
> c0000000068e3a00 0000000000002000
> [  968.074109] GPR12: c00000000047862c c000000003020000 
> 0000000000000000 0000000000000000
> [  968.074109] GPR16: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [  968.074109] GPR20: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [  968.074109] GPR24: 0000000000000000 c000000015b00000 
> c00000007a38ac00 0000000000000020
> [  968.074109] GPR28: c000000008560a00 c00000006b1784c0 
> 0000000000000000 c000000063147980
> [  968.074163] NIP [c00800000f7fb5e0] 
> btrfs_get_tree_subvol+0x32c/0x544 [btrfs]
> [  968.074205] LR [c00800000f7fb3b4] btrfs_get_tree_subvol+0x100/0x544 
> [btrfs]
> [  968.074241] Call Trace:
> [  968.074244] [c000000154747bc0] [c00800000f7fb3b4] 
> btrfs_get_tree_subvol+0x100/0x544 [btrfs] (unreliable)
> [  968.074282] [c000000154747cb0] [c000000000630da4] 
> vfs_get_tree+0x48/0x15c
> [  968.074291] [c000000154747d30] [c00000000067675c] 
> do_new_mount+0x234/0x438
> [  968.074297] [c000000154747da0] [c000000000678298] 
> sys_mount+0x164/0x1b0
> [  968.074303] [c000000154747e10] [c000000000033338] 
> system_call_exception+0x138/0x330
> [  968.074311] [c000000154747e50] [c00000000000d05c] 
> system_call_vectored_common+0x15c/0x2ec
> [  968.074319] ---- interrupt: 3000 at 0x7fff89d4edf4
> [  968.074323] NIP:  00007fff89d4edf4 LR: 00007fff89d4edf4 CTR: 
> 0000000000000000
> [  968.074328] REGS: c000000154747e80 TRAP: 3000   Not tainted 
> (6.15.0-rc5-next-20250506)
> [  968.074333] MSR:  800000000280f033 
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44022804  XER: 00000000
> [  968.074345] IRQMASK: 0
> [  968.074345] GPR00: 0000000000000015 00007fffc25e41b0 
> 00007fff89e37d00 000000015e810710
> [  968.074345] GPR04: 000000015e810730 000000015e8106f0 
> 0000000000000000 000000015e810690
> [  968.074345] GPR08: 000000015e8106f0 0000000000000000 
> 0000000000000000 0000000000000000
> [  968.074345] GPR12: 0000000000000000 00007fff8a03c140 
> 0000000000000000 0000000000000000
> [  968.074345] GPR16: 0000000000000000 0000000000000000 
> 0000000000000000 0000000125d1f298
> [  968.074345] GPR20: 0000000000000000 0000000000000000 
> 000000015e810530 000000015e810730
> [  968.074345] GPR24: 00007fff89f38e68 00007fff89f38e78 
> 00007fff89f3dfe8 00007fff89f60240
> [  968.074345] GPR28: 000000015e8106f0 0000000000000000 
> 000000015e810710 0000000000100000
> [  968.074396] NIP [00007fff89d4edf4] 0x7fff89d4edf4
> [  968.074399] LR [00007fff89d4edf4] 0x7fff89d4edf4
> [  968.074403] ---- interrupt: 3000
> [  968.074406] Code: 4bffeffd 3920f000 7c234840 7c7e1b78 41810144 
> 7c7a1b78 4bfffe30 60000000 813f0088 71290001 41820068 e93d0040 
> <e8690068> 38630070 481416e1 e8410018
> [  968.074425] ---[ end trace 0000000000000000 ]---
> [  968.076694] pstore: backend (nvram) writing error (-1)
> [  968.076698]
>
>

Git bisect is pointing first bad commit: 
[25efcff06654aa283be379420e8b1f8d344c2f78] btrfs_get_tree_subvol(): 
switch from fc_mount() to vfs_create_mount().


Upon reverting above commit, issue is not seen. Please help in fixing 
this issue.


Bisection log:


git bisect start
# status: waiting for both good and bad commits
# good: [92a09c47464d040866cf2b4cd052bc60555185fb] Linux 6.15-rc5
git bisect good 92a09c47464d040866cf2b4cd052bc60555185fb
# status: waiting for bad commit, 1 good commit known
# bad: [0a00723f4c2d0b273edd0737f236f103164a08eb] Add linux-next 
specific files for 20250506
git bisect bad 0a00723f4c2d0b273edd0737f236f103164a08eb
# bad: [d0a7045528df303c86ce87662728ea8ee136c7ef] Merge branch 
'nand/next' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect bad d0a7045528df303c86ce87662728ea8ee136c7ef
# bad: [3acffb16ef28cc1979b42c235fed9c7bf653e815] Merge branch 'fs-next' 
of linux-next
git bisect bad 3acffb16ef28cc1979b42c235fed9c7bf653e815
# good: [59e921108839edbbcbce23475596fee455ec4129] Merge branch 'next' 
of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
git bisect good 59e921108839edbbcbce23475596fee455ec4129
# bad: [28485805726d7960c1d5be4a45d59ea26652f6d2] Merge branch 'master' 
of https://github.com/Paragon-Software-Group/linux-ntfs3.git
git bisect bad 28485805726d7960c1d5be4a45d59ea26652f6d2
# bad: [255b0bb00ae27f2adcf054b71f29be50d2e34025] Merge branch 
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git
git bisect bad 255b0bb00ae27f2adcf054b71f29be50d2e34025
# good: [456619c2c7107c700321664f79c4e89d19805063] btrfs: simplify 
getting and extracting previous transaction at clean_pinned_extents()
git bisect good 456619c2c7107c700321664f79c4e89d19805063
# good: [028156969e9f640e7eee0a98b19c731fd9862f14] bcachefs: 
bch2_io_failures_to_text()
git bisect good 028156969e9f640e7eee0a98b19c731fd9862f14
# good: [b3f59e3a42fd075d40a65dbcdf853302db4ba93f] bcachefs: Ensure 
proper write alignment
git bisect good b3f59e3a42fd075d40a65dbcdf853302db4ba93f
# good: [8209541b4998a1bcf99c7530e60ce6c9aefd87f8] btrfs: update 
lookup_root_entry to to use rb helper
git bisect good 8209541b4998a1bcf99c7530e60ce6c9aefd87f8
# good: [94fa56d94dbca52e07b0f0233257f502ca6d547a] btrfs: scrub: fix a 
wrong error type when metadata bytenr mismatches
git bisect good 94fa56d94dbca52e07b0f0233257f502ca6d547a
# bad: [c91d3cff2a3ce3fc0960d8e6bdb69be51f105d67] Merge branch 
'misc-next' into for-next-next-v6.15-20250505
git bisect bad c91d3cff2a3ce3fc0960d8e6bdb69be51f105d67
# bad: [25efcff06654aa283be379420e8b1f8d344c2f78] 
btrfs_get_tree_subvol(): switch from fc_mount() to vfs_create_mount()
git bisect bad 25efcff06654aa283be379420e8b1f8d344c2f78
# good: [4254b8e069c7fa48106be44f8fcf4cafc264bd14] btrfs: scrub: 
aggregate small bitmaps into a larger one
git bisect good 4254b8e069c7fa48106be44f8fcf4cafc264bd14
# first bad commit: [25efcff06654aa283be379420e8b1f8d344c2f78] 
btrfs_get_tree_subvol(): switch from fc_mount() to vfs_create_mount()


Regards,

Venkat.

>
> If you happent to fix this, please add below tag.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
>
> Regards,
>
> Venkat.
>

