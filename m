Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB529372F12
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 19:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZRx94Z25z30DH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 03:42:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2KPO0Bk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G2KPO0Bk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZRwd1CdHz2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 03:41:36 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144HX1nn111001; Tue, 4 May 2021 13:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=LRtHciOnd7V0pWicQwa0hprKF6p+mmqv3dR6I/YGLns=;
 b=G2KPO0Bk3yNTyZ50vcclOfmPRMy+Jfg87fV63J49afaPhS5gOYxnDxNqqV2Jx5aKRYXg
 iy1iGufMvapyq6/Og6Pgwms/0pRmQqB1JstA60HOIV5vZ4HEjE9G1PQ4pslRfVlZdV9r
 wpfM+jZW+cUUs5yxdY3p28jIt26ezBDIgXngj39vdMOBRw2VBCVaQbPCtVUdaa2Z02Eu
 GJQFJnZ5JSzwMDLGaCpcUGFJ5OBPeq4vwkk1Cb6jvSs3LkRDoeipT7UcjsTa57Z5+xBt
 jFA8dzGXuDwSb+Vp9Mrahpav8sh9bCoizwpcVc8ysqse6JHVwwxhwK/N4V0AD4wt1TNc dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b6ybghp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 13:41:34 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 144HXcKh112533;
 Tue, 4 May 2021 13:41:34 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b6ybghmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 13:41:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144Hbe9W012408;
 Tue, 4 May 2021 17:41:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 388x8hhatd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 17:41:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144HfSD647120802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 17:41:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0E1A42041;
 Tue,  4 May 2021 17:41:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D19C42045;
 Tue,  4 May 2021 17:41:27 +0000 (GMT)
Received: from localhost (unknown [9.85.73.70])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 17:41:26 +0000 (GMT)
Date: Tue, 04 May 2021 23:11:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>, Nicholas Piggin
 <npiggin@gmail.com>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20210502165757.GH6564@kitsune.suse.cz>
 <1620003110.kzo64haq0d.astroid@bobo.none>
 <20210503071116.GI6564@kitsune.suse.cz>
 <20210503093425.GK6564@kitsune.suse.cz>
 <20210503201752.GP6564@kitsune.suse.cz>
 <1620118312.ynbufjzv5a.astroid@bobo.none>
In-Reply-To: <1620118312.ynbufjzv5a.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1620149664.tj2sjrvaqg.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JPEvcUE065C9TqI3Bz8Ox-LI1t8dYeOx
X-Proofpoint-GUID: rpLhOIzlVceELSQTH4qIlSgDgAto4Nq0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_09:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040118
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

Nicholas Piggin wrote:
> Excerpts from Michal Such=C3=A1nek's message of May 4, 2021 6:17 am:
>> On Mon, May 03, 2021 at 11:34:25AM +0200, Michal Such=C3=A1nek wrote:
>>> On Mon, May 03, 2021 at 09:11:16AM +0200, Michal Such=C3=A1nek wrote:
>>> > On Mon, May 03, 2021 at 10:58:33AM +1000, Nicholas Piggin wrote:
>>> > > Excerpts from Michal Such=C3=A1nek's message of May 3, 2021 2:57 am=
:
>>> > > > On Tue, Apr 28, 2020 at 09:25:17PM +1000, Nicholas Piggin wrote:
>>> > > >> Provide an option to use ELFv2 ABI for big endian builds. This w=
orks on
>>> > > >> GCC and clang (since 2014). It is less well tested and supported=
 by the
>>> > > >> GNU toolchain, but it can give some useful advantages of the ELF=
v2 ABI
>>> > > >> for BE (e.g., less stack usage). Some distros even build BE ELFv=
2
>>> > > >> userspace.
>>> > > >=20
>>> > > > Fixes BTFID failure on BE for me and the ELF ABIv2 kernel boots.
>>> > >=20
>>> > > What's the BTFID failure? Anything we can do to fix it on the v1 AB=
I or=20
>>> > > at least make it depend on BUILD_ELF_V2?
>>> >=20
>>> > Looks like symbols are prefixed with a dot in ABIv1 and BTFID tool is
>>> > not aware of that. It can be disabled on ABIv1 easily.

Yes, I think BTF is generated by pahole, so we will need to add support=20
for recognising dot symbols there.

