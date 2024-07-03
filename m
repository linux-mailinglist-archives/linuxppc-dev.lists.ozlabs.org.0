Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B86925F5A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:58:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P0vDGbdG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDdZf01S2z3dSR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 21:58:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P0vDGbdG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDdYx5F4fz3cZy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 21:57:25 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463AvnS8030397;
	Wed, 3 Jul 2024 11:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=W
	ZqByMisVszq09kN65sBEzVYFscYU29piGSfZF81Do4=; b=P0vDGbdGwp+OLM1KV
	h4T9cjHa2S+JRHQjDnHHizURW0rGNLh+5IqOBbcUx0wNVj9nV6Qx7SJe92AbCYWE
	ufdMG6euHtewN9z4IvpOGMxJCwdnVaqrE/39SF4lau//g+P5pwGA88ObdEkLB/Q0
	g4rJPRJhqv5DbDa9uOcMcVP2KdAbTJn93rjBZu1RuDiynmy/hOUnHd35W6AO88c3
	Q4dwYaK4M+ix+axj9LPy/Ea7vSvPxoisWFOSY+SIMzLYl3cYtgXsa+Cc3mHjDWRa
	5zbQTBk1BZi375+i8au9H2v/mDMs+MytQR9+m0ZfK2KBP9j1n5++hUw29qwjwLBa
	7QcZg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4054ww88hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:57:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 463Bv9Zx027724;
	Wed, 3 Jul 2024 11:57:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4054ww88e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:57:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4639A67R030022;
	Wed, 3 Jul 2024 11:53:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402x3n2a34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:53:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 463Br7Dw31982324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2024 11:53:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C47320040;
	Wed,  3 Jul 2024 11:53:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 829D42005A;
	Wed,  3 Jul 2024 11:53:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.44.47])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  3 Jul 2024 11:53:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH V5 05/17] tools/perf: Add support to capture and parse raw
 instruction in powerpc using dso__data_read_offset utility
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZoSoO7IHKreTpkbt@google.com>
Date: Wed, 3 Jul 2024 17:22:52 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <649287F9-2301-42B8-ABD9-E6B3DC6DA50F@linux.vnet.ibm.com>
References: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
 <20240701043430.66666-6-atrajeev@linux.vnet.ibm.com>
 <ZoSoO7IHKreTpkbt@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VTU_GJi3Ds1tmgOTbK-z8GKoMVIdwKRW
X-Proofpoint-GUID: J-NB3IyAn6c5FQ1E87iGQyCivaw_vhIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_07,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030087
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



