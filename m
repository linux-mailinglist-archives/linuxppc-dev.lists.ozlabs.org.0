Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C68EEE10E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:10:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t24V0pCTzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 21:10:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0q30wbvzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 20:13:17 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mn2eH-1gtAeU2env-00k71v; Mon, 29 Apr 2019 12:12:41 +0200
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
 <20190428153905.GR9224@smile.fi.intel.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
Date: Mon, 29 Apr 2019 12:12:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190428153905.GR9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5FkmJafy5b5rMQmFz5MFYjwZmJr3yDLuFQxt3St57wxX5e7mxBe
 D8gfJTEZt0nLiRI3QkVGXsb9wFfsMmR3uoGvaxXgyLlbyWLfln2s3zeyyG6o65B1y5WhMcw
 +UezzJKbteNZnyt/6ruUBSu+3RNIYCG4i6IsdWYkD19xg7ktkmAgoTChutrNqAWKbIy18AH
 9oGUMGzHGkqb2alaK+C2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7tP6LgaKJ7I=:f1If2vaJgwBnL/GMoXSVIX
 MPluTwHXqchm7WJg0qmVVZG7JtWCbTp0wuD3Y5kmBa5wFnvp1/XLA14GcDxgC6ecixJrilyO1
 ajh0Xr0Xqi41cOjfAGDjmbED/G6IxY+lBKINgsciqrC4fkrb8/EKY2LBqfF38e5uUwB0JyD/o
 PPHDPuYNCAvxwe2px9yLabR7lCcaI3j8oSMZT8aIgRvOq4yuEud+V3yfnbUjDAhy7AAZXSTNz
 PFxpQK8JC/VjmUfuyj02oJOCfW1OccsGB45/LwL304A8lPd/BtjqwFq1UH05e45x/ZNj0wMRi
 QIyUo6L0cymajBznFNs8i7smcqapNbCttDsScmvqLDhF8QMo0DAndENY4ny04KI/pftgsLSEO
 bgvp+wj5zHD6ObQm/cJ7RNYrPHZ7NK4dTBk83YaL83sqNIN5sUTYVMRTDljX3GSQr7kBSy9pJ
 WL56aZQL6H4rNLgRgew/lYTQ4W7//8UIpidCWD7ofRaC7VrGWNwpTs8l2ebScq8Wsl6QLCaO2
 O0pZ9fPElJ+wdwey6GXGouyoHxdMFxL3u9IYSgRxWq9+3w52h1wHrCmAC/taWiTDBc2semljj
 OwQJV9hG90HAtzDQe8o0df0wESJjF1ztyJVNgHjVWhSmNiZ9TSEND/7hZM/Lt4ScGqIzcMSjv
 2Og6Lk8EzYxVNyzrHKir1tCMBx1j/0QbRyNnxNQo07uH1cbysow9CPLPJ3dAYImDxDcAUjMRB
 5Lc3dsS4j36EMoHTPVR+6f104n+ntvt5nPCp5xG5dNp8mXtAHkchqYFy+IU=
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

On 28.04.19 17:39, Andy Shevchenko wrote:

Hi,

seems I've forgot to add "RFC:" in the subject - I'm not entirely happy
w/ that patch myself, just want to hear your oppinions.

>> -	port->port.iotype = UPIO_MEM;>> -	port->port.mapbase = pci_resource_start(pcidev, bar) + offset;>> +
uart_memres_set_start_len(&port->port,>> +				
pci_resource_start(pcidev, bar) + offset,>> +				
pci_resource_len(pcidev, bar));>> +> > I don't see how it's better.>
Moreover, the size argument seems wrong here.
hmm, I'm actually not sure yet, what the correct size really would be,
where the value actually comes from. Just assumed that it would be the
whole area that the BAR tells. But now I recognized that I'd need to
substract 'offset' here.

Rethinking it further, we'd probably could deduce the UPIO_* from the
struct resource, too.

>> +		uart_memres_set_start_len(>> +			&port,>> +			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);> > Please,
avoid such splitting, first parameter is quite fit above line.

Ok. My intention was having both parameters starting at the same line,
but then the second line would get too long again. > ...and here, and
maybe in other places you split the assignments to the members> in two
part. Better to call your function before or after these blocks of>
assignments.
the reason what I've just replaced the exactly the assignments, trying
not to touch too much ;-)
I'll have a closer look on what can be moved w/o side effects.

>> -			uport->mapsize	= ZS_CHAN_IO_SIZE;
>> -			uport->mapbase	= dec_kn_slot_base +
>> -					  zs_parms.scc[chip] +
>> -					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
>> +
>> +			uart_memres_set_start_len(dec_kn_slot_base +
>> +						    zs_parms.scc[chip] +
>> +						    (side ^ ZS_CHAN_B) *
>> +							ZS_CHAN_IO_SIZE,
>> +						  ZS_CHAN_IO_SIZE);
> 
> This looks hard to read. Think of temporary variables and better formatting
> style.

Ok.

> 
>>  /*
>> + * set physical io range from struct resource
>> + * if resource is NULL, clear the fields
>> + * also set the iotype to UPIO_MEM
> 
> Something wrong with punctuation and style. Please, use proper casing and
> sentences split.

Ok. fixed it.


>> +static inline void uart_memres_set_res(struct uart_port *port,
> 
> Perhaps better name can be found.
> Especially taking into account that it handles IO / MMIO here.

hmm, lacking creativity here ;-)
any suggestions ?

> 
>> +				       struct resource *res)
>> +{
>> +	if (!res) {
> 
> It should return an error in such case.

It's not an error, but desired behaviour: NULL resource
clears the value.

>> +		port->mapsize = 0;
>> +		port->mapbase = 0;
>> +		port->iobase = 0;
>> +		return;
>> +	}
>> +
>> +	if (resource_type(res) == IORESOURCE_IO) {
>> +		port->iotype = UPIO_PORT;
>> +		port->iobase = resource->start;
>> +		return;
>> +	}
>> +
>> +	uart->mapbase = res->start;
>> +	uart->mapsize = resource_size(res);
> 
>> +	uart->iotype  = UPIO_MEM;
> 
> Only one type? Why type is even set here?

It's the default case. The special cases (eg. UPIO_MEM32) need to be
set explicitly, after that call.

Not really nice, but haven't found a better solution yet. I don't like
the idea of passing an UPIO_* parameter to the function, most callers
should not care, if they don't really need to.


>> + */
> 
>> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
>> +					     resource_size_t start,
>> +					     resource_size_t len)
> 
> The comment doesn't tell why this is needed when we have one for struct
> resource.

Renamed it to uart_memres_set_mmio_range().

This helper is meant for drivers that don't work w/ struct resource,
or explicitly set their own len.



Thanks for your review.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
