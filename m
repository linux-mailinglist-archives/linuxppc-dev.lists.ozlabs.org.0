Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65834198942
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 02:59:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rrZp0K9YzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rrY95td7zDqkd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 11:58:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QV3uo2UA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48rrY83DPpz9sPF;
 Tue, 31 Mar 2020 11:58:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585616301;
 bh=c8QxLZAVwZDP69eK2yRpjGsPj13bvRE+pFfd/mBq/58=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QV3uo2UAfxzPxyIyOABda5NJBpGNlmDyTet2SWRKDOHs1a5Ce4nI1SL/YATBqmCgt
 jAMQcdXfKec6G97JX6DM9v+2aAcI1Y0rpdn/282c1agVOr1jQAf33/sW9WA4Js2bdc
 vMNjn/qamb82UjfKwNf5/H5RA9pEuOk6DpbH0k09WINvoLOB3TKuwiziOja3X8kqQ0
 fKUY9cHrfQqQXQN2a8i4kOVF47+5SsayMkk1HBd0oSTogF9XXQfFKcWaldfuhTxM68
 aKrqONAGWi3qqlcstgkCDge9jXJLoK0SBsFn85IaDNTw+qgA0/I8rdsSx6n+qozhao
 U5etm/SZ3tIUg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: YueHaibing <yuehaibing@huawei.com>, mporter@kernel.crashing.org,
 benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH] powerpc/44x: Make AKEBONO depends on NET
In-Reply-To: <20200330143153.32800-1-yuehaibing@huawei.com>
References: <20200330143153.32800-1-yuehaibing@huawei.com>
Date: Tue, 31 Mar 2020 11:58:28 +1100
Message-ID: <87pnctuyq3.fsf@mpe.ellerman.id.au>
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
Cc: alistair@popple.id.au, YueHaibing <yuehaibing@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

YueHaibing <yuehaibing@huawei.com> writes:
> Fix Kconfig warnings:
>
> WARNING: unmet direct dependencies detected for NETDEVICES
>   Depends on [n]: NET [=n]
>   Selected by [y]:
>   - AKEBONO [=y] && PPC_47x [=y]
>
> WARNING: unmet direct dependencies detected for ETHERNET
>   Depends on [n]: NETDEVICES [=y] && NET [=n]
>   Selected by [y]:
>   - AKEBONO [=y] && PPC_47x [=y]
>
> AKEBONO select NETDEVICES and ETHERNET unconditionally,

It shouldn't do that, that's the job of a defconfig.

It might want to enable NET_VENDOR_IBM iff the config already has NET
and other dependencies enabled.

So the patch below might work?

cheers

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 25ebe634a661..32aac4f40f1b 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -207,9 +207,7 @@ config AKEBONO
 	select PPC4xx_HSTA_MSI
 	select I2C
 	select I2C_IBM_IIC
-	select NETDEVICES
-	select ETHERNET
-	select NET_VENDOR_IBM
+	imply NET_VENDOR_IBM
 	select IBM_EMAC_EMAC4 if IBM_EMAC
 	select USB if USB_SUPPORT
 	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD



> If NET is not set, build fails. Add this dependcy to fix this.
>
> Fixes: 2a2c74b2efcb ("IBM Akebono: Add the Akebono platform")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/powerpc/platforms/44x/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
> index 25ebe634a661..394f662d7df2 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -199,6 +199,7 @@ config FSP2
>  config AKEBONO
>  	bool "IBM Akebono (476gtr) Support"
>  	depends on PPC_47x
> +	depends on NET
>  	select SWIOTLB
>  	select 476FPE
>  	select PPC4xx_PCI_EXPRESS
> -- 
> 2.17.1
