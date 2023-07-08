Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0974BDC1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 16:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qysfv4myXz3c9x
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 00:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QysfM6Dnyz307K
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 00:12:24 +1000 (AEST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qI8fN-00023x-00; Sat, 08 Jul 2023 16:12:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 11AC8C01C1; Sat,  8 Jul 2023 16:11:52 +0200 (CEST)
Date: Sat, 8 Jul 2023 16:11:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
Message-ID: <ZKluqG2ZqKtAmnEG@alpha.franken.de>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, javierm@redhat.com, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 07, 2023 at 11:52:24AM +0200, Arnd Bergmann wrote:
> diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
> index ee044261eb223..3c14548353e47 100644
> --- a/arch/mips/jazz/setup.c
> +++ b/arch/mips/jazz/setup.c
> @@ -76,7 +76,7 @@ void __init plat_mem_setup(void)
>  
>  	_machine_restart = jazz_machine_restart;
>  
> -#ifdef CONFIG_VT
> +#ifdef CONFIG_VGA_CONSOLE
>  	screen_info = (struct screen_info) {
>  		.orig_video_cols	= 160,
>  		.orig_video_lines	= 64,

that wssn't intended for VGA but for fbdev/g364fb, which doesn't use
it. So removing it is probably the best thing.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
