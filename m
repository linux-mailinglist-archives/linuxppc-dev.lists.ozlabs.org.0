Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6075B72A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 20:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6MLP4KVXz3cV1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 04:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gonehiking.org (client-ip=64.68.200.34; helo=mailout.easymail.ca; envelope-from=khalid@gonehiking.org; receiver=lists.ozlabs.org)
Received: from mailout.easymail.ca (mailout.easymail.ca [64.68.200.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6MKw1nmrz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 04:54:11 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mailout.easymail.ca (Postfix) with ESMTP id 479C0623ED;
	Thu, 20 Jul 2023 18:48:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo07-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
	by localhost (emo07-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkMMq7FPWqRc; Thu, 20 Jul 2023 18:48:49 +0000 (UTC)
Received: from mail.gonehiking.org (unknown [38.15.45.1])
	by mailout.easymail.ca (Postfix) with ESMTPA id C8ABC61E38;
	Thu, 20 Jul 2023 18:48:49 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
	by mail.gonehiking.org (Postfix) with ESMTP id CC21F3EED6;
	Thu, 20 Jul 2023 12:48:47 -0600 (MDT)
Message-ID: <aea82980-358a-863f-d6a0-66f4ce3f87b7@gonehiking.org>
Date: Thu, 20 Jul 2023 12:48:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-2-arnd@kernel.org>
From: Khalid Aziz <khalid@gonehiking.org>
In-Reply-To: <20230719123944.3438363-2-arnd@kernel.org>
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
Reply-To: khalid@gonehiking.org
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/23 6:39 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The list of dependencies here is phrased as an opt-out, but this is missing
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
> 
>   - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>     the merged arch/powerpc never did
> 
>   - arm lists footbridge, integrator and netwinder, but netwinder is actually
>     part of footbridge, and integrator does not appear to have an actual
>     VGA hardware, or list it in its ATAG or DT.
> 
>   - mips has a few platforms (malta, sibyte, and sni) that initialize
>     screen_info, on everything else the console is selected but cannot
>     actually work.
> 
>   - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>     in the opt-out table and declare a screen_info to allow building
>     vga_con, but this cannot work because the console is never selected.
> 
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Khalid Aziz <khalid@gonehiking.org>


> ---
>   drivers/video/console/Kconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index 1b5a319971ed0..6af90db6d2da9 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -7,9 +7,9 @@ menu "Console display driver support"
>   
>   config VGA_CONSOLE
>   	bool "VGA text console" if EXPERT || !X86
> -	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
> -		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
> -		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
> +	depends on ALPHA || IA64 || X86 || \
> +		(ARM && ARCH_FOOTBRIDGE) || \
> +		(MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 || SIBYTE_BCM1x80 || SNI_RM))
>   	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
>   	default y
>   	help

