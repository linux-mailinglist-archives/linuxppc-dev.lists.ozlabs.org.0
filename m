Return-Path: <linuxppc-dev+bounces-1521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EED97E28D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 18:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBXKF4jRVz2xjP;
	Mon, 23 Sep 2024 02:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727024065;
	cv=none; b=mxJ3VzgMYS/MeN7W6UImIPqdllYFD/9eCC9+eDZrEINjLPu2Whr1H5CmgOkrnOyExPeLBnARCMjXgDqTv3JvbzQf4UIuzn8FQvIxA6+y+Yao04qPZg++Wu5zpopNUtDf6y9uBg+IcxdH6TzKQO9THL6Lk/wMqUtzVrjPFbU1x6DulALUMYaz4yd7r5ne/mUHk2wigYmrS/bnNrDOnL76aITK0hvNldiuGtULt4xXQ81Cs5YHqJ5la6Lh+kbjMWD/BhoOvj2swa8+LRUNh2JXUykfD89U37XfDNAqu/RS2rzCPy//OJwymb5B3T0CNE7BOfN3LToLP7rvfwDHry921w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727024065; c=relaxed/relaxed;
	bh=cDXzSPe1MVZL6bA/aT71NYh8grbD18vY1RpNOsvRV18=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=KHNIDh7n/UwkyE41yjTP3nB8KBc5MiBG5UG6ee3DKwt+r+s4UPQ8CliWK+7kWhauSmFmHUoII7wBRa4LwXDQv+P2M1NS+Pqe+/K2OqacKGGilDZzmwgoiO7AF+SpzNB5zx3WuMCfUG9idew/jBKuZxezN9B3ww2yGlUHUxQE3HkDw7F60mZkNK09URiF7AdZViTXvoBFv/25Vm+9wWK7pfa4Wjuk8Vjz+iRFpR7b+Q7eckPZsbaoNS2qN5xaMnpUbOnJE5HRLwQKI9QBRGfERNbjWpiKfmApNx9pb6Gw5RxG/uBXSSGI8zRVdEKryRhvcD/Y4tu2vrmCbO47WWmCdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bZW429sQ; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bZW429sQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBXKD6lMVz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 02:54:24 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48MDMHst008796;
	Sun, 22 Sep 2024 16:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:to:from:subject:content-type
	:content-transfer-encoding; s=pp1; bh=cDXzSPe1MVZL6bA/aT71NYh8gr
	bD18vY1RpNOsvRV18=; b=bZW429sQ1rFW2TXSntSIySS5MmnZTj3oYlMFU2kcOb
	HXvaD4tlW7b+SoUqWAkfd+/bjcYqK4L8h6iGzvLBbbmDwofrf+UL/VTwMDzLoLc5
	+wUrS2UiO8pZvEnrzzqTqdl/C6rLLLy/JanXUivBM8BNC2+fqcR5iNlLoqF2/1yA
	GhwwP5cwhogdsWE/8tnJk1z2HPlbh+ulmz7Md/wcfPW0mqlRSlSG5+WUy3jq5itH
	tHQHzSIlzUbUFzlNVgENXsasJXQDwdxu8YyNu9oM7lQSOrImlTqhjcCnNYa/cf14
	3ZYKO04ntMUMhCM0x9Yk1uIxHRT9cKM0QyGdWQHksaQA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41snn9ynse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Sep 2024 16:54:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48MG5DIk001138;
	Sun, 22 Sep 2024 16:54:03 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41t8fuat9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Sep 2024 16:54:03 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48MGs2rA46531012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Sep 2024 16:54:03 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BF4258056;
	Sun, 22 Sep 2024 16:54:02 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 779B85805A;
	Sun, 22 Sep 2024 16:54:00 +0000 (GMT)
Received: from [9.61.254.24] (unknown [9.61.254.24])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Sep 2024 16:54:00 +0000 (GMT)
Message-ID: <57130e48-dbb6-4047-a8c7-ebf5aaea93f4@linux.vnet.ibm.com>
Date: Sun, 22 Sep 2024 22:23:59 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        senozhatsky@chromium.org, akpm@linux-foundation.org,
        minchan@kernel.org, terrelln@fb.com, akpm@linux-foundation.org,
        sfr@canb.auug.org.au
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: [Bug][Git-Bisect][6.11.0-next-20240917]BUG: Unable to handle kernel
 data access on read at 0xc00c020000013d88
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nPD0UhJHllId_LXZezmC9IO7_7-pKplm
X-Proofpoint-ORIG-GUID: nPD0UhJHllId_LXZezmC9IO7_7-pKplm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_17,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=784 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409220129

Greetings!!!


I am observing Kernel OOPs on PowerPC system, while running LTP Test case.

Below is the Traces:

