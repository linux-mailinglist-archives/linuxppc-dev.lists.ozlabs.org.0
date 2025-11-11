Return-Path: <linuxppc-dev+bounces-14102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B95C4EC4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 16:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5VhZ52rzz2yvL;
	Wed, 12 Nov 2025 02:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762874702;
	cv=none; b=k+m5D/10nSjU/uSUG00EoSBH3v8HaqdoTWrR5ElotvfoacOvScC0SmaJ1dy2SXWhKgKh+i7KoJaWw+3d095XKzkXB1MjAl7JJsrW7HJ1WKvtAGFCVXnr/73zWMmgJEmL82H/E8F0k3PxipYEzhbOXaSXLEFJaytq3TbF0WDYMGMuovRrFiCgFQ2dbv/AQ6abddviMgFJ7HP32O8YMZrAUHuwdsQB5T3PRFQdt0nyAwnQP4PZRSJtWWb9kRG55DJjTcDDje4v8Uzu2od+P0kmNPEQm0Jp98JdRj/84c1TV9kkDqosmYlyCuecx9WdnaU7F7GyWt5b1brj2jowmPv50g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762874702; c=relaxed/relaxed;
	bh=4BASWbvIuxVJ1/tlwvxzEHohJoOZtdWTr9GGY1GkSao=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Cuf0CV3uXa/wPDs3+rOhVNJdldE+bWs8cm4k+NafhktTgXjjdRaURIXNY9ZxdcDtdIGLsy33LtOOEHa/v7/piOSQDxhK9iRagk+db+s6MALAevdj9NSJ+VRmsoBM9tBBKfICOCq/aIv7mG6kwT+zdNP2lEIVEY1aoKwGQlABN9+or3amgOzciGi3oDZzUGTsyQOO4whvRA8s21G6nRmDjH5vjpzLzjmO+WkPMqqcpmW2/VzIeGjmS1jf5HR8uuH/G8/M6zHGBinhP7WWsbFkpvlMVGf6oERk+aBIQ927PreqyR2UrvqU+3mGadhr/F1IhGto48iFSE1RyvRr/iQYqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CWJtjKcM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CWJtjKcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5VhX6kvVz2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 02:25:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABDMcY0030450;
	Tue, 11 Nov 2025 15:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=4BASWbvIuxVJ1/tlwvxzEHohJoOZ
	tdWTr9GGY1GkSao=; b=CWJtjKcMx8KHIBkFoyO7BNOM+2vMjImvdutrprJn7fb9
	0qOSDwi0omuq5yVdUjp6Y21l12VqiPTgIKX0PivYxUgj/sgYNl3aWoy1NB24gjZK
	bcbpmvEXxtiUvZA+HqNdj3OFqRyBED4Z37XrD8rH9o1yztRIbVDd5f6mWZT1rlzD
	9/Up2EpT1ATmbg6u4LiSGe+wu2CsmNgNj4eqcupZl8zPVU+Tzd/ZUij4RxL0dvGy
	fHswdV+pYBtxv5Xs8cAKIZ8VT8Isxea8cbr0TWpqz4s2rJ04UBHSWHpKbQfy4SQQ
	xiIbV3U3uLWMZVWbVepkLfUA1fJnnK7cFD7pqoQMFg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wgwvjka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 15:24:46 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABDjclt008193;
	Tue, 11 Nov 2025 15:24:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aah6mue0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 15:24:45 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ABFOi3t11207398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Nov 2025 15:24:44 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FF435805A;
	Tue, 11 Nov 2025 15:24:44 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D28AF58051;
	Tue, 11 Nov 2025 15:24:40 +0000 (GMT)
