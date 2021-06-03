Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8023996FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 02:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwRpB3nNvz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:38:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=XKprPIuf;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=KgmidU1F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=216.71.153.144; helo=esa5.hgst.iphmx.com;
 envelope-from=prvs=781f10532=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=XKprPIuf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=KgmidU1F; 
 dkim-atps=neutral
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwR9p4pDCz2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 10:10:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622679022; x=1654215022;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=wST4v/KFEgsD+AHxp1B4bWyFrtO8jdP6tx0B6ojMsIk=;
 b=XKprPIufsMcyBIF7chvWYlksFADys4gQewecDGh9yGUDJtR3yMcy00W/
 SRQws7gVHzVoIFPS4DETuVe91AbIOId/TJGVhBybKQ/5u+oV6s3bv1DRu
 UgiMQxcK+sfevokdRsei1KWWKJe2ubC7QPDEzvyOSTcjQ5iqE5pE35pQW
 RjaYWKo6Zv2rLcuZnB/jPPfuaVBuqS5w3aBC5EHRJwH+eaNSu6Zu8qiL+
 0JpEX3ZeKesbYUxkxX8ZwUYkbiiax7JhnTfoKTpXO2+qTPhoLbzraiwQ3
 Jl+Vw1gTe3OBB8NVDeW6ntJEi2Fv+D/CvYlmPrXcz7siAbWA7P629NpCz A==;
