Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D521BF76B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 13:59:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CYp14PFMzDr7P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 21:59:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CYlp6NQ4zDrB4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 21:57:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UBW0En100906; Thu, 30 Apr 2020 07:57:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjxxccg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 07:57:14 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03UBWK8l102885;
 Thu, 30 Apr 2020 07:57:13 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjxxccfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 07:57:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03UBjnP0030799;
 Thu, 30 Apr 2020 11:57:12 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5tf6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 11:57:12 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03UBv9VD10092754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 11:57:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C2A2A4054;
 Thu, 30 Apr 2020 11:57:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D775FA405C;
 Thu, 30 Apr 2020 11:57:08 +0000 (GMT)
Received: from localhost (unknown [9.85.120.197])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Apr 2020 11:57:08 +0000 (GMT)
Date: Thu, 30 Apr 2020 17:27:07 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to
 avoid redundancy
To: Balamuruhan S <bala24@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-8-bala24@linux.ibm.com>
 <87k11yfvxu.fsf@mpe.ellerman.id.au>
 <1588169193.tsmipo5v6k.naveen@linux.ibm.com>
 <87y2qdelvm.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2qdelvm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588247640.as3rhyetf4.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_07:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=956 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004300092
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Michael Ellerman wrote:
>>> Balamuruhan S <bala24@linux.ibm.com> writes:
>>>> Avoid redefining macros to encode ppc instructions instead reuse it fr=
om
>>>> ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S wi=
th
>>>> __ASSEMBLY__ defined from selftests.
>>>>
>>>> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
>>>> ---
>>>>  .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++----
>>>>  .../powerpc/stringloops/asm/asm-const.h       |  1 +
>>>>  .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +-----------------=
-
>>>>  3 files changed, 29 insertions(+), 42 deletions(-)
>>>>  create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/as=
m-const.h
>>>>  mode change 100644 =3D> 120000 tools/testing/selftests/powerpc/string=
loops/asm/ppc-opcode.h
>>>>
>>>> diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/to=
ols/testing/selftests/powerpc/stringloops/Makefile
>>>> index 7fc0623d85c3..efe76c5a5b94 100644
>>>> --- a/tools/testing/selftests/powerpc/stringloops/Makefile
>>>> +++ b/tools/testing/selftests/powerpc/stringloops/Makefile
>>>> @@ -1,26 +1,44 @@
>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>  # The loops are all 64-bit code
>>>> -CFLAGS +=3D -I$(CURDIR)
>>>> +GIT_VERSION =3D $(shell git describe --always --long --dirty || echo =
"unknown")
>>>> +CFLAGS +=3D -DGIT_VERSION=3D'"$(GIT_VERSION)"' -I$(CURDIR) -I$(CURDIR=
)/../include
>>>> =20
>>>>  EXTRA_SOURCES :=3D ../harness.c
>>>> =20
>>>>  build_32bit =3D $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.=
c >/dev/null 2>&1) then echo "1"; fi)
>>>> =20
>>>> +ifneq ($(build_32bit),1)
>>>>  TEST_GEN_PROGS :=3D memcmp_64 strlen
>>>> +TEST_GEN_FILES :=3D memcmp.o memcmp_64.o memcmp_64
>>>> +MEMCMP :=3D $(OUTPUT)/memcmp.o
>>>> +MEMCMP_64 :=3D $(OUTPUT)/memcmp_64.o
>>>> +HARNESS :=3D  $(OUTPUT)/../harness.o
>>>> +CFLAGS +=3D -m64 -maltivec
>>>> =20
>>>> -$(OUTPUT)/memcmp_64: memcmp.c
>>>> -$(OUTPUT)/memcmp_64: CFLAGS +=3D -m64 -maltivec
>>>> +OVERRIDE_TARGETS :=3D 1
>>>> +include ../../lib.mk
>>>> =20
>>>> -ifeq ($(build_32bit),1)
>>>> +$(OUTPUT)/memcmp_64: $(MEMCMP_64) $(MEMCMP) $(HARNESS)
>>>> +	$(CC) $(CFLAGS) memcmp.o memcmp_64.o ../harness.o -o memcmp_64
>>>> +
>>>> +$(MEMCMP_64): memcmp_64.S
>>>> +	$(CC) $(CFLAGS) -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
>>>> +
>>>> +$(MEMCMP): memcmp.c
>>>> +	$(CC) $(CFLAGS) -o memcmp.o -c memcmp.c
>>>> +
>>>> +$(HARNESS): $(EXTRA_SOURCES)
>>>> +	$(CC) $(CFLAGS) -DGIT_VERSION=3D'"$(GIT_VERSION)"' -o ../harness.o -=
c $(EXTRA_SOURCES)
>>>=20
>>> What are you actually trying to do here? Is it just that you need to
>>> define __ASSEMBLY__ for memcmp_64.S?
>>
>> Adding __ASSEMBLY__ while building memcmp_64.S would be the goal, so as=20
>> to reuse ppc-opcode.h. However, asm/ppc-opcode.h under stringloops test=20
>> is tiny and doesn't seem to justify the change.
>=20
> I don't see ppc-opcode.h testing __ASSEMBLY__ though, so I don't think
> we even need to define it?

Right -- it's rather 'stringify_in_c' which tests it. 'asm/ppc-opcode.h'=20
under stringloops/ unconditionally defines 'stringify_in_c' this way:
	#  define stringify_in_c(...)   __VA_ARGS__=20


- Naveen

