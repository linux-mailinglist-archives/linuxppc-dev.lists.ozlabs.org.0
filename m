Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDFD8CC2C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 16:06:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVCIMDAn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VktGL0ccGz78rt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 23:59:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVCIMDAn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VktFZ3SYRz3vYF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 23:58:57 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MDpU1R003290;
	Wed, 22 May 2024 13:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NlHpFkO2XzyQYTgQjwRf1r6z1Yjofq48OQhaKBG4X9E=;
 b=iVCIMDAnRghT3ya5Qa8lZZyyEYKhYZgqVasVevYFl42l/RSqi8/TZR8RwZAgO/lCvE2R
 j3tpl1X2WYTdO4DMhbSs06Lja5dVpjSdl1JFmXuM9BsgwjVpZUAFQcCAnbTTjMjwVDPc
 Fa/wWk77E8b++xDbI7lq8BWBXTmo4tO40AZIyO7+hl77DO17Vo4mlQr5EZL/owJoxkUY
 ybCi3J7Lot0lXZdSGfDImYuU+oG6u0ukIZmtmm1QldHNmViIbhpq0JF49fp1kWkKN8wb
 /ZHt7u/FukEhKDN8wO6RUQYziYW33kxXJTYSIQUWS6Ub0soVrUSgT5ywWgKsP/csknyn OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9hrm82de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 13:58:43 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44MDwhNq015403;
	Wed, 22 May 2024 13:58:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9hrm82da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 13:58:43 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MCAGMt008090;
	Wed, 22 May 2024 13:58:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y79c33un5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 13:58:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MDwaH727656788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 13:58:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EF2420043;
	Wed, 22 May 2024 13:58:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9605220040;
	Wed, 22 May 2024 13:58:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.69.167])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 May 2024 13:58:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V2 4/9] tools/perf: Add support to capture and parse raw
 instruction in objdump
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Zj4ujanupo0eKyby@x1>
Date: Wed, 22 May 2024 19:28:21 +0530
Message-Id: <476EE92D-D9B6-466F-A827-5BB8A1276D3A@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-5-atrajeev@linux.vnet.ibm.com>
 <f2efdb9d-e636-4678-b492-83d3a28d8134@csgroup.eu>
 <E21FF3FD-1080-4A6C-99B0-7239AD831532@linux.vnet.ibm.com>
 <Zj4ujanupo0eKyby@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TsX9NSCmu8Ggaz0XVdQBGN6J6VyNI3tF
X-Proofpoint-GUID: zOeTV4_tiX1rJjrHub1teADWsZmC57Mh
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_07,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 clxscore=1011 spamscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220093
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
Cc: Ian Rogers <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10 May 2024, at 7:56=E2=80=AFPM, Arnaldo Carvalho de Melo <acme@kernel=
.org> wrote:
>=20
> On Thu, May 09, 2024 at 10:56:23PM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 7 May 2024, at 3:05=E2=80=AFPM, Christophe Leroy <christophe.leroy@c=
sgroup.eu> wrote:
>>>=20
>>>=20
>>>=20
>>> Le 06/05/2024 =C3=A0 14:19, Athira Rajeev a =C3=A9crit :
>>>> Add support to capture and parse raw instruction in objdump.
>>>=20
>>> What's the purpose of using 'objdump' for reading raw instructions ?=20
>>> Can't they be read directly without invoking 'objdump' ? It looks odd t=
o=20
>>> me to use objdump to provide readable text and then parse it back.
>>=20
>> Hi Christophe,
>>=20
>> Thanks for your review comments.
>>=20
>> Current implementation for data type profiling on X86 uses "objdump" too=
l to get the disassembled code.
>=20
> commit 6d17edc113de1e21fc66afa76be475a4f7c91826
> Author: Namhyung Kim <namhyung@kernel.org>
> Date:   Fri Mar 29 14:58:11 2024 -0700
>=20
>    perf annotate: Use libcapstone to disassemble
>=20
>    Now it can use the capstone library to disassemble the instructions.
>    Let's use that (if available) for perf annotate to speed up.  Currently
>    it only supports x86 architecture.  With this change I can see ~3x spe=
ed
>    up in data type profiling.
>=20
>    But note that capstone cannot give the source file and line number inf=
o.
>    For now, users should use the external objdump for that by specifying
>    the --objdump option explicitly.
>=20
>    Signed-off-by: Namhyung Kim <namhyung@kernel.org>
>    Tested-by: Ian Rogers <irogers@google.com>
>    Cc: Adrian Hunter <adrian.hunter@intel.com>
>    Cc: Changbin Du <changbin.du@huawei.com>
>    Cc: Ingo Molnar <mingo@kernel.org>
>    Cc: Jiri Olsa <jolsa@kernel.org>
>    Cc: Kan Liang <kan.liang@linux.intel.com>
>    Cc: Peter Zijlstra <peterz@infradead.org>
>    Link: https://lore.kernel.org/r/20240329215812.537846-5-namhyung@kerne=
l.org
>    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>=20
> From a quick look at http://www.capstone-engine.org/compile.html it
> seems PowerPC is supported.
>=20
> But since we did it first with objdump output parsing, its good to have
> it as an alternative and sometimes a fallback:

