Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC54900FC7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 09:07:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BPiwB8yM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vx8JV3VDhz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 17:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BPiwB8yM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vx8HS2FS2z3cX9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 17:06:12 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4586sagK007783;
	Sat, 8 Jun 2024 07:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=H
	RDLQSZdkkK3Z4B1ucPGx8HDpF++0JqgxubJlry9nZ4=; b=BPiwB8yMi3xd3EXnp
	gSCMlvgMOSVfY5gILVEaIPyFSVTlJ8w6/LRJDMmyfwZN5c0YodxrN/c5D0BGY3Bm
	vn8eppwfpSfRg8/zktM0sMxH8PcYFwQA2/VBFiBmtP95y8GbX5Y33jFwS2XRPp/c
	hS2nkxkOGBVwUxOtu2PJGiFuFQr1tfGDLXQUnscCWAljFm/2Xc3tAo8ENDljF/jO
	lUf2ozNoeDzvKJUXjEeKBTJHmciXOAxnw/uSx7Xt9fLnxqmKjxMBNovfmNVuSfqW
	gmrlmAdM2AxHfZDKmxJlVPM7iYNCSoxpXVnl0eugV274vXr5UKKreKxf5SHPjAl6
	tB7xA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymhf8046b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:06:03 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 458763uO005770;
	Sat, 8 Jun 2024 07:06:03 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymhf80468-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:06:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4583VZeq011504;
	Sat, 8 Jun 2024 07:06:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ymffnrtcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:06:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45875u0I52363716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Jun 2024 07:05:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10EB82004E;
	Sat,  8 Jun 2024 07:05:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58A7020040;
	Sat,  8 Jun 2024 07:05:53 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.125.209])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat,  8 Jun 2024 07:05:53 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH V3 10/14] tools/perf: Update instruction tracking for
 powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZmFc6kPnh-zIrIG1@google.com>
Date: Sat, 8 Jun 2024 12:35:42 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <100DACC9-508E-4B09-97AA-A771267DF1E8@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-11-atrajeev@linux.vnet.ibm.com>
 <ZmFc6kPnh-zIrIG1@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t3_7sXSsx47BnE8iROdaPgUHjbQbL04S
X-Proofpoint-ORIG-GUID: 4kmrVUikZH3vEqzI3HDCA_LJoRPgyMEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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



