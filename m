Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B151D580223
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:46:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls4CY54HQz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 01:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4C43gZqz3blD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 01:46:06 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id E77F4A0C;
	Mon, 25 Jul 2022 17:46:00 +0200 (CEST)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 1CF5211AA3A;
	Mon, 25 Jul 2022 17:46:00 +0200 (CEST)
Date: Mon, 25 Jul 2022 17:45:59 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
Message-Id: <20220725174559.e71243fa54b48fc2183385be@danny.cz>
In-Reply-To: <20220725123918.1903255-1-mpe@ellerman.id.au>
References: <20220725123918.1903255-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com, torvalds@linux-foundation.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Jul 2022 22:39:18 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Commit d11219ad53dc ("amdgpu: disable powerpc support for the newer
> display engine") disabled the DCN driver for all of powerpc due to
> unresolved build failures with some compilers.
> 
> Further digging shows that the build failures only occur with compilers
> that default to 64-bit long double.
> 
> Both the ppc64 and ppc64le ABIs define long double to be 128-bits, but
> there are compilers in the wild that default to 64-bits. The compilers
> provided by the major distros (Fedora, Ubuntu) default to 128-bits and
> are not affected by the build failure.
> 
> There is a compiler flag to force 128-bit long double, which may be the
> correct long term fix, but as an interim fix only allow building the DCN
> driver if long double is 128-bits by default.
> 
> The bisection in commit d11219ad53dc must have gone off the rails at
> some point, the build failure occurs all the way back to the original
> commit that enabled DCN support on powerpc, at least with some
> toolchains.
> 
> Depends-on: d11219ad53dc ("amdgpu: disable powerpc support for the newer display engine")
> Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2100

LGTM

Reviewed-by: Dan Horák <dan@danny.cz>


		Dan

> ---
>  arch/powerpc/Kconfig                | 4 ++++
>  drivers/gpu/drm/amd/display/Kconfig | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> Alex, are you OK if I take this via the powerpc tree for v5.19?
> 
> cheers
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 7aa12e88c580..287cc2d4a4b3 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -281,6 +281,10 @@ config PPC
>  	# Please keep this list sorted alphabetically.
>  	#
>  
> +config PPC_LONG_DOUBLE_128
> +	depends on PPC64
> +	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
> +
>  config PPC_BARRIER_NOSPEC
>  	bool
>  	default y
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 0ba0598eba20..ec6771e87e73 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>  	bool "AMD DC - Enable new display engine"
>  	default y
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
> -	select DRM_AMD_DC_DCN if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> +	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and
> -- 
> 2.35.3
> 
