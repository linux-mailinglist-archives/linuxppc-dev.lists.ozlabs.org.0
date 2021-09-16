Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1E40D4DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 10:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H99g62Lhcz3049
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 18:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K3gvozuA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K3gvozuA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H99fR2Bztz2xSH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 18:46:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBE8161186;
 Thu, 16 Sep 2021 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631781962;
 bh=k+xFcxsCHW/uNXmjHa0Nr0f88jRZmDO6nuT79AEQX+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K3gvozuAluP/t6T5rAVT8FgUC1sFJ7ltdfLPSULlEMb34wv96zypajJZW9UHk7cwQ
 6zXzP8BFCk+puZhWMidmE543N/5J8WQZ7VXRwvJsytk3Bq9pBZKKItvcZx352nVL8v
 GSwGTJyDfJBWYjDmYG4xw+ylJXvbhgFj/Jlb/jMNLpuZd4BZdHMMn/TL2FVVJranR5
 Kvq/Rsftli90QUfP4TexcqAQ8be+KXVAW5cq++vJyy10mg5jYPeSODiwUCpT1vHDia
 O14ojf4ptaxnr2pJbSVGgLmsg7wM/+SP+hX//0WZAMKiQ0EQi+hnxayCIuzxXgZOW7
 k0SFbnB97+04Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mQn1v-00051u-EF; Thu, 16 Sep 2021 10:46:03 +0200
Date: Thu, 16 Sep 2021 10:46:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] serial: 8250: SERIAL_8250_FSL should not default to y
 when compile-testing
Message-ID: <YUMESxr907YHM3ZT@hovoldconsulting.com>
References: <c5f8aa5c081755f3c960b86fc61c2baaa33edcd9.1631710216.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5f8aa5c081755f3c960b86fc61c2baaa33edcd9.1631710216.git.geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 linux-serial@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 15, 2021 at 02:56:52PM +0200, Geert Uytterhoeven wrote:
> Commit b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
> added compile-test support to the Freescale 16550 driver.  However, as
> SERIAL_8250_FSL is an invisible symbol, merely enabling COMPILE_TEST now
> enables this driver.
> 
> Fix this by making SERIAL_8250_FSL visible.  Tighten the dependencies to
> prevent asking the user about this driver when configuring a kernel
> without appropriate Freescale SoC or ACPI support.

This tightening is arguable a separate change which risk introducing
regressions if you get it wrong and should go in a separate patch at
least.

> Fixes: b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Yes, it's ugly, but I see no better solution. Do you?
> 
>  drivers/tty/serial/8250/Kconfig | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> index 808268edd2e82a45..a2978b31144e94f2 100644
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@ -361,9 +361,13 @@ config SERIAL_8250_BCM2835AUX
>  	  If unsure, say N.
>  
>  config SERIAL_8250_FSL
> -	bool
> +	bool "Freescale 16550-style UART support (8250 based driver)"
>  	depends on SERIAL_8250_CONSOLE
> -	default PPC || ARM || ARM64 || COMPILE_TEST
> +	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || (ARM64 && ACPI) || COMPILE_TEST
> +	default FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || (ARM64 && ACPI)

I'd suggest just doing

	bool "Freescale 16550-style UART support (8250 based driver)"
	depends on SERIAL_8250_CONSOLE
	default PPC || ARM || ARM64

Since neither of the symbols you add to that "depends on" line is an
actual build or runtime dependency.

Then you can refine the "default" line in a follow up (or argue why you
think there should be a "depends on FSL_SOC || ...").

> +	help
> +	  Selecting this option will add support for the 16550-style serial
> +	  port hardware found on Freescale SoCs.
>  
>  config SERIAL_8250_DW
>  	tristate "Support for Synopsys DesignWare 8250 quirks"

Johan
