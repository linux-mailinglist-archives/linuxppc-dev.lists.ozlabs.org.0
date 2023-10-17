Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 080947CC980
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 19:09:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fIaTFHWa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S90nP6mLGz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 04:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fIaTFHWa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S90mX4tjkz3c7n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 04:08:12 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HH2MCf022043;
	Tue, 17 Oct 2023 17:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=pnN+CXECmWS9R47LuHNZ5vWFFw3e0KQhfdNgplK5wa0=;
 b=fIaTFHWa+sF42zN8z7ZEldgtzLTvacMmODxbm5RIVQ3o5hRk+WfmH85xpN5EoKuIeaCh
 NyprJkjLAk28SwD5irHE0BXCNk6DfOkRXSGPKu/7hCBquqFpfQGOdmJs5peZjo5KAZMd
 0A/IIxt8O+4m8wvp2jQc76Cngl2H9cdHZuJxriLFj6z3PadkKfzZAZIaHpq9yn+iGlA/
 O+S/uw9T57GcV6FDyqhIG9PrDHy8SvgZYYr/RvSLOb1qvlJFzjBu6SEX+RWzVIDURN4R
 lM5vu9kF+zBfLrZrrSzI1LVakt2LOGVrWyuOPmrBpzrUorOGQF0/6VV5R1RClwiLvpS1 Ig== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsxagg8r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 17:08:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39HFfYmp030747;
	Tue, 17 Oct 2023 17:08:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr7hjj1c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 17:08:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39HH860k6554340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 17:08:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 276D820040;
	Tue, 17 Oct 2023 17:08:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06F052004D;
	Tue, 17 Oct 2023 17:08:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.78.224])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 17:08:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [powerpc] kernel BUG fs/xfs/xfs_message.c:102! [4k block]
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <ZShi/83PAGVxbUQK@dread.disaster.area>
Date: Tue, 17 Oct 2023 22:37:53 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA979D74-D659-42D6-9BE6-C78EE5130BAB@linux.ibm.com>
References: <EF7138E1-92EF-4A27-A666-316AAD7EFA43@linux.ibm.com>
 <ZShi/83PAGVxbUQK@dread.disaster.area>
