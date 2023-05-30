Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D026715489
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 06:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVfqN069Vz3bTf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 14:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LfSJeQdL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LfSJeQdL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVfpZ0Qrpz3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 14:40:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34U4Lvdj028131;
	Tue, 30 May 2023 04:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=mAxR4TgqH8sEFY8pYBzBkgD3LIYfN4EtldXpoffU/xA=;
 b=LfSJeQdLRRossGqmAZRGn7W8LkPR3dDtNz40G/qqzDkkR86NCgDeArNzA3N1jzYL7uN3
 +f7VTLO4zmMFk1FR+G7BqAP+mCglDDXFqy2YaurYH1kz+I4mJyilTathnEJNMPk1IIui
 dVO0ABn65NddQ8PU1Wiug569KqFDyIKlj5C8tHdL/2OfgFg5aSXQCQIZuY1Mmwii+wJh
 MIIYDyxLd+dvWADLmLYV2LBnSPCJe6bL5pk1fxhzrkkXlKpHUeHqwWTC+RfSjV2yZzt6
 iXnqzTHQB3ZtG2LGPz+uizZRhusToVlB4cA958kKvJtGbibbOWbJPm4ARs6VO5Fyz9qA +A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qwa27gbvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 04:40:34 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34U2iBm9012027;
	Tue, 30 May 2023 04:40:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qu9g592se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 04:40:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34U4eS8J58524142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 May 2023 04:40:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D11320049;
	Tue, 30 May 2023 04:40:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6881620040;
	Tue, 30 May 2023 04:40:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.23.5])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 May 2023 04:40:27 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: WARNING at fs/btrfs/disk-io.c:275 during xfstests run(4k block)
Message-Id: <50217126-0798-4ED7-BF46-4DF14C99ED0D@linux.ibm.com>
Date: Tue, 30 May 2023 10:10:16 +0530
To: linux-btrfs@vger.kernel.org
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OidfXdEoNtRj9uNHs2qu7P9WxGwpi-G1
X-Proofpoint-GUID: OidfXdEoNtRj9uNHs2qu7P9WxGwpi-G1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_02,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=666 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: riteshh@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running xfstests against btrfs (with 4k block size) on IBM Power =
server
booted with 6.4.0-rc3-next-20230525, following warning is seen. This =
warning
Is seen several times during the test run.

This problem was first seen with 6.4.0-rc2-next-20230516

