Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7760C91EAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 10:16:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BmwK602GzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 18:16:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.46; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="qRuPGvY8"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30046.outbound.protection.outlook.com [40.107.3.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BmtV73NYzDqmC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 18:14:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDK3OMKIBi+VOMZFkiPDQpEjOnm6c3FOck72WAUYuCELnXFoFrGrmcRH54ozY43QzfBgqZqcjppMlvNig1uc3/ONxMK2sc2D+8QhRmYTFrCyVT3cDB1bkLAY8rv+k7wY8Bz/zXxA7Sl2St6Jvwm3ZYvS0auFgXK88PBDc7iUFBYuwSMbI+zp9YP6zQ7gDaQCVRFE5MEiEVk6Xnw88GvxArHo1JB2sMP3dNfrlekHifWCnwwyOjpRbk/jmJsY4k3vCy+Hbp4YXMmUtS/UZ7UzsAQ7B+9LDPn2MKEfdJKu921t9a1PKCs8sAbXGyrkJlOL56pIvWzXPvGhH6bwnktsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R4sHq13+IaHO8Cmfot74gAVxrLkdYHIEVatTcdtYAA=;
 b=axtTiLU4ylr+ZCoPn8gJwXQm+RFmb2fxj21d/mesYb5wcWKK0dPiaAQLbfr7CirRqSXPQ6fS4HvwGDrj5nRkyidAX8CkuH5kN9dsmaqXkjj7HOb5Rho2dSEO4hAAII7uvV3PKCNG2IkM6EbJbVoc/jLU4guKxvV6aLBMIWuBeKR1oMbckfZx9M28Zb8H5b68jmgtkxzc/nXEXdNVQFhuC65NLA1evlvSiCR8v+0okwr/wgD3VLMHYe3k8f8yjUkbDRcsIYOGXiYXCvOQozSKxgMKiOdvcb7KwZpH6cgZieKqfjZa0CK39REosUa8YR8sB0tjyqXFbZWSpB78how2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R4sHq13+IaHO8Cmfot74gAVxrLkdYHIEVatTcdtYAA=;
 b=qRuPGvY8/aVkILijABFrzdxs3xezzvxedjs3gq491zcVoI4nWvTgL2/I8Kue1JlYYuYzxd6DpUDh5Vg/rJm5FyuYFR/H+WGyf2U3ON0UIsUR9gdRsFCEJthFesUH12QsXrdaiRgrsrhKC63PAaedJCeU9SbmUNPpyFCmod8o2hk=
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com (52.133.240.82) by
 DB8PR04MB6761.eurprd04.prod.outlook.com (20.179.251.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 08:14:32 +0000
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::ad63:e8df:f0c2:7246]) by DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::ad63:e8df:f0c2:7246%2]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 08:14:32 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: RE: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Topic: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Index: AQHVQfPC8fuUrwx+d0SKWP625Z9OpabsZPGAgBWwP7A=
Date: Mon, 19 Aug 2019 08:14:32 +0000
Message-ID: <DB8PR04MB682632A586827032F8D6EA2DF1A80@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190724074722.12270-1-ran.wang_1@nxp.com>
 <4158639.B12JYek7R7@kreacher>
