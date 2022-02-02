Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067F4A78A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 20:25:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpsFx6KKNz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 06:25:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HfpmLiVX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=HfpmLiVX; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpsFG4lLHz30Ds
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 06:24:49 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id c188so348313iof.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Feb 2022 11:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NE3exOeMNm2flYeaNgVop/O/qkAVVh5pE8N+h1PodMY=;
 b=HfpmLiVXDR4U0Szm+bVWxXXQ9sFAsUH8KZRrVNozByWLVzzqV6A6dYlS613zKBVVwQ
 Pkndmd5O/xkfx6YMc3fiPRe6a0y4FZroOimn/YdN+k7u4EI1Dmz9pf7heL57+KzlcYNl
 jLIVvxp20ieKgL29Txu/1i9CMnQhDBOHTkNHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NE3exOeMNm2flYeaNgVop/O/qkAVVh5pE8N+h1PodMY=;
 b=Xo1dQIs8u/6qa/CV5tYdKz6YFOwbGYAgmfTEi9WdNQ0jgt9Dc3qSxUGxsC/KGizDjA
 U/IUuhWcYuH8Az/5VJpBkPrBCYjkkuuavJg1pcwBWtR9RnYlby17V+iPMD6xcIYSiRQs
 O1zP7x5u9n3UAGCu8QyA9Z0twtfiP37PZansOzWwbwvZ4cix+P0rBmGClPK+iweBRf8H
 2hBwNeKJObhsa6zr1mwup2gJuZi4g0w3zVNi4zH8yW7U/CqM/0TidJABFJ/6dMwuO9ZQ
 9hORBpRbUcY2EQlry0ukHTxsHa0i1qWl15GJKKa/BOyrm81OUEpC2y8WQFxzp8Ns3g8F
 nwfw==
X-Gm-Message-State: AOAM531tsqvD+6sfyqVBgcOywdHnUVdYYQr3OP/3QosKP8OYyCcTh26E
 impE62tc1nBaa2/0YF1LlTRGuQ==
X-Google-Smtp-Source: ABdhPJy8zO9WU3aaB9Hww46MEd8ort4VanuSZW+Moo6UCdqeub3DuBTxppak6xKCkuOrcbLXJik7CA==
X-Received: by 2002:a02:c956:: with SMTP id u22mr15545117jao.306.1643829886867; 
 Wed, 02 Feb 2022 11:24:46 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id x4sm3116650ilv.2.2022.02.02.11.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 11:24:46 -0800 (PST)
Subject: Re: [PATCH 2/2] KVM: selftests: Add support for ppc64le
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm@vger.kernel.org
References: <20220120170109.948681-1-farosas@linux.ibm.com>
 <20220120170109.948681-3-farosas@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a797d973-cc9b-5c87-368e-ee526ca616ce@linuxfoundation.org>
Date: Wed, 2 Feb 2022 12:24:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220120170109.948681-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org,
 Shuah Khan <skhan@linuxfoundation.org>, npiggin@gmail.com, paulus@samba.org,
 linux-kselftest@vger.kernel.org, pbonzini@redhat.com, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/20/22 10:01 AM, Fabiano Rosas wrote:
> This adds the infrastructure for writing tests for the powerpc
> platform (Only Radix MMU for now).
> 
> This patch also enables two tests:
> 
> - a dummy sample test that creates a guest with one vcpu, issues
>    hypercalls and reads/writes test values from memory.
> 

Since this test does something - rename it to something meaningful
as opposed to sample.

