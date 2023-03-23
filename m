Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 140326C6A84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:15:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj6mn6CvZz3f9s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 01:15:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gwehACYH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gwehACYH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gwehACYH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gwehACYH;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj6lt3CXgz3cj9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 01:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679580854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxDKUlZyoUGwaVLgr7eBvNFATgoiI7SiN8TqrQ4NDJk=;
	b=gwehACYHgcaoYuvuU+GCOr0etK2LYyH/aNea60Yf3SLTD9FFDTr+X9l+IaMMctBbQ1vMN2
	APpzO44TsWUHsoaraeOJfrGVLd7tIXxxu2wDiQb+ik7GDQwRWb0/upX5qQkhcppJhnVEr5
	tpogYrf4kykC+/FRmdw3VzKQLfQYKGw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679580854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxDKUlZyoUGwaVLgr7eBvNFATgoiI7SiN8TqrQ4NDJk=;
	b=gwehACYHgcaoYuvuU+GCOr0etK2LYyH/aNea60Yf3SLTD9FFDTr+X9l+IaMMctBbQ1vMN2
	APpzO44TsWUHsoaraeOJfrGVLd7tIXxxu2wDiQb+ik7GDQwRWb0/upX5qQkhcppJhnVEr5
	tpogYrf4kykC+/FRmdw3VzKQLfQYKGw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-SZQJZLQ_PFmBoUAO1-ZkDA-1; Thu, 23 Mar 2023 10:14:12 -0400
X-MC-Unique: SZQJZLQ_PFmBoUAO1-ZkDA-1
Received: by mail-wm1-f69.google.com with SMTP id k1-20020a05600c1c8100b003ee6dbceb81so1005792wms.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 07:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679580851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxDKUlZyoUGwaVLgr7eBvNFATgoiI7SiN8TqrQ4NDJk=;
        b=OWPxw4pqbjYNjX+R67KD48DXPd6p8qRCtVTVeseQ8wFDtJ2hzLaplyxRhT5pOhguXI
         lkXwp68KNCtzPH04OIFpBQgvzc0Oq1ByeKlfTGdEf0+JRRourzFHUY76CVN7BVjkSz0r
         chGgh/0FAkTibSeymQU6AGDqfMZn/5dtVFHWTMYbJrTvMH1kehOLDij86QcfKaWjcyD2
         KFtfF8+ELFfEU12DxFBMsdFPb1vIbQDiaiIE0VoRTBUiT4Ki57+l/iSSUco8/5ng+Xk/
         2vfbOaY73Y8hEB8sjWK1qNkTHxodQTasixA5s58BHrsjbuh6jbZewyLbdlnrQmMQAWP/
         VUVw==
X-Gm-Message-State: AAQBX9fzsGw+/3glhMExe8OA/0v6fkV7WNJIhaWuT2Tk/OBqoyw/aFUi
	+AavKo6W++5wHCyp3fz+n+M0+9CeJg1R9bwdMRysUeTuzip1Ph3yPgaPrWkXuDv7U2jdeYxfJz9
	NHSMu8Mh4VTE++WGIR8kVUTRQwQ==
X-Received: by 2002:a5d:4e83:0:b0:2cf:e445:295f with SMTP id e3-20020a5d4e83000000b002cfe445295fmr2772087wru.61.1679580851571;
        Thu, 23 Mar 2023 07:14:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350acmls2sCF3QXxHFpxw/8qHUfIyBxACLTfPzxQSRPvkp3EL6IqVZWX7zw10WKrc1KMcfGn0nQ==
X-Received: by 2002:a5d:4e83:0:b0:2cf:e445:295f with SMTP id e3-20020a5d4e83000000b002cfe445295fmr2772073wru.61.1679580851323;
        Thu, 23 Mar 2023 07:14:11 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b002d2f0e23acbsm16216116wrw.12.2023.03.23.07.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:14:10 -0700 (PDT)
Message-ID: <3516a985-2254-8522-2a71-d9e58e91b5f1@redhat.com>
Date: Thu, 23 Mar 2023 15:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v2 09/10] powerpc: Support powernv machine with
 QEMU TCG
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-10-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320070339.915172-10-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/03/2023 08.03, Nicholas Piggin wrote:
> This is a basic first pass at powernv support using OPAL (skiboot)
> firmware.
> 
> The ACCEL is a bit clunky, now defaulting to tcg for powernv machine.
> It also does not yet run in the run_tests.sh batch process, more work
> is needed to exclude certain tests (e.g., rtas) and adjust parameters
> (e.g., increase memory size) to allow powernv to work. For now it
> can run single test cases.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/ppc_asm.h   |  5 +++
>   lib/powerpc/asm/processor.h | 14 ++++++++
>   lib/powerpc/hcall.c         |  4 +--
>   lib/powerpc/io.c            | 33 ++++++++++++++++--
>   lib/powerpc/io.h            |  6 ++++
>   lib/powerpc/processor.c     | 10 ++++++
>   lib/powerpc/setup.c         | 10 ++++--
>   lib/ppc64/asm/opal.h        | 11 ++++++
>   lib/ppc64/opal-calls.S      | 46 +++++++++++++++++++++++++
>   lib/ppc64/opal.c            | 67 +++++++++++++++++++++++++++++++++++++
>   powerpc/Makefile.ppc64      |  2 ++
>   powerpc/cstart64.S          |  7 ++++
>   powerpc/run                 | 30 ++++++++++++++---
>   13 files changed, 234 insertions(+), 11 deletions(-)
>   create mode 100644 lib/ppc64/asm/opal.h
>   create mode 100644 lib/ppc64/opal-calls.S
>   create mode 100644 lib/ppc64/opal.c
> 
> diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
> index 6299ff5..5eec9d3 100644
> --- a/lib/powerpc/asm/ppc_asm.h
> +++ b/lib/powerpc/asm/ppc_asm.h
> @@ -36,7 +36,12 @@
>   #endif /* __BYTE_ORDER__ */
>   
>   /* Machine State Register definitions: */
> +#define MSR_LE_BIT	0
>   #define MSR_EE_BIT	15			/* External Interrupts Enable */
> +#define MSR_HV_BIT	60			/* Hypervisor mode */
>   #define MSR_SF_BIT	63			/* 64-bit mode */
>   
> +#define SPR_HSRR0	0x13A
> +#define SPR_HSRR1	0x13B
> +
>   #endif /* _ASMPOWERPC_PPC_ASM_H */
> diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> index ebfeff2..8084787 100644
> --- a/lib/powerpc/asm/processor.h
> +++ b/lib/powerpc/asm/processor.h
> @@ -3,12 +3,26 @@
>   
>   #include <libcflat.h>
>   #include <asm/ptrace.h>
> +#include <asm/ppc_asm.h>
>   
>   #ifndef __ASSEMBLY__
>   void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
>   void do_handle_exception(struct pt_regs *regs);
>   #endif /* __ASSEMBLY__ */
>   
> +/*
> + * If this returns true on PowerNV / OPAL machines which run in hypervisor
> + * mode. False on pseries / PAPR machines that run in guest mode.

s/If this/This/

  Thomas

