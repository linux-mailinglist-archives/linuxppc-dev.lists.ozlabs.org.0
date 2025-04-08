Return-Path: <linuxppc-dev+bounces-7546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287B8A80F82
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 17:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX8lm6zJfz307K;
	Wed,  9 Apr 2025 01:15:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744125332;
	cv=none; b=ceu6gaXnljneYZvsnh4YaWesVH0IJ/AFFdmLenxnW64LFDZ7Bop45G1ZwS6AXVLq18gjM+gKNh3QR6MuQ+0iCxXRtMz2Bwi08JHU4hNJn5e2wSL9kBmXpyQCsyRWF0YOC00PQQhf4byBNZoRwKLjCw4D0VeUf9qOk48k8j2uWweXAfTRhiRxPYox2HUeTgCCpVDEwkLGinybRhZprk6xU6l29wxz4vI7y7VQzbLHrNWf8KIA6zJwfqMhAF8LOaob6OoccV8JFlHEPU+gKy99xV/K4EBoplXrTIzMlu+6x4ziG2yTeGnp+K4mUhbCsE59IQgKXhQKuptJ60Glm0OLig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744125332; c=relaxed/relaxed;
	bh=qQDjU0c2FbbyMqE7EvnqvZnYPTTk0XjInWyGR5u9l98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z76yMy3/K59e1ZIM4enBbwro6VEQ1S8Ao5L8VPFMoZBFmys7U1Yccl5b5Iv2Ng/tSLVuuIs9jfnLXDpd2acrVEH268cVS9zO6y6HGHvojdQ/lYFebm3t6WscsCkWUv8QPP8ANR8JDntPRiNbEobJRVl04amDo404Y383jUzCwg8gwtgWmIB04KNl1+hcvX2ULGF9Rrk9EjVV/AzJrAlOUFl6ZEZeC6oqMD/lXiH8djvXceFTlZNDmGw1SGD8jaxB8Bht9JttZhdzqMyIH0cqqLsQrj+m4y2YDig+ZWC3kfe0CtqPBSuSzlNCqOzLi3o3pcftbbPr5lwdinS8LDHSjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TB19qP6W; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TB19qP6W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX8lk2zNkz2yrj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Apr 2025 01:15:28 +1000 (AEST)
Date: Tue, 8 Apr 2025 17:15:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744125308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQDjU0c2FbbyMqE7EvnqvZnYPTTk0XjInWyGR5u9l98=;
	b=TB19qP6W0TSkS/JzrH/dfnjAIyMyKp0E32t7zyl3dQmRzp7svN2DWXRoM0L+FuOLwJOv8t
	wlqHm4njHEv2lNIAcoLYkfo2nvZjtS/pnWFsI8JzpzKOZO3gi0lDsqO6RyaTjZZlQEKKfl
	xNTL3KPDwoli7i0CO5a8F3ad/BM4jGk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, thuth@redhat.com, alexandru.elisei@arm.com, 
	eric.auger@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, nrb@linux.ibm.com
Subject: Re: [kvm-unit-tests PATCH v2] Makefile: Use CFLAGS in cc-option
Message-ID: <20250408-f7b9cefc2e8b16bad04debc3@orel>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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

Merged through arm/queue.

Thanks,
drew

