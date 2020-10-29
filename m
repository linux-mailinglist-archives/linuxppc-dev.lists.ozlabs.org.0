Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E729F675
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 21:53:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMd2V52TyzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 07:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=VwKBRazZ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMSyV5Z9LzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:49:31 +1100 (AEDT)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 029F1206E3;
 Thu, 29 Oct 2020 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603982968;
 bh=1M8zHKAHm8tfB8AOV5kFGjQ5L8HBiwt2lqvdGfEDgxQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VwKBRazZTJNx5ayevPifAIJt6BcELHVSflPv1Pz3hhkIRLQu/hpqVx9zq6UOPHYwi
 1Cr/eBqf+UTruLweRPs1uluGBSsUp8XS5oIZwMoDI9YYtGpTUHifWPeFkCnRe78Q3+
 9acepxXtiAj1lspr5f5lKQxsgHU3+k3h2anx8nNM=
Date: Thu, 29 Oct 2020 14:49:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 20/33] docs: ABI: testing: make the files compatible
 with ReST output
Message-ID: <20201029144912.3c0a239b@archlinux>
In-Reply-To: <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 30 Oct 2020 07:50:44 +1100
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 Oleh Kravchenko <oleg@kaa.org.ua>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Javier =?UTF-8?B?R29uesOhbGV6?= <javier@javigon.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-acpi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Len Brown <lenb@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Baolin Wang <baolin.wang7@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Dan Murphy <dmurphy@ti.com>,
 Orson Zhai <orsonzhai@gmail.com>, Philippe Bergheaud <felix@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Konstantin Khlebnikov <koct9i@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 15:23:18 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> 
> Some files over there won't parse well by Sphinx.
> 
> Fix them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Query below...  I'm going to guess a rebase issue?

Other than that
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # for IIO


> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> index b7259234ad70..a10a4de3e5fe 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
> @@ -3,67 +3,85 @@ KernelVersion:	4.11
>  Contact:	benjamin.gaignard@st.com
>  Description:
>  		Reading returns the list possible master modes which are:
> -		- "reset"     :	The UG bit from the TIMx_EGR register is
> +
> +
> +		- "reset"
> +				The UG bit from the TIMx_EGR register is
>  				used as trigger output (TRGO).
> -		- "enable"    : The Counter Enable signal CNT_EN is used
> +		- "enable"
> +				The Counter Enable signal CNT_EN is used
>  				as trigger output.
> -		- "update"    : The update event is selected as trigger output.
> +		- "update"
> +				The update event is selected as trigger output.
>  				For instance a master timer can then be used
>  				as a prescaler for a slave timer.
> -		- "compare_pulse" : The trigger output send a positive pulse
> -				    when the CC1IF flag is to be set.
> -		- "OC1REF"    : OC1REF signal is used as trigger output.
> -		- "OC2REF"    : OC2REF signal is used as trigger output.
> -		- "OC3REF"    : OC3REF signal is used as trigger output.
> -		- "OC4REF"    : OC4REF signal is used as trigger output.
> +		- "compare_pulse"
> +				The trigger output send a positive pulse
> +				when the CC1IF flag is to be set.
> +		- "OC1REF"
> +				OC1REF signal is used as trigger output.
> +		- "OC2REF"
> +				OC2REF signal is used as trigger output.
> +		- "OC3REF"
> +				OC3REF signal is used as trigger output.
> +		- "OC4REF"
> +				OC4REF signal is used as trigger output.
> +
>  		Additional modes (on TRGO2 only):
> -		- "OC5REF"    : OC5REF signal is used as trigger output.
> -		- "OC6REF"    : OC6REF signal is used as trigger output.
> +
> +		- "OC5REF"
> +				OC5REF signal is used as trigger output.
> +		- "OC6REF"
> +				OC6REF signal is used as trigger output.
>  		- "compare_pulse_OC4REF":
> -		  OC4REF rising or falling edges generate pulses.
> +				OC4REF rising or falling edges generate pulses.
>  		- "compare_pulse_OC6REF":
> -		  OC6REF rising or falling edges generate pulses.
> +				OC6REF rising or falling edges generate pulses.
>  		- "compare_pulse_OC4REF_r_or_OC6REF_r":
> -		  OC4REF or OC6REF rising edges generate pulses.
> +				OC4REF or OC6REF rising edges generate pulses.
>  		- "compare_pulse_OC4REF_r_or_OC6REF_f":
> -		  OC4REF rising or OC6REF falling edges generate pulses.
> +				OC4REF rising or OC6REF falling edges generate
> +				pulses.
>  		- "compare_pulse_OC5REF_r_or_OC6REF_r":
> -		  OC5REF or OC6REF rising edges generate pulses.
> +				OC5REF or OC6REF rising edges generate pulses.
>  		- "compare_pulse_OC5REF_r_or_OC6REF_f":
> -		  OC5REF rising or OC6REF falling edges generate pulses.
> +				OC5REF rising or OC6REF falling edges generate
> +				pulses.
>  
> -		+-----------+   +-------------+            +---------+
> -		| Prescaler +-> | Counter     |        +-> | Master  | TRGO(2)
> -		+-----------+   +--+--------+-+        |-> | Control +-->
> -		                   |        |          ||  +---------+
> -		                +--v--------+-+ OCxREF ||  +---------+
> -		                | Chx compare +----------> | Output  | ChX
> -		                +-----------+-+         |  | Control +-->
> -		                      .     |           |  +---------+
> -		                      .     |           |    .
> -		                +-----------v-+ OC6REF  |    .
> -		                | Ch6 compare +---------+>
> -		                +-------------+
> +		::
>  
> -		Example with: "compare_pulse_OC4REF_r_or_OC6REF_r":
> +		  +-----------+   +-------------+            +---------+
> +		  | Prescaler +-> | Counter     |        +-> | Master  | TRGO(2)
> +		  +-----------+   +--+--------+-+        |-> | Control +-->
> +		                     |        |          ||  +---------+
> +		                  +--v--------+-+ OCxREF ||  +---------+
> +		                  | Chx compare +----------> | Output  | ChX
> +		                  +-----------+-+         |  | Control +-->
> +		                        .     |           |  +---------+
> +		                        .     |           |    .
> +		                  +-----------v-+ OC6REF  |    .
> +		                  | Ch6 compare +---------+>
> +		                  +-------------+
>  
> -		                X
> -		              X   X
> -		            X .   . X
> -		          X   .   .   X
> -		        X     .   .     X
> -		count X .     .   .     . X
> -		        .     .   .     .
> -		        .     .   .     .
> -		        +---------------+
> -		OC4REF  |     .   .     |
> -		      +-+     .   .     +-+
> -		        .     +---+     .
> -		OC6REF  .     |   |     .
> -		      +-------+   +-------+
> -		        +-+   +-+
> -		TRGO2   | |   | |
> -		      +-+ +---+ +---------+
> +		Example with: "compare_pulse_OC4REF_r_or_OC6REF_r"::
> +
> +		                  X
> +		                X   X
> +		              X .   . X
> +		            X   .   .   X
> +		          X     .   .     X
> +		  count X .     .   .     . X
> +		          .     .   .     .
> +		          .     .   .     .
> +		          +---------------+
> +		  OC4REF  |     .   .     |
> +		        +-+     .   .     +-+
> +		          .     +---+     .
> +		  OC6REF  .     |   |     .
> +		        +-------+   +-------+
> +		          +-+   +-+
> +		  TRGO2   | |   | |
> +		        +-+ +---+ +---------+
>  
>  What:		/sys/bus/iio/devices/triggerX/master_mode
>  KernelVersion:	4.11
> @@ -91,6 +109,30 @@ Description:
>  		When counting down the counter start from preset value
>  		and fire event when reach 0.
>  

Where did these come from?

> +What:		/sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available
> +KernelVersion:	4.12
> +Contact:	benjamin.gaignard@st.com
> +Description:
> +		Reading returns the list possible quadrature modes.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_count0_quadrature_mode
> +KernelVersion:	4.12
> +Contact:	benjamin.gaignard@st.com
> +Description:
> +		Configure the device counter quadrature modes:
> +
> +		channel_A:
> +			Encoder A input servers as the count input and B as
> +			the UP/DOWN direction control input.
> +
> +		channel_B:
> +			Encoder B input serves as the count input and A as
> +			the UP/DOWN direction control input.
> +
> +		quadrature:
> +			Encoder A and B inputs are mixed to get direction
> +			and count with a scale of 0.25.
> +
>  What:		/sys/bus/iio/devices/iio:deviceX/in_count_enable_mode_available
>  KernelVersion:	4.12
>  Contact:	benjamin.gaignard@st.com
> @@ -104,6 +146,7 @@ Description:
>  		Configure the device counter enable modes, in all case
>  		counting direction is set by in_count0_count_direction
>  		attribute and the counter is clocked by the internal clock.
> +
>  		always:
>  			Counter is always ON.
>  
