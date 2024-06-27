Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5A91A2A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 11:29:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HcbNhu5l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8tYs5x0Zz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 19:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HcbNhu5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8tY86q47z3cXW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 19:28:43 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R9Qg2V018757;
	Thu, 27 Jun 2024 09:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=6nXA0GyEk0ZZ5CUgQYPVwiV9IxfrcSBBRlug2qCH6XU=; b=HcbNhu5lx9Yl
	GSfXz++RHKELXGXRKvnGQsdcysbYULSezHg7WCaiBcufqxdgBvv0wXhCGwmYDN6v
	eVFN0XW45Ju9YqL0Pao02XlfLqgC2koTf/FXTHw3uhlEPIiDBffHYABgO87pCsym
	2TlTWBQdpRP+fKfKXas858uuhjygoLww2tjVlAHy826e2WcjXefhMpMJrn56VlEw
	nqSt9B1cVTKzXJigb3deMQGof2gaVPbzRfU18I/TVQkldPT9cMLsfhlIf/k8YM4d
	JTS2LBdKpE8vG517eHih0lnzmZT/ezIpYAj0srbuQHpeIu83gfImTdd28XsCOMeA
	k1FIyGPVlQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4010718ra0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:28:32 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45R9SVEh021997;
	Thu, 27 Jun 2024 09:28:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4010718r9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:28:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45R8ACbI019602;
	Thu, 27 Jun 2024 09:28:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9xqa0b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:28:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45R9SPat57934122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 09:28:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C55A20040;
	Thu, 27 Jun 2024 09:28:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C927020043;
	Thu, 27 Jun 2024 09:28:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.84])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 27 Jun 2024 09:28:22 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [V4 05/16] tools/perf: Add disasm_line__parse to parse raw
 instruction for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZnyFVE22bcdilUyL@google.com>
Date: Thu, 27 Jun 2024 14:58:11 +0530
Message-Id: <C46D922C-E83C-45F7-A526-EBC9D448A2B1@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-6-atrajeev@linux.vnet.ibm.com>
 <ZnpYBvXLhyAqZzvh@google.com>
 <E2A1A4AA-E344-4B42-86CE-E0EDD82A398F@linux.vnet.ibm.com>
 <ZnsQOD3arkR0qoPJ@google.com>
 <40DB645D-BFA7-44EA-B937-ADE81EEC1316@linux.vnet.ibm.com>
 <ZnyFVE22bcdilUyL@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gdn_tyDKtPNOoh3q3Qn5EqjcZRmGejMj
X-Proofpoint-GUID: 1b_93eSuEa8KBJFI6yqpVJ2ldkjM8AJS
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_05,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270070
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



> On 27 Jun 2024, at 2:47=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> wr=
ote:
>=20
> Hello,
>=20
> On Wed, Jun 26, 2024 at 09:38:28AM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 26 Jun 2024, at 12:15=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org>=
 wrote:
