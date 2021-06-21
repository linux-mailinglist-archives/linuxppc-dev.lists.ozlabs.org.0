Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C943AE7C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 12:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7mj60Sw3z3bpH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:58:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W3GPXs0K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W3GPXs0K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7mhb32Wdz2yY9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 20:57:50 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LAiKT1105366; Mon, 21 Jun 2021 06:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=jK1JkEiLp5sNnMUiSr6H/sNZs4HJml0ll1/6ZeRbtRg=;
 b=W3GPXs0KUlfbI4xTwJj5VBD3pefERahdhYoMOqKroVgvZXR17CAzNj78ahpEvGPpAZCt
 l6imJ8jKuLG+kfdz1yLyZmFxawWEZ+IzTX3uhX2gFMEWpuFVk7JS15hhJIQH10YTrMLT
 Be3PutPMCvpkaARFx60aJK0d3kIXHkW9ylhel58bGwe4AxGjd9Gi7+MvK4oNaUGI2JvP
 rKAm56CuPLAWFmDyB65Ew11BosQXc2Q9eGr9HMg2nhJypw8VlTVYiZLxA1lE3i+XeV7M
 zEKcA8KhivZR0vjMBEJaDqa2wlRiwfNUtM84tRKsPmoqkHmRM5UxBS7lLQsolkSbz7xY 9w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39as9d8bfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 06:57:43 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LAvfQN001857;
 Mon, 21 Jun 2021 10:57:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3998788ev4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 10:57:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LAvdQ230474580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 10:57:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0122F52051;
 Mon, 21 Jun 2021 10:57:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.196.19])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C2C4952050;
 Mon, 21 Jun 2021 10:57:37 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Message-Id: <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_C1A5130F-5629-4229-80C6-29EC17985B59"
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
Date: Mon, 21 Jun 2021 16:27:36 +0530
In-Reply-To: <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
To: Odin Ugedal <odin@uged.al>
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5IbZr38XvtkIwn39vFoe7mD4F8oMQkGe
X-Proofpoint-ORIG-GUID: 5IbZr38XvtkIwn39vFoe7mD4F8oMQkGe
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_03:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210062
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_C1A5130F-5629-4229-80C6-29EC17985B59
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 21-Jun-2021, at 3:24 PM, Odin Ugedal <odin@uged.al> wrote:
>=20
> man. 21. jun. 2021 kl. 11:50 skrev Vincent Guittot =
<vincent.guittot@linaro.org>:
>> This means that a child's load was not null and it was inserted
>> whereas parent's load was null. This should not happen unless the
>> propagation failed somewhere
>=20
> My initial thought is that the patch below will fix it, if that is the
> issue (that a leaf is inserted, but the propagation is not "completed"
> in unthrottle). Might that be the case? Still working on reproducing
> the issue tho.
>=20

Unfortunately this does not help. I can still recreate the failure.

Have attached the o/p from test run.

Thanks
-Sachin
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bfaa6e1f6067..015c5a5c1a4d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4930,12 +4930,7 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
>                if (cfs_rq_throttled(cfs_rq))
>                        goto unthrottle_throttle;
>=20
> -               /*
> -                * One parent has been throttled and cfs_rq removed =
from the
> -                * list. Add it back to not break the leaf list.
> -                */
> -               if (throttled_hierarchy(cfs_rq))
> -                       list_add_leaf_cfs_rq(cfs_rq);
> +               list_add_leaf_cfs_rq(cfs_rq);
>        }
>=20
>        /* At this point se is NULL and we are at root level*/

--Apple-Mail=_C1A5130F-5629-4229-80C6-29EC17985B59
Content-Disposition: attachment;
	filename=run.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="run.txt"
Content-Transfer-Encoding: quoted-printable

# cd /opt/ltp/testcases/bin
# ./cfs_bandwidth01 -i 5
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
tst_buffers.c:55: TINFO: Test is using guarded buffers
cfs_bandwidth01.c:49: TINFO: Set 'worker1/cpu.max' =3D '3000 10000'
cfs_bandwidth01.c:49: TINFO: Set 'worker2/cpu.max' =3D '2000 10000'
cfs_bandwidth01.c:49: TINFO: Set 'worker3/cpu.max' =3D '3000 10000'
cfs_bandwidth01.c:113: TPASS: Scheduled bandwidth constrained workers
cfs_bandwidth01.c:49: TINFO: Set 'level2/cpu.max' =3D '5000 10000'
cfs_bandwidth01.c:125: TPASS: Workers exited
cfs_bandwidth01.c:113: TPASS: Scheduled bandwidth constrained workers
[   48.343143] ------------[ cut here ]------------
[   48.343164] rq->tmp_alone_branch !=3D &rq->leaf_cfs_rq_list
[   48.343172] WARNING: CPU: 24 PID: 4405 at kernel/sched/fair.c:401 unthro=
ttle_cfs_rq+0x49c/0x560
[   48.343196] Modules linked in: nf_tables nfnetlink tun bridge stp llc rf=
kill sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_=
tables xfs libcrc32c sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_tr=
ansport_srp dm_mirror dm_region_hash dm_log dm_mod fuse
[   48.343251] CPU: 24 PID: 4405 Comm: cfs_bandwidth01 Not tainted 5.13.0-r=
c7-dirty #4
[   48.343261] NIP:  c0000000001b88fc LR: c0000000001b88f8 CTR: c0000000007=
23d10
[   48.343269] REGS: c00000000fb13780 TRAP: 0700   Not tainted  (5.13.0-rc7=
-dirty)
[   48.343278] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48044224 =
 XER: 00000005
