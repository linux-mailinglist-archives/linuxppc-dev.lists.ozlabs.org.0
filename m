Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E81E1C82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 09:47:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WQzW5mhHzDqJC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 17:47:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WQxg07bBzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 17:45:55 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04Q7WA4k070988; Tue, 26 May 2020 03:45:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 317002ubg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 03:45:48 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04Q7WEVc071574;
 Tue, 26 May 2020 03:45:48 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 317002ubf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 03:45:48 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04Q7f87A004374;
 Tue, 26 May 2020 07:45:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 316uf85eab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 07:45:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04Q7jhtl60424434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 May 2020 07:45:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A0014C044;
 Tue, 26 May 2020 07:45:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 980BD4C04A;
 Tue, 26 May 2020 07:45:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.49.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 May 2020 07:45:39 +0000 (GMT)
Message-ID: <863653096d265d07ca58118294e1549753dd1ff2.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to
 avoid redundancy
From: Balamuruhan S <bala24@linux.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Tue, 26 May 2020 13:15:37 +0530
In-Reply-To: <1588247640.as3rhyetf4.naveen@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-8-bala24@linux.ibm.com>
 <87k11yfvxu.fsf@mpe.ellerman.id.au>
 <1588169193.tsmipo5v6k.naveen@linux.ibm.com>
 <87y2qdelvm.fsf@mpe.ellerman.id.au>
 <1588247640.as3rhyetf4.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-25_12:2020-05-25,
 2020-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 cotscore=-2147483648 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260054
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, sandipan@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-30 at 17:27 +0530, Naveen N. Rao wrote:
> Michael Ellerman wrote:
> > "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> > > Michael Ellerman wrote:
> > > > Balamuruhan S <bala24@linux.ibm.com> writes:
> > > > > Avoid redefining macros to encode ppc instructions instead reuse it
> > > > > from
> > > > > ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S
> > > > > with
> > > > > __ASSEMBLY__ defined from selftests.
> > > > > 
> > > > > Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> > > > > ---
> > > > >  .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++---
> > > > > -
> > > > >  .../powerpc/stringloops/asm/asm-const.h       |  1 +
> > > > >  .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +--------------
> > > > > ----
> > > > >  3 files changed, 29 insertions(+), 42 deletions(-)
> > > > >  create mode 120000
> > > > > tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
> > > > >  mode change 100644 => 120000
> > > > > tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
> > > > > 
> > > > > diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile
> > > > > b/tools/testing/selftests/powerpc/stringloops/Makefile
> > > > > index 7fc0623d85c3..efe76c5a5b94 100644
> > > > > --- a/tools/testing/selftests/powerpc/stringloops/Makefile
> > > > > +++ b/tools/testing/selftests/powerpc/stringloops/Makefile
> > > > > @@ -1,26 +1,44 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > >  # The loops are all 64-bit code
> > > > > -CFLAGS += -I$(CURDIR)
> > > > > +GIT_VERSION = $(shell git describe --always --long --dirty || echo
> > > > > "unknown")
> > > > > +CFLAGS += -DGIT_VERSION='"$(GIT_VERSION)"' -I$(CURDIR)
> > > > > -I$(CURDIR)/../include
> > > > >  
> > > > >  EXTRA_SOURCES := ../harness.c
> > > > >  
> > > > >  build_32bit = $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c
> > > > > >/dev/null 2>&1) then echo "1"; fi)
> > > > >  
> > > > > +ifneq ($(build_32bit),1)
> > > > >  TEST_GEN_PROGS := memcmp_64 strlen
> > > > > +TEST_GEN_FILES := memcmp.o memcmp_64.o memcmp_64
> > > > > +MEMCMP := $(OUTPUT)/memcmp.o
> > > > > +MEMCMP_64 := $(OUTPUT)/memcmp_64.o
> > > > > +HARNESS :=  $(OUTPUT)/../harness.o
> > > > > +CFLAGS += -m64 -maltivec
> > > > >  
> > > > > -$(OUTPUT)/memcmp_64: memcmp.c
> > > > > -$(OUTPUT)/memcmp_64: CFLAGS += -m64 -maltivec
> > > > > +OVERRIDE_TARGETS := 1
> > > > > +include ../../lib.mk
> > > > >  
> > > > > -ifeq ($(build_32bit),1)
> > > > > +$(OUTPUT)/memcmp_64: $(MEMCMP_64) $(MEMCMP) $(HARNESS)
> > > > > +	$(CC) $(CFLAGS) memcmp.o memcmp_64.o ../harness.o -o memcmp_64
> > > > > +
> > > > > +$(MEMCMP_64): memcmp_64.S
> > > > > +	$(CC) $(CFLAGS) -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
> > > > > +
> > > > > +$(MEMCMP): memcmp.c
> > > > > +	$(CC) $(CFLAGS) -o memcmp.o -c memcmp.c
> > > > > +
> > > > > +$(HARNESS): $(EXTRA_SOURCES)
> > > > > +	$(CC) $(CFLAGS) -DGIT_VERSION='"$(GIT_VERSION)"' -o
> > > > > ../harness.o -c $(EXTRA_SOURCES)
> > > > 
> > > > What are you actually trying to do here? Is it just that you need to
> > > > define __ASSEMBLY__ for memcmp_64.S?
> > > 
> > > Adding __ASSEMBLY__ while building memcmp_64.S would be the goal, so as 
> > > to reuse ppc-opcode.h. However, asm/ppc-opcode.h under stringloops test 
> > > is tiny and doesn't seem to justify the change.

