Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E93B1538
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 09:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8wd50x9jz2xZK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 17:58:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEVcHSdy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MEVcHSdy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8wcY25TVz2yX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 17:58:20 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N7ZJls094580; Wed, 23 Jun 2021 03:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=thGBY720BhJc8XFtkNQ6HDPkmK0Iysx+8owzz63PDZI=;
 b=MEVcHSdyIlzmoE/RyFfXjYFJYOkjLBipeV36wVornPXUsltZnnygsf+cDN1v3OKfcv3I
 pJpdFV5ef54pvU8oQMCQDc1I55Q7sH6CmlvaPtaupHROAwDEd993OLk1wMZvllyt07yo
 k1Jt6c8BLtYtHPNujmzZCgHDrFEWHtLCqQWoy9+0wjFacHcwMymhSKeAhH4+sivWelb6
 aUESVtE2zqk/qt54FwNR0KGgJ/wiSVe+X8vORr/MYPztDLgs+hKhcF6/J9ahzmSeowwz
 n4bAjO82p8vMO/hyea4QyiNbfMx3LURO4k/LF5IhTGIquzbTlzx+hWZ8dKl+0GCw2AGg 7g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bwhd5xt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 03:58:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N7wDgc016465;
 Wed, 23 Jun 2021 07:58:13 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uh9tw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 07:58:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N7wBvG30671224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 07:58:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 205A9AE045;
 Wed, 23 Jun 2021 07:58:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D0F3AE053;
 Wed, 23 Jun 2021 07:58:10 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.197.182])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 07:58:09 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20210623071935.GA29143@vingu-book>
Date: Wed, 23 Jun 2021 13:28:08 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
To: Vincent Guittot <vincent.guittot@linaro.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: buSy29hWUtzMXIhAy_LAVFasTmDEsbAI
X-Proofpoint-GUID: buSy29hWUtzMXIhAy_LAVFasTmDEsbAI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_02:2021-06-22,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230044
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
Cc: Odin Ugedal <odin@uged.al>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>> Could you try the patch below ? I have been able to reproduce the =
problem locally and this
>>> fix it on my system:
>>>=20
>> I can recreate the issue with this patch.
>=20
> ok, so your problem seem to be different from my assumption. Could you =
try
> the patch below on top of the previous one ?
>=20
> This will help us to confirm that the problem comes from load_avg and =
that
> it's linked to the cfs load_avg and it's not a problem happening =
earlier in
> the update of PELT.
>=20

Indeed. With both the patches applied I see following warning related to =
load_avg

         Starting NTP client/server...
         Starting VDO volume services...
[    9.029054] ------------[ cut here ]------------
[    9.029084] cfs_rq->avg.load_avg
[    9.029111] WARNING: CPU: 21 PID: 1169 at kernel/sched/fair.c:3282 =
update_blocked_averages+0x760/0x830
[    9.029151] Modules linked in: pseries_rng xts vmx_crypto =
uio_pdrv_genirq uio sch_fq_codel ip_tables xfs libcrc32c sr_mod sd_mod =
cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp dm_mirror =
dm_region_hash dm_log dm_mod fuse
[    9.029233] CPU: 21 PID: 1169 Comm: grep Not tainted =
5.13.0-rc7-next-20210621-dirty #3
[    9.029246] NIP:  c0000000001b6150 LR: c0000000001b614c CTR: =
c000000000728f40
[    9.029259] REGS: c00000000e177650 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210621-dirty)
[    9.029271] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48088224  XER: 00000005
[    9.029296] CFAR: c00000000014d120 IRQMASK: 1=20
[    9.029296] GPR00: c0000000001b614c c00000000e1778f0 c0000000029bb900 =
0000000000000014=20
[    9.029296] GPR04: 00000000fffeffff c00000000e1775b0 0000000000000027 =
c00000154f637e18=20
[    9.029296] GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c00000167f1d7fe8=20
[    9.029296] GPR12: 0000000000008000 c00000154ffe0e80 000000000000b820 =
000000021a2c6864=20
[    9.029296] GPR16: c0000000482cc000 c00000154f6c2580 0000000000000001 =
0000000000000000=20
[    9.029296] GPR20: c00000000291a7f9 c0000000482cc100 0000000000000000 =
000000000000020d=20
[    9.029296] GPR24: 0000000000000000 c00000154f6c2f90 0000000000000001 =
c000000030b84400=20
[    9.029296] GPR28: 000000000000020d c0000000482cc1c0 0000000000000338 =
0000000000000000=20
[    9.029481] NIP [c0000000001b6150] =
update_blocked_averages+0x760/0x830
[    9.029494] LR [c0000000001b614c] update_blocked_averages+0x75c/0x830
[    9.029508] Call Trace:
[    9.029515] [c00000000e1778f0] [c0000000001b614c] =
update_blocked_averages+0x75c/0x830 (unreliable)
[    9.029533] [c00000000e177a20] [c0000000001bd388] =
newidle_balance+0x258/0x5c0
[    9.029542] [c00000000e177ab0] [c0000000001bd7cc] =
pick_next_task_fair+0x7c/0x4c0
[    9.029574] [c00000000e177b10] [c000000000cee3dc] =
__schedule+0x15c/0x1780
[    9.029599] [c00000000e177c50] [c0000000001a5984] =
do_task_dead+0x64/0x70
[    9.029622] [c00000000e177c80] [c000000000156338] do_exit+0x848/0xcc0
[    9.029646] [c00000000e177d50] [c000000000156884] =
do_group_exit+0x64/0xe0
[    9.029666] [c00000000e177d90] [c000000000156924] =
sys_exit_group+0x24/0x30
[    9.029688] [c00000000e177db0] [c0000000000310c0] =
system_call_exception+0x150/0x2d0
         Startin[    9.029710] [gc00000000e177e10 Hardware Monito] =
