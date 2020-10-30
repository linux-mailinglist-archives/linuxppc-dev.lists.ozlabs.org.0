Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D22A0394
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:02:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMzsM0tLYzDr44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 22:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab+huawei@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=UNBtt1Tx; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMyjB3ChzzDqjy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 21:09:50 +1100 (AEDT)
Received: from coco.lan (unknown [95.90.213.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D913322210;
 Fri, 30 Oct 2020 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604052587;
 bh=nY70Min4E7MUGYz9J7zA0EKOEj/k9pNAzXLi2/4ZMkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UNBtt1Tx2c8WK/B9Q0efliEgvZY5yYooQin4TVgBsznntS8ZFwkniWxmzY7RzT79m
 oK9xtt1aioR8FC0aS3pTXQ0Xn3bEUZCk6NmIqh/YY+rYfGes9W0TlZNagZzinCUs9H
 0mgCmN5om/0DWDTaU4Jmu0IJpLLZxtrFVkEu873I=
Date: Fri, 30 Oct 2020 11:09:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 20/39] docs: ABI: testing: make the files compatible
 with ReST output
Message-ID: <20201030110925.3e09d59e@coco.lan>
In-Reply-To: <5326488b-4185-9d67-fc09-79b911fbb3b8@st.com>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <58cf3c2d611e0197fb215652719ebd82ca2658db.1604042072.git.mchehab+huawei@kernel.org>
 <5326488b-4185-9d67-fc09-79b911fbb3b8@st.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 30 Oct 2020 21:50:01 +1100
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Petr Mladek <pmladek@suse.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 linux-mm@kvack.org, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Hanjun Guo <guohanjun@huawei.com>, Guenter Roeck <groeck@chromium.org>,
 netdev@vger.kernel.org, Oleh Kravchenko <oleg@kaa.org.ua>,
 Dan Williams <dan.j.williams@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Javier =?UTF-8?B?R29uesOhbGV6?= <javier@javigon.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Gross <mgross@linux.intel.com>,
 linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tom Rix <trix@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Oded Gabbay <oded.gabbay@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Orson Zhai <orsonzhai@gmail.com>, Philippe Bergheaud <felix@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Konstantin Khlebnikov <koct9i@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, 30 Oct 2020 10:19:12 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> escreveu:

> Hi Mauro,
> 
> [...]
> 
> >  
> > +What:		/sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available
> > +KernelVersion:	4.12
> > +Contact:	benjamin.gaignard@st.com
> > +Description:
> > +		Reading returns the list possible quadrature modes.
> > +
> > +What:		/sys/bus/iio/devices/iio:deviceX/in_count0_quadrature_mode
> > +KernelVersion:	4.12
> > +Contact:	benjamin.gaignard@st.com
> > +Description:
> > +		Configure the device counter quadrature modes:
> > +
> > +		channel_A:
> > +			Encoder A input servers as the count input and B as
> > +			the UP/DOWN direction control input.
> > +
> > +		channel_B:
> > +			Encoder B input serves as the count input and A as
> > +			the UP/DOWN direction control input.
> > +
> > +		quadrature:
> > +			Encoder A and B inputs are mixed to get direction
> > +			and count with a scale of 0.25.
> > +  
> 

Hi Fabrice,

> I just noticed that since Jonathan question in v1.
> 
> Above ABI has been moved in the past as discussed in [1]. You can take a
> look at:
> b299d00 IIO: stm32: Remove quadrature related functions from trigger driver
> 
> Could you please remove the above chunk ?
> 
> With that, for the stm32 part:
> Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>


Hmm... probably those were re-introduced due to a rebase. This
series were originally written about 1,5 years ago.

I'll drop those hunks.

Thanks!
Mauro
