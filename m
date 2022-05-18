Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E209E52BFDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 19:04:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3K9766Pvz3c9R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 03:04:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XRhX0opI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XRhX0opI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3K8N4YZfz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 03:04:03 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IGhldX027678;
 Wed, 18 May 2022 17:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6LkEKSKYnLd9+NeeMKKztUmSNBhimo1u40eTF6WU5hk=;
 b=XRhX0opITUhYlW2jcrqI3yNVggeDj9jzJyMK3sVNiAAbq8Pc228RnA6qiNtBiA1nUjVx
 qZ0H1C7K6Cfn5WwCO1JRg8oKoEg/dyX98LviKR/g+YfTkOVUdgD7pz+zCCxOiXh5yDX/
 86reXHWVcrBFuGtyNQyjAwaQA/IwdIVA5tz6Uc73DnwWLS6XxuvnCAKpQ9Ta1J5PfirL
 Q9UZO+9k5GL2b3cATxjulLxL/+P/QXrtSBvwiDywEl+3tfQ1aYz48FEvdN3HYfYJDFei
 hqukfjeae956jqWZk5/vNNiaGVk8fZnrnSvD2V5UA0BAvAtdLAcqr+6P85Ncg3R6JcD0 JQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g54jrgedb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 17:03:53 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IH32dK031811;
 Wed, 18 May 2022 17:03:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3g2428mv9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 17:03:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24IH3Ds824576388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 17:03:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0068B11C04C;
 Wed, 18 May 2022 17:03:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 892A511C04A;
 Wed, 18 May 2022 17:03:48 +0000 (GMT)
Received: from localhost (unknown [9.43.19.36])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 17:03:48 +0000 (GMT)
Date: Wed, 18 May 2022 22:33:46 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au> <87ilq3nj2s.fsf@mpe.ellerman.id.au>
 <a7e47e3d-9b2b-ee12-d38c-3e6bbba83f7d@csgroup.eu>
In-Reply-To: <a7e47e3d-9b2b-ee12-d38c-3e6bbba83f7d@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652893170.ef56yw5h6t.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2Lw9lBGYPmdAMOKq1LZlAJM__mQ2ej4a
X-Proofpoint-ORIG-GUID: 2Lw9lBGYPmdAMOKq1LZlAJM__mQ2ej4a
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205180101
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 18/05/2022 =C3=A0 14:03, Michael Ellerman a =C3=A9crit=C2=A0:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>>> Christophe Leroy wrote:
>>>>> A lot of #ifdefs can be replaced by IS_ENABLED()
>>>>>
>>>>> Do so.
>>>>>
>>>>> This requires to have kernel_toc_addr() defined at all time
>>>>> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> ---
>>>>> v2: Moved the setup of pop outside of the big if()/else() in __ftrace=
_make_nop()
>>>>> ---
>>>>>   arch/powerpc/include/asm/code-patching.h |   2 -
>>>>>   arch/powerpc/include/asm/module.h        |   2 -
>>>>>   arch/powerpc/include/asm/sections.h      |  24 +--
>>>>>   arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++---------=
---
>>>>>   4 files changed, 103 insertions(+), 107 deletions(-)
>>>>>
>>>>
>>>> <snip>
>>>>
>>>>> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>>>>>
>>>>>   #ifdef CONFIG_PPC64
>>>>>   #define PACATOC offsetof(struct paca_struct, kernel_toc)
>>>>> +#else
>>>>> +#define PACATOC 0
>>>>> +#endif
>>>>
>>>> This conflicts with my fix for the ftrace init tramp:
>>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422=
.463738-1-naveen.n.rao@linux.vnet.ibm.com/
>>>>
>>>> It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can
>>>> get rid of the PACATOC. Here is an incremental diff:
>>>
>>> Where is the incremental diff meant to apply?
>>>
>>> It doesn't apply on top of patch 19, or at the end of the series.

Ugh, sorry. I had an additional patch that converts those=20
ftrace_[regs_]_caller uses to FTRACE_REGS_ADDR, which prevented one of=20
the hunks from applying.

>>=20
>> I think I worked out what you meant.
>>=20
>> Can you check what's in next-test:
>>=20
>>    https://github.com/linuxppc/linux/commits/next-test
>=20
> Yes that looks fine.

+1

>=20
> As Naveen mentioned we can also get rid of PACATOC completely and use=20
> offsetof(struct paca_struct, kernel_toc) directly at the only place=20
> PACATOC is used.

Yes, or we can send it out as a separate cleanup.


Thanks,
Naveen