Okay, I will drop the last patch that have changes for stringloops Makefile.

make and make clean is not working from inside stringloops directory which is
fixed with this change.


> > 
> > I don't see ppc-opcode.h testing __ASSEMBLY__ though, so I don't think
> > we even need to define it?
> 
> Right -- it's rather 'stringify_in_c' which tests it. 'asm/ppc-opcode.h' 
> under stringloops/ unconditionally defines 'stringify_in_c' this way:
> 	#  define stringify_in_c(...)   __VA_ARGS__ 
> 

It is expecting __ASSEMBLY__ through ppc-opcode.h -> asm-const.h to raw encode
the instruction in assembly file instead to stringify it for c file. we observe
this Assembler messages without defining __ASSEMBLY__,

memcmp_64.S: Assembler messages:
memcmp_64.S:473: Error: unknown pseudo-op: `.long (0x100000c7 | (((0) & 0x1f)
<< 21) | (((0) & 0x1f) << 16) | (((1) & 0x1f) << 11) | (0x1 << 10))'
memcmp_64.S:477: Error: unknown pseudo-op: `.long (0x100000c7 | (((0) & 0x1f)
<< 21) | (((0) & 0x1f) << 16) | (((1) & 0x1f) << 11) | (0x1 << 10))'
memcmp_64.S:586: Error: unknown pseudo-op: `.long (0x10000006 | (((7) & 0x1f)
<< 21) | (((9) & 0x1f) << 16) | (((10) & 0x1f) << 11) | (0x1 << 10))'
memcmp_64.S:607: Error: unknown pseudo-op: `.long (0x10000006 | (((7) & 0x1f)
<< 21) | (((9) & 0x1f) << 16) | (((10) & 0x1f) << 11) | (0x1 << 10))'
memcmp_64.S:616: Error: unknown pseudo-op: `.long (0x10000006 | (((7) & 0x1f)
<< 21) | (((9) & 0x1f) << 16) | (((10) & 0x1f) << 11) | (0x1 << 10))'
make[1]: *** [../../lib.mk:148:
/home/bala/linux/tools/testing/selftests/powerpc/stringloops/memcmp_64] Error 1

-- Bala
> 
> - Naveen
> 

