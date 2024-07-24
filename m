Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0C93AC4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 07:40:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aULStq2R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTNBq4xFtz3d3Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 15:40:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aULStq2R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTNB614mWz3cnS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 15:39:25 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O4tZw4014605;
	Wed, 24 Jul 2024 05:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=o
	Dz1FGzcFR0z6Qme3zUQ0/IrpuZuRoch6qmbjqTmcJ0=; b=aULStq2RQw7OI7NR1
	A8ktCGqoCrU1B+yq1nblFhD+f+f3YezHPWHZMLp8uWOY7Gbh6uuBWwiCGp2fw73y
	uBwbd2YRhPoC3iaulcqrYGK1y2DDI4KKeq8Aj5cK+ujsZcIpkm1zVRKleU4TvTE+
	3vaZhXRK481cfBxzEmgXwXW8H6e/uMNHUebhaxkOtkl3JQtBcRHpm5iagO/kyVnn
	ccZgVRRixcZksdgxnyIALduBaX/T9XnQT+T4V2/j1cazqakOXy1HJ9hnsB2TZEE0
	opSrhd9GgqnnsaL1II1gHKNtV+3quQalLn57WAqA2tr46tjHor+woackifqVU7bC
	0V37w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40jnsp0kkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:39:15 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46O5dFLE007727;
	Wed, 24 Jul 2024 05:39:15 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40jnsp0kku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:39:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46O1Jib3006718;
	Wed, 24 Jul 2024 05:39:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40gxn7e27d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 05:39:13 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46O5d83F55443878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 05:39:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 216982004F;
	Wed, 24 Jul 2024 05:39:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F38242004D;
	Wed, 24 Jul 2024 05:39:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.99.114])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 24 Jul 2024 05:39:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V8 04/15] tools/perf: Add disasm_line__parse to parse raw
 instruction for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZqABFhGYfcu60V7S@x1>
Date: Wed, 24 Jul 2024 11:08:54 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <8473D9B8-5FE7-4AAB-9EF2-7D207410A986@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
 <20240718084358.72242-5-atrajeev@linux.vnet.ibm.com> <ZqABFhGYfcu60V7S@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cXfbyjibe1TxU9nAxo-7KthDx5qsqk7N
