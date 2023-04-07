Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7C6DB721
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 01:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtZGn3K7lz3fZ2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 09:25:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EAizk1c7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EAizk1c7;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtZFv4nJ2z3fTm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:24:34 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1a51d48b25fso1077615ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 16:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680909871; x=1683501871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/k8Ld9z1xCEc4BHtSmCo5AXFhJJw0OpZKpMkjzbxFWI=;
        b=EAizk1c7O9PSk8Lcp5k9X8nBk8poWUZJYgJ1zQSs3cXVB4sXVf+Y1AsOx+AtDFsFAW
         2dDCeU+lW16NjIoR0dsKQDmfA2fZMyCUTowQojsK1V6H+uuZoDeYt3HZshvgoqNwsxiV
         oul25JbSjwDfzn6VUTVySwfuUNKg+iqkbVRWtj9X1mP9Hvn5MMN/DkkdQDLzuJcMsZoq
         Gg/YBtLlopy1oaBW4cdsA0gSXw38fJUu/cLsrPsV5NRkjRN3Yy9L/IOAOe0s7ZHghlpH
         SYIrj1xKNzQZGH2vcfR2x8LZ9HAhdVhUbnMZajyEeB/Bf0ujei+4U7/SvSO1dQk/Fu3y
         KTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909871; x=1683501871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k8Ld9z1xCEc4BHtSmCo5AXFhJJw0OpZKpMkjzbxFWI=;
        b=YUa54m2+KkVhRJXdVjVR1B122y1f1AZXtFXhssxdbsH/inCuTBT90VA/9s/4pW3hWj
         Lh0WsAablujMSjTFwTQsvadTbsqjJphHTCw8Cfm0nlHRQHMSCeNhYJ8z62RwKN+S/a3a
         oFSKOag81jz0VOHtXaHxTLg9od2Kne0VofxM+PQnDqjYEf1hEvucZvRcY8Rwx4xPn313
         1Ow8qEkp5k1P5/ZeVrJGnu+Ie+qPM8E9yRHjzr5pfqClfPGnY6mExvf/Ib/CHt2U2Kjs
         7FG9azjVFTrbJTtnjFKw5+/SZx0bDKfb1pqG8BUPXXeWPPsj/mVNKKvWVNU9Btdq1P28
         kVrA==
X-Gm-Message-State: AAQBX9fj/lNIFvAahdwMgfsluyeCb8IsPZ7/8HyhN7KCF+IKqKW+eqa2
	A4BFlTwBGUTPKpJzVAcGBarc1g==
X-Google-Smtp-Source: AKy350ZVzfdilh3sQ5mgS8FjOciG5ROpRCAvfvKR/AT1puPgkgbSm11Om9eOeamlMjtON4N/OSg76Q==
X-Received: by 2002:a62:6417:0:b0:62d:b4ae:e48c with SMTP id y23-20020a626417000000b0062db4aee48cmr270792pfb.23.1680909871377;
        Fri, 07 Apr 2023 16:24:31 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:5eb4:e720:fec7:a2d3])
        by smtp.gmail.com with ESMTPSA id p14-20020a63e64e000000b004fb8732a2f9sm3162486pgj.88.2023.04.07.16.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 16:24:30 -0700 (PDT)
Date: Fri, 7 Apr 2023 16:24:26 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc/32: Include thread_info.h in head_booke.h
Message-ID: <ZDCmKoworvEhxKCu@google.com>
References: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, masahiroy@kernel.org, patches@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 06, 2023 at 10:51:30AM -0700, Nathan Chancellor wrote:
> When building with W=1 after commit 80b6093b55e3 ("kbuild: add -Wundef
> to KBUILD_CPPFLAGS for W=1 builds"), the following warning occurs.
> 
>   In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
>   arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" is not defined, evaluates to 0 [-Wundef]
>      20 | #if (THREAD_SHIFT < 15)
>         |      ^~~~~~~~~~~~
> 
> THREAD_SHIFT is defined in thread_info.h but it is not directly included
> in head_booke.h, so it is possible for THREAD_SHIFT to be undefined. Add
> the include to ensure that THREAD_SHIFT is always defined.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/202304050954.yskLdczH-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/powerpc/kernel/head_booke.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index 37d43c172676..b6b5b01a173c 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -5,6 +5,7 @@
>  #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_booke_hv_asm.h>
> +#include <asm/thread_info.h>	/* for THREAD_SHIFT */
>  
>  #ifdef __ASSEMBLY__
>  
> 
> ---
> base-commit: b0bbe5a2915201e3231e788d716d39dc54493b03
> change-id: 20230406-wundef-thread_shift_booke-e08d806ed656
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 
> 
