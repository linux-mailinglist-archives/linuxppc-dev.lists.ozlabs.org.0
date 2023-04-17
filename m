Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C97176E4A62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 15:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0TBC5N4Vz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:56:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LpU25hPl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LpU25hPl;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0T9G2sr1z3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 23:56:01 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HDL8UX026524;
	Mon, 17 Apr 2023 13:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hXLhGB5WkplO9R/sSuzFW8BNNFWz7FZ479Pyg4ibOYY=;
 b=LpU25hPlW/HlbGEW5udDQ2kHT70m8dRKzgEQAV4ZBGZuKV1rtSbO+XO4OILP0+hpmz3w
 /U6FklOvKYWyfmDDr+G3WcAww4NWm+00QoitBP1wn0h6tBwxafp4GfPHLGbVjl0Ui6Jj
 IFDWj4yj6GcaU70brxkQt2Zyhi5nu4Al7beesxRhH3Mbq9arJNX7Q/KmsG4MSrT+d//5
 XdpRmmrjneQB3zX56Qe7+AyQ7C1omGA5BstEhontwpYVrcFsXNbpBaBbxuMF2aDCU3yh
 vmUbpixGe8dY8OCsRQmdt1Hm0CVYF/tUecwGTOKTDE2XjkbdszzCFd7WJePpVbwiFayY xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q16wugvb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 13:55:58 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33HDMIc1031377;
	Mon, 17 Apr 2023 13:55:58 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q16wugvav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 13:55:58 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33HBdjFa013975;
	Mon, 17 Apr 2023 13:55:57 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pykj6x042-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 13:55:57 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33HDtuj919464918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Apr 2023 13:55:56 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E964758067;
	Mon, 17 Apr 2023 13:55:55 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE83058056;
	Mon, 17 Apr 2023 13:55:55 +0000 (GMT)
Received: from localhost (unknown [9.163.32.114])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Apr 2023 13:55:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <20230414142051.GH63923@kunlun.suse.cz>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo> <87h717t24d.fsf@linux.ibm.com>
 <20230414142051.GH63923@kunlun.suse.cz>
Date: Mon, 17 Apr 2023 08:55:55 -0500
Message-ID: <87bkjmsjdg.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CNVrUVEw9bLjwrDeYg_IcPdHuRhTxSG4
X-Proofpoint-ORIG-GUID: -vzX5YiOgfng5G8xoBg1yKjcWsmNIVrd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_08,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011 mlxlogscore=648
 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170122
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
Cc: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras.c@gmail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Fri, Sep 16, 2022 at 04:56:18PM -0500, Nathan Lynch wrote:
>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> > On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Br=C3=A1s wrote:
>> >> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
>> >> > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>> >> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
>
>> >> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
>> >> > > > Implement reentrant rtas call") change is incorrect. The "reent=
rant"
>> >> > > > property described in the spec applies only to the individual R=
TAS
>> >> > > > functions. The OS can invoke (for example) ibm,set-xive on mult=
iple CPUs
>> >> > > > simultaneously, but it must adhere to the more general requirem=
ent to
>> >> > > > serialize with other RTAS functions.
>> >> > > >=20
>> >> > >=20
>> >> > > I see. Thanks for explaining that part!
>> >> > > I agree: reentrant calls that way don't look as useful on Linux t=
han I
>> >> > > previously thought.
>> >> > >=20
>> >> > > OTOH, I think that instead of reverting the change, we could make=
 use of the
>> >> > > correct information and fix the current implementation. (This cou=
ld help when we
>> >> > > do the same rtas call in multiple cpus)
>> >> >=20
>> >> > Hmm I'm happy to be mistaken here, but I doubt we ever really need =
to do
>> >> > that. I'm not seeing the need.
>> >> >=20
>> >> > > I have an idea of a patch to fix this.=20
>> >> > > Do you think it would be ok if I sent that, to prospect being an =
alternative to
>> >> > > this reversion?
>> >> >=20
>> >> > It is my preference, and I believe it is more common, to revert to =
the
>> >> > well-understood prior state, imperfect as it may be. The revert can=
 be
>> >> > backported to -stable and distros while development and review of
>> >> > another approach proceeds.
>> >>
>> >> Ok then, as long as you are aware of the kdump bug, I'm good.
>> >>
>> >> FWIW:
>> >> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
>> >
>> > A shame. I guess a reader/writer lock would not be much help because
>> > the crash is probably more likely to hit longer running rtas calls?
>> >
>> > Alternative is just cheat and do this...?
>> >
>> > Thanks,
>> > Nick
>> >
>> > diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> > index 693133972294..89728714a06e 100644
>> > --- a/arch/powerpc/kernel/rtas.c
>> > +++ b/arch/powerpc/kernel/rtas.c
>> > @@ -26,6 +26,7 @@
>> >  #include <linux/syscalls.h>
>> >  #include <linux/of.h>
>> >  #include <linux/of_fdt.h>
>> > +#include <linux/panic.h>
>> >=20=20
>> >  #include <asm/interrupt.h>
>> >  #include <asm/rtas.h>
>> > @@ -97,6 +98,19 @@ static unsigned long lock_rtas(void)
>> >  {
>> >         unsigned long flags;
>> >=20=20
>> > +       if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id()) {
>> > +               /*
>> > +                * Crash in progress on this CPU. Other CPUs should be
>> > +                * stopped by now, so skip the lock in case it was bei=
ng
>> > +                * held, and is now needed for crashing e.g., kexec
>> > +                * (machine_kexec_mask_interrupts) requires rtas calls.
>> > +                *
>> > +                * It's possible this could have caused rtas state
>> > breakage
>> > +                * but the alternative is deadlock.
>> > +                */
>> > +               return 0;
>> > +       }
>> > +
>> >         local_irq_save(flags);
>> >         preempt_disable();
>> >         arch_spin_lock(&rtas.lock);
>> > @@ -105,6 +119,9 @@ static unsigned long lock_rtas(void)
>> >=20=20
>> >  static void unlock_rtas(unsigned long flags)
>> >  {
>> > +       if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id())
>> > +               return;
>> > +
>> >         arch_spin_unlock(&rtas.lock);
>> >         local_irq_restore(flags);
>> >         preempt_enable();
>>=20
>> Looks correct.
>>=20
>> I wonder - would it be worth making the panic path use a separate
>> "emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
>> RTAS at panic time, then leaving rtas.args untouched might make the
>> ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
>> incur on the panic path more likely to succeed.
>
> Was some fix for the case of crashing in rtas merged?
>
> Looks like there is none unless I missed something.

I'm not aware of any crashes in RTAS, but we do have an issue open to
track the issue I think you're referring to:

https://github.com/linuxppc/issues/issues/435

No progress yet. AFAIK only XICS guests are exposed; XIVE doesn't use
RTAS calls.
