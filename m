Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D5862F02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 05:40:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jSkj4kywzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 13:40:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.67; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZMEHdqxb"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00067.outbound.protection.outlook.com [40.107.0.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jSj21zjgzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 13:38:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX4rKEGLdam9UCJUPoJejNFiKqVs/jmJB0trusfsHI1ZkPBO4T6itYcuY2kAXkwGSqKVE+0ScVMtlg7MED1CznAfQi+cTvIDiGqijBICqovhpIxDgy9tFoPzZuzLtPT6wCYo3v7dTg/Qz4rbF+iuNCCV6U63uqHZfCvKG1IkaarLzR0tEDb1PKTs4nCb1QRfasAdH6sVNHTBMroYAnAiJ8Jje0NyRYfb5OLcgsLwp7BpWMJlJzbn1JGAOnTBhuPAaZI7CV1IUOlcSkO3N0Uk6luQlT+Qmynt/h0nGMimbVORKgqc4jhHzeHxoMPXw7WInk+kQ3jnm1dSTqlzE7Nlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huOkNqQOkNf6RW6RjMupOGnDJsrlFbyhC+whMPQAauQ=;
 b=CSsP88CyhAE20u3AG19tVjDVTNRFpJe50F9Fsjs9eTnDAVePoRQZ7+W1aA2kaqQCAVI+l/MwfUpgxTzXP6854RGXij9MDJsXsdUI6huS1qw61SgV6JINYviqrGjcmxfNqfl7MZdXG844/EmwFGrpCkPq2hWHD163rGRHvYF4VvqIEirsRXtqt7uqBkLFuDIw45AFFAHIOsK9UKTW1x9suFKNRLmSpfTtKh2CClOEdB5JM9l5An03ak4zww8QG79PxPLVQBfa06iYGbfDHdPzMLoCPPvLZsQwoWE+0Ml8RWHrRmcrorE83RPnk+qQG6yc7wbVzEtEcU39DeiDuCdZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huOkNqQOkNf6RW6RjMupOGnDJsrlFbyhC+whMPQAauQ=;
 b=ZMEHdqxbQDIeXs3XL+z3x1u0PwbquukEdLIQCm58r3ycjR6ArJlYBIiEhJrLl2gOC+/9zwiiXr0JQAgyOafCHy2BE43TCH1r6nW3CDzPGnN3RFfVqud6VWMuu8lzky94xRLN439lf0nYbDUxbC78N9r1pd18JEeuSp2nWuYnt1k=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1SPR01MB0007.eurprd04.prod.outlook.com (20.179.193.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 03:38:36 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157%3]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 03:38:36 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after xrun
Thread-Topic: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after
 xrun
Thread-Index: AdU2B0WWYdAyRfftRKe3kHbe3589Jg==
Date: Tue, 9 Jul 2019 03:38:36 +0000
Message-ID: <VE1PR04MB64797B5172DB5EC9EBA8232BE3F10@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a88d812-30ba-4402-14d6-08d7041eecad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1SPR01MB0007; 
x-ms-traffictypediagnostic: VE1SPR01MB0007:
x-microsoft-antispam-prvs: <VE1SPR01MB0007B4D85981DDDCE2999FCBE3F10@VE1SPR01MB0007.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(478600001)(7736002)(1411001)(6506007)(4326008)(6436002)(5660300002)(99286004)(2906002)(66066001)(52536014)(229853002)(74316002)(8936002)(186003)(26005)(54906003)(14444005)(256004)(7696005)(316002)(305945005)(102836004)(9686003)(6246003)(81166006)(81156014)(33656002)(486006)(55016002)(25786009)(86362001)(6116002)(3846002)(53936002)(8676002)(68736007)(476003)(6916009)(73956011)(76116006)(66446008)(66476007)(66556008)(64756008)(14454004)(66946007)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1SPR01MB0007;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fAQ1lR7BTNuLiwG/an5SbhBxMlFnnxWvWLDDc56aHop6NRQZ75/n21L46B+hyREojhWrBtjLQ/NFQrcIMfeSyvnsWQMBZjcGmLgEvQzuO/Y/ccFNL+vEWTE2FIak+BOtj0R9IpdA8l65OCQsf8asEhaUeGiSBDiuV+SShTQUPFBPyyfmQp+dkLeDlyniuEWeihK37RJ1kXroTJoHyRdT1C0M7kVj0Ph3dC3Xtm/nBp/NsxoyK3SGCh4EWC5Yn51w5+7JzEGU1jZI85BVvnRVtNcvHIlMgIl69osViUMhT3sCtRtLgY+ic07p68MUOllI7ZaIRfqWMi8oQ8Wwtrq+Nsaehb1H2v1ouBcXd0x+JK1lg58I8+2PtR2SELkeuHXBo88ij38SkNuUSc3td3WJ0CAh8Eyp4qVxGOi2MTvCYvg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a88d812-30ba-4402-14d6-08d7041eecad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 03:38:36.0761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1SPR01MB0007
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
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> > > > +
> > > > +     /* restore registers by regcache_sync */
> > > > +     fsl_esai_register_restore(esai_priv);
> > > > +
> > > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > > > +                        ESAI_xCR_xPR_MASK, 0);
> > > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > > > +                        ESAI_xCR_xPR_MASK, 0);
> > >
> > > And just for curious, can (or shall) we stuff this personal reset to
> > > the reset() function? I found this one is a part of the reset
> > > routine being mentioned in the RM -- it was done after ESAI reset is
> done via ECR register.
> > >
> >
> > There is a problem to do this, TPR/RPR need to be clear after
> > configure the control register. (TCCR, TCR). So it seems not only one
> > place (reset function) need to be changed.
>=20
> Do you know (or remember) why we suddenly involve this TPR/PRP?
> The driver has no problem so far, even if we don't have them.
>=20
> The "personal reset" sounds like a feature that we would use to reset TX =
or
> RX individually, while this hw_reset() does a full reset for both TX and =
RX.
> So I wonder whether they're necessary.

The hw_reset flow is suggested by design team, so involve TRP/RPP is from
them, I don't know the detail.

Best regards
Wang shengjiu =20
