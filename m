Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029822C0A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 10:27:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCj424yrwzF07s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 18:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCj1y3MHjzDrdM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 18:25:26 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O838ld142493; Fri, 24 Jul 2020 04:25:21 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faj43qf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 04:25:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O8Fomg016134;
 Fri, 24 Jul 2020 08:25:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7q2ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 08:25:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O8PGGX62783660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 08:25:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3B7A405D;
 Fri, 24 Jul 2020 08:25:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00C06A405F;
 Fri, 24 Jul 2020 08:25:13 +0000 (GMT)
Received: from [9.85.89.111] (unknown [9.85.89.111])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jul 2020 08:25:12 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v3 12/15] powerpc/perf: Add support for outputting extended regs
 in perf intr_regs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200723145609.GA1943963@kernel.org>
Date: Fri, 24 Jul 2020 13:55:09 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <027A2943-661E-4BEE-9EB1-A00AB8DBE7D6@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-13-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1dded891-e5c2-ae1a-301c-4a3806aec3a0@linux.ibm.com>
 <489dcd01-5570-bfd4-8b46-10cf15c1e3ab@linux.ibm.com>
 <20200723145609.GA1943963@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_02:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240059
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kajoljain <kjain@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 svaidyan@in.ibm.com, Jiri Olsa <jolsa@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 23-Jul-2020, at 8:26 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Thu, Jul 23, 2020 at 11:14:16AM +0530, kajoljain escreveu:
>>=20
>>=20
>> On 7/21/20 11:32 AM, kajoljain wrote:
>>>=20
>>>=20
>>> On 7/17/20 8:08 PM, Athira Rajeev wrote:
>>>> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>>>>=20
>>>> Add support for perf extended register capability in powerpc.
>>>> The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to indicate =
the
>>>> PMU which support extended registers. The generic code define the =
mask
>>>> of extended registers as 0 for non supported architectures.
>>>>=20
>>>> Patch adds extended regs support for power9 platform by
>>>> exposing MMCR0, MMCR1 and MMCR2 registers.
>>>>=20
>>>> REG_RESERVED mask needs update to include extended regs.
>>>> `PERF_REG_EXTENDED_MASK`, contains mask value of the supported =
registers,
>>>> is defined at runtime in the kernel based on platform since the =
supported
>>>> registers may differ from one processor version to another and =
hence the
>>>> MASK value.
>>>>=20
>>>> with patch
>>>> ----------
>>>>=20
>>>> available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11
>>>> r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26
>>>> r27 r28 r29 r30 r31 nip msr orig_r3 ctr link xer ccr softe
>>>> trap dar dsisr sier mmcra mmcr0 mmcr1 mmcr2
>>>>=20
>>>> PERF_RECORD_SAMPLE(IP, 0x1): 4784/4784: 0 period: 1 addr: 0
>>>> ... intr regs: mask 0xffffffffffff ABI 64-bit
>>>> .... r0    0xc00000000012b77c
>>>> .... r1    0xc000003fe5e03930
>>>> .... r2    0xc000000001b0e000
>>>> .... r3    0xc000003fdcddf800
>>>> .... r4    0xc000003fc7880000
>>>> .... r5    0x9c422724be
>>>> .... r6    0xc000003fe5e03908
>>>> .... r7    0xffffff63bddc8706
>>>> .... r8    0x9e4
>>>> .... r9    0x0
>>>> .... r10   0x1
>>>> .... r11   0x0
>>>> .... r12   0xc0000000001299c0
>>>> .... r13   0xc000003ffffc4800
>>>> .... r14   0x0
>>>> .... r15   0x7fffdd8b8b00
>>>> .... r16   0x0
>>>> .... r17   0x7fffdd8be6b8
>>>> .... r18   0x7e7076607730
>>>> .... r19   0x2f
>>>> .... r20   0xc00000001fc26c68
>>>> .... r21   0xc0002041e4227e00
>>>> .... r22   0xc00000002018fb60
>>>> .... r23   0x1
>>>> .... r24   0xc000003ffec4d900
>>>> .... r25   0x80000000
>>>> .... r26   0x0
>>>> .... r27   0x1
>>>> .... r28   0x1
>>>> .... r29   0xc000000001be1260
>>>> .... r30   0x6008010
>>>> .... r31   0xc000003ffebb7218
>>>> .... nip   0xc00000000012b910
>>>> .... msr   0x9000000000009033
>>>> .... orig_r3 0xc00000000012b86c
>>>> .... ctr   0xc0000000001299c0
>>>> .... link  0xc00000000012b77c
>>>> .... xer   0x0
>>>> .... ccr   0x28002222
>>>> .... softe 0x1
>>>> .... trap  0xf00
>>>> .... dar   0x0
>>>> .... dsisr 0x80000000000
>>>> .... sier  0x0
>>>> .... mmcra 0x80000000000
>>>> .... mmcr0 0x82008090
>>>> .... mmcr1 0x1e000000
>>>> .... mmcr2 0x0
>>>> ... thread: perf:4784
>>>>=20
>>>> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>>>> [Defined PERF_REG_EXTENDED_MASK at run time to add support for =
different platforms ]
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>>>> ---
>>>=20
>>> Patch looks good to me.
>>>=20
>>> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
>>=20
>> Hi Arnaldo and Jiri,
>> 	 Please let me know if you have any comments on these patches. =
Can you pull/ack these
>> patches if they seems fine to you.
>=20
> Can you please clarify something here, I think I saw a kernel build =
bot
> complaint followed by a fix, in these cases I think, for reviewer's
> sake, that this would entail a v4 patchkit? One that has no such build
> issues?
>=20
> Or have I got something wrong?

Hi Arnaldo,

yes you are right, I will send version 4 as a new series with changes to =
add support for extended regs and including fix for the build issue.
Thanks for your response.

Athira=20

>=20
> - Arnaldo

