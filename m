Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723839FEDD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 20:19:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzz5c4Lctz307n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 04:19:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=gEN3sEVl;
	dkim=pass (1024-bit key; unprotected) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=umxLH0O1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=216.71.153.141; helo=esa3.hgst.iphmx.com;
 envelope-from=prvs=78645c972=chaitanya.kulkarni@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=gEN3sEVl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=umxLH0O1; 
 dkim-atps=neutral
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzz4x5Jz6z300Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 04:18:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623176304; x=1654712304;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=rLX+AVicar3gomhKUqxg3SOvizTUcO/q93xOnkT6VOg=;
 b=gEN3sEVluVz8ypRoBmn+nWxg2/e6t+snzLLqeqHmtJsxiWF9O3IiZw9G
 qSKVXig1hPJiL4Ez6yfERv1PRslHmp82GXIBrfxpNhxVchR6GIkAwSBlg
 wj4XW/8IPDOJ0WAJaukLmXd6j33SgrGFLOzm4ej61NPSnujQomeohuGvM
 mIAhWPHfyZtrcoXxzIZ/QRF/TlHIC0BhBoeQFZ1HBaqzzkKIVX+ZQICYo
 xo0IRqMlAGNOAHdKmr8gHOzNLV9glbvkvoYGR1MAwoR110pt8jf+IRTuh
 4FaXtcOCjvp+wq0wye9ek9dg8V2aUIQiQ57SgqDng8Sb8feoGb9PBlf2Z A==;
IronPort-SDR: fn/NS5ty5hBQPitU3+ISghDbUEw7gtK1y1+W7nQuQRx4Lp23+aaPk9ALxlcFYx1RiG6C0iy+gv
 bVDRbeFl1kXOkfFqyNhJidc7oH6mQxSbIgpYtfprmzwErzIDuqDmE/OAR4lm3J/QbNG8r+h8yX
 Rg4aFZT1fkCbnu4WANhu7kpZ2AXzYaxIECDTZ6WDK3YIlv1xcrVhFQRh2Awg3Ncj1ocH3F5FVn
 wZCNjqeb03/hRmVJ5w4lVwaNGl/50m/i7d3bcb8oRqD0ll6rW0hvVs/V6UJZDNy8BlPx2AGGvd
 CGE=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="175946742"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:18:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDACRRack/cznKeCrcchKGN6DEXxpPCGAC9PJT+DDz04LdSnltAuBCvsf5jDHBdY+gziwtadKdCDB4+9lGuQiJPBuGlEybPrkttZ6aDra1/uQJ8WnBeao6O1KbJzitiJwa5h5nlXG9irO4NzTLLrN+ttlT1+KikoB41Sd9Oh+J1GoVenrbWSoyPeiSQv17zk0kjBX5CNbdDogvwyz8ryxoVpGrwCZM3OcGzVFabAcfbAhqob3E/LHDjCZ346iNLzGzvE/7iFkr5XVSVJJZGEn62mF099GHVRis+n0hNBVbNYZkgbmsBXz2zQJWD86SRy/TE4rWWr0KmOF4DocCSA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLX+AVicar3gomhKUqxg3SOvizTUcO/q93xOnkT6VOg=;
 b=joGkAO7Uc8DRMV6sj3h1Ogd+Hi6454RjT2QIy7Au+mI39pZNm5w8TW4MtrcCQ1GgRDJhtOPZNF2Dlxd0thYBDwP53D3oPlhwvsV2c1hdiNtKiEiQqSJhKwRBLaNbdlDCziSvKc4ecKaOCjghVY1AKmYngkNUfp6S3i3kSn4j+bGZ5DCx20dWnEsYVXY4zGdBvmokeF8Rcf/5cOJ+YawJJXSTrtLw5pGR9EZpwzRFL18lFdNurRQN3hS0vIKOzMIddaEArPpRsoCJlSuN0Su232uSUmb1nL9+jMaHcuWaSw4KTO/rOYrxWoRpL09OfqyWFSfR6HTcOqgu+tLVeGf0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLX+AVicar3gomhKUqxg3SOvizTUcO/q93xOnkT6VOg=;
 b=umxLH0O1SGsuYHZnWDzxGWKGP4NNEo9UsrR4E0NhMl2k1OQB6gZjYGliUEEFG9dt4nfFP6laEdlqke46XhUb22UsAgk1E8nXUrfF3OmzGlq/SIUXKUEa5wpFMpxeA8IXPxcFRqX4PKZcOcCVbiEe5JT9FDYJYYwsS8ZBOCMcagk=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB6282.namprd04.prod.outlook.com (2603:10b6:5:1ec::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20; Tue, 8 Jun 2021 18:18:18 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:18:18 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/16] bvec: fix the include guards for bvec.h
