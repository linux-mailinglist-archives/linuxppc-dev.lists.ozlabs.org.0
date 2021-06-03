Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9383996FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 02:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwRnc226Wz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 10:37:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=NDX5f1EX;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=T+9a36hk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=216.71.153.141; helo=esa3.hgst.iphmx.com;
 envelope-from=prvs=781f10532=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=NDX5f1EX; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=T+9a36hk; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 03 Jun 2021 10:07:03 AEST
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwR5z1R3nz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 10:07:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622678822; x=1654214822;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=NDX5f1EX96U4sWmapaQbugl4pOj3r2zMsi/atkgRzZOLvH3sKEYrDIhD
 UtTqVyl1mQ3Vo65M5Vcj01CkV1oisaYhZBI0F1JBRU69cvAWiqhc+RxNu
 OR3wcB0MVbmui7YHUvuNXcS1bfUZTmNsFZrePKeJXWtMXti47FWiK3ODM
 79psa8wWlfbExptbtaerhbkAPUpQRygr5oB8eEe93ElBEfl6zPQAFKYq7
 jqsPZkO6U6LprfrYIe6ZmXvD2BSFRJWs5uYVt0tbd3k+CoJZA/JHCskaM
 3HykVWeUDcXJy1BwP7qc8KkSpVgDsRoowbVseysaNh3iS2DBpc92Ch20h g==;
IronPort-SDR: yNidBVFfwP0++LZUETizwUBWEU+SN5FJSRje8d9L3HA9a4QVTuJ3JBJOnr3MIi9gFTJe/8eecu
 HStTZQKFFUCbQwS4FUr96K24Njy6EXoKXzzXdWil6RMp1mlvcZyH5L6EDrJGcuEI01DwcwTsMT
 pRAfIqTK9lzGNov0fGAd7mAjRIWGxXGtRygQBcLpHsPQyNrNh8eAPm4B6p63N0/Pve4ZLw44Aj
 5F+OH4wmt0QavYeTsh/8Wr2SfC0JwqhvrqLnTzBDcRmyBvK+vFVgn0C8tK5FZvqYFuYnCi5Zm1
 nbw=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; d="scan'208";a="175227080"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:05:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3farpPa7W2fK3OCqmeUNYp+1WtoYCwnIe0Eyf8Gl9wK74y8kMwubTUPkPw87CpKGPTkcsCJA9J9RAqWtkUv0UsxxqhLAK8cWomOg9Z8zyFWkNN88YJ683LYV5ZYV8pbUm37peQBiPXd9wVZQI6BV8Q2Mk0dx1jpu9xXV42LBxVyNxRkheUvOrmRJ/9MRHFnsDVqos7b2uq+tIZK9XE9JliB7EBArVO2kasvYJfSumxfor6O+1vK0XHfm+mw/xkcErs4ghhwSLe4cIBVMajW0UxCTW3in0EIueBnaojQ8cfbavKhj5EpsgJ9OMufl55s65UFOw5crSiQWgCh+1b94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=SPf+169lZ4Rranyg6WH1JdhKDbAUaSshGdESKcqMmPHBbGpcq4V+phPl//qpeaC/DYlbh/8EhDzLHLeTEC+zWwoElyVp0Xi/AlW2/g0q2DrNxFSuHTWLBDNBeuU06i5v8Q99Pa3asHmqtqixTbxSC4f7rD3RpxOi9nZpQlptzvl/DuFwfPz1DeIX6f3+BG8I3nMxnfttIi60y3JhEM5xLf42wULnrsSEE2oj9mncz+uFj6xtd40VfngSmGBqLZ+gSPB/xc4YwVeUViYnUg+wtKXYBVgJF1Cv1LcybuW+jK+/MSMv1IzrVd2Gb7Y8Hf/7C3TFAvDRPaTQiM6cnkPQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=T+9a36hknCdvo2DPcnesnvQMhfho0Y0/EomLU5TO6dseSuE6OY42Ze5Cj51HfkCMU5dmKIdReUI5CcZqgM2t4/b0A3tomrcyTgMQ6g2QEB6b9szGMpVgTyTO334vQO/8TC2/JufqTsB97FPKYxMSfZ5pugNqxbTTzQXPdatyHjY=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5333.namprd04.prod.outlook.com (2603:10b6:a03:c2::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 00:05:45 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:05:45 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Thread-Topic: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Thread-Index: AQHXV3xaE0d6OBaU4E62oTiV05BSaQ==
