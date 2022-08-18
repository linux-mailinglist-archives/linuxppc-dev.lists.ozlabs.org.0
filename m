Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AD598317
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 14:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7kdJ4m2xz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 22:26:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQojlGTD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQojlGTD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7kcX3LDWz3bqT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 22:25:31 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27ICFgVK005148;
	Thu, 18 Aug 2022 12:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bBUtAJUoZNhGimQV8w6zRvR+wgmSvqiC/9eTqbWmPgE=;
 b=CQojlGTD7ga5JVDjY8Cr6a73b2iK5tVGEAjTFjinnWpqdp/sOdyrXh3R0PFt2XKU8fpH
 Y7LYVCR8gGFZfqKvExB5vw4PFDLqWFqyJUa7YRKN7EnWl9Kw6wlu8KJhn2Yui4Kw7WVW
 b+gk7KfX786vuBuczLrwMjKzvENBq6CuNSmliyRl1Wu/FRTvSWrfKazngtkZw9Zuzn3C
 osgGANjcPS2mYNCmnNPTtSvsg6PJ6TquJpv6fZGzj4gVXPsn8iCghQUSrw1GIavmjJM0
 AhdYrX9/uRrXMlAQufkkiGmReFzK+uSnIuwBmdJW4mDOnAWBCC2xjwWAmvHu6R7pSEjz HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1n9a097c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 12:25:12 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27ICFwqS005799;
	Thu, 18 Aug 2022 12:25:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1n9a096d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 12:25:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ICKdi8009339;
	Thu, 18 Aug 2022 12:25:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3hx37jdx0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 12:25:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27ICPPMq34537890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 12:25:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B304442041;
	Thu, 18 Aug 2022 12:25:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 377E24203F;
	Thu, 18 Aug 2022 12:25:06 +0000 (GMT)
Received: from localhost (unknown [9.43.73.112])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 12:25:06 +0000 (GMT)
Date: Thu, 18 Aug 2022 17:55:04 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 01/16] powerpc: Replace unreachable() with it's builtin
 variant in WARN_ON()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220808114908.240813-1-sv@linux.ibm.com>
	<20220808114908.240813-2-sv@linux.ibm.com>
	<82eec792-b71f-17cc-d905-368fd5ca62f2@csgroup.eu>
	<1660817468.4x4re2ul0k.naveen@linux.ibm.com>
	<06b7a93b-5148-4d92-0b56-5956afdfd3fb@csgroup.eu>
In-Reply-To: <06b7a93b-5148-4d92-0b56-5956afdfd3fb@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1660824799.vnjff6w3m0.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: snzh_C56VDGLhgv1qqH-oIUtyQqqipvb
X-Proofpoint-GUID: l8CYaXPg3IuQZ2UJotzNpNO1WmWyRP45
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180042
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 18/08/2022 =C3=A0 12:46, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>>
>>>
>>> Le 08/08/2022 =C3=A0 13:48, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>>>> objtool is throwing *unannotated intra-function call*
>>>> warnings with a few instructions that are marked
>>>> unreachable. Replace unreachable() with __builtin_unreachable()
>>>> to fix these warnings, as the codegen remains same
>>>> with unreachable() and __builtin_unreachable().
>>>
>>> I think it is necessary to explain why using unreachable() is not=20
>>> necessary for powerpc, or even why using unreachable() is wrong.
>>>
>>> Allthough we are getting rid of the problem here by replacing=20
>>> unreachable() by __builtin_unreachable(), it might still be a problem=20
>>> in core parts of kernel which still use unreachable.
>>=20
>> I did a kernel build with this series applied, with a variant of=20
>> ppc64le_defconfig. I then did another build with the same config, but=20
>> with the below hunk to disable objtool:
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 6be2e68fa9eb64..4c466acdc70d4c 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -237,8 +237,6 @@ config PPC
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_MOD_ARCH_SPECIFIC
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_NMI=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if PERF_EVENTS || (PPC6=
4=20
>> && PPC_BOOK3S)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_OPTPROBES
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_OBJTOOL=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if PPC32 || MPROFILE_KERNEL
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_OBJTOOL_MCOUNT=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 HAVE_OBJTOOL
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PERF_EVENTS
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PERF_EVENTS_NMI=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if PPC64
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_PERF_REGS
>>=20
>> This has the effect of disabling annotations for unreachable().
>>=20
>> When I compared the resulting object files, I did not see changes in=20
>> codegen relating to the annotation, like we do with using unreachable()=
=20
>> in __WARN_FLAGS().
>>=20
>> More specifically, arch/powerpc/kvm/book3s.o:kvmppc_h_logical_ci_load()=
=20
>> uses BUG(), and the generated code remains the same with/without the=20
>> unreachable() annotation.
>>=20
>> This suggests that the bad codegen we are seeing with the annotation in=
=20
>> unreachable() is limited to its use in __WARN_FLAGS(), which I suspect=20
>> is due to an interaction with the use of asm_volatile_goto() for=20
>> WARN_ENTRY().
>>=20
>> If I revert this patch (patch 01/16), gcc seems to add a label 8 bytes=20
>> before _some_ function in this object file, which happens to hold a=20
>> relocation against .TOC., and emits a bl to that symbol. Otherwise, gcc=
=20
>> either emits no new instruction for the annotation, or a 'nop' in some=20
>> cases.
>>=20
>> If I add a 'nop' between WARN_ENTRY() and unreachable() in=20
>> __WARN_FLAGS(), or convert WARN_ENTRY to BUG_ENTRY thereby removing use=
=20
>> of asm_volatile_goto(), the problem goes away and no bl is emitted:
>>=20
>> diff --git a/arch/powerpc/include/asm/bug.h=20
>> b/arch/powerpc/include/asm/bug.h
>> index 61a4736355c244..88e0027c20ba5c 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -99,6 +99,7 @@
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __label__ __label_warn_on;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ENTRY("twi 31, 0, 0", BUGFLAG=
_WARNING | (flags),=20
>> __label_warn_on); \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__("nop");=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unreachable();=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>> __label_warn_on:
>>=20
>>=20
>> In summary, I think the annotation itself is fine and we are only seeing=
=20
>> an issue with its usage after WARN_ENTRY() due to use of=20
>> asm_volatile_goto. Other uses of unreachable() don't seem to exhibit=20
>> this problem.
>>=20
>> As such, I think this patch is appropriate for this series, though I=20
>> think we should capture some of this information in the changelog.
>>=20
>> Note also that if and when we start utlizing the annotation, if we=20
>> classify twui as INSN_BUG, this change will continue to be appropriate.
>>=20
>=20
> INSN_TRAP instead of INSN_BUG ?

INSN_BUG, in line with your suggestion here:
http://lkml.kernel.org/r/ff623097-9f18-3914-5eae-bc6e4cd1510f@csgroup.eu

Peter was of the opinion that INSN_TRAP may not be what we want:
http://lkml.kernel.org/r/YsLSU6idNME/BtwH@hirez.programming.kicks-ass.net

If we classify twui as INSN_BUG, then objtool will know to stop control=20
flow here without the need for an annotation. Parsing extable will=20
then show that control flow continues with the label subsequently.


- Naveen
