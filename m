Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1D6A8D9C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 00:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSSdY0lRyz3f43
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 10:54:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MZDf4yRl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSScf0l4nz3cgp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 10:54:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MZDf4yRl;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSScd6djDz4x80;
	Fri,  3 Mar 2023 10:54:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677801250;
	bh=nqFX4Y4vkX54mC0WYyvMlxv/TCFdzS+dMyZeNTfKKeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MZDf4yRlxCoC0fP6tuwl0GnEAK4yjGFJb/QCBYFdieZCvJKHbBqhoCGLoNXUyFP24
	 0joIM2hqfb7QvZf+xmWERv8+Nduf18+QH+DonzGNlByudGo1u5xJsHHuXdreojE26N
	 rfkPe7pOwrNowzoTsWTws03CvQUPVlKd7WUMxufswPycsyODarwSfFkj9ADFL5HZMc
	 06DCv2wV0tHNRd0HQPIblszKkr8Mb9TM41BH+HjPtcq5SqSuMquiJk48okyjO6XOYa
	 CpU28H7JX2FKKKoUSfJgCzYqfggXOmX33SX5WAZjCfm36jSB3SMEiDTzWijgCwPXvL
	 pVsMiLyw1a9GA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] powerpc/64: Move CPU -mtune options into Kconfig
In-Reply-To: <20230302163055.GA3010526@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
 <20230302163055.GA3010526@dev-arch.thelio-3990X>
Date: Fri, 03 Mar 2023 10:54:09 +1100
Message-ID: <875ybilnfi.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> On Fri, Mar 03, 2023 at 12:16:55AM +1100, Michael Ellerman wrote:
>> Currently the -mtune options are set in the Makefile, depending on what
>> is the compiler supports.
>> 
>> One downside of doing it that way is that the chosen -mtune option is
>> not recorded in the .config.
>> 
>> Another downside is that doing more complicated logic to calculate the
>> correct option gets messy in the Makefile.
>> 
>> So move the determination of which -mtune option to use into Kconfig
>> logic.
>> 
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
>> ---
>>  arch/powerpc/Makefile                  | 4 +---
>>  arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
>>  2 files changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index 87d6ac27eebd..779956007f0c 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -156,9 +156,7 @@ endif
>>  CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>>  AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>>  
>> -CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
>> -				  $(call cc-option,-mtune=power9,	\
>> -				  $(call cc-option,-mtune=power8)))
>> +CFLAGS-y += $(CONFIG_TUNE_CPU)
>>  
>>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
>>  
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
>> index 046b571496b1..7d7477b73951 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -273,6 +273,12 @@ config TARGET_CPU
>>  	default "e500mc" if E500MC_CPU
>>  	default "powerpc" if POWERPC_CPU
>>  
>> +config TUNE_CPU
>> +	string
>> +	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
>> +	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
>> +	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
>
> Would it be cleaner to hoist the POWERPC64_CPU dependency?

I was experimenting with some follow-on patches that add more cases for
other CPUs, but that got messy and it'll need a bit more work.

So for now yes I should just hoist that dependency.

cheers

> config TUNE_CPU
> 	string
> 	default "-mtune=power10" if CC_IS_GCC   && $(cc-option,-mtune=power10)
> 	default "-mtune=power9"  if CC_IS_GCC   && $(cc-option,-mtune=power9)
> 	default "-mtune=power8"  if CC_IS_GCC   && $(cc-option,-mtune=power8)
> 	depends on POWERPC64_CPU