Hi Arnaldo, Namhyung

Thanks for the suggestions. libcapstone is a good option and it is faster t=
oo.
I will address these changes in V3.

Thanks
Athira
>=20
> commit f35847de2a65137e011e559f38a3de5902a5463f
> Author: Namhyung Kim <namhyung@kernel.org>
> Date:   Wed Apr 24 17:51:56 2024 -0700
>=20
>    perf annotate: Fallback disassemble to objdump when capstone fails
>=20
>    I found some cases that capstone failed to disassemble.  Probably my
>    capstone is an old version but anyway there's a chance it can fail.  A=
nd
>    then it silently stopped in the middle.  In my case, it didn't
>    understand "RDPKRU" instruction.
>=20
>    Let's check if the capstone disassemble reached the end of the function
>    and fallback to objdump if not
>=20
> ---------------
>=20
> - Arnaldo
>=20
>> And then the objdump result lines are parsed to get the instruction
>> name and register fields. The initial patchset I posted to enable the
>> data type profiling feature in powerpc was using the same way by
>> getting disassembled code from objdump and parsing the disassembled
>> lines. But in V2, we are introducing change for powerpc to use "raw
>> instruction" and fetch opcode, reg fields from the raw instruction.
>=20
>> I tried to explain below that current objdump uses option
>> "--no-show-raw-insn" which doesn't capture raw instruction.  So to
>> capture raw instruction, V2 patchset has changes to use default option
>> "--show-raw-insn" and get the raw instruction [ for powerpc ] along
>> with human readable annotation [ which is used by other archs ]. Since
>> perf tool already has objdump implementation in place, I went in the
>> direction to enhance it to use "--show-raw-insn" for powerpc purpose.
>=20
>> But as you mentioned, we can directly read raw instruction without
>> using "objdump" tool.  perf has support to read object code. The dso
>> open/read utilities and helper functions are already present in
>> "util/dso.c" And "dso__data_read_offset" function reads data from dso
>> file offset. We can use these functions and I can make changes to
>> directly read binary instruction without using objdump.
>=20
>> Namhyung, Arnaldo, Christophe
>> Looking for your valuable feedback on this approach. Please suggest if t=
his approach looks fine
>>=20
>>=20
>> Thanks
>> Athira
>>>=20
>>>> Currently, the perf tool infrastructure uses "--no-show-raw-insn" opti=
on
>>>> with "objdump" while disassemble. Example from powerpc with this option
>>>> for an instruction address is:
>>>=20
>>> Yes and that makes sense because the purpose of objdump is to provide=20
>>> human readable annotations, not to perform automated analysis. Am I=20
>>> missing something ?
>>>=20
>>>>=20
>>>> Snippet from:
>>>> objdump  --start-address=3D<address> --stop-address=3D<address>  -d --=
no-show-raw-insn -C <vmlinux>
>>>>=20
>>>> c0000000010224b4: lwz     r10,0(r9)
>>>>=20
>>>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>>>> registers names and offset. Also to find whether there is a memory
>>>> reference in the operands, "memory_ref_char" field of objdump is used.
>>>> For x86, "(" is used as memory_ref_char to tackle instructions of the
>>>> form "mov  (%rax), %rcx".
>>>>=20
>>>> In case of powerpc, not all instructions using "(" are the only memory
>>>> instructions. Example, above instruction can also be of extended form =
(X
>>>> form) "lwzx r10,0,r19". Inorder to easy identify the instruction categ=
ory
>>>> and extract the source/target registers, patch adds support to use raw
>>>> instruction. With raw instruction, macros are added to extract opcode
>>>> and register fields.
>>>>=20
>>>> "struct ins_operands" and "struct ins" is updated to carry opcode and
>>>> raw instruction binary code (raw_insn). Function "disasm_line__parse"
>>>> is updated to fill the raw instruction hex value and opcode in newly
>>>> added fields. There is no changes in existing code paths, which parses
>>>> the disassembled code. The architecture using the instruction name and
>>>> present approach is not altered. Since this approach targets powerpc,
>>>> the macro implementation is added for powerpc as of now.
>>>>=20
>>>> Example:
>>>> representation using --show-raw-insn in objdump gives result:
>>>>=20
>>>> 38 01 81 e8     ld      r4,312(r1)
>>>>=20
>>>> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
>>>> this translates to instruction form: "ld RT,DS(RA)" and binary code
>>>> as:
>>>> _____________________________________
>>>> | 58 |  RT  |  RA |      DS       | |
>>>> -------------------------------------
>>>> 0    6     11    16              30 31
>>>>=20
>>>> Function "disasm_line__parse" is updated to capture:
>>>>=20
>>>> line:    38 01 81 e8     ld      r4,312(r1)
>>>> opcode and raw instruction "38 01 81 e8"
>>>> Raw instruction is used later to extract the reg/offset fields.
>>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---


