Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E625A1BD917
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:09:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BvPQ44RnzDqv9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 20:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BvKX4XlyzDqsM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 20:05:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=H4ditcMH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BvKW4wdfz9sSb;
 Wed, 29 Apr 2020 20:05:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588154752;
 bh=JhIuKNaDYb9HWGfh+wypyl48dzjc/KkCwADeZZZ2UGg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=H4ditcMHzNrsBH09rZ5gXsG1DgVBpa4Pv3M0QLBCgnejGh+WbH3e7ZVCKpZAkhy7Q
 NGBj3WOjVzvqCXtZVmRoJqAjTFk8yDcKQ3R7JKPUg3+6fOF9O9sXkT4fYJb7dNCIKg
 YJltlzD9rM5VqeZTnvk7mNuo3LYQbzVEqVkFbAL/Yxgx7CQ7kJ1hMWh2ogENQFotb1
 +N/wXLkY1OrUxEMaznIVplqpatglbYJzyB+m5E7o1flLUOwsH8w4iCcJc/wfGso4qp
 9JzAoWqQlVFN/lDbDd8p3RzhCS7LFrCFz3Ui3YZFIbyOMLedxaRxDvMYR/soggJRgQ
 VgSfCyq7bBgUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Balamuruhan S <bala24@linux.ibm.com>
Subject: Re: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to
 avoid redundancy
In-Reply-To: <20200424070853.443969-8-bala24@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-8-bala24@linux.ibm.com>
Date: Wed, 29 Apr 2020 20:06:05 +1000
Message-ID: <87k11yfvxu.fsf@mpe.ellerman.id.au>
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S <bala24@linux.ibm.com> writes:
> Avoid redefining macros to encode ppc instructions instead reuse it from
> ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S with
> __ASSEMBLY__ defined from selftests.
>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++----
>  .../powerpc/stringloops/asm/asm-const.h       |  1 +
>  .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +------------------
>  3 files changed, 29 insertions(+), 42 deletions(-)
>  create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
>  mode change 100644 => 120000 tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
>
> diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tools/testing/selftests/powerpc/stringloops/Makefile
> index 7fc0623d85c3..efe76c5a5b94 100644
> --- a/tools/testing/selftests/powerpc/stringloops/Makefile
> +++ b/tools/testing/selftests/powerpc/stringloops/Makefile
> @@ -1,26 +1,44 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # The loops are all 64-bit code
> -CFLAGS += -I$(CURDIR)
> +GIT_VERSION = $(shell git describe --always --long --dirty || echo "unknown")
> +CFLAGS += -DGIT_VERSION='"$(GIT_VERSION)"' -I$(CURDIR) -I$(CURDIR)/../include
>  
>  EXTRA_SOURCES := ../harness.c
>  
>  build_32bit = $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c >/dev/null 2>&1) then echo "1"; fi)
>  
> +ifneq ($(build_32bit),1)
>  TEST_GEN_PROGS := memcmp_64 strlen
> +TEST_GEN_FILES := memcmp.o memcmp_64.o memcmp_64
> +MEMCMP := $(OUTPUT)/memcmp.o
> +MEMCMP_64 := $(OUTPUT)/memcmp_64.o
> +HARNESS :=  $(OUTPUT)/../harness.o
> +CFLAGS += -m64 -maltivec
>  
> -$(OUTPUT)/memcmp_64: memcmp.c
> -$(OUTPUT)/memcmp_64: CFLAGS += -m64 -maltivec
> +OVERRIDE_TARGETS := 1
> +include ../../lib.mk
>  
> -ifeq ($(build_32bit),1)
> +$(OUTPUT)/memcmp_64: $(MEMCMP_64) $(MEMCMP) $(HARNESS)
> +	$(CC) $(CFLAGS) memcmp.o memcmp_64.o ../harness.o -o memcmp_64
> +
> +$(MEMCMP_64): memcmp_64.S
> +	$(CC) $(CFLAGS) -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
> +
> +$(MEMCMP): memcmp.c
> +	$(CC) $(CFLAGS) -o memcmp.o -c memcmp.c
> +
> +$(HARNESS): $(EXTRA_SOURCES)
> +	$(CC) $(CFLAGS) -DGIT_VERSION='"$(GIT_VERSION)"' -o ../harness.o -c $(EXTRA_SOURCES)

What are you actually trying to do here? Is it just that you need to
define __ASSEMBLY__ for memcmp_64.S?

What you have breaks the build, it's not respecting $(OUTPUT).

  make[2]: Entering directory '/linux/tools/testing/selftests/powerpc/stringloops'
  powerpc64le-linux-gnu-gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -I/linux/tools/testing/selftests/powerpc/include  -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -I/linux/tools/testing/selftests/powerpc/stringloops -I/linux/tools/testing/selftests/powerpc/stringloops/../include -m64 -maltivec -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
  Assembler messages:
  Fatal error: can't create memcmp_64.o: Read-only file system
  make[2]: *** [Makefile:25: /output/kselftest/powerpc/stringloops/memcmp_64.o] Error 1
  powerpc64le-linux-gnu-gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -I/linux/tools/testing/selftests/powerpc/include  -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -I/linux/tools/testing/selftests/powerpc/stringloops -I/linux/tools/testing/selftests/powerpc/stringloops/../include -m64 -maltivec -o memcmp.o -c memcmp.c
  Assembler messages:
  Fatal error: can't create memcmp.o: Read-only file system
  make[2]: *** [Makefile:28: /output/kselftest/powerpc/stringloops/memcmp.o] Error 1
  powerpc64le-linux-gnu-gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -I/linux/tools/testing/selftests/powerpc/include  -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -I/linux/tools/testing/selftests/powerpc/stringloops -I/linux/tools/testing/selftests/powerpc/stringloops/../include -m64 -maltivec -DGIT_VERSION='"v5.7-rc2-38-g2d7b142b5a96"' -o ../harness.o -c ../harness.c
  Assembler messages:
  Fatal error: can't create ../harness.o: Read-only file system
  make[2]: *** [Makefile:31: /output/kselftest/powerpc/stringloops/../harness.o] Error 1


cheers
