Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8C6A8665
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 17:31:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSGpH5PVbz3chd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 03:31:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tvNMYOyZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tvNMYOyZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSGnL0Xpcz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 03:31:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 428FBB80F52;
	Thu,  2 Mar 2023 16:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B138CC433A0;
	Thu,  2 Mar 2023 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677774656;
	bh=QIonlbD+hXkvNAyStSdE1u4PetKuURzYyfmJzPvCvSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvNMYOyZWzQEFhxa79ksh+dfMNGVc8pw/xk/hzZyL2N90zi7KtUKYaO9KIKpU4NGz
	 1WV9aP7QCEyjagZW/pVhPdZfv9iUWuBSmX0ceoo/eW2ZruQT3q2V3Yk2+Z+6Rihl8/
	 vXBliFiiRFqTzIlXP8KVuaW9E7/SHX7tCjaWbmXLucf9Qxdofd7k8CSq4t0iLSH0cb
	 0UOl6yjjszW/6mAbGfIKShprsyJZfmR5soN3avzj3O9r4CIc6DjJy/RUe9ZatQFx/g
	 ApMtvT3oPKQA6IhUbdfId+S91ahrjzOB9m75BeY8bylrgiqK6/46nGEsDn6VzAamBf
	 h78ap67e2sL9Q==
Date: Thu, 2 Mar 2023 09:30:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/64: Move CPU -mtune options into Kconfig
Message-ID: <20230302163055.GA3010526@dev-arch.thelio-3990X>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302131656.50626-1-mpe@ellerman.id.au>
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

On Fri, Mar 03, 2023 at 12:16:55AM +1100, Michael Ellerman wrote:
> Currently the -mtune options are set in the Makefile, depending on what
> is the compiler supports.
> 
> One downside of doing it that way is that the chosen -mtune option is
> not recorded in the .config.
> 
> Another downside is that doing more complicated logic to calculate the
> correct option gets messy in the Makefile.
> 
> So move the determination of which -mtune option to use into Kconfig
> logic.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/Makefile                  | 4 +---
>  arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 87d6ac27eebd..779956007f0c 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -156,9 +156,7 @@ endif
>  CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>  AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>  
> -CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
> -				  $(call cc-option,-mtune=power9,	\
> -				  $(call cc-option,-mtune=power8)))
> +CFLAGS-y += $(CONFIG_TUNE_CPU)
>  
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
>  
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 046b571496b1..7d7477b73951 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -273,6 +273,12 @@ config TARGET_CPU
>  	default "e500mc" if E500MC_CPU
>  	default "powerpc" if POWERPC_CPU
>  
> +config TUNE_CPU
> +	string
> +	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
> +	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
> +	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)

Would it be cleaner to hoist the POWERPC64_CPU dependency?

config TUNE_CPU
	string
	default "-mtune=power10" if CC_IS_GCC   && $(cc-option,-mtune=power10)
	default "-mtune=power9"  if CC_IS_GCC   && $(cc-option,-mtune=power9)
	default "-mtune=power8"  if CC_IS_GCC   && $(cc-option,-mtune=power8)
	depends on POWERPC64_CPU

> +
>  config PPC_BOOK3S
>  	def_bool y
>  	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
> -- 
> 2.39.2
> 
