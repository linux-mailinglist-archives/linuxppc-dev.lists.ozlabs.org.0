Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0430C917723
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 06:10:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QXEG5BlM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W87XG3Lvsz3cF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 14:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QXEG5BlM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W87WM5NwXz30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 14:09:35 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q3utJT012611;
	Wed, 26 Jun 2024 04:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=F
	wqBzyFo0lRA1vjiha94hve7wlVfIvDn8pfjdn0wQ/8=; b=QXEG5BlMbwca5x5uD
	xQnaMDo7Ctvf9PC2oE69Yqw93ESREC9wNpwnHLsvFDLMAxsIZEVHQ9bzyEsB9/v+
	MV4eQGYjo/Qst9QcZ+/+BAK32M9J+OQVU601Y9tIup7Uo9bhkhZO33OZ6GCdX9cF
	Yf3rB4NZhscLb+xZaCgEho5zwqE2LsCgLkBLYN6D1rjfn9rBcBhL2JvfKi4K6huL
	gWttcswId8Sz0LQ8s5/0G8oQLdb+RL9BOqWadD0/g/7EyvmiJetQhY1dRwruePOP
	sXoaZD9cNHn3GQOcjO+u2R1Cd8UVd6YxbrjeaANigq2mRvpEzZB3JselHsU4NeSw
	lD/nA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400b42r21r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 04:09:25 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q49Pu2030080;
	Wed, 26 Jun 2024 04:09:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400b42r21p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 04:09:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45Q2e0Z6019800;
	Wed, 26 Jun 2024 04:09:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5mhw9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 04:09:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45Q49JOO56361376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 04:09:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FCBD20040;
	Wed, 26 Jun 2024 04:09:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A2CC20043;
	Wed, 26 Jun 2024 04:09:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.122.99])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Jun 2024 04:09:16 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [V4 03/16] tools/perf: Add support to capture and parse raw
 instruction in powerpc using dso__data_read_offset utility
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZnsO0cmpL640TxJp@google.com>
Date: Wed, 26 Jun 2024 09:39:05 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E86F354-6425-4251-9FA5-BE04F36C80B3@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-4-atrajeev@linux.vnet.ibm.com>
 <ZnpVn1yLtDnRnTBh@google.com>
 <B834FFD2-AC2E-4F7F-9B0B-15CBFB19A6A7@linux.vnet.ibm.com>
 <ZnsO0cmpL640TxJp@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1mN6C35b9BeMyRI5aO6ltTQlA62WeYmr
X-Proofpoint-GUID: ZOr3ZUlYycK4zUBrxNSM94DhFjhP45p-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260029
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



> On 26 Jun 2024, at 12:09=E2=80=AFAM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>=20
> On Tue, Jun 25, 2024 at 06:08:49PM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 25 Jun 2024, at 10:59=E2=80=AFAM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>>>=20
>>> On Fri, Jun 14, 2024 at 10:56:18PM +0530, Athira Rajeev wrote:
>>>> Add support to capture and parse raw instruction in powerpc.
>>>> Currently, the perf tool infrastructure uses two ways to =
disassemble
>>>> and understand the instruction. One is objdump and other option is
>>>> via libcapstone.
>>>>=20
>>>> Currently, the perf tool infrastructure uses "--no-show-raw-insn" =
option
>>>> with "objdump" while disassemble. Example from powerpc with this =
option
>>>> for an instruction address is:
>>>>=20
>>>> Snippet from:
>>>> objdump  --start-address=3D<address> --stop-address=3D<address>  -d =
--no-show-raw-insn -C <vmlinux>
>>>>=20
>>>> c0000000010224b4: lwz     r10,0(r9)
>>>=20
>>> What about removing --no-show-raw-insn and parse the raw byte code =
in
>>> the output for powerpc?  I think it's better to support normal
>>> annotation together.
>> Hi Namhyung,
>>=20
>> Yes, In the other patch in same series, I have added support for =
normal annotation together.
>> Patch 5 includes changes to work with binary code as well as =
mneumonic representation.
>>=20
>> Example representation using --show-raw-insn in objdump gives result:
>>=20
>> 38 01 81 e8 ld r4,312(r1)
>>=20
>> Patch5 has changes to use =E2=80=9Cobjdump=E2=80=9D with =
--show-raw-insn to read the raw instruction and also support normal =
annotation.
>=20
> Ok, that's good!
>=20
>=20
>> In case of data type profiling, with only sort keys, (type, typeoff) =
there is no need to disassemble and then get raw byte code.
>> Binary code can be read directly from the DSO. Compared to using =
objdump, directly reading from DSO will be faster in this case.
>=20
> Sounds like an optimization.  Then I think you'd better handle the
> general case first and optimize later.  Probably you want to merge
> patch 3 and 4 together.
>=20
> Thanks,
> Namhyung

