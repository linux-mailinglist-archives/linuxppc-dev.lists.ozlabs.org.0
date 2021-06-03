Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A413996F8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 02:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwRmM2vplz2yxy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=eELywqN3;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=WGZp/4Fq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=68.232.143.124; helo=esa2.hgst.iphmx.com;
 envelope-from=prvs=781f10532=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=eELywqN3; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=WGZp/4Fq; 
 dkim-atps=neutral
X-Greylist: delayed 125 seconds by postgrey-1.36 at boromir;
 Thu, 03 Jun 2021 10:05:28 AEST
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwR48442wz2yXF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 10:05:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622678731; x=1654214731;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=o+yVEy7H2DT98ziF3VPykTWncyxjepBwGZs7YTcqT/c=;
 b=eELywqN3P6foX8/lxSyITsbpmwUMguP17TStRe0P/x3CDx7V9dgRxJqt
 FoNVDWovSYHQHx7dNwxWZ/w3+8uOEACxHdDYW/GxyKOsiY+1pNlBSpsf7
 oRqFP7TFJf8X4KkqGqgD9B1skz1cdMJY+BOxYL8VI5xlkUoIKJVWLfxIX
 sr9HwyiEucBsEyhNIeegb2KBT/Osw4MKd+jfkc4TqJ12Y8ypynfJgqISS
 nkAmKfGdZBAFev7EnVV9/HaZQab6HFrfbaXgXeq5nL+PCmRcdlzsH0WGy
 B9u9aQ6m3wYBGHDRR8VhA1ZsdZPp++PvIdkSiPLJCWwyuzPifEyYySOuN A==;
IronPort-SDR: LTb6lWTZrT6MpXhNb90CXDWwwbXdwgf7gnlp3B+5NpeFnl49QaTVO9d3+JGjekYbIqFJqNeky8
 juc4HJiGdxwkVx3B4wM1UHFgwF0LrHxxv7K53bcl6FoPHgidfYHEXOuQseFdIBq7sRXaG15g/x
 FFmf8sTaug1JzxVrcRlIVLwuuHqI/kB6FgX9fPyc/7N++MoFutfUXVVlY3W7g7WDVKoJQx2kVY
 t4qy2LB5jXTo5H1YFdL7hIAgUZUiEEaLdVwLeUV/thdwRmAxTRqyS7wH4MZ6tqVc1WqBmygTgV
 W0I=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; d="scan'208";a="274374650"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:03:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgDEBaXb7HbGmAbrhs9l/t6X5iZXwUbIc3vE9TT3omr41KxvJ8GfK33JFn12sOV3EAFFjssQjgYtFvAc7C8BTpwWbz3GiaP78ObZD/9UxqfeHy28jAFEAQDVl0rDy9tZ7m/BcnlSGR8WEpjPGUXUPdlYkyiXS9EL2wwplzsaKBhgKTQ+r2KaQLcPVyTgjKamYC3l6qfgb/Vhz8HxVF83PjQn5zrLufTyX8Fzkni4jgz1RmWhgTU6D4Z7twg4+4hKIUGXmOA6rP5hInxSi8kixHpC+bz9uXvbGKWgzVlfr3wb5trg+OPmmOg0vNeUgIuZ77RsWKSGly5vmtf6hW3iEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujYjzUTvNk5lRoWbqXrQWBuQwFbs/0kVBkPupo0kRlU=;
 b=mxiCzU3U4ch5wdnvTYx0X1rthFhvYc5UtEkmv1kX/cem7n72ZWYlrGGFUPEdeoJUJ2ALPMlDaeJ5WNx6OGrW8L9iQz8ZgI5nWDI7huqbuWAKivFyDPsGk39exKYdQf8NoXNa54jigO3Se/mww86UgLrN41FhVLiTvjVUmSPYPMpA9BfGw8I59L39q6X4Untvg5t/plJ+V1zeLeFZqof/5Q4Wv/c6bJjWFSg7Vk7pSIUhES2U6WkcNDK8d6ca7ChheAfwWwdDbKShPR8JexEEHk4RWZI0I7i3oBZRC11Vrx330RrUmo3Jc0q0gbs7flstnLNwrhfTXPc/iWr9cNi8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujYjzUTvNk5lRoWbqXrQWBuQwFbs/0kVBkPupo0kRlU=;
 b=WGZp/4FqdH6GKPOZNdLEvwYnG2t7pCklbI8rSzqu2aW+Du+B88rLNixQwKCogAX9CMHTpsIzzcBBpaikU9Aeea3dPIQWepJdvs61P8TYtTmnYpAFCdu/hvZaMpHXRtQHOfN1Y7MDupHHat4SJbRtY8DC5DMUQcF5qCTLBOfSfLs=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB4327.namprd04.prod.outlook.com (2603:10b6:a02:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 00:03:11 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:03:11 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 03/30] blk-mq: add the blk_mq_alloc_disk APIs
