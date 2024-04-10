Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7989EB96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 09:14:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=s8jIsKhG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDvGR2MCkz3vZ7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:14:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=s8jIsKhG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::719; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=kshitiz.varshney@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0719.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDvFj0HKxz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 17:13:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhKpuJWzFCA8p5Rb0sGztgVuKT7AmaZD8pnxWloupCydb6uuw14flbI+ErLNhkZvbWejuuI+qW7+2UCgojv09h4381FYg0+x7ZJfbnp6Kf0ZHHug/Qi3YHdxUOX0+qQSHA1OHa8lkNB0JjzFgK7vGjVNra+UOGfIFeC5OOnJ31debNFzfU9bOWVJbO/jAXWsTL594ku5w3yaU/UYJnfssSeqIwnxZJ4sOlVEmjaq235zOMp5EPbU9wEFl+pI2dVdxSG2Rbg7jqeNgYqUWaIr/nANfq+LC+6qTncE1BNQEwUwVKSS0+bnX6U22IdE7n5XLyJskM/b9Zffjg192QobOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0GUWvumF9rjwWrKqw/e8JLGYRsxOcui6V4VWl1FhFk=;
 b=FC54zzvickH/ak7EgUrmLSIqel9E1lN5qsRfLJWGz2mqEYiDC/CXs+uuK3WDd6aBlx5R/S/kxogNU+LyUC66q67zZpCKYlSYPBdk7MXQ1x0dIAufqN4CnGUeSl7Id4HIELV4fDF6t5cIjiyy+aM8v4HBUrLHStE9jZKQg6K1vt0AJ/TR932WdjmAY8s+N4fs0mutCoeFaY2H22rT6EMhyxZJNx25bbTTVpdy9N6OB0Y/HKWYeI23By+MnWu1q5fqDj65ax2DIkQv0uGw3v4+oYLZv+ooRjWCeooIpLoiq68Rm3Wa0kPw+NUDOrZn16F4m8mEA75CXgPIlKUCeTgL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0GUWvumF9rjwWrKqw/e8JLGYRsxOcui6V4VWl1FhFk=;
 b=s8jIsKhGq94IO/KAtbA8fRm1daQVKUmbbFry7OSbr/BPRjCHQW/zd8mnvjYceprFe01EBXmOnnACF0/4RjakfkYb0tX990/puX6YtTsSiQIQuB/cFfNxsNUJ4G5WAWvKerITfcfb+E5qlCwnNlImmzVBQYX/g0xnMtqtHg/DWLM=
Received: from DB6PR04MB3190.eurprd04.prod.outlook.com (2603:10a6:6:5::31) by
 DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 10 Apr 2024 07:13:35 +0000
