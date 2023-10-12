Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F57C6B0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 12:27:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n6GYBrQ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5m684YCFz3cc0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 21:27:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n6GYBrQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5m5D1C71z3c6Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 21:26:23 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CAM8kW026772;
	Thu, 12 Oct 2023 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=UJWNjbVQzor2DlSTFHeZv3gbirB2ElWvs2lee4LshFY=;
 b=n6GYBrQ9mazfJUzUBJkGwE3PodS+9weSsHQPT7SqZrFzQQzgGBE/+ZwdSdkDvMXsXzrK
 F7LrSeHqSCBjHKZ8POAywZ4KBxIaqENKRPuYBhaZzgUboOPabJLO43hpDyL/R5CyBwgj
 QENu2bYXwdQpctm4/Cy3kiI5FDvctdL3rD4+0Jl4EhlYkj4d48q5RCGfJKmstctV58EM
 WCJGHiWcgiT3vaHKQkVFm+5U72ldAgBWwa2pdpYtBaW2AZDTPkir3gOiTuCQPPlriRX0
 29hzhhPDPSxvXstT/9KExeTiZX8tUivqe/kxhWetirIqbc9Cjggy/Y77PGAPnTmn15pt pA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpe66197a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 10:26:20 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39C7pCm9000653;
	Thu, 12 Oct 2023 10:21:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5kxkd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 10:21:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CALGSk46400104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 10:21:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6417F20067;
	Thu, 12 Oct 2023 10:21:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B771B20069;
	Thu, 12 Oct 2023 10:21:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.240.204])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 10:21:15 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: [powerpc] kernel BUG fs/xfs/xfs_message.c:102! [4k block]
Message-Id: <EF7138E1-92EF-4A27-A666-316AAD7EFA43@linux.ibm.com>
Date: Thu, 12 Oct 2023 15:51:04 +0530
To: linux-xfs@vger.kernel.org
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1IVdLIzergMS8vE_PMNUjp6TkKLQl3Iz
X-Proofpoint-ORIG-GUID: 1IVdLIzergMS8vE_PMNUjp6TkKLQl3Iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120085
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

While running xfstests on a IBM Power10 server having xfs file system =
with
4k block size following crash was seen

