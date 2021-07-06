Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F43BD733
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 14:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK2Vs5tCbz3dZt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 22:51:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLBiGX+c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XLBiGX+c; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJzpL5ccxz2ysm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:49:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A11E6113A;
 Tue,  6 Jul 2021 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625568584;
 bh=QakVDMCwjBt5tusk+4GnLyspONeoeI28ccgP32Kkl6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLBiGX+c23s7Hd4vl9BpJNl+HHlvfzXaPVrxwmNjZbEn3M/O+E2BBk+XwQO60Fx+h
 AGg3I9ZxntsVRKX9hKl3+llY2WPdIEmlFNvB047fUI1IK4JVxOEF4dF9gqmuEuGb+m
 YdZOAhq21BupqowkOvwPwtMAMl0LvNKX33WcPSHpRbL6TIhRCmu9lOkum3OF5ngTKK
 9dqdoQWVX++wNeQLXO8JH9t41sX/NUE8HwM2MQno+iFQNi2V60qlJhNUGu7azofLM8
 OVyn3cBQUkqlxFBpjSV6EjXVn4VMkYYJLp789FfNvMpAjh38hTrSLglIFeyVVqTb4s
 nT0/m/zLxXrsA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1m0idy-0003U8-8E; Tue, 06 Jul 2021 12:49:34 +0200
Date: Tue, 6 Jul 2021 12:49:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] bus: Make remove callback return void
Message-ID: <YOQ1PnNT26VsRfLf@hovoldconsulting.com>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Tue, 06 Jul 2021 22:48:04 +1000
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
Cc: nvdimm@lists.linux.dev, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-fpga@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Tomas Winkler <tomas.winkler@intel.com>,
 Julien Grall <jgrall@amazon.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Alex Williamson <alex.williamson@redhat.com>, Alex Elder <elder@kernel.org>,
 linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 Helge Deller <deller@gmx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Len Brown <lenb@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, greybus-dev@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Frank Li <lznuaa@gmail.com>,
 netdev@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mark Gross <mgross@linux.intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Allen Hubbe <allenbh@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Jiri Kosina <jikos@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 linux-cxl@vger.kernel.org, Michael Buesch <m@bues.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Sven Van Asbroeck <TheSven73@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Michael Jamet <michael.jamet@intel.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Adrian Hunter <adrian.hunter@intel.com>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 dmaengine@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Maximilian Luz <luzmaximilian@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 06, 2021 at 11:50:37AM +0200, Uwe Kleine-König wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

>  drivers/staging/greybus/gbphy.c           | 4 +---

>  drivers/usb/serial/bus.c                  | 4 +---

>  include/linux/device/bus.h                | 2 +-

Acked-by: Johan Hovold <johan@kernel.org>
