Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766738892B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 10:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQb90Z41z30C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 18:12:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PN69tes9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PN69tes9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQZd4PLtz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 18:12:08 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14J84lXh028738; Wed, 19 May 2021 04:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ug57BwwAf9S7sd1Ua49+ocOxt67uVpS3jC1PJNvDPQc=;
 b=PN69tes9TL2l43g0H2fHVvSNk8HxehO3eRp/qvQp+ubLgyM5sB1dau+SWYjgbVfLzroJ
 1iniMG7MAx/cwPhqVqzNYN9dzmJeITAV5HXlr0mgn1cgVTJ2unVrVQsV83Z4HDn/xSRb
 D+w5nT3x+dbyM4yIQWqY8g/BvHbKoPBpHPocts9EaQLTXxrPXqPa6N4bhOm/BtxT2yVy
 DjJF2mZrGNxsuQS5KKAiKI3RvYaInan+Ve3HaWxHMIOXnnIAjYIZryA2/mPJtRpN/XMF
 6S/Iwk4AfEH4DWHwbEI7rEdyQtRwQcZdQhqJ/s7IJhZAYaDlAY7YcpPYrVHf8VevIJlt ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mxscgbjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 04:11:46 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14J87FDT040518;
 Wed, 19 May 2021 04:11:46 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mxscgbh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 04:11:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14J88hbo001768;
 Wed, 19 May 2021 08:11:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh1346-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 08:11:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14J8BfqK27459986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 08:11:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76DC5A404D;
 Wed, 19 May 2021 08:11:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05FB8A4040;
 Wed, 19 May 2021 08:11:41 +0000 (GMT)
Received: from localhost (unknown [9.85.72.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 08:11:40 +0000 (GMT)
Date: Wed, 19 May 2021 13:41:38 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 27/30] powerpc/kprobes: Don't allow breakpoints on
 suffixes
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jordan Niethe
 <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-28-jniethe5@gmail.com>
 <cda38a1c-a78f-9eb5-8395-ce23caa2c81d@csgroup.eu>
In-Reply-To: <cda38a1c-a78f-9eb5-8395-ce23caa2c81d@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1621411610.rhqg7trx2p.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wHquQYYhZsF1wv66cPRt1MVgpURNiBeI
X-Proofpoint-ORIG-GUID: y5tRME6ZYUBvwXs5Q0yYOQtV42Yw-iwo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_02:2021-05-18,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=676 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190059
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 06/05/2020 =C3=A0 05:40, Jordan Niethe a =C3=A9crit=C2=A0:
>> Do not allow inserting breakpoints on the suffix of a prefix instruction
>> in kprobes.
>>=20
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>> v8: Add this back from v3
>> ---
>>   arch/powerpc/kernel/kprobes.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes=
.c
>> index 33d54b091c70..227510df8c55 100644
>> --- a/arch/powerpc/kernel/kprobes.c
>> +++ b/arch/powerpc/kernel/kprobes.c
>> @@ -106,7 +106,9 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name=
, unsigned int offset)
>>   int arch_prepare_kprobe(struct kprobe *p)
>>   {
>>   	int ret =3D 0;
>> +	struct kprobe *prev;
>>   	struct ppc_inst insn =3D ppc_inst_read((struct ppc_inst *)p->addr);
>> +	struct ppc_inst prefix =3D ppc_inst_read((struct ppc_inst *)(p->addr -=
 1));
>=20
> What if p->addr is the first word of a page and the previous page is=20
> not mapped ?

Good catch!
I think we can just skip validation if the instruction is at the=20
beginning of a page. I have a few cleanups in this area - I will post a=20
patchset soon.

>=20
>>  =20
>>   	if ((unsigned long)p->addr & 0x03) {
>>   		printk("Attempt to register kprobe at an unaligned address\n");
>> @@ -114,6 +116,17 @@ int arch_prepare_kprobe(struct kprobe *p)
>>   	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
>>   		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
>>   		ret =3D -EINVAL;
>> +	} else if (ppc_inst_prefixed(prefix)) {
>=20
> If p->addr - 2 contains a valid prefixed instruction, then p->addr - 1 co=
ntains the suffix of that=20
> prefixed instruction. Are we sure a suffix can never ever be misinterpret=
ed as the prefix of a=20
> prefixed instruction ?

Yes. Per the ISA:
  Bits 0:5 of all prefixes are assigned the primary opcode
  value 0b000001. 0b000001 is not available for use as a
  primary opcode for either word instructions or suffixes
  of prefixed instructions.


- Naveen

