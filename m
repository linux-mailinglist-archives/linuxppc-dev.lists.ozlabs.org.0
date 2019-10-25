Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F872E4327
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 07:57:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ztfd4XmszDqX8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 16:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.69; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="OKzqqHnp"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40069.outbound.protection.outlook.com [40.107.4.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ztbh3wZdzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 16:54:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lu5s8fdMiZl6CBcn4sLITkygZCYvYpBiy1nzL/lz2gPHUD/bljk0qk2tQ8GqAPvfECH57iJHnkSwtMNikhzdn4SG+RdpAlhDfjDr9XquelKIKhdsNMyelnkC9o4Gs9khc53ptXtaoC+A4JPO1H/nbfhTO+l+RtyolN9vAJt9+bYBGSU/vRrkyNgckctM7FKsVqUjKaccxXMaBkYtsYQOtHZFOqM46Jv8Qh9X9kK9M1NRM6uGcgpfHo2PGVar+vcW5+GoF+8MvwqA6fFipJ6pEXvb7XH869GHk0HcS9eMwxzhUKeuCertZZqvA/kFWo/D+jB6YeEFOvbm+yQ6Gm/8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SqHbF3LA8xPTHfjfatUcWZN7IA4yK/a4GIsqIhdWRQ=;
 b=BYVvO0AqqjsHFA4OXLyB7Dcu71BrGdQ38sHFr9440Mn/5skTwe7d+d7O8Mi1THNsj15oBXWX4HLChVYo9sp6dEfrWlS59mUm8L3rcZKa0+xRr1QDMKbe9E+DqA7o9RTI1sh06phgF2wEybq0XljYeqRikfmWIUoE5I8RYaQSStp2ET5duVs1svYYFAHr5fq8AP1RzBhxWj9PcFjuLaPkgoy57ike1+HvDoLwqJQ1rOeowAK7JKimsXoubIi0Jnfqjl8xeZOUKy573ibPdcmtNe94JEdXcSIqtRiAXbMaLpWlvX3llRv2VXHU6+CzCoSLoVre35q4SndidPG//rlf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SqHbF3LA8xPTHfjfatUcWZN7IA4yK/a4GIsqIhdWRQ=;
 b=OKzqqHnpnH1EI0N3FS+cs2vjk6R2ewqB+di2G45qVBpPvt2YjV702LGXWXN5y/aTdzEkGKbOgOl3JWsg2mRQxRTx8kAQQV94rhaLaMcpw93tqULdWkJPlHjfFPr62JjEr9hYSCR9Jd2gkPL8kAASGTIYL4gz3YW4jg2bcqJaqTQ=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6557.eurprd04.prod.outlook.com (10.255.118.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 05:54:16 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 05:54:16 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Add spin lock to protect reset and stop
Thread-Topic: [PATCH] ASoC: fsl_esai: Add spin lock to protect reset and stop
Thread-Index: AdWK+HdhgLIuF2SMRlyd3wTM80COcg==
Date: Fri, 25 Oct 2019 05:54:16 +0000
Message-ID: <VE1PR04MB6479F8937722C1FAC81C6623E3650@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 93d17133-584a-4940-b8a5-08d7590fc51c
x-ms-traffictypediagnostic: VE1PR04MB6557:
x-microsoft-antispam-prvs: <VE1PR04MB65571B034B6C41D5992772E6E3650@VE1PR04MB6557.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(189003)(199004)(7696005)(6916009)(81166006)(66066001)(81156014)(66946007)(7416002)(66556008)(66446008)(64756008)(6436002)(5660300002)(4326008)(52536014)(76116006)(9686003)(66476007)(74316002)(4744005)(8676002)(54906003)(478600001)(316002)(55016002)(8936002)(25786009)(256004)(14444005)(71200400001)(71190400001)(6246003)(6116002)(102836004)(33656002)(3846002)(1411001)(186003)(86362001)(476003)(99286004)(7736002)(26005)(6506007)(486006)(305945005)(2906002)(229853002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6557;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fOUhRT42T8aC84f1t/qS3pDC/tFJFSlyQK2fyzB8jo2g50Tk2zQjEKLWSBmgr8MjbSE2+jaaHXtqJe/5tPg4VEsGdvArmnR0M70CoQw8AAN84iwDVkRvj6yhLZLLAdLnWZkxMq6y+kckQgFXqkUA9A+MTegzt5m8ZtesBbSZ0FRJPARVObLWFZAtU8LczzhHI96IHVwKC86J0wYmXkzdzfys44x4e+rGpFR//67u2Y5VowC2ZoKbovEuxqPYgTZyhu5uL7g/v4rRYfKK06Wmh1foCMq+ChzMCIJ5AkSIOCo3mbCUAPDUqKXuxHeIC6apQ7zaAqUBLLscgBEuHugywIAD0oYR5pO8CN13VijJDR60KghxL0nKZ8Xxu+e2KAgR5doZYg6pMIaz49udFcFdLbhYBbC+oe3QelIlySr5MYvOWWm+LjgZCxO2maeYNdZG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d17133-584a-4940-b8a5-08d7590fc51c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 05:54:16.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdygqKnUaOp26tpZrbhiyvUGfwrQC+tzFj1jRVUDPHnPgtWaZH4SWX4EY5OjBpJHVlGXIuw5pplZfv2b24Y99Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6557
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
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi
>=20
> On Wed, Oct 23, 2019 at 03:29:49PM +0800, Shengjiu Wang wrote:
> > xrun may happen at the end of stream, the
> > trigger->fsl_esai_trigger_stop maybe called in the middle of
> > fsl_esai_hw_reset, this may cause esai in wrong state after stop, and
> > there may be endless xrun interrupt.
>=20
> What about fsl_esai_trigger_start? It touches ESAI_xFCR_xFEN bit that is
> being checked in the beginning of fsl_esai_hw_reset.
>=20
> Could the scenario below be possible also?
>=20
> 1) ESAI TX starts
> 2) Xrun happens to TX
> 3) Starting fsl_esai_hw_reset (enabled[TX] =3D true; enabled[RX] =3D fals=
e)
> 4) ESAI RX starts
> 5) Finishing fsl_esai_hw_reset (enabled[RX] is still false)
>=20
>=20
Good catch, this may possible.  Will update in v2.

Best regards
Wang shengjiu