Sure, will do that.

Thanks
Athira
>=20
>=20
>> In summary, current patchset uses below approach:
>>=20
>> 1. Read directly from DSO using dso__data_read_offset if only =
=E2=80=9Ctype, typeoff=E2=80=9D is needed.
>> 2. If in any case reading directly from DSO fails, fallback to using =
libcapstone. Using libcapstone to read is faster than objdump
>> 3. If libcapstone is not supported, approach will use objdump. =
Patchset has changes to handle objdump result created with show-raw-ins =
in powerpc.=20
>> 4. Also for normal perf report or perf annotate, approach will use =
objdump
>>=20
>> NOTE:
>> libcapstone is used currently only for reading raw binary code. =
Disassemble is currently not enabled. While attempting to do cs_disasm, =
observation is that some of the instructions were not identified (ex: =
extswsli, maddld) and it had to fallback to use objdump. Hence enabling =
"cs_disasm" is added in comment section as a TODO for powerpc. Patch =
number 13.=20
>>=20
>> Thanks
>> Athira
>>=20
>>>=20
>>>>=20
>>>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>>>> registers names and offset. Also to find whether there is a memory
>>>> reference in the operands, "memory_ref_char" field of objdump is =
used.
>>>> For x86, "(" is used as memory_ref_char to tackle instructions of =
the
>>>> form "mov  (%rax), %rcx".
>>>>=20
>>>> In case of powerpc, not all instructions using "(" are the only =
memory
>>>> instructions. Example, above instruction can also be of extended =
form (X
>>>> form) "lwzx r10,0,r19". Inorder to easy identify the instruction =
category
>>>> and extract the source/target registers, patch adds support to use =
raw
>>>> instruction for powerpc. Approach used is to read the raw =
instruction
>>>> directly from the DSO file using "dso__data_read_offset" utility =
which
>>>> is already implemented in perf infrastructure in "util/dso.c".
>>>>=20
>>>> Example:
>>>>=20
>>>> 38 01 81 e8     ld      r4,312(r1)
>>>>=20
>>>> Here "38 01 81 e8" is the raw instruction representation. In =
powerpc,
>>>> this translates to instruction form: "ld RT,DS(RA)" and binary code
>>>> as:
>>>>=20
>>>>  | 58 |  RT  |  RA |      DS       | |
>>>>  -------------------------------------
>>>>  0    6     11    16              30 31
>>>>=20
>>>> Function "symbol__disassemble_dso" is updated to read raw =
instruction
>>>> directly from DSO using dso__data_read_offset utility. In case of
>>>> above example, this captures:
>>>> line:    38 01 81 e8
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> tools/perf/util/disasm.c | 98 =
++++++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 98 insertions(+)
>>>>=20
>>>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>>>> index b5fe3a7508bb..f19496133bf0 100644
>>>> --- a/tools/perf/util/disasm.c
>>>> +++ b/tools/perf/util/disasm.c
>>>> @@ -1586,6 +1586,91 @@ static int symbol__disassemble_capstone(char =
*filename, struct symbol *sym,
>>>> }
>>>> #endif
>>>>=20
>>>> +static int symbol__disassemble_dso(char *filename, struct symbol =
*sym,
>>>=20
>>> Maybe rename to symbol__disassemble_raw() ?
>>=20
>> This is specifically using dso__data_read_offset. Hence using =
symbol__disassemble_dso
>>>=20
>>>> + struct annotate_args *args)
>>>> +{
>>>> + struct annotation *notes =3D symbol__annotation(sym);
>>>> + struct map *map =3D args->ms.map;
>>>> + struct dso *dso =3D map__dso(map);
>>>> + u64 start =3D map__rip_2objdump(map, sym->start);
>>>> + u64 end =3D map__rip_2objdump(map, sym->end);
>>>> + u64 len =3D end - start;
>>>> + u64 offset;
>>>> + int i, count;
>>>> + u8 *buf =3D NULL;
>>>> + char disasm_buf[512];
>>>> + struct disasm_line *dl;
>>>> + u32 *line;
>>>> +
>>>> + /* Return if objdump is specified explicitly */
>>>> + if (args->options->objdump_path)
>>>> + return -1;
>>>> +
>>>> + pr_debug("Reading raw instruction from : %s using =
dso__data_read_offset\n", filename);
>>>=20
>>> You may want to print the actual offset and remove the "using
>>> dso__data_read_offset" part.
>>=20
>> Ok Sure
>>>=20
>>> Thanks,
>>> Namhyung
>>>=20
>>>> +
>>>> + buf =3D malloc(len);
>>>> + if (buf =3D=3D NULL)
>>>> + goto err;
>>>> +
>>>> + count =3D dso__data_read_offset(dso, NULL, sym->start, buf, len);
>>>> +
>>>> + line =3D (u32 *)buf;
>>>> +
>>>> + if ((u64)count !=3D len)
>>>> + goto err;
>>>> +
>>>> + /* add the function address and name */
>>>> + scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
>>>> +   start, sym->name);
>>>> +
>>>> + args->offset =3D -1;
>>>> + args->line =3D disasm_buf;
>>>> + args->line_nr =3D 0;
>>>> + args->fileloc =3D NULL;
>>>> + args->ms.sym =3D sym;
>>>> +
>>>> + dl =3D disasm_line__new(args);
>>>> + if (dl =3D=3D NULL)
>>>> + goto err;
>>>> +
>>>> + annotation_line__add(&dl->al, &notes->src->source);
>>>> +
>>>> + /* Each raw instruction is 4 byte */
>>>> + count =3D len/4;
>>>> +
>>>> + for (i =3D 0, offset =3D 0; i < count; i++) {
>>>> + args->offset =3D offset;
>>>> + sprintf(args->line, "%x", line[i]);
>>>> + dl =3D disasm_line__new(args);
>>>> + if (dl =3D=3D NULL)
>>>> + goto err;
>>>> +
>>>> + annotation_line__add(&dl->al, &notes->src->source);
>>>> + offset +=3D 4;
>>>> + }
>>>> +
>>>> + /* It failed in the middle */
>>>> + if (offset !=3D len) {
>>>> + struct list_head *list =3D &notes->src->source;
>>>> +
>>>> + /* Discard all lines and fallback to objdump */
>>>> + while (!list_empty(list)) {
>>>> + dl =3D list_first_entry(list, struct disasm_line, al.node);
>>>> +
>>>> + list_del_init(&dl->al.node);
>>>> + disasm_line__free(dl);
>>>> + }
>>>> + count =3D -1;
>>>> + }
>>>> +
>>>> +out:
>>>> + free(buf);
>>>> + return count < 0 ? count : 0;
>>>> +
>>>> +err:
>>>> + count =3D -1;
>>>> + goto out;
>>>> +}
>>>> /*
>>>> * Possibly create a new version of line with tabs expanded. Returns =
the
>>>> * existing or new line, storage is updated if a new line is =
allocated. If
>>>> @@ -1710,6 +1795,19 @@ int symbol__disassemble(struct symbol *sym, =
struct annotate_args *args)
>>>> strcpy(symfs_filename, tmp);
>>>> }
>>>>=20
>>>> + /*
>>>> +  * For powerpc data type profiling, use the dso__data_read_offset
>>>> +  * to read raw instruction directly and interpret the binary code
>>>> +  * to understand instructions and register fields. For sort keys =
as
>>>> +  * type and typeoff, disassemble to mnemonic notation is
>>>> +  * not required in case of powerpc.
>>>> +  */
>>>> + if (arch__is(args->arch, "powerpc")) {
>>>> + err =3D symbol__disassemble_dso(symfs_filename, sym, args);
>>>> + if (err =3D=3D 0)
>>>> + goto out_remove_tmp;
>>>> + }
>>>> +
>>>> #ifdef HAVE_LIBCAPSTONE_SUPPORT
>>>> err =3D symbol__disassemble_capstone(symfs_filename, sym, args);
>>>> if (err =3D=3D 0)
>>>> --=20
>>>> 2.43.0
>>=20
>>=20
>=20

