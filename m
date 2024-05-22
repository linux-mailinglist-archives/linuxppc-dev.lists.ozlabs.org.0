Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB978CC2EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 16:16:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMuU4M4R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VktRt1yjfz78nl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 00:07:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMuU4M4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VktR70Fhdz3gCw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 00:07:14 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MDoYoR007819;
	Wed, 22 May 2024 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=5L0tNJXrkwy2gT5t3Wi4jHX60IZkSkV5acnPBF1ahQs=;
 b=lMuU4M4RczDde1LYaDz4wOGMlUSO9l3qMPbQLU1p4tQQTX867C0L++N4WvCU94Pln1/h
 t8l/ad6ySZCN1dPuEX0BnJRdnwSaLNtnskZheIbxRjQdmTirEi2Xgv4is/pRgUK7cUi5
 xwpwfI738FwxhnOfzNyw2W6rhyaPRosBtE3yinzJY+PouoYHHsCg+RMLr+IszyqMwGc1
 pXXo3FU+VBuOoNeiUZ9MS4Gc6hVBv+DUrVTuiD1GH3Icr4VCrQYSgr9mTWvimNsEHGTV
 YOw4ZtMpglMr382xXSN52JOSJI4qrkOtyvCCgnL8BBt3fN1Ic0nY20WW2boI+jP481t9 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9hxm01ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 14:07:00 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44ME70A3002069;
	Wed, 22 May 2024 14:07:00 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9hxm01um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 14:07:00 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MC7JJY008226;
	Wed, 22 May 2024 14:06:59 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y78vm3x91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 14:06:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44ME6r8V30212792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 14:06:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9919320043;
	Wed, 22 May 2024 14:06:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EA5320040;
	Wed, 22 May 2024 14:06:51 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.69.167])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 May 2024 14:06:50 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH V2 5/9] tools/perf: Update parameters for reg extract
 functions to use raw instruction on powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <dd7ea638-8a97-4ad1-9e56-5e444bad9252@csgroup.eu>
Date: Wed, 22 May 2024 19:36:38 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B0117C35-9599-4C86-AC03-5D6B4CCAC1F6@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-6-atrajeev@linux.vnet.ibm.com>
 <dd7ea638-8a97-4ad1-9e56-5e444bad9252@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pxPfNU_L5_ulcuL4UQvKZoCSzc05XEzC
X-Proofpoint-ORIG-GUID: ujt3SqiMH9AucnqY7P2pA9e5VgKNorvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_07,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405220094
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