In-Reply-To: <4158639.B12JYek7R7@kreacher>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7024ef78-f04a-4d7a-b29b-08d7247d4416
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB6761; 
x-ms-traffictypediagnostic: DB8PR04MB6761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB676179B6D34FED0D2FFAC9EEF1A80@DB8PR04MB6761.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(189003)(51914003)(199004)(478600001)(229853002)(6916009)(8936002)(6116002)(8676002)(81166006)(81156014)(3846002)(66446008)(64756008)(76116006)(66946007)(9686003)(6436002)(55016002)(66476007)(66556008)(7736002)(305945005)(7416002)(74316002)(26005)(53546011)(6506007)(53936002)(186003)(102836004)(2906002)(476003)(11346002)(486006)(446003)(5660300002)(66066001)(6246003)(14454004)(5024004)(7696005)(256004)(71200400001)(14444005)(71190400001)(52536014)(99286004)(316002)(54906003)(76176011)(25786009)(33656002)(86362001)(4326008)(473944003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6761;
 H:DB8PR04MB6826.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ClAH81fPqPTIE38CHMUl7jsd5XpSd2OmrOHQ0Ol/Pkp2Vi2doqzx/YPLiunYNfLQb5b2tmc4Omz9qKP5p1PneDVHak3mosR/4WIzt6VSq3ffYcukwKNHcAVVseLZLgpZlZKI5KJ4lkkuZOp9X+quLJZJdSBlqw17A6cVWnbi1wi5RVz9QKoRqIwl25mpWTe/n30h9U0z2ed/DKxM9R8l1BJG5Qi5gkWeOb6XIMh2RgeiSR6ZhO/ZC0FYKX2ko2TDXYLjmk1gtg7STDoSbgCfeOHSj70EII73YsinEeAnk/hE8WJP7Mkfr+Cx/AbNdgl3Tj64bmeRDjhTQqyLNUK8s2bW5+D/f82T1alWb3DJqF4VR4URCt8A+WZw2e+LMXEuZQjloKsTwdpWatSYBu3w7fvOQpqZP8GSUOqgS6OnNHE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7024ef78-f04a-4d7a-b29b-08d7247d4416
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 08:14:32.6873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yx15X8XyY62S0HxtKc7BKR/zlRhf10FWXwHYcgqR7P9kjh8/oBFHkeYn6p2uXHo83ANLf85h/5YHE8Ze61eSBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6761
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
Cc: Mark Rutland <mark.rutland@arm.com>, Biwen Li <biwen.li@nxp.com>,
 Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rafael,

On Monday, August 05, 2019 17:59, Rafael J. Wysocki wrote:
>=20
> On Wednesday, July 24, 2019 9:47:20 AM CEST Ran Wang wrote:
> > Some user might want to go through all registered wakeup sources and
> > doing things accordingly. For example, SoC PM driver might need to do
> > HW programming to prevent powering down specific IP which wakeup
> > source depending on. So add this API to help walk through all
> > registered wakeup source objects on that list and return them one by on=
e.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Change in v5:
> > 	- Update commit message, add decription of walk through all wakeup
> > 	source objects.
> > 	- Add SCU protection in function wakeup_source_get_next().
> > 	- Rename wakeup_source member 'attached_dev' to 'dev' and move it
> up
> > 	(before wakeirq).
> >
> > Change in v4:
> > 	- None.
> >
> > Change in v3:
> > 	- Adjust indentation of *attached_dev;.
> >
> > Change in v2:
> > 	- None.
> >
> >  drivers/base/power/wakeup.c | 24 ++++++++++++++++++++++++
> >  include/linux/pm_wakeup.h   |  3 +++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index ee31d4f..2fba891 100644
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
> > @@ -226,6 +227,28 @@ void wakeup_source_unregister(struct
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
> > +	struct wakeup_source *next_ws =3D NULL;
> > +	int idx;
> > +
> > +	idx =3D srcu_read_lock(&wakeup_srcu);
> > +	if (ws)
> > +		next_ws =3D list_next_or_null_rcu(ws_head, &ws->entry,
> > +				struct wakeup_source, entry);
> > +	else
> > +		next_ws =3D list_entry_rcu(ws_head->next,
> > +				struct wakeup_source, entry);
> > +	srcu_read_unlock(&wakeup_srcu, idx);
> > +
>=20
> This is incorrect.
>=20
> The SRCU cannot be unlocked until the caller of this is done with the obj=
ect
> returned by it, or that object can be freed while it is still being acces=
sed.

Thanks for the comment. Looks like I was not fully understanding your point=
 on
v4 discussion. So I will implement 3 APIs by referring wakeup_sources_stats=
_seq_start/next/stop()
=20
> Besides, this patch conflicts with some general wakeup sources changes in=
 the
> works, so it needs to be deferred and rebased on top of those changes.

Could you please tell me which is the right code base I should developing o=
n?
I just tried applying v5 patch on latest git://git.kernel.org/pub/scm/linux=
/kernel/git/gregkh/usb.git branch master (d1abaeb Linux 5.3-rc5)
and no conflict encountered.

Thanks & Regards,
Ran


