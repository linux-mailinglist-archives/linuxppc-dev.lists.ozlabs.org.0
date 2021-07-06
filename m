Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A743BD73E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 14:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK2YW6QHsz3dtR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 22:53:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhD2+ncg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+0Xe0RL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cohuck@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YhD2+ncg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+0Xe0RL; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK0R00Gwrz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 21:18:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+JgLl9QuEVsbPi9CHfgp/50dUcjaNVT1a3Q1xwSglg=;
 b=YhD2+ncgWCRAijnDTM9T8524TAhPIwfXMsgsxrzwLm78TBXn7K7e0GDbko0BgPftuixp3w
 7qgfF2Gbi6YuJ5EdbjRi86cZ4+Fe37kMgCRKHuQrEY1dLqdVnaR/2WiKg9BQQVuaMYAK0B
 3VHpL5wwHckLcBk2F28geVQINDOo/Z4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+JgLl9QuEVsbPi9CHfgp/50dUcjaNVT1a3Q1xwSglg=;
 b=O+0Xe0RLsk1hNaE68cvzbF+cwSp4aH5k483WstqokRCAYKevK9Pmesz72SX+ITfmIU3VNJ
 G0WxfAiTWnlRxvGjbDIa5EOEoy6Dfx6y5EYoC8ass+BKrjGWENkjpTrjPR53+vpImj1gbT
 4/Ts/FMH2JUOKCO47kEAAJkIC7X6d9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-yIaEybclO9Gf3dSvLShqRA-1; Tue, 06 Jul 2021 07:17:55 -0400
X-MC-Unique: yIaEybclO9Gf3dSvLShqRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 966CD802C87;
 Tue,  6 Jul 2021 11:17:49 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC1919C79;
 Tue,  6 Jul 2021 11:17:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] bus: Make remove callback return void
In-Reply-To: <87pmvvhfqq.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
 <87pmvvhfqq.fsf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 06 Jul 2021 13:17:37 +0200
Message-ID: <87mtqzhesu.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Mike Christie <michael.christie@oracle.com>,
 Wei Liu <wei.liu@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Julien Grall <jgrall@amazon.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>, linux-parisc@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, linux-fpga@vger.kernel.org,
 linux-usb@vger.kernel.org, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84sk?= =?utf-8?Q?i?= <kw@linux.com>,
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
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82eck?= =?utf-8?Q?i?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Len Brown <lenb@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
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
 Sudeep Holla <sudeep.holla@arm.com>, "David S.
 Miller" <davem@davemloft.net>, Sven Van Asbroeck <TheSven73@gmail.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Tue, Jul 06 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, Jul 06 2021, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
>
>> The driver core ignores the return value of this callback because there
>> is only little it can do when a device disappears.
>>
>> This is the final bit of a long lasting cleanup quest where several
>> buses were converted to also return void from their remove callback.
>> Additionally some resource leaks were fixed that were caused by drivers
>> returning an error code in the expectation that the driver won't go
>> away.
>>
>> With struct bus_type::remove returning void it's prevented that newly
>> implemented buses return an ignored error code and so don't anticipate
>> wrong expectations for driver authors.
>
> Yay!
>
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> Hello,
>>
>> this patch depends on "PCI: endpoint: Make struct pci_epf_driver::remove
>> return void" that is not yet applied, see
>> https://lore.kernel.org/r/20210223090757.57604-1-u.kleine-koenig@pengutr=
onix.de.
>>
>> I tested it using allmodconfig on amd64 and arm, but I wouldn't be
>> surprised if I still missed to convert a driver. So it would be great to
>> get this into next early after the merge window closes.
>
> I'm afraid you missed the s390-specific busses in drivers/s390/cio/
> (css/ccw/ccwgroup).

The change for vfio/mdev looks good.

The following should do the trick for s390; not sure if other
architectures have easy-to-miss busses as well.

diff --git a/drivers/s390/cio/ccwgroup.c b/drivers/s390/cio/ccwgroup.c
index 9748165e08e9..a66f416138ab 100644
--- a/drivers/s390/cio/ccwgroup.c
+++ b/drivers/s390/cio/ccwgroup.c
@@ -439,17 +439,15 @@ module_exit(cleanup_ccwgroup);
=20
 /************************** driver stuff ******************************/