> On 7 May 2024, at 3:18=E2=80=AFPM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 06/05/2024 =C3=A0 14:19, Athira Rajeev a =C3=A9crit :
>> Use the raw instruction code and macros to identify memory =
instructions,
>> extract register fields and also offset. The implementation addresses
>> the D-form, X-form, DS-form instructions. Two main functions are =
added.
>> New parse function "load_store__parse" as instruction ops parser for
>> memory instructions. Unlink other parser (like mov__parse), this =
parser
>> fills in only the "raw" field for source/target and new added =
"mem_ref"
>> field. This is because, here there is no need to parse the =
disassembled
>> code and arch specific macros will take care of extracting offset and
>> regs which is easier and will be precise.
>>=20
>> In powerpc, all instructions with a primary opcode from 32 to 63
>> are memory instructions. Update "ins__find" function to have "opcode"
>> also as a parameter. Don't use the "extract_reg_offset", instead use
>> newly added function "get_arch_regs" which will set these fields: =
reg1,
>> reg2, offset depending of where it is source or target ops.
>=20
> Yes all instructions with a primary opcode from 32 to 63 are memory=20
> instructions, but not all memory instructions have opcode 32 to 63.
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>>  tools/perf/arch/powerpc/util/dwarf-regs.c | 33 +++++++++++++
>>  tools/perf/util/annotate.c                | 22 ++++++++-
>>  tools/perf/util/disasm.c                  | 59 =
+++++++++++++++++++++--
>>  tools/perf/util/disasm.h                  |  4 +-
>>  tools/perf/util/include/dwarf-regs.h      |  4 +-
>>  5 files changed, 114 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c =
b/tools/perf/arch/powerpc/util/dwarf-regs.c
>> index e60a71fd846e..3121c70dc0d3 100644
>> --- a/tools/perf/arch/powerpc/util/dwarf-regs.c
>> +++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
>> @@ -102,6 +102,9 @@ int regs_query_register_offset(const char *name)
>>  #define PPC_OP(op) (((op) >> 26) & 0x3F)
>>  #define PPC_RA(a) (((a) >> 16) & 0x1f)
>>  #define PPC_RT(t) (((t) >> 21) & 0x1f)
>> +#define PPC_RB(b) (((b) >> 11) & 0x1f)
>> +#define PPC_D(D) ((D) & 0xfffe)
>> +#define PPC_DS(DS) ((DS) & 0xfffc)
>>=20
>>  int get_opcode_insn(unsigned int raw_insn)
>>  {
>> @@ -117,3 +120,33 @@ int get_target_reg(unsigned int raw_insn)
>>  {
>>   return PPC_RT(raw_insn);
>>  }
>> +
>> +int get_offset_opcode(int raw_insn __maybe_unused)
>> +{
>> + int opcode =3D PPC_OP(raw_insn);
>> +
>> + /* DS- form */
>> + if ((opcode =3D=3D 58) || (opcode =3D=3D 62))
>=20
> Can you re-use macros from arch/powerpc/include/asm/ppc-opcode.h ?
>=20
> #define OP_LD 58
> #define OP_STD 62

Hi Christophe

Sure, I will make these changes

>=20
>=20
>> + return PPC_DS(raw_insn);
>> + else
>> + return PPC_D(raw_insn);
>> +}
>> +
>> +/*
>> + * Fills the required fields for op_loc depending on if it
>> + * is a source of target.
>> + * D form: ins RT,D(RA) -> src_reg1 =3D RA, offset =3D D, dst_reg1 =3D=
 RT
>> + * DS form: ins RT,DS(RA) -> src_reg1 =3D RA, offset =3D DS, =
dst_reg1 =3D RT
>> + * X form: ins RT,RA,RB -> src_reg1 =3D RA, src_reg2 =3D RB, =
dst_reg1 =3D RT
>> + */
>> +void get_arch_regs(int raw_insn __maybe_unused, int is_source =
__maybe_unused, struct annotated_op_loc *op_loc __maybe_unused)
>> +{
>> + if (is_source)
>> + op_loc->reg1 =3D get_source_reg(raw_insn);
>> + else
>> + op_loc->reg1 =3D get_target_reg(raw_insn);
>> + if (op_loc->multi_regs)
>> + op_loc->reg2 =3D PPC_RB(raw_insn);
>> + if (op_loc->mem_ref)
>> + op_loc->offset =3D get_offset_opcode(raw_insn);
>> +}
>=20
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index 85692f73e78f..f41a0fadeab4 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -760,11 +800,20 @@ static void ins__sort(struct arch *arch)
>>   qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
>>  }
>>=20
>> -static struct ins_ops *__ins__find(struct arch *arch, const char =
*name)
>> +static struct ins_ops *__ins__find(struct arch *arch, const char =
*name, int opcode)
>>  {
>>   struct ins *ins;
>>   const int nmemb =3D arch->nr_instructions;
>>=20
>> + if (arch__is(arch, "powerpc")) {
>> + /*
>> +  * Instructions with a primary opcode from 32 to 63
>> +  * are memory instructions in powerpc.
>> +  */
>> + if ((opcode >=3D 31) && (opcode <=3D 63))
>=20
> Could just be if ((opcode & 0x20)) I guess.
Ok,,=20
>=20
> By the way your test is wrong because opcode 31 is not only memory=20
> instructions, see example below (not exhaustive):
>=20
> #define OP_31_XOP_TRAP      4 =3D=3D> No
> #define OP_31_XOP_LDX       21 =3D=3D> Yes
> #define OP_31_XOP_LWZX      23 =3D=3D> Yes
> #define OP_31_XOP_LDUX      53 =3D=3D> Yes
> #define OP_31_XOP_DCBST     54 =3D=3D> No
> #define OP_31_XOP_LWZUX     55 =3D=3D> Yes
> #define OP_31_XOP_TRAP_64   68 =3D=3D> No
> #define OP_31_XOP_DCBF      86 =3D=3D> No
> #define OP_31_XOP_LBZX      87 =3D=3D> Yes
> #define OP_31_XOP_STDX      149 =3D=3D> Yes
> #define OP_31_XOP_STWX      151 =3D=3D> Yes

Thanks for pointing this. I checked through others in this list in =
arch/powerpc/include/asm/ppc-opcode.h=20
I will have these filtered in V3

Thanks
Athira
>=20
>=20
>=20
>=20
>> + return &load_store_ops;
>> + }
>> +
>>   if (!arch->sorted_instructions) {
>>   ins__sort(arch);
>>   arch->sorted_instructions =3D true;


