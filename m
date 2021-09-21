Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F147E412A03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD2cc6Y7Kz2ywm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 10:39:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=popple.id.au header.i=@popple.id.au header.a=rsa-sha256 header.s=202006 header.b=drUTVInK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=popple.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=popple.id.au header.i=@popple.id.au header.a=rsa-sha256
 header.s=202006 header.b=drUTVInK; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD2bw2P2kz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 10:38:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=popple.id.au;
 s=202006; t=1632184724;
 bh=ij2y8kCniONW6Ysf/Jb2WpvHz29WAisuNW7dYflrnAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=drUTVInKYGo8s+358Ph/YIl0ujhKF6B2mEKAn2xFCa/4E11ZcMzqZtkr0UzJfYN+Z
 Xlkm/8rm9Ap+BgPf0h/BzhrRQXJlXapi6pW58NnR5LHsluDNSrLLw7HN9a+ufFP7Km
 RKx9GU7rc97ezC7RDTTGUrwL+aHKwTWkmJKrKBKJpt5HzlUrvyAizQRYPsBorOxxlI
 U0PTjgzrWzuvm62KT8e0vF5seD5VOe0w64VsSGQXhJNRftXqh6r4kxWWtZsh1Pk1O0
 rd/rzf2f7uB3bn/KO3yxT0wVVuN3GCo0CdZbyNwXo1HNmMWCS1S5wqpdggpS5AwHO1
 T/iOZCRnCZwhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD2bk5kVNz9t0T;
 Tue, 21 Sep 2021 10:38:42 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/476: Fix sparse report
Date: Tue, 21 Sep 2021 10:38:36 +1000
Message-ID: <1998989.TeVrErrrU0@cleo>
In-Reply-To: <aa6055769b92a5d8685b8d0adab99c48a0b0ef4b.1631956926.git.christophe.leroy@csgroup.eu>
References: <aa6055769b92a5d8685b8d0adab99c48a0b0ef4b.1631956926.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks, looks reasonable.

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Saturday, 18 September 2021 7:22:32 PM AEST Christophe Leroy wrote:
> 	arch/powerpc/platforms/44x/ppc476.c:236:17: warning: cast removes address space '__iomem' of expression
> 	arch/powerpc/platforms/44x/ppc476.c:241:34: warning: incorrect type in argument 1 (different address spaces)
> 	arch/powerpc/platforms/44x/ppc476.c:241:34:    expected void const volatile [noderef] __iomem *addr
> 	arch/powerpc/platforms/44x/ppc476.c:241:34:    got unsigned char [usertype] *
> 	arch/powerpc/platforms/44x/ppc476.c:243:17: warning: incorrect type in argument 1 (different address spaces)
> 	arch/powerpc/platforms/44x/ppc476.c:243:17:    expected void volatile [noderef] __iomem *addr
> 	arch/powerpc/platforms/44x/ppc476.c:243:17:    got unsigned char [usertype] *[assigned] fpga
> 
> Mark 'fpga' pointer as __iomem.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: ab9a4183fddf ("powerpc: Update currituck pci/usb fixup for new board revision")
> Cc: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/platforms/44x/ppc476.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
> index 07f7e3ce67b5..fb7db5cedd4e 100644
> --- a/arch/powerpc/platforms/44x/ppc476.c
> +++ b/arch/powerpc/platforms/44x/ppc476.c
> @@ -219,7 +219,7 @@ static int board_rev = -1;
>  static int __init ppc47x_get_board_rev(void)
>  {
>  	int reg;
> -	u8 *fpga;
> +	u8 __iomem *fpga;
>  	struct device_node *np = NULL;
>  
>  	if (of_machine_is_compatible("ibm,currituck")) {
> @@ -233,7 +233,7 @@ static int __init ppc47x_get_board_rev(void)
>  	if (!np)
>  		goto fail;
>  
> -	fpga = (u8 *) of_iomap(np, 0);
> +	fpga = of_iomap(np, 0);
>  	of_node_put(np);
>  	if (!fpga)
>  		goto fail;
> 




