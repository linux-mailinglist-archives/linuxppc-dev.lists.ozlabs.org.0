Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4C33F85
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:07:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J30R58YNzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 17:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe0e::60b;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="S4x3JH7O"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J2z82MDVzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 17:06:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bTf0X6dx6lURlProVrMnE4lDDovDMdjPISoiIyLfGE=;
 b=S4x3JH7OvePCIL9waWFJIkZaoHLDIRCnuxu2mYujfnpF1jNQS+/khmojSXMY7L7Zx2KWFrrzByC9yTuEdoi7Z814UZCsUt0wRsX7ZWxEaHnAG8+MANOkKDK5AjH7aSEtxh0tKTZaP2ygnS7SNRNYkJrB4QnRHVgzx9YXXzgFqtI=
Received: from AM5PR0402MB2865.eurprd04.prod.outlook.com (10.175.44.16) by
 AM5PR0402MB2689.eurprd04.prod.outlook.com (10.175.46.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 07:06:34 +0000
Received: from AM5PR0402MB2865.eurprd04.prod.outlook.com
 ([fe80::a1bf:17d:a52:3824]) by AM5PR0402MB2865.eurprd04.prod.outlook.com
 ([fe80::a1bf:17d:a52:3824%4]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 07:06:34 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Leo Li <leoyang.li@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek
 <pavel@ucw.cz>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Len Brown <len.brown@intel.com>
Subject: RE: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Topic: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Index: AQHVDvGJHigpnFjbr0+iCnHCepvpt6aLJ1JQ
Date: Tue, 4 Jun 2019 07:06:34 +0000
Message-ID: <AM5PR0402MB286535CF9B49BCF651C2322BF1150@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190520095238.29210-1-ran.wang_1@nxp.com>
In-Reply-To: <20190520095238.29210-1-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71305ebc-2a8b-430b-1e05-08d6e8bb2e0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0402MB2689; 
x-ms-traffictypediagnostic: AM5PR0402MB2689:
x-microsoft-antispam-prvs: <AM5PR0402MB2689BA5A54623C8896D88015F1150@AM5PR0402MB2689.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(396003)(39860400002)(136003)(199004)(189003)(81156014)(81166006)(33656002)(25786009)(52536014)(5660300002)(71190400001)(8936002)(71200400001)(6246003)(6506007)(66476007)(316002)(5024004)(8676002)(66066001)(305945005)(76116006)(14444005)(66446008)(64756008)(66556008)(86362001)(66946007)(256004)(7736002)(73956011)(4326008)(54906003)(7416002)(74316002)(476003)(6436002)(6116002)(486006)(53936002)(99286004)(3846002)(102836004)(76176011)(14454004)(7696005)(53546011)(11346002)(229853002)(446003)(26005)(186003)(68736007)(478600001)(110136005)(2906002)(9686003)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2689;
 H:AM5PR0402MB2865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d0SGIP6BPEpfND4Zg/03Z2N33glU1BQrILfsfnp4S9vq2jAmgkCeX6Lex618bGkhvlNFgxvsXnxCkyLmvyTa4Cv0fm8qpRd1ZGl/PG9+6dDOWFox5YZsFulRuX625FZfgmLxN0V5X9y+L5uHVQ/u4u0rHfTtCPCdzX8C6s/4WcE6XAZKh7j/qEzU/G404c0HpHrCIKWxX3uVB6whUISgvTeDM4z+C2iewsKjObuUttdcPhVoSoahW0PnuITObMSwdn3a8FDNofPmM6aNBwDVnvb98FVgzqXafwr9fMeKt84eM1EzGbKrz9lrMAAziydmEpYTc6B1rsbJcfy4hP2gCoMdxx1AwGwSi5Hw0STjmPjTwX0JnwNtNTLOwOVZWF1cJLT3VwVKo8fzZXIlXGyMQ59ltTcUrMYrfMqBHZsU9GU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71305ebc-2a8b-430b-1e05-08d6e8bb2e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 07:06:34.7543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ran.wang_1@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2689
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sirs,
    Could anyone please comment this patch set or tell me if I have missed
maintainer in mail list? I'd like to let review process move forward.
    Thank you.

Regards,=20
Ran

On Monday, May 20, 2019 17:53 Ran Wang wrote:
>=20
> Some user might want to go through all registered wakeup sources and doin=
g
> things accordingly. For example, SoC PM driver might need to do HW
> programming to prevent powering down specific IP which wakeup source
> depending on. And is user's responsibility to identify if this wakeup sou=
rce he is
> interested in.
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v4:
> 	- None.
>=20
> Change in v3:
> 	- Adjust indentation of *attached_dev;.
>=20
> Change in v2:
> 	- None.
>=20
>  drivers/base/power/wakeup.c |   18 ++++++++++++++++++
>  include/linux/pm_wakeup.h   |    3 +++
>  2 files changed, 21 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c in=
dex
> 5b2b6a0..6904485 100644
> --- a/drivers/base/power/wakeup.c
> +++ b/drivers/base/power/wakeup.c
> @@ -14,6 +14,7 @@
>  #include <linux/suspend.h>
>  #include <linux/seq_file.h>
>  #include <linux/debugfs.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_wakeirq.h>
>  #include <trace/events/power.h>
>=20
> @@ -226,6 +227,22 @@ void wakeup_source_unregister(struct wakeup_source
> *ws)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
> +/**
> + * wakeup_source_get_next - Get next wakeup source from the list
> + * @ws: Previous wakeup source object, null means caller want first one.
> + */
> +struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws)
> +{
> +	struct list_head *ws_head =3D &wakeup_sources;
> +
> +	if (ws)
> +		return list_next_or_null_rcu(ws_head, &ws->entry,
> +				struct wakeup_source, entry);
> +	else
> +		return list_entry_rcu(ws_head->next,
> +				struct wakeup_source, entry);
> +}
> +EXPORT_SYMBOL_GPL(wakeup_source_get_next);
>=20
>  /**
>   * device_wakeup_attach - Attach a wakeup source object to a device obje=
ct.
> @@ -242,6 +259,7 @@ static int device_wakeup_attach(struct device *dev,
> struct wakeup_source *ws)
>  		return -EEXIST;
>  	}
>  	dev->power.wakeup =3D ws;
> +	ws->attached_dev =3D dev;
>  	if (dev->power.wakeirq)
>  		device_wakeup_attach_irq(dev, dev->power.wakeirq);
>  	spin_unlock_irq(&dev->power.lock);
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h index
> 0ff134d..913b2fb 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -50,6 +50,7 @@
>   * @wakeup_count: Number of times the wakeup source might abort suspend.
>   * @active: Status of the wakeup source.
>   * @has_timeout: The wakeup source has been activated with a timeout.
> + * @attached_dev: The device it attached to
>   */
>  struct wakeup_source {
>  	const char 		*name;
> @@ -70,6 +71,7 @@ struct wakeup_source {
>  	unsigned long		wakeup_count;
>  	bool			active:1;
>  	bool			autosleep_enabled:1;
> +	struct device		*attached_dev;
>  };
>=20
>  #ifdef CONFIG_PM_SLEEP
> @@ -101,6 +103,7 @@ static inline void device_set_wakeup_path(struct devi=
ce
> *dev)  extern void wakeup_source_remove(struct wakeup_source *ws);  exter=
n
> struct wakeup_source *wakeup_source_register(const char *name);  extern
> void wakeup_source_unregister(struct wakeup_source *ws);
> +extern struct wakeup_source *wakeup_source_get_next(struct
> +wakeup_source *ws);
>  extern int device_wakeup_enable(struct device *dev);  extern int
> device_wakeup_disable(struct device *dev);  extern void
> device_set_wakeup_capable(struct device *dev, bool capable);
> --
> 1.7.1