Received: from DB6PR04MB3190.eurprd04.prod.outlook.com
 ([fe80::606c:e5e9:4a25:4518]) by DB6PR04MB3190.eurprd04.prod.outlook.com
 ([fe80::606c:e5e9:4a25:4518%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 07:13:35 +0000
From: Kshitiz Varshney <kshitiz.varshney@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, David Gstir <david@sigma-star.at>,
	Mimi Zohar <zohar@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: RE: [EXT] [PATCH v8 3/6] KEYS: trusted: Introduce NXP DCP-backed
 trusted keys
Thread-Topic: [EXT] [PATCH v8 3/6] KEYS: trusted: Introduce NXP DCP-backed
 trusted keys
Thread-Index: AQHahZe8FOET2O8opkK/K3DU/sDkl7Ffx2mggABz3gCAAOZwQA==
Date: Wed, 10 Apr 2024 07:13:35 +0000
Message-ID:  <DB6PR04MB3190EB5F5C037A742138BE118F062@DB6PR04MB3190.eurprd04.prod.outlook.com>
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-4-david@sigma-star.at>
 <DB6PR04MB31904A8EB8B481A530C90CBB8F072@DB6PR04MB3190.eurprd04.prod.outlook.com>
 <4c6164e5-bcfd-4172-a76e-db989f729a8a@pengutronix.de>
In-Reply-To: <4c6164e5-bcfd-4172-a76e-db989f729a8a@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR04MB3190:EE_|DB9PR04MB9646:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o0oqXE1xUcrOdn72mV7O3RitovQQhjVZ/5UyhmC10YCNkmP6/Dnu8/+Qqn1560eE2tkn/KYFve/xCVw9Ca5jAGfu7tRyQtatz4GXrvWgpLXckHjP75+CwHFbWPNzlH2W1WVzULadSp199uiWPQ1xx9BBp8bFE4vDLU7sWMrAQKMvC+m9gbmrO7JABDun4iXbNKmf6NuUzY5RzV/sbfRHxJBH1GaYedFpGLs3dOYpqVST66OIZaJHyhpquQ7vfNysjBMB+LGkL2h7aFGigE3gG1hz+Hh2ovjSKEFLi8XOBPtX+mF31a/Q9qTAzZMaHWbHzA7jPgiVHqqhLtoBFPC6I1OLA9jpyNOeWLUpWORsGSHy9AFKN8OfHI41suXbawIvpJB+WEhL05s4C3sdLPSCEzc5DFl4LardAIzcV+bzXGTa1R1xZdUqzNe/531vfX2DuMM1zeVcboHtcD8GFoAY2g+RMOx3Ait7MpqlV2fEwYPBIlyJycwYKZ/Dv7WROljAne6XbblYxsQKIxI/Qs1LTOBSHJ/QVgKXWfE4qJu9DMzIqsLNpAVPBBPd6aL5Ymb6UKdWfoTvdRdMqg797I8pNOlOqT/azpRD1l6I8XNYZRdnJ+naFNI69Osu0GT0O1SiRETygS1ldIbTQpirtydrcgDky9L+bqx2WC+M7jUTflg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?muIPqNC5X7Ln/sFhtDkvIXTQyzTCjA3W3Tszq/1TyYATGKbhPYIA/A7wZHYD?=
 =?us-ascii?Q?4SWN9pcrrQORGVZAZtq/nqFUpOoDDz7IVLUvZV4+P1sqBh/NFYuLrD5OfzsY?=
 =?us-ascii?Q?fV6A7bZx2QOhxu35yhzB/ewB3piD8/HheK86xBtUMyO8XF7fneZGIqj916W7?=
 =?us-ascii?Q?eG3WfCzHA/wlg90c/iu4Zb9C6R4qdl0sCxsc1jdHebYemB7h2PnLCln/s9M/?=
 =?us-ascii?Q?Hvo5q6ddaXBE6MJxEwQi7jG0dM9kUwXpn2Rzs+XDkoZ7WVArzTFB5dYfGT3R?=
 =?us-ascii?Q?K32VazUjzLl9Fvvn0xpCxWQpFWqFl8LWYlx81r5B8DutEZUbzY1tfUoHeBhy?=
 =?us-ascii?Q?m04pNQuwBvaUHaQ4cl31RXIHYdBj40DMbPx4HmyrRpWqXIz6OLzUapI+7bit?=
 =?us-ascii?Q?QjHP/4ipLtqBAaxyDT2TnnA4vMi7q8mBJaIov+8IZH+NgmBdLoLdfj1q6Oe/?=
 =?us-ascii?Q?/U/XD4I7NpI3S5LaHxK3+9Jd+C6a6L+5M0cnZ0Gc8jttI2KLKZ1oW0CoOe0Q?=
 =?us-ascii?Q?7Qpn9k+esU4yromabRUQlLRSoMqbZftDBUjLv2zqsW1Q3RiA6xaaaq6RD0PQ?=
 =?us-ascii?Q?PWpGANZQtNVlYuSMdsHBaXaUvmfpY9M8oIKVvAgFlgYNTP/E9KB+uMxsAw9f?=
 =?us-ascii?Q?6w+jqVl5ncjJ7aqcHZTvanSAA1NL9s79WRlv2BSuYnrtkFopuhKNYetcCwGR?=
 =?us-ascii?Q?tPPpsImM95PcFfrgpWObqHZa4HtRymwYF2VQNlaexf8HynjMhFLfnl9vTKp4?=
 =?us-ascii?Q?KnJH6KB7hDTXgMoeIqpmdTlo4zzh96guEFlqe6Xq+HzHCNcyXC86adp7YV1G?=
 =?us-ascii?Q?7KxlzoYQ6SlA9cZ2wPM+13WKJJ9CIzqRna7oCW4KLz5mlawyQE/NvIz3sflX?=
 =?us-ascii?Q?7Zy3igc8xBe00MQBA7tbEjBd8lGvquxbBX2aBkaoJXLj6n0rfTFUP+xT8A3u?=
 =?us-ascii?Q?bv/VOhpv7MJdK9nsn+1q4GaeVF52hV38y4WV+21Dj9t4tt0YWgpHi9ilDW5r?=
 =?us-ascii?Q?+NB/kaZMSz9W0oglnK26Icw6C0JkDoSMF1wa3YejhbHuxnI8I/plTCHJRCHq?=
 =?us-ascii?Q?Nqb/GTE3KxbacokRnO1fOAOUX7zHnsnu/fJ/MiwPO/Jj4ECQoTrq7UGfbdYY?=
 =?us-ascii?Q?VJE3oB+xZeWqyasI5kUEG53rso/QZeFbDzmEZ8naSRC+4okKPnMg2gvF/09y?=
 =?us-ascii?Q?2KGP3RMjOv2xpZE/qt6R3gUI/Tx5ay+NRnb0PRofqP4M7uSPZMp5NoouprRB?=
 =?us-ascii?Q?f84An5UwNr3Al+6a9OmL/0QegwqTRZ9nPflU7IqoUs2az983UjX+jPHjXBBT?=
 =?us-ascii?Q?j3RnG/Sw5bb4al7BP/iXkJbITq54rX2IOop7QUf2AHuVuJB3LO0dFvmA+A7q?=
 =?us-ascii?Q?8PPieI+faqGvORrUW1ybNlFPuU/9ViitWdJkHCohN1vleZ2TC5lPkS5kG+ox?=
 =?us-ascii?Q?GYiNQt4IF3zZDiBUNwUFcFWpg3nRrB4bErbMGIQGYxdYxMDxLTbRTwPjxxAH?=
 =?us-ascii?Q?eQOEZ63n8RcX1IjZD18cisV2ALubvO8q4dqiv7s7wfDRFSGnnwE9I0QpOReD?=
 =?us-ascii?Q?0qBUQQUU2OqXMfXWIM5cSIM39FDiR6LwU7v5yWMN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f001e8-433e-4f4d-4297-08dc592dbcd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 07:13:35.5985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRVGsMSTeM8gaY7bSYbL3M7XLWz1i7wi2XVJ48YZ4b2aL/u7Z5a9yio2n2fB4t2+HM9PmtpLwLDX9Lfwi4EUo2qgB0ypbxM8NI68R0P2aVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gaurav Jain <gaurav.jain@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, dl-linux-imx <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pankaj Gupta <pankaj.gupta@nxp.com>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Varun Sethi <V.Sethi@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ahmad,

> -----Original Message-----
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Sent: Tuesday, April 9, 2024 10:58 PM
> To: Kshitiz Varshney <kshitiz.varshney@nxp.com>; David Gstir
> <david@sigma-star.at>; Mimi Zohar <zohar@linux.ibm.com>; James
> Bottomley <jejb@linux.ibm.com>; Jarkko Sakkinen <jarkko@kernel.org>;
> Herbert Xu <herbert@gondor.apana.org.au>; David S. Miller
> <davem@davemloft.net>
> Cc: linux-doc@vger.kernel.org; Gaurav Jain <gaurav.jain@nxp.com>; Catalin
> Marinas <catalin.marinas@arm.com>; David Howells
> <dhowells@redhat.com>; keyrings@vger.kernel.org; Fabio Estevam
> <festevam@gmail.com>; Paul Moore <paul@paul-moore.com>; Jonathan
> Corbet <corbet@lwn.net>; Richard Weinberger <richard@nod.at>; Rafael J.
> Wysocki <rafael.j.wysocki@intel.com>; James Morris <jmorris@namei.org>;
> dl-linux-imx <linux-imx@nxp.com>; Serge E. Hallyn <serge@hallyn.com>;
> Paul E. McKenney <paulmck@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pankaj Gupta <pankaj.gupta@nxp.com>; sigma
> star Kernel Team <upstream+dcp@sigma-star.at>; Steven Rostedt (Google)
> <rostedt@goodmis.org>; David Oberhollenzer <david.oberhollenzer@sigma-
> star.at>; linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs=
.org;
> Randy Dunlap <rdunlap@infradead.org>; linux-kernel@vger.kernel.org; Li
> Yang <leoyang.li@nxp.com>; linux-security-module@vger.kernel.org; linux-
> crypto@vger.kernel.org; Pengutronix Kernel Team <kernel@pengutronix.de>;
> Tejun Heo <tj@kernel.org>; linux-integrity@vger.kernel.org; Shawn Guo
> <shawnguo@kernel.org>; Varun Sethi <V.Sethi@nxp.com>
> Subject: Re: [EXT] [PATCH v8 3/6] KEYS: trusted: Introduce NXP DCP-backed
> trusted keys
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> Hello Kshitiz,
>=20
> On 09.04.24 12:54, Kshitiz Varshney wrote:
> > Hi David,
> >> +       b->fmt_version =3D DCP_BLOB_VERSION;
> >> +       get_random_bytes(b->nonce, AES_KEYSIZE_128);
> >> +       get_random_bytes(b->blob_key, AES_KEYSIZE_128);
> >
> > We can use HWRNG instead of using kernel RNG. Please refer
> > drivers/char/hw_random/imx-rngc.c
>=20
> imx-rngc can be enabled and used to seed the kernel entropy pool. Adding
> direct calls into imx-rngc here only introduces duplicated code at no ext=
ra
> benefit.
>=20
> Cheers,
> Ahmad
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.
> pengutronix.de%2F&data=3D05%7C02%7Ckshitiz.varshney%40nxp.com%7Ce9
> 97f259d34548ad1a9808dc58ba63a8%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638482804763047266%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C0%7C%7C%7C&sdata=3DUZgE9MXqAqCwqVnWty67YLh8QnIwpuq%2
> F7%2BQeDLQhF8I%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|

Understood.

Regards,
Kshitiz