[ 1609.771548] run fstests xfs/238 at 2023-10-11 17:00:40
[ 1609.971214] XFS (sdb1): Mounting V5 Filesystem =
1105d60c-9514-4e7a-af6a-632d99bf06ea
[ 1609.980693] XFS (sdb1): Ending clean mount
[ 1609.982166] xfs filesystem being mounted at /mnt/test supports =
timestamps until 2038-01-19 (0x7fffffff)
[ 1610.024793] XFS (sdb2): Mounting V5 Filesystem =
60de8f0c-c80e-4a2a-b60a-f41a9cc0feca
[ 1610.030295] XFS (sdb2): Ending clean mount
[ 1610.031342] xfs filesystem being mounted at /mnt/scratch supports =
timestamps until 2038-01-19 (0x7fffffff)
[ 1610.087139] XFS: Assertion failed: bp->b_flags & XBF_DONE, file: =
fs/xfs/xfs_trans_buf.c, line: 241
[ 1610.087162] ------------[ cut here ]------------
[ 1610.087165] kernel BUG at fs/xfs/xfs_message.c:102!
[ 1610.087168] Oops: Exception in kernel mode, sig: 5 [#1]
[ 1610.087171] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D8192 NUMA =
pSeries
[ 1610.087175] Modules linked in: overlay dm_zero dm_thin_pool =
dm_persistent_data dm_bio_prison dm_snapshot dm_bufio loop dm_flakey xfs =
dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill ip_set tls =
nf_tables libcrc32c nfnetlink pseries_rng vmx_crypto ext4 mbcache jbd2 =
sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp =
ibmveth fuse [last unloaded: scsi_debug]
[ 1610.087220] CPU: 11 PID: 225897 Comm: kworker/11:46 Not tainted =
6.6.0-rc5-gb8b05bc6d83c #1
[ 1610.087224] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[ 1610.087227] Workqueue: xfs-inodegc/sdb2 xfs_inodegc_worker [xfs]
[ 1610.087303] NIP: c008000002857edc LR: c008000002857ec8 CTR: =
000000007fffffff
[ 1610.087306] REGS: c00000002441b810 TRAP: 0700 Not tainted =
(6.6.0-rc5-gb8b05bc6d83c)
[ 1610.087309] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> =
CR: 28000424 XER: 00000007
[ 1610.087318] CFAR: c008000002857d1c IRQMASK: 0=20
[ 1610.087318] GPR00: c008000002857ec8 c00000002441bab0 c008000002a68300 =
ffffffffffffffea=20
[ 1610.087318] GPR04: 000000000000000a c00000002441b9b0 0000000000000000 =
c0080000016c6c40=20
[ 1610.087318] GPR08: ffffffffffffffc0 0000000000000001 0000000000000000 =
c00800000285a3a8=20
[ 1610.087318] GPR12: c0000000008311d0 c00000117fff1b00 c000000000197de8 =
c00000000936bf40=20
[ 1610.087318] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
c0000009d16d48b0=20
[ 1610.087318] GPR20: c000000079e80205 c00000001cb52f80 c00000001cb52fc0 =
0000000080000000=20
[ 1610.087318] GPR24: 0000000000000001 c00000002441bbc8 c0000000e77a7000 =
c0000000209b7e00=20
[ 1610.087318] GPR28: c00800000279ae48 c0080000016b25f0 c00000002441bc10 =
c00000002dabaee8=20
[ 1610.087354] NIP [c008000002857edc] assfail+0x54/0x74 [xfs]
[ 1610.087420] LR [c008000002857ec8] assfail+0x40/0x74 [xfs]
[ 1610.087485] Call Trace:
[ 1610.087486] [c00000002441bab0] [c008000002857ec8] assfail+0x40/0x74 =
[xfs] (unreliable)
[ 1610.087551] [c00000002441bb10] [c00800000281cebc] =
xfs_trans_read_buf_map+0x384/0x590 [xfs]
[ 1610.087622] [c00000002441bba0] [c00800000279ae48] =
xfs_imap_to_bp+0x70/0xa8 [xfs]
[ 1610.087691] [c00000002441bbf0] [c00800000280c3ec] =
xfs_inode_item_precommit+0x244/0x320 [xfs]
[ 1610.087760] [c00000002441bc60] [c0080000027f3034] =
xfs_trans_run_precommits+0xac/0x160 [xfs]
[ 1610.087830] [c00000002441bcb0] [c0080000027f45b0] =
__xfs_trans_commit+0x68/0x430 [xfs]
[ 1610.087900] [c00000002441bd20] [c0080000027dfc30] =
xfs_inactive_ifree+0x158/0x2a0 [xfs]
[ 1610.087969] [c00000002441bdb0] [c0080000027dff84] =
xfs_inactive+0x20c/0x420 [xfs]
[ 1610.088037] [c00000002441bdf0] [c0080000027ceb90] =
xfs_inodegc_worker+0x148/0x250 [xfs]
[ 1610.088106] [c00000002441be40] [c000000000188130] =
process_scheduled_works+0x230/0x4f0
[ 1610.088113] [c00000002441bf10] [c00000000018b164] =
worker_thread+0x1e4/0x500
[ 1610.088118] [c00000002441bf90] [c000000000197f18] kthread+0x138/0x140
[ 1610.088122] [c00000002441bfe0] [c00000000000df98] =
start_kernel_thread+0x14/0x18
[ 1610.088127] Code: e8a5ca38 7c641b78 3c620000 e863ca48 f8010010 =
f821ffa1 4bfffd91 3d220000 e929ca50 89290010 2f890000 419e0008 =
<0fe00000> 0fe00000 38210060 e8010010=20
[ 1610.088140] ---[ end trace 0000000000000000 ]---
[ 1610.093928] sh (1070303): drop_caches: 3
[ 1610.095600] pstore: backend (nvram) writing error (-1)
[ 1610.095605]

xfs/238 test was executed when the crash was encountered.
Devices were formatted with 4k block size.

Running 'yes | mkfs -t xfs -f -b size=3D4096 -f /dev/sdb1'
meta-data=3D/dev/sdb1 isize=3D512 agcount=3D4, agsize=3D2621440 blks
 =3D sectsz=3D4096 attr=3D2, projid32bit=3D1
 =3D crc=3D1 finobt=3D1, sparse=3D1, rmapbt=3D0
 =3D reflink=3D1 bigtime=3D0 inobtcount=3D0
 data =3D bsize=3D4096 blocks=3D10485760, imaxpct=3D25
 =3D sunit=3D0 swidth=3D0 blks
 naming =3Dversion 2 bsize=3D4096 ascii-ci=3D0, ftype=3D1
 log =3Dinternal log bsize=3D4096 blocks=3D5120, version=3D2
 =3D sectsz=3D4096 sunit=3D1 blks, lazy-count=3D1
 realtime =3Dnone extsz=3D4096 blocks=3D0, rtextents=3D0
Command 'yes | mkfs -t xfs -f -b size=3D4096 -f /dev/sdb1' finished with =
0 after 0.017013929s

Running 'yes | mkfs -t xfs -f -b size=3D4096 -f /dev/sdb2'
meta-data=3D/dev/sdb2 isize=3D512 agcount=3D4, agsize=3D2621376 blks
 =3D sectsz=3D4096 attr=3D2, projid32bit=3D1
 =3D crc=3D1 finobt=3D1, sparse=3D1, rmapbt=3D0
 =3D reflink=3D1 bigtime=3D0 inobtcount=3D0
 data =3D bsize=3D4096 blocks=3D10485504, imaxpct=3D25
 =3D sunit=3D0 swidth=3D0 blks
 naming =3Dversion 2 bsize=3D4096 ascii-ci=3D0, ftype=3D1
 log =3Dinternal log bsize=3D4096 blocks=3D5119, version=3D2
 =3D sectsz=3D4096 sunit=3D1 blks, lazy-count=3D1
 realtime =3Dnone extsz=3D4096 blocks=3D0, rtextents=3D0
Command 'yes | mkfs -t xfs -f -b size=3D4096 -f /dev/sdb2' finished with =
0 after 0.022919990s

Machine was booted with powerpc/merge tree (6.6.0-rc5-gb8b05bc6d83c)

- Sachin=
