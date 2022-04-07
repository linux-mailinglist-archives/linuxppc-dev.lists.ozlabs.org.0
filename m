Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C03304F7501
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 06:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYppx5p4Qz2yZf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 14:50:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O1EXUF9l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O1EXUF9l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYppB3LPXz2xSP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 14:49:53 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23720UMS022588; 
 Thu, 7 Apr 2022 04:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=jIemPP/faeMhx0l03xLYN8S16cDR16EsIdNEN9P8j6w=;
 b=O1EXUF9lSV+DHny7HHD2q3+t6neT7MEMo+IlLP67V8MRxYKusuFc2oloadizltsPHRtJ
 Dn0BPchmwcVsyaKeM3WgZwYpGUe3cmbMYh4PyLemI3acuKzbYqcPe+AhO4w248w7DzpM
 +pYnlkpZifrE0vuUnqODDr8zuzZVlziO0i54jM+mQoLKgYSfk97muggsjXnvJn2twPkX
 PE5W1CS8S2cvzOJeFpkCRLurwbebFxA+feD2ufI1xoR+T5fcuvfKmBRDECVS5VI9r6An
 fV9RUHlxfltuxEOvJ21EYohAphhk517UzP5RlnGVhQ4fNy+2CGoK/fVgf7DzB8gleS3Q EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f96s86g8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 04:49:51 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2374d9Cf028423;
 Thu, 7 Apr 2022 04:49:50 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f96s86g84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 04:49:50 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2374lNxI026895;
 Thu, 7 Apr 2022 04:49:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3f6e48qecw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 04:49:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2374nkks38535482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 04:49:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 420C052051;
 Thu,  7 Apr 2022 04:49:46 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.196.207])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 33DCC52057;
 Thu,  7 Apr 2022 04:49:45 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [powerpc]Kernel crash while running xfstests (generic/250)
 [next-20220404]
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <A3B628C9-A20B-4621-BC8C-C79B270297E1@linux.ibm.com>
Date: Thu, 7 Apr 2022 10:19:44 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B34CE5E9-8635-4DF0-AC0D-FB887462DFD6@linux.ibm.com>
References: <A3B628C9-A20B-4621-BC8C-C79B270297E1@linux.ibm.com>
To: linux-block@vger.kernel.org, snitzer@redhat.com
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7_3nnGPA5-UcH6E1DDBObTXLmA2SBSB5
X-Proofpoint-ORIG-GUID: VwbGyXRN72Dbn9xdqr4cc4ROmiZNOcVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070023
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


> On 04-Apr-2022, at 5:04 PM, Sachin Sant <sachinp@linux.ibm.com> wrote:
>=20
> While running xfstests(ext4 or XFS as fs) on a Power10 LPAR booted =
with today=E2=80=99s
> next (5.18.0-rc1-next-20220404) following crash is seen.=20
>=20
> This problem was possibly introduced with 5.17.0-next-20220330.=20
> Git bisect leads me to following patch
> commit 1d158814db8e7b3cbca0f2c8d9242fbec4fbc57e
>    dm: conditionally enable BIOSET_PERCPU_CACHE for dm_io bioset
>=20

Continue to see this problem with latest next.=20

