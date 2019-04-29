Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B7E3CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 15:31:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t5DB4FKHzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 23:31:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t58b4TlJzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 23:28:46 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 06:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="341805320"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2019 06:28:39 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hL6Kj-0008Iz-6u; Mon, 29 Apr 2019 16:28:37 +0300
Date: Mon, 29 Apr 2019 16:28:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
Message-ID: <20190429132837.GF9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
 <20190428153905.GR9224@smile.fi.intel.com>
 <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
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
Cc: sparclinux@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 linuxppc-dev@lists.ozlabs.org, khilman@baylibre.com, macro@linux-mips.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 12:12:35PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:39, Andy Shevchenko wrote:

> seems I've forgot to add "RFC:" in the subject - I'm not entirely happy
> w/ that patch myself, just want to hear your oppinions.
> 
> Moreover, the size argument seems wrong here.

Something went wrong with quoting style in your reply.

> hmm, I'm actually not sure yet, what the correct size really would be,
> where the value actually comes from. Just assumed that it would be the
> whole area that the BAR tells. But now I recognized that I'd need to
> substract 'offset' here.

It will be still wrong. The driver in question defines resource window based on
several parameters. So, this should be supplied with a real understanding of
all variety of hardware the certain driver serves for.

> Rethinking it further, we'd probably could deduce the UPIO_* from the
> struct resource, too.
> 
> >> +		uart_memres_set_start_len(>> +			&port,>> +			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);> > Please,
> avoid such splitting, first parameter is quite fit above line.
> 
> Ok. My intention was having both parameters starting at the same line,
> but then the second line would get too long again. > ...and here, and
> maybe in other places you split the assignments to the members> in two
> part. Better to call your function before or after these blocks of>
> assignments.
> the reason what I've just replaced the exactly the assignments, trying
> not to touch too much ;-)
> I'll have a closer look on what can be moved w/o side effects.

Just try to avoid

	foo(
		bar, ...

-like splitting.

> >> +static inline void uart_memres_set_res(struct uart_port *port,
> > 
> > Perhaps better name can be found.
> > Especially taking into account that it handles IO / MMIO here.
> 
> hmm, lacking creativity here ;-)
> any suggestions ?

No immediate suggestions.

uart_set_io_resource()
uart_clear_io_resource()

at least sounds more plausible to me.

> >> +				       struct resource *res)
> >> +{
> >> +	if (!res) {
> > 
> > It should return an error in such case.
> 
> It's not an error, but desired behaviour: NULL resource
> clears the value.

Oh, then why it's in this function, which is *setter* according to its name,
at all?

> 
> >> +		port->mapsize = 0;
> >> +		port->mapbase = 0;
> >> +		port->iobase = 0;
> >> +		return;
> >> +	}
> >> +
> >> +	if (resource_type(res) == IORESOURCE_IO) {
> >> +		port->iotype = UPIO_PORT;
> >> +		port->iobase = resource->start;
> >> +		return;
> >> +	}
> >> +
> >> +	uart->mapbase = res->start;
> >> +	uart->mapsize = resource_size(res);
> > 
> >> +	uart->iotype  = UPIO_MEM;
> > 
> > Only one type? Why type is even set here?
> 
> It's the default case. The special cases (eg. UPIO_MEM32) need to be
> set explicitly, after that call.

Which is weird.

> Not really nice, but haven't found a better solution yet.

Just simple not touching it?

> I don't like
> the idea of passing an UPIO_* parameter to the function, most callers
> should not care, if they don't really need to.

They do care. The driver on its own knows better than any generic code what
type of hardware it serves to.

> >> + */
> > 
> >> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> >> +					     resource_size_t start,
> >> +					     resource_size_t len)
> > 
> > The comment doesn't tell why this is needed when we have one for struct
> > resource.
> 
> Renamed it to uart_memres_set_mmio_range().

See also above about naming patterns.

> 
> This helper is meant for drivers that don't work w/ struct resource,
> or explicitly set their own len.

Then why it's not mentioned in the description of the function?

-- 
With Best Regards,
Andy Shevchenko


