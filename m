Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716688C1408
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 19:27:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SkeswZQR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZzVT0dt1z3cYn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 03:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SkeswZQR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZzTh73Gdz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 03:27:04 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 449H9XwG012277;
	Thu, 9 May 2024 17:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=yyJzE/Q3LJuO/4bjbUhk+9UHoyffAi+6A9klRNNhLRs=;
 b=SkeswZQRIIhnTp3GI3LuNxwD8C19bRMfXIjNAjwa6lVvgJKRkVVA/1xXQLEZ5WKt/u6Q
 vdl+VM67DP5IFERDnZfq6GiRd1rTv/eCio916PfOGOACGVj1xJEd3WdkBEZlOu75pDj4
 46OsusweuIESMKTd85B+/G0GU4EOfgVJ+B9TFB0ullTFCMOMmipDIJCMa3nQtCJ9V6QQ
 OUhBY83ZOZHa6NjJQTwRCmU4rj4RDBRsUUejh+KJi0bXK7Bc3jJQKJ4ejwFN27rxx9v2
 oDbuiEemAUADAGUOlGLHpYiSlEr0u9MgCVqBpgD5JqZcm0lf0/SF2r4MjMFGUGWahD0f RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y12mpr1em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 17:26:45 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 449HMJtg001782;
	Thu, 9 May 2024 17:26:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y12mpr1eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 17:26:45 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 449F3aV2003958;
	Thu, 9 May 2024 17:26:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysgsm535-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 17:26:44 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 449HQc7U55378230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 17:26:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7051120040;
	Thu,  9 May 2024 17:26:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BAF220043;
	Thu,  9 May 2024 17:26:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.68.71])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  9 May 2024 17:26:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH V2 4/9] tools/perf: Add support to capture and parse raw
 instruction in objdump
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <f2efdb9d-e636-4678-b492-83d3a28d8134@csgroup.eu>
Date: Thu, 9 May 2024 22:56:23 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E21FF3FD-1080-4A6C-99B0-7239AD831532@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-5-atrajeev@linux.vnet.ibm.com>
 <f2efdb9d-e636-4678-b492-83d3a28d8134@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HG8XNE2xV33rwiOuOQexiRxqJmXi4bON
X-Proofpoint-ORIG-GUID: LPnKlB7fLfjzmjaFsMWTfxcmHXugoV7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_09,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405090120
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
Cc: "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 7 May 2024, at 3:05=E2=80=AFPM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 06/05/2024 =C3=A0 14:19, Athira Rajeev a =C3=A9crit :
>> Add support to capture and parse raw instruction in objdump.
>=20
> What's the purpose of using 'objdump' for reading raw instructions ?=20=

> Can't they be read directly without invoking 'objdump' ? It looks odd =
to=20
> me to use objdump to provide readable text and then parse it back.

Hi Christophe,

Thanks for your review comments.

Current implementation for data type profiling on X86 uses "objdump" =
tool to get the disassembled code.
And then the objdump result lines are parsed to get the instruction name =
and register fields. The initial patchset I posted to enable the data =
type profiling feature in powerpc was using the same way by getting =
disassembled code from objdump and parsing the disassembled lines. But =
in V2, we are introducing change for powerpc to use "raw instruction" =
and fetch opcode, reg fields from the raw instruction.

I tried to explain below that current objdump uses option =
"--no-show-raw-insn" which doesn't capture raw instruction.  So to =
capture raw instruction, V2 patchset has changes to use default option =
"--show-raw-insn" and get the raw instruction [ for powerpc ] along with =
human readable annotation [ which is used by other archs ]. Since perf =
tool already has objdump implementation in place, I went in the =
direction to enhance it to use "--show-raw-insn" for powerpc purpose.

But as you mentioned, we can directly read raw instruction without using =
"objdump" tool.
perf has support to read object code. The dso open/read utilities and =
helper functions are already present in "util/dso.c" And =
"dso__data_read_offset" function reads data from dso file offset. We can =
use these functions and I can make changes to directly read binary =
instruction without using objdump.

Namhyung, Arnaldo, Christophe
Looking for your valuable feedback on this approach. Please suggest if =
this approach looks fine


Thanks
Athira
>=20
>> Currently, the perf tool infrastructure uses "--no-show-raw-insn" =
option
>> with "objdump" while disassemble. Example from powerpc with this =
option
>> for an instruction address is:
>=20
> Yes and that makes sense because the purpose of objdump is to provide=20=

> human readable annotations, not to perform automated analysis. Am I=20
> missing something ?
>=20
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
>> instruction. With raw instruction, macros are added to extract opcode
>> and register fields.
>>=20
>> "struct ins_operands" and "struct ins" is updated to carry opcode and
>> raw instruction binary code (raw_insn). Function "disasm_line__parse"
>> is updated to fill the raw instruction hex value and opcode in newly
>> added fields. There is no changes in existing code paths, which =
parses
>> the disassembled code. The architecture using the instruction name =
and
>> present approach is not altered. Since this approach targets powerpc,
>> the macro implementation is added for powerpc as of now.
>>=20
>> Example:
>> representation using --show-raw-insn in objdump gives result:
>>=20
>> 38 01 81 e8     ld      r4,312(r1)
>>=20
>> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
>> this translates to instruction form: "ld RT,DS(RA)" and binary code
>> as:
>> _____________________________________
>> | 58 |  RT  |  RA |      DS       | |
>> -------------------------------------
>> 0    6     11    16              30 31
>>=20
>> Function "disasm_line__parse" is updated to capture:
>>=20
>> line:    38 01 81 e8     ld      r4,312(r1)
>> opcode and raw instruction "38 01 81 e8"
>> Raw instruction is used later to extract the reg/offset fields.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---

