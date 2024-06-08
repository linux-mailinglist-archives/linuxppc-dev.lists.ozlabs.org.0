Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918B900FCC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 09:10:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WOjbE3Hu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vx8Mm3MMTz3cPl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 17:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WOjbE3Hu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vx8Ly6qJWz3cX9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 17:09:14 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458708OD024869;
	Sat, 8 Jun 2024 07:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=a
	md22zqSEou1WY27AusMrnw38HaGszd9IgdEGTrBeeM=; b=WOjbE3Hu9CQhIXKAA
	TwlN5eGLRG5pgep9/5y7vy9X6aEPSfNyGzkeN87BCiIVLPAlZhFgF3jXvMDP8Wxx
	n/sDxcHnDCJMq0zWn+TbzCxn0R+qTdVGCOfjQO3QFAtB4QiibUZa8z60VCp010EJ
	56ZVyF0eknqW85ZYZGi96/tbnRkiXI144gR6o9+Ubx89i1TXchsbKKxb7EkJ2V3R
	7Q1+3wNEvOzoxWOEO2nd+5uELJjIY86dQ3Dp/VT656d62SBB4EIm2nclxCd11Fu7
	kO/a9W1Id3Wr+JNlnoElZNiGtg8f6Mqle1nWV0es1AB68YT8u/aB25WsqdoYrfNC
	oaYOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymjggr0j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:09:04 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 458794iQ008007;
	Sat, 8 Jun 2024 07:09:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymjggr0j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:09:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4583YDlq025347;
	Sat, 8 Jun 2024 07:09:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ymfgv0sxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:09:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45878vXC37880254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Jun 2024 07:08:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68FDF2004B;
	Sat,  8 Jun 2024 07:08:57 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A97920040;
	Sat,  8 Jun 2024 07:08:54 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.125.209])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat,  8 Jun 2024 07:08:54 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH V3 05/14] tools/perf: Add disasm_line__parse to parse raw
 instruction for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZmFYLK3pK3Uov4pe@google.com>
Date: Sat, 8 Jun 2024 12:38:43 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3E1E5E5-CE15-4293-9B86-7E3E558318D1@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-6-atrajeev@linux.vnet.ibm.com>
 <ZmFYLK3pK3Uov4pe@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vN6khOEVryDlrY5fiORBULmtAZ5rNvlC
