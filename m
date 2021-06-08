Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141039F50E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzp7X5MKJz303y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:35:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y9ZMN+BJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y9ZMN+BJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzp6y66vpz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:34:34 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158AfKwe146089; Tue, 8 Jun 2021 07:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=i5XVC7wWn3DYuSl1fYu6vYjFpblQBLHIek4KjNkVXmc=;
 b=Y9ZMN+BJf6P7ZMHG0uU9hk3afO9bVbn6V+W3J8Abu2iz3L4mRDg7hgaEjF0PprFFNvAu
 iw86rMzWnZ9DfArqcspKQ74FWeGPtZTAh2og1IEGSs7N9BT7lZ5XWmECyJjs4Yy8YbMV
 qzXSxK0WVwtgW03ofLmYHh9P8TZ9urnoqTzxjjwCrUD6mSoo1hjB7PBU5s+azoOhvqw/
 8gJ2fYi3ATMwMdKIliJSebu97YHbrqMAgpMQ0ZWphDe9nnQyBLdDLcR8BL5rhzIaHoLq
 ljubvyPjU9iV+tDXbNtnvYrtHaMANbjEjBGsWz4KcgdGfGUr0h7jw46W3HRHdXr/pHip Iw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 392712s6ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:34:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 158BStgN014623;
 Tue, 8 Jun 2021 11:34:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3900w89fmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 11:34:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 158BXQYx34013614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 11:33:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 151D242045;
 Tue,  8 Jun 2021 11:34:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 729B24203F;
 Tue,  8 Jun 2021 11:34:11 +0000 (GMT)
