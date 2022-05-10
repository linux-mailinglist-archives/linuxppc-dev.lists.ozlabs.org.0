Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D176D520D22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 07:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky5cQ5JTtz3c9k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 15:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GiEQG3JK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GiEQG3JK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky5bd4CR8z3bft
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 15:06:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A4cQAk020354;
 Tue, 10 May 2022 05:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Y1KfjmGhhSYAr8guizGm45XQlWDCQy09ghm/+4OkzjY=;
 b=GiEQG3JK4C4J1L8ilnLdEImdsSn0gnogO/dXvTUO0ZetVQOZWsVUOVu4cfM36UmEg0rB
 mEDCQYxpu1LZ8FG0ZflGebHyM3Ewz68IFRzYRbYCjuxyOyJOQ17laB2U3boxomWZKcJw
 r7PRRkUDXU0d6r3yAlpuqDOLey+A7CrLFnv0rxOyZPwBne4ZGJGpChU79Fd2EkHEu1sn
 Md/fASGG5rdoVXqeJU52y2P03Wb71LPL5Wy+nATh68W0rGb1E0HrTyIUS07HR8QCez+W
 jUxjudGdxys51pmbpnAOCzk4L2sJ6JW4VLqq7Hkt95TlwqWzO9ktLMoFkY2wJ25dRx1p lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyfk0ssay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 05:06:01 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24A4ear0025092;
 Tue, 10 May 2022 05:06:01 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyfk0ssa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 05:06:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24A537XT001636;
 Tue, 10 May 2022 05:05:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fwg1j3f08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 05:05:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24A55ewK35193162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 05:05:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F21C52050;
 Tue, 10 May 2022 05:05:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.28.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3618252051;
 Tue, 10 May 2022 05:05:55 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [powerpc]Kernel crash while running xfstests (generic/250)
 [next-20220404]
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <B34CE5E9-8635-4DF0-AC0D-FB887462DFD6@linux.ibm.com>
Date: Tue, 10 May 2022 10:35:53 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <838D9600-D92F-4AD9-9E97-0116E2C01654@linux.ibm.com>
References: <A3B628C9-A20B-4621-BC8C-C79B270297E1@linux.ibm.com>
 <B34CE5E9-8635-4DF0-AC0D-FB887462DFD6@linux.ibm.com>
To: linux-block@vger.kernel.org, snitzer@redhat.com
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cG5qL99cVGOmas-zKOfarxXZEISLQ0va
X-Proofpoint-ORIG-GUID: kqywdsARjZjTGXm3kGfc3Ps007M1rEAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_06,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100020
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



> On 07-Apr-2022, at 10:19 AM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>=20
>=20
>> On 04-Apr-2022, at 5:04 PM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>>=20
>> While running xfstests(ext4 or XFS as fs) on a Power10 LPAR booted =
with today=E2=80=99s
>> next (5.18.0-rc1-next-20220404) following crash is seen.=20
>>=20
>> This problem was possibly introduced with 5.17.0-next-20220330.=20
>> Git bisect leads me to following patch
>> commit 1d158814db8e7b3cbca0f2c8d9242fbec4fbc57e
>>   dm: conditionally enable BIOSET_PERCPU_CACHE for dm_io bioset
>>=20
>=20
> Continue to see this problem with latest next.=20

I can still recreate this issue against latest linux-next build.

[ 1536.883400] Buffer I/O error on dev dm-0, logical block 10485497, =
async page read
[ 1536.936018] XFS (dm-0): Unmounting Filesystem
[ 1536.938849] XFS (dm-0): Mounting V5 Filesystem
[ 1536.946007] XFS (dm-0): Ending clean mount
[ 1536.947926] xfs filesystem being mounted at /mnt/scratch supports =
timestamps until 2038 (0x7fffffff)
[ 1537.052850] XFS (dm-0): Unmounting Filesystem
[ 1537.083979] BUG: Unable to handle kernel data access at =
0x5deadbeef0000122
[ 1537.083982] Faulting instruction address: 0xc00000000015b0bc
[ 1537.083984] Oops: Kernel access of bad area, sig: 11 [#1]
[ 1537.084000] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[ 1537.084006] Modules linked in: dm_snapshot(E) dm_bufio(E) loop(E) =
dm_flakey(E) xfs(E) dm_mod(E) nft_fib_inet(E) nft_fib_ipv4(E) =
nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) =
nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) =
nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) =
nf_tables(E) bonding(E) tls(E) libcrc32c(E) nfnetlink(E) sunrpc(E) =
nd_pmem(E) nd_btt(E) dax_pmem(E) pseries_rng(E) papr_scm(E) libnvdimm(E) =
vmx_crypto(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) =
crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) ibmveth(E) =
scsi_transport_srp(E) fuse(E) [last unloaded: scsi_debug]
[ 1537.084056] CPU: 10 PID: 970489 Comm: dmsetup Tainted: G            E =
    5.18.0-rc6-next-20220509 #2
