Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCB9303F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 08:03:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JqrwByuW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLdDb18S0z3cXs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 16:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JqrwByuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLdCt58LFz30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2024 16:02:32 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46D5uBe2007618;
	Sat, 13 Jul 2024 06:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=1
	owsm3Nc96HFbnopOKzr0f9v0OtnRxlY0y5cAZ8kBjg=; b=JqrwByuW2DGOZphnz
	hYxsWNi4MZZcWjQodZvC4mhp5YH9vjqUSHcvo/biXNAnMRFC2c0wawUCUa4qX3hZ
	R/4USIV2ePSMcHPo5LNBqag6qWVaotfivm+bk/nOuSAK5KZ9JR6opVSNQxFK9jzq
	4YX/YajCCarl5Oxf8OeUDcTLRgm6jmOJp7+tO5DWjMxXljiKRbzOMHMT7rZLQFre
	45Eupn3CHOPbXh36JZfHht2vsVzvNvmAZQavz/vHYaybPdRaB404a8v4GQlUUTZh
	Rf/D3swwhzpcmaoQ/XQFW71lUcsTtwE8V8Sj2yNPWl+lISQFsxGRzqmOKOF9f+Lw
	1QeLw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40bfgr0aqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 06:02:12 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46D62B1m017649;
	Sat, 13 Jul 2024 06:02:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40bfgr0aqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 06:02:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46D1ZTTh024680;
	Sat, 13 Jul 2024 06:02:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 407g8uth8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 06:02:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46D625Ni54067622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 06:02:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FAD920040;
	Sat, 13 Jul 2024 06:02:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AD6620049;
	Sat, 13 Jul 2024 06:02:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.47.252])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 13 Jul 2024 06:02:01 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V6 18/18] tools/perf: Set instruction name to be used with
 insn-stat when using raw instruction
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZpGfvwxGh1ud6SeP@google.com>
Date: Sat, 13 Jul 2024 11:31:48 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABD8FBC0-149E-4C85-BC4A-244347D63A2B@linux.vnet.ibm.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
 <20240707144419.92510-19-atrajeev@linux.vnet.ibm.com>
 <ZpGfvwxGh1ud6SeP@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Cu7UL6rTTC2Xwbxjbx0dixDec5RkIRK
