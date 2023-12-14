Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8648126AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 05:46:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PHvb5rAy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrKYb0LZTz3cZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 15:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PHvb5rAy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrKXk2fnYz3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 15:45:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702529123;
	bh=t7B9if0LOImFnd/AnccoK9V4d+WmshLVNwjLPY+Ohl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PHvb5rAyITybLJhslCdr+FPB6weuYhVdwGVqwI6pjC0ArKwZkSJyMqDVTRdcLTEp8
	 CMM1zL432KtNyUzA4mhWgDTmzmIB20cDIEs1vpR4XVIlFKEuLTFGJUgQi2gSEUC13j
	 mfFynirXmkKm9bE2EICqv9unlGx62DyfXiv5i2BtZBd3f6O85asjT6i+pBGfgfPjyp
	 tkCdZSOpErcp/BMZpdsjN71xdXgGO4HsDEkHk/a+gxWH2FD87Y65cYU3IpDwO2jYA7
	 PzUo9wW0hAbsQZZzGnqcxC0mqh1VvcVv56nNl78AXywD3K6/8BH+V8bphra6maMQo3
	 RX1/dzF6mo1TA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SrKXf0VB5z4wcH;
	Thu, 14 Dec 2023 15:45:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH 10/12] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <7ed20fcf-8a9d-40d5-b913-b5d2da443cd6@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-11-samuel.holland@sifive.com>
 <87h6kpdj20.fsf@mail.lhotse>
 <7ed20fcf-8a9d-40d5-b913-b5d2da443cd6@sifive.com>
Date: Thu, 14 Dec 2023 15:45:21 +1100
Message-ID: <87bkatxuhq.fsf@mail.lhotse>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, Timothy Pearson <tpearson@raptorengineering.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Samuel Holland <samuel.holland@sifive.com> writes:
> On 2023-12-11 6:23 AM, Michael Ellerman wrote:
>> Hi Samuel,
>> 
>> Thanks for trying to clean all this up.
>> 
>> One problem below.
>> 
>> Samuel Holland <samuel.holland@sifive.com> writes:
>>> Now that all previously-supported architectures select
>>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>>> of the existing list of architectures. It can also take advantage of the
>>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>>
>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ...
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>>> index 4ae4720535a5..b64f917174ca 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>>> @@ -87,20 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>>>  	WARN_ON_ONCE(!in_task());
>>>  	preempt_disable();
>>>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
>>> -
>>>  	if (depth == 1) {
>>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>>> +		BUG_ON(!kernel_fpu_available());
>>>  		kernel_fpu_begin();
>>> -#elif defined(CONFIG_PPC64)
>>> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
>>> -			enable_kernel_vsx();
>>> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
>>> -			enable_kernel_altivec();
>>  
>> Note altivec.
>> 
>>> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>>> -			enable_kernel_fp();
>>> -#elif defined(CONFIG_ARM64)
>>> -		kernel_neon_begin();
>>> -#endif
>>>  	}
>>>  
>>>  	TRACE_DCN_FPU(true, function_name, line, depth);
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>>> index ea7d60f9a9b4..5aad0f572ba3 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>>> @@ -25,40 +25,8 @@
>>>  # It provides the general basic services required by other DAL
>>>  # subcomponents.
>>>  
>>> -ifdef CONFIG_X86
>>> -dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
>>> -dml_ccflags := $(dml_ccflags-y) -msse
>>> -endif
>>> -
>>> -ifdef CONFIG_PPC64
>>> -dml_ccflags := -mhard-float -maltivec
>>> -endif
>> 
>> And altivec is enabled in the flags there.
>> 
>> That doesn't match your implementation for powerpc in patch 7, which
>> only deals with float.
>> 
>> I suspect the AMD driver actually doesn't need altivec enabled, but I
>> don't know that for sure. It compiles without it, but I don't have a GPU
>> to actually test. I've added Timothy on Cc who added the support for
>> powerpc to the driver originally, hopefully he has a test system.
>
> I tested this series on a POWER9 system with an AMD Radeon RX 6400 GPU (which
> requires this FPU code to initialize), and got functioning graphics output.

Awesome.

>> Anyway if that's true that it doesn't need altivec we should probably do
>> a lead-up patch that drops altivec from the AMD driver explicitly, eg.
>> as below.
>
> That makes sense to me. Do you want to provide your Signed-off-by so I can send
> this patch with your authorship?

Yeah that'd be great. Patch below. Feel free to adjust the commit
message as you see fit.

cheers


From c8a2862d2ebe76a023eceb3267fd85262925c0ba Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 14 Dec 2023 15:39:05 +1100
Subject: [PATCH] drm/amd/display: Only use hard-float, not altivec on powerpc

The compiler flags enable altivec, but that is not required, hard-float
is sufficient for the code to build and function.

Drop altivec from the compiler flags and adjust the enable/disable code
to only enable FPU use.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 12 ++----------
 drivers/gpu/drm/amd/display/dc/dml/Makefile    |  2 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   |  2 +-
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 4ae4720535a5..0de16796466b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -92,11 +92,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			enable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			enable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			enable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_begin();
@@ -125,11 +121,7 @@ void dc_fpu_end(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			disable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			disable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			disable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_end();
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 6042a5a6a44f..554c39024a40 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -31,7 +31,7 @@ dml_ccflags := $(dml_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float -maltivec
+dml_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index acff3449b8d7..7b51364084b5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -30,7 +30,7 @@ dml2_ccflags := $(dml2_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float -maltivec
+dml2_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
-- 
2.43.0


