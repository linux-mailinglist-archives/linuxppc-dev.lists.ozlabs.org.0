Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75229E59E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 09:02:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMHwm2HbSzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 19:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab+huawei@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=AXef/AhA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMH1H4X1hzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 18:21:23 +1100 (AEDT)
Received: from coco.lan (ip5f5ad5de.dynamic.kabel-deutschland.de
 [95.90.213.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D568206A1;
 Thu, 29 Oct 2020 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603956079;
 bh=ydKKLjnIGAQnlNnBFT/eI5WDiCpUdvgjw4RkqNPBoTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AXef/AhAlPh1hi9YsdIj4o1ixVYaGEAZM4H9T1mWHDD5hcqq9AHBGqQYLJm4zvkzm
 vDRNtmfz4vMaZ1nCDFiLdWyz0Wl7IBqlNL9mj+lYOyRgbN8ZBRkoI4V/HMDyMBFkDS
 A+Vrm0psmwUp0NppXp1qjXj8jB9uy8mTt+24KpoY=
Date: Thu, 29 Oct 2020 08:21:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 20/33] docs: ABI: testing: make the files compatible
 with ReST output
Message-ID: <20201029082100.4820072c@coco.lan>
In-Reply-To: <20201028174427.GE9364@hoboy.vegasvil.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
 <4ebaaa0320101479e392ce2db4b62e24fdf15ef1.1603893146.git.mchehab+huawei@kernel.org>
 <20201028174427.GE9364@hoboy.vegasvil.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 19:01:06 +1100
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
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Baolin Wang <baolin.wang7@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Dan Murphy <dmurphy@ti.com>, Orson Zhai <orsonzhai@gmail.com>,
 Philippe Bergheaud <felix@linux.ibm.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Richard,

Em Wed, 28 Oct 2020 10:44:27 -0700
Richard Cochran <richardcochran@gmail.com> escreveu:

> On Wed, Oct 28, 2020 at 03:23:18PM +0100, Mauro Carvalho Chehab wrote:
> 
> > diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> > index aa39f8d7bcdf..d0893dad3f38 100644
> > --- a/Documentation/ABI/testing/sysfs-uevent
> > +++ b/Documentation/ABI/testing/sysfs-uevent
> > @@ -19,7 +19,8 @@ Description:
> >                  a transaction identifier so it's possible to use the same UUID
> >                  value for one or more synthetic uevents in which case we
> >                  logically group these uevents together for any userspace
> > -                listeners. The UUID value appears in uevent as
> > +                listeners. The UUID value appears in uevent as:  
> 
> I know almost nothing about Sphinx, but why have one colon here ^^^ and ...

Good point. After re-reading the text, this ":" doesn't belong here.

> 
> > +
> >                  "SYNTH_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" environment
> >                  variable.
> >  
> > @@ -30,18 +31,19 @@ Description:
> >                  It's possible to define zero or more pairs - each pair is then
> >                  delimited by a space character ' '. Each pair appears in
> >                  synthetic uevent as "SYNTH_ARG_KEY=VALUE". That means the KEY
> > -                name gains "SYNTH_ARG_" prefix to avoid possible collisions
> > +                name gains `SYNTH_ARG_` prefix to avoid possible collisions
> >                  with existing variables.
> >  
> > -                Example of valid sequence written to the uevent file:
> > +                Example of valid sequence written to the uevent file::  
> 
> ... two here?

The main issue that this patch wants to solve is here:

                This generates synthetic uevent including these variables::

                    ACTION=add
                    SYNTH_ARG_A=1
                    SYNTH_ARG_B=abc
                    SYNTH_UUID=fe4d7c9d-b8c6-4a70-9ef1-3d8a58d18eed

On Sphinx, consecutive lines with the same indent belongs to the same
paragraph. So, without "::", the above will be displayed on a single line,
which is undesired.

using "::" tells Sphinx to display as-is. It will also place it into a a 
box (colored for html output) and using a monospaced font.

The change at the "uevent file:" line was done just for coherency
purposes.

Yet, after re-reading the text, there are other things that are not
coherent. So, I guess the enclosed patch will work better for sys-uevent.

Thanks,
Mauro

docs: ABI: sysfs-uevent: make it compatible with ReST output

- Replace " by ``, in order to use monospaced fonts;
- mark literal blocks as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
index aa39f8d7bcdf..0b6227706b35 100644
--- a/Documentation/ABI/testing/sysfs-uevent
+++ b/Documentation/ABI/testing/sysfs-uevent
@@ -6,42 +6,46 @@ Description:
                 Enable passing additional variables for synthetic uevents that
                 are generated by writing /sys/.../uevent file.
 
-                Recognized extended format is ACTION [UUID [KEY=VALUE ...].
+                Recognized extended format is::
 
-                The ACTION is compulsory - it is the name of the uevent action
-                ("add", "change", "remove"). There is no change compared to
-                previous functionality here. The rest of the extended format
-                is optional.
+			ACTION [UUID [KEY=VALUE ...]
+
+                The ACTION is compulsory - it is the name of the uevent
+                action (``add``, ``change``, ``remove``). There is no change
+                compared to previous functionality here. The rest of the
+                extended format is optional.
 
                 You need to pass UUID first before any KEY=VALUE pairs.
-                The UUID must be in "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
+                The UUID must be in ``xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx``
                 format where 'x' is a hex digit. The UUID is considered to be
                 a transaction identifier so it's possible to use the same UUID
                 value for one or more synthetic uevents in which case we
                 logically group these uevents together for any userspace
                 listeners. The UUID value appears in uevent as
-                "SYNTH_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" environment
+                ``SYNTH_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`` environment
                 variable.
 
                 If UUID is not passed in, the generated synthetic uevent gains
-                "SYNTH_UUID=0" environment variable automatically.
+                ``SYNTH_UUID=0`` environment variable automatically.
 
                 The KEY=VALUE pairs can contain alphanumeric characters only.
+
                 It's possible to define zero or more pairs - each pair is then
                 delimited by a space character ' '. Each pair appears in
-                synthetic uevent as "SYNTH_ARG_KEY=VALUE". That means the KEY
-                name gains "SYNTH_ARG_" prefix to avoid possible collisions
+                synthetic uevent as ``SYNTH_ARG_KEY=VALUE``. That means the KEY
+                name gains ``SYNTH_ARG_`` prefix to avoid possible collisions
                 with existing variables.
 
-                Example of valid sequence written to the uevent file:
+                Example of valid sequence written to the uevent file::
 
                     add fe4d7c9d-b8c6-4a70-9ef1-3d8a58d18eed A=1 B=abc
 
-                This generates synthetic uevent including these variables:
+                This generates synthetic uevent including these variables::
 
                     ACTION=add
                     SYNTH_ARG_A=1
                     SYNTH_ARG_B=abc
                     SYNTH_UUID=fe4d7c9d-b8c6-4a70-9ef1-3d8a58d18eed
+
 Users:
                 udev, userspace tools generating synthetic uevents
