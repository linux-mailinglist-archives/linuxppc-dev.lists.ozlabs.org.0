Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C268167A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 17:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5DJ64rPJz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 03:33:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KVmuLAq6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KVmuLAq6;
	dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5DHC0ZTPz3bh6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 03:32:20 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id u8so5317263ilq.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWrtWG8MThNoqJJD59hvCVnxXQO10Lw87QwcI21YP84=;
        b=KVmuLAq6+1sLlsEegGJvCE/YAC1AN/dGZFD+I5P4dirBM7Nnz/hVe/+O01yMaSpGeH
         qSdHj1BJcIJzegg2lrrfLCiqOPKZsEoImq6GatwLbKEJAtB8Fm9r++QV7Rl0IYyfbrWk
         JqWixarDELqPKRMRel8ameXlhyEHhbQr0w1Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWrtWG8MThNoqJJD59hvCVnxXQO10Lw87QwcI21YP84=;
        b=ExUlkOuijOd6VEcCRS1e6g3w0ICrLrYDg5S+FyB6GMSXpLVIvGxrA3Si6WHcKAad1Z
         hBLzRyL3m6BgBEV6CRayJaw5YGnOhLP8wGtFyFWMo36XA2VTDa0Uy6U1WtqeaFF9IO14
         P1Eod5otVIw1+1F0P19mi5+MqKDwZtLZBmdSzSy+179GoYXnSrSytzlLpZdw2c2pQMqE
         CTvPuLvhJt70yXxQu0ftxQpSP3ddtrs4X3pjNTyTz/ouYgU/1W+9v5kZT27DgcynUfWq
         WX7DoQgNaSYrcWhV4o2Xf1byuuqho6x6h0klelYRP+BY6J21MIVHgaqC4PRP2IyP+oLL
         9rdw==
X-Gm-Message-State: AFqh2kosbPaNAffIHchmqYTLZIHTzq0h+yuvY2nfniEYB62K/22Cl7BR
	KuUz5+9MHs4VLGRoiuQ4+9SVOw==
X-Google-Smtp-Source: AMrXdXuU3+9j/Rjvw8C+ukn67BvaWIEI91xJn2ZY7kFLPKG3RDFG4Qms2skTiiP3lY4Uj0ew4JcMgA==
X-Received: by 2002:a92:2a07:0:b0:30c:1dda:42dd with SMTP id r7-20020a922a07000000b0030c1dda42ddmr7228513ile.1.1675096337499;
        Mon, 30 Jan 2023 08:32:17 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id c62-20020a029644000000b003a96cc2bbdesm4273919jai.85.2023.01.30.08.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 08:32:16 -0800 (PST)
Message-ID: <0d95f6b4-c949-2f06-62fb-f35d70b1782d@linuxfoundation.org>
Date: Mon, 30 Jan 2023 09:32:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 21/34] selftests: powerpc: Fix incorrect kernel headers
 search path
Content-Language: en-US
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
 <20230127135755.79929-22-mathieu.desnoyers@efficios.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230127135755.79929-22-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/23 06:57, Mathieu Desnoyers wrote:
> Use $(KHDR_INCLUDES) as lookup path for kernel headers. This prevents
> building against kernel headers from the build environment in scenarios
> where kernel headers are installed into a specific output directory
> (O=...).
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: linux-kselftest@vger.kernel.org
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: <stable@vger.kernel.org>    [5.18+]
> ---
>   tools/testing/selftests/powerpc/ptrace/Makefile   | 2 +-
>   tools/testing/selftests/powerpc/security/Makefile | 2 +-
>   tools/testing/selftests/powerpc/syscalls/Makefile | 2 +-
>   tools/testing/selftests/powerpc/tm/Makefile       | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
> index 2f02cb54224d..cbeeaeae8837 100644
> --- a/tools/testing/selftests/powerpc/ptrace/Makefile
> +++ b/tools/testing/selftests/powerpc/ptrace/Makefile
> @@ -33,7 +33,7 @@ TESTS_64 := $(patsubst %,$(OUTPUT)/%,$(TESTS_64))
>   $(TESTS_64): CFLAGS += -m64
>   $(TM_TESTS): CFLAGS += -I../tm -mhtm
>   
> -CFLAGS += -I../../../../../usr/include -fno-pie
> +CFLAGS += $(KHDR_INCLUDES) -fno-pie
>   
>   $(OUTPUT)/ptrace-gpr: ptrace-gpr.S
>   $(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: LDLIBS += -pthread
> diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
> index 7488315fd847..e0d979ab0204 100644
> --- a/tools/testing/selftests/powerpc/security/Makefile
> +++ b/tools/testing/selftests/powerpc/security/Makefile
> @@ -5,7 +5,7 @@ TEST_PROGS := mitigation-patching.sh
>   
>   top_srcdir = ../../../../..
>   
> -CFLAGS += -I../../../../../usr/include
> +CFLAGS += $(KHDR_INCLUDES)
>   
>   include ../../lib.mk
>   
> diff --git a/tools/testing/selftests/powerpc/syscalls/Makefile b/tools/testing/selftests/powerpc/syscalls/Makefile
> index b63f8459c704..d1f2648b112b 100644
> --- a/tools/testing/selftests/powerpc/syscalls/Makefile
> +++ b/tools/testing/selftests/powerpc/syscalls/Makefile
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   TEST_GEN_PROGS := ipc_unmuxed rtas_filter
>   
> -CFLAGS += -I../../../../../usr/include
> +CFLAGS += $(KHDR_INCLUDES)
>   
>   top_srcdir = ../../../../..
>   include ../../lib.mk
> diff --git a/tools/testing/selftests/powerpc/tm/Makefile b/tools/testing/selftests/powerpc/tm/Makefile
> index 5881e97c73c1..3876805c2f31 100644
> --- a/tools/testing/selftests/powerpc/tm/Makefile
> +++ b/tools/testing/selftests/powerpc/tm/Makefile
> @@ -17,7 +17,7 @@ $(TEST_GEN_PROGS): ../harness.c ../utils.c
>   CFLAGS += -mhtm
>   
>   $(OUTPUT)/tm-syscall: tm-syscall-asm.S
> -$(OUTPUT)/tm-syscall: CFLAGS += -I../../../../../usr/include
> +$(OUTPUT)/tm-syscall: CFLAGS += $(KHDR_INCLUDES)
>   $(OUTPUT)/tm-tmspr: CFLAGS += -pthread
>   $(OUTPUT)/tm-vmx-unavail: CFLAGS += -pthread -m64
>   $(OUTPUT)/tm-resched-dscr: ../pmu/lib.c

Adding powerpc maitainers.

Would you me to take this patch through kselftest tree? If you
decide to take this through yours:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