Received: from localhost (unknown [9.85.118.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 11:34:11 +0000 (GMT)
Date: Tue, 08 Jun 2021 17:04:09 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to
 emulate_step() on ppc32
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
 <1623065577.8oijg4kgxv.naveen@linux.ibm.com>
 <d10d599c-065e-6baa-af01-6c099482ece5@csgroup.eu>
 <5affed0d-a86f-43de-6f3e-4a4b8da5ffb2@csgroup.eu>
 <dcababd4-b356-0a2c-febc-c5210b268195@csgroup.eu>
In-Reply-To: <dcababd4-b356-0a2c-febc-c5210b268195@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1623151609.owqukm1dln.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QunTILC9BNS3jwBRw2w6t13TpvTOru1X
X-Proofpoint-ORIG-GUID: QunTILC9BNS3jwBRw2w6t13TpvTOru1X
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_05:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080051
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 07/06/2021 =C3=A0 19:36, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 07/06/2021 =C3=A0 16:31, Christophe Leroy a =C3=A9crit=C2=A0:
>>>
>>>
>>> Le 07/06/2021 =C3=A0 13:34, Naveen N. Rao a =C3=A9crit=C2=A0:
>>>> Naveen N. Rao wrote:
>>>>> Trying to use a kprobe on ppc32 results in the below splat:
>>>>> =C2=A0=C2=A0=C2=A0 BUG: Unable to handle kernel data access on read a=
t 0x7c0802a6
>>>>> =C2=A0=C2=A0=C2=A0 Faulting instruction address: 0xc002e9f0
>>>>> =C2=A0=C2=A0=C2=A0 Oops: Kernel access of bad area, sig: 11 [#1]
>>>>> =C2=A0=C2=A0=C2=A0 BE PAGE_SIZE=3D4K PowerPC 44x Platform
>>>>> =C2=A0=C2=A0=C2=A0 Modules linked in:
>>>>> =C2=A0=C2=A0=C2=A0 CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-018=
24-g3a81c0495fdb #7
>>>>> =C2=A0=C2=A0=C2=A0 NIP:=C2=A0 c002e9f0 LR: c0011858 CTR: 00008a47
>>>>> =C2=A0=C2=A0=C2=A0 REGS: c292fd50 TRAP: 0300=C2=A0=C2=A0 Not tainted=
=C2=A0 (5.13.0-rc1-01824-g3a81c0495fdb)
>>>>> =C2=A0=C2=A0=C2=A0 MSR:=C2=A0 00009000 <EE,ME>=C2=A0 CR: 24002002=C2=
=A0 XER: 20000000
>>>>> =C2=A0=C2=A0=C2=A0 DEAR: 7c0802a6 ESR: 00000000
>>>>> =C2=A0=C2=A0=C2=A0 <snip>
>>>>> =C2=A0=C2=A0=C2=A0 NIP [c002e9f0] emulate_step+0x28/0x324
>>>>> =C2=A0=C2=A0=C2=A0 LR [c0011858] optinsn_slot+0x128/0x10000
>>>>> =C2=A0=C2=A0=C2=A0 Call Trace:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 opt_pre_handler+0x7c/0xb4 (unreliable)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 optinsn_slot+0x128/0x10000
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ret_from_syscall+0x0/0x28
>>>>>
>>>>> The offending instruction is:
>>>>> =C2=A0=C2=A0=C2=A0 81 24 00 00=C2=A0=C2=A0=C2=A0=C2=A0 lwz=C2=A0=C2=
=A0=C2=A0=C2=A0 r9,0(r4)
>>>>>
>>>>> Here, we are trying to load the second argument to emulate_step():
>>>>> struct ppc_inst, which is the instruction to be emulated. On ppc64,
>>>>> structures are passed in registers when passed by value. However, per
>>>>> the ppc32 ABI, structures are always passed to functions as pointers.
>>>>> This isn't being adhered to when setting up the call to emulate_step(=
)
>>>>> in the optprobe trampoline. Fix the same.
>>>>>
>>>>> Fixes: eacf4c0202654a ("powerpc: Enable OPTPROBES on PPC32")
>>>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>>>> ---
>>>>> =C2=A0arch/powerpc/kernel/optprobes.c | 8 ++++++--
>>>>> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> Christophe,
>>>> Can you confirm if this patch works for you? It would be good if this =
can go in v5.13.
>>>>
>>>
>>> I'm trying to use kprobes, but I must be missing something. I have trie=
d to follow the exemple in=20
>>> kernel's documentation:
>>>
>>> =C2=A0=C2=A0# echo 'p:myprobe do_sys_open dfd=3D%r3' > /sys/kernel/debu=
g/tracing/kprobe_events
>>>
>>> =C2=A0=C2=A0# echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe=
/enable
>>>
>>> =C2=A0=C2=A0# cat /sys/kernel/debug/kprobes/list
>>>
>>> =C2=A0=C2=A0c00122e4=C2=A0 k=C2=A0 kretprobe_trampoline+0x0=C2=A0=C2=A0=
=C2=A0 [OPTIMIZED]
>>> =C2=A0=C2=A0c018a1b4=C2=A0 k=C2=A0 do_sys_open+0x0=C2=A0=C2=A0=C2=A0 [O=
PTIMIZED]
>>>
>>> =C2=A0=C2=A0# cat /sys/kernel/debug/tracing/tracing_on
>>>
>>> =C2=A0=C2=A01
>>>
>>> =C2=A0=C2=A0# cat /sys/kernel/debug/tracing/trace
>>>
>>> # tracer: nop
>>> #
>>> # entries-in-buffer/entries-written: 0/0=C2=A0=C2=A0 #P:1
>>> #
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _-----=3D> irqs-off
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / _----=3D> need-resched
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | / _---=3D> hardirq/softirq
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || / _--=3D> preempt-depth
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ||| /=C2=A0=C2=A0=C2=A0=C2=A0 delay
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TASK-PID=
=C2=A0=C2=A0=C2=A0=C2=A0 CPU#=C2=A0 ||||=C2=A0=C2=A0 TIMESTAMP=C2=A0 FUNCTI=
ON
>>> #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 ||||=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>>>
>>>
>>>
>>> So it looks like I get no event. I can't believe that do_sys_open() is =
never hit.
>>>
>>> This is without your patch, so it should Oops ?
>>>
>>>
>>> Then it looks like something is locked up somewhere, because I can't do=
 anything else:
>>>
>>> =C2=A0=C2=A0# echo 'p:myprobe2 do_sys_openat2 dfd=3D%r3' >/sys/kernel/d=
ebug/tracing/kprobe_events
>>>
>>> =C2=A0=C2=A0-sh: can't create /sys/kernel/debug/tracing/kprobe_events: =
Device or resource busy
>>>
>>> =C2=A0=C2=A0# echo '-:myprobe' > /sys/kernel/debug/tracing/kprobe_event=
s
>>>
>>> =C2=A0=C2=A0-sh: can't create /sys/kernel/debug/tracing/kprobe_events: =
Device or resource busy
>>>
>>> =C2=A0=C2=A0# echo > /sys/kernel/debug/tracing/kprobe_events
>>>
>>> =C2=A0=C2=A0-sh: can't create /sys/kernel/debug/tracing/kprobe_events: =
Device or resource busy

These should work if you disable the event. See below...

>>>
>>>
>>=20
>> Ok, did a new test. Seems like do_sys_open() is really never called.
>> I set the test at do_sys_openat2 , it was not optimised and was working.
>> I set the test at do_sys_openat2+0x10 , it was optimised and crashed.
>> Now I'm going to test the patch.
>>=20
>> When I set an event, is that normal that it removes the previous one ? T=
hen we can have only one=20
>> event at a time ? And then when that event is enabled we get 'Device or =
resource busy' when trying=20
>> to add a new one ?

You should append to kprobe_events (i.e., use '>>') when _adding_ an=20
event, otherwise it is considered a write and it tries to remove the=20
existing event, which can't be done if the event is enabled.

kprobe_events allows events to be removed only after they are disabled.

>>=20
>=20
> I confirm it doesn't crash anymore and it now works with optimised probes=
.
>=20
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks!
- Naveen

