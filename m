Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 235876626B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 14:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrDy20CcWz3cGh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 00:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+FaJ0Mr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+FaJ0Mr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrDx16VgTz2yyh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 00:16:37 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309AflIV028028;
	Mon, 9 Jan 2023 13:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=m9m7YbbTHnca1GDB8v83dCHX+QAX8ehEYLNZU04Tgng=;
 b=f+FaJ0Mruy2m/2hEvs6UfKMesQdXnwuNn+AD40x2J2gnEc5JoK+c3ghIkzFaGzIaqfH6
 JXvgvefuTJIR9UY833EDLYw8DVi3IsoRj8Uz6JjDrfsEUQEnI79VsuZjJImnf0tOkubi
 BGOFKBaIZ7/N6ym8ujR/ZiMI6BZAl4dKpwOhgrmht2Q5fOTXQ+OAUx2/Cv19zJ0mDmxA
 f0tqEzrseU30cmuGU02VjIXf3c7xXdLH/mD+n6HeAjUekePopKjdKqU1q4245oaz64Ou
 VT1Z5IdPAkp/DgJM+By7P8vbE1NZ+/IF0qXx4GOe1HdXXcrKdENbEv/jwR/7uaqXFnwq hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjjs5p92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 13:16:28 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309CBg80020753;
	Mon, 9 Jan 2023 13:16:28 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjjs5p84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 13:16:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3096OcwP029839;
	Mon, 9 Jan 2023 13:16:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3my00fj4y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 13:16:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 309DGMVx21496324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Jan 2023 13:16:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39E9F20043;
	Mon,  9 Jan 2023 13:16:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D79F92004D;
	Mon,  9 Jan 2023 13:16:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.36.39])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Jan 2023 13:16:19 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/perf: Fix bpf-script-test-prologue test compile
 issue with clang
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Y7bIPIVx9Y7agt7L@kernel.org>
Date: Mon, 9 Jan 2023 18:46:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A234CD34-E6FB-4CF4-95C6-503CF487CFC9@linux.vnet.ibm.com>
References: <20230105120436.92051-1-atrajeev@linux.vnet.ibm.com>
 <Y7bIPIVx9Y7agt7L@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x9EfI3K31djplkk9S33MwJvRvIvP1MH3
X-Proofpoint-ORIG-GUID: 4z_i2ilS3FNIOHaH2h1G7GOGJHgVEq0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_06,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090094
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Jan-2023, at 6:23 PM, Arnaldo Carvalho de Melo <acme@kernel.org> =
wrote:
>=20
> Em Thu, Jan 05, 2023 at 05:34:36PM +0530, Athira Rajeev escreveu:
>> While running perf test for bpf, observed that "BPF prologue
>> generation" test case fails to compile with clang. Logs below
>> from powerpc:
>>=20
>> <stdin>:33:2: error: use of undeclared identifier 'fmode_t'
>>        fmode_t f_mode =3D (fmode_t)_f_mode;
>>        ^
>> <stdin>:37:6: error: use of undeclared identifier 'f_mode'; did you =
mean '_f_mode'?
>>        if (f_mode & FMODE_WRITE)
>>            ^~~~~~
>>            _f_mode
>> <stdin>:30:60: note: '_f_mode' declared here
>> int bpf_func__null_lseek(void *ctx, int err, unsigned long _f_mode,
>>                                                           ^
>> 2 errors generated.
>=20
> Thanks for fixing this, I noticed the problem but didn't got around to
> investigate it.
>=20
> Tested and applied.

Thanks Arnaldo for checking the patch.

Athira
>=20
> - Arnaldo
>=20
>> The test code tests/bpf-script-test-prologue.c uses fmode_t.
>> And the error above is for "fmode_t" which is defined in
>> include/linux/types.h as part of kernel build directory:
>> "/lib/modules/<kernel_version>/build" that comes from
>> kernel devel [ soft link to /usr/src/<kernel_version> ].
>> Clang picks this header file from "-working-directory" build
>> option that specifies this build folder.
>>=20
>> But the 'commit 14e4b9f4289a ("perf trace: Raw augmented
>> syscalls fix libbpf 1.0+ compatibility")', changed the
>> include directory to use: "/usr/include".  Post this change,
>> types.h from /usr/include/ is getting picked upwhich doesn=E2=80=99t
>> contain definition of "fmode_t" and hence fails to compile.
>>=20
>> Compilation command before this commit:
>> /usr/bin/clang -D__KERNEL__ -D__NR_CPUS__=3D72 =
-DLINUX_VERSION_CODE=3D0x50e00 -xc  -I/root/lib/perf/include/bpf =
-nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  =
-I./include -I./arch/powerpc/include/uapi =
-I./arch/powerpc/include/generated/uapi -I./include/uapi =
-I./include/generated/uapi -include ./include/linux/compiler-version.h =
-include ./include/linux/kconfig.h  -Wno-unused-value -Wno-pointer-sign =
-working-directory /lib/modules/<ver>/build -c - -target bpf  -g -O2 -o =
-
>>=20
>> Compilation command after this commit:
>> /usr/bin/clang -D__KERNEL__ -D__NR_CPUS__=3D72 =
-DLINUX_VERSION_CODE=3D0x50e00 -xc  -I/usr/include/ -nostdinc =
-I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include =
-I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi =
-I./include/uapi -I./include/generated/uapi -include =
./include/linux/compiler-version.h -include ./include/linux/kconfig.h  =
-Wno-unused-value -Wno-pointer-sign -working-directory =
/lib/modules/<ver>/build -c - -target bpf  -g -O2 -o -
>>=20
>> The difference is addition of -I/usr/include/  in the first line
>> which is causing the error. Fix this by adding typedef for "fmode_t"
>> in the testcase to solve the compile issue.
>>=20
>> Fixes: 14e4b9f4289a ("perf trace: Raw augmented syscalls fix libbpf =
1.0+ compatibility")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/tests/bpf-script-test-prologue.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/tools/perf/tests/bpf-script-test-prologue.c =
b/tools/perf/tests/bpf-script-test-prologue.c
>> index bd83d364cf30..91778b5c6125 100644
>> --- a/tools/perf/tests/bpf-script-test-prologue.c
>> +++ b/tools/perf/tests/bpf-script-test-prologue.c
>> @@ -20,6 +20,8 @@
>> # undef if
>> #endif
>>=20
>> +typedef unsigned int __bitwise fmode_t;
>> +
>> #define FMODE_READ		0x1
>> #define FMODE_WRITE		0x2
>>=20
>> --=20
>> 2.31.1
>=20
> --=20
>=20
> - Arnaldo

