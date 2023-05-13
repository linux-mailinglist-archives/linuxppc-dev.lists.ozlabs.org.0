Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2A701585
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 11:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJKhp46Pjz3fXv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 19:14:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=slhfgg2/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=slhfgg2/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJKgy5BSyz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 19:14:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C49BC610E7;
	Sat, 13 May 2023 09:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9152C433D2;
	Sat, 13 May 2023 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683969242;
	bh=R8BaXvrEqkDtkKLwWmr0dANy8SCHQgwY/EbJ9khwnXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slhfgg2/AWnHNrzIZxddnKGXkyOmDvpcHXzF2mTBQ2ok81VA4ycpZV3005Jsx9z1K
	 MuE5pHI7/jTrY9dBlQdZEySom/ao2+H4XppHAz7r8eq0xkR+eg6pCBV1mi1Cg1CGW4
	 5+wyYHRf/a0dgK1AbYCLi6THyDZMyQGcpMYajQUCd/ZfaFLSX/T5L6Om1LpxTYi5mX
	 O3dxg3CXzsXwkgS9wJInVewBTTHM0mumqOoNO5+NWeoSg7yJ5DrL6KEE9hEbtYFdqR
	 qvn5Dcg5CbmYcCUslNnKwYZRokqik4UqzwSTLiU+DqxPewHLga1c+dHKUcukL07aW4
	 Mr7YPtKexBuhg==
Received: by pali.im (Postfix)
	id D53FF7F9; Sat, 13 May 2023 11:13:58 +0200 (CEST)
Date: Sat, 13 May 2023 11:13:58 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RFC PATCH] powerpc: udbg: export udbg_putc
Message-ID: <20230513091358.pzlexqnff5ydhlzf@pali>
References: <20230513055804.23775-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230513055804.23775-1-rdunlap@infradead.org>
User-Agent: NeoMutt/20180716
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 12 May 2023 22:58:04 Randy Dunlap wrote:
> In a randconfig with CONFIG_SERIAL_CPM=m and
> CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
> ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
> 
> The build can be fixed by exporting "udbg_putc" in udbg.c.
> 
> OTOH, maybe something like this is more appropriate in
> arch/powerpc/Kconfig.debug?
> 
> config PPC_EARLY_DEBUG_CPM
> 	bool "Early serial debugging for Freescale CPM-based serial ports"
> -	depends on SERIAL_CPM
> +	depends on SERIAL_CPM=y
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "Pali Rohár" <pali@kernel.org>
> ---
>  arch/powerpc/kernel/udbg.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
> --- a/arch/powerpc/kernel/udbg.c
> +++ b/arch/powerpc/kernel/udbg.c
> @@ -14,6 +14,7 @@
>  #include <asm/udbg.h>
>  
>  void (*udbg_putc)(char c);
> +EXPORT_SYMBOL(udbg_putc);
>  void (*udbg_flush)(void);
>  int (*udbg_getc)(void);
>  int (*udbg_getc_poll)(void);

Hello! I do not think that it is a good idea to export udbg functions
for kernel modules. I have quickly looked at the cpm_uart driver file
drivers/tty/serial/cpm_uart/cpm_uart_core.c and it looks like that once
udbg from it is registered then there is no code for unregistering it.
So I have feeling that compiling cpm_uart driver as module should not be
allowed when CONFIG_SERIAL_CPM_CONSOLE is enabled, and early debug
should depend on CONFIG_CONSOLE_POLL || CONFIG_SERIAL_CPM_CONSOLE.

Any other opinion?
