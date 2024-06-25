Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CA916845
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:44:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ox1B/JhA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7l0524Mfz3fx7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 22:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ox1B/JhA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kzG64WKz3fps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 22:43:54 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PCQQbq016014;
	Tue, 25 Jun 2024 12:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=+
	Da0eBbEawKu+p4/Q0MJ9zhaaG6BMxYAkohwK9yut/w=; b=Ox1B/JhAWDer0HT+l
	h2orkjHSaxt/Ho8KboxHzlR6p3QtEXYzJ/g9KMJM3DC+htvZgwoTu5IOr+n6IgMP
	uzxYkUojlmeFt0bopMmNvkl8NQaSPOsjk4H3V5c6zG+ibxHy0sJDHFzLXPiDfJP/
	3N8+VoFBqXgKA5dAQt8CcuGYFyykAt+y1Ui8v3DRan/IIRCWS0jANGJo8PdH/R40
	2PG5QnKZhJn+lE0OZSuYJxkC1scEmaISizOKBsLArxVlBOWYW5fG3R8zEqh9TcGh
	fEqRVXEp9wPH7cNk+5E/zBiQq3XerPZrMXVgvbK2HPr6uLxQBzHEQMB17yxtdgC/
	8M2ag==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyv5v8abg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 12:43:46 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45PChj2p011175;
	Tue, 25 Jun 2024 12:43:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyv5v8abd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 12:43:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45PBxFXG000627;
	Tue, 25 Jun 2024 12:43:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yxaemx952-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 12:43:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45PChc9B49086888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 12:43:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6585520040;
	Tue, 25 Jun 2024 12:43:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E58B62004B;
	Tue, 25 Jun 2024 12:43:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.30.249])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Jun 2024 12:43:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [V4 06/16] tools/perf: Update parameters for reg extract
 functions to use raw instruction on powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZnpdAhTHWAlS_MYa@google.com>
Date: Tue, 25 Jun 2024 18:13:25 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD5A136C-3D73-4B95-9B52-5F739D7B2F93@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-7-atrajeev@linux.vnet.ibm.com>
 <ZnpdAhTHWAlS_MYa@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V5uOwf2LBO36Z6MDIxGy0W_EgqrYZR5O
X-Proofpoint-GUID: 4e80gXVrCEWq-uPdV4v46f6ZTqs9lKwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250091
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
Cc: Ian Rogers <irogers@google.com>, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25 Jun 2024, at 11:30=E2=80=AFAM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>=20
> On Fri, Jun 14, 2024 at 10:56:21PM +0530, Athira Rajeev wrote:
>> Use the raw instruction code and macros to identify memory =
instructions,
>> extract register fields and also offset. The implementation addresses
>> the D-form, X-form, DS-form instructions. Two main functions are =
added.
>> New parse function "load_store__parse" as instruction ops parser for
>> memory instructions. Unlink other parser (like mov__parse), this =
parser
>> fills in the "multi_regs" field for source/target and new added =
"mem_ref"
>> field. No other fields are set because, here there is no need to =
parse the
>> disassembled code and arch specific macros will take care of =
extracting
>> offset and regs which is easier and will be precise.
>>=20
>> In powerpc, all instructions with a primary opcode from 32 to 63
>> are memory instructions. Update "ins__find" function to have =
"raw_insn"
>> also as a parameter. Don't use the "extract_reg_offset", instead use
>> newly added function "get_arch_regs" which will set these fields: =
reg1,
>> reg2, offset depending of where it is source or target ops.
>>=20
>> Update "parse" callback for "struct ins_ops" to also pass "struct
>> disasm_line" as argument. This is needed in parse functions where =
opcode
>> is used to determine whether to set multi_regs.
>=20
> Can you please split "ins__find" change and "parse" change into =
separate
> commits?

