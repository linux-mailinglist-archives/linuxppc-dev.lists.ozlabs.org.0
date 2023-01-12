Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0BD667C7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 18:26:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtBKl6Rf9z3ch8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 04:26:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cJ8bCGFx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cJ8bCGFx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtBJm1yhDz3bVs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 04:25:27 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CGc9Us004190
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 17:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dzyz6EpouiJ7ImSRkEQsXKB19nIFIFdjdrsdoHoMxBs=;
 b=cJ8bCGFxGPA1AIW/9YPcldmNham3OTmfBrRxyHSbJNhxjqE3vCZzqzyMc+HVZc5b+JRK
 1Q3kAo+P9dw33CIDwAZqKgJCwqOSKZQO7fzK8SQkVeuuSFy9tRKjTM0qPjQPi/e1Vn2/
 vCzmebmPE2yQYTnrA3flk4yWv1FW/IBWcMPfxxoyPDznsbeUeidVQAFn+abxz6T1uJsB
 t0XtCjU4LPTMxAGrHq+z4+yat8M44WASLmKJYtfhA1UqF1v2gRV9BqTE5m/T+2niFCCa
 Zzf1+qZQfPam27apGuwljnzmB+RMO9a2yDZSL9d+urWrTeZrBF1zHiKMQuPLeOZvL+ID TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2n7ja8kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 17:25:25 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30CGv8gI016738
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 17:25:24 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2n7ja8jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 17:25:24 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30CETgNq018917;
	Thu, 12 Jan 2023 17:25:23 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3n1knv2gqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 17:25:23 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30CHPLI764684408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jan 2023 17:25:22 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3CD958045;
	Thu, 12 Jan 2023 17:25:21 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3DD158054;
	Thu, 12 Jan 2023 17:25:21 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Jan 2023 17:25:21 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: upgrade internal arch spinlocks
In-Reply-To: <3c4f68a0-b1f9-d456-ab12-9ea75263d94c@linux.ibm.com>
References: <20230110044255.122616-1-nathanl@linux.ibm.com>
 <3c4f68a0-b1f9-d456-ab12-9ea75263d94c@linux.ibm.com>
Date: Thu, 12 Jan 2023 11:25:21 -0600
Message-ID: <87zganpsvy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vfFlgedPBz9RuVtQ5mYkcHyB_NcnJClV
X-Proofpoint-ORIG-GUID: J2PtFj3aHQJBX3N0CYlj4PKVL9Tl5DgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=960 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301120124
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> On 10/01/2023 05:42:55, Nathan Lynch wrote:
>> --- a/arch/powerpc/include/asm/rtas-types.h
>> +++ b/arch/powerpc/include/asm/rtas-types.h
>> @@ -18,7 +18,7 @@ struct rtas_t {
>>  	unsigned long entry;		/* physical address pointer */
>>  	unsigned long base;		/* physical address pointer */
>>  	unsigned long size;
>> -	arch_spinlock_t lock;
>> +	raw_spinlock_t lock;
>>  	struct rtas_args args;
>>  	struct device_node *dev;	/* virtual address pointer */
>>  };
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index deded51a7978..a834726f18e3 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -61,7 +61,7 @@ static inline void do_enter_rtas(unsigned long args)
>>  }
>>  
>>  struct rtas_t rtas = {
>> -	.lock = __ARCH_SPIN_LOCK_UNLOCKED
>> +	.lock = __RAW_SPIN_LOCK_UNLOCKED(rtas.lock),
>>  };
>>  EXPORT_SYMBOL(rtas);
>
> This is not the scope of this patch, but the RTAS's lock is externalized
> through the structure rtas_t, while it is only used in that file.
>
> I think, this would be good, in case of future change about that lock, and
> in order to not break KABI, to move it out of that structure, and to define
> it statically in that file.

Thanks for pointing this out.

/* rtas-types.h */
struct rtas_t {
	unsigned long entry;		/* physical address pointer */
	unsigned long base;		/* physical address pointer */
	unsigned long size;
	raw_spinlock_t lock;
	struct rtas_args args;
	struct device_node *dev;	/* virtual address pointer */
};

/* rtas.h */
extern struct rtas_t rtas;

There's C and asm code outside of rtas.c that accesses rtas.entry,
rtas.base, rtas.size, and rtas.dev. But as you say, rtas.lock is used
only in rtas.c, and it's hard to imagine any legitimate external
use. This applies to the args member as well, since accesses must occur
under the lock.

Making the lock and args private to rtas.c seems desirable on its own,
so I think that should be done first as a cleanup, followed by the
riskier arch -> raw lock conversion.

I'll tentatively plan on doing that for a v2, pending further comments.
