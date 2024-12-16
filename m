Return-Path: <linuxppc-dev+bounces-4207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1199F37A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 18:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBnDK4bPbz2ypx;
	Tue, 17 Dec 2024 04:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734370577;
	cv=none; b=fJaWMabXBq6iF9jnosC92NDZY1ZyNA8zdTghwJB51b+M4Q+LzhBQgTaNaYVgv3GWw5t9RoUiypvyK2SZPuuG96VpJZkeUoULbVIhxQe6T7R72t8k9mG05G1JEKcRkli6WKUkLvPsvpsVEQLRGRCaJjfbkua6Xsvlmp/i8SB6FjHz2O7vLWC2WMj/wJu8wJ2DXmDRv+ryG5HnWMmvgVhuDYIeSCKTQm+uLHUSu2IMyW5V2FwkISLzKcYs5WfaDO3b+IJ+VzH03mIw1S/F37jQL9pnVQhvzjOZX8fQZKB11Q+BUctl37D8D/Gg3YQUHb2gRJnKpsSaz0p9wJmIUBsxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734370577; c=relaxed/relaxed;
	bh=FSidIYogNXz2GKEcIpG1NgqD/WO+bMgS5pOibDpj814=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=ckLlKJxcd7slrqUexhPlKGfi5xMoP7fGfMOVSXawIOWHmYAuLzlvYj5QWOqgk6JgwJarclehhVNWl6oMkHQZ852t0IFL136zaUNZPPvjSQpITgNaeN+xsFGRYaPLGV4XwY/trVcWTy856lwMm0rouDQKX19IcWtyaOobNUr7JxTFCDsxvFYpKgQ7wGnkApkMiHiba/ajqe55MHx4FmcdKuh6fvQhkBG5dhLw8IvKQOAp+RAioFvsXcdYepfCpjctMqsYwmBQCtdXf64s3ICZsdtbsIdbPIHIbn6GJa7pgew7uSwqtrsPXDm5wji72FVcN8bhUl6GmGHZ2RCgedb8+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TvbOJWoR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TvbOJWoR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBnDH6nFXz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 04:36:13 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-728f28744c5so3964923b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734370570; x=1734975370; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSidIYogNXz2GKEcIpG1NgqD/WO+bMgS5pOibDpj814=;
        b=TvbOJWoRprQ0pnr4z3OauFHZbQoPStoDXlzKdX+vRIWKcPHkxy/yFbYFrp3Ua5fGa/
         lWheDRISrLVBOhr2f94dI9c5dWxu+TSXpxuB076VWlpWXSutWRkuozWQgUU5D6wb6HyF
         VvHfdreGr8tsJnqiB0XHqe3koH14nJ2g6DCwGHjE6MRqx/9CSdUiLGLw3wvyBiAv5C2y
         PcVY2YmnWMhmRwLMROF6acw+j9B8M+JjNhocGw3EabD+cfA+s1lBD2WCAzJ1AmM0w9Xb
         HAF6cOgsExXTcvzbiYj8FNFvzV7FyOnWUX4XtacMPBwkyT3O5IBFEnX5GuIFXYaZP+Al
         CfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734370570; x=1734975370;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSidIYogNXz2GKEcIpG1NgqD/WO+bMgS5pOibDpj814=;
        b=KOe3IBsOUjjbgWXTI1HcegaF8tyKkW56tCJ+8q+3OlNY2Eh9Zw0UrXefSlcqCoPYiX
         +KPgZA0z07NqCJbMEOg//gH+EboJqDHcA+wdeNDR2uDm2LQ2MP0QzKsDNb8yOfPtmgC+
         bmg5Vgm2myaKHt/XnRlXpz7uFqktSLJ9zFQTLe95blXObFpDKsKiSqUcgVX/EUouxihb
         k6qmox8WqPUutFIUrsZ8K98DdSJyywDut7DtGYQujr9lS11T4TlKhrrsuo8C5u6A0gjA
         RIax5//ETkXI/ju1mrbnWrkgr+o6HwRYcJqOerLRCb7tOUf1mf5lU1IxlDNzV2Y/7eWR
         6AOw==
X-Gm-Message-State: AOJu0YznUZsnHlFJNM1ZHFMyZwN3Fbxsx/ptpnO2vdTQs5cGAMLnehfi
	yp82YUL1mQRYFfIBGEPGYkVv2PH1udPWcrdO5aE95n6HvN0cFV/L
X-Gm-Gg: ASbGncuC80cYtT1EqtD7fRSvyuF2ASWw/0YWuESWOB1UBywCE1wbIt3Gr9uh6oJlFUY
	FUL928QiN1TuxHAvABE5WvB28CqipO4CrcAUlb3odqP52ZL+A2hPzwo4gGi64JaFAKARet2WWRb
	cgKmdb0ZVxXMISsmUesjUjW/TGGxiL7xzqPBI8oXIY/yk7KY3vJfxHqgTuiADmw1GcLGM4ftSqH
	Fat/Y1tESEv+LrmxSh/zXlauXRfXGZh69LdaMVD434YwbKoPQ==
