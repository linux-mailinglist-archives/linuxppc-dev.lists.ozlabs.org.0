Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D23705663
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 20:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLQQf6dDsz3f8L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 04:54:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jssn2VyK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jssn2VyK;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLQPq2fQRz3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 04:54:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28A9A63617;
	Tue, 16 May 2023 18:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B413C433D2;
	Tue, 16 May 2023 18:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684263243;
	bh=Y29ciGsqbYK4aeA9R00cOYH1MS2t61zQJwlFBgifawk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jssn2VyKDq8zz69hFz2NfP+8chmdjxly5blQwS/tntPZ9RwClaVaC995/sMQSeCx8
	 3m43c0bXxAJE+s9JxQ3Voj70RSGKPchFcJx21ZEbiFCVn9mGyeFTS5NveVXbsxftix
	 mkL4+jw+jx4/ScXe/1q821JhDxTVCes+lZcd4GsKfsZnPHYLRKh4S0xv4fF6/6HATA
	 iK0VCyIY63Sei//q2cV+0vojQc5uTomXokd87DNDxT8llhERXxJD59oWXCONw49Ljg
	 8ey4WhM0+5A71CDFxQbXx6yKIxZiQoNQz2f77eaaaThwNeCgPpXlkxzW5BkhgVuDrl
	 bjEwS6pAQiDhg==
Received: by pali.im (Postfix)
	id AEDEBA47; Tue, 16 May 2023 20:54:00 +0200 (CEST)
Date: Tue, 16 May 2023 20:54:00 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
Message-ID: <20230516185400.urjy6y3kh4grbagt@pali>
References: <20230516152854.22465-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516152854.22465-1-rdunlap@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 16 May 2023 08:28:54 Randy Dunlap wrote:
> In a randconfig with CONFIG_SERIAL_CPM=m and
> CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
> ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
> 
> Prevent the build error by allowing PPC_EARLY_DEBUG_CPM only when
> SERIAL_CPM=y.
> 
> Fixes: c374e00e17f1 ("[POWERPC] Add early debug console for CPM serial ports.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Scott Wood <scottwood@freescale.com>
> Cc: Kumar Gala <galak@kernel.crashing.org>
> Cc: "Pali Rohár" <pali@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org

Looks good,

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  arch/powerpc/Kconfig.debug |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -- a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -240,7 +240,7 @@ config PPC_EARLY_DEBUG_40x
>  
>  config PPC_EARLY_DEBUG_CPM
>  	bool "Early serial debugging for Freescale CPM-based serial ports"
> -	depends on SERIAL_CPM
> +	depends on SERIAL_CPM=y
>  	help
>  	  Select this to enable early debugging for Freescale chips
>  	  using a CPM-based serial port.  This assumes that the bootwrapper