[11472.962838] BUG: Unable to handle kernel data access on read at 
0xc00c020000013d88
[11472.962846] Faulting instruction address: 0xc00000000055e2c0
[11472.962851] Oops: Kernel access of bad area, sig: 11 [#1]
[11472.962854] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
[11472.962860] Modules linked in: zram torture dummy veth dns_resolver 
tun brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq 
zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel nft_fib_inet 
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack 
bonding nf_defrag_ipv6 nf_defrag_ipv4 tls rfkill ip_set nf_tables 
libcrc32c nfnetlink kmem device_dax pseries_rng vmx_crypto dax_pmem fuse 
ext4 mbcache jbd2 sd_mod sg nd_pmem nd_btt papr_scm ibmvscsi 
scsi_transport_srp ibmveth libnvdimm [last unloaded: zram]
[11472.962920] CPU: 26 UID: 0 PID: 769950 Comm: zram03 Kdump: loaded 
Tainted: G   M       O       6.11.0-next-20240917 #1
[11472.962927] Tainted: [M]=MACHINE_CHECK, [O]=OOT_MODULE
[11472.962930] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.00 (NH1110_009) hv:phyp pSeries
[11472.962935] NIP:  c00000000055e2c0 LR: c008000004e02838 CTR: 
c00000000055e260
[11472.962940] REGS: c0000005da817890 TRAP: 0300   Tainted: G M       
O        (6.11.0-next-20240917)
[11472.962945] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 48008284  XER: 00000002
[11472.962956] CFAR: c008000004e064cc DAR: c00c020000013d88 DSISR: 
40000000 IRQMASK: 0
[11472.962956] GPR00: c008000004e02838 c0000005da817b30 c000000001604400 
c008000004f602d0
[11472.962956] GPR04: 00000000c0000005 000000000011442d c0000005881791c0 
000000000011442c
[11472.962956] GPR08: 0000000ef9a00000 0000020000013d80 c000000002da75f0 
c008000004e064b8
[11472.962956] GPR12: c00000000055e260 c000000efde77f00 0000000000000000 
0000000000000000
[11472.962956] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[11472.962956] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[11472.962956] GPR24: 0000000000000000 0000000000000000 c00000051f580440 
c00000036fa15480
[11472.962956] GPR28: c008000004e02838 0000000000002000 c00c020000013d80 
c008000004f602d0
[11472.963005] NIP [c00000000055e2c0] kfree+0x60/0x468
[11472.963013] LR [c008000004e02838] zram_destroy_comps+0x5c/0xa4 [zram]
[11472.963020] Call Trace:
[11472.963023] [c0000005da817b30] [c00000051f580440] 0xc00000051f580440 
(unreliable)
[11472.963028] [c0000005da817ba0] [c008000004e02838] 
zram_destroy_comps+0x5c/0xa4 [zram]
[11472.963034] [c0000005da817bd0] [c008000004e02d24] 
zram_reset_device+0x178/0x250 [zram]
[11472.963040] [c0000005da817c20] [c008000004e031e0] 
reset_store+0xd0/0x174 [zram]
[11472.963046] [c0000005da817c80] [c000000000a85874] 
dev_attr_store+0x34/0x50
[11472.963052] [c0000005da817ca0] [c00000000070e7a4] 
sysfs_kf_write+0x64/0x78
[11472.963060] [c0000005da817cc0] [c00000000070d2a8] 
kernfs_fop_write_iter+0x1b0/0x290
[11472.963066] [c0000005da817d10] [c000000000604868] vfs_write+0x38c/0x488
[11472.963071] [c0000005da817dc0] [c000000000604c98] ksys_write+0x84/0x140
[11472.963076] [c0000005da817e10] [c000000000033558] 
system_call_exception+0x138/0x330
[11472.963083] [c0000005da817e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[11472.963090] --- interrupt: 3000 at 0x7fffa2133e74
[11472.963094] NIP:  00007fffa2133e74 LR: 00007fffa2133e74 CTR: 
0000000000000000
[11472.963098] REGS: c0000005da817e80 TRAP: 3000   Tainted: G M       
O        (6.11.0-next-20240917)
[11472.963103] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44002484  XER: 00000000
[11472.963113] IRQMASK: 0
[11472.963113] GPR00: 0000000000000004 00007fffc66c6250 0000000010057f00 
0000000000000003
[11472.963113] GPR04: 000000002e730b90 0000000000000001 0000000000000000 
0000000000000001
[11472.963113] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[11472.963113] GPR12: 0000000000000000 00007fffa23ea5c0 0000000000000000 
0000000010033770
[11472.963113] GPR16: 0000000010033eb8 0000000010034548 000000001003454c 
0000000010033ee0
[11472.963113] GPR20: 0000000010033d10 00000000100343b8 0000000010032e70 
0000000000000000
[11472.963113] GPR24: 0000000010050838 000000001002e650 000000002e730b90 
0000000000000001
[11472.963113] GPR28: 0000000000000001 000000002e730370 000000002e730b90 
0000000000000001
[11472.963157] NIP [00007fffa2133e74] 0x7fffa2133e74
[11472.963160] LR [00007fffa2133e74] 0x7fffa2133e74
[11472.963163] --- interrupt: 3000
[11472.963166] Code: f9210028 39200000 60000000 283f0010 40810170 
fbc10060 3d22017a 394931f0 7be98502 79293664 ebca0000 7fde4a14 
<e93e0008> 3949ffff 71290001 7fde509e
[11472.963180] ---[ end trace 0000000000000000 ]---


Git Bisect is pointing to the below commit, as first bad commit.


Commit ID: 6a81bdfeb35094c3097650306a5fda9a990d8a97


Regards,

Venkat.