Ok.=20
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/arch/arm64/annotate/instructions.c |  3 +-
>> .../arch/loongarch/annotate/instructions.c    |  6 +-
>> .../perf/arch/powerpc/annotate/instructions.c | 16 ++++
>> tools/perf/arch/powerpc/util/dwarf-regs.c     | 44 +++++++++++
>> tools/perf/arch/s390/annotate/instructions.c  |  5 +-
>> tools/perf/util/annotate.c                    | 25 ++++++-
>> tools/perf/util/disasm.c                      | 73 =
++++++++++++++++---
>> tools/perf/util/disasm.h                      |  6 +-
>> tools/perf/util/include/dwarf-regs.h          |  3 +
>> 9 files changed, 159 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/tools/perf/arch/arm64/annotate/instructions.c =
b/tools/perf/arch/arm64/annotate/instructions.c
>> index 4af0c3a0f86e..f86d9f4798bd 100644
>> --- a/tools/perf/arch/arm64/annotate/instructions.c
>> +++ b/tools/perf/arch/arm64/annotate/instructions.c
>> @@ -11,7 +11,8 @@ struct arm64_annotate {
>>=20
>> static int arm64_mov__parse(struct arch *arch __maybe_unused,
>>     struct ins_operands *ops,
>> -     struct map_symbol *ms __maybe_unused)
>> +     struct map_symbol *ms __maybe_unused,
>> +     struct disasm_line *dl __maybe_unused)
>> {
>> char *s =3D strchr(ops->raw, ','), *target, *endptr;
>>=20
>> diff --git a/tools/perf/arch/loongarch/annotate/instructions.c =
b/tools/perf/arch/loongarch/annotate/instructions.c
>> index 21cc7e4149f7..ab43b1ab51e3 100644
>> --- a/tools/perf/arch/loongarch/annotate/instructions.c
>> +++ b/tools/perf/arch/loongarch/annotate/instructions.c
>> @@ -5,7 +5,8 @@
>>  * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
>>  */
>>=20
>> -static int loongarch_call__parse(struct arch *arch, struct =
ins_operands *ops, struct map_symbol *ms)
>> +static int loongarch_call__parse(struct arch *arch, struct =
ins_operands *ops, struct map_symbol *ms,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> char *c, *endptr, *tok, *name;
>> struct map *map =3D ms->map;
>> @@ -51,7 +52,8 @@ static struct ins_ops loongarch_call_ops =3D {
>> .scnprintf =3D call__scnprintf,
>> };
>>=20
>> -static int loongarch_jump__parse(struct arch *arch, struct =
ins_operands *ops, struct map_symbol *ms)
>> +static int loongarch_jump__parse(struct arch *arch, struct =
ins_operands *ops, struct map_symbol *ms,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> struct map *map =3D ms->map;
>> struct symbol *sym =3D ms->sym;
>> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c =
b/tools/perf/arch/powerpc/annotate/instructions.c
>> index d57fd023ef9c..10fea5e5cf4c 100644
>> --- a/tools/perf/arch/powerpc/annotate/instructions.c
>> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
>> @@ -49,6 +49,22 @@ static struct ins_ops =
*powerpc__associate_instruction_ops(struct arch *arch, con
>> return ops;
>> }
>>=20
>> +#define PPC_OP(op)      (((op) >> 26) & 0x3F)
>> +
>> +static struct ins_ops *check_ppc_insn(int raw_insn)
>=20
> It'd be nice to use 'u32' instead of 'int' for raw_insn if you want to
> do some bit operations.
Sure
>=20
>> +{
>> + int opcode =3D PPC_OP(raw_insn);
>> +
>> + /*
>> +  * Instructions with opcode 32 to 63 are memory
>> +  * instructions in powerpc
>> +  */
>> + if ((opcode & 0x20))
>> + return &load_store_ops;
>> +
>> + return NULL;
>> +}
>> +
>> static int powerpc__annotate_init(struct arch *arch, char *cpuid =
__maybe_unused)
>> {
>> if (!arch->initialized) {
>> diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c =
b/tools/perf/arch/powerpc/util/dwarf-regs.c
>> index 430623ca5612..e01729f3c0b3 100644
>> --- a/tools/perf/arch/powerpc/util/dwarf-regs.c
>> +++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
>> @@ -107,3 +107,47 @@ int regs_query_register_offset(const char *name)
>> #define PPC_DS(DS) ((DS) & 0xfffc)
>> #define OP_LD 58
>> #define OP_STD 62
>> +
>> +static int get_source_reg(unsigned int raw_insn)
>> +{
>> + return PPC_RA(raw_insn);
>=20
> Ditto, and others too.
Ok
>=20
>=20
>> +}
>> +
>> +static int get_target_reg(unsigned int raw_insn)
>> +{
>> + return PPC_RT(raw_insn);
>> +}
>> +
>> +static int get_offset_opcode(int raw_insn)
>> +{
>> + int opcode =3D PPC_OP(raw_insn);
>> +
>> + /* DS- form */
>> + if ((opcode =3D=3D OP_LD) || (opcode =3D=3D OP_STD))
>> + return PPC_DS(raw_insn);
>> + else
>> + return PPC_D(raw_insn);
>> +}
>> +
>> +/*
>> + * Fills the required fields for op_loc depending on if it
>> + * is a source or target.
>> + * D form: ins RT,D(RA) -> src_reg1 =3D RA, offset =3D D, dst_reg1 =3D=
 RT
>> + * DS form: ins RT,DS(RA) -> src_reg1 =3D RA, offset =3D DS, =
dst_reg1 =3D RT
>> + * X form: ins RT,RA,RB -> src_reg1 =3D RA, src_reg2 =3D RB, =
dst_reg1 =3D RT
>> + */
>> +void get_arch_regs(int raw_insn, int is_source,
>> + struct annotated_op_loc *op_loc)
>> +{
>> + if (is_source)
>> + op_loc->reg1 =3D get_source_reg(raw_insn);
>> + else
>> + op_loc->reg1 =3D get_target_reg(raw_insn);
>> +
>> + if (op_loc->multi_regs)
>> + op_loc->reg2 =3D PPC_RB(raw_insn);
>> +
>> + /* TODO: Implement offset handling for X Form */
>> + if ((op_loc->mem_ref) && (PPC_OP(raw_insn) !=3D 31))
>> + op_loc->offset =3D get_offset_opcode(raw_insn);
>> +}
>> diff --git a/tools/perf/arch/s390/annotate/instructions.c =
b/tools/perf/arch/s390/annotate/instructions.c
>> index da5aa3e1f04c..eeac25cca699 100644
>> --- a/tools/perf/arch/s390/annotate/instructions.c
>> +++ b/tools/perf/arch/s390/annotate/instructions.c
>> @@ -2,7 +2,7 @@
>> #include <linux/compiler.h>
>>=20
>> static int s390_call__parse(struct arch *arch, struct ins_operands =
*ops,
>> -     struct map_symbol *ms)
>> +     struct map_symbol *ms, struct disasm_line *dl __maybe_unused)
>> {
>> char *endptr, *tok, *name;
>> struct map *map =3D ms->map;
>> @@ -52,7 +52,8 @@ static struct ins_ops s390_call_ops =3D {
>>=20
>> static int s390_mov__parse(struct arch *arch __maybe_unused,
>>    struct ins_operands *ops,
>> -    struct map_symbol *ms __maybe_unused)
>> +    struct map_symbol *ms __maybe_unused,
>> +    struct disasm_line *dl __maybe_unused)
>> {
>> char *s =3D strchr(ops->raw, ','), *target, *endptr;
>>=20
>> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
>> index 1451caf25e77..bfa6420dc4b9 100644
>> --- a/tools/perf/util/annotate.c
>> +++ b/tools/perf/util/annotate.c
>> @@ -2079,6 +2079,12 @@ static int extract_reg_offset(struct arch =
*arch, const char *str,
>> return 0;
>> }
>>=20
>> +__weak void get_arch_regs(int raw_insn __maybe_unused, int is_source =
__maybe_unused,
>> + struct annotated_op_loc *op_loc __maybe_unused)
>=20
> I'd like to avoid adding weak functions if possible.  It's supposed to
> be powerpc only, maybe you can add get_powerpc_regs() in the arch
> directory and add a dummy static inline somewhere under #ifndef.
>=20
>> +{
>> + return;
>> +}
>> +
>> /**
>>  * annotate_get_insn_location - Get location of instruction
>>  * @arch: the architecture info
>> @@ -2123,20 +2129,33 @@ int annotate_get_insn_location(struct arch =
*arch, struct disasm_line *dl,
>> for_each_insn_op_loc(loc, i, op_loc) {
>> const char *insn_str =3D ops->source.raw;
>> bool multi_regs =3D ops->source.multi_regs;
>> + bool mem_ref =3D ops->source.mem_ref;
>>=20
>> if (i =3D=3D INSN_OP_TARGET) {
>> insn_str =3D ops->target.raw;
>> multi_regs =3D ops->target.multi_regs;
>> + mem_ref =3D ops->target.mem_ref;
>> }
>>=20
>> /* Invalidate the register by default */
>> op_loc->reg1 =3D -1;
>> op_loc->reg2 =3D -1;
>>=20
>> - if (insn_str =3D=3D NULL)
>> - continue;
>> + if (insn_str =3D=3D NULL) {
>> + if (!arch__is(arch, "powerpc"))
>> + continue;
>> + }
>>=20
>> - if (strchr(insn_str, arch->objdump.memory_ref_char)) {
>> + /*
>> +  * For powerpc, call get_arch_regs function which extracts the
>> +  * required fields for op_loc, ie reg1, reg2, offset from the
>> +  * raw instruction.
>> +  */
>> + if (arch__is(arch, "powerpc")) {
>> + op_loc->mem_ref =3D mem_ref;
>> + op_loc->multi_regs =3D multi_regs;
>> + get_arch_regs(dl->raw.raw_insn, !i, op_loc);
>> + } else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
>> op_loc->mem_ref =3D true;
>> op_loc->multi_regs =3D multi_regs;
>> extract_reg_offset(arch, insn_str, op_loc);
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index 1e8568738b38..8428df0b9c17 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -37,6 +37,7 @@ static struct ins_ops mov_ops;
>> static struct ins_ops nop_ops;
>> static struct ins_ops lock_ops;
>> static struct ins_ops ret_ops;
>> +static struct ins_ops load_store_ops;
>>=20
>> static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
>>    struct ins_operands *ops, int max_ins_name);
>> @@ -254,7 +255,8 @@ bool ins__is_fused(struct arch *arch, const char =
*ins1, const char *ins2)
>> return arch->ins_is_fused(arch, ins1, ins2);
>> }
>>=20
>> -static int call__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms)
>> +static int call__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> char *endptr, *tok, *name;
>> struct map *map =3D ms->map;
>> @@ -349,7 +351,8 @@ static inline const char *validate_comma(const =
char *c, struct ins_operands *ops
>> return c;
>> }
>>=20
>> -static int jump__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms)
>> +static int jump__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> struct map *map =3D ms->map;
>> struct symbol *sym =3D ms->sym;
>> @@ -508,7 +511,8 @@ static int comment__symbol(char *raw, char =
*comment, u64 *addrp, char **namep)
>> return 0;
>> }
>>=20
>> -static int lock__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms)
>> +static int lock__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> ops->locked.ops =3D zalloc(sizeof(*ops->locked.ops));
>> if (ops->locked.ops =3D=3D NULL)
>> @@ -517,13 +521,13 @@ static int lock__parse(struct arch *arch, =
struct ins_operands *ops, struct map_s
>> if (disasm_line__parse(ops->raw, &ops->locked.ins.name, =
&ops->locked.ops->raw) < 0)
>> goto out_free_ops;
>>=20
>> - ops->locked.ins.ops =3D ins__find(arch, ops->locked.ins.name);
>> + ops->locked.ins.ops =3D ins__find(arch, ops->locked.ins.name, 0);
>>=20
>> if (ops->locked.ins.ops =3D=3D NULL)
>> goto out_free_ops;
>>=20
>> if (ops->locked.ins.ops->parse &&
>> -     ops->locked.ins.ops->parse(arch, ops->locked.ops, ms) < 0)
>> +     ops->locked.ins.ops->parse(arch, ops->locked.ops, ms, NULL) < =
0)
>> goto out_free_ops;
>>=20
>> return 0;
>> @@ -594,7 +598,8 @@ static bool check_multi_regs(struct arch *arch, =
const char *op)
>> return count > 1;
>> }
>>=20
>> -static int mov__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms __maybe_unused)
>> +static int mov__parse(struct arch *arch, struct ins_operands *ops, =
struct map_symbol *ms __maybe_unused,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> char *s =3D strchr(ops->raw, ','), *target, *comment, prev;
>>=20
>> @@ -672,7 +677,39 @@ static struct ins_ops mov_ops =3D {
>> .scnprintf =3D mov__scnprintf,
>> };
>>=20
>> -static int dec__parse(struct arch *arch __maybe_unused, struct =
ins_operands *ops, struct map_symbol *ms __maybe_unused)
>> +static int load_store__scnprintf(struct ins *ins, char *bf, size_t =
size,
>> + struct ins_operands *ops, int max_ins_name)
>> +{
>> + return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
>> + ops->raw);
>> +}
>> +
>> +/*
>> + * Sets the fields: multi_regs and "mem_ref".
>> + * "mem_ref" is set for ops->source which is later used to
>> + * fill the objdump->memory_ref-char field. This ops is currently
>> + * used by powerpc and since binary instruction code is used to
>> + * extract opcode, regs and offset, no other parsing is needed here
>> + */
>> +static int load_store__parse(struct arch *arch __maybe_unused, =
struct ins_operands *ops,
>> + struct map_symbol *ms __maybe_unused, struct disasm_line *dl =
__maybe_unused)
>> +{
>> + ops->source.mem_ref =3D true;
>> + ops->source.multi_regs =3D false;
>> +
>> + ops->target.mem_ref =3D false;
>> + ops->target.multi_regs =3D false;
>> +
>> + return 0;
>> +}
>> +
>> +static struct ins_ops load_store_ops =3D {
>> + .parse     =3D load_store__parse,
>> + .scnprintf =3D load_store__scnprintf,
>> +};
>> +
>> +static int dec__parse(struct arch *arch __maybe_unused, struct =
ins_operands *ops, struct map_symbol *ms __maybe_unused,
>> + struct disasm_line *dl __maybe_unused)
>> {
>> char *target, *comment, *s, prev;
>>=20
>> @@ -762,11 +799,23 @@ static void ins__sort(struct arch *arch)
>> qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
>> }
>>=20
>> -static struct ins_ops *__ins__find(struct arch *arch, const char =
*name)
>> +static struct ins_ops *__ins__find(struct arch *arch, const char =
*name, int raw_insn)
>> {
>> struct ins *ins;
>> const int nmemb =3D arch->nr_instructions;
>>=20
>> + if (arch__is(arch, "powerpc")) {
>> + /*
>> +  * For powerpc, identify the instruction ops
>> +  * from the opcode using raw_insn.
>> +  */
>> + struct ins_ops *ops;
>> +
>> + ops =3D check_ppc_insn(raw_insn);
>> + if (ops)
>> + return ops;
>> + }
>> +
>> if (!arch->sorted_instructions) {
>> ins__sort(arch);
>> arch->sorted_instructions =3D true;
>> @@ -796,9 +845,9 @@ static struct ins_ops *__ins__find(struct arch =
*arch, const char *name)
>> return ins ? ins->ops : NULL;
>> }
>>=20
>> -struct ins_ops *ins__find(struct arch *arch, const char *name)
>> +struct ins_ops *ins__find(struct arch *arch, const char *name, int =
raw_insn)
>> {
>> - struct ins_ops *ops =3D __ins__find(arch, name);
>> + struct ins_ops *ops =3D __ins__find(arch, name, raw_insn);
>>=20
>> if (!ops && arch->associate_instruction_ops)
>> ops =3D arch->associate_instruction_ops(arch, name);
>> @@ -808,12 +857,12 @@ struct ins_ops *ins__find(struct arch *arch, =
const char *name)
>>=20
>> static void disasm_line__init_ins(struct disasm_line *dl, struct arch =
*arch, struct map_symbol *ms)
>> {
>> - dl->ins.ops =3D ins__find(arch, dl->ins.name);
>> + dl->ins.ops =3D ins__find(arch, dl->ins.name, dl->raw.raw_insn);
>>=20
>> if (!dl->ins.ops)
>> return;
>>=20
>> - if (dl->ins.ops->parse && dl->ins.ops->parse(arch, &dl->ops, ms) < =
0)
>> + if (dl->ins.ops->parse && dl->ins.ops->parse(arch, &dl->ops, ms, =
dl) < 0)
>> dl->ins.ops =3D NULL;
>> }
>>=20
>> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
>> index 718177fa4775..6b6ec23e4f6f 100644
>> --- a/tools/perf/util/disasm.h
>> +++ b/tools/perf/util/disasm.h
>> @@ -57,6 +57,7 @@ struct ins_operands {
>> bool offset_avail;
>> bool outside;
>> bool multi_regs;
>> + bool mem_ref;
>> } target;
>> union {
>> struct {
>> @@ -64,6 +65,7 @@ struct ins_operands {
>> char *name;
>> u64 addr;
>> bool multi_regs;
>> + bool mem_ref;
>> } source;
>> struct {
>> struct ins     ins;
>> @@ -78,7 +80,7 @@ struct ins_operands {
>>=20
>> struct ins_ops {
>> void (*free)(struct ins_operands *ops);
>> - int (*parse)(struct arch *arch, struct ins_operands *ops, struct =
map_symbol *ms);
>> + int (*parse)(struct arch *arch, struct ins_operands *ops, struct =
map_symbol *ms, struct disasm_line *dl);
>=20
> The line is too long, please break.
>=20
> Thanks,
> Namhyung
>=20
>=20
>> int (*scnprintf)(struct ins *ins, char *bf, size_t size,
>>  struct ins_operands *ops, int max_ins_name);
>> };
>> @@ -97,7 +99,7 @@ struct annotate_args {
>> struct arch *arch__find(const char *name);
>> bool arch__is(struct arch *arch, const char *name);
>>=20
>> -struct ins_ops *ins__find(struct arch *arch, const char *name);
>> +struct ins_ops *ins__find(struct arch *arch, const char *name, int =
raw_insn);
>> int ins__scnprintf(struct ins *ins, char *bf, size_t size,
>>    struct ins_operands *ops, int max_ins_name);
>>=20
>> diff --git a/tools/perf/util/include/dwarf-regs.h =
b/tools/perf/util/include/dwarf-regs.h
>> index 01fb25a1150a..7ea39362ecaf 100644
>> --- a/tools/perf/util/include/dwarf-regs.h
>> +++ b/tools/perf/util/include/dwarf-regs.h
>> @@ -1,6 +1,7 @@
>> /* SPDX-License-Identifier: GPL-2.0 */
>> #ifndef _PERF_DWARF_REGS_H_
>> #define _PERF_DWARF_REGS_H_
>> +#include "annotate.h"
>>=20
>> #define DWARF_REG_PC  0xd3af9c /* random number */
>> #define DWARF_REG_FB  0xd3affb /* random number */
>> @@ -31,6 +32,8 @@ static inline int get_dwarf_regnum(const char *name =
__maybe_unused,
>> }
>> #endif
>>=20
>> +void get_arch_regs(int raw_insn, int is_source, struct =
annotated_op_loc *op_loc);
>> +
>> #ifdef HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
>> /*
>>  * Arch should support fetching the offset of a register in pt_regs
>> --=20
>> 2.43.0