Received: from [9.61.250.35] (unknown [9.61.250.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Nov 2025 15:24:40 +0000 (GMT)
Message-ID: <3349ddbd-ec27-431b-a5f3-de0137d26a4b@linux.ibm.com>
Date: Tue, 11 Nov 2025 20:54:39 +0530
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
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [linux-next20251111]KASAN null-ptr-deref in bio_get_last_bvec() after
 "block: accumulate memory segment gaps per bio"
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, riteshh@linux.ibm.com,
        ojaswin@linux.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        kbusch@kernel.org, hch@lst.de, martin.petersen@oracle.com,
        Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d6IvfUTnqMXnd8sAegl7FlvmIhbcOclS
X-Proofpoint-ORIG-GUID: d6IvfUTnqMXnd8sAegl7FlvmIhbcOclS
X-Authority-Analysis: v=2.4 cv=VMPQXtPX c=1 sm=1 tr=0 ts=6913553e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=VnNF1IyMAAAA:8
 a=Pa4mdd00d5Sf86zwjhQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfX2rITuUru5hsy
 SXpusqQSR/m7uXSO/4vrNGzqqbQGpHS3EPwttciA6wOwoz4XDYro4As9jw0qPRSqKDVF8Kzyhr6
 BlZap14kN175VW4n25YOEBCrPiQ1MmN92QFCAaEzMDUrF26ii2kCOX4eH2WrEayVYs2Fg/2pUc/
 ujSV61GQJd71Yr83yXzw1TgLEvB/8z180spnXvYcOCfGrs8VlLgjTKASCKzBJpd5vu9kj4/FgGx
 9w+G0SrufM5p6zTj510o6+kSJMVsj+vgRV9l1Fb+Qv+QfTciUTvrmhGdYj0vzIs/xnnmQ+efVag
 GT+Mo8ReJD8Ugo5hKx51lGnwK/8QlgL3sSrNUEvT43fOtCYSJ+q8c/yZKEofdTaG6bNDbunESxr
 +I152cWhsyUGl/ozBAswMyvSoD/MUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEXHASH_WORD,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!

IBM CI has reported a null pointer dereference, while running xfstests.


Steps to reproduce:

Run xfstests on a loop device formatted with ext4.

Test:

generic/500


Traces:


[ 7650.655035] run fstests generic/500 at 2025-11-10 03:23:03
[ 7655.882098] BUG: Kernel NULL pointer dereference at 0x00000000
[ 7655.882117] Faulting instruction address: 0xc000000000cd8ab4
[ 7655.882126] Oops: Kernel access of bad area, sig: 11 [#1]
[ 7655.882133] LE PAGE_SIZE=64K MMU=Hash  SMP NR_CPUS=8192 NUMA pSeries
[ 7655.882144] Modules linked in: dm_thin_pool dm_persistent_data 
dm_bio_prison xfs dm_flakey dm_snapshot dm_bufio dm_zero nft_fib_inet 
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack 
bonding nf_defrag_ipv6 nf_defrag_ipv4 tls ip_set rfkill nf_tables 
ibmveth pseries_rng sg vmx_crypto dm_multipath fuse dm_mod loop 
nfnetlink vsock_loopback vmw_vsock_virtio_transport_common vsock ext4 
crc16 mbcache jbd2 sr_mod sd_mod cdrom ibmvscsi scsi_transport_srp [last 
unloaded: scsi_debug]
[ 7655.882279] CPU: 28 UID: 0 PID: 13 Comm: kworker/u224:1 Kdump: loaded 
Not tainted 6.18.0-rc4-next-20251110 #1 VOLUNTARY
[ 7655.882291] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[ 7655.882301] Workqueue: dm-thin do_worker [dm_thin_pool]
[ 7655.882325] NIP:  c000000000cd8ab4 LR: c000000000cd8aac CTR: 
c000000000cef630
[ 7655.882334] REGS: c000000007c471f0 TRAP: 0380   Not tainted 
(6.18.0-rc4-next-20251110)
[ 7655.882343] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 24028002  XER: 20040000
[ 7655.882376] CFAR: c0000000008ea140 IRQMASK: 0
[ 7655.882376] GPR00: c000000000cda894 c000000007c47490 c0000000024ba800 
c0000000bcd70520
[ 7655.882376] GPR04: c000000007c47528 c0000000bcd7e5f8 0000000000000000 
0000000000000003
[ 7655.882376] GPR08: 0000000000000001 0000000000000000 0000000000000000 
0000000024002000
[ 7655.882376] GPR12: 0000000000000000 c000000017f8d900 00000000000006db 
c00000018c5ca300
[ 7655.882376] GPR16: c00000018eb2fa28 c00000018eb2fa40 0000000000000808 
c0000001e4c1e94c
[ 7655.882376] GPR20: c00000018eb2f9f0 c000000007c47be8 0000000000000000 
0000000000000000
[ 7655.882376] GPR24: 0000000000000000 0000000000000000 0000000000000000 
c000000007c47528
[ 7655.882376] GPR28: 0000000000000000 0000000000000000 0000000000000000 
c0000000bcd704f8
[ 7655.882495] NIP [c000000000cd8ab4] bio_get_last_bvec+0x84/0x260
[ 7655.882507] LR [c000000000cd8aac] bio_get_last_bvec+0x7c/0x260
[ 7655.882518] Call Trace:
[ 7655.882522] [c000000007c47490] [c000000007c47500] 0xc000000007c47500 
(unreliable)
[ 7655.882536] [c000000007c47500] [c000000000cda894] bio_seg_gap+0xb4/0x2d0
[ 7655.882548] [c000000007c475a0] [c000000000cdc5f4] 
bio_attempt_back_merge+0x154/0x330
[ 7655.882561] [c000000007c47600] [c000000000cdd0cc] 
blk_attempt_plug_merge+0x15c/0x1e0
[ 7655.882574] [c000000007c47660] [c000000000cefa48] 
blk_mq_submit_bio+0xee8/0xfc0
[ 7655.882587] [c000000007c47740] [c000000000cca528] __submit_bio+0xe8/0x590
[ 7655.882600] [c000000007c477f0] [c000000000ccaab0] 
__submit_bio_noacct+0xe0/0x340
[ 7655.882614] [c000000007c47890] [c0080000051c12b4] 
end_discard+0x9c/0x180 [dm_thin_pool]
[ 7655.882637] [c000000007c478e0] [c0080000051c67dc] 
process_prepared_discard_passdown_pt1+0x2d4/0x2f0 [dm_thin_pool]
[ 7655.882663] [c000000007c479a0] [c0080000051c4ec8] 
break_up_discard_bio+0x260/0x480 [dm_thin_pool]
[ 7655.882687] [c000000007c47aa0] [c0080000051c517c] 
process_discard_cell_passdown+0x94/0xd0 [dm_thin_pool]
[ 7655.882712] [c000000007c47ae0] [c0080000051ca3e4] 
process_discard_bio+0x1bc/0x2a0 [dm_thin_pool]
[ 7655.882736] [c000000007c47bb0] [c0080000051cdb04] 
process_thin_deferred_bios+0x4cc/0x780 [dm_thin_pool]
[ 7655.882760] [c000000007c47ca0] [c0080000051cde60] 
process_deferred_bios+0xa8/0x4d0 [dm_thin_pool]
[ 7655.882784] [c000000007c47d10] [c0080000051ce46c] 
do_worker+0x1e4/0x330 [dm_thin_pool]
[ 7655.882808] [c000000007c47d90] [c0000000002c02cc] 
process_one_work+0x41c/0x8b0
[ 7655.882821] [c000000007c47ea0] [c0000000002c37bc] 
worker_thread+0x56c/0x840
[ 7655.882833] [c000000007c47f80] [c0000000002d4484] kthread+0x214/0x230
[ 7655.882845] [c000000007c47fe0] [c00000000000ded8] 
start_kernel_thread+0x14/0x18
[ 7655.882857] Code: 60000000 387f0070 839f0030 4bc11659 60000000 
eb1f0070 7bba2708 7f38d214 7f23cb78 4bc11641 60000000 387f0028 
<7ef8d02a> 4bc11491 60000000 38790008
[ 7655.882902] ---[ end trace 0000000000000000 ]---



Git Bisect is pointing to below commit as first bad commit.


git bisect bad
2f6b2565d43cdb5087cac23d530cca84aa3d897e is the first bad commit
commit 2f6b2565d43cdb5087cac23d530cca84aa3d897e
Author: Keith Busch <kbusch@kernel.org>
Date:   Tue Oct 14 08:04:55 2025 -0700

     block: accumulate memory segment gaps per bio

     The blk-mq dma iterator has an optimization for requests that align to
     the device's iommu merge boundary. This boundary may be larger than the
     device's virtual boundary, but the code had been depending on that 
queue
     limit to know ahead of time if the request is guaranteed to align to
     that optimization.

     Rather than rely on that queue limit, which many devices may not 
report,
     save the lowest set bit of any boundary gap between each segment in the
     bio while checking the segments. The request stores the value for
     merging and quickly checking per io if the request can use iova
     optimizations.

     Signed-off-by: Keith Busch <kbusch@kernel.org>
     Reviewed-by: Christoph Hellwig <hch@lst.de>
     Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
     Signed-off-by: Jens Axboe <axboe@kernel.dk>

  block/bio.c               |  1 +
  block/blk-map.c           |  3 +++
  block/blk-merge.c         | 39 ++++++++++++++++++++++++++++++++++++---
  block/blk-mq-dma.c        |  3 +--
  block/blk-mq.c            |  6 ++++++
  include/linux/bio.h       |  2 ++
  include/linux/blk-mq.h    | 16 ++++++++++++++++
  include/linux/blk_types.h | 12 ++++++++++++
  8 files changed, 77 insertions(+), 5 deletions(-)

Git Bisect logs:


git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [2666975a8905776d306bee01c5d98a0395bda1c9] Add linux-next 
specific files for 20251111
git bisect bad 2666975a8905776d306bee01c5d98a0395bda1c9
# status: waiting for good commit(s), bad commit known
# good: [4ea7c1717f3f2344f7a1cdab4f5875cfa89c87a9] Merge tag 'for-linus' 
of git://git.kernel.org/pub/scm/virt/kvm/kvm
git bisect good 4ea7c1717f3f2344f7a1cdab4f5875cfa89c87a9
# good: [62c78703c002a5563e305a0db97257e04489672b] Merge branch 
'spi-nor/next' of 
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good 62c78703c002a5563e305a0db97257e04489672b
# good: [24fd43d8197860e57bef698fb0a3f50448aa4b45] Merge branch 'next' 
of https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
git bisect good 24fd43d8197860e57bef698fb0a3f50448aa4b45
# bad: [1dcca5daaeef97a1cd94c678378d16966e23a62a] Merge branch 'next' of 
https://github.com/kvm-x86/linux.git
git bisect bad 1dcca5daaeef97a1cd94c678378d16966e23a62a
# bad: [45d83be236d5a70eb770bfe7069160dbb657ecb5] Merge branch 
'for-next' of 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
git bisect bad 45d83be236d5a70eb770bfe7069160dbb657ecb5
# bad: [9b751912678c381b1c2e84df3be7564b02dcdb7f] Merge branch 
'for-next' of 
https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git
git bisect bad 9b751912678c381b1c2e84df3be7564b02dcdb7f
# good: [dbf8357cf71945821041f8b4cb51053074fe79e0] Merge branch 
'for-6.19/block' into for-next
git bisect good dbf8357cf71945821041f8b4cb51053074fe79e0
# bad: [cf39932588cddbdc78cc32c8eb2c7efce8fb119d] Merge branch 
'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
git bisect bad cf39932588cddbdc78cc32c8eb2c7efce8fb119d
# bad: [a68b67ed6a73d0ec988cd7df9e267171b79fa7bf] Merge branch 
'io_uring-6.18' into for-next
git bisect bad a68b67ed6a73d0ec988cd7df9e267171b79fa7bf
# bad: [9f5d1708256a9f468ab116c58764e2acc35495d6] Merge branch 
'for-6.19/block' into for-next
git bisect bad 9f5d1708256a9f468ab116c58764e2acc35495d6
# good: [b822e8fa6a20ed3ca95a237292af5a154d5fe950] Merge branch 
'for-6.19/block' into for-next
git bisect good b822e8fa6a20ed3ca95a237292af5a154d5fe950
# bad: [bc840b21a25a50f00e2b240329c09281506df387] nvme: remove virtual 
boundary for sgl capable devices
git bisect bad bc840b21a25a50f00e2b240329c09281506df387
# bad: [2f6b2565d43cdb5087cac23d530cca84aa3d897e] block: accumulate 
memory segment gaps per bio
git bisect bad 2f6b2565d43cdb5087cac23d530cca84aa3d897e
# first bad commit: [2f6b2565d43cdb5087cac23d530cca84aa3d897e] block: 
accumulate memory segment gaps per bio



If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.