Thread-Topic: [PATCH 03/16] bvec: fix the include guards for bvec.h
Thread-Index: AQHXXIBJ8gtMXRQ3RES8eG+ChZZnug==
Date: Tue, 8 Jun 2021 18:18:18 +0000
Message-ID: <DM6PR04MB4972C71FEC48DECEAD05EA2B86379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e298a76d-c2d0-4bd1-5e1d-08d92aa9caa4
x-ms-traffictypediagnostic: DM6PR04MB6282:
x-microsoft-antispam-prvs: <DM6PR04MB62828E49D879FA2250E2143386379@DM6PR04MB6282.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IAnJPJSUxWZDGM3Nj57Xx/af6xOWYOl7YHd5N+3B94G3XUGzCJq4YH9Q8DRv+EoyhFn9As/EKFQF3U5/6rv4NNPkmawMbOYVhm+Tn9kaRMtVNmSxxjSeQ5HGtIXRhOyYSBlJJtWTIhItPlPJSP8LHqSt9mkqVS11iA0Oz4JCAQNQPOb2JUtwRZD2/bA4xmtElt8TgzJ8Mc67lZo57mGWIk+84K00FQ7ftV969Nw65N/qI1S95mPQMi9P1OovX95U+Xm0So7d0bJ9DaZORf8eFrKbWul/V1fjsg0Un99+WhsYrL8D82VWl3y/LiJgivG3PLhN0t/0E7WykEz2Z5D109ETOebjLQjVKPZjoCowaRia+lwHB8/YJMFA3dHooHON0m3Cky/zOloRmXVJ9qkZR0/oRP/wjttBnA+L4n3u2HZvLR67E5jb95yVzEStFj6aHplvAf/a7r8SSd4EBewes3z9OTviGBCc2NtqLEjWu2tuYYdRjhpNkeQRM2tMh1lNw4jPt42s9pL7H8blQAGlRMi3Zm6624OICZ33mwcA/GIUKH/o1saHCdFybFB7Xl5LT40YiEHTbgxEvupV/ygNUoTYk9Sp5PNRj1pIy1Yqfpk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4972.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(66946007)(91956017)(76116006)(52536014)(7416002)(86362001)(558084003)(66556008)(33656002)(64756008)(54906003)(4326008)(66476007)(66446008)(6916009)(38100700002)(5660300002)(316002)(122000001)(6506007)(8936002)(9686003)(7696005)(55016002)(26005)(2906002)(478600001)(53546011)(8676002)(71200400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pKMms5Ale3Jodzz5sRXw2PDZXdq6GWzgAyUhc5ceah/4E8nSzj5URA9GTUuu?=
 =?us-ascii?Q?aSS/mc2WHXOqvO6COEqgczBMM5eLJ/NmBJ+aS0qlcWcWVhzoDLbOe5X9/HLz?=
 =?us-ascii?Q?4l81kSYUuz6Q/rs7QhX8ZDZyEbOtfS8wAxfECiVcyKdyG9n4+rnvE7PpLIvs?=
 =?us-ascii?Q?MkAVKJdyl6uyZKPaEgGi0IvHeRjHaTbSUqg3H3pTTUihMKrz9jJGC03ctIOR?=
 =?us-ascii?Q?FCarexV1LI5aHHC1md302+O0O4ZbfQ2sEht1p2N/Agc2+NWRssb0gI4KOZaT?=
 =?us-ascii?Q?tfyy/sINlfP0GZG/Ee+xYnKJl5kZOElmJckwg66Ql+PErSdUhMrGojNjFeeN?=
 =?us-ascii?Q?egpcxfJRUcJ9Z97zN89SK0CbN+Pc6UyQKQHgC9q5AwVQJ5nTBvJARPEjV12h?=
 =?us-ascii?Q?WqoXRCRT66KKoIh9SH/mEC149gB/aBuIK0y8Q9clWL3SY5pNDXuZJl7J37ak?=
 =?us-ascii?Q?LrErkAbFFrtqPyw9PSL+/v6u0MW5FL++B6G6sKv0VYSgHnK5gafMVdUa/yD+?=
 =?us-ascii?Q?/OQZExMgdIijVGFlHAwz9zriULyELDsbLZksRNxYJ/pY/pY/WEzLGePZDFDM?=
 =?us-ascii?Q?f7pK9Gjcz+kWYVJq+f2c5V2qceecQSVoVnm31+diXJIli03D6sL8qSc32s+m?=
 =?us-ascii?Q?jPUDCFKgtk+AF4pV+ksD2R6EYzgWGyKI+N3LQl844Ysd4OecCSd5jx0zzxRF?=
 =?us-ascii?Q?IHQNK7Nl0MYiupFvFavTMKrCtQk1bTyzOxp7OHcywm71kCr/SyyjfpTODROV?=
 =?us-ascii?Q?sZ6aAYnEUaG2R+aKYjRa4MoW0yJ1SchvUKy3iGd1gTj+cEVj47Fozs05ZR31?=
 =?us-ascii?Q?prxoJoMtUX5sEK1lqwZNoslZersxAV7zCemMD0aWY8709VjeS4vzADnR36ep?=
 =?us-ascii?Q?ezaB3gmbGVOvQCVv8dQ6IjmlbHHD1eaiR1U/t6kY1mXGXxS3EfpChHPxW69j?=
 =?us-ascii?Q?rJiRd+Dilxq6VHLCpLkWnywqbPRxf8BgCuvVW86tZDhrqmB0dh6+7eI3Czo7?=
 =?us-ascii?Q?4aPxlHVwUi9zZ5KeOZZrJdTEcoxAydSWH8PFrJG9Kwr6iOQGMYDMp4dbfZ3I?=
 =?us-ascii?Q?AVRBLmhtc+2ZXsyTCEqXnBJ9jEkX1kWFMPIWJARuxa7k8n2PGF9ceJAK4MPU?=
 =?us-ascii?Q?SHhc4JtWI7Qzj5oZizLzzy64LKMWm6Z2B76/oIrsnKQAth6Rzfq1kteDTRiI?=
 =?us-ascii?Q?FcVbpHKa8pBYGJFBe4Hjg8g+o3qYeH1tDSFdnqMNvNcAxWgOuFZT+Mb5R9hx?=
 =?us-ascii?Q?Vemyw4Cfdz+RcXm2XfoXAMQkm+X3arZGd6MwRe5Hqze/1EzdBNzy4kQCzSzT?=
 =?us-ascii?Q?Ce0OCaSB+n7f1bYcGLTZBh4m?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e298a76d-c2d0-4bd1-5e1d-08d92aa9caa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:18:18.6185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /q1s6A0qhM8QT7bBYhktWUTeWl1HUxR+Rp1Mo1gscsWr3RSuxouLjVbK441E2WYetWyv5MYWJbhXWBChn3a8uZzSe/G3eS11HgVbhdlxynI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6282
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/21 09:06, Christoph Hellwig wrote:=0A=
> Fix the include guards to match the file naming.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
