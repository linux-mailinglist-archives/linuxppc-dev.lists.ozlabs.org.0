Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2137C43247
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 05:02:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PT7W3wdLzDrB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 13:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.55; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="EtRqSs0z"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PT5c4xDZzDr3y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 13:01:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yL5M61+dLVUgU5eb/obmOGKRpmvxkGFbVItjRbFhac=;
 b=EtRqSs0z9Ocbth/pOfAdxMa2fapfDQKEEEXFB8fwzkC51+rU7K5ktM/ElG1nCtkei/WN86ufSbGmV8yIfRQwSUihJPHber1qoF70awH/6n0thjnj6fEgyEotRYLg2kFRfaScJ+5zjq286ilGmSmAZHFajzjWIm0wJUCmIHfjV9g=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6688.eurprd04.prod.outlook.com (20.179.235.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Thu, 13 Jun 2019 03:00:58 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 03:00:58 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Subject: RE: [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR and TX0~5
 registers are non volatile"
Thread-Topic: [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR and TX0~5
 registers are non volatile"
Thread-Index: AdUhkxXnpB3dbv39SZ66Nf7IqVutFQ==
Date: Thu, 13 Jun 2019 03:00:58 +0000
Message-ID: <VE1PR04MB6479D4B1D5F00B07C5CECC5BE3EF0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cd8986e-c323-4144-5799-08d6efab5c32
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6688; 
x-ms-traffictypediagnostic: VE1PR04MB6688:
x-microsoft-antispam-prvs: <VE1PR04MB6688C9F4D37529BF375514FEE3EF0@VE1PR04MB6688.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(14444005)(9686003)(256004)(305945005)(14454004)(99286004)(33656002)(486006)(7736002)(68736007)(478600001)(7696005)(186003)(6506007)(2501003)(26005)(8676002)(73956011)(229853002)(55016002)(6246003)(6116002)(81156014)(76116006)(66476007)(66066001)(52536014)(64756008)(316002)(66556008)(6436002)(8936002)(7416002)(4326008)(71190400001)(81166006)(74316002)(476003)(102836004)(54906003)(71200400001)(2906002)(5660300002)(66446008)(66946007)(25786009)(86362001)(3846002)(53936002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6688;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ooH8LHpVo4O/v4bkbKou+2a2d0xnpBiQceLog/d0JDl+Bjn318L1JLkwMbi6LxEIZWBmTRqYcoSmKwmoyrhfUWv3EsKXcjM9mJfIg9e7eJEBTXrjvdepvuCkmXxuSJyCOXclXH2A6XCIJkvxDs5hLg0DFjIJTBgmzplZKD9NO0lMthttOoVOUljlITxOHb/p4bU/r7wxMfkhIjja4oFxxMFPD/TJFQq5GBQdDKbG2Y6KAbscX0sfqZ752iN2PGMlG8+arDnMSr9lqNTBh5wQQ12Dszb/fFw5B9DsBz28KU0wh5TOJmY4q0zwT6fUpB54uIbO/aJHSQ8H1CY792RnXvXpu9i0jx3R0+sjS3ZSaumgq2Dc3PxFq4U5mcaC8SnETzjEmzIYl2oAsq7mhYVU/TkoFI5PhrrWRKFmnRTTCf0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd8986e-c323-4144-5799-08d6efab5c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 03:00:58.3573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6688
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "perex@perex.cz" <perex@perex.cz>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi
>=20
> Commit 8973112aa41b ("ASoC: fsl_esai: ETDR and TX0~5 registers are non
> volatile") removed TX data registers from the volatile_reg list and appen=
ded
> default values for them. However, being data registers of TX, they should
> not have been removed from the list because they should not be cached --
> see the following reason.
>=20
> When doing regcache_sync(), this operation might accidentally write some
> dirty data to these registers, in case that cached data happen to be
> different from the default ones, which might also result in a channel shi=
ft or
> swap situation, since the number of write-via-sync operations at ETDR
> would very unlikely match the channel number.
>=20
> So this patch reverts the original commit to keep TX data registers in
> volatile_reg list in order to prevent them from being written by
> regcache_sync().
>=20
> Note: this revert is not a complete revert as it keeps those macros of
> registers remaining in the default value list while the original commit a=
lso
> changed other entries in the list. And this patch isn't very necessary to=
 Cc
> stable tree since there has been always a FIFO reset operation around the
> regcache_sync() call, even prior to this reverted commit.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Hi Mark,
> In case there's no objection against the patch, I'd still like to wait fo=
r a
> Tested-by from NXP folks before submitting it. Thanks!

bool regmap_volatile(struct regmap *map, unsigned int reg)
{
        if (!map->format.format_write && !regmap_readable(map, reg))
                return false;


Actually with this patch, the regcache_sync will write the 0 to ETDR, even
It is declared volatile, the reason is that in regmap_volatile(), the first
condition

(!map->format.format_write && !regmap_readable(map, reg))  is true.

So the regmap_volatile will return false.

And in regcache_reg_needs_sync(), because there is no default value
It will return true, then the ETDR need be synced, and be written 0.

Here is the code for regcache_default_sync()

static int regcache_default_sync(struct regmap *map, unsigned int min,
                                 unsigned int max)
{
        unsigned int reg;

        for (reg =3D min; reg <=3D max; reg +=3D map->reg_stride) {
                unsigned int val;
                int ret;

                if (regmap_volatile(map, reg) ||
                    !regmap_writeable(map, reg))
                        continue;

                ret =3D regcache_read(map, reg, &val);
                if (ret)
                        return ret;

                if (!regcache_reg_needs_sync(map, reg, val))
                        continue;

                map->cache_bypass =3D true;
                ret =3D _regmap_write(map, reg, val);
                map->cache_bypass =3D false;

Best regards
Wang shengjiu


