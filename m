Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6A372DE4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 18:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZQ5j22nGz301p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 02:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qtlE/bXK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qtlE/bXK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZQ5B332Hz2yZB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 02:18:54 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144G3G9D055344
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 12:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=ZV5ceX03NHu4vvTStAqVSD39yTsRQ4eSdWBOAtqoMIg=;
 b=qtlE/bXKDHJDWlcFt1eRmpbpYFNnyAp3uZUe3VlSJ9kXVhYg6xxeWiLceivhUPe+vKG+
 3e3wJi9F60FbScA1bLwQk8WCQdLyXZFkqd9Er5wsqS6MuuDOsgYReLzm3O2ms6eHL8oz
 L+O08Rn3bR5EvHhxmIu/7Le+G5NXh/2ICiFjIW3t6nf7S9Eh2xmBU4fZTWGnBgCpHE7w
 /WNXamODZsG8jWVLmwaUfsNCLvX4R+AN+mn0QtGitT0zdeysTwzviA+xHMi8CdtNCgX4
 PonbdDqFEb72PpCKYJPgS+4qa7MX2y4Uyt2BvbgF20dpa+av1CsLCyaBAYNunZ1HWXmk dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b8ew2nw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 12:18:51 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 144G3WoC059853
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 12:18:51 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38b8ew2nvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 12:18:51 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144GHwcf023297;
 Tue, 4 May 2021 16:18:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 388xm8h9v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 16:18:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 144GIKid32244106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 16:18:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10CE911C04A;
 Tue,  4 May 2021 16:18:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AB1211C054;
 Tue,  4 May 2021 16:18:45 +0000 (GMT)
Received: from localhost (unknown [9.85.73.70])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 16:18:45 +0000 (GMT)
Date: Tue, 04 May 2021 21:48:44 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/pseries: warn if recursing into the hcall
 tracing code
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-5-npiggin@gmail.com>
 <1619531703.lv0qigovgz.naveen@linux.ibm.com>
 <1619832142.gw4mrldjdp.astroid@bobo.none>
 <1620123377.d2jb7v70z0.naveen@linux.ibm.com>
 <1620124973.i3ngst0czr.astroid@bobo.none>
In-Reply-To: <1620124973.i3ngst0czr.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1620128375.vd9w6g6u3j.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PdR9pOL0IEd4YO6TLpB_e_piPO7RFF5F
X-Proofpoint-GUID: dxW9WzD451jtRg-Yk1trJbnRuBqERYH9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_09:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040114
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
> Excerpts from Naveen N. Rao's message of May 4, 2021 8:25 pm:
>> Nicholas Piggin wrote:
>>> Excerpts from Naveen N. Rao's message of April 27, 2021 11:59 pm:
>>>> Nicholas Piggin wrote:
>>>>> + *
>>>>> + * H_CONFER from spin locks must be treated separately though and us=
e _notrace
>>>>> + * plpar_hcall variants, see yield_to_preempted().
>>>>>   */
>>>>>  static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
>>>>>=20
>>>>> @@ -1843,7 +1846,7 @@ notrace void __trace_hcall_entry(unsigned long =
opcode, unsigned long *args)
>>>>>=20
>>>>>  	depth =3D this_cpu_ptr(&hcall_trace_depth);
>>>>>=20
>>>>> -	if (*depth)
>>>>> +	if (WARN_ON_ONCE(*depth))
>>>>>  		goto out;
>>>>=20
>>>> I don't think this will be helpful. The hcall trace depth tracking is=20
>>>> for the tracepoint and I suspect that this warning will be triggered=20
>>>> quite easily. Since we have recursion protection, I don't think we=20
>>>> should warn here.
>>>=20
>>> What would trigger recursion?
>>=20
>> The trace code that this protects: trace_hcall_entry(). The tracing code=
=20
>> itself can end up doing a hcall as we see in the first patch in this=20
>> series:
>>   plpar_hcall_norets_trace+0x34/0x8c (unreliable)
>>   __pv_queued_spin_lock_slowpath+0x684/0x710
>>   trace_clock_global+0x148/0x150
>>   ring_buffer_lock_reserve+0x12c/0x630
>>   trace_event_buffer_lock_reserve+0x80/0x220
>>   trace_event_buffer_reserve+0x7c/0xd0
>>   trace_event_raw_event_hcall_entry+0x68/0x150
>>   __trace_hcall_entry+0x160/0x180
>>=20
>>=20
>> There is also a comment aroung hcall_trace_depth that mentions this:
>>=20
>>   /*
>>    * Since the tracing code might execute hcalls we need to guard agains=
t
>>    * recursion. One example of this are spinlocks calling H_YIELD on
>>    * shared processor partitions.
>>    */
>=20
> Right but since fixing those, my thought is we better not cause more
> any recursion, so we should fix anything that does.

Ah ok, I got confused by the reference to recursion, since the current=20
fix did not involve hcall trace recursion per se.

Yes, with the current patch set, we have ensured that at least the=20
qspinlock code doesn't invoke tracing if it has to do H_CONFER hcall. I=20
am not entirely sure if that's the only hcall that could be invoked by=20
the tracing code.

The reason I felt that this warning isn't useful is because it can be=20
triggered by the perf NMI -- if the perf NMI happens while we are=20
tracing a different hcall.


Thanks,
Naveen

