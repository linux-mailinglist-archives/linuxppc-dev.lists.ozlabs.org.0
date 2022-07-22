Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0883957E1D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 15:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq8lH2kcgz3c2d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 23:03:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
X-Greylist: delayed 511 seconds by postgrey-1.36 at boromir; Fri, 22 Jul 2022 23:03:32 AEST
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq8kr3HLBz2xk4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 23:03:32 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 5175AA0C;
	Fri, 22 Jul 2022 14:54:54 +0200 (CEST)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 1E81B11AA6B;
	Fri, 22 Jul 2022 14:54:54 +0200 (CEST)
Date: Fri, 22 Jul 2022 14:54:53 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: [PATCH] amdgpu: re-enable DCN for ppc64le
Message-Id: <20220722145453.eb37bd3a99c4b738ed2e26b9@danny.cz>
In-Reply-To: <87o7xhcoqh.fsf@mpe.ellerman.id.au>
References: <20220722082122.571974-1-dan@danny.cz>
	<87o7xhcoqh.fsf@mpe.ellerman.id.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Alex Deucher <alexdeucher@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jul 2022 22:32:06 +1000
Michael Ellerman <michael@ellerman.id.au> wrote:

> Hi Dan,
> 
> [ Cc += linuxppc-dev  ]
> 
> Dan Horák <dan@danny.cz> writes:
> > Commit d11219ad53dc disabled the DCN driver for all platforms that
> > define PPC64 due long build issues during "make allmodconfig" using
> > cross-compilation. Cross-compilation defaults to the ppc64_defconfig
> > and thus big-endian toolchain configuration. The ppc64le platform uses a
> > different ABI and doesn't suffer from the build issues.
> 
> Unfortunately it's a bit messier than that.
> 
> The build error occurs when the compiler is built to use a 64-bit long
> double type.
> 
> The ppc64le ABI document says that long double should be 128-bits, but
> there are ppc64le compilers out there that are configured to use 64-bit
> long double, notably the kernel.org crosstool compilers.
> 
> So just testing for CPU_LITTLE_ENDIAN means we'll still get build errors
> on those compilers.
> 
> But I think we can detect the long double size and key off that. Can you
> test the patch below works for you?
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 7aa12e88c580..e9f8cd50af99 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -281,6 +281,9 @@ config PPC
>  	# Please keep this list sorted alphabetically.
>  	#
>  
> +config PCC_LONG_DOUBLE_128
> +	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)

^^^ there is a typo s/PCC/PPC/ :-)

with that fixed, it then defines AMD_DC_DCN on Fedora 36 with
gcc-12.1.1-1.fc36.ppc64le and we should be OK.


		Dan

> +
>  config PPC_BARRIER_NOSPEC
>  	bool
>  	default y
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index b4029c0d5d8c..ec6771e87e73 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>  	bool "AMD DC - Enable new display engine"
>  	default y
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
> -	select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> +	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and
