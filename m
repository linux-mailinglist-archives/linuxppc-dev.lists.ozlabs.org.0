Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59488520DCE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 08:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky7Jz18qNz3byT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 16:23:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5pLUXPfw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5pLUXPfw; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky7Hd3XF5z2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 16:22:21 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id g8so14110227pfh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 23:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r2fRyBS1PCGHWxGubdLBk7/5OJZHaTwkfn+9TQECPvA=;
 b=5pLUXPfwONX2rUTMrxu+zZxlh8XA+Bs2LiiHjy3J1iq/1QkxUnMQkIK9L7JIGd3uVd
 j/DCkNzLmc0AxN3PpfBKf8t0gN/S+Mf8XPTnlZ21xtaMRMJ7gNGlW5/Hzb5iK44El4oE
 fK7aNhWeDcpSuGEFe7XQpyl84xCEG2szfTDQo7BZpsFElSKQslx5BgLXbz8U88QH5J+v
 DBzXh4M569/dSBNHaYYq3dXwdRItSYrQPw+gkOSZNV1WEiIwplZwKnBk3PR2NRTU/RdE
 w5pFMPRg/u+U6O9tbAz/Cc0oEh1aHKd20MSuzel8RMC2s7iPm+L+/buiPUM3bYAE1E6F
 72hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r2fRyBS1PCGHWxGubdLBk7/5OJZHaTwkfn+9TQECPvA=;
 b=zkbmqpgeih9xsDdZerxdTa4CDJUxzcrcz9Rlj3DAZmT0ebdxvCxylz1EPECSFHkV6D
 G5UlUlLhN0mMZX4o+rV9m4iLvq+zr5t30oNjNRMpMYpEQcyglD5keUOtYNR8+CN3dSLQ
 9zlVkewFesEEFnogABp8QYSBgQHa7Dk0PtkX2iROpU2+Y8t9SpueVUHxvbFHwYNSaYnV
 WSI2t7cz+ipB87KfREiCY/+zVDcvFq5Yyd6/E1WkVOFnmq1LHt3xtuKo2mXttqV+Tx+n
 0z5XRZk3koBhd7BrtZcOTjtSoQrDayjg+/T1D49hKywKEWGA8W4vAxl0UlSkiQK3a+pb
 z+1A==
X-Gm-Message-State: AOAM5337jjU+uBi3oYWPGI1yK+R9IiCL1IHjr+RvQarzWjWcyvtwDQHg
 CDMZ6gsfqHK1E0Hb3FjY6w/SGA==
X-Google-Smtp-Source: ABdhPJypmPrYaweX1M/lWVoq6y1mcDbSNObKQUR1WOaa4Dph1JgWtserJIpVGCJFAC2mctRftZi3Lg==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr19176518pfu.59.1652163739169; 
 Mon, 09 May 2022 23:22:19 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 a1-20020aa795a1000000b0050dc762815asm9751096pfk.52.2022.05.09.23.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 23:22:18 -0700 (PDT)
Message-ID: <ddd263c7-f27b-9543-55a3-d4efd899afac@ozlabs.ru>
Date: Tue, 10 May 2022 16:22:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH 2/2] powerpc/vdso: Link with ld.lld when requested
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20220509204635.2539549-1-nathan@kernel.org>
 <20220509204635.2539549-3-nathan@kernel.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220509204635.2539549-3-nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 patches@lists.linux.dev, Paul Mackerras <paulus@samba.org>,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/10/22 06:46, Nathan Chancellor wrote:
> The PowerPC vDSO is linked with $(CC) instead of $(LD), which means the
> default linker of the compiler is used instead of the linker requested
> by the builder.
> 
>    $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
>    ...
> 
>    $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> 
>    File: arch/powerpc/kernel/vdso/vdso32.so.dbg
>    String dump of section '.comment':
>    [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
>    File: arch/powerpc/kernel/vdso/vdso64.so.dbg
>    String dump of section '.comment':
>    [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
> The compiler option '-fuse-ld' tells the compiler which linker to use
> when it is invoked as both the compiler and linker. Use '-fuse-ld=lld'
> when LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
> linked with the same linker as the rest of the kernel.
> 
>    $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> 
>    File: arch/powerpc/kernel/vdso/vdso32.so.dbg
>    String dump of section '.comment':
>    [     0] Linker: LLD 14.0.0
>    [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
>    File: arch/powerpc/kernel/vdso/vdso64.so.dbg
>    String dump of section '.comment':
>    [     0] Linker: LLD 14.0.0
>    [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
> LD can be a full path to ld.lld, which will not be handled properly by
> '-fuse-ld=lld' if the full path to ld.lld is outside of the compiler's
> search path. '-fuse-ld' can take a path to the linker but it is
> deprecated in clang 12.0.0; '--ld-path' is preferred for this scenario.
> 
> Use '--ld-path' if it is supported, as it will handle a full path or
> just 'ld.lld' properly. See the LLVM commit below for the full details
> of '--ld-path'.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/774
> Link: https://github.com/llvm/llvm-project/commit/1bc5c84710a8c73ef21295e63c19d10a8c71f2f5
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   arch/powerpc/kernel/vdso/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 954974287ee7..096b0bf1335f 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -48,6 +48,7 @@ UBSAN_SANITIZE := n
>   KASAN_SANITIZE := n
>   
>   ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> +ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)


Out of curiosity - how does this work exactly? I can see --ld-path= in 
the output so it works but there is no -fuse-ld=lld, is the second 
argument of cc-option only picked when the first one is not supported?

Anyway,

Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



>   
>   CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
>   AS32FLAGS := -D__VDSO32__ -s
