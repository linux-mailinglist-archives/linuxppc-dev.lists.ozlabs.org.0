Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D9B628
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 17:20:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sWgw58zxzDqYb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 01:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sWfF1fZDzDqVh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 01:18:59 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 08:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,406,1549958400"; d="scan'208";a="341531946"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2019 08:18:51 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hKlZo-0005Ys-RD; Sun, 28 Apr 2019 18:18:48 +0300
Date: Sun, 28 Apr 2019 18:18:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
Message-ID: <20190428151848.GO9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556369542-13247-37-git-send-email-info@metux.net>
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

On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:
> The io resource size is currently recomputed when it's needed but this
> actually needs to be done once (or drivers could specify fixed values)

io -> IO

> 
> Simplify that by doing this computation only once and storing the result
> into the mapsize field. serial8250_register_8250_port() is now called
> only once on driver init, the previous call sites now just fetch the
> value from the mapsize field.

Do I understand correctly that this has no side effects?

Which hardware did you test this on?

> @@ -979,6 +979,9 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
>  	if (up->port.uartclk == 0)
>  		return -EINVAL;
>  
> +	/* compute the mapsize in case the driver didn't specify one */
> +	up->mapsize = serial8250_port_size(up);

I don't know all quirks in 8250 drivers by heart, though can you guarantee that
at this point the device reports correct IO resource size? (If I'm not mistaken
some broken hardware needs some magic to be done before card can be properly
handled)

> -	unsigned int size = serial8250_port_size(up);
>  	struct uart_port *port = &up->port;

> -	int ret = 0;

This and Co is a separate change that can be done in its own patch.

> +			port->membase = ioremap_nocache(port->mapbase,
> +							port->mapsize);

You may increase readability by introducing temporary variables

	... mapbase = port->mapbase;
	... mapsize = port->mapsize;
	...
	port->membase = ioremap_nocache(mapbase, mapsize);
	...

-- 
With Best Regards,
Andy Shevchenko