Thread-Topic: [PATCH 03/30] blk-mq: add the blk_mq_alloc_disk APIs
Thread-Index: AQHXV3wpg+GpGHxRB0OZy0BgL2WPKw==
Date: Thu, 3 Jun 2021 00:03:11 +0000
Message-ID: <BYAPR04MB49653D1B88ADA8EDEAA88F82863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a35b10a6-7fc6-40a1-0ea7-08d92622f9fc
x-ms-traffictypediagnostic: BYAPR04MB4327:
x-microsoft-antispam-prvs: <BYAPR04MB43277DCC98ED185FAD050823863C9@BYAPR04MB4327.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUrktxVP+HJoyFo+Xhee5NaJZPcQWKKjnb74IsZAcSkgfCH6+h+NTgHgkMgXC+hwOuSG/i1IhPYyYKCsv77QSzV9Hhxn7pe0x68SgN+2AzX3rRjWTDe9DRIvSVanF8X2xHqtALAvdDy2ycNLQAQoEkxScFxhheG3qy2xYatcVn6IbXsDKKAIG5ch3PISks8XZ49m15svn5lR1L6k0UcaE0ycDI0tDr91fCMwL+cPaxDOeJN/vwOHF2ADWiJKkoY8c5CBW/PWmwsBeBB0VkYtMlLQQ1hmkLTPjrtDolAW6VfrTCTDF2yt4ozSc8pKBlk/zi/Rh8Duc7FPDk5ZnwFGOcWpoEY9n6EOaOUGel8w8s3sl6uLcHqUsE7U0x1awfu146GXHfAOXix9XA4Ve7vp3YoNmEOcFHKlnNutlWKIeC+QaMcQCbCeWWqsTdYr6gCst4hOWYrX5P6gHlnSOKMSL0IFN4Yhk4jyqWIJJQ5rCFeQsOY9CyxnpmXPC8mOPTbs5r38pDAUOey+TbzObDC/i5Tvq5iaasgO1B3U6i91LO49JWmhUV1c5QVDRHx9b7qQiQFSjbyDtMcJj4BWIjcfbnE8Chv2pWlZYEXBqq5W2tI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(33656002)(5660300002)(4326008)(4744005)(76116006)(71200400001)(478600001)(26005)(54906003)(110136005)(7696005)(86362001)(83380400001)(6506007)(53546011)(316002)(66446008)(66946007)(8676002)(7416002)(2906002)(8936002)(55016002)(38100700002)(9686003)(52536014)(186003)(66476007)(64756008)(122000001)(7406005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ynVliGDQxRvrJcMGRyYPK/j4RBDB/47O8t3S1ZBmmqi+OJl5cSFj36BpMo?=
 =?iso-8859-1?Q?duRdXwb92TxF9zCA2J+P5WyYYWJRZ7m7yKAAdRJ3hNHdIUhx62prWbAllO?=
 =?iso-8859-1?Q?5RzOYlHsmxLJg+MygW/Kw2A/GTRNKk77DPVvAMNbZV8oZOyETasQ16Od6c?=
 =?iso-8859-1?Q?4ZCVwGDu8x2CQ3QzJNsJLqvcxCM0cPdTuqouzX4I1Pio3tR5HNBGqfPCNR?=
 =?iso-8859-1?Q?Z+IgWO+M5NixkHMYNj0aKB1Dc/wY/3iHguuMp3vnUD+EAHjKVDTyCfVw8l?=
 =?iso-8859-1?Q?wrJw0rM7eSMFx+/cl0Bkb3op9EgyVU8L7sB2nBNpzGNCPPbsQijJxXnh2q?=
 =?iso-8859-1?Q?xCV6e9qqdx9fqomwbQ7OALpxqS5/3BHu+fm9/8AtX5rxpM5ppAz6YMr6x9?=
 =?iso-8859-1?Q?YVJwy2YhgSW9FovzjveHt+0+Mlerhknec+EHSa+YIc592uuH55NgadlSg6?=
 =?iso-8859-1?Q?xwMh7eU5Ye4bQO6LgA29iZQcfT5UWTnWwhmwGcN2RQ4QMSsZP3lOWoE2Lw?=
 =?iso-8859-1?Q?/oa0c0LbzbVy+oZJZrQXC214a+1pSfA3J/oukxkCCVZy+ZJjIE24lzGvyl?=
 =?iso-8859-1?Q?NKMLX+J7hK0iRFLrla9gI3Y9pdma9MEQuOZjUGslMsZCMLvkeokcK5UexK?=
 =?iso-8859-1?Q?vhSvLlBfi0dzJ2fVNY7C9WtwNxgkrP9y4aEikHYXl/ex0027ccidERsazY?=
 =?iso-8859-1?Q?XmMV+SNP8XyGnSLmFS2Uoo1HZWXGa2Rp53DCkghI0cqmLT3ALHSlq/pWhr?=
 =?iso-8859-1?Q?edbuRICh9T840Rmq44qk0cphIGz6/CNJ0h5MGwL9m21dInIDnfM65GjhOG?=
 =?iso-8859-1?Q?hRprIHCj84jMb+2kEGnQnfyOJbRqCXxwVniBHSTsP+rcSl2hfOxYUupLcZ?=
 =?iso-8859-1?Q?yiZ3S2b91z8+tiP2Tx+o9UIeLNQdZuQyfl4Ki58ul5h8b4mWJ83xDPA8Dg?=
 =?iso-8859-1?Q?jgRQ8ivpRJWPx87Q54ZWRmVBanO8sRxhLtaWy/VAO4bP/1IEe3p2kjK8cI?=
 =?iso-8859-1?Q?N7eFSdRP+VZQsvFktJr/tEQhuHJZqIEy4hUZlMhxFBtj5rlHIGECM7zVi3?=
 =?iso-8859-1?Q?oYmOUS/rKmsGB53BS/h4yKaiTBh1hr/33nwKz88puhi8PIoJBHQwjgdbUY?=
 =?iso-8859-1?Q?jW8L/RcihUjfKP25UQVcyfUMWzVkZ5Wn6pd8QTiS4VyzI+V2/yRo8RSb+S?=
 =?iso-8859-1?Q?XEjy3TiONhDX9jH4u8CaJ37mbvIQsX+cnTOK5EgtJgH/gNotsknqrTZOtG?=
 =?iso-8859-1?Q?6vMjFlI+n66XU3uCAnAj+od+U/vfHAsUXH+K15iPWW8g+f9xg5MbrhK37J?=
 =?iso-8859-1?Q?OCpDLLKwXs4bpDw1i/lgQtxo5+UN2h7coueAuN0AcEhHfMP7bayfzpAEpr?=
 =?iso-8859-1?Q?XUuyds4AE6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35b10a6-7fc6-40a1-0ea7-08d92622f9fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:03:11.2016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDjWAyq6BnuphswWhaa7UCiHTzD/aNrldhcDCrmF+sKsMkcPX6G37kEVI5ch879ou5meUtnrLy6SEuld6NLqkNrrCFzCbDYRgIMVPMUYv2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4327
X-Mailman-Approved-At: Thu, 03 Jun 2021 10:36:20 +1000
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
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "Md. Haris
 Iqbal" <haris.iqbal@ionos.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, Tim Waugh <tim@cyberelk.net>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Alex Dubov <oakad@yahoo.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Geoff Levand <geoff@infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/21 23:54, Christoph Hellwig wrote:=0A=
> Add a new API to allocate a gendisk including the request_queue for use=
=0A=
> with blk-mq based drivers.  This is to avoid boilerplate code in drivers.=
=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
This would be a nice API to get rid of the couple initialization=0A=
calls and respective error handling in each blk-mq based drivers.=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
