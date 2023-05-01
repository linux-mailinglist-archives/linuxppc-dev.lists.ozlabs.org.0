Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9C6F3123
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 14:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q92x86v88z3fDb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 22:45:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=cwwHyIgX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=cwwHyIgX;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q92wK1F5hz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 May 2023 22:44:31 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b70ca0a84so2906583b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682945067; x=1685537067;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+/m/Q8rJDfBtNlvA5MoeSZihLHMU+hMCap0lrbB/rs=;
        b=cwwHyIgX4KWvvBvY8nSBkLAFNRsKMYzp6WW1Di0i93YYJQgPlYiPsZZCu6Q8jvx894
         ycO1ma38TjwwxCTgtSZueTlcY4Th+uxr3S4GZBnOqQEH/2pBTsxgbr9pWx/8L3JZczbj
         MnpoznAqXqI5UK+Sm37GsXne1PqltuZm1m4Xu8tVG+/im46OIrq2m1j0tSR/GAxO8Bh4
         VdlXDlQkolJTQQTRdSXDTZdb4WP2mQUEn80kYCVF+/O11w7FZ444LzumBUmo4iRb4nVZ
         uU5vUU+SbF4ykTZ8FxZUOcJJPtSPqDIpmNPWpIGo5upiSDMbV64yvLxaou3JoJtoNA5f
         aYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945067; x=1685537067;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+/m/Q8rJDfBtNlvA5MoeSZihLHMU+hMCap0lrbB/rs=;
        b=LOWUiQoJsJrd5sDNbN+gC0f06i52E9IhEnD3nlSzvnQxCAZYEkEx/ZjtHfE77/X/rU
         44mcFEN/Btyqz9iDVvTthRUSG5w4dKNtt/sYLcjSV/Gaxl6wCiPgpaJFBipqqIafWD51
         ga4C74p2c8LFiH69u/QcCe5J2zEFNlMulkCkpafUspccc+dCkyx2gRAuV03iQB+vosQ8
         BRs36S43oU5FNkC64062bFdoZ/y2RFwfHVqcqS/3e2Yo2eCRItjiHpGILUA41Ps0TDVx
         WEce77d1/6IfbUOBcY5MeOcl+4F9l2IRDjeIdC4EezmXNyaM/0cPAcHYZpCVHLeFjlh8
         Ho0g==
X-Gm-Message-State: AC+VfDzBJTprMtzOHNf3YBbcgMmEsJSfm1ouS9zXRJ0Xk/6SnWaXi95l
	obn58cRVoqOJTPIt8T3WRYZ6hw==
X-Google-Smtp-Source: ACHHUZ7UwoeVcV7NcPNRh+PYPFK4S9ad6FQ4bVggkB4CDQoyhbAx7EDtp4SCD00iu4lmGkebBwMNsA==
X-Received: by 2002:a05:6a20:6f03:b0:f8:b39b:b24e with SMTP id gt3-20020a056a206f0300b000f8b39bb24emr14578405pzb.11.1682945067231;
        Mon, 01 May 2023 05:44:27 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v17-20020a62c311000000b005a8bf239f5csm19690294pfg.193.2023.05.01.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:44:26 -0700 (PDT)
Date: Mon, 01 May 2023 05:44:26 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 05:44:09 PDT (-0700)
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
In-Reply-To: <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ribalda@chromium.org
Message-ID: <mhng-6809e805-0a92-401b-af74-fef93eeda1ae@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com, llvm@lists.linux.dev, hpa@zytor.com, linux-riscv@lists.infradead.org, prudo@linux.vnet.ibm.com, bhe@redhat.com, x86@kernel.org, mingo@redhat.com, dyoung@redhat.com, aou@eecs.berkeley.edu, zwisler@google.com, npiggin@gmail.com, nathan@kernel.org, bp@alien8.de, rostedt@goodmis.org, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, ndesaulniers@google.com, prudo@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, ebiederm@xmission.com, horms@kernel.org, ribalda@chromium.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 May 2023 05:38:22 PDT (-0700), ribalda@chromium.org wrote:
> If PGO is enabled, the purgatory ends up with multiple .text sections.
> This is not supported by kexec and crashes the system.
>
> Cc: stable@vger.kernel.org
> Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  arch/riscv/purgatory/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index 5730797a6b40..cf3a44121a90 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -35,6 +35,11 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
>  CFLAGS_string.o := -D__DISABLE_EXPORTS
>  CFLAGS_ctype.o := -D__DISABLE_EXPORTS
>
> +# When profile optimization is enabled, llvm emits two different overlapping
> +# text sections, which is not supported by kexec. Remove profile optimization
> +# flags.
> +KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved symbols.
>  PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
