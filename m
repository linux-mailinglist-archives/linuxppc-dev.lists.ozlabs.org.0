Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB0B62D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 17:40:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sX6z0qKYzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 01:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sX5f751HzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 01:39:16 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 08:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,406,1549958400"; d="scan'208";a="138181186"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2019 08:39:07 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hKltR-0005hz-Nc; Sun, 28 Apr 2019 18:39:05 +0300
Date: Sun, 28 Apr 2019 18:39:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
Message-ID: <20190428153905.GR9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556369542-13247-41-git-send-email-info@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 27, 2019 at 02:52:21PM +0200, Enrico Weigelt, metux IT consult wrote:
> Introduce a little helpers for settings the mmio range from an
> struct resource or start/len parameters with less code.
> (also setting iotype to UPIO_MEM)
> 
> Also converting drivers to use these new helpers as well as
> fetching mapsize field instead of using hardcoded values.
> (the runtime overhead of that should be negligible)
> 
> The idea is moving to a consistent scheme, so later common
> calls like request+ioremap combination can be done by generic
> helpers.

> --- a/drivers/tty/serial/8250/8250_exar.c
> +++ b/drivers/tty/serial/8250/8250_exar.c
> @@ -134,8 +134,10 @@ static int default_setup(struct exar8250 *priv, struct pci_dev *pcidev,
>  	const struct exar8250_board *board = priv->board;
>  	unsigned int bar = 0;
>  
> -	port->port.iotype = UPIO_MEM;
> -	port->port.mapbase = pci_resource_start(pcidev, bar) + offset;
> +	uart_memres_set_start_len(&port->port,
> +				  pci_resource_start(pcidev, bar) + offset,
> +				  pci_resource_len(pcidev, bar));
> +

I don't see how it's better.
Moreover, the size argument seems wrong here.

> +		uart_memres_set_start_len(
> +			&port,
> +			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);

Please, avoid such splitting, first parameter is quite fit above line.

>  		port.uartclk = HPDCA_BAUD_BASE * 16;
> -		port.mapbase = (pa + UART_OFFSET);
> +
> +		uart_memres_set_start_len(&port, (pa + UART_OFFSET));
>  		port.membase = (char *)(port.mapbase + DIO_VIRADDRBASE);
>  		port.regshift = 1;
>  		port.irq = DIO_IPL(pa + DIO_VIRADDRBASE);

Here...

>  	uart.port.flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF;
>  	uart.port.irq = d->ipl;
>  	uart.port.uartclk = HPDCA_BAUD_BASE * 16;
> -	uart.port.mapbase = (d->resource.start + UART_OFFSET);
> +	uart_memres_set_start_len(&uart.port,
> +				  (d->resource.start + UART_OFFSET),
> +				  resource_size(&d->resource));
>  	uart.port.membase = (char *)(uart.port.mapbase + DIO_VIRADDRBASE);
>  	uart.port.regshift = 1;
>  	uart.port.dev = &d->dev;

...and here, and maybe in other places you split the assignments to the members
in two part. Better to call your function before or after these blocks of
assignments.

> -			uport->mapsize	= ZS_CHAN_IO_SIZE;
> -			uport->mapbase	= dec_kn_slot_base +
> -					  zs_parms.scc[chip] +
> -					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
> +
> +			uart_memres_set_start_len(dec_kn_slot_base +
> +						    zs_parms.scc[chip] +
> +						    (side ^ ZS_CHAN_B) *
> +							ZS_CHAN_IO_SIZE,
> +						  ZS_CHAN_IO_SIZE);

This looks hard to read. Think of temporary variables and better formatting
style.

>  /*
> + * set physical io range from struct resource
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM

Something wrong with punctuation and style. Please, use proper casing and
sentences split.

> + */

Shouldn't be kernel-doc formatted?

> +static inline void uart_memres_set_res(struct uart_port *port,

Perhaps better name can be found.
Especially taking into account that it handles IO / MMIO here.

> +				       struct resource *res)
> +{
> +	if (!res) {

It should return an error in such case.

> +		port->mapsize = 0;
> +		port->mapbase = 0;
> +		port->iobase = 0;
> +		return;
> +	}
> +
> +	if (resource_type(res) == IORESOURCE_IO) {
> +		port->iotype = UPIO_PORT;
> +		port->iobase = resource->start;
> +		return;
> +	}
> +
> +	uart->mapbase = res->start;
> +	uart->mapsize = resource_size(res);

> +	uart->iotype  = UPIO_MEM;

Only one type? Why type is even set here?

> +}
> +
> +/*
> + * set physical io range by start address and length
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM

Should be fixed as told above.

> + */

> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> +					     resource_size_t start,
> +					     resource_size_t len)

The comment doesn't tell why this is needed when we have one for struct
resource.

> +{
> +	uart->mapbase = start;
> +	uart->mapsize = len;

> +	uart->iotype  = UPIO_MEM;

Only one type?

> +}
> +
> +/*

-- 
With Best Regards,
Andy Shevchenko


