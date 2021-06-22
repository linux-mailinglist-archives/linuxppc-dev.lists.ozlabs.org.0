Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98F3B09BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 18:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8WMK51F4z3bTN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 02:00:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dstYNTcV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dstYNTcV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8WLY0BQrz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 01:59:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFktWG187328; Tue, 22 Jun 2021 11:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=oygtccHblXSkamR34b+VpChGugVr2Y1jSYAi+y+uYqI=;
 b=dstYNTcVGHXIVsv72PMA4kMOumWtUTj3TxvZMx4Icbc6SnCaJnTEt9WNTy/zEyY3yA90
 0CxT43FZJBfyuh19O53kIJc0YA789rLmR2GMK6yY1IT3gT1dN+oCPZHay4o6g4pyE2r0
 +qFxDkEAO9H8FVlX5IDi0y6VEzq/GTh8CIlMrCmd/tfAx/eO06byUogG9UAZYx5OczP9
 OuhBnBinLAT1fqdMMV/ntTQeTo1Wtdhd45K4kNLX63y5oulFGlCBfrOKio+RHJRdh2KR
 D+7qgdLty4s+8GO9nvSg3oGZwI8V/Dt9bwv55KvBNA9nSOUhotwfYsxOiJxCegfy3nwJ Fw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bjtb8bnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 11:59:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MFs70r001456;
 Tue, 22 Jun 2021 15:59:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uh9j0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 15:59:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MFxcOV32178530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:59:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 132E8A405F;
 Tue, 22 Jun 2021 15:59:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DB02A4064;
 Tue, 22 Jun 2021 15:59:37 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.86.62])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 15:59:36 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20210622143154.GA804@vingu-book>
Date: Tue, 22 Jun 2021 21:29:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
To: Vincent Guittot <vincent.guittot@linaro.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i13bqTY5Fcy0mervMndR6Vv9BUakoEZM
X-Proofpoint-ORIG-GUID: i13bqTY5Fcy0mervMndR6Vv9BUakoEZM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_08:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220097
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

>> On Tue, 22 Jun 2021 at 09:39, Sachin Sant =
<sachinp@linux.vnet.ibm.com> wrote:
>>>=20
>>> While booting 5.13.0-rc7-next-20210621 on a PowerVM LPAR following =
warning
>>> is seen
>>>=20
>>> [   30.922154] ------------[ cut here ]------------
>>> [   30.922201] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || =
cfs_rq->avg.runnable_avg
>>> [   30.922219] WARNING: CPU: 6 PID: 762 at kernel/sched/fair.c:3277 =
update_blocked_averages+0x758/0x780
>>=20
>> Yes. That was exactly the purpose of the patch. There is one last
>> remaining part which could generate this. I'm going to prepare a =
patch
>=20
> Could you try the patch below ? I have been able to reproduce the =
problem locally and this
> fix it on my system:
>=20
I can recreate the issue with this patch.

         Starting Terminate Plymouth Boot Screen...
         Starting Hold until boot process finishes up...
[FAILED] Failed to start Crash recovery kernel arming.
See 'systemctl status kdump.service' for details.
[   10.737913] ------------[ cut here ]------------
[   10.737960] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || =
cfs_rq->avg.runnable_avg
[   10.737976] WARNING: CPU: 27 PID: 146 at kernel/sched/fair.c:3279 =
update_blocked_averages+0x758/0x780
[   10.738010] Modules linked in: stp llc rfkill sunrpc pseries_rng xts =
vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables xfs libcrc32c =
sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp =
dm_mirror dm_region_hash dm_log dm_mod fuse
[   10.738089] CPU: 27 PID: 146 Comm: ksoftirqd/27 Not tainted =
5.13.0-rc7-next-20210621-dirty #2
[   10.738103] NIP:  c0000000001b2768 LR: c0000000001b2764 CTR: =
c000000000729120
[   10.738116] REGS: c000000015973840 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210621-dirty)
[   10.738130] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48000224  XER: 00000005
[   10.738161] CFAR: c00000000014d120 IRQMASK: 1=20
[   10.738161] GPR00: c0000000001b2764 c000000015973ae0 c0000000029bb900 =
0000000000000048=20
[   10.738161] GPR04: 00000000fffeffff c0000000159737a0 0000000000000027 =
c00000154f9f7e18=20
[   10.738161] GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c00000167f1d7fe8=20
[   10.738161] GPR12: 0000000000000000 c00000154ffd7e80 c00000154fa82580 =
000000000000b78a=20
[   10.738161] GPR16: 000000028007883c 00000000000002ed c000000038d31000 =
0000000000000000=20
[   10.738161] GPR20: 0000000000000000 c0000000029fdfe0 0000000000000000 =
000000000000037b=20
[   10.738161] GPR24: 0000000000000000 c00000154fa82f90 0000000000000001 =
c00000003d4ca400=20
[   10.738161] GPR28: 00000000000002ed c000000038d311c0 c000000038d31100 =
0000000000000000=20
[   10.738281] NIP [c0000000001b2768] =
update_blocked_averages+0x758/0x780
[   10.738290] LR [c0000000001b2764] update_blocked_averages+0x754/0x780
[   10.738299] Call Trace:
[   10.738303] [c000000015973ae0] [c0000000001b2764] =
update_blocked_averages+0x754/0x780 (unreliable)
[   10.738315] [c000000015973c00] [c0000000001be720] =
run_rebalance_domains+0xa0/0xd0
[   10.738326] [c000000015973c30] [c000000000cf9acc] =
__do_softirq+0x15c/0x3d4
[   10.738337] [c000000015973d20] [c000000000158464] =
run_ksoftirqd+0x64/0x90
[   10.738346] [c000000015973d40] [c00000000018fd24] =
smpboot_thread_fn+0x204/0x270
[   10.738357] [c000000015973da0] [c000000000189770] kthread+0x190/0x1a0
[   10.738367] [c000000015973e10] [c00000000000ceec] =
ret_from_kernel_thread+0x5c/0x70
[   10.738381] Instruction dump:
[   10.738388] 3863c808 9be9eefe 4bf9a979 60000000 0fe00000 4bfff980 =
e9210070 e8610088=20
[   10.738410] 39400001 99490003 4bf9a959 60000000 <0fe00000> 4bfffc24 =
3d22fff6 8929eefb=20
[   10.738431] ---[ end trace 9ca80b55840c53f0 ]=E2=80=94

Thanks
-Sachin

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8cc27b847ad8..da91db1c137f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3037,8 +3037,9 @@ enqueue_load_avg(struct cfs_rq *cfs_rq, struct =
sched_entity *se)
> static inline void
> dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
> {
> +       u32 divider =3D get_pelt_divider(&se->avg);
>        sub_positive(&cfs_rq->avg.load_avg, se->avg.load_avg);
> -       sub_positive(&cfs_rq->avg.load_sum, se_weight(se) * =
se->avg.load_sum);
> +       cfs_rq->avg.load_sum =3D cfs_rq->avg.load_avg * divider;
> }
> #else
> static inline void
>=20