Date: Thu, 3 Jun 2021 00:05:45 +0000
Message-ID: <BYAPR04MB49659E527FE3E41660BF8589863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-19-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39591f5b-3ff9-4e4f-1e41-08d9262355df
x-ms-traffictypediagnostic: BYAPR04MB5333:
x-microsoft-antispam-prvs: <BYAPR04MB5333C6D28F1EA2185F1A07B4863C9@BYAPR04MB5333.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PgVZpMqfBZsayGo6qHKvJ/SMB0aIT/hImnkZMDwIUFSs6fwOxe2azCZGsLYYbvBVkWrtWNrUFQJJzeMe3yYffc8YIVjA4vJhqd1Caf+JQrgRrW8iANW1Fa/HwaSNBqVMprKX3CCOr3cy1gDErClF4rDG2tsRuQIz2DZ3wl4lpipsRdWqfqfDlvSHTzPfY8HoDivgfEAPOqwhWAHjZq+glqlqQNx5ZuMHtvR23EDC4vpH/CigaR+TRxEQ1bhZnCzeXwSFOfClGAgqWJfg/YHx/QfV8bngLaMNrTL2snvIV7C4DvRbbyIzJWr1cYbirk42HHX09WrOtimpQWxEpl3MisB8trOfqX2JC4rdBvIjkUaD0Gu3Vd4tNq18VIg+f9BmBccbQ2EtncSTV4CHGdMbjwxBRIamRH6tg8R50QDEz0qRt2ydIbwr9cXW2KR46pgExiN/N5aOQNkcSCw02up2UrfqPreq+/AlBpqOOFH0QCZjF3KTAPdUTp8qjmEkDht0hhnuAIkkoYSevA85lQXGgxc8PooKuHlGX+GrZERL5amiEUT9pgFbBzsgSZjY3DhUCUiugbACiQpYZej9ts05kLxaCUEKkshvgopZWtO9nZk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(52536014)(8936002)(55016002)(9686003)(8676002)(478600001)(110136005)(54906003)(83380400001)(76116006)(66476007)(2906002)(64756008)(66946007)(38100700002)(122000001)(5660300002)(66556008)(66446008)(71200400001)(26005)(4326008)(53546011)(86362001)(186003)(7696005)(6506007)(33656002)(7406005)(7416002)(558084003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?5if6RR5+OJsZpshEstylBHTMiQTdBTwGqtBjzZ62XGcAt8S+WMU1R6WAr1?=
 =?iso-8859-1?Q?a51eNNNlEJ+VJlKHkoSqcgo2gIBhqaOpnahoP2sexcbCNSfIQ/mT23Hhrc?=
 =?iso-8859-1?Q?CcZvGJdjc6rYcwPcGxufFVIXA4VuS9ph3bVkXwT1KWFzecVa9v7sRZjstV?=
 =?iso-8859-1?Q?M52hDeZD+OF2CXi5MCN0ahoxnPtEEWQo3uJ627FGCuiWRxi9hBI4zHAyQD?=
 =?iso-8859-1?Q?n4L880UPigYemTZh2skZ2GRBM3EuXNgIf5eMrwx4/9GRA3thA3Vs6/Srr5?=
 =?iso-8859-1?Q?mGAI4xuVrUjS5kqBdndpNixJAX1SDSM/c5pjrP6MwNVZHaAJQaWiqd/HSt?=
 =?iso-8859-1?Q?qjXLVs9eg3uXezDIMZbbFb3XlhgYLwr4Kg+u+oojFoO86BfCoFfj1SZaLK?=
 =?iso-8859-1?Q?3Bh6HvFLoxKb6fnftF5GncLxb2klSGgVkwEBvxlUdRyF5hLfy0GDhWEiwn?=
 =?iso-8859-1?Q?yvPwGUF1+TCCnVDjIV4TQiM/anB4IJYj7Pz6AgJfWV68HWhWQrmXTYHpFh?=
 =?iso-8859-1?Q?CcLN8OXPeqiXrlUWuJSE+dkeXO0N/nWPs0Ztuv7AkzgDScv3MyeGOeHz3Z?=
 =?iso-8859-1?Q?Ao7F5TJClVo4s6Ru7csKZuy6fY4JU8hhN96B8/sDqt2aBqhr72Hc2stfoq?=
 =?iso-8859-1?Q?cWadzIwd6WVVg+F9M77H9ekG9yiSizSPk2biwRViJxMsn4pztStuwmqKi1?=
 =?iso-8859-1?Q?t83Qs/txRM7vkASOivFSKQe302k3TlOukOSYea41yEa1Pz3i6oIZnZefgv?=
 =?iso-8859-1?Q?NSQw9pYu9oSKGJ25XiFKSTq/j7vSbzks171YHmv9mcMt6wP8yl4LLXxCen?=
 =?iso-8859-1?Q?JXD+BD+GKbVnjs7pZSk99T99q+VCUnMr02tJUq6IfIA+Cq6AX93Q0L3v0A?=
 =?iso-8859-1?Q?qDn95YKDo18n5brnbC8adwYqFb9BWS7i9plCtUA5iAEgQG7cWDB/J/zCCE?=
 =?iso-8859-1?Q?6bE/YfhBuXNi264x616FmYWOFFz2gRTXVHBrqOmgFcjq+xeiwfUiLM3iIc?=
 =?iso-8859-1?Q?vQ1xF8dWT4I98ziJWB64LXJLu3oqZn592OlCv+12XP7AcL+hRIAMmaOLMh?=
 =?iso-8859-1?Q?+DjXC7TFUoHipM+C9D1rO1BB4cTG/35uwiag5HrH7/d45WzZmSsapFV0/+?=
 =?iso-8859-1?Q?eJTfrX8aYrolI4CV0AKZjhKyK1qJrHy2Iy3J4immKeUbAWIyN75+vD6817?=
 =?iso-8859-1?Q?SqCiq4gw9a0EywODdNX5I5vEzTROvlrHITNzRWZn3S0uJZceVLoeMQyUCr?=
 =?iso-8859-1?Q?1vuXs9xwNnyBoHWVfCBl3SNUv4bBHzezF7+hWC4DnOm+Vdn6CRvP+5sOy8?=
 =?iso-8859-1?Q?lJJ8x7HTy3feCkYVRWQwWhhN2a0eI7ohaqFaqoodESTjPUs1PcbecmVk6E?=
 =?iso-8859-1?Q?yOGxfM+lRI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39591f5b-3ff9-4e4f-1e41-08d9262355df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:05:45.3613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZUf1SLT6UbGI1jPGaANmbjvJ+IN4ZVHUWumZOErHa4bTyMMnyBgRVRLyXW59SgP4r+36OBdgMCcwGD5GqSUCjl5bim8WN/7KVvAoUqr5pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5333
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

On 6/1/21 23:56, Christoph Hellwig wrote:=0A=
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and=0A=
> request_queue allocation.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
=0A=
=0A=
