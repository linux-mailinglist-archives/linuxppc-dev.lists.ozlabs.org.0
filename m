Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E99852EA10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 12:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4NYt36Lhz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 20:41:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pMWZBKi2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4NYH59Vrz30RP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 20:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pMWZBKi2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L4NYD43MVz4xXj;
 Fri, 20 May 2022 20:40:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653043251;
 bh=kLvXGUJ3/ReQbtc7FZG4S2UHVHzM/605lq9b6IyiY5M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pMWZBKi2JiSg+r6at1yci6wwlaKqROcHmumy1qm2oKAprlF7OjcdtRnL4YzJI0ww7
 sD2U1Ve/WujuCckOohm/ghb7M2rTLRAwbRVbneALWNRVCOFweOj4Zqw+AiW9Qd6YZ5
 W8BcHWFaEuMsjmgGl/FVfHm//aeurxvN5nPWIZtI1sM70KGr6t0eNoNv7Jklm+Psb0
 uWvsjppTeHZvH5lbRxbKW7wZyqx2ocpwCpyz87TjsFA6JEPD90EbiYrFICy2ODn2bl
 Dty+eeRKILrhrPZyMVQ2MjxpU8FQLn9KXVqel0TNRihZ+MlyNDRF0C2Afqo96JN5nC
 hHtsMOodRK9Mg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip
 & DIGITAL EtherWORKS PCI/EISA
In-Reply-To: <20220519031345.2134401-1-kuba@kernel.org>
References: <20220519031345.2134401-1-kuba@kernel.org>
Date: Fri, 20 May 2022 20:40:48 +1000
Message-ID: <87o7zsmqq7.fsf@mpe.ellerman.id.au>
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
Cc: tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, arnd@arndb.de,
 corbet@lwn.net, netdev@vger.kernel.org, sburla@marvell.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edumazet@google.com, paulus@samba.org,
 vburru@marvell.com, Jakub Kicinski <kuba@kernel.org>, zhangyue1@kylinos.cn,
 pabeni@redhat.com, aayarekar@marvell.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jakub Kicinski <kuba@kernel.org> writes:
> Looks like almost all changes to this driver had been tree-wide
> refactoring since git era begun. There is one commit from Al
> 15 years ago which could potentially be fixing a real bug.
>
> The driver is using virt_to_bus() and is a real magnet for pointless
> cleanups. It seems unlikely to have real users. Let's try to shed
> this maintenance burden.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: tsbogend@alpha.franken.de
> CC: mpe@ellerman.id.au
> CC: benh@kernel.crashing.org
> CC: paulus@samba.org
> CC: sburla@marvell.com
> CC: vburru@marvell.com
> CC: aayarekar@marvell.com
> CC: arnd@arndb.de
> CC: zhangyue1@kylinos.cn
> CC: linux-doc@vger.kernel.org
> CC: linux-mips@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> CC: linux-parisc@vger.kernel.org
> ---
>  .../device_drivers/ethernet/dec/de4x5.rst     |  189 -
>  .../device_drivers/ethernet/index.rst         |    1 -
>  arch/mips/configs/mtx1_defconfig              |    1 -
>  arch/powerpc/configs/chrp32_defconfig         |    1 -
>  arch/powerpc/configs/ppc6xx_defconfig         |    1 -

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