[   48.343295] CFAR: c00000000014d8a0 IRQMASK: 1=20
[   48.343295] GPR00: c0000000001b88f8 c00000000fb13a20 c0000000029ab400 00=
0000000000002d=20
[   48.343295] GPR04: 00000000fffeffff c00000000fb136e0 0000000000000027 c0=
0000154f817e08=20
[   48.343295] GPR08: 0000000000000023 0000000000000001 0000000000000027 c0=
0000167f1d7fe8=20
[   48.343295] GPR12: 0000000000004000 c00000154ffdc680 0000000000000000 00=
00000000000000=20
[   48.343295] GPR16: c000000000fa6660 0000000000000001 0000000000000000 c0=
000000024e1cd8=20
[   48.343295] GPR20: 0000000000000000 c00000000290a69a 0000000000000000 c0=
000000024e1cc0=20
[   48.343295] GPR24: 0000000000000000 c0000000029f2140 c00000154f762380 00=
00000000000001=20
[   48.343295] GPR28: 0000000000000001 0000000000000000 c00000154f762400 00=
00000000000000=20
[   48.343388] NIP [c0000000001b88fc] unthrottle_cfs_rq+0x49c/0x560
[   48.343397] LR [c0000000001b88f8] unthrottle_cfs_rq+0x498/0x560
[   48.343406] Call Trace:
[   48.343410] [c00000000fb13a20] [c0000000001b88f8] unthrottle_cfs_rq+0x49=
8/0x560 (unreliable)
[   48.343422] [c00000000fb13ac0] [c00000000019edb8] tg_set_cfs_bandwidth+0=
x2c8/0x470
[   48.343433] [c00000000fb13bc0] [c000000000263874] cgroup_file_write+0x16=
4/0x210
[   48.343444] [c00000000fb13c20] [c00000000058cfac] kernfs_fop_write_iter+=
0x1cc/0x280
[   48.343455] [c00000000fb13c70] [c00000000047024c] new_sync_write+0x14c/0=
x1d0
[   48.343467] [c00000000fb13d10] [c000000000473844] vfs_write+0x224/0x330
[   48.343476] [c00000000fb13d60] [c000000000473b2c] ksys_write+0x7c/0x140
[   48.343485] [c00000000fb13db0] [c000000000030fb0] system_call_exception+=
0x150/0x2d0
[   48.343495] [c00000000fb13e10] [c00000000000d45c] system_call_common+0xe=
c/0x278
[   48.343504] --- interrupt: c00 at 0x7fffaa67bd74
[   48.343511] NIP:  00007fffaa67bd74 LR: 00007fffaa5f34c4 CTR: 00000000000=
00000
[   48.343519] REGS: c00000000fb13e80 TRAP: 0c00   Not tainted  (5.13.0-rc7=
-dirty)
[   48.343527] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> =
 CR: 28002282  XER: 00000000
[   48.343548] IRQMASK: 0=20
[   48.343548] GPR00: 0000000000000004 00007fffcb534d60 00007fffaa777100 00=
00000000000010=20
[   48.343548] GPR04: 00000000415623d0 0000000000000005 0000000000000010 00=
007fffcb534df8=20
[   48.343548] GPR08: 0000000010028618 0000000000000000 0000000000000000 00=
00000000000000=20
[   48.343548] GPR12: 0000000000000000 00007fffaa81a310 0000000000000000 00=
00000000000000=20
[   48.343548] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[   48.343548] GPR20: 0000000000000000 0000000000000000 0000000000000002 00=
00000000000000=20
[   48.343548] GPR24: 0000000000000000 000000000000002b 0000000000000005 00=
000000415623d0=20
[   48.343548] GPR28: 0000000000000005 00007fffcb534eb0 00000000415623d0 00=
00000000000005=20
[   48.343634] NIP [00007fffaa67bd74] 0x7fffaa67bd74
[   48.343640] LR [00007fffaa5f34c4] 0x7fffaa5f34c4
[   48.343646] --- interrupt: c00
[   48.343651] Instruction dump:
[   48.343656] 4bfffc74 3d22fff6 8929f2a9 2f890000 409efed4 39200001 3d42ff=
f6 3c62fe60=20
[   48.343672] 3863be08 992af2a9 4bf94f45 60000000 <0fe00000> 4bfffeb0 7f64=
07b4 7f43d378=20
[   48.343687] ---[ end trace 61db91af8340603f ]---
cfs_bandwidth01.c:49: TINFO: Set 'level2/cpu.max' =3D '5000 10000'
cfs_bandwidth01.c:125: TPASS: Workers exited
cfs_bandwidth01.c:113: TPASS: Scheduled bandwidth constrained workers
cfs_bandwidth01.c:49: TINFO: Set 'level2/cpu.max' =3D '5000 10000'
cfs_bandwidth01.c:125: TPASS: Workers exited
cfs_bandwidth01.c:113: TPASS: Scheduled bandwidth constrained workers
cfs_bandwidth01.c:49: TINFO: Set 'level2/cpu.max' =3D '5000 10000'
cfs_bandwidth01.c:125: TPASS: Workers exited
cfs_bandwidth01.c:113: TPASS: Scheduled bandwidth constrained workers
cfs_bandwidth01.c:49: TINFO: Set 'level2/cpu.max' =3D '5000 10000'
cfs_bandwidth01.c:125: TPASS: Workers exited
tst_test.c:1349: TFAIL: Kernel is now tainted.

HINT: You _MAY_ be missing kernel fixes, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D39f23ce07b93
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Db34cb07dde7c
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dfe61468b2cbc
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D5ab297bab984
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D6d4d22468dae

Summary:
passed   10
failed   1
broken   0
skipped  0
warnings 0

--Apple-Mail=_C1A5130F-5629-4229-80C6-29EC17985B59--