X-Proofpoint-ORIG-GUID: LvhT7mDrS7A7JbaOpf-mt4Z0j2279TO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_03,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407240038
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
Cc: Ian Rogers <irogers@google.com>, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24 Jul 2024, at 12:44=E2=80=AFAM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Thu, Jul 18, 2024 at 02:13:47PM +0530, Athira Rajeev wrote:
>> Currently, the perf tool infrastructure disasm_line__parse function =
to
>> parse disassembled line.
>>=20
>> Example snippet from objdump:
>> objdump  --start-address=3D<address> --stop-address=3D<address>  -d =
--no-show-raw-insn -C <vmlinux>
>>=20
>> c0000000010224b4: lwz     r10,0(r9)
>>=20
>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>> registers names and offset. In powerpc, the approach for data type
>> profiling uses raw instruction instead of result from objdump to =
identify
>> the instruction category and extract the source/target registers.
>>=20
>> Example: 38 01 81 e8     ld      r4,312(r1)
>>=20
>> Here "38 01 81 e8" is the raw instruction representation. Add =
function
>> "disasm_line__parse_powerpc" to handle parsing of raw instruction.
>> Also update "struct disasm_line" to save the binary code/
>> With the change, function captures:
>>=20
>> line -> "38 01 81 e8     ld      r4,312(r1)"
>> raw instruction "38 01 81 e8"
>>=20
>> Raw instruction is used later to extract the reg/offset fields. =
Macros
>> are added to extract opcode and register fields. "struct disasm_line"
>> is updated to carry union of "bytes" and "raw_insn" of 32 bit to =
carry raw
>> code (raw). Function "disasm_line__parse_powerpc fills the raw
>> instruction hex value and can use macros to get opcode. There is no
>> changes in existing code paths, which parses the disassembled code.
>> The size of raw instruction depends on architecture. In case of =
powerpc,
>> the parsing the disasm line needs to handle cases for reading binary =
code
>> directly from DSO as well as parsing the objdump result. Hence adding
>> the logic into separate function instead of updating =
"disasm_line__parse".
>> The architecture using the instruction name and present approach is
>> not altered. Since this approach targets powerpc, the macro
>> implementation is added for powerpc as of now.
>>=20
>> Since the disasm_line__parse is used in other cases (perf annotate) =
and
>> not only data tye profiling, the powerpc callback includes changes to
>> work with binary code as well as mneumonic representation. Also in =
case
>> if the DSO read fails and libcapstone is not supported, the approach
>> fallback to use objdump as option. Hence as option, patch has changes =
to
>> ensure objdump option also works well.
>>=20
>> Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
>> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/include/linux/string.h                  |  2 +
>> tools/lib/string.c                            | 13 +++++
>> .../perf/arch/powerpc/annotate/instructions.c |  1 +
>> tools/perf/arch/powerpc/util/dwarf-regs.c     |  9 ++++
>> tools/perf/util/annotate.h                    |  5 +-
>> tools/perf/util/disasm.c                      | 48 =
++++++++++++++++++-
>> 6 files changed, 76 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/include/linux/string.h =
b/tools/include/linux/string.h
>> index db5c99318c79..0acb1fc14e19 100644
>> --- a/tools/include/linux/string.h
>> +++ b/tools/include/linux/string.h
>> @@ -46,5 +46,7 @@ extern char * __must_check skip_spaces(const char =
*);
>>=20
>> extern char *strim(char *);
>>=20
>> +extern void remove_spaces(char *s);
>> +
>> extern void *memchr_inv(const void *start, int c, size_t bytes);
>> #endif /* _TOOLS_LINUX_STRING_H_ */
>> diff --git a/tools/lib/string.c b/tools/lib/string.c
>> index 8b6892f959ab..3126d2cff716 100644
>> --- a/tools/lib/string.c
>> +++ b/tools/lib/string.c
>> @@ -153,6 +153,19 @@ char *strim(char *s)
>> return skip_spaces(s);
>> }
>>=20
>> +/*
>> + * remove_spaces - Removes whitespaces from @s
>> + */
>> +void remove_spaces(char *s)
>> +{
>> + char *d =3D s;
>> +
>> + do {
>> + while (*d =3D=3D ' ')
>> + ++d;
>> + } while ((*s++ =3D *d++));
>> +}
>> +
>> /**
>>  * strreplace - Replace all occurrences of character in string.
>>  * @s: The string to operate on.
>> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c =
b/tools/perf/arch/powerpc/annotate/instructions.c
>> index a3f423c27cae..d57fd023ef9c 100644
>> --- a/tools/perf/arch/powerpc/annotate/instructions.c
>> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
>> @@ -55,6 +55,7 @@ static int powerpc__annotate_init(struct arch =
*arch, char *cpuid __maybe_unused)
>> arch->initialized =3D true;
>> arch->associate_instruction_ops =3D =
powerpc__associate_instruction_ops;
>> arch->objdump.comment_char      =3D '#';
>> + annotate_opts.show_asm_raw =3D true;
>> }
>>=20
>> return 0;
>> diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c =
b/tools/perf/arch/powerpc/util/dwarf-regs.c
>> index 0c4f4caf53ac..430623ca5612 100644
>> --- a/tools/perf/arch/powerpc/util/dwarf-regs.c
>> +++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
>> @@ -98,3 +98,12 @@ int regs_query_register_offset(const char *name)
>> return roff->ptregs_offset;
>> return -EINVAL;
>> }
>> +
>> +#define PPC_OP(op) (((op) >> 26) & 0x3F)
>> +#define PPC_RA(a) (((a) >> 16) & 0x1f)
>> +#define PPC_RT(t) (((t) >> 21) & 0x1f)
>> +#define PPC_RB(b) (((b) >> 11) & 0x1f)
>> +#define PPC_D(D) ((D) & 0xfffe)
>> +#define PPC_DS(DS) ((DS) & 0xfffc)
>> +#define OP_LD 58
>> +#define OP_STD 62
>> diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
>> index d5c821c22f79..9ba772f46270 100644
>> --- a/tools/perf/util/annotate.h
>> +++ b/tools/perf/util/annotate.h
>> @@ -113,7 +113,10 @@ struct annotation_line {
>> struct disasm_line {
>> struct ins ins;
>> struct ins_operands ops;
>> -
>> + union {
>> + u8 bytes[4];
>> + u32 raw_insn;
>> + } raw;
>> /* This needs to be at the end. */
>> struct annotation_line al;
>> };
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index d2723ba024bf..a53591a6111e 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -44,6 +44,7 @@ static int call__scnprintf(struct ins *ins, char =
*bf, size_t size,
>>=20
>> static void ins__sort(struct arch *arch);
>> static int disasm_line__parse(char *line, const char **namep, char =
**rawp);
>> +static int disasm_line__parse_powerpc(struct disasm_line *dl);
>>=20
>> static __attribute__((constructor)) void symbol__init_regexpr(void)
>> {
>> @@ -845,6 +846,48 @@ static int disasm_line__parse(char *line, const =
char **namep, char **rawp)
>> return -1;
>> }
>>=20
>> +/*
>> + * Parses the result captured from symbol__disassemble_*
>> + * Example, line read from DSO file in powerpc:
>> + * line:    38 01 81 e8
>> + * opcode: fetched from arch specific get_opcode_insn
>> + * rawp_insn: e8810138
>> + *
>> + * rawp_insn is used later to extract the reg/offset fields
>> + */
>> +#define PPC_OP(op) (((op) >> 26) & 0x3F)
>> +#define RAW_BYTES 11
>> +
>> +static int disasm_line__parse_powerpc(struct disasm_line *dl)
>> +{
>> + char *line =3D dl->al.line;
>> + const char **namep =3D &dl->ins.name;
>> + char **rawp =3D &dl->ops.raw;
>> + char *tmp_raw_insn, *name_raw_insn =3D skip_spaces(line);
>> + char *name =3D skip_spaces(name_raw_insn + RAW_BYTES);
>> + int objdump =3D 0;
>> +
>> + if (strlen(line) > RAW_BYTES)
>> + objdump =3D 1;
>> +
>> + if (name_raw_insn[0] =3D=3D '\0')
>> + return -1;
>> +
>> + if (objdump) {
>> + disasm_line__parse(name, namep, rawp);
>> + } else
>> + *namep =3D "";
>> +
>> + tmp_raw_insn =3D strndup(name_raw_insn, 11);
>=20
> Not  checking the result of strndup(), I'll try to add the check on an
> extra pass after I read the patches.
>=20
> - Arnaldo
>=20
>> + remove_spaces(tmp_raw_insn);
>> +
>> + sscanf(tmp_raw_insn, "%x", &dl->raw.raw_insn);
>> + if (objdump)
>> + dl->raw.raw_insn =3D be32_to_cpu(dl->raw.raw_insn);
>> +
>> + return 0;
>> +}
>> +
>> static void annotation_line__init(struct annotation_line *al,
>>  struct annotate_args *args,
>>  int nr)
>> @@ -898,7 +941,10 @@ struct disasm_line *disasm_line__new(struct =
annotate_args *args)
>> goto out_delete;
>>=20
>> if (args->offset !=3D -1) {
>> - if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < =
0)
>> + if (arch__is(args->arch, "powerpc")) {
>> + if (disasm_line__parse_powerpc(dl) < 0)
>> + goto out_free_line;
>> + } else if (disasm_line__parse(dl->al.line, &dl->ins.name, =
&dl->ops.raw) < 0)
>> goto out_free_line;
>=20
> When the if has {}, the else should as well.
> Documentation/process/coding-style.rst has this documented.
>=20
> This is minor, I'm pointing out so that you take into account for the
> future.
>=20
> - Arnaldo
Thanks for pointing out. I will take care of it in the future

Athira
>=20
>>=20
>> disasm_line__init_ins(dl, args->arch, &args->ms);
>> --=20
>> 2.43.0