[c00000000000_common+0xec/0x2lling Sensors...
78
[    9.029743] --- interrupt: c00 at 0x7fff943fddcc
[    9.029758] NIP:  00007fff943fddcc LR: 00007fff94357f04 CTR: =
0000000000000000
[    9.029786] REGS: c00000000e177e80 TRAP: 0c00   Not tainted  =
(5.13.0-rc7-next-20210621-dirty)
[    9.029798] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000402  XER: 00000000
[    9.029825] IRQMASK: 0=20
[    9.029825] GPR00: 00000000000000ea 00007ffff59c0170 00007fff94527100 =
0000000000000001=20
[    9.029825] GPR04: 0000000000000000 0000000000000000 0000000000000001 =
0000000000000000=20
[    9.029825] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    9.029825] GPR12: 0000000000000000 00007fff9466af00 0000000000000000 =
0000000000000000=20
[    9.029825] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[    9.029825] GPR20: 0000000000000000 00007fff94524f98 0000000000000002 =
0000000000000001=20
[    9.029825] GPR24: 00007fff94520950 0000000000000000 0000000000000001 =
0000000000000001=20
[    9.029825] GPR28: 0000000000000000 0000000000000000 00007fff94663f10 =
0000000000000001=20
[    9.029935] NIP [00007fff943fddcc] 0x7fff943fddcc
[    9.029944] LR [00007fff94357f04] 0x7fff94357f04
[    9.029952] --- interrupt: c00
[    9.029959] Instruction dump:
[    9.029966] 0fe00000 4bfffc64 60000000 60000000 89340007 2f890000 =
409efc38 e8610098=20
[    9.029987] 39200001 99340007 4bf96f71 60000000 <0fe00000> 4bfffc1c =
60000000 60000000=20
[    9.030013] ---[ end trace 3d7e3a29c9539d96 ]---
         Starting Authorization Manager=E2=80=A6

Thanks
-Sachin