> On 3 Jul 2024, at 6:54=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Mon, Jul 01, 2024 at 10:04:18AM +0530, Athira Rajeev wrote:
>> Add support to capture and parse raw instruction in powerpc.
>> Currently, the perf tool infrastructure uses two ways to disassemble
>> and understand the instruction. One is objdump and other option is
>> via libcapstone.
>>=20
>> Currently, the perf tool infrastructure uses "--no-show-raw-insn" =
option
>> with "objdump" while disassemble. Example from powerpc with this =
option
>> for an instruction address is:
>>=20
>> Snippet from:
>> objdump  --start-address=3D<address> --stop-address=3D<address>  -d =
--no-show-raw-insn -C <vmlinux>
>>=20
>> c0000000010224b4: lwz     r10,0(r9)
>>=20
>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>> registers names and offset. Also to find whether there is a memory
>> reference in the operands, "memory_ref_char" field of objdump is =
used.
>> For x86, "(" is used as memory_ref_char to tackle instructions of the
>> form "mov  (%rax), %rcx".
>>=20
>> In case of powerpc, not all instructions using "(" are the only =
memory
>> instructions. Example, above instruction can also be of extended form =
(X
>> form) "lwzx r10,0,r19". Inorder to easy identify the instruction =
category
>> and extract the source/target registers, patch adds support to use =
raw
>> instruction for powerpc. Approach used is to read the raw instruction
>> directly from the DSO file using "dso__data_read_offset" utility =
which
>> is already implemented in perf infrastructure in "util/dso.c".
>>=20
>> Example:
>>=20
>> 38 01 81 e8     ld      r4,312(r1)
>>=20
>> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
>> this translates to instruction form: "ld RT,DS(RA)" and binary code
>> as:
>>=20
>>   | 58 |  RT  |  RA |      DS       | |
>>   -------------------------------------
>>   0    6     11    16              30 31
>>=20
>> Function "symbol__disassemble_dso" is updated to read raw instruction
>> directly from DSO using dso__data_read_offset utility. In case of
>> above example, this captures:
>> line:    38 01 81 e8
>>=20
>> The above works well when perf report is invoked with only sort keys =
for
>> data type ie type and typeoff. Because there is no instruction level
>> annotation needed if only data type information is requested for. For
>> annotating sample, along with type and typeoff sort key, "sym" sort =
key
>> is also needed. And by default invoking just "perf report" uses sort =
key
>> "sym" that displays the symbol information.
>>=20
>> With approach changes in powerpc which first reads DSO for raw
>> instruction, "perf annotate" and "perf report" + a key breaks since
>> it doesn't do the instruction level disassembly.
>>=20
>> Snippet of result from perf report:
>>=20
>> Samples: 1K of event 'mem-loads', 4000 Hz, Event count (approx.): =
937238
>> do_work  /usr/bin/pmlogger [Percent: local period]
>> Percent=E2=94=82        ea230010
>>       =E2=94=82        3a550010
>>       =E2=94=82        3a600000
>>=20
>>       =E2=94=82        38f60001
>>       =E2=94=82        39490008
>>       =E2=94=82        42400438
>> 51.44 =E2=94=82        81290008
>>       =E2=94=82        7d485378
>>=20
>> Here, raw instruction is displayed in the output instead of human
>> readable annotated form.
>>=20
>> One way to get the appropriate data is to specify "--objdump path", =
by
>> which code annotation will be done. But the default behaviour will be
>> changed. To fix this breakage, check if "sym" sort key is set. If so
>> fallback and use the libcapstone/objdump way of disassmbling the =
sample.
>>=20
>> With the changes and "perf report"
>>=20
>> Samples: 1K of event 'mem-loads', 4000 Hz, Event count (approx.): =
937238
>> do_work  /usr/bin/pmlogger [Percent: local period]
>> Percent=E2=94=82        ld        r17,16(r3)
>>       =E2=94=82        addi      r18,r21,16
>>       =E2=94=82        li        r19,0
>>=20
>>       =E2=94=82 8b0:   rldicl    r10,r10,63,33
>>       =E2=94=82        addi      r10,r10,1
>>       =E2=94=82        mtctr     r10
>>       =E2=94=82      =E2=86=93 b         8e4
>>       =E2=94=82 8c0:   addi      r7,r22,1
>>       =E2=94=82        addi      r10,r9,8
>>       =E2=94=82      =E2=86=93 bdz       d00
>> 51.44 =E2=94=82        lwz       r9,8(r9)
>>       =E2=94=82        mr        r8,r10
>>       =E2=94=82        cmpw      r20,r9
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/util/disasm.c | 101 =
+++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 101 insertions(+)
>>=20
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index ddb861a0b043..e400dcab4029 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -25,6 +25,7 @@
>> #include "srcline.h"
>> #include "symbol.h"
>> #include "util.h"
>> +#include "sort.h"
>>=20
>> static regex_t  file_lineno;
>>=20
>> @@ -1645,6 +1646,91 @@ static int symbol__disassemble_capstone(char =
*filename, struct symbol *sym,
>> }
>> #endif
>>=20
>> +static int symbol__disassemble_dso(char *filename, struct symbol =
*sym,
>=20
> Again, I still think this should be named to symbol__disassemble_raw()
> because it only uses the raw binary codes.  Using =
dso__data_read_offset
> is not important here and it's just a way of implementing it.
>=20
> Thanks,
> Namhyung
>=20
Hi Namhyung

Thanks for review comments

Sure, will change to symbol__disassemble_raw

Athira
>=20
>> + struct annotate_args *args)
>> +{
>> + struct annotation *notes =3D symbol__annotation(sym);
>> + struct map *map =3D args->ms.map;
>> + struct dso *dso =3D map__dso(map);
>> + u64 start =3D map__rip_2objdump(map, sym->start);
>> + u64 end =3D map__rip_2objdump(map, sym->end);
>> + u64 len =3D end - start;
>> + u64 offset;
>> + int i, count;
>> + u8 *buf =3D NULL;
>> + char disasm_buf[512];
>> + struct disasm_line *dl;
>> + u32 *line;
>> +
>> + /* Return if objdump is specified explicitly */
>> + if (args->options->objdump_path)
>> + return -1;
>> +
>> + pr_debug("Reading raw instruction from : %s using =
dso__data_read_offset\n", filename);
>> +
>> + buf =3D malloc(len);
>> + if (buf =3D=3D NULL)
>> + goto err;
>> +
>> + count =3D dso__data_read_offset(dso, NULL, sym->start, buf, len);
>> +
>> + line =3D (u32 *)buf;
>> +
>> + if ((u64)count !=3D len)
>> + goto err;
>> +
>> + /* add the function address and name */
>> + scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
>> +   start, sym->name);
>> +
>> + args->offset =3D -1;
>> + args->line =3D disasm_buf;
>> + args->line_nr =3D 0;
>> + args->fileloc =3D NULL;
>> + args->ms.sym =3D sym;
>> +
>> + dl =3D disasm_line__new(args);
>> + if (dl =3D=3D NULL)
>> + goto err;
>> +
>> + annotation_line__add(&dl->al, &notes->src->source);
>> +
>> + /* Each raw instruction is 4 byte */
>> + count =3D len/4;
>> +
>> + for (i =3D 0, offset =3D 0; i < count; i++) {
>> + args->offset =3D offset;
>> + sprintf(args->line, "%x", line[i]);
>> + dl =3D disasm_line__new(args);
>> + if (dl =3D=3D NULL)
>> + goto err;
>> +
>> + annotation_line__add(&dl->al, &notes->src->source);
>> + offset +=3D 4;
>> + }
>> +
>> + /* It failed in the middle */
>> + if (offset !=3D len) {
>> + struct list_head *list =3D &notes->src->source;
>> +
>> + /* Discard all lines and fallback to objdump */
>> + while (!list_empty(list)) {
>> + dl =3D list_first_entry(list, struct disasm_line, al.node);
>> +
>> + list_del_init(&dl->al.node);
>> + disasm_line__free(dl);
>> + }
>> + count =3D -1;
>> + }
>> +
>> +out:
>> + free(buf);
>> + return count < 0 ? count : 0;
>> +
>> +err:
>> + count =3D -1;
>> + goto out;
>> +}
>> /*
>>  * Possibly create a new version of line with tabs expanded. Returns =
the
>>  * existing or new line, storage is updated if a new line is =
allocated. If
>> @@ -1769,6 +1855,21 @@ int symbol__disassemble(struct symbol *sym, =
struct annotate_args *args)
>> strcpy(symfs_filename, tmp);
>> }
>>=20
>> + /*
>> +  * For powerpc data type profiling, use the dso__data_read_offset
>> +  * to read raw instruction directly and interpret the binary code
>> +  * to understand instructions and register fields. For sort keys as
>> +  * type and typeoff, disassemble to mnemonic notation is
>> +  * not required in case of powerpc.
>> +  */
>> + if (arch__is(args->arch, "powerpc")) {
>> + if (sort_order && !strstr(sort_order, "sym")) {
>> + err =3D symbol__disassemble_dso(symfs_filename, sym, args);
>> + if (err =3D=3D 0)
>> + goto out_remove_tmp;
>> + }
>> + }
>> +
>> #ifdef HAVE_LIBCAPSTONE_SUPPORT
>> err =3D symbol__disassemble_capstone(symfs_filename, sym, args);
>> if (err =3D=3D 0)
>> --=20
>> 2.43.0


