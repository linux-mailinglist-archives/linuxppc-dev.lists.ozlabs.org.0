Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F72872BEF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 02:02:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NOLu9Nd0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqDg367vwz3vdh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 12:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NOLu9Nd0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqDfK178Qz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 12:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709686905;
	bh=YmcB4bK+MAKOOiOWr/fno4pQrOdfHy3DeEfNvA3NQaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NOLu9Nd0MJ7pHaMczG24P2AAIjuQhVM3wPtp80cRNUCsBxFuSbZi0rDg8RCJBLKNb
	 XFRzYoSHM3yALoOIr/THxV8/0FuBguR6Vw/I+aqE+cAOBTQWsqEzKwwuhpJ9+IHrpA
	 ju3TWGuhoA0jqbHyAZdTmfzhuopD/JXB+zzZuTG+/vdc/dSRd7hcLWxt+6N9pX2xC0
	 uW4QiRWZncUEoTDNcuOcaOsRjuVp965laKOqAwu2ynMQcFQ8KESP9blQkn9wOOijpi
	 Zrs1DUqcfyz813+tLqBkYHLuGgEysiDhfYakRkusLJe+/O8f4nzAthwOcf1XGuU3qz
	 VUhL8TZ4n22GA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TqDfH2BRXz4wc8;
	Wed,  6 Mar 2024 12:01:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
In-Reply-To: <20240305224315.GA2361659@dev-arch.thelio-3990X>
References: <20240127-ppc-xor_vmx-drop-msoft-float-v1-1-f24140e81376@kernel.org>
 <20240305224315.GA2361659@dev-arch.thelio-3990X>
Date: Wed, 06 Mar 2024 12:01:42 +1100
Message-ID: <874jdkp409.fsf@mail.lhotse>
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
Cc: llvm@lists.linux.dev, patches@lists.linux.dev, aneesh.kumar@kernel.org, npiggin@gmail.com, justinstitt@google.com, naveen.n.rao@linux.ibm.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, morbo@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> Ping? We have been applying this in our CI since it was sent, it would
> be nice to have this upstream soon so it can start filtering through the
> stable trees.

Sorry, I was away in January and missed this. Will pick it up.

cheers

> On Sat, Jan 27, 2024 at 11:07:43AM -0700, Nathan Chancellor wrote:
>> arch/powerpc/lib/xor_vmx.o is built with '-msoft-float' (from the main
>> powerpc Makefile) and '-maltivec' (from its CFLAGS), which causes an
>> error when building with clang after a recent change in main:
>> 
>>   error: option '-msoft-float' cannot be specified with '-maltivec'
>>   make[6]: *** [scripts/Makefile.build:243: arch/powerpc/lib/xor_vmx.o] Error 1
>> 
>> Explicitly add '-mhard-float' before '-maltivec' in xor_vmx.o's CFLAGS
>> to override the previous inclusion of '-msoft-float' (as the last option
>> wins), which matches how other areas of the kernel use '-maltivec', such
>> as AMDGPU.
>> 
>> Cc: stable@vger.kernel.org
>> Closes: https://github.com/ClangBuiltLinux/linux/issues/1986
>> Link: https://github.com/llvm/llvm-project/commit/4792f912b232141ecba4cbae538873be3c28556c
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>  arch/powerpc/lib/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
>> index 6eac63e79a89..0ab65eeb93ee 100644
>> --- a/arch/powerpc/lib/Makefile
>> +++ b/arch/powerpc/lib/Makefile
>> @@ -76,7 +76,7 @@ obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
>>  obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
>>  
>>  obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
>> -CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
>> +CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
>>  # Enable <altivec.h>
>>  CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
>>  
>> 
>> ---
>> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
>> change-id: 20240127-ppc-xor_vmx-drop-msoft-float-ad68b437f86c
>> 
>> Best regards,
>> -- 
>> Nathan Chancellor <nathan@kernel.org>
>> 
