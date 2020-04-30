Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 084571BEE63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 04:42:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CKRK6y7yzDr7V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 12:42:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CKPS6mkdzDqxs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 12:40:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WGaIrOap; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49CKPS4PYYz9sSd;
 Thu, 30 Apr 2020 12:40:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588214444;
 bh=9uNc3hbO8GraWu/076qgbod5aalFmDmt8UJw8yRR44c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WGaIrOap1rCAuSZQnwQ245mcAEbChbFledFSYX5z4J6y4OeYtm8AOu8hNfVm8g5mO
 3fn+1yyu67W3bdPjj+OZXPJPUh6+lYnaSirwDL2paJHTm1wifFg6LSRLA8VsvIZdf0
 9/LC+5cL8/6E3gkyBcmMiEEHSRwQgeBJalYaXr1KxJpffZsSim904YjUa+ONSaXPoL
 S6AhTEm29RK3a4cJjA5GjLxZOgpM3FYnRPyFg06VTWDe4dq14jA0FLmImDGvuEQ4pJ
 Id+9R+trbv5osiCE69zU8u5qvgzsfLeNMUdeyLNO49foulzJGm1LeWiIqBi1c8yWJC
 fIUiU8UlM93HA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to
 avoid redundancy
In-Reply-To: <1588169193.tsmipo5v6k.naveen@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-8-bala24@linux.ibm.com>
 <87k11yfvxu.fsf@mpe.ellerman.id.au>
 <1588169193.tsmipo5v6k.naveen@linux.ibm.com>
Date: Thu, 30 Apr 2020 12:41:01 +1000
Message-ID: <87y2qdelvm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Michael Ellerman wrote:
>> Balamuruhan S <bala24@linux.ibm.com> writes:
>>> Avoid redefining macros to encode ppc instructions instead reuse it from
>>> ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S with
>>> __ASSEMBLY__ defined from selftests.
>>>
>>> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
>>> ---
>>>  .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++----
>>>  .../powerpc/stringloops/asm/asm-const.h       |  1 +
>>>  .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +------------------
>>>  3 files changed, 29 insertions(+), 42 deletions(-)
>>>  create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
>>>  mode change 100644 => 120000 tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
>>>
>>> diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tools/testing/selftests/powerpc/stringloops/Makefile
>>> index 7fc0623d85c3..efe76c5a5b94 100644
>>> --- a/tools/testing/selftests/powerpc/stringloops/Makefile
>>> +++ b/tools/testing/selftests/powerpc/stringloops/Makefile
>>> @@ -1,26 +1,44 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>  # The loops are all 64-bit code
>>> -CFLAGS += -I$(CURDIR)
>>> +GIT_VERSION = $(shell git describe --always --long --dirty || echo "unknown")
>>> +CFLAGS += -DGIT_VERSION='"$(GIT_VERSION)"' -I$(CURDIR) -I$(CURDIR)/../include
>>>  
>>>  EXTRA_SOURCES := ../harness.c
>>>  
>>>  build_32bit = $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c >/dev/null 2>&1) then echo "1"; fi)
>>>  
>>> +ifneq ($(build_32bit),1)
>>>  TEST_GEN_PROGS := memcmp_64 strlen
>>> +TEST_GEN_FILES := memcmp.o memcmp_64.o memcmp_64
>>> +MEMCMP := $(OUTPUT)/memcmp.o
>>> +MEMCMP_64 := $(OUTPUT)/memcmp_64.o
>>> +HARNESS :=  $(OUTPUT)/../harness.o
>>> +CFLAGS += -m64 -maltivec
>>>  
>>> -$(OUTPUT)/memcmp_64: memcmp.c
>>> -$(OUTPUT)/memcmp_64: CFLAGS += -m64 -maltivec
>>> +OVERRIDE_TARGETS := 1
>>> +include ../../lib.mk
>>>  
>>> -ifeq ($(build_32bit),1)
>>> +$(OUTPUT)/memcmp_64: $(MEMCMP_64) $(MEMCMP) $(HARNESS)
>>> +	$(CC) $(CFLAGS) memcmp.o memcmp_64.o ../harness.o -o memcmp_64
>>> +
>>> +$(MEMCMP_64): memcmp_64.S
>>> +	$(CC) $(CFLAGS) -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
>>> +
>>> +$(MEMCMP): memcmp.c
>>> +	$(CC) $(CFLAGS) -o memcmp.o -c memcmp.c
>>> +
>>> +$(HARNESS): $(EXTRA_SOURCES)
>>> +	$(CC) $(CFLAGS) -DGIT_VERSION='"$(GIT_VERSION)"' -o ../harness.o -c $(EXTRA_SOURCES)
>> 
>> What are you actually trying to do here? Is it just that you need to
>> define __ASSEMBLY__ for memcmp_64.S?
>
> Adding __ASSEMBLY__ while building memcmp_64.S would be the goal, so as 
> to reuse ppc-opcode.h. However, asm/ppc-opcode.h under stringloops test 
> is tiny and doesn't seem to justify the change.

I don't see ppc-opcode.h testing __ASSEMBLY__ though, so I don't think
we even need to define it?

cheers
