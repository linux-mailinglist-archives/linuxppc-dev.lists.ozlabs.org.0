Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E6902186
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 14:22:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C3N8isd5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyWBw4kK5z3cSX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 22:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C3N8isd5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyWB92S2Cz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 22:21:20 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AARpbM025838;
	Mon, 10 Jun 2024 12:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=1FPNSqkZ3jNtmraPgUbOXw7UJahn6qcwJXgKR4TOWOM=; b=C3N8isd52HjG
	ovPcynQk5jHHOSXmG/ohunSkTtyKMDCTUth2gNxIUllJTksWngkga9F2HkxGbY5J
	a3SARdLzCH4I2oop4TbMHmQzsBPsUeM40uotsEjTfxrcraSWEeNliL4z4n8E+BhN
	ww4pJPFpIvcynWhaUj4Pc6nv/nvmWTYmBVfEOC6S11JOszVOcBvoxCcwvRUcGBHb
	+cObyww0nahykqrREtVQW9QXFGHztK6HZ7cE1H65HUNGB/GtF27HvsNb1Zq5uLNT
	5Rvd6ZTF7jHF0XIY2C0Mon3qA8Jd5eWjOcD/U0zOQ4mmyii3mjAwDh96h4OoBwQ5
	E+FjoipBuQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ynyr7r932-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 12:21:01 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45ACL13Q001156;
	Mon, 10 Jun 2024 12:21:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ynyr7r92y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 12:21:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45AAlesC003881;
	Mon, 10 Jun 2024 12:21:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn2mpfesu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 12:21:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45ACKsiX32702856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jun 2024 12:20:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72ACC2004D;
	Mon, 10 Jun 2024 12:20:54 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9F5F20043;
	Mon, 10 Jun 2024 12:20:51 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.90.99])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Jun 2024 12:20:51 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V3 11/14] tools/perf: Add support to use libcapstone in
 powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <c383b404-727c-4564-a66e-0906348891b3@intel.com>
Date: Mon, 10 Jun 2024 17:50:39 +0530
Message-Id: <81ED04E0-23B5-44AE-B84D-5766346F1D32@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-12-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXGPHMF+5cUu42ns0=qm9QCPg0LNUveLLnjdGHPCnVg3w@mail.gmail.com>
 <c383b404-727c-4564-a66e-0906348891b3@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jGhmPXuBwGKYyj4Pj4WkyqWj4PrkJcqL
