Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C66BB54E20D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 15:35:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP38G5Qkcz3bc1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:35:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MswqvgIq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MswqvgIq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP37Z0NYHz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 23:34:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GCo587027730;
	Thu, 16 Jun 2022 13:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IulxYcsx0iwN8OHlW6oFj00wwDoRXItaahD1rcD2FKc=;
 b=MswqvgIqVMQ4u1bJpkZ71G4VEXRwbyWSDlOHFD/lB383GAo1FOxfFyB17OPICpUTdgUi
 12oAMwaLIattrVsD2FJt43c3q8erOi5sWk/Lp2rJQM+Zgm9GRSeYs8Z33Ak4wzK6p61W
 pXUUYOo6hRYc5IxMtojVTspl7P2e5ziHwAffufnJ+CkYHVdrmy5bL06prS1Wa8gJQ8ii
 9ssNBWX5QKa8s3M9wFwX5CsyKFNacXYxEP4uQPMJERuqp54d2StSMa/qiZijfVDBwBt2
 s1PwOVTX6KbINi7io7AfamtmJXo4UR07aZzGxr45WBG8JRm0BsYdtLmNEmAS5TuqBP72 mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gr10jqcjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 13:34:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25GDJv3U032099;
	Thu, 16 Jun 2022 13:34:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gr10jqchf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 13:34:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25GDL9lo018694;
	Thu, 16 Jun 2022 13:34:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gmjp97cqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 13:34:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25GDYQHn25362716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 13:34:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B1BD5204E;
	Thu, 16 Jun 2022 13:34:22 +0000 (GMT)
Received: from localhost (unknown [9.43.10.226])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DBE2552057;
	Thu, 16 Jun 2022 13:34:21 +0000 (GMT)
Date: Thu, 16 Jun 2022 19:04:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy
	<sv@linux.vnet.ibm.com>
References: <20220523175548.922671-1-sv@linux.ibm.com>
	<20220523175548.922671-5-sv@linux.ibm.com>
	<6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
	<59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
	<578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
	<f1decbb7-b441-a241-469a-4ba118e08212@csgroup.eu>
	<c1e2cf35-2a8d-87e6-3a7e-7f144392db23@csgroup.eu>
In-Reply-To: <c1e2cf35-2a8d-87e6-3a7e-7f144392db23@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1655386289.uh0k7sgl1r.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qYbCiW09CX-0KwKNKphBqva8saJplVzH
X-Proofpoint-GUID: VIl9276N7pQO2vMKcpUNKZ2L1qLv9ARk
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_08,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=736 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160056
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, Chen Zhongjin <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 25/05/2022 =C3=A0 19:27, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 24/05/2022 =C3=A0 15:33, Christophe Leroy a =C3=A9crit=C2=A0:
>>>
>>>
>>> Le 24/05/2022 =C3=A0 13:00, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>>>>>
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 switch (elf->ehdr.e_machine) {
>>>>>> +=C2=A0=C2=A0=C2=A0 case EM_X86_64:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return R_X86_64_64;
>>>>>> +=C2=A0=C2=A0=C2=A0 case EM_PPC64:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return R_PPC64_ADDR64;
>>>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
WARN("unknown machine...");
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
exit(-1);
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +}
>>>>> Wouldn't it be better to make that function arch specific ?
>>>>
>>>> This is so that we can support cross architecture builds.
>>>>
>>>
>>>
>>> I'm not sure I follow you here.
>>>
>>> This is only based on the target, it doesn't depend on the build host so
>>> I can't the link with cross arch builds.
>>>
>>> The same as you have arch_decode_instruction(), you could have
>>> arch_elf_reloc_type_long()
>>> It would make sense indeed, because there is no point in supporting X86
>>> relocation when you don't support X86 instruction decoding.
>>>
>>=20
>> Could simply be some macro defined in=20
>> tools/objtool/arch/powerpc/include/arch/elf.h and=20
>> tools/objtool/arch/x86/include/arch/elf.h
>>=20
>> The x86 version would be:
>>=20
>> #define R_ADDR(elf) R_X86_64_64
>>=20
>> And the powerpc version would be:
>>=20
>> #define R_ADDR(elf) (elf->ehdr.e_machine =3D=3D EM_PPC64 ? R_PPC64_ADDR6=
4 :=20
>> R_PPC_ADDR32)
>>=20
>=20
> Well, looking once more, and taking into account the patch from Chen=20
> https://lore.kernel.org/lkml/20220531020744.236970-4-chenzhongjin@huawei.=
com/
>=20
> It would be easier to just define two macros:
>=20
> #define R_ABS64 R_PPC64_ADDR64
> #define R_ABS32 R_PPC_ADDR32
>=20
> And then in the caller, as we know the size, do something like
>=20
> 	size =3D=3D sizeof(u64) ? R_ABS64 : R_ABS32;

How does 'sizeof(u64)' work here?


- Naveen