To: Dave Chinner <david@fromorbit.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -ym3QAtMlQd2fRHWMLX9YEnQ3sS92Pmy
X-Proofpoint-ORIG-GUID: -ym3QAtMlQd2fRHWMLX9YEnQ3sS92Pmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170144
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
Cc: linux-xfs@vger.kernel.org, riteshh@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13-Oct-2023, at 2:49=E2=80=AFAM, Dave Chinner <david@fromorbit.com> =
wrote:
>=20
> On Thu, Oct 12, 2023 at 03:51:04PM +0530, Sachin Sant wrote:
>> While running xfstests on a IBM Power10 server having xfs file system =
with
>> 4k block size following crash was seen
>>=20
>> [ 1609.771548] run fstests xfs/238 at 2023-10-11 17:00:40
>> [ 1609.971214] XFS (sdb1): Mounting V5 Filesystem =
1105d60c-9514-4e7a-af6a-632d99bf06ea
>> [ 1609.980693] XFS (sdb1): Ending clean mount
>> [ 1609.982166] xfs filesystem being mounted at /mnt/test supports =
timestamps until 2038-01-19 (0x7fffffff)
>> [ 1610.024793] XFS (sdb2): Mounting V5 Filesystem =
60de8f0c-c80e-4a2a-b60a-f41a9cc0feca
>> [ 1610.030295] XFS (sdb2): Ending clean mount
>> [ 1610.031342] xfs filesystem being mounted at /mnt/scratch supports =
timestamps until 2038-01-19 (0x7fffffff)
>> [ 1610.087139] XFS: Assertion failed: bp->b_flags & XBF_DONE, file: =
fs/xfs/xfs_trans_buf.c, line: 241
>> [ 1610.087162] ------------[ cut here ]------------
>> [ 1610.087165] kernel BUG at fs/xfs/xfs_message.c:102!
>> [ 1610.087168] Oops: Exception in kernel mode, sig: 5 [#1]
>> [ 1610.087171] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D8192 NUMA =
pSeries
>> [ 1610.087175] Modules linked in: overlay dm_zero dm_thin_pool =
dm_persistent_data dm_bio_prison dm_snapshot dm_bufio loop dm_flakey xfs =
dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill ip_set tls =
nf_tables libcrc32c nfnetlink pseries_rng vmx_crypto ext4 mbcache jbd2 =
sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp =
ibmveth fuse [last unloaded: scsi_debug]
>> [ 1610.087220] CPU: 11 PID: 225897 Comm: kworker/11:46 Not tainted =
6.6.0-rc5-gb8b05bc6d83c #1
>> [ 1610.087224] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
>> [ 1610.087227] Workqueue: xfs-inodegc/sdb2 xfs_inodegc_worker [xfs]
>> [ 1610.087303] NIP: c008000002857edc LR: c008000002857ec8 CTR: =
000000007fffffff
>> [ 1610.087306] REGS: c00000002441b810 TRAP: 0700 Not tainted =
(6.6.0-rc5-gb8b05bc6d83c)
>> [ 1610.087309] MSR: 800000000282b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 28000424 XER: 00000007
>> [ 1610.087318] CFAR: c008000002857d1c IRQMASK: 0=20
>> [ 1610.087318] GPR00: c008000002857ec8 c00000002441bab0 =
c008000002a68300 ffffffffffffffea=20
>> [ 1610.087318] GPR04: 000000000000000a c00000002441b9b0 =
0000000000000000 c0080000016c6c40=20
>> [ 1610.087318] GPR08: ffffffffffffffc0 0000000000000001 =
0000000000000000 c00800000285a3a8=20
>> [ 1610.087318] GPR12: c0000000008311d0 c00000117fff1b00 =
c000000000197de8 c00000000936bf40=20
>> [ 1610.087318] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 c0000009d16d48b0=20
>> [ 1610.087318] GPR20: c000000079e80205 c00000001cb52f80 =
c00000001cb52fc0 0000000080000000=20
>> [ 1610.087318] GPR24: 0000000000000001 c00000002441bbc8 =
c0000000e77a7000 c0000000209b7e00=20
>> [ 1610.087318] GPR28: c00800000279ae48 c0080000016b25f0 =
c00000002441bc10 c00000002dabaee8=20
>> [ 1610.087354] NIP [c008000002857edc] assfail+0x54/0x74 [xfs]
>> [ 1610.087420] LR [c008000002857ec8] assfail+0x40/0x74 [xfs]
>> [ 1610.087485] Call Trace:
>> [ 1610.087486] [c00000002441bab0] [c008000002857ec8] =
assfail+0x40/0x74 [xfs] (unreliable)
>> [ 1610.087551] [c00000002441bb10] [c00800000281cebc] =
xfs_trans_read_buf_map+0x384/0x590 [xfs]
>> [ 1610.087622] [c00000002441bba0] [c00800000279ae48] =
xfs_imap_to_bp+0x70/0xa8 [xfs]
>> [ 1610.087691] [c00000002441bbf0] [c00800000280c3ec] =
xfs_inode_item_precommit+0x244/0x320 [xfs]
>> [ 1610.087760] [c00000002441bc60] [c0080000027f3034] =
xfs_trans_run_precommits+0xac/0x160 [xfs]
>> [ 1610.087830] [c00000002441bcb0] [c0080000027f45b0] =
__xfs_trans_commit+0x68/0x430 [xfs]
>> [ 1610.087900] [c00000002441bd20] [c0080000027dfc30] =
xfs_inactive_ifree+0x158/0x2a0 [xfs]
>> [ 1610.087969] [c00000002441bdb0] [c0080000027dff84] =
xfs_inactive+0x20c/0x420 [xfs]
>> [ 1610.088037] [c00000002441bdf0] [c0080000027ceb90] =
xfs_inodegc_worker+0x148/0x250 [xfs]
>> [ 1610.088106] [c00000002441be40] [c000000000188130] =
process_scheduled_works+0x230/0x4f0
>> [ 1610.088113] [c00000002441bf10] [c00000000018b164] =
worker_thread+0x1e4/0x500
>> [ 1610.088118] [c00000002441bf90] [c000000000197f18] =
kthread+0x138/0x140
>> [ 1610.088122] [c00000002441bfe0] [c00000000000df98] =
start_kernel_thread+0x14/0x18
>> [ 1610.088127] Code: e8a5ca38 7c641b78 3c620000 e863ca48 f8010010 =
f821ffa1 4bfffd91 3d220000 e929ca50 89290010 2f890000 419e0008 =
<0fe00000> 0fe00000 38210060 e8010010=20
>> [ 1610.088140] ---[ end trace 0000000000000000 ]---
>> [ 1610.093928] sh (1070303): drop_caches: 3
>> [ 1610.095600] pstore: backend (nvram) writing error (-1)
>> [ 1610.095605]
>>=20
>> xfs/238 test was executed when the crash was encountered.
>> Devices were formatted with 4k block size.
>=20
> Yeah, I've seen this once before, I think I know what the problem is
> from analysis of that failure, but I've been unable to reproduce it
> again so I've not been able to confirm the diagnosis nor test a fix.
>=20
Yeah, the problem is not seen consistently. In the last week
I have seen this twice. Interesting aspect is the problem is
only seen with powerpc/merge branch. Same test run on
mainline or linux-next does not reproduce this problem.

> tl;dr: we just unlinked an inode whose cluster buffer has been
> invalidated by xfs_icluster_free(). We go to log the inode, but this
> is the first time we've logged the inode since it was last cleaned,
> so it goes to read the cluster buffer to attach it. It finds the
> cluster buffer already marked stale in the transaction, so the DONE
> flag is not set and the ASSERT fires.
>=20
> i.e. it appears to me that this requires inode cluster buffer
> writeback between the unlink() operation and the inodegc
> inactivation process to set the initial conditions for the problem
> to trigger, and then have just a single inode in the inobt chunk
> that triggers freeing of the chunk whilst the inode itself is clean.=20=

>=20
> I need to confirm that this is the case before trying to fix it,
> because this inode log item vs stale inode cluster buffer path is
> tricky and nasty and there might be something else going on.
> However, I haven't been able to reproduce this to be able to confirm
> this hypothesis yet.
>=20
> I suspect the fix may well be to use xfs_trans_buf_get() in the
> xfs_inode_item_precommit() path if XFS_ISTALE is already set on the
> inode we are trying to log. We don't need a populated cluster buffer
> to read data out of or write data into in this path - all we need to
> do is attach the inode to the buffer so that when the buffer
> invalidation is committed to the journal it will also correctly
> finish the stale inode log item.
>=20
Thanks for the analysis.

- Sachin=
