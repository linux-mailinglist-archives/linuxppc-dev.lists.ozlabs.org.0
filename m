Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D51AC925FEA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 14:14:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=P2ioUUDO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDdy34FW7z3dHD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 22:14:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=P2ioUUDO;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDdxM3Yz7z3cl9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 22:14:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720008853;
	bh=Pb3IybUOodV6UVRqohn1NmeZMblGt+tknvg2rfacJrM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P2ioUUDOrWweSgrN8LQrpWc+VlNJq64xk5Ac/egxKe74lllzmblNca5qaTEV3gDO4
	 IGklPjThUboFnxBNFOvYPJ+30Zh3Ok3BmmqrH8AaZGDZ5JQyfA+fPYKne0g0nxusZr
	 FEL/T4uNz79M/UCzI8f9CG2hbfoJI3j3XOZ2s+uf5kfHr65QtsQvIkFvvtUwYpQOB3
	 zdYs8DUymdwLPoP8sn7okSJVfGCFxQqCRJDnzQQD5M7G3imYlW/RPItCAReslfxxOq
	 cszQh6m6CVYxKtfELDcC2hUk4FGyCzukzz1d3+WFvczLGhkPfzHFFVw0Vx2TIEVzIv
	 oi2Yrk6FVlFaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDdxJ05mJz4w2Q;
	Wed,  3 Jul 2024 22:14:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] tpm: atmel: Drop PPC64 specific MMIO setup
In-Reply-To: <20240702161052.3563599-1-robh@kernel.org>
References: <20240702161052.3563599-1-robh@kernel.org>
Date: Wed, 03 Jul 2024 22:14:11 +1000
Message-ID: <87frsqk6zw.fsf@mail.lhotse>
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
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Rob Herring (Arm)" <robh@kernel.org> writes:
> The PPC64 specific MMIO setup open codes DT address functions rather
> than using standard address parsing functions. The open-coded version
> fails to handle any address translation and is not endian safe.
>
> I haven't found any evidence of what platform used this. The only thing
> that turned up was a PPC405 platform, but that is 32-bit and PPC405
> support is being removed as well. CONFIG_TCG_ATMEL is not enabled for
> any powerpc config and never was. The support was added in 2005 and
> hasn't been touched since.

I found a post on the tpm list which says it was used in JS21, which
would make sense given the time frame:

  https://lore.kernel.org/all/526EA6FF.2080401@linux.vnet.ibm.com/

  As near as I can tell this was on a single machine type (the js21 circa
  2006).  The firmware on the machine didn't support establishing a root
  of trust, so use of the TPM was as a practical matter effective only for
  the other functions like random number generation and key management.
  The number of users who used the TPM for this on this machine was likely
  very small 7 years ago.  The number of those machines still in service
  today is likely smaller still.  The cross section of those two small
  numbers combined with those who want to run on a shiny new kernel has to
  be quickly approaching zero.
  
The SLOF (firmware) code does confirm that, and includes the same
compatible value as below, so I think that's pretty definitive:

  https://github.com/qemu/SLOF/blob/master/board-js2x/slof/tpm.fs

  \ Atmel TPM.
  
  new-device   500 1 set-unit
  s" tpm" 2dup device-name device-type
  s" AT97SC3201" compatible
  
I used to have a JS21, but it got scrapped in a cleanup a few years
back. I strongly doubt any others still exist, I couldn't find any on
ebay :)

