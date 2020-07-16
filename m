Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFA222FB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 02:05:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7BGn3lR3zDqw1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:05:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tuliom@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B79Dt4L8NzDr6S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 09:19:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GN2r0f177405; Thu, 16 Jul 2020 19:18:36 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x6077m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 19:18:36 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GNBBQ8031579;
 Thu, 16 Jul 2020 23:18:34 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 327529cf4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 23:18:34 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GNIYpI53281202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 23:18:34 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4081DAE060;
 Thu, 16 Jul 2020 23:18:34 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 996E5AE05C;
 Thu, 16 Jul 2020 23:18:33 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.65.214.95])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 23:18:33 +0000 (GMT)
From: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v8 5/8] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
In-Reply-To: <20200715204725.Horde.5GZvsEv4ZkdzFHL76HZiFg8@messagerie.si.c-s.fr>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <2a67c333893454868bbfda773ba4b01c20272a5d.1588079622.git.christophe.leroy@c-s.fr>
 <878sflvbad.fsf@mpe.ellerman.id.au>
 <20200715204725.Horde.5GZvsEv4ZkdzFHL76HZiFg8@messagerie.si.c-s.fr>
User-Agent: Notmuch/0.29.1 (http://notmuchmail.org) Emacs/26.3
 (x86_64-redhat-linux-gnu)
Date: Thu, 16 Jul 2020 20:18:32 -0300
Message-ID: <87ft9rdp6f.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007160148
X-Mailman-Approved-At: Fri, 17 Jul 2020 10:01:20 +1000
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
Cc: linux-arch@vger.kernel.org, nathanl@linux.ibm.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org, 
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:
>
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>> Prepare for switching VDSO to generic C implementation in following
>>> patch. Here, we:
>>> - Modify __get_datapage() to take an offset
>>> - Prepare the helpers to call the C VDSO functions
>>> - Prepare the required callbacks for the C VDSO functions
>>> - Prepare the clocksource.h files to define VDSO_ARCH_CLOCKMODES
>>> - Add the C trampolines to the generic C VDSO functions
>>>
>>> powerpc is a bit special for VDSO as well as system calls in the
>>> way that it requires setting CR SO bit which cannot be done in C.
>>> Therefore, entry/exit needs to be performed in ASM.
>>>
>>> Implementing __arch_get_vdso_data() would clobber the link register,
>>> requiring the caller to save it. As the ASM calling function already
>>> has to set a stack frame and saves the link register before calling
>>> the C vdso function, retriving the vdso data pointer there is lighter.
>> ...
>>
>>> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h=20=20
>>> b/arch/powerpc/include/asm/vdso/gettimeofday.h
>>> new file mode 100644
>>> index 000000000000..4452897f9bd8
>>> --- /dev/null
>>> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
>>> @@ -0,0 +1,175 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef __ASM_VDSO_GETTIMEOFDAY_H
>>> +#define __ASM_VDSO_GETTIMEOFDAY_H
>>> +
>>> +#include <asm/ptrace.h>
>>> +
>>> +#ifdef __ASSEMBLY__
>>> +
>>> +.macro cvdso_call funct
>>> +  .cfi_startproc
>>> +	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
>>> +	mflr		r0
>>> +  .cfi_register lr, r0
>>> +	PPC_STL		r0, STACK_FRAME_OVERHEAD + PPC_LR_STKOFF(r1)
>>
>> This doesn't work for me on ppc64(le) with glibc.
>>
>> glibc doesn't create a stack frame before making the VDSO call, so the
>> store of r0 (LR) goes into the caller's frame, corrupting the saved LR,
>> leading to an infinite loop.
>
> Where should it be saved if it can't be saved in the standard location ?

As Michael pointed out, userspace doesn't treat the VDSO as a normal functi=
on
call.  In order to keep compatibility with existent software, LR would need=
 to
be saved on another stack frame.

--=20
Tulio Magno
