Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1525323481
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 01:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlcbV5TZJz3bVc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 11:43:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=hSySjeXt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=hSySjeXt; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dlcb61TKCz30MX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 11:42:55 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id q20so138930pfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 16:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5kYVNmbgvMOZlaQ+xmb8/ZKstsbN1EWY+/Lsj+Py4GY=;
 b=hSySjeXtwY+9ptuXA9xBsj/VCJ/AMvw1iKD2HTpDbAflX7YbnAz3/2PnY8uoxbg49S
 WCUJ+6Igt43GTEUOqKoTEg5xScAcXe+DfAhuYSE9Oj5TaFt+EOzka+YCqIQB+K4kAWb1
 PwkZ8pnBTzzc+VMhRTZGRgWDI2XWPX64rV0CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5kYVNmbgvMOZlaQ+xmb8/ZKstsbN1EWY+/Lsj+Py4GY=;
 b=mULx/ZZTQteaQXxYpcbi/e0leqjduv+JjTHHYINyydgl9NmwEK6hfy+MTVr0HLFf56
 RVsXp+h1uQTwPLDuO46Rx7MGkoaau55dd8BaV5eOPUDFDqnJxMs5KbZRSnC6QSSAzBWJ
 L3prfa4+eL1p446TudiMgjMdKUtdexZ3sTKTgtsApK3O6RHdA1UiFmOzdtEHh47UQYBk
 mX2XB5iQ7chz9YMxtBTyZXYIyh2cQP+p9JjkkQhf3/wVxd9V3bgOiza7W3/zM3xX9vyN
 PoJWfP6BpuLtJHJdEIm1nzZtKMVVYV5vM48faSyHCFsNYXLvmcqfCfqseEBod2f9XUKk
 u/bw==
X-Gm-Message-State: AOAM533hmF5W7bFHshYcBzS3nqpBrMnRkXURy4GT+doAu2OiQom1rkJ6
 ZaB/lO3zVlo2MP9kAfkWjEX6AA==
X-Google-Smtp-Source: ABdhPJzw7I9LaxeV7Y855sXBTO4KIsWPVlE+Zt66g/bJS4hXR129dPcXQzp2gfw+6XNJTBTsX+jrxA==
X-Received: by 2002:a63:170e:: with SMTP id x14mr26240565pgl.245.1614127371919; 
 Tue, 23 Feb 2021 16:42:51 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-8f72-9e89-07fc-5b36.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:8f72:9e89:7fc:5b36])
 by smtp.gmail.com with ESMTPSA id cx6sm283224pjb.39.2021.02.23.16.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 16:42:51 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] selftests/powerpc: Fix L1D flushing tests for Power10
In-Reply-To: <20210223070227.2916871-1-ruscur@russell.cc>
References: <20210223070227.2916871-1-ruscur@russell.cc>
Date: Wed, 24 Feb 2021 11:42:47 +1100
Message-ID: <878s7epa7s.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> The rfi_flush and entry_flush selftests work by using the PM_LD_MISS_L1
> perf event to count L1D misses.  The value of this event has changed
> over time:
>
> - Power7 uses 0x400f0
> - Power8 and Power9 use both 0x400f0 and 0x3e054
> - Power10 uses only 0x3e054
>
> Rather than relying on raw values, configure perf to count L1D read
> misses in the most explicit way available.
>
> This fixes the selftests to work on systems without 0x400f0 as
> PM_LD_MISS_L1, and should change no behaviour for systems that the tests
> already worked on.
>
> The only potential downside is that referring to a specific perf event
> requires PMU support implemented in the kernel for that platform.

So, IIUC:

 - if you used raw events and ran the binary on a P10 system using an
   older kernel that did not support P10 PMU events, you would still get
   valid results
 - but, if the HW perf event changes again, we have the same issue with
   failing tests

vs

 - if you use symbolic events and run the binary on a P10 system using
   an older kernel that does not support P10 PMU events, you would not
   be able to run the test.
 - but, if the HW perf event changes again, the test will continue to
   work. 


This seems like the correct tradeoff to make.

Having spent some quality time with these tests in the past:

Acked-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> v2: Move away from raw events as suggested by mpe
>
>  tools/testing/selftests/powerpc/security/entry_flush.c | 2 +-
>  tools/testing/selftests/powerpc/security/flush_utils.h | 4 ++++
>  tools/testing/selftests/powerpc/security/rfi_flush.c   | 2 +-
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
> index 78cf914fa321..68ce377b205e 100644
> --- a/tools/testing/selftests/powerpc/security/entry_flush.c
> +++ b/tools/testing/selftests/powerpc/security/entry_flush.c
> @@ -53,7 +53,7 @@ int entry_flush_test(void)
>  
>  	entry_flush = entry_flush_orig;
>  
> -	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
> +	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
>  	FAIL_IF(fd < 0);
>  
>  	p = (char *)memalign(zero_size, CACHELINE_SIZE);
> diff --git a/tools/testing/selftests/powerpc/security/flush_utils.h b/tools/testing/selftests/powerpc/security/flush_utils.h
> index 07a5eb301466..7a3d60292916 100644
> --- a/tools/testing/selftests/powerpc/security/flush_utils.h
> +++ b/tools/testing/selftests/powerpc/security/flush_utils.h
> @@ -9,6 +9,10 @@
>  
>  #define CACHELINE_SIZE 128
>  
> +#define PERF_L1D_READ_MISS_CONFIG	((PERF_COUNT_HW_CACHE_L1D) | 		\
> +					(PERF_COUNT_HW_CACHE_OP_READ << 8) |	\
> +					(PERF_COUNT_HW_CACHE_RESULT_MISS << 16))
> +
>  void syscall_loop(char *p, unsigned long iterations,
>  		  unsigned long zero_size);
>  
> diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
> index 7565fd786640..f73484a6470f 100644
> --- a/tools/testing/selftests/powerpc/security/rfi_flush.c
> +++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
> @@ -54,7 +54,7 @@ int rfi_flush_test(void)
>  
>  	rfi_flush = rfi_flush_orig;
>  
> -	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
> +	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
>  	FAIL_IF(fd < 0);
>  
>  	p = (char *)memalign(zero_size, CACHELINE_SIZE);
> -- 
> 2.30.1
