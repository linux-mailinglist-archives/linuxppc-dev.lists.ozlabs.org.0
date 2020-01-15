Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7C13BA21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 08:10:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yJPL1Z4XzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 18:10:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yJLG6PXrzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 18:07:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AVbfvsFX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47yJLF03hhz9sPn;
 Wed, 15 Jan 2020 18:07:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579072054;
 bh=L9kSLWKQN9Ac7O0n5HFysdI80JqMt0iOH/uyGGioEIw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AVbfvsFXFRwa09UmcuPkgwIDA7TNQ1eBHvd9Ce6ndrU8rB/wRPcogx9X8FzT0oeEy
 W8rM5IfWS7D52dLKXAxB8Ogy4lr129v2VrRjEbNXy3/DgoZPFiRTLbXsFHqI6Tw/J4
 0PC5r/aLohSIGBUksmI94VwWNrJtyakj8NL32vGlkXX98zoK/mo2c8+XPHXTJCrP9h
 z8Avxt6xTmG+rgLRUVkfRoeq9tLg1FS598zG97hjZBxM2C3w8igr4szN9MtRXM2A82
 /1ZaaiUsGZmZolS08V6p8VeUNVi1dchG8gPQK+wmLUyvxUmjxoIHixlYZHt2ZGZgwe
 PD03ywRTmcYUQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>, shuahkh@osg.samsung.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v15 23/23] selftests: vm: pkeys: Use the correct page size
 on powerpc
In-Reply-To: <ff7c288e2a88ccfb3b79be30967646fe5b869683.1576645161.git.sandipan@linux.ibm.com>
References: <cover.1576645161.git.sandipan@linux.ibm.com>
 <ff7c288e2a88ccfb3b79be30967646fe5b869683.1576645161.git.sandipan@linux.ibm.com>
Date: Wed, 15 Jan 2020 17:07:36 +1000
Message-ID: <87h80x9ozr.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, dave.hansen@intel.com,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, linuxram@us.ibm.com,
 mhocko@kernel.org, linux-mm@kvack.org, mingo@redhat.com, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> Both 4K and 64K pages are supported on powerpc. Parts of
> the selftest code perform alignment computations based on
> the PAGE_SIZE macro which is currently hardcoded to 64K
> for powerpc. This causes some test failures on kernels
> configured with 4K page size.
>
> This problem is solved by determining the correct page
> size during the build process rather than hardcoding it
> in the header file.

Doing it at build time is wrong, the test could be built on a 4K system
and then run on a 64K system, or vice versa.

You should just use getpagesize() at runtime.

cheers

> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index 4e9c741be6af..ada3a67eaac6 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -4,6 +4,10 @@ uname_M := $(shell uname -m 2>/dev/null || echo not)
>  ARCH ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/')
>  
>  CFLAGS = -Wall -I ../../../../usr/include $(EXTRA_CFLAGS)
> +ifneq (,$(filter $(ARCH), ppc64 ppc64le))
> +protection_keys: EXTRA_CFLAGS += -DPAGE_SIZE=$(shell getconf PAGESIZE)
> +endif
> +
>  LDLIBS = -lrt
>  TEST_GEN_FILES = compaction_test
>  TEST_GEN_FILES += gup_benchmark
> diff --git a/tools/testing/selftests/vm/pkey-powerpc.h b/tools/testing/selftests/vm/pkey-powerpc.h
> index 3cd8e03fd640..07fa9f529014 100644
> --- a/tools/testing/selftests/vm/pkey-powerpc.h
> +++ b/tools/testing/selftests/vm/pkey-powerpc.h
> @@ -36,7 +36,6 @@
>  					     pkey-31 and exec-only key */
>  #define PKEY_BITS_PER_PKEY	2
>  #define HPAGE_SIZE		(1UL << 24)
> -#define PAGE_SIZE		(1UL << 16)
>  #define pkey_reg_t		u64
>  #define PKEY_REG_FMT		"%016lx"
>  
> -- 
> 2.17.1
