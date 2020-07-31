Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5170234744
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 16:01:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ88C03B6zDqST
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 00:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ7yq5bdyzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 23:53:07 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VDWiTl086340; Fri, 31 Jul 2020 09:52:59 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mjuvu78v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:52:59 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06VDnp07022630;
 Fri, 31 Jul 2020 13:52:58 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 32gcps2wj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:52:58 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06VDqvq035651856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 13:52:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B1D86A04D;
 Fri, 31 Jul 2020 13:52:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC07A6A047;
 Fri, 31 Jul 2020 13:52:56 +0000 (GMT)
Received: from localhost (unknown [9.160.72.151])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 13:52:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
In-Reply-To: <87ft974yf7.fsf@mpe.ellerman.id.au>
References: <20200728173741.717372-1-nathanl@linux.ibm.com>
 <bd9225f2-40c9-0460-ba45-c29c920b5f91@linux.ibm.com>
 <878sf31m8k.fsf@linux.ibm.com> <87lfj16cql.fsf@mpe.ellerman.id.au>
 <875za511z6.fsf@linux.ibm.com> <87ft974yf7.fsf@mpe.ellerman.id.au>
Date: Fri, 31 Jul 2020 08:52:55 -0500
Message-ID: <87365723m0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=905 spamscore=0
 lowpriorityscore=0 suspectscore=5 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310097
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>>> Le 28/07/2020 =C3=A0 19:37, Nathan Lynch a =C3=A9crit=C2=A0:
>>>>>> The drmem lmb list can have hundreds of thousands of entries, and
>>>>>> unfortunately lookups take the form of linear searches. As long as
>>>>>> this is the case, traversals have the potential to monopolize the CPU
>>>>>> and provoke lockup reports, workqueue stalls, and the like unless
>>>>>> they explicitly yield.
>>>>>>=20
>>>>>> Rather than placing cond_resched() calls within various
>>>>>> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
>>>>>> expression of the loop macro itself so users can't omit it.
>>>>>
>>>>> Is that not too much to call cond_resched() on every LMB?
>>>>>
>>>>> Could that be less frequent, every 10, or 100, I don't really know ?
>>>>
>>>> Everything done within for_each_drmem_lmb is relatively heavyweight
>>>> already. E.g. calling dlpar_remove_lmb()/dlpar_add_lmb() can take doze=
ns
>>>> of milliseconds. I don't think cond_resched() is an expensive check in
>>>> this context.
>>>
>>> Hmm, mostly.
>>>
>>> But there are quite a few cases like drmem_update_dt_v1():
>>>
>>> 	for_each_drmem_lmb(lmb) {
>>> 		dr_cell->base_addr =3D cpu_to_be64(lmb->base_addr);
>>> 		dr_cell->drc_index =3D cpu_to_be32(lmb->drc_index);
>>> 		dr_cell->aa_index =3D cpu_to_be32(lmb->aa_index);
>>> 		dr_cell->flags =3D cpu_to_be32(drmem_lmb_flags(lmb));
>>>
>>> 		dr_cell++;
>>> 	}
>>>
>>> Which will compile to a pretty tight loop at the moment.
>>>
>>> Or drmem_update_dt_v2() which has two loops over all lmbs.
>>>
>>> And although the actual TIF check is cheap the function call to do it is
>>> not free.
>>>
>>> So I worry this is going to make some of those long loops take even
>>> longer.
>>
>> That's fair, and I was wrong - some of the loop bodies are relatively
>> simple, not doing allocations or taking locks, etc.
>>
>> One way to deal is to keep for_each_drmem_lmb() as-is and add a new
>> iterator that can reschedule, e.g. for_each_drmem_lmb_slow().
>
> If we did that, how many call-sites would need converting?
> Is it ~2 or ~20 or ~200?

At a glance I would convert 15-20 out of the 24 users in the tree I'm
looking at. Let me know if I should do a v2 with that approach.
