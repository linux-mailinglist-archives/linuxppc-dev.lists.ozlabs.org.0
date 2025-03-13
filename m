Return-Path: <linuxppc-dev+bounces-6955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57351A5F05B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 11:11:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD3FC4zQ5z3c1w;
	Thu, 13 Mar 2025 21:11:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741860703;
	cv=none; b=MGXKek+PI64ZoESnmd/KdCDb/GmYYUxHh347XG4bSJUTVsMNBDyLN/q0YhYjeBFXCZVDJFtC8KvQwt8gfeLqtA2RIdDY/ATobLD5xS0dCKclJK5o15nG9vWkX15LW1EdpaP82wfPj2KckfvLTwegKHa7ZlGLB5jx4q3uNCfIRfHZW4v7bqgZKXlsJvV+2Ko2o4jIGp2gq+zoJBTjMRFnb4Bz/YMgeW9jpFhzYnX8ee+NFi5nfEFo2P9EqsRGMRPJTIw7Rvpgqz9K/vZdhkeem85oqqpnNH7A9Z/K9QjlxIgYXAaHN4I5OLJvb6eBZwIT1wrMqAzEJKWrgiUjaP2FPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741860703; c=relaxed/relaxed;
	bh=UshDcxCHBAFBNtVF8A0toN4U9q/viYL2qJswKsSXCqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnZD1jR9u6WAt2GBgp6fspvQ0CYIEraoeGLcX/k79zXdagUDjC5hZE/NFvQ3yxpKR7GAoI/rocYvyMx76d+AQJ5ZtfjmItsFhIx/slOw9fBkR0jMMN8NP/9W2L1vjoKeKlVSoXcSjUIv1bsZ/ianVw+HZedvfKTGZBz/Iz1l+gV/WuLsHe6eU3SekF6cbI5PBMRwywQZur0wt5t24lTZqaCgqkpmp8iktMcKbuufE3XQHXO0tBiMpTLWCFfN2dsTsQ3bUjGxhfjGIQha/B8rbYvLLTJsv1nylfeRNAayp3NENU1Bf0dONZ3dsBTgr4FqxbRazQREAp5mGlh02J5hzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD3FB40qlz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 21:11:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C44E41516;
	Thu, 13 Mar 2025 03:11:18 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6112F3F694;
	Thu, 13 Mar 2025 03:11:06 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:11:03 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, pbonzini@redhat.com, thuth@redhat.com,
	eric.auger@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com,
	imbrenda@linux.ibm.com, nrb@linux.ibm.com
Subject: Re: [kvm-unit-tests PATCH v2] Makefile: Use CFLAGS in cc-option
Message-ID: <Z9KvNzQnkFSTvmoE@raptor>
References: <20250307091828.57933-2-andrew.jones@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307091828.57933-2-andrew.jones@linux.dev>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

Thank you for debugging this. I tested the patch by compiling the MTE test
from Vladimir with clang and it works now:

Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks,
Alex

On Fri, Mar 07, 2025 at 10:18:29AM +0100, Andrew Jones wrote:
> When cross compiling with clang we need to specify the target in
> CFLAGS and cc-option will fail to recognize target-specific options
> without it. Add CFLAGS to the CC invocation in cc-option.
> 
> The introduction of the realmode_bits variable is necessary to
> avoid make failing to build x86 due to CFLAGS referencing itself.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
> v2:
>  - Fixed x86 builds with the realmode_bits variable
> 
>  Makefile            | 2 +-
>  x86/Makefile.common | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 78352fced9d4..9dc5d2234e2a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
>  
>  # cc-option
>  # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
>                > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
>  
>  libcflat := lib/libcflat.a
> diff --git a/x86/Makefile.common b/x86/Makefile.common
> index 0b7f35c8de85..e97464912e28 100644
> --- a/x86/Makefile.common
> +++ b/x86/Makefile.common
> @@ -98,6 +98,7 @@ tests-common = $(TEST_DIR)/vmexit.$(exe) $(TEST_DIR)/tsc.$(exe) \
>  ifneq ($(CONFIG_EFI),y)
>  tests-common += $(TEST_DIR)/realmode.$(exe) \
>  		$(TEST_DIR)/la57.$(exe)
> +realmode_bits := $(if $(call cc-option,-m16,""),16,32)
>  endif
>  
>  test_cases: $(tests-common) $(tests)
> @@ -108,7 +109,7 @@ $(TEST_DIR)/realmode.elf: $(TEST_DIR)/realmode.o
>  	$(LD) -m elf_i386 -nostdlib -o $@ \
>  	      -T $(SRCDIR)/$(TEST_DIR)/realmode.lds $^
>  
> -$(TEST_DIR)/realmode.o: bits = $(if $(call cc-option,-m16,""),16,32)
> +$(TEST_DIR)/realmode.o: bits = $(realmode_bits)
>  
>  $(TEST_DIR)/access_test.$(bin): $(TEST_DIR)/access.o
>  
> -- 
> 2.48.1
> 

