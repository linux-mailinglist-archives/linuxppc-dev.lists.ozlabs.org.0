Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D060DDB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 11:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My2yJ60d5z3cGB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 20:07:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RqCcQ7Zo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=leon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RqCcQ7Zo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My2xM5JPXz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 20:06:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 958ACB82012;
	Wed, 26 Oct 2022 09:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D56C433D6;
	Wed, 26 Oct 2022 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666775202;
	bh=OJvRuXCcGUbboEOk7Whw5rAuR91zEDRn4jEkqbi+aHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqCcQ7ZoY0p0kJ1iG46UxlBE3FBv69P0TzDoyjQ/57SMyKPqS1ilBFnMrACdBWnlM
	 200Ib4YEGd8J6zY2p+qVgx2NFpMNBhhdxMQ62eA4tsalRG48tV/se8pDazphsLb3bp
	 frZDMESa90mI+ETR0o3PthGeH+Y59aN9d1+j2pTgOfF3SV3+RC9v0DBtesaArdEfVW
	 aBC247/J3rMkwu9+DrV9ceUwbKATQtansLvMT2F7LF03ic64keQ6TEQWeHnrFvy3es
	 7mUzUOMIo5cmhKOLIY9pv4Q4iyKHv83LCJmST1Mb58EsJAVnqqeJX57inM1qOilafl
	 uzVCjiasTtJcA==
Date: Wed, 26 Oct 2022 12:06:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] eth: fealnx: delete the driver for Myson MTD-800
Message-ID: <Y1j4nX3zvIXXx+ab@unreal>
References: <20221025184254.1717982-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025184254.1717982-1-kuba@kernel.org>
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
Cc: petrm@nvidia.com, tsbogend@alpha.franken.de, arnd@arndb.de, netdev@vger.kernel.org, linux-mips@vger.kernel.org, npiggin@gmail.com, stephen@networkplumber.org, wsa+renesas@sang-engineering.com, lukas.bulwahn@gmail.com, shayagr@amazon.com, mw@semihalf.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 11:42:54AM -0700, Jakub Kicinski wrote:
> The git history for this driver seems to be completely
> automated / tree wide changes. I can't find any boards
> or systems which would use this chip. Google search
> shows pictures of towel warmers and no networking products.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: tsbogend@alpha.franken.de
> CC: mpe@ellerman.id.au
> CC: npiggin@gmail.com
> CC: christophe.leroy@csgroup.eu
> CC: lukas.bulwahn@gmail.com
> CC: arnd@arndb.de
> CC: stephen@networkplumber.org
> CC: shayagr@amazon.com
> CC: leon@kernel.org
> CC: mw@semihalf.com
> CC: petrm@nvidia.com
> CC: wsa+renesas@sang-engineering.com
> CC: linux-mips@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/mips/configs/mtx1_defconfig      |    1 -
>  arch/powerpc/configs/ppc6xx_defconfig |    1 -
>  drivers/net/ethernet/Kconfig          |   10 -
>  drivers/net/ethernet/Makefile         |    1 -
>  drivers/net/ethernet/fealnx.c         | 1953 -------------------------
>  5 files changed, 1966 deletions(-)
>  delete mode 100644 drivers/net/ethernet/fealnx.c

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