[ 1537.084061] NIP:  c00000000015b0bc LR: c00000000015afe8 CTR: =
c000000000753bb0
[ 1537.084064] REGS: c0000000211fb610 TRAP: 0380   Tainted: G            =
E      (5.18.0-rc6-next-20220509)
[ 1537.084068] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24024824  XER: 20040000
[ 1537.084078] CFAR: c00000000015aff0 IRQMASK: 0=20
[ 1537.084078] GPR00: c00000000015afe8 c0000000211fb8b0 c000000002a7cf00 =
0000000000000000=20
[ 1537.084078] GPR04: c0000000f98a1378 0000000000000000 c0000000f5043b50 =
c00000043463e280=20
[ 1537.084078] GPR08: c00000043463e280 5deadbeef0000100 5deadbeef0000122 =
c00800000214dcb0=20
[ 1537.084078] GPR12: c000000000753bb0 c000000abfff1700 0000000155ee0b60 =
00007fffa7c29da8=20
[ 1537.084078] GPR16: 00007fffa7c29da8 00007fffa7c29da8 00007fffa7c63670 =
0000000000000000=20
[ 1537.084078] GPR20: 00007fffa7c33388 00007fffa7c62040 0000000155ee0b90 =
0000000000000131=20
[ 1537.084078] GPR24: c0000000025adb68 ffffffffffffffff c0000000025adb30 =
c000000103a5e000=20
[ 1537.084078] GPR28: c000000002a23ce8 c0000000f98a1378 0000000000000017 =
0000000000000000=20
[ 1537.084117] NIP [c00000000015b0bc] =
__cpuhp_state_remove_instance+0x19c/0x2c0
[ 1537.084125] LR [c00000000015afe8] =
__cpuhp_state_remove_instance+0xc8/0x2c0
[ 1537.084130] Call Trace:
[ 1537.084131] [c0000000211fb8b0] [c00000000015afe8] =
__cpuhp_state_remove_instance+0xc8/0x2c0 (unreliable)
[ 1537.084138] [c0000000211fb920] [c000000000753c14] =
bioset_exit+0x64/0x280
[ 1537.084144] [c0000000211fb9c0] [c008000002137744] =
cleanup_mapped_device+0x4c/0x1c0 [dm_mod]
[ 1537.084155] [c0000000211fba00] [c008000002137a60] =
__dm_destroy+0x1a8/0x360 [dm_mod]
[ 1537.084163] [c0000000211fbaa0] [c0080000021445c0] =
dev_remove+0x1b8/0x290 [dm_mod]
[ 1537.084172] [c0000000211fbb30] [c00800000214488c] =
ctl_ioctl+0x1f4/0x7d0 [dm_mod]
[ 1537.084181] [c0000000211fbd40] [c008000002144e88] =
dm_ctl_ioctl+0x20/0x40 [dm_mod]
[ 1537.084190] [c0000000211fbd60] [c00000000055ff28] =
sys_ioctl+0xf8/0x190
[ 1537.084195] [c0000000211fbdb0] [c00000000003377c] =
system_call_exception+0x17c/0x350
[ 1537.084200] [c0000000211fbe10] [c00000000000c54c] =
system_call_common+0xec/0x270
[ 1537.084205] --- interrupt: c00 at 0x7fffa7529210
[ 1537.084208] NIP:  00007fffa7529210 LR: 00007fffa7c26824 CTR: =
0000000000000000
[ 1537.084211] REGS: c0000000211fbe80 TRAP: 0c00   Tainted: G            =
E      (5.18.0-rc6-next-20220509)
[ 1537.084215] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24004484  XER: 00000000
[ 1537.084224] IRQMASK: 0=20
[ 1537.084224] GPR00: 0000000000000036 00007fffc7448c30 00007fffa7607300 =
0000000000000003=20
[ 1537.084224] GPR04: 00000000c138fd04 0000000155ee0b60 0000000000000004 =
00007fffa7c33f98=20
[ 1537.084224] GPR08: 0000000000000003 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1537.084224] GPR12: 0000000000000000 00007fffa7d0fa80 0000000155ee0b60 =
00007fffa7c29da8=20
[ 1537.084224] GPR16: 00007fffa7c29da8 00007fffa7c29da8 00007fffa7c63670 =
0000000000000000=20
[ 1537.084224] GPR20: 00007fffa7c33388 00007fffa7c62040 0000000155ee0b90 =
0000000155ee02e0=20
[ 1537.084224] GPR24: 00007fffa7c29da8 00007fffa7c29da8 00007fffa7c29da8 =
00007fffa7c29da8=20
[ 1537.084224] GPR28: 0000000000000001 00007fffa7c29da8 0000000000000000 =
00007fffa7c29da8=20
[ 1537.084261] NIP [00007fffa7529210] 0x7fffa7529210
[ 1537.084263] LR [00007fffa7c26824] 0x7fffa7c26824
[ 1537.084265] --- interrupt: c00
[ 1537.084267] Instruction dump:
[ 1537.084270] 60000000 7f69db78 7f83e040 7c7f07b4 7bea1f24 419cffb4 =
eae10028 eb210038=20
[ 1537.084276] eb610048 e93d0000 e95d0008 2fa90000 <f92a0000> 419e0008 =
f9490008 3d405dea=20
[ 1537.084284] ---[ end trace 0000000000000000 ]---
[ 1537.106557]=20
[ 1538.106559] Kernel panic - not syncing: Fatal exception

- Sachin