IronPort-SDR: ZmknQuXoCnqDkfa8f/gIpbwcqsW3uxFIdkG6PulXIRgvre/V1WSuqDOxsKpr7HB12BBnz5bTJF
 dpg6fDUUhyjirRV+af+X4alFqYTr5oUWRrXWqVj5ekEdtvmwVj+iPCU5w8TuqpEHShe0SuLgiL
 quXXMMlt2JVZSIA7aAtVVNAi8tyYF+2kfYxk/N6iv7SP/zPHjRDhX0CIr4+aYsc1qKQWQ2lLfF
 1pwuG0X1Xj5/5yCDRAXWwP39oIHSazLjYk9RroQcS6fksS9XrRo0mCaN9h0b4MGo5ClYyMYoxw
 /BM=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; d="scan'208";a="170510803"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:10:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZLkwwoAD3gpyISBgdewagHua+umfTEXtt8fAoIQQxNtn3TUom7xGUlGVNuipekFI0LrGCtbcCOV6ybf7lgaQdxpzQZR7FVbCDUnIbEpwTImjwvqO023nPEx8LkjaRijDWaljEKaXFOI89FOGmhTA1ygVl97J+abx4sdYDQy420hpP9+vDjvGyTPwXanYpLR0hZXd9vvDvSATaLjkEu8cVVSuhNewa1/xZkA9X79wGbXzFcqw7097MX0VwzkbSAZekKsjiqEIxKXEcqBecIiFNnG3hTuRkfpOoLt8e2lK42q47i2H47OOOqTv3q0niqmFkO4WW5SeUHAE3ZC+SGdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWP3cG7e/e70cUAy0yiqwnLhD+NXwUwEN+x14H9+cw=;
 b=Y1+gV6oRpNBiL21Ns+WNrmpjHEagZm1EmHeba536kJYVWO5YSDDjpQIWIuLpb/3RvlQI9ysc82/v+EAZfxTla36zoWNGankQMBKMakzWzWLF8qF7Bun2UCq2wwVPc6rREOtUZmR7z/cUzttOUByKjIb8I5fernx5zRfxxA0bNHO9j9ueuOUG3qC5VaPB9CUJsQkNOKC0NOJw7DMV3X4v7VciGfv1irqIiISjpB70d4Kn94PTHhXF418Z75v06CxeAaguvL+ehlq4PJPP+jZmTlpeiW+8JGSTZTQTl3IYrSNZ/Uzx8MRTX8va8QvEquSLHkjRJY3Z6dJX1QWjQp+bAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWP3cG7e/e70cUAy0yiqwnLhD+NXwUwEN+x14H9+cw=;
 b=KgmidU1Fw+7vpB9Uzsgux34KRcjT0kIms8M8fzVN0CdXWWJ12qjVA20G/kSPLgv3NQ7/mFf9/CEh7zLOM35fNA87mB0+qfmluO0klyMoHw+EtkWs6uJNOr7IH6rYQcWAMIBIdNmK16NxQlvi8bCPYnuCbqX9TTBnDgMXkIhqF6Y=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (52.135.233.89) by
 BYAPR04MB3861.namprd04.prod.outlook.com (52.135.214.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Thu, 3 Jun 2021 00:10:09 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:10:09 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Thread-Topic: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Thread-Index: AQHXV3xgq8Qh2KPeAkCUNVGDF6BX9g==
Date: Thu, 3 Jun 2021 00:10:09 +0000
Message-ID: <BYAPR04MB4965DDD0F4479F5B492A30D2863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-21-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 410c689a-bed7-4693-4767-08d92623f325
x-ms-traffictypediagnostic: BYAPR04MB3861:
x-microsoft-antispam-prvs: <BYAPR04MB3861AC0DB66ED1C3B922E6C3863C9@BYAPR04MB3861.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aSCUd3+tO2dW2W0V3W+l+z6iJa3IoJNFdybg9gYTu9cedQ5lLVvPpm91O+dgVW8ql8UgQUxU6WWy+SnXx4hkRSkEbO+Bh9nDVmSGwmMOGkQ1nHjaRH0AmmcUwOEgU8PZj0bie3HHe1HkTiR9t6S8uH0KYFxKuxPIpGACKfziR9SdgoJQgLBMsLpbcl/XMriIfz/BZePIx+YXeYb0iTZg1zQtisRQ8BHOzvcW9ojTtcViOSd0wEtiPtkPj9ECItd8k4g/tUkuJBZ4Atf6k6pkELhctJZ8WJ42PKiGHu8LVUlUFVPDN2VXhagXLymt7dDZFFWHppkOKUONGWiIdwRpSsODUHoao48cLNskAR6ZEXegvXyqzYYouET3Q0OIYmUwslAg8gnSfVyx+RA2Rzpr2haw1NRfeR8epVcIitoaVUWk4+eJMy/yHTuFQy6ansUVygucOFjq4n5CAbUDWG6Ze00DEqPbx1sGyplv+rZCuJ3RE45DyM89gvL+b6fQ1xcV3jiGTFdg5yKmctnZmapwoPLqBzlIAqKUQandH72F1kQ2EMY5/mqgVQY/NPHh71VFoA/EQHV29oPgt9v0n+SjOM12CltqYJUFiycBsklsHDQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(6916009)(55016002)(9686003)(86362001)(52536014)(54906003)(8936002)(316002)(26005)(33656002)(122000001)(83380400001)(6506007)(7406005)(5660300002)(2906002)(66946007)(71200400001)(76116006)(4326008)(66556008)(66476007)(66446008)(64756008)(38100700002)(8676002)(7416002)(186003)(478600001)(7696005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?tOMRmQzBu9HBrmE54pFYwQCAZwjNFQViLIYp42OXhgbm6VKfnHeKq6ibJR?=
 =?iso-8859-1?Q?XVtDPmSP9FYrKIi5HErHCnz8ZolVYTOTq88vxqGNp5E8WT++gvcDXHWzfQ?=
 =?iso-8859-1?Q?7F22uB4d6Y7jZld1kooNlgaZuhcOZcWVK5jZsiQX+Vnu5A/I0GM6g6pXG/?=
 =?iso-8859-1?Q?fANsvMtPVZl4OWLL2+zaMRzi0z4pS0r4jQpoJHOglAaZtuCNoz9bScDYZd?=
 =?iso-8859-1?Q?AEvlPDPcaU86D30vRAfxCysnlB1/4/Jt1MXUWHSmp8VPpBXRNLlDGEqQxm?=
 =?iso-8859-1?Q?yjCAb9tCYwQfYIz6bHAigje3Yd7B2eiHgPvxT0MqDL2+eflNzyXrCr3o6r?=
 =?iso-8859-1?Q?8UyJSz27O4zzS/20AtH04M+SPYCu8ZwG+hkW9ykY/xrisflV8VjyxJNEKP?=
 =?iso-8859-1?Q?syxQYvDaTwngygKAaCnYFDz2soLqZOyR3u63/D5w2gGDjyoVdakYkl5JrT?=
 =?iso-8859-1?Q?9Vs+HX399Av3uvglcvTgN0NDHBSxG2r2hLTZQIlfUdcTJgqbjEEbTzHh6i?=
 =?iso-8859-1?Q?f5IcKkyHFjcXOS8rdDFlqyJhhOXgloM0oDOXQcVVqLJJYYU8BsOfyIdyIu?=
 =?iso-8859-1?Q?pUOu2kZO3V6uNs6z5PMGZkekzt+S0uxCreJuGgQrKkBZMs48NO+3sbdnsU?=
 =?iso-8859-1?Q?4c6IMFPVWUid+K4P+Y26m0ZmGTZvgHW7EkcU3dFejhLkpHrBxNr4AXEZ2R?=
 =?iso-8859-1?Q?4TZn363tV9qBc7iYebk3NLvLRw3CV5c7IR84da+AVEFOGpO1yX+IYrvoJb?=
 =?iso-8859-1?Q?t7O3F27g+Q5KnNOqFYGbyqb35w7zFyF8QHTbKK8sldGZ2gqzSOBQY3lCLE?=
 =?iso-8859-1?Q?apO2p5Ip0z38niJbY5R/NGjElnkFYxnVQfDKaCjVIIGmhZWgLnu4hiOqzo?=
 =?iso-8859-1?Q?L8+IQB2+pqtlGfnUlBmSIzDBc3+49PFeL2MsQlwM5E9n1hY9qPOUyqbmET?=
 =?iso-8859-1?Q?rpcgr9YIpy7KXg0uR2TRn+2BeJzIBgIqtRJywgwZgA+B8CJ3RwFWYeL1n/?=
 =?iso-8859-1?Q?hY7Q7ycu4z8lPJyJAlsshldtZCy3E1sv89KZsNPETY4AQEr3vHlaaun+xd?=
 =?iso-8859-1?Q?vgyqfQ9WCG1L8tMRnzKsqh3RlrakY3XIEVU8StpIxjZlCsJpMf83zURXip?=
 =?iso-8859-1?Q?9D/f68Z33Hy6P74gkVsgSBM+9qbr+SvWM25poIJijA7qHdhsegGFjmiBA1?=
 =?iso-8859-1?Q?lGWdWKKQOqEX8dKOfdNFEOHYdtB9duMlsdbxaXtMAssT2AMavt2G7XtQ6I?=
 =?iso-8859-1?Q?isoClhWwp/3vVg6ae+fZei/Sg1PoAPAHoD6EWQaKtiyFmWRy4+3YFr/Q13?=
 =?iso-8859-1?Q?HTATyFL9dJB3hIn1M5qIgz0y2yIG8dpT5nMVQTnH8b/gBTJhn1ETaotnmi?=
 =?iso-8859-1?Q?ckYH8Sgs2Z?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c689a-bed7-4693-4767-08d92623f325
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:10:09.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: csvqD0vw659M62vyGjnjyxGD18c3A93cKZHc7kill9AefsspYbo6IxhVdXG3I88JuR8UAroB3qRvmH2ffepP66pf7ZnPFJxPeY8tuhTHcyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3861
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
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Tim Waugh <tim@cyberelk.net>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alex Dubov <oakad@yahoo.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/21 23:56, Christoph Hellwig wrote:=0A=
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and=0A=
> request_queue allocation.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
> ---=0A=
>  drivers/block/null_blk/main.c | 11 +++++------=0A=
>  1 file changed, 5 insertions(+), 6 deletions(-)=0A=
>=0A=
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.=
c=0A=
> index d8e098f1e5b5..74fb2ec63219 100644=0A=
> --- a/drivers/block/null_blk/main.c=0A=
> +++ b/drivers/block/null_blk/main.c=0A=
> @@ -1851,13 +1851,12 @@ static int null_add_dev(struct nullb_device *dev)=
=0A=
>  =0A=
>  		rv =3D -ENOMEM;=0A=
=0A=
Is above initialization needed ?=0A=
=0A=
>  		nullb->tag_set->timeout =3D 5 * HZ;=0A=
> -		nullb->q =3D blk_mq_init_queue_data(nullb->tag_set, nullb);=0A=
> -		if (IS_ERR(nullb->q))=0A=
> -			goto out_cleanup_tags;=0A=
> -		nullb->disk =3D alloc_disk_node(1, nullb->dev->home_node);=0A=
> -		if (!nullb->disk)=0A=
> +		nullb->disk =3D blk_mq_alloc_disk(nullb->tag_set, nullb);=0A=
> +		if (IS_ERR(nullb->disk)) {=0A=
> +			rv =3D PTR_ERR(nullb->disk);=0A=
>  			goto out_cleanup_disk;=0A=
> -		nullb->disk->queue =3D nullb->q;=0A=
> +		}=0A=
> +		nullb->q =3D nullb->disk->queue;=0A=
>  	} else if (dev->queue_mode =3D=3D NULL_Q_BIO) {=0A=
>  		rv =3D -ENOMEM;=0A=
>  		nullb->disk =3D blk_alloc_disk(nullb->dev->home_node);=0A=
=0A=
