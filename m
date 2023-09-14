Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B47A0E5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 21:31:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9JgvmXs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmnVv1YNBz3cS5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 05:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9JgvmXs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmnTw06Bjz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 05:30:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=AevdVbEeE/ZSF01htVC+Vg2ivg78mjd0b33rpJwaKrA=; b=l9JgvmXs7r6YikbpgfTBgQ47RP
	cqt2jgiF3Ob76e2yBQU1LocTVzibO2vihmOugHJiq75Lt0osHrKLIqZ0YKut50tR9IndOLFQEremb
	c4AlWRcGWob80bbmcmdUjyJyAqKvADJGLU9858haFK6TZ94NbMSowgwzZzkcPC+St7vYf7T/C8sWa
	iHBntoZc8t/yeAZyerpeHTFeyosWEL9/eRse1MRXSXjvTvNvQ4Zh3JjiW88U9ZquUo5fGcLteHrjD
	XrHXeaUPOnR8DiuE+UqnmXJ5Wb9EJZsTi8lEdE+rrdSTu4E90ZebCkYsIuWbugrzn2p4iXdyWl3pA
	R6bAcapQ==;
Received: from [2601:1c2:980:9ec0::9fed]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qgs2a-009ANC-2s;
	Thu, 14 Sep 2023 19:30:16 +0000
Message-ID: <624f326b-919a-43a8-983d-63977cabd443@infradead.org>
Date: Thu, 14 Sep 2023 12:30:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/82xx: Select FSL_SOC
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <7ab513546148ebe33ddd4b0ea92c7bfd3cce3ad7.1694705016.git.christophe.leroy@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <7ab513546148ebe33ddd4b0ea92c7bfd3cce3ad7.1694705016.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/14/23 08:23, Christophe Leroy wrote:
> It used to be impossible to select CONFIG_CPM2 without selecting
> CONFIG_FSL_SOC at the same time because CONFIG_CPM2 was dependent
> on CONFIG_8260 and CONFIG_8260 was selecting CONFIG_FSL_SOC.
> 
> But after commit eb5aa2137275 ("powerpc/82xx: Remove CONFIG_8260
> and CONFIG_8272") CONFIG_CPM2 depends on CONFIG_MPC82xx instead
> but CONFIG_MPC82xx doesn't directly selects CONFIG_FSL_SOC.
> 
> Fix it by forcing CONFIG_MPC82xx to select CONFIG_FSL_SOC just
> like already done by MPC8xx, MPC512x, MPC83xx, PPC_86xx.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: eb5aa2137275 ("powerpc/82xx: Remove CONFIG_8260 and CONFIG_8272")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for tracking this down.

> ---
>  arch/powerpc/platforms/82xx/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/82xx/Kconfig b/arch/powerpc/platforms/82xx/Kconfig
> index d9f1a2a83158..1824536cf6f2 100644
> --- a/arch/powerpc/platforms/82xx/Kconfig
> +++ b/arch/powerpc/platforms/82xx/Kconfig
> @@ -2,6 +2,7 @@
>  menuconfig PPC_82xx
>  	bool "82xx-based boards (PQ II)"
>  	depends on PPC_BOOK3S_32
> +	select FSL_SOC
>  
>  if PPC_82xx
>  
> @@ -9,7 +10,6 @@ config EP8248E
>  	bool "Embedded Planet EP8248E (a.k.a. CWH-PPC-8248N-VE)"
>  	select CPM2
>  	select PPC_INDIRECT_PCI if PCI
> -	select FSL_SOC
>  	select PHYLIB if NETDEVICES
>  	select MDIO_BITBANG if PHYLIB
>  	help
> @@ -22,7 +22,6 @@ config MGCOGE
>  	bool "Keymile MGCOGE"
>  	select CPM2
>  	select PPC_INDIRECT_PCI if PCI
> -	select FSL_SOC
>  	help
>  	  This enables support for the Keymile MGCOGE board.
>  

-- 
~Randy
