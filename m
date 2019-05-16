Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BF20E91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 20:23:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454fty4MnhzDq9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 04:23:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454fsc55XgzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 04:22:27 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4GILmsx127966
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 14:22:25 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shc75t72k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 14:22:24 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Thu, 16 May 2019 19:22:23 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 19:22:22 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4GIMLtc50004046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 18:22:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727C5A405C;
 Thu, 16 May 2019 18:22:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFF65A405B;
 Thu, 16 May 2019 18:22:20 +0000 (GMT)
Received: from localhost (unknown [9.102.3.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 18:22:20 +0000 (GMT)
Date: Thu, 16 May 2019 23:52:19 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [RFC PATCH] powerpc/64/ftrace: mprofile-kernel patch out mflr
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20190413015940.31170-1-npiggin@gmail.com>
 <871s13ujcf.fsf@concordia.ellerman.id.au>
 <1557729790.fw18xf9mdt.naveen@linux.ibm.com>
 <87tvdytwo0.fsf@concordia.ellerman.id.au>
 <1557821918.xbleq18bk2.naveen@linux.ibm.com>
 <1557985279.4o349j5g2i.astroid@bobo.none>
In-Reply-To: <1557985279.4o349j5g2i.astroid@bobo.none>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19051618-0008-0000-0000-000002E76F13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051618-0009-0000-0000-00002254157A
Message-Id: <1557989161.cjlaryiij4.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=432 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160115
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> Naveen N. Rao's on May 14, 2019 6:32 pm:
>> Michael Ellerman wrote:
>>> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>>>> Michael Ellerman wrote:
>>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>>> The new mprofile-kernel mcount sequence is
>>>>>>
>>>>>>   mflr	r0
>>>>>>   bl	_mcount
>>>>>>
>>>>>> Dynamic ftrace patches the branch instruction with a noop, but leave=
s
>>>>>> the mflr. mflr is executed by the branch unit that can only execute =
one
>>>>>> per cycle on POWER9 and shared with branches, so it would be nice to
>>>>>> avoid it where possible.
>>>>>>
>>>>>> This patch is a hacky proof of concept to nop out the mflr. Can we d=
o
>>>>>> this or are there races or other issues with it?
>>>>>=20
>>>>> There's a race, isn't there?
>>>>>=20
>>>>> We have a function foo which currently has tracing disabled, so the m=
flr
>>>>> and bl are nop'ed out.
>>>>>=20
>>>>>   CPU 0			CPU 1
>>>>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>   bl foo
>>>>>   nop (ie. not mflr)
>>>>>   -> interrupt
>>>>>   something else	enable tracing for foo
>>>>>   ...			patch mflr and branch
>>>>>   <- rfi
>>>>>   bl _mcount
>>>>>=20
>>>>> So we end up in _mcount() but with r0 not populated.
>>>>
>>>> Good catch! Looks like we need to patch the mflr with a "b +8" similar=
=20
>>>> to what we do in __ftrace_make_nop().
>>>=20
>>> Would that actually make it any faster though? Nick?
>>=20
>> Ok, how about doing this as a 2-step process?
>> 1. patch 'mflr r0' with a 'b +8'
>>    synchronize_rcu_tasks()
>> 2. convert 'b +8' to a 'nop'
>=20
> Good idea. Well the mflr r0 is harmless, so you can leave that in.
> You just need to ensure it's not removed before the bl is. So nop
> the bl _mcount, then synchronize_rcu_tasks(), then nop the mflr?

The problem actually seems to be when we try to patch in the branch to=20
_mcount(), rather than when we are patching in the nop instructions=20
(i.e., the race is when we try to enable the function tracer, rather=20
than while disabling it).

When we disable ftrace, we only need to ensure we patch out the branch=20
to _mcount() before patching out the preceding 'mflr r0'. I don't think=20
we need a synchronize_rcu_tasks() in that case.

While enabling ftrace, we will first need to patch the preceding 'mflr=20
r0' (which would now be a 'nop') with 'b +8', then use=20
synchronize_rcu_tasks() and finally patch in 'bl _mcount()' followed by=20
'mflr r0'.

I think that's what you meant, just that my reference to patching 'mflr=20
r0' with a 'b +8' should have called out that the mflr would have been=20
nop'ed out.

- Naveen
=