> - the kvm_page_table test, although at this point I'm not using it to
>    test KVM, but mostly as a way to stress test this code.
> 
> $ make -C tools/testing/selftests TARGETS=kvm
> $ make -C tools/testing/selftests TARGETS=kvm run_tests
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   MAINTAINERS                                   |   3 +
>   tools/testing/selftests/kvm/.gitignore        |   1 +
>   tools/testing/selftests/kvm/Makefile          |  14 +-
>   .../selftests/kvm/include/kvm_util_base.h     |   7 +
>   .../selftests/kvm/include/ppc64le/processor.h |  43 +++
>   tools/testing/selftests/kvm/lib/kvm_util.c    |   5 +
>   .../testing/selftests/kvm/lib/powerpc/hcall.S |   6 +
>   .../selftests/kvm/lib/powerpc/processor.c     | 343 ++++++++++++++++++
>   .../testing/selftests/kvm/lib/powerpc/ucall.c |  67 ++++
>   .../selftests/kvm/powerpc/sample_test.c       | 144 ++++++++
>   10 files changed, 630 insertions(+), 3 deletions(-)
>   create mode 100644 tools/testing/selftests/kvm/include/ppc64le/processor.h
>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.S
>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
>   create mode 100644 tools/testing/selftests/kvm/powerpc/sample_test.c
> 

It will be easier to review this if split into a separate patch for
each test.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a76e7558b151..15c89d33d584 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10537,6 +10537,9 @@ F:	arch/powerpc/include/asm/kvm*
>   F:	arch/powerpc/include/uapi/asm/kvm*
>   F:	arch/powerpc/kernel/kvm*
>   F:	arch/powerpc/kvm/
> +F:	tools/testing/selftests/kvm/include/ppc64le/
> +F:	tools/testing/selftests/kvm/lib/powerpc/
> +F:	tools/testing/selftests/kvm/powerpc/
>   
>   KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
>   M:	Anup Patel <anup@brainfault.org>
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 8c129961accf..45ab993e2845 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -46,6 +46,7 @@
>   /x86_64/xen_vmcall_test
>   /x86_64/xss_msr_test
>   /x86_64/vmx_pmu_msrs_test
> +/powerpc/sample_test
>   /access_tracking_perf_test
>   /demand_paging_test
>   /dirty_log_test
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 556da71c33b8..5ae27109e9b9 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -17,9 +17,9 @@ KSFT_KHDR_INSTALL := 1
>   # LINUX_TOOL_ARCH_INCLUDE is set using ARCH variable.
>   #
>   # x86_64 targets are named to include x86_64 as a suffix and directories
> -# for includes are in x86_64 sub-directory. s390x and aarch64 follow the
> -# same convention. "uname -m" doesn't result in the correct mapping for
> -# s390x and aarch64.
> +# for includes are in x86_64 sub-directory. s390x, aarch64 and ppc64le
> +# follow the same convention. "uname -m" doesn't result in the correct
> +# mapping for s390x, aarch64 and ppc64le.
>   #
>   # No change necessary for x86_64
>   UNAME_M := $(shell uname -m)
> @@ -36,12 +36,17 @@ endif
>   ifeq ($(ARCH),riscv)
>   	UNAME_M := riscv
>   endif
> +# Set UNAME_M for ppc64le compile/install to work
> +ifeq ($(ARCH),powerpc)
> +	UNAME_M := ppc64le
> +endif
>   
>   LIBKVM = lib/assert.c lib/elf.c lib/io.c lib/kvm_util.c lib/rbtree.c lib/sparsebit.c lib/test_util.c lib/guest_modes.c lib/perf_test_util.c
>   LIBKVM_x86_64 = lib/x86_64/apic.c lib/x86_64/processor.c lib/x86_64/vmx.c lib/x86_64/svm.c lib/x86_64/ucall.c lib/x86_64/handlers.S
>   LIBKVM_aarch64 = lib/aarch64/processor.c lib/aarch64/ucall.c lib/aarch64/handlers.S lib/aarch64/spinlock.c lib/aarch64/gic.c lib/aarch64/gic_v3.c lib/aarch64/vgic.c
>   LIBKVM_s390x = lib/s390x/processor.c lib/s390x/ucall.c lib/s390x/diag318_test_handler.c
>   LIBKVM_riscv = lib/riscv/processor.c lib/riscv/ucall.c
> +LIBKVM_ppc64le = lib/powerpc/processor.c lib/powerpc/ucall.c lib/powerpc/hcall.S
>   
>   TEST_GEN_PROGS_x86_64 = x86_64/cr4_cpuid_sync_test
>   TEST_GEN_PROGS_x86_64 += x86_64/get_msr_index_features
> @@ -133,6 +138,9 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
>   TEST_GEN_PROGS_riscv += set_memory_region_test
>   TEST_GEN_PROGS_riscv += kvm_binary_stats_test
>   
> +TEST_GEN_PROGS_ppc64le += powerpc/sample_test

