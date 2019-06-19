Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE04B50C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 11:38:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TKd95KyPzDqld
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 19:38:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.77; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="lmOjRpt3"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20077.outbound.protection.outlook.com [40.107.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TKbB6WbRzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 19:36:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNBuzmlPjAt3HItsdXiyAdHm2GJkn6nVc80tD9V0/2k=;
 b=lmOjRpt3USmutmzpKo8euFc1pFK9psF04rMm9EB1W3vjDdCvOgkAviqf6sdkwj8So4tvnigByiMCU7rezu5YDQLoytFYHiEdZCf00TC1HF8z4Wom4P+lJ5Qt5oxiksa5qCNj8+RL/PB16RiG9m8rkQEqCl5oe0XzC0YNYsq6uLY=
Received: from VE1PR04MB6655.eurprd04.prod.outlook.com (20.179.235.94) by
 VE1PR04MB6672.eurprd04.prod.outlook.com (20.179.235.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 09:36:27 +0000
Received: from VE1PR04MB6655.eurprd04.prod.outlook.com
 ([fe80::e127:7fe9:ab91:c552]) by VE1PR04MB6655.eurprd04.prod.outlook.com
 ([fe80::e127:7fe9:ab91:c552%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 09:36:28 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: RE: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Topic: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Index: AQHVDvGJHigpnFjbr0+iCnHCepvpt6aiMPUAgACuisA=
Date: Wed, 19 Jun 2019 09:36:27 +0000
Message-ID: <VE1PR04MB66556830530B0B3488FE5DA6F1E50@VE1PR04MB6655.eurprd04.prod.outlook.com>
References: <20190520095238.29210-1-ran.wang_1@nxp.com>
 <3448272.3g8bHhgBA9@kreacher>
In-Reply-To: <3448272.3g8bHhgBA9@kreacher>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0030911f-d6cc-45df-6f5e-08d6f4999a96
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6672; 
x-ms-traffictypediagnostic: VE1PR04MB6672:
x-microsoft-antispam-prvs: <VE1PR04MB6672A5435CE84ADB07FCE56AF1E50@VE1PR04MB6672.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(366004)(136003)(396003)(376002)(189003)(199004)(54534003)(66446008)(8936002)(81166006)(25786009)(66066001)(186003)(66946007)(76116006)(73956011)(7696005)(64756008)(68736007)(52536014)(86362001)(5024004)(99286004)(5660300002)(316002)(53936002)(71190400001)(6246003)(71200400001)(33656002)(6116002)(14444005)(7416002)(74316002)(66476007)(6506007)(8676002)(3846002)(76176011)(305945005)(53546011)(256004)(26005)(66556008)(6436002)(54906003)(11346002)(7736002)(446003)(478600001)(2906002)(6916009)(4326008)(81156014)(476003)(486006)(102836004)(55016002)(14454004)(229853002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6672;
 H:VE1PR04MB6655.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XkbMvpKlQdyfWKTUWvaKj6q/wP8eKl98WasGmzd0Ahx7PlFD2yN0a+uYpbaeqQexZI25Tu0B6uM7PbbWI7O4okoIDRAYKtH9R23fhu2w9hLu/YOzrljlvejBJKSMaXmNRRp6Dgn3KzuqADxuEVSxARCih0p8whdhMEmz0CKG2IBEu7THcTAzkZM+sSvPUGhyJGVXAkrN65BKwxGUA8YTqC0jxkQTDWUAA+pOtfQEl9IPBD8NmxpA3HR/cEfRzZtcu09WHWrP0Kn4FV4fj2uRiipmVrKtylMF5xhkMvaAqk8hSnuqPEtQgIVdrIUe2p1tHjjm46ksI/AwGOI3MM13ucHcelQ/lIs4ePdmxmtUUDbmGyOR4RiP3JZvbW6g1JsnFJgWcsAjbktPjSvE2aPAhD/wj2F4BdV0+b2kZa5VDVI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0030911f-d6cc-45df-6f5e-08d6f4999a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 09:36:27.9018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ran.wang_1@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672
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
Cc: Mark Rutland <mark.rutland@arm.com>, Len Brown <len.brown@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rafael,

On Wednesday, June 19, 2019 06:45, Rafael J. Wysocki wrote:
>=20
> On Monday, May 20, 2019 11:52:36 AM CEST Ran Wang wrote:
> > Some user might want to go through all registered wakeup sources and
> > doing things accordingly. For example, SoC PM driver might need to do
> > HW programming to prevent powering down specific IP which wakeup
> > source depending on. And is user's responsibility to identify if this
> > wakeup source he is interested in.
>=20
> I guess the idea here is that you need to walk wakeup devices and you not=
iced
> that there was a wakeup source object for each of them and those wakeup
> source objects were on a list, so you could walk wakeup devices by walkin=
g the
> list of wakeup source objects.
>=20
> That is fair enough, but the changelog above doesn't even talk about that=
.

How about this:
"Providing a API for helping walk through all registered wakeup devices on =
the list.
It will be useful for SoC PMU driver to know which device will work as a wa=
keup
source then do specific HW programming for them."

> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Change in v4:
> > 	- None.
> >
> > Change in v3:
> > 	- Adjust indentation of *attached_dev;.
> >
> > Change in v2:
> > 	- None.
> >
> >  drivers/base/power/wakeup.c |   18 ++++++++++++++++++
> >  include/linux/pm_wakeup.h   |    3 +++
> >  2 files changed, 21 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index 5b2b6a0..6904485 100644
> > --- a/drivers/base/power/wakeup.c
> > +++ b/drivers/base/power/wakeup.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/debugfs.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_wakeirq.h>
> >  #include <trace/events/power.h>
> >
> > @@ -226,6 +227,22 @@ void wakeup_source_unregister(struct
> wakeup_source *ws)
> >  	}
> >  }
> >  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
> > +/**
> > + * wakeup_source_get_next - Get next wakeup source from the list
> > + * @ws: Previous wakeup source object, null means caller want first on=
e.
> > + */
> > +struct wakeup_source *wakeup_source_get_next(struct wakeup_source
> > +*ws) {
> > +	struct list_head *ws_head =3D &wakeup_sources;
> > +
> > +	if (ws)
> > +		return list_next_or_null_rcu(ws_head, &ws->entry,
> > +				struct wakeup_source, entry);
> > +	else
> > +		return list_entry_rcu(ws_head->next,
> > +				struct wakeup_source, entry);
> > +}
> > +EXPORT_SYMBOL_GPL(wakeup_source_get_next);
>=20
> This needs to be arranged along the lines of
> wakeup_sources_stats_seq_start/next/stop()
> because of the SRCU protection of the list.

Got it, how about this:
 230 /**                                                                   =
          =20
 231  * wakeup_source_get_next - Get next wakeup source from the list      =
          =20
 232  * @ws: Previous wakeup source object, null means caller want first on=
e.        =20
 233  */                                                                   =
          =20
 234 struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws)=
          =20
 235 {                                                                     =
          =20
 236         struct list_head *ws_head =3D &wakeup_sources;                =
            =20
 237         struct wakeup_source *next_ws =3D NULL;                       =
            =20
 238         int idx;                                                      =
          =20
 239                                                                       =
          =20
 240         idx =3D srcu_read_lock(&wakeup_srcu);                         =
            =20
 241         if (ws)                                                       =
                                                        =20
 242                 next_ws =3D list_next_or_null_rcu(ws_head, &ws->entry,=
            =20
 243                                 struct wakeup_source, entry);         =
          =20
 244         else                                                          =
          =20
 245                 next_ws =3D list_entry_rcu(ws_head->next,             =
            =20
 246                                 struct wakeup_source, entry);         =
          =20
 247         srcu_read_unlock(&wakeup_srcu, idx);                          =
          =20
 248                                                                       =
          =20
 249         return next_ws;                                               =
          =20
 250 }                                                                     =
          =20
 251 EXPORT_SYMBOL_GPL(wakeup_source_get_next);  =20

> >
> >  /**
> >   * device_wakeup_attach - Attach a wakeup source object to a device ob=
ject.
> > @@ -242,6 +259,7 @@ static int device_wakeup_attach(struct device *dev,
> struct wakeup_source *ws)
> >  		return -EEXIST;
> >  	}
> >  	dev->power.wakeup =3D ws;
> > +	ws->attached_dev =3D dev;
> >  	if (dev->power.wakeirq)
> >  		device_wakeup_attach_irq(dev, dev->power.wakeirq);
> >  	spin_unlock_irq(&dev->power.lock);
> > diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> > index 0ff134d..913b2fb 100644
> > --- a/include/linux/pm_wakeup.h
> > +++ b/include/linux/pm_wakeup.h
> > @@ -50,6 +50,7 @@
> >   * @wakeup_count: Number of times the wakeup source might abort suspen=
d.
> >   * @active: Status of the wakeup source.
> >   * @has_timeout: The wakeup source has been activated with a timeout.
> > + * @attached_dev: The device it attached to
> >   */
> >  struct wakeup_source {
> >  	const char 		*name;
> > @@ -70,6 +71,7 @@ struct wakeup_source {
> >  	unsigned long		wakeup_count;
> >  	bool			active:1;
> >  	bool			autosleep_enabled:1;
> > +	struct device		*attached_dev;
>=20
> Please (a) call it just dev and (b) move it up (before wakeirq, say)

Got it, will update in next version.

Thanks & Regards,
Ran
>=20
> >  };
> >
> >  #ifdef CONFIG_PM_SLEEP
> > @@ -101,6 +103,7 @@ static inline void device_set_wakeup_path(struct
> > device *dev)  extern void wakeup_source_remove(struct wakeup_source
> > *ws);  extern struct wakeup_source *wakeup_source_register(const char
> > *name);  extern void wakeup_source_unregister(struct wakeup_source
> > *ws);
> > +extern struct wakeup_source *wakeup_source_get_next(struct
> > +wakeup_source *ws);
> >  extern int device_wakeup_enable(struct device *dev);  extern int
> > device_wakeup_disable(struct device *dev);  extern void
> > device_set_wakeup_capable(struct device *dev, bool capable);
> >
>=20
>=20
>=20