=20
-static int ccwgroup_remove(struct device *dev)
+static void ccwgroup_remove(struct device *dev)
 {
 =09struct ccwgroup_device *gdev =3D to_ccwgroupdev(dev);
 =09struct ccwgroup_driver *gdrv =3D to_ccwgroupdrv(dev->driver);
=20
 =09if (!dev->driver)
-=09=09return 0;
+=09=09return;
 =09if (gdrv->remove)
 =09=09gdrv->remove(gdev);
-
-=09return 0;
 }
=20
 static void ccwgroup_shutdown(struct device *dev)
diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
index a974943c27da..ebc321edba51 100644
--- a/drivers/s390/cio/css.c
+++ b/drivers/s390/cio/css.c
@@ -1371,15 +1371,14 @@ static int css_probe(struct device *dev)
 =09return ret;
 }
=20
-static int css_remove(struct device *dev)
+static void css_remove(struct device *dev)
 {
 =09struct subchannel *sch;
-=09int ret;
=20
 =09sch =3D to_subchannel(dev);
-=09ret =3D sch->driver->remove ? sch->driver->remove(sch) : 0;
+=09if (sch->driver->remove)
+=09=09sch->driver->remove(sch);
 =09sch->driver =3D NULL;
-=09return ret;
 }
=20
 static void css_shutdown(struct device *dev)
diff --git a/drivers/s390/cio/device.c b/drivers/s390/cio/device.c
index 84f659cafe76..61d5d55bd9c8 100644
--- a/drivers/s390/cio/device.c
+++ b/drivers/s390/cio/device.c
@@ -1742,7 +1742,7 @@ ccw_device_probe (struct device *dev)
 =09return 0;
 }
=20
-static int ccw_device_remove(struct device *dev)
+static void ccw_device_remove(struct device *dev)
 {
 =09struct ccw_device *cdev =3D to_ccwdev(dev);
 =09struct ccw_driver *cdrv =3D cdev->drv;
@@ -1776,8 +1776,6 @@ static int ccw_device_remove(struct device *dev)
 =09spin_unlock_irq(cdev->ccwlock);
 =09io_subchannel_quiesce(sch);
 =09__disable_cmf(cdev);
-
-=09return 0;
 }
=20
 static void ccw_device_shutdown(struct device *dev)
diff --git a/drivers/s390/cio/scm.c b/drivers/s390/cio/scm.c
index 9f26d4310bb3..b6b4589c70bd 100644
--- a/drivers/s390/cio/scm.c
+++ b/drivers/s390/cio/scm.c
@@ -28,12 +28,13 @@ static int scmdev_probe(struct device *dev)
 =09return scmdrv->probe ? scmdrv->probe(scmdev) : -ENODEV;
 }
=20
-static int scmdev_remove(struct device *dev)
+static void scmdev_remove(struct device *dev)
 {
 =09struct scm_device *scmdev =3D to_scm_dev(dev);
 =09struct scm_driver *scmdrv =3D to_scm_drv(dev->driver);
=20
-=09return scmdrv->remove ? scmdrv->remove(scmdev) : -ENODEV;
+=09if (scmdrv->remove)
+=09=09scmdrv->remove(scmdev);
 }
=20
 static int scmdev_uevent(struct device *dev, struct kobj_uevent_env *env)
diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index d2560186d771..8a0d37c0e2a5 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -884,7 +884,7 @@ static int ap_device_probe(struct device *dev)
 =09return rc;
 }
=20
-static int ap_device_remove(struct device *dev)
+static void ap_device_remove(struct device *dev)
 {
 =09struct ap_device *ap_dev =3D to_ap_dev(dev);
 =09struct ap_driver *ap_drv =3D ap_dev->drv;
@@ -909,8 +909,6 @@ static int ap_device_remove(struct device *dev)
 =09ap_dev->drv =3D NULL;
=20
 =09put_device(dev);
-
-=09return 0;
 }
=20
 struct ap_queue *ap_get_qdev(ap_qid_t qid)