> On 6 Jun 2024, at 12:23=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Sat, Jun 01, 2024 at 11:39:37AM +0530, Athira Rajeev wrote:
>> Add instruction tracking function "update_insn_state_powerpc" for
>> powerpc. Example sequence in powerpc:
>>=20
>> ld      r10,264(r3)
>> mr      r31,r3
>> <<after some sequence>
>> ld      r9,312(r31)
>>=20
>> Consider ithe sample is pointing to: "ld r9,312(r31)".
>> Here the memory reference is hit at "312(r31)" where 312 is the =
offset
>> and r31 is the source register. Previous instruction sequence shows =
that
>> register state of r3 is moved to r31. So to identify the data type =
for r31
>> access, the previous instruction ("mr") needs to be tracked and the
>> state type entry has to be updated. Current instruction tracking =
support
>> in perf tools infrastructure is specific to x86. Patch adds this =
support
>> for powerpc as well.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> .../perf/arch/powerpc/annotate/instructions.c | 65 =
+++++++++++++++++++
>> tools/perf/util/annotate-data.c               |  9 ++-
>> tools/perf/util/disasm.c                      |  1 +
>> 3 files changed, 74 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c =
b/tools/perf/arch/powerpc/annotate/instructions.c
>> index db72148eb857..3ecf5a986037 100644
>> --- a/tools/perf/arch/powerpc/annotate/instructions.c
>> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
>> @@ -231,6 +231,71 @@ static struct ins_ops *check_ppc_insn(int =
raw_insn)
>> return NULL;
>> }
>>=20
>> +/*
>> + * Instruction tracking function to track register state moves.
>> + * Example sequence:
>> + *    ld      r10,264(r3)
>> + *    mr      r31,r3
>> + *    <<after some sequence>
>> + *    ld      r9,312(r31)
>> + *
>> + * Previous instruction sequence shows that register state of r3
>> + * is moved to r31. update_insn_state_powerpc tracks these state
>> + * changes
>> + */
>> +#ifdef HAVE_DWARF_SUPPORT
>> +static void update_insn_state_powerpc(struct type_state *state,
>> + struct data_loc_info *dloc, Dwarf_Die * cu_die __maybe_unused,
>> + struct disasm_line *dl)
>> +{
>> + struct annotated_insn_loc loc;
>> + struct annotated_op_loc *src =3D &loc.ops[INSN_OP_SOURCE];
>> + struct annotated_op_loc *dst =3D &loc.ops[INSN_OP_TARGET];
>> + struct type_state_reg *tsr;
>> + u32 insn_offset =3D dl->al.offset;
>> +
>> + if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
>> + return;
>> +
>> + /*
>> +  * Value 444 for bits 21:30 is for "mr"
>> +  * instruction. "mr" is extended OR. So set the
>> +  * source and destination reg correctly
>> +  */
>> + if (PPC_21_30(dl->ops.raw_insn) =3D=3D 444) {
>> + int src_reg =3D src->reg1;
>> +
>> + src->reg1 =3D dst->reg1;
>> + dst->reg1 =3D src_reg;
>> + }
>> +
>> + if (!has_reg_type(state, dst->reg1))
>> + return;
>> +
>> + tsr =3D &state->regs[dst->reg1];
>> +
>> + if (!has_reg_type(state, src->reg1) ||
>> + !state->regs[src->reg1].ok) {
>> + tsr->ok =3D false;
>> + return;
>> + }
>> +
>> + tsr->type =3D state->regs[src->reg1].type;
>> + tsr->kind =3D state->regs[src->reg1].kind;
>> + tsr->ok =3D true;
>> +
>> + pr_debug("mov [%x] reg%d -> reg%d",
>=20
> pr_debug_dtp() ?

Sure, will change this in V4

Thanks
Athira
>=20
> Thanks,
> Namhyung
>=20
>=20
>> + insn_offset, src->reg1, dst->reg1);
>> + pr_debug_type_name(&tsr->type, tsr->kind);
>> +}
>> +#else /* HAVE_DWARF_SUPPORT */
>> +static void update_insn_state_powerpc(struct type_state *state =
__maybe_unused, struct data_loc_info *dloc __maybe_unused,
>> + Dwarf_Die * cu_die __maybe_unused, struct disasm_line *dl =
__maybe_unused)
>> +{
>> + return;
>> +}
>> +#endif /* HAVE_DWARF_SUPPORT */
>> +
>> static int powerpc__annotate_init(struct arch *arch, char *cpuid =
__maybe_unused)
>> {
>> if (!arch->initialized) {
>> diff --git a/tools/perf/util/annotate-data.c =
b/tools/perf/util/annotate-data.c
>> index 7a48c3d72b89..734acdd8c4b7 100644
>> --- a/tools/perf/util/annotate-data.c
>> +++ b/tools/perf/util/annotate-data.c
>> @@ -1080,6 +1080,13 @@ static int find_data_type_insn(struct =
data_loc_info *dloc,
>> return ret;
>> }
>>=20
>> +static int arch_supports_insn_tracking(struct data_loc_info *dloc)
>> +{
>> + if ((arch__is(dloc->arch, "x86")) || (arch__is(dloc->arch, =
"powerpc")))
>> + return 1;
>> + return 0;
>> +}
>> +
>> /*
>>  * Construct a list of basic blocks for each scope with variables and =
try to find
>>  * the data type by updating a type state table through instructions.
>> @@ -1094,7 +1101,7 @@ static int find_data_type_block(struct =
data_loc_info *dloc,
>> int ret =3D -1;
>>=20
>> /* TODO: other architecture support */
>> - if (!arch__is(dloc->arch, "x86"))
>> + if (!arch_supports_insn_tracking(dloc))
>> return -1;
>>=20
>> prev_dst_ip =3D dst_ip =3D dloc->ip;
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index 57af4dc42a58..d8b357055302 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -155,6 +155,7 @@ static struct arch architectures[] =3D {
>> {
>> .name =3D "powerpc",
>> .init =3D powerpc__annotate_init,
>> + .update_insn_state =3D update_insn_state_powerpc,
>> },
>> {
>> .name =3D "riscv64",
>> --=20
>> 2.43.0