[ 2388.091152] EXT4-fs (dm-0): mounted filesystem with ordered data =
mode. Quota mode: none.
[ 2388.091173] ext4 filesystem being mounted at /mnt/scratch supports =
timestamps until 2038 (0x7fffffff)
[ 2388.287138] BUG: Unable to handle kernel data access at =
0x5deadbeef0000122
[ 2388.287154] Faulting instruction address: 0xc000000000154a6c
[ 2388.287160] Oops: Kernel access of bad area, sig: 11 [#1]
[ 2388.287164] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[ 2388.287172] Modules linked in: xfs dm_flakey dm_snapshot dm_bufio =
dm_zero loop dm_mod ip_set bonding rfkill nf_tables libcrc32c nfnetlink =
sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ext4 =
mbcache jbd2 lpfc nvmet_fc nvmet sr_mod sd_mod cdrom nvme_fc sg nvme =
nvme_fabrics tg3 nvme_core ptp ibmvscsi t10_pi crc64_rocksoft ibmveth =
scsi_transport_srp scsi_transport_fc pps_core crc64 ipmi_devintf =
ipmi_msghandler fuse [last unloaded: scsi_debug]
[ 2388.287236] CPU: 16 PID: 1043652 Comm: dmsetup Not tainted =
5.18.0-rc1-next-20220406 #1
[ 2388.287244] NIP:  c000000000154a6c LR: c000000000154998 CTR: =
c000000000674690
[ 2388.287249] REGS: c000000145fb3610 TRAP: 0380   Not tainted  =
(5.18.0-rc1-next-20220406)
[ 2388.287255] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28024824  XER: 00000000
[ 2388.287271] CFAR: c0000000001549a0 IRQMASK: 0=20
[ 2388.287271] GPR00: c000000000154998 c000000145fb38b0 c000000002a1f400 =
0000000000000000=20
[ 2388.287271] GPR04: c00000004aa2c378 0000000000000000 c000000048fdf060 =
c00000015387b600=20
[ 2388.287271] GPR08: c00000015387b600 5deadbeef0000100 5deadbeef0000122 =
c00800000988a4e8=20
[ 2388.287271] GPR12: c000000000674690 c00000001ec28a80 0000010014bf0b40 =
00007fff9f1b9da8=20
[ 2388.287271] GPR16: 00007fff9f1b9da8 00007fff9f1b9da8 00007fff9f1f3670 =
0000000000000000=20
[ 2388.287271] GPR20: 00007fff9f1c3388 00007fff9f1f2040 0000010014bf0b70 =
0000000000000131=20
[ 2388.287271] GPR24: c00000000254d768 ffffffffffff0000 c00000000254d730 =
c0000000f5103a00=20
[ 2388.287271] GPR28: c0000000029b0570 c00000004aa2c378 0000000000000017 =
0000000000000000=20
[ 2388.287332] NIP [c000000000154a6c] =
__cpuhp_state_remove_instance+0x19c/0x2c0
[ 2388.287344] LR [c000000000154998] =
__cpuhp_state_remove_instance+0xc8/0x2c0
[ 2388.287351] Call Trace:
[ 2388.287353] [c000000145fb38b0] [c000000000154998] =
__cpuhp_state_remove_instance+0xc8/0x2c0 (unreliable)
[ 2388.287362] [c000000145fb3920] [c0000000006746ec] =
bioset_exit+0x5c/0x280
[ 2388.287369] [c000000145fb39c0] [c0080000098733f4] =
cleanup_mapped_device+0x4c/0x1a0 [dm_mod]
[ 2388.287385] [c000000145fb3a00] [c0080000098736f0] =
__dm_destroy+0x1a8/0x360 [dm_mod]
[ 2388.287397] [c000000145fb3aa0] [c008000009880e90] =
dev_remove+0x1a8/0x280 [dm_mod]
[ 2388.287409] [c000000145fb3b30] [c00800000988115c] =
ctl_ioctl+0x1f4/0x7c0 [dm_mod]
[ 2388.287422] [c000000145fb3d40] [c008000009881748] =
dm_ctl_ioctl+0x20/0x40 [dm_mod]
[ 2388.287434] [c000000145fb3d60] [c0000000004b2c08] =
sys_ioctl+0xf8/0x150
[ 2388.287441] [c000000145fb3db0] [c0000000000324e8] =
system_call_exception+0x178/0x380
[ 2388.287449] [c000000145fb3e10] [c00000000000c64c] =
system_call_common+0xec/0x250
[ 2388.287457] --- interrupt: c00 at 0x7fff9ec991a0
[ 2388.287461] NIP:  00007fff9ec991a0 LR: 00007fff9f1b6824 CTR: =
0000000000000000
[ 2388.287466] REGS: c000000145fb3e80 TRAP: 0c00   Not tainted  =
(5.18.0-rc1-next-20220406)
[ 2388.287471] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28004484  XER: 00000000
[ 2388.287486] IRQMASK: 0=20
[ 2388.287486] GPR00: 0000000000000036 00007fffe5635be0 00007fff9ed77300 =
0000000000000003=20
[ 2388.287486] GPR04: 00000000c138fd04 0000010014bf0b40 0000000000000004 =
00007fff9f1c3f98=20
[ 2388.287486] GPR08: 0000000000000003 0000000000000000 0000000000000000 =
0000000000000000=20
[ 2388.287486] GPR12: 0000000000000000 00007fff9f29fa00 0000010014bf0b40 =
00007fff9f1b9da8=20
[ 2388.287486] GPR16: 00007fff9f1b9da8 00007fff9f1b9da8 00007fff9f1f3670 =
0000000000000000=20
[ 2388.287486] GPR20: 00007fff9f1c3388 00007fff9f1f2040 0000010014bf0b70 =
0000010014bf0940=20
[ 2388.287486] GPR24: 00007fff9f1b9da8 00007fff9f1b9da8 00007fff9f1b9da8 =
00007fff9f1b9da8=20
[ 2388.287486] GPR28: 0000000000000001 00007fff9f1b9da8 0000000000000000 =
00007fff9f1b9da8=20
[ 2388.287543] NIP [00007fff9ec991a0] 0x7fff9ec991a0
[ 2388.287547] LR [00007fff9f1b6824] 0x7fff9f1b6824
[ 2388.287551] --- interrupt: c00
[ 2388.287554] Instruction dump:
[ 2388.287558] 60000000 7f69db78 7f83e040 7c7f07b4 7bea1f24 419cffb4 =
eae10028 eb210038=20
[ 2388.287569] eb610048 e93d0000 e95d0008 2fa90000 <f92a0000> 419e0008 =
f9490008 3d405dea=20
[ 2388.287581] ---[ end trace 0000000000000000 ]---
[ 2388.403785]=20
[ 2389.403791] Kernel panic - not syncing: Fatal exception

Let me know if any additional information is required.

-Sachin

