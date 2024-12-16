Return-Path: <linuxppc-dev+bounces-4151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6F9F2EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBcWr0bS5z2yhP;
	Mon, 16 Dec 2024 22:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734347048;
	cv=none; b=LIaZ7hmpMKJ6DzcOYEk0sJo1zDbIA+87ULWUdWkR2veARV5X3aBxr+UgAW5JEdrST79DPGebhA1tiaAP8PQejaS6Hddgrp+0Y3SD0+Qg2pCouckWkjtGH7UXbzVUNRJhEOiF/fZI085IRlu1QttGcvEsQoB9gcszQjHHKrOKlWwF2l9C3WCQ4bJTXAztxDA5R6S9wC26jEpJ16YkTVPdESN8FzH/nY9eC/TSPwW21aevMtGrYCb3O+RiCF8v0rlQGZ9cQqJJTf8VmdhSH+HuWSIAVlvTh6v1dZzkjI/eHRAr67gJ3VAvV8ekNoGzs0/oQcniADIVEXwJY2jdzGV/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734347048; c=relaxed/relaxed;
	bh=gnyomrbbH71hy5x29CyLw5kngPIRQhxtjeFPjHZ4daA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Df5QxhfGSCdObmR4SleXX+QWqTEvJlAiiBKx4thWeXsu9hgq8t8ANa1iuZ0fywIOxjDGSumcHK7pEetcmfOJdwrnXS20rYRD+s4JqgEWicyMojtQWUilMsE5VVGAc9Z7iFiVsBODQMyyxFghhUetaQtMc9QJ/9KKi2KS3VdXzgbw29SD2cP06BWJuHGhb6+oklza82nhwnrMg5NaB0j7aKn2AU2LvSuBjI5/rsbx4NtjhTceXAVUtwDgnfzvRIEZVFzIpWhKDzMqpOK1X5ndnxZC5cry8EgWXDTq3nFcWAAx5oEv7Jrr3cHbwLq0Bn8LdaeNx1xjCopvN6Vope5utQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VStddlfS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VStddlfS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBcWp0LjLz2yZ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:04:05 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-725dbdf380aso3024719b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 03:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734347042; x=1734951842; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnyomrbbH71hy5x29CyLw5kngPIRQhxtjeFPjHZ4daA=;
        b=VStddlfSfilaVpVwPmRFVRklzdo03/byFPJXx8hCKy80Ds9SF9LKM4DA+CfC4XtqHX
         cqStsH8hAHNrFZ4nup13K0slpJAUYHtOkj9BxGtWabu8ECDcY/M84f42gDROWqQptW6s
         E1FrxPvu/rbj38fKDuGlbgsv7TtXvrIj5IT9nZcSousVu/M2ek56YPV7f2JAHdnUnJ4C
         0lkQc+YgPmoFflm4sdmnfgrCny3RrKVuZnoypIsb+EilLPnA4jvSrGw1+W1AMOJSR1KE
         tCG2k9t8izEsos7LXzg3O8rttTgLP4XXjCGHsI6zIdxYM4Z0MxG9S0Ovg/CUXfrHhA/I
         wXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734347042; x=1734951842;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnyomrbbH71hy5x29CyLw5kngPIRQhxtjeFPjHZ4daA=;
        b=UfLBm7d+xHGTlN4XJPTr/+P0gOgZCoZEubquc7gdKiI1/JomJrOhIY16vHiE8XScur
         2z5dBv3RVnbm6tEs32LJCji/zmBXN2VlPIZ7rPNSegldm0j4e5zsndq0WYGeV6MpgsT3
         0zmpccUCiIWO2QMTMQjmzD7x3HO/AP9PKaFP1jPbwPrqJTDFFekSShVjucE25YOk3E/x
         1gz/GwSMgB/x5M0Cbj63BWd13ahbaiaBomXRTgolKcPed7l4RTiPCwckPgDkQnPQa+n/
         FGF00AQ8VPHR3qdn+MgiWFMTPhBGP7YdEDP54ZULiEFf45tMVIiNBmM0MNTn2A/uC1nM
         96LA==
