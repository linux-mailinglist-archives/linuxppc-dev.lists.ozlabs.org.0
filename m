Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E471549A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 06:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVg4R4YKPz3fKn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 14:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bKbZg5t0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bKbZg5t0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVg2p3nksz3f6j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 14:51:14 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34U4jEkJ003079;
	Tue, 30 May 2023 04:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=ol2AgSMG3WBrhopJbYAgsKsjvvOflnzitJU0Mg7jUM4=;
 b=bKbZg5t0qHNmNzmpIPIZpNslIKVD1H18ZLpsfWKeuvx32lIcSv//Npi19jjwf9OVqOLX
 IMfvoNyBelGTfL77zqmLLviOqNzzFp1Cjd/4zlsSTfiYvdwiWrvBRkQPXUlxC5hQqPgX
 LeYixqYpfpGz9kfp5T87sw/on1+RwqLT14H2oj0vO1Dt8QQVkfZuwaCLG2uD961k0Nhc
 G3dRJ8O3MmRtaVWWtaZ9mpvHPtC3/+isWCieWH/ZTI+dwPGVM2u00CAKmhoYW1/Fl8zk
 fN0sP1yOx0TMBS1fwhH6yMy2VwApMaErBQV7+rdF33n7RKfa3kFVWkypjOifXtIN24v2 pA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qwa27gh9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 04:51:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34U2f73P007278;
	Tue, 30 May 2023 04:51:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qu9g5992m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 04:51:08 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34U4p64V21693076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 May 2023 04:51:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CB9520049;
	Tue, 30 May 2023 04:51:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D141F20043;
	Tue, 30 May 2023 04:51:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.23.5])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 May 2023 04:51:05 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Kernel crash with ftrace tests 
Message-Id: <A8DCEA9E-BBB4-4B73-9D2F-12C31318AB96@linux.ibm.com>
Date: Tue, 30 May 2023 10:20:54 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Oi98zOWbm86gSn1UNbO6jMd8MNgL2X32
X-Proofpoint-GUID: Oi98zOWbm86gSn1UNbO6jMd8MNgL2X32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_02,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=690 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300036
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
Cc: open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running ftrace specific kernel selftests on IBM Power9 server,
following crash is observed. I have observed this crash only on Power9.
Similar test run on a Power10 server works.