Same comment as above. Find a name that desribes what this does?

> +TEST_GEN_PROGS_ppc64le += kvm_page_table_test
> +
>   TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(UNAME_M))
>   LIBKVM += $(LIBKVM_$(UNAME_M))
>   
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 66775de26952..a930d663fe67 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -54,6 +54,7 @@ enum vm_guest_mode {
>   	VM_MODE_P36V48_16K,
>   	VM_MODE_P36V48_64K,
>   	VM_MODE_P36V47_16K,
> +	VM_MODE_P51V52_64K,
>   	NUM_VM_MODES,
>   };
>   
> @@ -87,6 +88,12 @@ extern enum vm_guest_mode vm_mode_default;
>   #define MIN_PAGE_SHIFT			12U
>   #define ptes_per_page(page_size)	((page_size) / 8)
>   
> +#elif defined(__powerpc__)
> +
> +#define VM_MODE_DEFAULT			VM_MODE_P51V52_64K
> +#define MIN_PAGE_SHIFT			16U
> +#define ptes_per_page(page_size)	((page_size) / 8)
> +
>   #endif
>   
>   #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
> diff --git a/tools/testing/selftests/kvm/include/ppc64le/processor.h b/tools/testing/selftests/kvm/include/ppc64le/processor.h
> new file mode 100644
> index 000000000000..fbc1332b2b80
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/ppc64le/processor.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * powerpc processor specific defines
> + */
> +#ifndef SELFTEST_KVM_PROCESSOR_H
> +#define SELFTEST_KVM_PROCESSOR_H

Let's make this SELFTEST_KVM_PPC_PROCESSOR_H - it will be
a scpefici to ppc

> +
> +#define PPC_BIT(x) (1ULL << (63 - x))
> +
> +#define MSR_SF  PPC_BIT(0)
> +#define MSR_IR  PPC_BIT(58)
> +#define MSR_DR  PPC_BIT(59)
> +#define MSR_LE  PPC_BIT(63)
> +
> +#define LPCR_UPRT  PPC_BIT(41)
> +#define LPCR_EVIRT PPC_BIT(42)
> +#define LPCR_HR    PPC_BIT(43)
> +#define LPCR_GTSE  PPC_BIT(53)
> +
> +#define PATB_GR	PPC_BIT(0)
> +
> +#define PTE_VALID PPC_BIT(0)
> +#define PTE_LEAF  PPC_BIT(1)
> +#define PTE_R	  PPC_BIT(55)
> +#define PTE_C	  PPC_BIT(56)
> +#define PTE_RC	  (PTE_R | PTE_C)
> +#define PTE_READ  0x4
> +#define PTE_WRITE 0x2
> +#define PTE_EXEC  0x1
> +#define PTE_RWX   (PTE_READ|PTE_WRITE|PTE_EXEC)
> +
> +extern uint64_t hcall(uint64_t nr, ...);
> +
> +static inline uint32_t mfpvr(void)
> +{
> +	uint32_t pvr;
> +
> +	asm ("mfpvr %0"
> +	     : "=r"(pvr));

Let's match the asm() style with the rest of the asm code in this
test. Same line.

asm ("mfpvr %0" : "=r"(pvr));

> +	return pvr;
> +}
> +
> +#endif

thanks,
-- Shuah