X-Proofpoint-ORIG-GUID: 2o3WEad4YBoc5va-66dSrTsgsfEu7CGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406080049
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
Cc: Ian Rogers <irogers@google.com>, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 6 Jun 2024, at 12:03=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> Hello,
>=20
> On Sat, Jun 01, 2024 at 11:39:32AM +0530, Athira Rajeev wrote:
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
>> "disasm_line__parse_powerpc" to handle parsing of raw instruction. =
Also
>> update "struct ins" and "struct ins_operands" to save "opcode" and
>> binary code. With the change, function captures:
>>=20
>> line -> "38 01 81 e8     ld      r4,312(r1)"
>> opcode and raw instruction "38 01 81 e8"
>>=20
>> Raw instruction is used later to extract the reg/offset fields. =
Macros
>> are added to extract opcode and register fields. "struct =
ins_operands"
>> and "struct ins" is updated to carry opcode and raw instruction =
binary
>> code (raw_insn). Function "disasm_line__parse_powerpc fills the raw
>> instruction hex value and opcode in newly added fields. There is no
>> changes in existing code paths, which parses the disassembled code.
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
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/include/linux/string.h                  |  2 +
>> tools/lib/string.c                            | 13 ++++
>> .../perf/arch/powerpc/annotate/instructions.c |  1 +
>> tools/perf/arch/powerpc/util/dwarf-regs.c     |  9 +++
>> tools/perf/util/disasm.c                      | 63 =
++++++++++++++++++-
>> tools/perf/util/disasm.h                      |  7 +++
>> 6 files changed, 94 insertions(+), 1 deletion(-)
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
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index 3cd187f08193..61f0f1656f82 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -45,6 +45,7 @@ static int call__scnprintf(struct ins *ins, char =
*bf, size_t size,
>>=20
>> static void ins__sort(struct arch *arch);
>> static int disasm_line__parse(char *line, const char **namep, char =
**rawp);
>> +static int disasm_line__parse_powerpc(struct disasm_line *dl);
>>=20
>> static __attribute__((constructor)) void symbol__init_regexpr(void)
>> {
>> @@ -844,6 +845,63 @@ static int disasm_line__parse(char *line, const =
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
>> +
>> +static int disasm_line__parse_powerpc(struct disasm_line *dl)
>> +{
>> + char *line =3D dl->al.line;
>> + const char **namep =3D &dl->ins.name;
>> + char **rawp =3D &dl->ops.raw;
>> + char tmp, *tmp_opcode, *name_opcode =3D skip_spaces(line);
>> + char *name =3D skip_spaces(name_opcode + 11);
>> + int objdump =3D 0;
>> +
>> + if (strlen(line) > 11)
>> + objdump =3D 1;
>> +
>> + if (name_opcode[0] =3D=3D '\0')
>> + return -1;
>> +
>> + if (objdump) {
>> + *rawp =3D name + 1;
>> + while ((*rawp)[0] !=3D '\0' && !isspace((*rawp)[0]))
>> + ++*rawp;
>> + tmp =3D (*rawp)[0];
>> + (*rawp)[0] =3D '\0';
>> +
>> + *namep =3D strdup(name);
>> + if (*namep =3D=3D NULL)
>> + return -1;
>> +
>> + (*rawp)[0] =3D tmp;
>> + *rawp =3D strim(*rawp);
>> + } else
>> + *namep =3D "";
>> +
>> + tmp_opcode =3D strdup(name_opcode);
>> + tmp_opcode[11] =3D '\0';
>> + remove_spaces(tmp_opcode);
>> +
>> + dl->ins.opcode =3D PPC_OP(strtol(tmp_opcode, NULL, 16));
>> + if (objdump)
>> + dl->ins.opcode =3D PPC_OP(be32_to_cpu(strtol(tmp_opcode, NULL, =
16)));
>> + dl->ops.opcode =3D dl->ins.opcode;
>> +
>> + dl->ops.raw_insn =3D strtol(tmp_opcode, NULL, 16);
>> + if (objdump)
>> + dl->ops.raw_insn =3D be32_to_cpu(strtol(tmp_opcode, NULL, 16));
>> + return 0;
>> +}
>> +
>> static void annotation_line__init(struct annotation_line *al,
>>  struct annotate_args *args,
>>  int nr)
>> @@ -897,7 +955,10 @@ struct disasm_line *disasm_line__new(struct =
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
>>=20
>> disasm_line__init_ins(dl, args->arch, &args->ms);
>> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
>> index 718177fa4775..a391e1bb81f7 100644
>> --- a/tools/perf/util/disasm.h
>> +++ b/tools/perf/util/disasm.h
>> @@ -43,14 +43,19 @@ struct arch {
>>=20
>> struct ins {
>> const char     *name;
>> + int opcode;
>=20
> I don't think this is the right place as 'ins' can be shared for
> different opcodes.  IIUC it's like a class and disasm_line should
> have a pointer instead of a copy of the arch instructions.  So I'd
> like to keep a single instance if they behave in the same way.  But
> this is a separate change.
>=20
> I guess we can move it to struct disasm_line and use helper macros =
when
> we need to access the opcode.  This will be helpful for other arches.
>=20
>  struct disasm_line {
>      struct ins *ins;
>      struct ins_operands ops;
>      union {
>          u8 bytes[4];
>          u32 opcode;
>      } raw;
>      struct annotation_line al;
>  };
>=20
>  #define PPC_OP(dl)  (((dl)->raw.bytes[0] >> 2) & 0x3F)

Thanks for the suggestion. I will make these changes in V4

Thanks
Athira
>=20
> Thanks,
> Namhyung
>=20
>>=20
>> struct ins_ops *ops;
>> };
>>=20
>> struct ins_operands {
>> char *raw;
>> + int raw_insn;
>> + int opcode;
>> struct {
>> char *raw;
>> char *name;
>> + int opcode;
>> + int raw_insn;
>> struct symbol *sym;
>> u64 addr;
>> s64 offset;
>> @@ -62,6 +67,8 @@ struct ins_operands {
>> struct {
>> char *raw;
>> char *name;
>> + int opcode;
>> + int raw_insn;
>> u64 addr;
>> bool multi_regs;
>> } source;
>> --=20
>> 2.43.0
>>=20

