Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172A4B6DC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 14:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyhxC4VDJz2xBV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 00:38:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gBqRWSYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gBqRWSYz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyhwR0kxTz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 00:37:26 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FCBYSU010180; 
 Tue, 15 Feb 2022 13:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CK5FtuC8RijTRY6mWusruZve7sKzMTJ4Wb1AQCLb+4M=;
 b=gBqRWSYzIscQih3jCyUsxw/RAxD/ImWsy3NeoQ5mka7+s01pfaoo7TFYfiwptj8ee7hQ
 I1TLNJPJVXjK3N/1tkBwaf3IQIXRXB/wuyjPr0Z2l4ccG3AVgEjzIfmylg+Azj1ESW3M
 +VX6PiO6fpDCLRAxR3/4tfEpxcom3y/PuiS8TYNQppR2WigqwWJNyw3KU7fHs6ZeqAeP
 mUGgzH4oBdO0VC0ER6geFFT2Ff66fo2JWHhd8cdOBHFUAEA8FxP7H7/S9ByDPjU7PoF7
 cByoCJI6fDQjOn7Ei2s/dow8kL0jkHWmp3hsn83YZ/BZKKSOTEXQ4Jj/uZCCYG7F7y5x EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8a71mfys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:36:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FDZpir025784;
 Tue, 15 Feb 2022 13:36:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8a71mfyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:36:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FDWQai030911;
 Tue, 15 Feb 2022 13:36:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9yh5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:36:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FDaqvq30998840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 13:36:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6867452067;
 Tue, 15 Feb 2022 13:36:52 +0000 (GMT)
Received: from localhost (unknown [9.43.98.51])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E36D55204E;
 Tue, 15 Feb 2022 13:36:51 +0000 (GMT)
Date: Tue, 15 Feb 2022 19:06:48 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
In-Reply-To: <875ypgo0f3.fsf@mpe.ellerman.id.au>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644930705.g64na2kgvd.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D6NyYCfAf_PpNR8IgOprj2uFIQsnSWBc
X-Proofpoint-ORIG-GUID: XfD_-Fp8wj-eqHfFNcokgkQw2teTdqBZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150078
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 14/02/2022 =C3=A0 16:25, Naveen N. Rao a =C3=A9crit=C2=A0:
>>> Christophe Leroy wrote:
>>>> Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS. It accelerates the call
>>>> of livepatching.
>>>>
>>>> Also note that powerpc being the last one to convert to
>>>> CONFIG_DYNAMIC_FTRACE_WITH_ARGS, it will now be possible to remove
>>>> klp_arch_set_pc() on all architectures.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>> =C2=A0arch/powerpc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0arch/powerpc/include/asm/ftrace.h=C2=A0=C2=A0=C2=A0 | 17 +++++++=
++++++++++
>>>> =C2=A0arch/powerpc/include/asm/livepatch.h |=C2=A0 4 +---
>>>> =C2=A03 files changed, 19 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index cdac2115eb00..e2b1792b2aae 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -210,6 +210,7 @@ config PPC
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DEBUG_KMEMLEAK
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DEBUG_STACKOVERFLOW
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE
>>>> +=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE_WITH_ARGS=C2=A0=C2=A0=
=C2=A0 if MPROFILE_KERNEL || PPC32
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE_WITH_REGS=C2=A0=C2=
=A0=C2=A0 if MPROFILE_KERNEL || PPC32
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_EBPF_JIT
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS=C2=A0=
=C2=A0=C2=A0 if !(CPU_LITTLE_ENDIAN=20
>>>> && POWER7_CPU)
>>>> diff --git a/arch/powerpc/include/asm/ftrace.h=20
>>>> b/arch/powerpc/include/asm/ftrace.h
>>>> index b3f6184f77ea..45c3d6f11daa 100644
>>>> --- a/arch/powerpc/include/asm/ftrace.h
>>>> +++ b/arch/powerpc/include/asm/ftrace.h
>>>> @@ -22,6 +22,23 @@ static inline unsigned long=20
>>>> ftrace_call_adjust(unsigned long addr)
>>>> =C2=A0struct dyn_arch_ftrace {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct module *mod;
>>>> =C2=A0};
>>>> +
>>>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>>>> +struct ftrace_regs {
>>>> +=C2=A0=C2=A0=C2=A0 struct pt_regs regs;
>>>> +};
>>>> +
>>>> +static __always_inline struct pt_regs *arch_ftrace_get_regs(struct=20
>>>> ftrace_regs *fregs)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 return &fregs->regs;
>>>> +}
>>>=20
>>> I think this is wrong. We need to differentiate between ftrace_caller()=
=20
>>> and ftrace_regs_caller() here, and only return pt_regs if coming in=20
>>> through ftrace_regs_caller() (i.e., FL_SAVE_REGS is set).
>>
>> Not sure I follow you.
>>
>> This is based on 5740a7c71ab6 ("s390/ftrace: add=20
>> HAVE_DYNAMIC_FTRACE_WITH_ARGS support")
>>
>> It's all the point of HAVE_DYNAMIC_FTRACE_WITH_ARGS, have the regs also=
=20
>> with ftrace_caller().
>>
>> Sure you only have the params, but that's the same on s390, so what did=
=20
>> I miss ?

It looks like s390 is special since it apparently saves all registers=20
even for ftrace_caller:=20
https://lore.kernel.org/all/YbipdU5X4HNDWIni@osiris/

As I understand it, the reason ftrace_get_regs() was introduced was to=20
be able to only return the pt_regs, if _all_ registers were saved into=20
it, which we don't do when coming in through ftrace_caller(). See the=20
x86 implementation (commit 02a474ca266a47 ("ftrace/x86: Allow for=20
arguments to be passed in to ftrace_regs by default"), which returns=20
pt_regs conditionally.

>=20
> I already have this series in next, I can pull it out, but I'd rather
> not.

Yeah, I'm sorry about the late review on this one.

>=20
> I'll leave it in for now, hopefully you two can agree overnight my time
> whether this is a big problem or something we can fix with a fixup
> patch.

I think changes to this particular patch can be added as an incremental=20
patch. If anything, pt_regs won't have all valid registers, but no one=20
should depend on it without also setting FL_SAVE_REGS anyway.

I was concerned about patch 8 though, where we are missing saving r1=20
into pt_regs. That gets used in patch 11, and will be used during=20
unwinding when the function_graph tracer is active. But, this should=20
still just result in us being unable to unwind the stack, so I think=20
that can also be an incremental patch.


Thanks,
Naveen
