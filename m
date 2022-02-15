Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C514B7019
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 17:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JymhL1YCVz3cBv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 03:27:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rXBdw3B0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rXBdw3B0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JymgZ4FFMz30QX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 03:26:33 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FGEGUC012232; 
 Tue, 15 Feb 2022 16:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iP7A9xbr7WCdikDbTTC4JtVmLGumU2W/N4lvCKlQWyA=;
 b=rXBdw3B0xh+d0sP0mpClQhyNrR4q1YsGA5OIvMn5miEQUSqPGgtbujy61nKyOALQ1pbE
 s4bb8JC1dTHuLDm+bKnqH6iHDN51DdWiaWVI2XF5earoUhPPo6H6Jn5LmqlOpdoSKR7G
 DW1yWljJDb0+e2EwJecYCAMfm6F7e+bu1y+pvUQZE9yeTnVqOVdXyeymdWyPV12yU9Ty
 Eg3nLSMurCs7gYJigL0nS4CgchBN//v2tUwFDGEiGJyCFPcDA4VcxDbtrfb6uGgeECiy
 q7y4oKFh5pYrL8vvrzE3PmTvnx9YrGT0mm87TleglDNkvQgNNWbFA/k/HnA6RugbXqHV Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e5katqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:26:01 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FGERFh013678;
 Tue, 15 Feb 2022 16:26:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e5katpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:26:00 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FGCAAa000869;
 Tue, 15 Feb 2022 16:25:58 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3e64h9qr7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:25:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FGPsKa46137752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 16:25:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D72D4C046;
 Tue, 15 Feb 2022 16:25:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 100F74C058;
 Tue, 15 Feb 2022 16:25:54 +0000 (GMT)
Received: from localhost (unknown [9.43.98.51])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 16:25:54 +0000 (GMT)
Date: Tue, 15 Feb 2022 21:55:52 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Vasily Gorbik
 <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
 <1644930705.g64na2kgvd.naveen@linux.ibm.com>
 <6dc50f09-4d14-afa2-d2a1-34b72b880edf@csgroup.eu>
 <5c7b5334-6071-f131-a509-9a49ca3d628c@csgroup.eu>
