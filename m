Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB7C8D4161
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:27:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MK8w1Ve9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqP4825w2z7BjR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MK8w1Ve9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqP2W160bz7B8x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 08:20:02 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f47db642c2so2158495ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717021200; x=1717626000; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJrQ16Mm4mEHJBUvo1EcXZ5YtU50XKHhoA+vzh0jLKc=;
        b=MK8w1Ve9zBedneTwGHnpD2Kv8p/iGDf9xaLzJxIE/cOHH2WL+ADtTYPWG+ZYqQnm/B
         yc0TzU3MTMfO5Y0LJ2WxDIyHxwJbYARzGmNET1snbtPwm7W1TjxNRmRFK5PO5G94q9s5
         urrp81d+dwv6YmHKejWs5BhopcgaehZESDbvqy1a79JqY0opem9fCDllta/E/sOm2unX
         AAmSUX2wn4kdynm0AelKKXf6fO4J8VHyP7CaTm5nlSa9W5PEBCPQt5MPb+fCv7gUbGS8
         SJ0/5zmRZX6n/PIuaHolq4TazWYCV+4C3Dij02eVsgSkS1nHmQUGNSEQzJsH/xYNoIlS
         4JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021200; x=1717626000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJrQ16Mm4mEHJBUvo1EcXZ5YtU50XKHhoA+vzh0jLKc=;
        b=OA6IivrDovuLicb73CmtMIsxb3G8DRL8wyv8kQLWzRanuKghZ8lNMg57V9Ht06Cxpu
         6ENpErDE8qEXoxrJDHFXX12/3JIjkqg5y2RGPWw+bhwbNKObsC5YFzLB6JharBgXHpnz
         dk8dgLiOqJjjyZ5+ERNd/UdA447WpN01aH7KxqLoY7kOsH3/8tS7KERGMN4lNE0AG0hz
         CZksRCiKI46TlYvHsHmIONxhq3hBzz0SzqZzxVQZ+WES6NrhJy4y/LV0KJttCQLf/Tg9
         RIRu4I+EVaIZqDGL1uEuklFIW364hcFTLOPrjkoepqFFAktpQKO490rTHqIXWuwbzicI
         HToA==
X-Gm-Message-State: AOJu0YzC67VsxX6BOqmSlAmPdqgQQbKoKu1pp+k9ADPpqHSqSueDVBhq
	GTfsAIl3esJZhll9Ht+/dwvHBPdMUDBZtopjCyFOfCKMQXJDV7sz
X-Google-Smtp-Source: AGHT+IG5kR8kOYyzVRzRqbZxqWuOKj6SQweoCw18V8qyrX/WdpuKPWyVew4BiSOzbkoQNpLbeJYeng==
X-Received: by 2002:a17:902:ecd1:b0:1e6:7700:1698 with SMTP id d9443c01a7336-1f619624c66mr4414635ad.35.1717021199966;
        Wed, 29 May 2024 15:19:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f476f665b0sm79991985ad.250.2024.05.29.15.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:19:59 -0700 (PDT)
Date: Wed, 29 May 2024 15:19:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH] powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64
Message-ID: <109b63cc-1dcd-4f40-881b-0fe88ed9ac9c@roeck-us.net>
References: <20240529162852.1209-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529162852.1209-1-samuel.holland@sifive.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 09:28:50AM -0700, Samuel Holland wrote:
> When building a 32-bit kernel, some toolchains do not allow mixing soft
> float and hard float object files:
> 
>     LD      vmlinux.o
>   powerpc64le-unknown-linux-musl-ld: lib/test_fpu_impl.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
>   powerpc64le-unknown-linux-musl-ld: failed to merge target specific data of file lib/test_fpu_impl.o
>   make[2]: *** [scripts/Makefile.vmlinux_o:62: vmlinux.o] Error 1
>   make[1]: *** [Makefile:1152: vmlinux_o] Error 2
>   make: *** [Makefile:240: __sub-make] Error 2
> 
> This is not an issue when building a 64-bit kernel. To unbreak the
> build, limit ARCH_HAS_KERNEL_FPU_SUPPORT to 64-bit kernels. This is okay
> because the only real user of this option, amdgpu, was previously
> limited to PPC64 anyway; see commit a28e4b672f04 ("drm/amd/display: use
> ARCH_HAS_KERNEL_FPU_SUPPORT").
> 
> Fixes: 01db473e1aa3 ("powerpc: implement ARCH_HAS_KERNEL_FPU_SUPPORT")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405250851.Z4daYSWG-lkp@intel.com/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/lkml/eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net/
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 3c968f2f4ac4..c88c6d46a5bc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,7 +137,7 @@ config PPC
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
>  	select ARCH_HAS_KCOV
> -	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC_FPU
> +	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
> -- 
> 2.44.1
> 