> Rather than try to modernize and fix this code, just remove it.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
> index e63a6a17793c..9b655e9fc7ab 100644
> --- a/drivers/char/tpm/Kconfig
> +++ b/drivers/char/tpm/Kconfig
> @@ -162,7 +162,7 @@ config TCG_NSC
>  
>  config TCG_ATMEL
>  	tristate "Atmel TPM Interface"
> -	depends on PPC64 || HAS_IOPORT_MAP
> +	depends on HAS_IOPORT_MAP
>  	depends on HAS_IOPORT
>  	help
>  	  If you have a TPM security chip from Atmel say Yes and it 
> diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
> index 9fb2defa9dc4..622c4abe8cb3 100644
> --- a/drivers/char/tpm/tpm_atmel.c
> +++ b/drivers/char/tpm/tpm_atmel.c
> @@ -15,7 +15,67 @@
>   */
>  
>  #include "tpm.h"
> -#include "tpm_atmel.h"
> +
> +struct tpm_atmel_priv {
> +	int region_size;
> +	int have_region;
> +	unsigned long base;
> +	void __iomem *iobase;
> +};
> +
> +#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + offset)
> +#define atmel_putb(val, chip, offset) \
> +	outb(val, atmel_get_priv(chip)->base + offset)
> +#define atmel_request_region request_region
> +#define atmel_release_region release_region
> +/* Atmel definitions */
> +enum tpm_atmel_addr {
> +	TPM_ATMEL_BASE_ADDR_LO = 0x08,
> +	TPM_ATMEL_BASE_ADDR_HI = 0x09
> +};
> +
> +static inline int tpm_read_index(int base, int index)
> +{
> +	outb(index, base);
> +	return inb(base+1) & 0xFF;
> +}
> +
> +/* Verify this is a 1.1 Atmel TPM */
> +static int atmel_verify_tpm11(void)
> +{
> +
> +	/* verify that it is an Atmel part */
> +	if (tpm_read_index(TPM_ADDR, 4) != 'A' ||
> +	    tpm_read_index(TPM_ADDR, 5) != 'T' ||
> +	    tpm_read_index(TPM_ADDR, 6) != 'M' ||
> +	    tpm_read_index(TPM_ADDR, 7) != 'L')
> +		return 1;
> +
> +	/* query chip for its version number */
> +	if (tpm_read_index(TPM_ADDR, 0x00) != 1 ||
> +	    tpm_read_index(TPM_ADDR, 0x01) != 1)
> +		return 1;
> +
> +	/* This is an atmel supported part */
> +	return 0;
> +}
> +
> +/* Determine where to talk to device */
> +static void __iomem * atmel_get_base_addr(unsigned long *base, int *region_size)
> +{
> +	int lo, hi;
> +
> +	if (atmel_verify_tpm11() != 0)
> +		return NULL;
> +
> +	lo = tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> +	hi = tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> +
> +	*base = (hi << 8) | lo;
> +	*region_size = 2;
> +
> +	return ioport_map(*base, *region_size);
> +}
>  
>  /* write status bits */
>  enum tpm_atmel_write_status {
> @@ -142,7 +202,6 @@ static void atml_plat_remove(void)
>  	tpm_chip_unregister(chip);
>  	if (priv->have_region)
>  		atmel_release_region(priv->base, priv->region_size);
> -	atmel_put_base_addr(priv->iobase);
>  	platform_device_unregister(pdev);
>  }
>  
> @@ -211,7 +270,6 @@ static int __init init_atmel(void)
>  err_unreg_dev:
>  	platform_device_unregister(pdev);
>  err_rel_reg:
> -	atmel_put_base_addr(iobase);
>  	if (have_region)
>  		atmel_release_region(base,
>  				     region_size);
> diff --git a/drivers/char/tpm/tpm_atmel.h b/drivers/char/tpm/tpm_atmel.h
> deleted file mode 100644
> index 7ac3f69dcf0f..000000000000
> --- a/drivers/char/tpm/tpm_atmel.h
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2005 IBM Corporation
> - *
> - * Authors:
> - * Kylene Hall <kjhall@us.ibm.com>
> - *
> - * Maintained by: <tpmdd-devel@lists.sourceforge.net>
> - *
> - * Device driver for TCG/TCPA TPM (trusted platform module).
> - * Specifications at www.trustedcomputinggroup.org
> - *
> - * These difference are required on power because the device must be
> - * discovered through the device tree and iomap must be used to get
> - * around the need for holes in the io_page_mask.  This does not happen
> - * automatically because the tpm is not a normal pci device and lives
> - * under the root node.
> - */
> -
> -struct tpm_atmel_priv {
> -	int region_size;
> -	int have_region;
> -	unsigned long base;
> -	void __iomem *iobase;
> -};
> -
> -#ifdef CONFIG_PPC64
> -
> -#include <linux/of.h>
> -
> -#define atmel_getb(priv, offset) readb(priv->iobase + offset)
> -#define atmel_putb(val, priv, offset) writeb(val, priv->iobase + offset)
> -#define atmel_request_region request_mem_region
> -#define atmel_release_region release_mem_region
> -
> -static inline void atmel_put_base_addr(void __iomem *iobase)
> -{
> -	iounmap(iobase);
> -}
> -
> -static void __iomem * atmel_get_base_addr(unsigned long *base, int *region_size)
> -{
> -	struct device_node *dn;
> -	unsigned long address, size;
> -	const unsigned int *reg;
> -	int reglen;
> -	int naddrc;
> -	int nsizec;
> -
> -	dn = of_find_node_by_name(NULL, "tpm");
> -
> -	if (!dn)
> -		return NULL;
> -
> -	if (!of_device_is_compatible(dn, "AT97SC3201")) {
> -		of_node_put(dn);
> -		return NULL;
> -	}
> -
> -	reg = of_get_property(dn, "reg", &reglen);
> -	naddrc = of_n_addr_cells(dn);
> -	nsizec = of_n_size_cells(dn);
> -
> -	of_node_put(dn);
> -
> -
> -	if (naddrc == 2)
> -		address = ((unsigned long) reg[0] << 32) | reg[1];
> -	else
> -		address = reg[0];
> -
> -	if (nsizec == 2)
> -		size =
> -		    ((unsigned long) reg[naddrc] << 32) | reg[naddrc + 1];
> -	else
> -		size = reg[naddrc];
> -
> -	*base = address;
> -	*region_size = size;
> -	return ioremap(*base, *region_size);
> -}
> -#else
> -#define atmel_getb(chip, offset) inb(atmel_get_priv(chip)->base + offset)
> -#define atmel_putb(val, chip, offset) \
> -	outb(val, atmel_get_priv(chip)->base + offset)
> -#define atmel_request_region request_region
> -#define atmel_release_region release_region
> -/* Atmel definitions */
> -enum tpm_atmel_addr {
> -	TPM_ATMEL_BASE_ADDR_LO = 0x08,
> -	TPM_ATMEL_BASE_ADDR_HI = 0x09
> -};
> -
> -static inline int tpm_read_index(int base, int index)
> -{
> -	outb(index, base);
> -	return inb(base+1) & 0xFF;
> -}
> -
> -/* Verify this is a 1.1 Atmel TPM */
> -static int atmel_verify_tpm11(void)
> -{
> -
> -	/* verify that it is an Atmel part */
> -	if (tpm_read_index(TPM_ADDR, 4) != 'A' ||
> -	    tpm_read_index(TPM_ADDR, 5) != 'T' ||
> -	    tpm_read_index(TPM_ADDR, 6) != 'M' ||
> -	    tpm_read_index(TPM_ADDR, 7) != 'L')
> -		return 1;
> -
> -	/* query chip for its version number */
> -	if (tpm_read_index(TPM_ADDR, 0x00) != 1 ||
> -	    tpm_read_index(TPM_ADDR, 0x01) != 1)
> -		return 1;
> -
> -	/* This is an atmel supported part */
> -	return 0;
> -}
> -
> -static inline void atmel_put_base_addr(void __iomem *iobase)
> -{
> -}
> -
> -/* Determine where to talk to device */
> -static void __iomem * atmel_get_base_addr(unsigned long *base, int *region_size)
> -{
> -	int lo, hi;
> -
> -	if (atmel_verify_tpm11() != 0)
> -		return NULL;
> -
> -	lo = tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_LO);
> -	hi = tpm_read_index(TPM_ADDR, TPM_ATMEL_BASE_ADDR_HI);
> -
> -	*base = (hi << 8) | lo;
> -	*region_size = 2;
> -
> -	return ioport_map(*base, *region_size);
> -}
> -#endif
> -- 
> 2.43.0