>>>=20
>>> On Tue, Jun 25, 2024 at 06:12:51PM +0530, Athira Rajeev wrote:
>>>>=20
>>>>=20
>>>>> On 25 Jun 2024, at 11:09=E2=80=AFAM, Namhyung Kim <namhyung@kernel.or=
g> wrote:
>>>>>=20
>>>>> On Fri, Jun 14, 2024 at 10:56:20PM +0530, Athira Rajeev wrote:
>>>>>> Currently, the perf tool infrastructure disasm_line__parse function =
to
>>>>>> parse disassembled line.
>>>>>>=20
>>>>>> Example snippet from objdump:
>>>>>> objdump  --start-address=3D<address> --stop-address=3D<address>  -d =
--no-show-raw-insn -C <vmlinux>
>>>>>>=20
>>>>>> c0000000010224b4: lwz     r10,0(r9)
>>>>>>=20
>>>>>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>>>>>> registers names and offset. In powerpc, the approach for data type
>>>>>> profiling uses raw instruction instead of result from objdump to ide=
ntify
>>>>>> the instruction category and extract the source/target registers.
>>>>>>=20
>>>>>> Example: 38 01 81 e8     ld      r4,312(r1)
>>>>>>=20
>>>>>> Here "38 01 81 e8" is the raw instruction representation. Add functi=
on
>>>>>> "disasm_line__parse_powerpc" to handle parsing of raw instruction.
>>>>>> Also update "struct disasm_line" to save the binary code/
>>>>>> With the change, function captures:
>>>>>>=20
>>>>>> line -> "38 01 81 e8     ld      r4,312(r1)"
>>>>>> raw instruction "38 01 81 e8"
>>>>>>=20
>>>>>> Raw instruction is used later to extract the reg/offset fields. Macr=
os
>>>>>> are added to extract opcode and register fields. "struct disasm_line"
>>>>>> is updated to carry union of "bytes" and "raw_insn" of 32 bit to car=
ry raw
>>>>>> code (raw). Function "disasm_line__parse_powerpc fills the raw
>>>>>> instruction hex value and can use macros to get opcode. There is no
>>>>>> changes in existing code paths, which parses the disassembled code.
>>>>>> The architecture using the instruction name and present approach is
>>>>>> not altered. Since this approach targets powerpc, the macro
>>>>>> implementation is added for powerpc as of now.
>>>>>>=20
>>>>>> Since the disasm_line__parse is used in other cases (perf annotate) =
and
>>>>>> not only data tye profiling, the powerpc callback includes changes to
>>>>>> work with binary code as well as mneumonic representation. Also in c=
ase
>>>>>> if the DSO read fails and libcapstone is not supported, the approach
>>>>>> fallback to use objdump as option. Hence as option, patch has change=
s to
>>>>>> ensure objdump option also works well.
>>>>>>=20
>>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>>>> ---
> [SNIP]
>>>>>> +/*
>>>>>> + * Parses the result captured from symbol__disassemble_*
>>>>>> + * Example, line read from DSO file in powerpc:
>>>>>> + * line:    38 01 81 e8
>>>>>> + * opcode: fetched from arch specific get_opcode_insn
>>>>>> + * rawp_insn: e8810138
>>>>>> + *
>>>>>> + * rawp_insn is used later to extract the reg/offset fields
>>>>>> + */
>>>>>> +#define PPC_OP(op) (((op) >> 26) & 0x3F)
>>>>>> +
>>>>>> +static int disasm_line__parse_powerpc(struct disasm_line *dl)
>>>>>> +{
>>>>>> + char *line =3D dl->al.line;
>>>>>> + const char **namep =3D &dl->ins.name;
>>>>>> + char **rawp =3D &dl->ops.raw;
>>>>>> + char tmp, *tmp_raw_insn, *name_raw_insn =3D skip_spaces(line);
>>>>>> + char *name =3D skip_spaces(name_raw_insn + 11);
>>>>>> + int objdump =3D 0;
>>>>>> +
>>>>>> + if (strlen(line) > 11)
>>>>>> + objdump =3D 1;
>>>>>> +
>>>>>> + if (name_raw_insn[0] =3D=3D '\0')
>>>>>> + return -1;
>>>>>> +
>>>>>> + if (objdump) {
>>>>>> + *rawp =3D name + 1;
>>>>>> + while ((*rawp)[0] !=3D '\0' && !isspace((*rawp)[0]))
>>>>>> + ++*rawp;
>>>>>> + tmp =3D (*rawp)[0];
>>>>>> + (*rawp)[0] =3D '\0';
>>>>>> +
>>>>>> + *namep =3D strdup(name);
>>>>>> + if (*namep =3D=3D NULL)
>>>>>> + return -1;
>>>>>> +
>>>>>> + (*rawp)[0] =3D tmp;
>>>>>> + *rawp =3D strim(*rawp);
>>>>>> + } else
>>>>>> + *namep =3D "";
>>>=20
>>> Then can you handle this logic under if (annotate_opts.show_raw_insn)
>>> in disasm_line__parse() instead of adding a new function?
>>>=20
>>> Thanks,
>>> Namhyung
>>=20
>> Hi Namhyung,
>>=20
>> We discussed to have a per-arch disasm_line_parse() here:
>> https://lore.kernel.org/all/CAM9d7ci1LDa7moT2qDr2qK+DTNLU6ZBkmROnbdozAju=
QLQfNog@mail.gmail.com/#t
>>=20
>> So I added it as a new function : disasm_line__parse_powerpc
>> Since it is not used by other archs, we can go with having new function ?
>=20
> Ok, I thought it'd be quite different from disasm_line__parse() but it
> seems that it's mostly similar except for the raw insn.  So I think it's
> better to add the logic to the generic disasm_line__parse().  Sorry for
> the inconvenience.
>=20
> Thanks,
> Namhyung

Sure

Thanks
Athira
>=20
>>>>>> +
>>>>>> + tmp_raw_insn =3D strdup(name_raw_insn);
>>>>>> + tmp_raw_insn[11] =3D '\0';
>>>>>> + remove_spaces(tmp_raw_insn);
>>>>>> +
>>>>>> + dl->raw.raw_insn =3D strtol(tmp_raw_insn, NULL, 16);
>>>>>> + if (objdump)
>>>>>> + dl->raw.raw_insn =3D be32_to_cpu(strtol(tmp_raw_insn, NULL, 16));
>>>>>=20
>>>>> Hmm.. can you use a sscanf() instead?
>>>>>=20
>>>>> sscanf(line, "%x %x %x %x", &dl->raw.bytes[0], &dl->raw.bytes[1], ...)
>>>>>=20
>>>>> Thanks,
>>>>> Namhyung
>>>>>=20
>>>> Sure will address in V5
>>>>=20
>>>> Thanks
>>>> Athira
>>>>>> +
>>>>>> + return 0;
>>>>>> +}