X-Google-Smtp-Source: AGHT+IExEQkn+NPoAaYjM4wJoDfBmC62mhKiXO92/+2AgclJqqMbMv84UkJ6llvY+HQqci7zKrX/ZA==
X-Received: by 2002:a05:6a20:9c8d:b0:1e0:cfc0:df34 with SMTP id adf61e73a8af0-1e1dfd3ea15mr20259089637.16.1734370569570;
        Mon, 16 Dec 2024 09:36:09 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b78986sm5008691b3a.91.2024.12.16.09.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:36:08 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] selftest/powerpc/ptrace: Cleanup duplicate macro definitions
In-Reply-To: <20241216160257.87252-3-maddy@linux.ibm.com>
Date: Mon, 16 Dec 2024 22:54:02 +0530
Message-ID: <87ikrj4k3x.fsf@gmail.com>
References: <20241216160257.87252-1-maddy@linux.ibm.com> <20241216160257.87252-3-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> Both core-pkey.c and ptrace-pkey.c tests have
> similar macro definitions, move them to "pkeys.h"
> and remove the macro definitions from the C file.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v1:
>  - Removed additional macros pointed out by Ritesh
>    which are duplicates and are avilable in "pkeys.h"

Thanks! The changes looks good to me. 

Please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


Gave a quick run on my lpar too - 

# selftests: powerpc/ptrace: core-pkey
# test: core_pkey
# [User Write (Running)]         AMR: 3cffffffffffffff pkey1: 4 pkey2: 5 pkey3: 6
# success: core_pkey
ok 9 selftests: powerpc/ptrace: core-pkey
# selftests: powerpc/ptrace: ptrace-pkey
# test: ptrace_pkey
# [User Write (Running)]         AMR: 3cffffffffffffff pkey1: 4 pkey2: 5 pkey3: 6
# success: ptrace_pkey
ok 13 selftests: powerpc/ptrace: ptrace-pkey


-ritesh

>
>  tools/testing/selftests/powerpc/include/pkeys.h      |  8 ++++++++
>  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 12 ------------
>  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 12 ------------
>  3 files changed, 8 insertions(+), 24 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
> index 51729d9a7111..3a0129467de6 100644
> --- a/tools/testing/selftests/powerpc/include/pkeys.h
> +++ b/tools/testing/selftests/powerpc/include/pkeys.h
> @@ -35,10 +35,18 @@
>  #define __NR_pkey_alloc		384
>  #define __NR_pkey_free		385
>  
> +#ifndef NT_PPC_PKEY
> +#define NT_PPC_PKEY		0x110
> +#endif
> +
>  #define PKEY_BITS_PER_PKEY	2
>  #define NR_PKEYS		32
>  #define PKEY_BITS_MASK		((1UL << PKEY_BITS_PER_PKEY) - 1)
>  
> +#define AMR_BITS_PER_PKEY 2
> +#define PKEY_REG_BITS (sizeof(u64) * 8)
> +#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
> +
>  inline unsigned long pkeyreg_get(void)
>  {
>  	return mfspr(SPRN_AMR);
> diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> index 31c9bf6d95db..f061434af452 100644
> --- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> +++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> @@ -18,18 +18,6 @@
>  #include "child.h"
>  #include "pkeys.h"
>  
> -#ifndef NT_PPC_PKEY
> -#define NT_PPC_PKEY		0x110
> -#endif
> -
> -#ifndef PKEY_DISABLE_EXECUTE
> -#define PKEY_DISABLE_EXECUTE	0x4
> -#endif
> -
> -#define AMR_BITS_PER_PKEY 2
> -#define PKEY_REG_BITS (sizeof(u64) * 8)
> -#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
> -
>  #define CORE_FILE_LIMIT	(5 * 1024 * 1024)	/* 5 MB should be enough */
>  
>  static const char core_pattern_file[] = "/proc/sys/kernel/core_pattern";
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
> index 6893ed096457..fc633014424f 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
> @@ -9,18 +9,6 @@
>  #include "child.h"
>  #include "pkeys.h"
>  
> -#ifndef NT_PPC_PKEY
> -#define NT_PPC_PKEY		0x110
> -#endif
> -
> -#ifndef PKEY_DISABLE_EXECUTE
> -#define PKEY_DISABLE_EXECUTE	0x4
> -#endif
> -
> -#define AMR_BITS_PER_PKEY 2
> -#define PKEY_REG_BITS (sizeof(u64) * 8)
> -#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
> -
>  static const char user_read[] = "[User Read (Running)]";
>  static const char user_write[] = "[User Write (Running)]";
>  static const char ptrace_read_running[] = "[Ptrace Read (Running)]";
> -- 
> 2.47.0

