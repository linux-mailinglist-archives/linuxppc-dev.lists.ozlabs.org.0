Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E75722FEEA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 16:29:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM5sY6HnBzDrQ6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 02:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KAKGw7xn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM5qN2HFWzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 02:27:28 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LF3Ng2038915; Thu, 21 Jan 2021 10:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=v8Q4MU7eVeRrXwmP086sK3iyDO8Xuth1VoWSfnkT7bg=;
 b=KAKGw7xnuZazzjgTKxIKsKKTBzoEqIlVJ7tC1gUK6kgjoieWN5+fqp7nCwcHhQvCtqXv
 QdczdZbDjzeVRMMCVxT4t9ugeZvz0i6vSCh2t0CHi8WBjMqHYQN90CyJGRjdcOmzZZiz
 ayLpOPrylgE5nDJxo4d7CydIKVFOpRWYduSSdWr7nAq5Of8uE7OcOJN1AZ7iUAk4YzkV
 qycy5xWy4CB3s2oqkCkoWgUjMvGWRfH08/tSjh1MltJpVZTNJbrBNmvDbMuwThL/TF4F
 +ydLu9n5knfa4jQEundZbMDMa+JfpqAXundYoGKV6giH+TDV1l5/hcLZv01A8pH9uKLD lw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367bc2j9sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 10:27:23 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LFCWYY022462;
 Thu, 21 Jan 2021 15:27:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3668nw85rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 15:27:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LFRJCf19071450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 15:27:19 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8970B6A054;
 Thu, 21 Jan 2021 15:27:19 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52F076A051;
 Thu, 21 Jan 2021 15:27:19 +0000 (GMT)
Received: from localhost (unknown [9.211.72.22])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 15:27:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
In-Reply-To: <87ft2vrew6.fsf@mpe.ellerman.id.au>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
 <87czy6xlap.fsf@linux.ibm.com>
 <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
 <871regxwzh.fsf@linux.ibm.com> <87ft2vrew6.fsf@mpe.ellerman.id.au>
Date: Thu, 21 Jan 2021 09:27:18 -0600
Message-ID: <87pn1ywbs9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_08:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210081
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>> On 16/01/2021 02:38, Nathan Lynch wrote:
>>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>>>> Memory locations passed as arguments from the OS to RTAS usually need
>>>>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>>>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>>>>> first logical memory block reported in the LPAR=E2=80=99s device tre=
e.
>>>>>>
>>>>>> On powerpc targets with RTAS, Linux makes available to user space a
>>>>>> region of memory suitable for arguments to be passed to RTAS via
>>>>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>>>>> API during boot in order to ensure that it satisfies the requirements
>>>>>> described above.
>>>>>>
>>>>>> With radix MMU, the upper limit supplied to the memblock allocation
>>>>>> can exceed the bounds of the first logical memory block, since
>>>>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB =
is
>>>>>> a common size of the first memory block according to a small sample =
of
>>>>>> LPARs I have checked.) This leads to failures when user space invokes
>>>>>> an RTAS function that uses a work area, such as
>>>>>> ibm,configure-connector.
>>>>>>
>>>>>> Alter the determination of the upper limit for rtas_rmo_buf's
>>>>>> allocation to consult the device tree directly, ensuring placement
>>>>>> within the RMA regardless of the MMU in use.
>>>>>
>>>>> Can we tie this with RTAS (which also needs to be in RMA) and simply =
add
>>>>> extra 64K in prom_instantiate_rtas() and advertise this address
>>>>> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do
>>>>> not need this RMO area before that point.
>>>>=20
>>>> Can you explain more about what advantage that would bring? I'm not
>>>> seeing it. It's a more significant change than what I've written
>>>> here.
>>>
>>>
>>> We already allocate space for RTAS and (like RMO) it needs to be in RMA=
,=20
>>> and RMO is useless without RTAS. We can reuse RTAS allocation code for=
=20
>>> RMO like this:
>>
>> When you say RMO I assume you are referring to rtas_rmo_buf? (I don't
>> think it is well-named.)
> ...
>
> RMO (Real mode offset) is the old term we used to use to refer to what
> is now called the RMA (Real mode area). There are still many references
> to RMO in Linux, but they almost certainly all refer to what we now call
> the RMA.

Yes... but I think in this discussion Alexey was using RMO to stand in
for rtas_rmo_buf, which was what I was trying to clarify.


>>> May be store in the FDT as "linux,rmo-base" next to "linux,rtas-base",=
=20
>>> for clarity, as sharing symbols between prom and main kernel is a bit=20
>>> tricky.
>>>
>>> The benefit is that we do not do the same thing   (=3D=3D find 64K in R=
MA)=20
>>> in 2 different ways and if the RMO allocated my way is broken - we'll=20
>>> know it much sooner as RTAS itself will break too.
>>
>> Implementation details aside... I'll grant that combining the
>> allocations into one in prom_init reduces some duplication in the sense
>> that both are subject to the same constraints (mostly - the RTAS data
>> area must not cross a 256MB boundary, while the user region may). But
>> they really are distinct concerns. The RTAS private data area is
>> specified in the platform architecture, the OS is obligated to allocate
>> it and pass it to instantiate-rtas, etc etc. However the user region
>> (rtas_rmo_buf) is purely a Linux construct which is there to support
>> sys_rtas.
>>
>> Now, there are multiple sites in the kernel proper that must allocate
>> memory suitable for passing to RTAS. Obviously there is value in
>> consolidating the logic for that purpose in one place, so I'll work on
>> adding that in v2. OK?
>
> I don't think we want to move any allocations into prom_init.c unless we
> have to.
>
> It's best thought of as a trampoline, that runs before the kernel
> proper, to transition from live OF to a flat DT environment. One thing
> that must be done as part of that is instantiating RTAS, because it's
> basically a runtime copy of the live OF. But any other allocs are for
> Linux to handle later, IMHO.

Agreed.