[ 365.885258] run fstests btrfs/001 at 2023-05-29 14:40:10
[ 366.070754] BTRFS: device fsid 07324444-a1c0-452c-8409-4fa8f9b69e51 =
devid 1 transid 6 /dev/sdb2 scanned by mkfs.btrfs (27139)
[ 366.076267] BTRFS info (device sdb2): using crc32c (crc32c-generic) =
checksum algorithm
[ 366.076286] BTRFS info (device sdb2): using free space tree
[ 366.076292] BTRFS warning (device sdb2): read-write for sector size =
4096 with page size 65536 is experimental
[ 366.078153] BTRFS info (device sdb2): enabling ssd optimizations
[ 366.078319] BTRFS info (device sdb2): checking UUID tree
[ 366.084911] ------------[ cut here ]------------
[ 366.084923] WARNING: CPU: 16 PID: 27174 at fs/btrfs/disk-io.c:275 =
btree_csum_one_bio+0xdc/0x310 [btrfs]
[ 366.084962] Modules linked in: dm_mod nft_fib_inet nft_fib_ipv4 =
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 =
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 bonding rfkill tls ip_set nf_tables nfnetlink sunrpc =
btrfs blake2b_generic xor raid6_pq zstd_compress nd_pmem libcrc32c =
nd_btt dax_pmem pseries_rng papr_scm libnvdimm vmx_crypto =
aes_gcm_p10_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 =
sg ibmvscsi ibmveth scsi_transport_srp fuse
[ 366.085003] CPU: 16 PID: 27174 Comm: btrfs Tainted: G W =
6.4.0-rc3-next-20230525 #1
[ 366.085009] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[ 366.085014] NIP: c008000001a2eed4 LR: c008000001b1b5a4 CTR: =
0000000000000000
[ 366.085018] REGS: c00000001a3bb030 TRAP: 0700 Tainted: G W =
(6.4.0-rc3-next-20230525)
[ 366.085023] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> =
CR: 24002882 XER: 20040000
[ 366.085033] CFAR: c008000001a2ee78 IRQMASK: 0=20
[ 366.085033] GPR00: c008000001b1b5a4 c00000001a3bb2d0 c00800000165a700 =
c0000000d18cca80=20
[ 366.085033] GPR04: c0000001029da290 0000000000000000 0000000000004000 =
0000000001d44000=20
[ 366.085033] GPR08: c00c00000021fd40 0000000000000000 0000000000000000 =
c00000000a19d890=20
[ 366.085033] GPR12: 0000000084002482 c000000aa7cf6f00 0000000000000000 =
0000000000000001=20
[ 366.085033] GPR16: c00000001a3bb790 0000000000000000 c00000001a3bb770 =
0000000000000000=20
[ 366.085033] GPR20: c00000001a3bb558 0000000001d40000 0000000000000000 =
c00000001a3bb558=20
[ 366.085033] GPR24: c0000000879ed000 c0000000d18cca80 c0000000fd947a80 =
c0000000879ed000=20
[ 366.085033] GPR28: c0000000d18ccb30 0000000000004000 c000000002c67490 =
c0000000d1a0c558=20
[ 366.085078] NIP [c008000001a2eed4] btree_csum_one_bio+0xdc/0x310 =
[btrfs]
[ 366.085110] LR [c008000001b1b5a4] btrfs_bio_csum+0x4c/0x70 [btrfs]
[ 366.085139] Call Trace:
[ 366.085141] [c00000001a3bb2d0] [0000000000000006] 0x6 (unreliable)
[ 366.085146] [c00000001a3bb380] [0000000001d44000] 0x1d44000
[ 366.085150] [c00000001a3bb3a0] [c008000001b1c554] =
btrfs_submit_chunk+0x51c/0x560 [btrfs]
[ 366.085179] [c00000001a3bb440] [c008000001b1c67c] =
btrfs_submit_bio+0x44/0x70 [btrfs]
[ 366.085207] [c00000001a3bb470] [c008000001a74ec0] =
write_one_eb+0x2f8/0x3c0 [btrfs]
[ 366.085242] [c00000001a3bb4d0] [c008000001a75460] =
btree_write_cache_pages+0x4d8/0x7b0 [btrfs]
[ 366.085276] [c00000001a3bb660] [c008000001a2d04c] =
btree_writepages+0x94/0xe0 [btrfs]
[ 366.085308] [c00000001a3bb690] [c00000000044df24] =
do_writepages+0x114/0x290
[ 366.085316] [c00000001a3bb710] [c000000000436f58] =
filemap_fdatawrite_wbc+0xb8/0x140
[ 366.085322] [c00000001a3bb750] [c00000000043df60] =
__filemap_fdatawrite_range+0x80/0xc0
[ 366.085327] [c00000001a3bb800] [c008000001a37dc0] =
btrfs_write_marked_extents+0x78/0x1b0 [btrfs]
[ 366.085360] [c00000001a3bb870] [c008000001a37f60] =
btrfs_write_and_wait_transaction.isra.22+0x68/0x140 [btrfs]
[ 366.085393] [c00000001a3bb8e0] [c008000001a3a2d8] =
btrfs_commit_transaction+0x610/0x11f0 [btrfs]
[ 366.085425] [c00000001a3bb9d0] [c008000001a8ccf0] =
btrfs_mksubvol.isra.36+0x4e8/0x5b0 [btrfs]
[ 366.085460] [c00000001a3bbab0] [c008000001a8ce8c] =
btrfs_mksnapshot+0xd4/0x140 [btrfs]
[ 366.085493] [c00000001a3bbb20] [c008000001a8d110] =
__btrfs_ioctl_snap_create+0x218/0x260 [btrfs]
[ 366.085526] [c00000001a3bbbd0] [c008000001a8d3fc] =
btrfs_ioctl_snap_create_v2+0x1a4/0x1f0 [btrfs]
[ 366.085559] [c00000001a3bbc30] [c008000001a910a4] =
btrfs_ioctl+0x1dac/0x3180 [btrfs]
[ 366.085592] [c00000001a3bbdc0] [c0000000005a7098] sys_ioctl+0xf8/0x190
[ 366.085598] [c00000001a3bbe10] [c0000000000374b0] =
system_call_exception+0x140/0x350
[ 366.085604] [c00000001a3bbe50] [c00000000000d6a0] =
system_call_common+0x160/0x2e4
[ 366.085610] --- interrupt: c00 at 0x7fffa5f29b70
[ 366.085614] NIP: 00007fffa5f29b70 LR: 000000001007a968 CTR: =
0000000000000000
[ 366.085618] REGS: c00000001a3bbe80 TRAP: 0c00 Tainted: G W =
(6.4.0-rc3-next-20230525)
[ 366.085625] MSR: 800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE> CR: =
24000444 XER: 00000000
[ 366.085644] IRQMASK: 0=20
[ 366.085644] GPR00: 0000000000000036 00007ffff654b320 00007fffa6007300 =
0000000000000003=20
[ 366.085644] GPR04: 0000000090009417 00007ffff654b3a0 0000000000000001 =
000000000000001a=20
[ 366.085644] GPR08: 0000000000000003 0000000000000000 0000000000000000 =
0000000000000000=20
[ 366.085644] GPR12: 0000000000000000 00007fffa65ef7a0 0000000000000000 =
0000000000000000=20
[ 366.085644] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 366.085644] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
000000001a0902cd=20
[ 366.085644] GPR24: 00007ffff654de6e 000000001a0902e0 0000000000000000 =
000000001a0902c0=20
[ 366.085644] GPR28: 0000000000000000 000000001a0902e0 0000000000000004 =
0000000000000003=20
[ 366.085725] NIP [00007fffa5f29b70] 0x7fffa5f29b70
[ 366.085731] LR [000000001007a968] 0x1007a968
[ 366.085737] --- interrupt: c00
[ 366.085742] Code: ebe1fff8 4e800020 60000000 7fa74840 409e016c =
e9280008 712a0001 3929ffff 7d08489e e9280000 71290004 40820020 =
<0fe00000> 7c0802a6 fb810090 fba10098=20
[ 366.085768] ---[ end trace 0000000000000000 ]---
[ 366.086029] BTRFS: error (device sdb2) in =
btrfs_commit_transaction:2478: errno=3D-5 IO failure (Error while =
writing out transaction)
[ 366.086043] BTRFS info (device sdb2: state E): forced readonly

- Sachin=
