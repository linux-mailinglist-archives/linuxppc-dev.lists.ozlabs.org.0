Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9B6B71BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 05:00:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YhS069MtzDrqB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 13:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.67; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="JFM4ifZJ"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40067.outbound.protection.outlook.com [40.107.4.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YhPL3WwgzDrPv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 12:58:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKrQrIEmT1OWWgnUsKWHV7wmPrkIEifplatMoEB5PWZ5ezayDrK5uYNyzw492+vX2p5+0PoI8DejP2BeWYZ89BeqXPCIkN/IZfHQGOIwTfUzh53ELe/5kdOZ8fq2/Xfw23+yPE36yxBm6nJcLgQtjecVjjj9tKpROGKXW7TyiG4V+SDoUiFcpaOUgutb3/PNDAUi8YNjsVWFl7gxytJHO5o4XEUu/O3iBZhwGp38/6VJynByXNXOTaLoMn8HoVDCYnMgH9x+y2qY4fRrAMgx7+XCNfjl1LWoth+Tg+A3V6j+mXuNGoOfl2dHc+zqs7WhVl9HmVvdDZbdc7bKb8x6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51uYs/eundl+YXeL/YQa0zQL9WZBk9/Az0Kz3Ipen+8=;
 b=X86yvyZ8BPvkX+XOwd1qTNCD717LhP4hYEfDN5nv7hzqgx4FezvX1cppGEbLTyLqQqMqCgZiSmp05OmXk7lhyhhCEQyRCFCjVm8e2dYLNMFJKf0V7Ob/9LSM5xpZfc+fnV2RFjDRXakV0SRc9o//RAooPDYYrZ8HoB0VlQNsdwn8mksdG0HtijllE+QgDEMiy04lmOSbQWFEkMocEKHKqsMokYwv65o2rk4ikO3TTDnhThJlSi1ec8IJZam6L+LXDszOcm0CRMfldYJ67AjNHJe1W8eVj9Gei0pWfPceaVRHlfqg+VUBNwdnO3c6QVlnnLxjwZCBHFqnILFmp6wwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51uYs/eundl+YXeL/YQa0zQL9WZBk9/Az0Kz3Ipen+8=;
 b=JFM4ifZJcm40NWvC5tGeGY0bs185uhVwzysuSCRxhEPCK8VieP3RcJaIHCOh0rRlYpvrrOGljLdCASEoYsLg6ft0LY6GI+YvC4ZSsCwnl3wDcf0EyCSrZ1iCZGcO5ccQ5Atqx8bRGZlr4aDzkK7Xnu4OHnr8zghp/kYE4MmoY4U=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6367.eurprd04.prod.outlook.com (10.255.118.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 02:58:21 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 02:58:21 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>, "timur@kernel.org"
 <timur@kernel.org>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com"
 <festevam@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, 
 "tiwai@suse.com" <tiwai@suse.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>
Subject: RE: [PATCH V2 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_set_runtime_hwparams
Thread-Topic: [PATCH V2 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_set_runtime_hwparams
Thread-Index: AdVulgpRceddTBjmTiyBOqg5p/ADHg==
Date: Thu, 19 Sep 2019 02:58:20 +0000
Message-ID: <VE1PR04MB64799DE6C384435C8AB1918DE3890@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcd07376-4cae-453f-1a18-08d73cad3ae3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6367; 
x-ms-traffictypediagnostic: VE1PR04MB6367:|VE1PR04MB6367:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB636741439BBFBAE4421832E0E3890@VE1PR04MB6367.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(2201001)(6506007)(186003)(2906002)(256004)(316002)(486006)(66066001)(6246003)(55016002)(76116006)(66946007)(66476007)(71200400001)(71190400001)(7416002)(3846002)(74316002)(305945005)(6116002)(26005)(7736002)(102836004)(110136005)(52536014)(14454004)(99286004)(25786009)(229853002)(6436002)(7696005)(33656002)(64756008)(66556008)(66446008)(8936002)(81156014)(81166006)(86362001)(5660300002)(9686003)(476003)(2501003)(478600001)(4744005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6367;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DZFHJgnCSbRhtyatIq0lOhFkfLIjJyLrEWkZ8MQt1kGk2kWBaf4Um+JZBf2JdV3lVP2ZuRplAhg/2ulNNv+MER27VoIJMUDFTwayWZ5zzu/Ox4ofbtoRsmG2pEn0VvL7PQ13mdLtAHtl3BGQi/Ji8SnDJx58m6fRb691Z4KbuJPExJq2aVBIcx4jm8ozOP9aWPc7X2LdIvk37iOFJGyJ3fFaMYST6PWx6cM6p/DfxdRrnEy6y+noJGAG3YIdzF5hvkU1UuSh5R0XB1jeab6EjbjMdbW49LoUSECHmRIN4f880gMAUyyqbbgIVbBP1OAy3MIckZja0riJ1Lm9ACNw6W69GT8WLvoPqUBk8MwUQGUdnwhOYMmdSx68ExdH8vkliPckIQnZkHpP7wNv8pN1Xc8pHbdyqazUkvNYP4wSmX0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd07376-4cae-453f-1a18-08d73cad3ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 02:58:20.8716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3558+APjAGON0KcfHdcuyvIm6+AoVaBiXLTfb5tCMMAiXZ270CgzKhi0upRi1Pkssj2MwM1bMmSPEuxc7K7tYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6367
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

>=20
> When set the runtime hardware parameters, we may need to query the
> capability of DMA to complete the parameters.
>=20
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_set_runtime_hwparams, that other components
> which need this feature can call this function.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

kbuild test robot report compile issue, will resend v3 after fixing.

Best regards
Wang shengjiu
