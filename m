Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 856928CD55E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 16:06:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jo9GUH+p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlV921fMtz78pG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 23:57:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jo9GUH+p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlV8H0MHNz3vg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 23:56:30 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NDs9Cu009986;
	Thu, 23 May 2024 13:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=IiDcpBAtwCTauEs5A24TvczuaU3DEm7tWLmbfvMJP44=;
 b=Jo9GUH+pzRvzG41lqiBKWP4a2mXZ1n7xpfqm7DOFY+2CTH/Jbz5U1X9YfIa7G9Ni5FTl
 /PBxWRidk7Q+HNyxrn0IAFst+ZhZJNCLqQUgcuoX3BBnMBeBUuDtNlxPcOPguwVKkExx
 t4ncVrg3NLqu49zkXFBwi/WRLX1ylQMNLwA0JaP7s2vAuqd7FbG5wpV+bfPw3ghUk1lf
 3jKpo2+klEU7YQyVr1BTIYROJujdUstDxhxXTvkLZMyQRJWjtuV78lJlEVGg60O/DJ9x
 r4gcFAzvCO5xrxg/pJXVyAkO2koNie91eLjrVQzdobNA0/HY+xKbttVbbYdQe4kYr7pO sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ya73700cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:56:17 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44NDuHac013471;
	Thu, 23 May 2024 13:56:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ya73700ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:56:17 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NDpvd0022240;
	Thu, 23 May 2024 13:56:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y76nu2jgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:56:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NDuAsC13107528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 13:56:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC2442004B;
	Thu, 23 May 2024 13:56:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 275AC20049;
	Thu, 23 May 2024 13:56:08 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.97.166])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 May 2024 13:56:07 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH V2 7/9] tools/perf: Update instruction tracking with add
 instruction
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <7c8af115-56fb-4b1f-818c-f2a7d532166b@csgroup.eu>
Date: Thu, 23 May 2024 19:25:55 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <07BB6C89-D014-44EF-87A7-42A15C43EDD6@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-8-atrajeev@linux.vnet.ibm.com>
 <7c8af115-56fb-4b1f-818c-f2a7d532166b@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gRgaGV3KD953S74j9LgzaKHKTLDSHr2L
X-Proofpoint-GUID: 6dP_0A09OfUJccs6J35rocteLegzsgBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_08,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405230096
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
Cc: "irogers@google.com" <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "acme@kernel.org" <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 7 May 2024, at 3:28=E2=80=AFPM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 06/05/2024 =C3=A0 14:19, Athira Rajeev a =C3=A9crit :
>> Update instruction tracking with add instruction. Apart from "mr"
>> instruction, the register state is carried on by other insns, ie,
>> "add, addi, addis". Since these are not memory instructions and =
doesn't
>> fall in the range of (32 to 63), add these as part of nmemonic table.
>> For now, add* instructions are added. There is possibility of getting
>> more added here. But to extract regs, still the binary code will be
>> used. So associate this with "load_store_ops" itself and no other
>> changes required.
>=20
> Looks fragile.
>=20
> How do you handle addc, adde, addic ?
> And also addme, addze, which only have two operands instead of 3 ?

Hi Christophe,

Thanks for pointing these cases. Will address these cases in next =
version

Thanks
Athira
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>>  .../perf/arch/powerpc/annotate/instructions.c | 21 =
+++++++++++++++++++
>>  tools/perf/util/disasm.c                      |  1 +
>>  2 files changed, 22 insertions(+)
>>=20
>> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c =
b/tools/perf/arch/powerpc/annotate/instructions.c
>> index cce7023951fe..1f35d8a65bb4 100644
>> --- a/tools/perf/arch/powerpc/annotate/instructions.c
>> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
>> @@ -1,6 +1,17 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #include <linux/compiler.h>
>>=20
>> +/*
>> + * powerpc instruction nmemonic table to associate load/store =
instructions with
>> + * move_ops. mov_ops is used to identify add/mr to do instruction =
tracking.
>> + */
>> +static struct ins powerpc__instructions[] =3D {
>> + { .name =3D "mr",         .ops =3D &load_store_ops,  },
>> + { .name =3D "addi",       .ops =3D &load_store_ops,   },
>> + { .name =3D "addis",      .ops =3D &load_store_ops,  },
>> + { .name =3D "add",        .ops =3D &load_store_ops,  },
>> +};
>> +
>>  static struct ins_ops *powerpc__associate_instruction_ops(struct =
arch *arch, const char *name)
>>  {
>>   int i;
>> @@ -75,6 +86,9 @@ static void update_insn_state_powerpc(struct =
type_state *state,
>>   if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
>>   return;
>>=20
>> + if (!strncmp(dl->ins.name, "add", 3))
>> + goto regs_check;
>> +
>>   if (strncmp(dl->ins.name, "mr", 2))
>>   return;
>>=20
>> @@ -85,6 +99,7 @@ static void update_insn_state_powerpc(struct =
type_state *state,
>>   dst->reg1 =3D src_reg;
>>   }
>>=20
>> +regs_check:
>>   if (!has_reg_type(state, dst->reg1))
>>   return;
>>=20
>> @@ -115,6 +130,12 @@ static void update_insn_state_powerpc(struct =
type_state *state __maybe_unused, s
>>  static int powerpc__annotate_init(struct arch *arch, char *cpuid =
__maybe_unused)
>>  {
>>   if (!arch->initialized) {
>> + arch->nr_instructions =3D ARRAY_SIZE(powerpc__instructions);
>> + arch->instructions =3D calloc(arch->nr_instructions, sizeof(struct =
ins));
>> + if (!arch->instructions)
>> + return -ENOMEM;
>> + memcpy(arch->instructions, powerpc__instructions, sizeof(struct =
ins) * arch->nr_instructions);
>> + arch->nr_instructions_allocated =3D arch->nr_instructions;
>>   arch->initialized =3D true;
>>   arch->associate_instruction_ops =3D =
powerpc__associate_instruction_ops;
>>   arch->objdump.comment_char      =3D '#';
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index ac6b8b8da38a..32cf506a9010 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -36,6 +36,7 @@ static struct ins_ops mov_ops;
>>  static struct ins_ops nop_ops;
>>  static struct ins_ops lock_ops;
>>  static struct ins_ops ret_ops;
>> +static struct ins_ops load_store_ops;
>>=20
>>  static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
>>     struct ins_operands *ops, int max_ins_name);