X-Proofpoint-GUID: 1Kdu1aH1j3OFuOv9nsX_mu8SamwhxEnk
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100090
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 3 Jun 2024, at 10:28=E2=80=AFPM, Adrian Hunter <adrian.hunter@intel.co=
m> wrote:
>=20
> On 3/06/24 19:30, Ian Rogers wrote:
>> On Fri, May 31, 2024 at 11:10=E2=80=AFPM Athira Rajeev
>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Now perf uses the capstone library to disassemble the instructions in
>>> x86. capstone is used (if available) for perf annotate to speed up.
>>> Currently it only supports x86 architecture. Patch includes changes to
>>> enable this in powerpc. For now, only for data type sort keys, this
>>> method is used and only binary code (raw instruction) is read. This is
>>> because powerpc approach to understand instructions and reg fields uses
>>> raw instruction. The "cs_disasm" is currently not enabled. While
>>> attempting to do cs_disasm, observation is that some of the instructions
>>> were not identified (ex: extswsli, maddld) and it had to fallback to use
>>> objdump. Hence enabling "cs_disasm" is added in comment section as a
>>> TODO for powerpc.
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>> tools/perf/util/disasm.c | 148 ++++++++++++++++++++++++++++++++++++++-
>>> 1 file changed, 146 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>>> index d8b357055302..915508d2e197 100644
>>> --- a/tools/perf/util/disasm.c
>>> +++ b/tools/perf/util/disasm.c
>>> @@ -1540,12 +1540,18 @@ static int open_capstone_handle(struct annotate=
_args *args, bool is_64bit,
>>> {
>>>        struct annotation_options *opt =3D args->options;
>>>        cs_mode mode =3D is_64bit ? CS_MODE_64 : CS_MODE_32;
>>> +       int ret;
>>>=20
>>>        /* TODO: support more architectures */
>>> -       if (!arch__is(args->arch, "x86"))
>>> +       if ((!arch__is(args->arch, "x86")) && (!arch__is(args->arch, "p=
owerpc")))
>>>                return -1;
>>>=20
>>> -       if (cs_open(CS_ARCH_X86, mode, handle) !=3D CS_ERR_OK)
>>> +       if (arch__is(args->arch, "x86"))
>>> +               ret =3D cs_open(CS_ARCH_X86, mode, handle);
>>> +       else
>>> +               ret =3D cs_open(CS_ARCH_PPC, mode, handle);
>>> +
>>> +       if (ret !=3D CS_ERR_OK)
>>>                return -1;
>>=20
>> There looks to be a pretty/more robust capstone_init function in
>> print_insn.c, should we factor this code out and recycle:
>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git=
/tree/tools/perf/util/print_insn.c?h=3Dperf-tools-next#n40
>=20
> On a slightly related note, there is a compile error
> been around for a while in util/disasm.c on Ubuntu 22.04
>=20
> In file included from /usr/include/capstone/capstone.h:279,
>                 from util/disasm.c:1354:
> /usr/include/capstone/bpf.h:94:14: error: =E2=80=98bpf_insn=E2=80=99 defi=
ned as wrong
> kind of tag
>   94 | typedef enum bpf_insn {
>      |              ^~~~~~~~
>=20

Hi Adrian

I tried compilation on Ubuntu 22.04, but didn=E2=80=99t face this issue.
The libcapstone version I have is libcapstone4 which doesn=E2=80=99t have t=
he include for =E2=80=9Cbpf.h=E2=80=9D
What is the version of libcapstone in the setup where you are seeing this i=
ssue ?

Thanks
Athira
>>=20
>> Thanks,
>> Ian
>>=20
>>>        if (!opt->disassembler_style ||
>>> @@ -1635,6 +1641,139 @@ static void print_capstone_detail(cs_insn *insn=
, char *buf, size_t len,
>>>        }
>>> }
>>>=20
>>> +static int symbol__disassemble_capstone_powerpc(char *filename, struct=
 symbol *sym,
>>> +                                       struct annotate_args *args)
>>> +{
>>> +       struct annotation *notes =3D symbol__annotation(sym);
>>> +       struct map *map =3D args->ms.map;
>>> +       struct dso *dso =3D map__dso(map);
>>> +       struct nscookie nsc;
>>> +       u64 start =3D map__rip_2objdump(map, sym->start);
>>> +       u64 end =3D map__rip_2objdump(map, sym->end);
>>> +       u64 len =3D end - start;
>>> +       u64 offset;
>>> +       int i, fd, count;
>>> +       bool is_64bit =3D false;
>>> +       bool needs_cs_close =3D false;
>>> +       u8 *buf =3D NULL;
>>> +       struct find_file_offset_data data =3D {
>>> +               .ip =3D start,
>>> +       };
>>> +       csh handle;
>>> +       char disasm_buf[512];
>>> +       struct disasm_line *dl;
>>> +       u32 *line;
>>> +
>>> +       if (args->options->objdump_path)
>>> +               return -1;
>>> +
>>> +       nsinfo__mountns_enter(dso->nsinfo, &nsc);
>>> +       fd =3D open(filename, O_RDONLY);
>>> +       nsinfo__mountns_exit(&nsc);
>>> +       if (fd < 0)
>>> +               return -1;
>>> +
>>> +       if (file__read_maps(fd, /*exe=3D*/true, find_file_offset, &data,
>>> +                           &is_64bit) =3D=3D 0)
>>> +               goto err;
>>> +
>>> +       if (open_capstone_handle(args, is_64bit, &handle) < 0)
>>> +               goto err;
>>> +
>>> +       needs_cs_close =3D true;
>>> +
>>> +       buf =3D malloc(len);
>>> +       if (buf =3D=3D NULL)
>>> +               goto err;
>>> +
>>> +       count =3D pread(fd, buf, len, data.offset);
>>> +       close(fd);
>>> +       fd =3D -1;
>>> +
>>> +       if ((u64)count !=3D len)
>>> +               goto err;
>>> +
>>> +       line =3D (u32 *)buf;
>>> +
>>> +       /* add the function address and name */
>>> +       scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
>>> +                 start, sym->name);
>>> +
>>> +       args->offset =3D -1;
>>> +       args->line =3D disasm_buf;
>>> +       args->line_nr =3D 0;
>>> +       args->fileloc =3D NULL;
>>> +       args->ms.sym =3D sym;
>>> +
>>> +       dl =3D disasm_line__new(args);
>>> +       if (dl =3D=3D NULL)
>>> +               goto err;
>>> +
>>> +       annotation_line__add(&dl->al, &notes->src->source);
>>> +
>>> +       /*
>>> +        * TODO: enable disassm for powerpc
>>> +        * count =3D cs_disasm(handle, buf, len, start, len, &insn);
>>> +        *
>>> +        * For now, only binary code is saved in disassembled line
>>> +        * to be used in "type" and "typeoff" sort keys. Each raw code
>>> +        * is 32 bit instruction. So use "len/4" to get the number of
>>> +        * entries.
>>> +        */
>>> +       count =3D len/4;
>>> +
>>> +       for (i =3D 0, offset =3D 0; i < count; i++) {
>>> +               args->offset =3D offset;
>>> +               sprintf(args->line, "%x", line[i]);
>>> +
>>> +               dl =3D disasm_line__new(args);
>>> +               if (dl =3D=3D NULL)
>>> +                       goto err;
>>> +
>>> +               annotation_line__add(&dl->al, &notes->src->source);
>>> +
>>> +               offset +=3D 4;
>>> +       }
>>> +
>>> +       /* It failed in the middle */
>>> +       if (offset !=3D len) {
>>> +               struct list_head *list =3D &notes->src->source;
>>> +
>>> +               /* Discard all lines and fallback to objdump */
>>> +               while (!list_empty(list)) {
>>> +                       dl =3D list_first_entry(list, struct disasm_lin=
e, al.node);
>>> +
>>> +                       list_del_init(&dl->al.node);
>>> +                       disasm_line__free(dl);
>>> +               }
>>> +               count =3D -1;
>>> +       }
>>> +
>>> +out:
>>> +       if (needs_cs_close)
>>> +               cs_close(&handle);
>>> +       free(buf);
>>> +       return count < 0 ? count : 0;
>>> +
>>> +err:
>>> +       if (fd >=3D 0)
>>> +               close(fd);
>>> +       if (needs_cs_close) {
>>> +               struct disasm_line *tmp;
>>> +
>>> +               /*
>>> +                * It probably failed in the middle of the above loop.
>>> +                * Release any resources it might add.
>>> +                */
>>> +               list_for_each_entry_safe(dl, tmp, &notes->src->source, =
al.node) {
>>> +                       list_del(&dl->al.node);
>>> +                       free(dl);
>>> +               }
>>> +       }
>>> +       count =3D -1;
>>> +       goto out;
>>> +}
>>> +
>>> static int symbol__disassemble_capstone(char *filename, struct symbol *=
sym,
>>>                                        struct annotate_args *args)
>>> {
>>> @@ -1987,6 +2126,11 @@ int symbol__disassemble(struct symbol *sym, stru=
ct annotate_args *args)
>>>                        err =3D symbol__disassemble_dso(symfs_filename, =
sym, args);
>>>                        if (err =3D=3D 0)
>>>                                goto out_remove_tmp;
>>> +#ifdef HAVE_LIBCAPSTONE_SUPPORT
>>> +                       err =3D symbol__disassemble_capstone_powerpc(sy=
mfs_filename, sym, args);
>>> +                       if (err =3D=3D 0)
>>> +                               goto out_remove_tmp;
>>> +#endif
>>>                }
>>>        }
>>>=20
>>> --
>>> 2.43.0