[14350.791484] Kernel attempted to read user page (8) - exploit attempt? =
(uid: 0)
[14350.791507] BUG: Kernel NULL pointer dereference on read at =
0x00000008
[14350.791514] Faulting instruction address: 0xc0000000004bf0e0
[14350.791521] Oops: Kernel access of bad area, sig: 11 [#1]
[14350.791526] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D8192 NUMA =
pSeries
[14350.791532] Modules linked in: nvram rpadlpar_io rpaphp uinput =
torture dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache netfs brd =
overlay exfat vfat fat xfs loop sctp ip6_udp_tunnel udp_tunnel dm_mod =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set bonding tls rfkill =
nf_tables libcrc32c nfnetlink sunrpc pseries_rng vmx_crypto ext4 mbcache =
jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp =
ibmveth fuse [last unloaded: test_cpuidle_latency(O)]
[14350.791616] CPU: 8 PID: 1169868 Comm: perl Tainted: G O =
6.4.0-rc4-g8b817fded42d #1
[14350.791623] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 =
0xf000005 of:IBM,FW950.50 (VL950_105) hv:phyp pSeries
[14350.791629] NIP: c0000000004bf0e0 LR: c000000000498924 CTR: =
c0000000002e8f60
[14350.791635] REGS: c0000002c8313830 TRAP: 0300 Tainted: G O =
(6.4.0-rc4-g8b817fded42d)
[14350.791641] MSR: 8000000000009033 <SF,EE,ME,IR,DR,RI,LE> CR: 483139c4 =
XER: 20040000
[14350.791655] CFAR: c00000000000dbbc DAR: 0000000000000008 DSISR: =
40000000 IRQMASK: 0=20
[14350.791655] GPR00: c000000000498924 c0000002c8313ad0 c000000001411300 =
0000000000000000=20
[14350.791655] GPR04: c00000001d939d68 0000000000000000 0000000000010000 =
0000000000000008=20
[14350.791655] GPR08: ffffffffffffffff 0000000000008000 0000000000000800 =
0000000000000001=20
[14350.791655] GPR12: 0000000000003000 c00000001ec56700 0000000000000000 =
0000000000000000=20
[14350.791655] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[14350.791655] GPR20: 0000000000000000 c000000002c67400 c0000001be8b4000 =
c000000002c67378=20
[14350.791655] GPR24: c00000001a41d200 c00000001a41d200 00007fffb8eb0000 =
0000000000000000=20
[14350.791655] GPR28: 8603721f020000c0 c00000001d939d68 0000000000000000 =
c0000002c8313c18=20
[14350.791724] NIP [c0000000004bf0e0] page_remove_rmap+0x40/0x320
[14350.791732] LR [c000000000498924] wp_page_copy+0x384/0xde0
[14350.791738] Call Trace:
[14350.791741] [c0000002c8313ad0] [c00000001a41d200] 0xc00000001a41d200 =
(unreliable)
[14350.791749] [c0000002c8313b20] [c000000000498924] =
wp_page_copy+0x384/0xde0
[14350.791756] [c0000002c8313bf0] [c0000000004a1a34] =
__handle_mm_fault+0x9a4/0xf90
[14350.791764] [c0000002c8313cf0] [c0000000004a2110] =
handle_mm_fault+0xf0/0x350
[14350.791771] [c0000002c8313d40] [c000000000094b8c] =
___do_page_fault+0x47c/0xc20
[14350.791780] [c0000002c8313df0] [c000000000095540] =
hash__do_page_fault+0x30/0x70
[14350.791788] [c0000002c8313e20] [c00000000009e378] =
do_hash_fault+0x278/0x470
[14350.791794] [c0000002c8313e50] [c000000000008be0] =
data_access_common_virt+0x210/0x220
[14350.791802] --- interrupt: 300 at 0x7fffb8e91968
[14350.791807] NIP: 00007fffb8e91968 LR: 00007fffb8e91958 CTR: =
0000000000000000
[14350.791812] REGS: c0000002c8313e80 TRAP: 0300 Tainted: G O =
(6.4.0-rc4-g8b817fded42d)
[14350.791818] MSR: 800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 24000422 XER: 00000000
[14350.791835] CFAR: 00007fffb8e9185c DAR: 00007fffb8eb0000 DSISR: =
0a000000 IRQMASK: 0=20
[14350.791835] GPR00: 00007fffb9684d14 00007fffc55f14f0 00007fffb8eb7f00 =
00007fffb8eb0000=20
[14350.791835] GPR04: 0000000000000001 00007fffb9122840 0000000000000001 =
0000000000000000=20
[14350.791835] GPR08: 00007fffb9122890 0000000000000001 0000000000000000 =
00007fffc55f1440=20
[14350.791835] GPR12: 0000000000000000 00007fffb96dce80 0000000000000000 =
0000000000000000=20
[14350.791835] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[14350.791835] GPR20: 00007fffb8eafb38 00007fffc55f15a8 00007fffc55f1560 =
00007fffc55f1550=20
[14350.791835] GPR24: 0000010022406210 0000000000000000 00007fffb96d0988 =
00007fffb96d0000=20
[14350.791835] GPR28: 0000000000000000 00007fffb96d0000 00007fffb8eafb38 =
00007fffc55f1550=20
[14350.791902] NIP [00007fffb8e91968] 0x7fffb8e91968
[14350.791907] LR [00007fffb8e91958] 0x7fffb8e91958
[14350.791911] --- interrupt: 300
[14350.791914] Code: 7c0802a6 7d908026 fb61ffd8 fba1ffe8 fbc1fff0 =
fbe1fff8 7c7e1b78 7c9d2378 7cbb2b78 91810008 f8010010 f821ffb1 =
<e9230008> 712a0001 3929ffff 7fe3489e=20
[14350.791937] ---[ end trace 0000000000000000 ]---
[14350.793185] pstore: backend (nvram) writing error (-1)
[14350.793190]=20
[14351.793195] Kernel panic - not syncing: Fatal exception

- Sachin=
