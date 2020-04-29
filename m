Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0A1BE0AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:21:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C10M2QDQzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 00:21:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C0wG1VJkzDr9Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 00:17:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TE1IYg101151; Wed, 29 Apr 2020 10:17:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30q80pq66a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 10:17:42 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03TE2GDG105741;
 Wed, 29 Apr 2020 10:17:41 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30q80pq65h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 10:17:41 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03TEArSq004100;
 Wed, 29 Apr 2020 14:17:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 30mcu70m36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:17:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03TEHbNP54132894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 14:17:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A58BA405B;
 Wed, 29 Apr 2020 14:17:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE8CEA4054;
 Wed, 29 Apr 2020 14:17:36 +0000 (GMT)
Received: from localhost (unknown [9.85.113.202])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 14:17:36 +0000 (GMT)
Date: Wed, 29 Apr 2020 19:47:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to
 avoid redundancy
To: Balamuruhan S <bala24@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-8-bala24@linux.ibm.com>
 <87k11yfvxu.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k11yfvxu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588169193.tsmipo5v6k.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_05:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290115
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
> Balamuruhan S <bala24@linux.ibm.com> writes:
>> Avoid redefining macros to encode ppc instructions instead reuse it from
>> ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S with
>> __ASSEMBLY__ defined from selftests.
>>
>> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
>> ---
>>  .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++----
>>  .../powerpc/stringloops/asm/asm-const.h       |  1 +
>>  .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +------------------
>>  3 files changed, 29 insertions(+), 42 deletions(-)
>>  create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-=
const.h
>>  mode change 100644 =3D> 120000 tools/testing/selftests/powerpc/stringlo=
ops/asm/ppc-opcode.h
>>
>> diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tool=
s/testing/selftests/powerpc/stringloops/Makefile
>> index 7fc0623d85c3..efe76c5a5b94 100644
>> --- a/tools/testing/selftests/powerpc/stringloops/Makefile
>> +++ b/tools/testing/selftests/powerpc/stringloops/Makefile
>> @@ -1,26 +1,44 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  # The loops are all 64-bit code
>> -CFLAGS +=3D -I$(CURDIR)
>> +GIT_VERSION =3D $(shell git describe --always --long --dirty || echo "u=
nknown")
>> +CFLAGS +=3D -DGIT_VERSION=3D'"$(GIT_VERSION)"' -I$(CURDIR) -I$(CURDIR)/=
../include
>> =20
>>  EXTRA_SOURCES :=3D ../harness.c
>> =20
>>  build_32bit =3D $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c =
>/dev/null 2>&1) then echo "1"; fi)
>> =20
>> +ifneq ($(build_32bit),1)
>>  TEST_GEN_PROGS :=3D memcmp_64 strlen
>> +TEST_GEN_FILES :=3D memcmp.o memcmp_64.o memcmp_64
>> +MEMCMP :=3D $(OUTPUT)/memcmp.o
>> +MEMCMP_64 :=3D $(OUTPUT)/memcmp_64.o
>> +HARNESS :=3D  $(OUTPUT)/../harness.o
>> +CFLAGS +=3D -m64 -maltivec
>> =20
>> -$(OUTPUT)/memcmp_64: memcmp.c
>> -$(OUTPUT)/memcmp_64: CFLAGS +=3D -m64 -maltivec
>> +OVERRIDE_TARGETS :=3D 1
>> +include ../../lib.mk
>> =20
>> -ifeq ($(build_32bit),1)
>> +$(OUTPUT)/memcmp_64: $(MEMCMP_64) $(MEMCMP) $(HARNESS)
>> +	$(CC) $(CFLAGS) memcmp.o memcmp_64.o ../harness.o -o memcmp_64
>> +
>> +$(MEMCMP_64): memcmp_64.S
>> +	$(CC) $(CFLAGS) -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
>> +
>> +$(MEMCMP): memcmp.c
>> +	$(CC) $(CFLAGS) -o memcmp.o -c memcmp.c
>> +
>> +$(HARNESS): $(EXTRA_SOURCES)
>> +	$(CC) $(CFLAGS) -DGIT_VERSION=3D'"$(GIT_VERSION)"' -o ../harness.o -c =
$(EXTRA_SOURCES)
>=20
> What are you actually trying to do here? Is it just that you need to
> define __ASSEMBLY__ for memcmp_64.S?

Adding __ASSEMBLY__ while building memcmp_64.S would be the goal, so as=20
to reuse ppc-opcode.h. However, asm/ppc-opcode.h under stringloops test=20
is tiny and doesn't seem to justify the change.

>=20
> What you have breaks the build, it's not respecting $(OUTPUT).

I think we should just drop this patch from the series.

Bala,
Can you re-post this series without the RFC tag, with the last patch=20
dropped?


- Naveen

