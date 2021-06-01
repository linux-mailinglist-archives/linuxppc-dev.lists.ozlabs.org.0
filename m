Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B539707F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 11:41:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvRxK6MkLz308c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 19:41:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RptHl9sO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RptHl9sO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvRwq5kKSz2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 19:40:43 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1519WiXH170898; Tue, 1 Jun 2021 05:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=HS7GLo4YPRH9AQ/D6Y/8pCOpDeDKHLzs46UL2AE4h3g=;
 b=RptHl9sO1biR+I6gm3QMJdyMAXDVaaIuNdm2ZHCwoJFMZsS6kP4lIqs5Vrt19rosQV++
 XF7uoZ1QU3sOQn+lWRyB92JEkghpQMRQkOMkvblr7UcwzoD7LOlrGsBb73+NI0N4VynO
 OepZeLevFKewRoBEOXrBxKjgwhhEEsp4L5q+XqlmR+SuBw6cvDWclzcZnwBjqbBiFGrp
 TY2Zy7gkMRRaMQwOm8dLPaWmvddAJGQ/wWBBPupZ17Dsbrwj/0c5lCnKeIkKsIClPbYs
 UR3stzdTj5ImoNAFQhAejvQeGt+YFZDfEougxRF9LNlHKuUMrpyfnv8PXzb4pwaGPELF VQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38whnn1ddu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 05:40:29 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1519cSNJ011666;
 Tue, 1 Jun 2021 09:40:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 38ud880v2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 09:40:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1519dri133882440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 09:39:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D4944C044;
 Tue,  1 Jun 2021 09:40:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F332B4C04E;
 Tue,  1 Jun 2021 09:40:24 +0000 (GMT)
Received: from localhost (unknown [9.85.73.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 09:40:24 +0000 (GMT)
Date: Tue, 01 Jun 2021 15:10:23 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc: make show_stack's stack walking KASAN-safe
To: christophe.leroy@csgroup.eu, Daniel Axtens <dja@axtens.net>,
 kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
References: <20210528074806.1311297-1-dja@axtens.net>
In-Reply-To: <20210528074806.1311297-1-dja@axtens.net>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1622539981.k2ctwb25pa.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vaCDV2d8Q2KLE_33lWuk3O89PWR4ogFg
X-Proofpoint-GUID: vaCDV2d8Q2KLE_33lWuk3O89PWR4ogFg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_05:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010064
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

Daniel Axtens wrote:
> Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
> generic code, arm64, s390 and x86 all do this for similar sorts of
> reasons: when unwinding a stack, we might touch memory that KASAN has
> marked as being out-of-bounds. In ppc64 KASAN development, I hit this
> sometimes when checking for an exception frame - because we're checking
> an arbitrary offset into the stack frame.
>=20
> See commit 20955746320e ("s390/kasan: avoid false positives during stack
> unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
> frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
> Prevent KASAN false positive warnings") and commit 6e22c8366416
> ("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer").
>=20
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  arch/powerpc/kernel/process.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 89e34aa273e2..430cf06f9406 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2151,8 +2151,8 @@ void show_stack(struct task_struct *tsk, unsigned l=
ong *stack,
>  			break;
> =20
>  		stack =3D (unsigned long *) sp;
> -		newsp =3D stack[0];
> -		ip =3D stack[STACK_FRAME_LR_SAVE];
> +		newsp =3D READ_ONCE_NOCHECK(stack[0]);
> +		ip =3D READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);

Just curious:
Given that we validate the stack pointer before these accesses, can we=20
annotate show_stack() with __no_sanitize_address instead?

I ask because we have other places where we walk the stack:=20
arch_stack_walk(), as well as in perf callchain. Similar changes will be=20
needed there as well.


- Naveen