>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da91db1c137f..8a6566f945a0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3030,8 +3030,9 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, =
struct sched_entity *se)
> static inline void
> enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> {
> +       u32 divider =3D get_pelt_divider(&se->avg);
>        cfs_rq->avg.load_avg +=3D se->avg.load_avg;
> -       cfs_rq->avg.load_sum +=3D se_weight(se) * se->avg.load_sum;
> +       cfs_rq->avg.load_sum =3D cfs_rq->avg.load_avg * divider;
> }
>=20
> static inline void
> @@ -3304,9 +3305,9 @@ static inline bool cfs_rq_is_decayed(struct =
cfs_rq *cfs_rq)
>         * Make sure that rounding and/or propagation of PELT values =
never
>         * break this.
>         */
> -       SCHED_WARN_ON(cfs_rq->avg.load_avg ||
> -                     cfs_rq->avg.util_avg ||
> -                     cfs_rq->avg.runnable_avg);
> +       SCHED_WARN_ON(cfs_rq->avg.load_avg);
> +       SCHED_WARN_ON(cfs_rq->avg.util_avg);
> +       SCHED_WARN_ON(cfs_rq->avg.runnable_avg);
>=20
>        return true;
> }
>=20
>=20
>>=20
>>         Starting Terminate Plymouth Boot Screen...
>>         Starting Hold until boot process finishes up...
>> [FAILED] Failed to start Crash recovery kernel arming.
>> See 'systemctl status kdump.service' for details.
>> [   10.737913] ------------[ cut here ]------------
>> [   10.737960] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || =
cfs_rq->avg.runnable_avg
>> [   10.737976] WARNING: CPU: 27 PID: 146 at kernel/sched/fair.c:3279 =
update_blocked_averages+0x758/0x780
>> [   10.738010] Modules linked in: stp llc rfkill sunrpc pseries_rng =
xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables xfs libcrc32c =
sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp =
dm_mirror dm_region_hash dm_log dm_mod fuse
>> [   10.738089] CPU: 27 PID: 146 Comm: ksoftirqd/27 Not tainted =
5.13.0-rc7-next-20210621-dirty #2
>> [   10.738103] NIP:  c0000000001b2768 LR: c0000000001b2764 CTR: =
c000000000729120
>> [   10.738116] REGS: c000000015973840 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210621-dirty)
>> [   10.738130] MSR:  800000000282b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48000224  XER: 00000005
>> [   10.738161] CFAR: c00000000014d120 IRQMASK: 1=20
>> [   10.738161] GPR00: c0000000001b2764 c000000015973ae0 =
c0000000029bb900 0000000000000048=20
>> [   10.738161] GPR04: 00000000fffeffff c0000000159737a0 =
0000000000000027 c00000154f9f7e18=20
>> [   10.738161] GPR08: 0000000000000023 0000000000000001 =
0000000000000027 c00000167f1d7fe8=20
>> [   10.738161] GPR12: 0000000000000000 c00000154ffd7e80 =
c00000154fa82580 000000000000b78a=20
>> [   10.738161] GPR16: 000000028007883c 00000000000002ed =
c000000038d31000 0000000000000000=20
>> [   10.738161] GPR20: 0000000000000000 c0000000029fdfe0 =
0000000000000000 000000000000037b=20
>> [   10.738161] GPR24: 0000000000000000 c00000154fa82f90 =
0000000000000001 c00000003d4ca400=20
>> [   10.738161] GPR28: 00000000000002ed c000000038d311c0 =
c000000038d31100 0000000000000000=20
>> [   10.738281] NIP [c0000000001b2768] =
update_blocked_averages+0x758/0x780
>> [   10.738290] LR [c0000000001b2764] =
update_blocked_averages+0x754/0x780
>> [   10.738299] Call Trace:
>> [   10.738303] [c000000015973ae0] [c0000000001b2764] =
update_blocked_averages+0x754/0x780 (unreliable)
>> [   10.738315] [c000000015973c00] [c0000000001be720] =
run_rebalance_domains+0xa0/0xd0
>> [   10.738326] [c000000015973c30] [c000000000cf9acc] =
__do_softirq+0x15c/0x3d4
>> [   10.738337] [c000000015973d20] [c000000000158464] =
run_ksoftirqd+0x64/0x90
>> [   10.738346] [c000000015973d40] [c00000000018fd24] =
smpboot_thread_fn+0x204/0x270
>> [   10.738357] [c000000015973da0] [c000000000189770] =
kthread+0x190/0x1a0
>> [   10.738367] [c000000015973e10] [c00000000000ceec] =
ret_from_kernel_thread+0x5c/0x70
>> [   10.738381] Instruction dump:
>> [   10.738388] 3863c808 9be9eefe 4bf9a979 60000000 0fe00000 4bfff980 =
e9210070 e8610088=20
>> [   10.738410] 39400001 99490003 4bf9a959 60000000 <0fe00000> =
4bfffc24 3d22fff6 8929eefb=20
>> [   10.738431] ---[ end trace 9ca80b55840c53f0 ]=E2=80=94
>>=20
>> Thanks
>> -Sachin
>>=20
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 8cc27b847ad8..da91db1c137f 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -3037,8 +3037,9 @@ enqueue_load_avg(struct cfs_rq *cfs_rq, struct =
sched_entity *se)
>>> static inline void
>>> dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>>> {
>>> +       u32 divider =3D get_pelt_divider(&se->avg);
>>>       sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
>>> -       sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * =
se->avg.load_sum);
>>> +       cfs_rq->avg.load_sum =3D cfs_rq->avg.load_avg * divider;
>>> }
>>> #else
>>> static inline void