>>> >=20
>>> > Thanks
>>> >=20
>>> > Michal
>>> >=20
>>> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>>> > index 678c13967580..e703c26e9b80 100644
>>> > --- a/lib/Kconfig.debug
>>> > +++ b/lib/Kconfig.debug
>>> > @@ -305,6 +305,7 @@ config DEBUG_INFO_BTF
>>> >  	bool "Generate BTF typeinfo"
>>> >  	depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
>>> >  	depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
>>> > +	depends on !PPC64 || BUILD_ELF_V2
>>> >  	help
>>> >  	  Generate deduplicated BTF type information from DWARF debug info.
>>> >  	  Turning this on expects presence of pahole tool, which will conve=
rt
>>> >=20
>>> > >=20
>>> > > >=20
>>> > > > Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de>
>>> > > >=20
>>> > > > Also can we enable mprofile on BE now?
>>> > > >=20
>>> > > > I don't see anything endian-specific in the mprofile code at a gl=
ance
>>> > > > but don't have any idea how to test it.
>>> > >=20
>>> > > AFAIK it's just a different ABI for the _mcount call so just runnin=
g
>>> > > some ftrace and ftrace with call graph should test it reasonably we=
ll.
>>>=20
>>> It does not crash and burn but there are some regressions from LE to BE
>>> on the ftrace kernel selftest:
>>>=20
>>> --- ftraceLE.txt	2021-05-03 11:19:14.830000000 +0200
>>> +++ ftraceBE.txt	2021-05-03 11:27:24.770000000 +0200
>>> @@ -7,8 +7,8 @@
>>>  [n] Change the ringbuffer size	[PASS]
>>>  [n] Snapshot and tracing setting	[PASS]
>>>  [n] trace_pipe and trace_marker	[PASS]
>>> -[n] Test ftrace direct functions against tracers	[UNRESOLVED]
>>> -[n] Test ftrace direct functions against kprobes	[UNRESOLVED]
>>> +[n] Test ftrace direct functions against tracers	[FAIL]
>>> +[n] Test ftrace direct functions against kprobes	[FAIL]

Strange to see those fail. I don't think my patch to enable ftrace=20
direct functions is upstream yet ;)