X-Proofpoint-ORIG-GUID: nm7Tgq7GlPWlhHpAOzumOgqHbHrfXrUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_02,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407130041
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13 Jul 2024, at 2:57=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Sun, Jul 07, 2024 at 08:14:19PM +0530, Athira Rajeev wrote:
>> Since the "ins.name" is not set while using raw instruction,
>> perf annotate with insn-stat gives wrong data:
>>=20
>> Result from "./perf annotate --data-type --insn-stat":
>>=20
>> Annotate Instruction stats
>> total 615, ok 419 (68.1%), bad 196 (31.9%)
>>=20
>>  Name      :  Good   Bad
>> -----------------------------------------------------------
>>            :   419   196
>>=20
>> Patch sets "dl->ins.name" in arch specific function "check_ppc_insn"
>> while initialising "struct disasm_line". Also update "ins_find" =
function
>> to pass "struct disasm_line" as a parameter so as to set its name =
field
>> in arch specific call.
>>=20
>> With the patch changes:
>>=20
>> Annotate Instruction stats
>> total 609, ok 446 (73.2%), bad 163 (26.8%)
>>=20
>>  Name/opcode:  Good   Bad
>> -----------------------------------------------------------
>>  58                  :   323    80
>>  32                  :    49    43
>>  34                  :    33    11
>>  OP_31_XOP_LDX       :     8    20
>>  40                  :    23     0
>>  OP_31_XOP_LWARX     :     5     1
>>  OP_31_XOP_LWZX      :     2     3
>>  OP_31_XOP_LDARX     :     3     0
>>  33                  :     0     2
>>  OP_31_XOP_LBZX      :     0     1
>>  OP_31_XOP_LWAX      :     0     1
>>  OP_31_XOP_LHZX      :     0     1
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> .../perf/arch/powerpc/annotate/instructions.c  | 18 =
+++++++++++++++---
>> tools/perf/builtin-annotate.c                  |  4 ++--
>> tools/perf/util/annotate.c                     |  2 +-
>> tools/perf/util/disasm.c                       | 10 +++++-----
>> tools/perf/util/disasm.h                       |  2 +-
>> 5 files changed, 24 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c =
b/tools/perf/arch/powerpc/annotate/instructions.c
>> index af1032572bf3..ede9eeade0ab 100644
>> --- a/tools/perf/arch/powerpc/annotate/instructions.c
>> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
>> @@ -189,8 +189,9 @@ static int cmp_offset(const void *a, const void =
*b)
>> return (val1->value - val2->value);
>> }
>>=20
>> -static struct ins_ops *check_ppc_insn(u32 raw_insn)
>> +static struct ins_ops *check_ppc_insn(struct disasm_line *dl)
>> {
>> + int raw_insn =3D dl->raw.raw_insn;
>> int opcode =3D PPC_OP(raw_insn);
>> int mem_insn_31 =3D PPC_21_30(raw_insn);
>> struct insn_offset *ret;
>> @@ -198,19 +199,30 @@ static struct ins_ops *check_ppc_insn(u32 =
raw_insn)
>> "OP_31_INSN",
>> mem_insn_31
>> };
>> + char name_insn[32];
>>=20
>> /*
>>  * Instructions with opcode 32 to 63 are memory
>>  * instructions in powerpc
>>  */
>> if ((opcode & 0x20)) {
>> + /*
>> +  * Set name in case of raw instruction to
>> +  * opcode to be used in insn-stat
>> +  */
>> + if (!strlen(dl->ins.name)) {
>> + sprintf(name_insn, "%d", opcode);
>> + dl->ins.name =3D strdup(name_insn);
>> + }
>> return &load_store_ops;
>> } else if (opcode =3D=3D 31) {
>> /* Check for memory instructions with opcode 31 */
>> ret =3D bsearch(&mem_insns_31_opcode, ins_array, =
ARRAY_SIZE(ins_array), sizeof(ins_array[0]), cmp_offset);
>> - if (ret !=3D NULL)
>> + if (ret) {
>> + if (!strlen(dl->ins.name))
>> + dl->ins.name =3D strdup(ret->name);
>> return &load_store_ops;
>> - else {
>> + } else {
>> mem_insns_31_opcode.value =3D PPC_22_30(raw_insn);
>> ret =3D bsearch(&mem_insns_31_opcode, arithmetic_ins_op_31, =
ARRAY_SIZE(arithmetic_ins_op_31),
>> sizeof(arithmetic_ins_op_31[0]), cmp_offset);
>> diff --git a/tools/perf/builtin-annotate.c =
b/tools/perf/builtin-annotate.c
>> index b10b7f005658..68e929d4746e 100644
>> --- a/tools/perf/builtin-annotate.c
>> +++ b/tools/perf/builtin-annotate.c
>> @@ -396,10 +396,10 @@ static void print_annotate_item_stat(struct =
list_head *head, const char *title)
>> printf("total %d, ok %d (%.1f%%), bad %d (%.1f%%)\n\n", total,
>>        total_good, 100.0 * total_good / (total ?: 1),
>>        total_bad, 100.0 * total_bad / (total ?: 1));
>> - printf("  %-10s: %5s %5s\n", "Name", "Good", "Bad");
>> + printf("  %-10s: %5s %5s\n", "Name/opcode", "Good", "Bad");
>=20
> It should be "%-20s".
>=20
> Thanks,
> Namhyung

Sure, will make this change

Thanks
Athira
>=20
>=20
>> =
printf("-----------------------------------------------------------\n");
>> list_for_each_entry(istat, head, list)
>> - printf("  %-10s: %5d %5d\n", istat->name, istat->good, istat->bad);
>> + printf("  %-20s: %5d %5d\n", istat->name, istat->good, istat->bad);
>> printf("\n");
>> }
>>=20
>> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
>> index 8db2f32700aa..e1f24dff8042 100644
>> --- a/tools/perf/util/annotate.c
>> +++ b/tools/perf/util/annotate.c
>> @@ -2229,7 +2229,7 @@ static struct annotated_item_stat =
*annotate_data_stat(struct list_head *head,
>> return NULL;
>>=20
>> istat->name =3D strdup(name);
>> - if (istat->name =3D=3D NULL) {
>> + if ((istat->name =3D=3D NULL) || (!strlen(istat->name))) {
>> free(istat);
>> return NULL;
>> }
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index 63681df6482b..cd283c42195c 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -859,7 +859,7 @@ static void ins__sort(struct arch *arch)
>> qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
>> }
>>=20
>> -static struct ins_ops *__ins__find(struct arch *arch, const char =
*name, u32 raw_insn)
>> +static struct ins_ops *__ins__find(struct arch *arch, const char =
*name, struct disasm_line *dl)
>> {
>> struct ins *ins;
>> const int nmemb =3D arch->nr_instructions;
>> @@ -871,7 +871,7 @@ static struct ins_ops *__ins__find(struct arch =
*arch, const char *name, u32 raw_
>>  */
>> struct ins_ops *ops;
>>=20
>> - ops =3D check_ppc_insn(raw_insn);
>> + ops =3D check_ppc_insn(dl);
>> if (ops)
>> return ops;
>> }
>> @@ -905,9 +905,9 @@ static struct ins_ops *__ins__find(struct arch =
*arch, const char *name, u32 raw_
>> return ins ? ins->ops : NULL;
>> }
>>=20
>> -struct ins_ops *ins__find(struct arch *arch, const char *name, u32 =
raw_insn)
>> +struct ins_ops *ins__find(struct arch *arch, const char *name, =
struct disasm_line *dl)
>> {
>> - struct ins_ops *ops =3D __ins__find(arch, name, raw_insn);
>> + struct ins_ops *ops =3D __ins__find(arch, name, dl);
>>=20
>> if (!ops && arch->associate_instruction_ops)
>> ops =3D arch->associate_instruction_ops(arch, name);
>> @@ -917,7 +917,7 @@ struct ins_ops *ins__find(struct arch *arch, =
const char *name, u32 raw_insn)
>>=20
>> static void disasm_line__init_ins(struct disasm_line *dl, struct arch =
*arch, struct map_symbol *ms)
>> {
>> - dl->ins.ops =3D ins__find(arch, dl->ins.name, dl->raw.raw_insn);
>> + dl->ins.ops =3D ins__find(arch, dl->ins.name, dl);
>>=20
>> if (!dl->ins.ops)
>> return;
>> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
>> index c1bb1e484bfb..f56beedeb9da 100644
>> --- a/tools/perf/util/disasm.h
>> +++ b/tools/perf/util/disasm.h
>> @@ -105,7 +105,7 @@ struct annotate_args {
>> struct arch *arch__find(const char *name);
>> bool arch__is(struct arch *arch, const char *name);
>>=20
>> -struct ins_ops *ins__find(struct arch *arch, const char *name, u32 =
raw_insn);
>> +struct ins_ops *ins__find(struct arch *arch, const char *name, =
struct disasm_line *dl);
>> int ins__scnprintf(struct ins *ins, char *bf, size_t size,
>>    struct ins_operands *ops, int max_ins_name);
>>=20
>> --=20
>> 2.43.0