X-Gm-Message-State: AOJu0YyK58LY4kn5X03W9wDIJ4P1l2+4myc1IqtIFNSHUqIIEaeK6CJA
	QEENqwyB1zDXAeU/droRb/DsFuvcaA3UMc93RlANH8K2pNfHyqqR
X-Gm-Gg: ASbGncu16C9CD//bWRzLmxkSuwnY8/m7DGJOhMb/urK0lb3KdUv39CgtccG2wFSR7Ng
	aVd7C8G2dcWS2Bdv4e3DEaRbauO1XHTA153qq5lmMk3zOFNckRrSbf7xKZ1ZXFMNXv2XG4paBQo
	+3mOxdeIoPfc4W2ACQeGAi/+WmoZ3jGld5XKrK9oeTAz7F2VZMFB4RtApMUlZANch3Zg8qJJPoU
	e5vBpePmQ0fzoLj/jImefsTxaZW/Db1YxWGpNz0BwlqRuyA4A==
X-Google-Smtp-Source: AGHT+IHv/dKmYY49IAGHVjgEthrBcbNdF2QQcOvVyzK3tdGCnz0JYSPwnkBeaAuUqwtxjbmP0WyFLg==
X-Received: by 2002:a17:90b:3902:b0:2ee:c91a:ad05 with SMTP id 98e67ed59e1d1-2f28fa55be2mr16492998a91.3.1734347042392;
        Mon, 16 Dec 2024 03:04:02 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a1e7e348sm4404198a91.8.2024.12.16.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:04:01 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 3/3] selftest/powerpc/ptrace: Cleanup duplicate macro definitions
In-Reply-To: <20241209151418.348085-3-maddy@linux.ibm.com>
Date: Mon, 16 Dec 2024 16:27:03 +0530
Message-ID: <87ldwf520w.fsf@gmail.com>
References: <20241209151418.348085-1-maddy@linux.ibm.com> <20241209151418.348085-3-maddy@linux.ibm.com>
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

> Both core-pkey.c and ptrace-pkey.c tests have similar macro
> definitions, move them to "pkeys.h" and remove the macro
> definitions from the C file.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  tools/testing/selftests/powerpc/include/pkeys.h      | 8 ++++++++
>  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 8 --------
>  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 8 --------
>  3 files changed, 8 insertions(+), 16 deletions(-)
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
> index 31c9bf6d95db..f8ff05e5bf6e 100644
> --- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> +++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> @@ -18,18 +18,10 @@
>  #include "child.h"
>  #include "pkeys.h"
>  
> -#ifndef NT_PPC_PKEY
> -#define NT_PPC_PKEY		0x110
> -#endif
> -
>  #ifndef PKEY_DISABLE_EXECUTE
>  #define PKEY_DISABLE_EXECUTE	0x4
>  #endif

We could remove this as well right. Since pkeys.h already has this
permission defines i.e.
PKEY_DISABLE_[ACCESS|WRITE|EXECUTE] 

>  
> -#define AMR_BITS_PER_PKEY 2
> -#define PKEY_REG_BITS (sizeof(u64) * 8)
> -#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
> -
>  #define CORE_FILE_LIMIT	(5 * 1024 * 1024)	/* 5 MB should be enough */
>  
>  static const char core_pattern_file[] = "/proc/sys/kernel/core_pattern";
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
> index 6893ed096457..5d528d0ea9d1 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
> @@ -9,18 +9,10 @@
>  #include "child.h"
>  #include "pkeys.h"
>  
> -#ifndef NT_PPC_PKEY
> -#define NT_PPC_PKEY		0x110
> -#endif
> -
>  #ifndef PKEY_DISABLE_EXECUTE
>  #define PKEY_DISABLE_EXECUTE	0x4
>  #endif
>  

Same here. This can be cleaned up, no? Since pkeys already has this defined.


-ritesh

> -#define AMR_BITS_PER_PKEY 2
> -#define PKEY_REG_BITS (sizeof(u64) * 8)
> -#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
> -
>  static const char user_read[] = "[User Read (Running)]";
>  static const char user_write[] = "[User Write (Running)]";
>  static const char ptrace_read_running[] = "[Ptrace Read (Running)]";
> -- 
> 2.47.0