In-Reply-To: <5c7b5334-6071-f131-a509-9a49ca3d628c@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644941712.lqdstzo09z.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QDZP46n6BggCxyXNreLRduagvaFZpVgp
X-Proofpoint-GUID: YTMmRxt70LkYsWEOYMOjmpqtACe0q3Uu
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150095
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> + S390 people
>=20
> Le 15/02/2022 =C3=A0 15:28, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 15/02/2022 =C3=A0 14:36, Naveen N. Rao a =C3=A9crit=C2=A0:
>>> Michael Ellerman wrote:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>> Le 14/02/2022 =C3=A0 16:25, Naveen N. Rao a =C3=A9crit=C2=A0:
>>>>>> Christophe Leroy wrote:
>>>>>>> Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS. It accelerates the call
>>>>>>> of livepatching.
>>>>>>>
>>>>>>> Also note that powerpc being the last one to convert to
>>>>>>> CONFIG_DYNAMIC_FTRACE_WITH_ARGS, it will now be possible to remove
>>>>>>> klp_arch_set_pc() on all architectures.
>>>>>>>
>>>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>>>> ---
>>>>>>> =C2=A0arch/powerpc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>>>> =C2=A0arch/powerpc/include/asm/ftrace.h=C2=A0=C2=A0=C2=A0 | 17 ++++=
+++++++++++++
>>>>>>> =C2=A0arch/powerpc/include/asm/livepatch.h |=C2=A0 4 +---
>>>>>>> =C2=A03 files changed, 19 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>>>> index cdac2115eb00..e2b1792b2aae 100644
>>>>>>> --- a/arch/powerpc/Kconfig
>>>>>>> +++ b/arch/powerpc/Kconfig
>>>>>>> @@ -210,6 +210,7 @@ config PPC
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DEBUG_KMEMLEAK
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DEBUG_STACKOVERFLOW
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE
>>>>>>> +=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE_WITH_ARGS=C2=A0=C2=
=A0=C2=A0 if MPROFILE_KERNEL ||=20
>>>>>>> PPC32
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE_WITH_REGS=C2=A0=
=C2=A0=C2=A0 if MPROFILE_KERNEL ||=20
>>>>>>> PPC32
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_EBPF_JIT
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS=C2=
=A0=C2=A0=C2=A0 if=20
>>>>>>> !(CPU_LITTLE_ENDIAN && POWER7_CPU)
>>>>>>> diff --git a/arch/powerpc/include/asm/ftrace.h=20
>>>>>>> b/arch/powerpc/include/asm/ftrace.h
>>>>>>> index b3f6184f77ea..45c3d6f11daa 100644
>>>>>>> --- a/arch/powerpc/include/asm/ftrace.h
>>>>>>> +++ b/arch/powerpc/include/asm/ftrace.h
>>>>>>> @@ -22,6 +22,23 @@ static inline unsigned long=20
>>>>>>> ftrace_call_adjust(unsigned long addr)
>>>>>>> =C2=A0struct dyn_arch_ftrace {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct module *mod;
>>>>>>> =C2=A0};
>>>>>>> +
>>>>>>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>>>>>>> +struct ftrace_regs {
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct pt_regs regs;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static __always_inline struct pt_regs=20
>>>>>>> *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 return &fregs->regs;
>>>>>>> +}
>>>>>>
>>>>>> I think this is wrong. We need to differentiate between=20
>>>>>> ftrace_caller() and ftrace_regs_caller() here, and only return=20
>>>>>> pt_regs if coming in through ftrace_regs_caller() (i.e.,=20
>>>>>> FL_SAVE_REGS is set).
>>>>>
>>>>> Not sure I follow you.
>>>>>
>>>>> This is based on 5740a7c71ab6 ("s390/ftrace: add=20
>>>>> HAVE_DYNAMIC_FTRACE_WITH_ARGS support")
>>>>>
>>>>> It's all the point of HAVE_DYNAMIC_FTRACE_WITH_ARGS, have the regs=20
>>>>> also with ftrace_caller().
>>>>>
>>>>> Sure you only have the params, but that's the same on s390, so what=20
>>>>> did I miss ?

Steven has explained the rationale for this in his other response:
https://lore.kernel.org/all/20220215093849.556d5444@gandalf.local.home/

>>>
>>> It looks like s390 is special since it apparently saves all registers=20
>>> even for ftrace_caller:=20
>>> https://lore.kernel.org/all/YbipdU5X4HNDWIni@osiris/
>>=20
>> It is not what I understand from their code, see=20
>> https://elixir.bootlin.com/linux/v5.17-rc3/source/arch/s390/kernel/mcoun=
t.S#L37=20
>>=20
>>=20
>> They have a common macro called with argument 'allregs' which is set to=
=20
>> 0 for ftrace_caller() and 1 for ftrace_regs_caller().
>> When allregs =3D=3D 1, the macro seems to save more.
>>=20
>> But ok, I can do like x86, but I need a trick to know whether=20
>> FL_SAVE_REGS is set or not, like they do with fregs->regs.cs
>> Any idea what the condition can be for powerpc ?

We'll need to explicitly zero-out something in pt_regs in=20
ftrace_caller(). We can probably use regs->msr since we don't expect it=20
to be zero when saved from ftrace_regs_caller().

>>=20
>=20
> Finally, it looks like this change is done  via commit 894979689d3a=20
> ("s390/ftrace: provide separate ftrace_caller/ftrace_regs_caller=20
> implementations") four hours the same day after the implementation of=20
> arch_ftrace_get_regs()
>=20
> They may have forgotten to change arch_ftrace_get_regs() which was added=
=20
> in commit 5740a7c71ab6 ("s390/ftrace: add HAVE_DYNAMIC_FTRACE_WITH_ARGS=20
> support") with the assumption that ftrace_caller and ftrace_regs_caller=20
> where identical.

Indeed, good find!


Thanks,
Naveen