>>>  [n] Generic dynamic event - add/remove kprobe events	[PASS]
>>>  [n] Generic dynamic event - add/remove synthetic events	[PASS]
>>>  [n] Generic dynamic event - selective clear (compatibility)	[PASS]
>>> @@ -16,10 +16,10 @@
>>>  [n] event tracing - enable/disable with event level files	[PASS]
>>>  [n] event tracing - restricts events based on pid notrace filtering	[P=
ASS]
>>>  [n] event tracing - restricts events based on pid	[PASS]
>>> -[n] event tracing - enable/disable with subsystem level files	[PASS]
>>> +[n] event tracing - enable/disable with subsystem level files	[FAIL]
>>>  [n] event tracing - enable/disable with top level files	[PASS]
>>> -[n] Test trace_printk from module	[UNRESOLVED]
>>> -[n] ftrace - function graph filters with stack tracer	[PASS]
>>> +[n] Test trace_printk from module	[FAIL]
>>> +[n] ftrace - function graph filters with stack tracer	[FAIL]
>>>  [n] ftrace - function graph filters	[PASS]
>>>  [n] ftrace - function trace with cpumask	[PASS]
>>>  [n] ftrace - test for function event triggers	[PASS]
>>> @@ -27,7 +27,7 @@
>>>  [n] ftrace - function pid notrace filters	[PASS]
>>>  [n] ftrace - function pid filters	[PASS]
>>>  [n] ftrace - stacktrace filter command	[PASS]
>>> -[n] ftrace - function trace on module	[UNRESOLVED]
>>> +[n] ftrace - function trace on module	[FAIL]
>>>  [n] ftrace - function profiler with function tracing	[PASS]
>>>  [n] ftrace - function profiling	[PASS]
>>>  [n] ftrace - test reading of set_ftrace_filter	[PASS]
>>> @@ -44,10 +44,10 @@
>>>  [n] Kprobe event argument syntax	[PASS]
>>>  [n] Kprobe dynamic event with arguments	[PASS]
>>>  [n] Kprobes event arguments with types	[PASS]
>>> -[n] Kprobe event user-memory access	[UNSUPPORTED]
>>> +[n] Kprobe event user-memory access	[FAIL]
>>>  [n] Kprobe event auto/manual naming	[PASS]
>>>  [n] Kprobe dynamic event with function tracer	[PASS]
>>> -[n] Kprobe dynamic event - probing module	[UNRESOLVED]
>>> +[n] Kprobe dynamic event - probing module	[FAIL]
>>>  [n] Create/delete multiprobe on kprobe event	[PASS]
>>>  [n] Kprobe event parser error log check	[PASS]
>>>  [n] Kretprobe dynamic event with arguments	[PASS]
>>> @@ -57,11 +57,11 @@
>>>  [n] Kprobe events - probe points	[PASS]
>>>  [n] Kprobe dynamic event - adding and removing	[PASS]
>>>  [n] Uprobe event parser error log check	[PASS]
>>> -[n] test for the preemptirqsoff tracer	[UNSUPPORTED]
>>> -[n] Meta-selftest: Checkbashisms	[UNRESOLVED]
>>> +[n] test for the preemptirqsoff tracer	[FAIL]
>>> +[n] Meta-selftest: Checkbashisms	[FAIL]
>>>  [n] Test wakeup RT tracer	[PASS]
>>>  [n] Test wakeup tracer	[PASS]
>>> -[n] event trigger - test inter-event histogram trigger expected fail a=
ctions	[XFAIL]
>>> +[n] event trigger - test inter-event histogram trigger expected fail a=
ctions	[FAIL]
>>>  [n] event trigger - test field variable support	[PASS]
>>>  [n] event trigger - test inter-event combined histogram trigger	[PASS]
>>>  [n] event trigger - test multiple actions on hist trigger	[PASS]
>>> @@ -96,7 +96,8 @@
>>>  [n] (instance)  event tracing - enable/disable with event level files	=
[PASS]
>>>  [n] (instance)  event tracing - restricts events based on pid notrace =
filtering	[PASS]
>>>  [n] (instance)  event tracing - restricts events based on pid	[PASS]
>>> -[n] (instance)  event tracing - enable/disable with subsystem level fi=
les	[PASS]
>>> +[n] (instance)  event tracing - enable/disable with subsystem level fi=
les	[FAIL]
>>> +rmdir: failed to remove '/sys/kernel/tracing/instances/ftracetest.mceB=
yV': Device or resource busy
>>>  [n] (instance)  ftrace - test for function event triggers	[PASS]
>>>  [n] (instance)  ftrace - function pid notrace filters	[PASS]
>>>  [n] (instance)  ftrace - function pid filters	[PASS]
>>>=20
>>> I needed to add a test timeout to get this far because
>>> "event tracing - enable/disable with subsystem level files" gets stuck.

Does that test pass on LE for you? In the past, I have seen some lockups=20
but will have to go revisit the tests...

>>=20
>> There is some regression from mprofile on BE ABIv2
>>=20
>> --- ftraceBEv2.txt	2021-05-03 18:11:01.100000000 +0200
>> +++ ftraceBE.mprofile.txt	2021-05-03 11:27:24.770000000 +0200
>> @@ -19,7 +19,7 @@
>>  [n] event tracing - enable/disable with subsystem level files	[FAIL]
>>  [n] event tracing - enable/disable with top level files	[PASS]
>>  [n] Test trace_printk from module	[FAIL]
>> -[n] ftrace - function graph filters with stack tracer	[PASS]
>> +[n] ftrace - function graph filters with stack tracer	[FAIL]
>>  [n] ftrace - function graph filters	[PASS]
>>  [n] ftrace - function trace with cpumask	[PASS]
>>  [n] ftrace - test for function event triggers	[PASS]
>> @@ -31,7 +31,7 @@
>>  [n] ftrace - function profiler with function tracing	[PASS]
>>  [n] ftrace - function profiling	[PASS]
>>  [n] ftrace - test reading of set_ftrace_filter	[PASS]
>> -[n] ftrace - Max stack tracer	[PASS]
>> +[n] ftrace - Max stack tracer	[FAIL]
>>  [n] ftrace - test for function traceon/off triggers	[PASS]
>>  [n] ftrace - test tracing error log support	[PASS]
>>  [n] Test creation and deletion of trace instances while setting an even=
t	[PASS]
>=20
> Hmm, I don't see an obvious case where the stack layout is based on
> BE when it should be using ELF ABI version, or ftrace_64_mprofile.S
> depends on LE. +Naveen

Yes, I don't think we ever enabled the stack tracer to work properly on=20
LE and -mprofile-kernel. I will take a look tomorrow.

- Naveen

