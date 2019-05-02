Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CE11652
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 11:15:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vqNp576NzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 19:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.86; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="o9vUcqTY"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20086.outbound.protection.outlook.com [40.107.2.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vqMN43BDzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 19:14:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No6VOHotBjroEzf8XP7A3n+Gq2eh8H0kmMwc0LpTHSU=;
 b=o9vUcqTYFC8/VTf+u8BVivoxpZFwvpHbUEy+IB3khnDKi/tvR1j6T3ppncRXNQ4frTSeDK8KtazXudIvBoxnawdmM0O9SYVAByhEcTHIhf7wsWdWj5T5IxqaowPvvYyIoHfrAudWJrY88l2oUi9ehSYdGPZ4+4aH2KaHC1C0h8U=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6671.eurprd04.prod.outlook.com (20.179.235.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 09:13:58 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 09:13:58 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Thread-Topic: [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Thread-Index: AQHU/WmQi9S3A4SFvU+3BSdrbwsfSKZXJceAgABrFmA=
Date: Thu, 2 May 2019 09:13:58 +0000
Message-ID: <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
In-Reply-To: <20190502023945.GA19532@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [180.155.251.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 935e1227-1c19-4f41-cb84-08d6cede8263
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6671; 
x-ms-traffictypediagnostic: VE1PR04MB6671:
x-microsoft-antispam-prvs: <VE1PR04MB667147118A8A339FA0792780E3340@VE1PR04MB6671.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(71190400001)(9686003)(86362001)(6436002)(6246003)(71200400001)(25786009)(64756008)(55016002)(256004)(7736002)(186003)(8936002)(5660300002)(14444005)(33656002)(74316002)(4326008)(73956011)(66946007)(99286004)(81166006)(53936002)(81156014)(76116006)(4744005)(8676002)(52536014)(476003)(11346002)(478600001)(486006)(66476007)(2906002)(6506007)(305945005)(102836004)(14454004)(7696005)(76176011)(66556008)(6116002)(229853002)(6916009)(66066001)(316002)(54906003)(3846002)(66446008)(446003)(68736007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6671;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rxlTSIfnfEs9KYzzMCRtzGGaFuCCeLe4VKmpgoCnmhV0YjNIQ8//x3lMORRldz+IXhV05ixQnCWO0pJbulF2MrCgXI94NuALTTskwZGnXcN2GS34HqQnXABfuK9D8Nj/8pvpVadCU9vfQinyU8CgWBBZQZJ1vjfIw/uNjKcEue1s4f5rJZMmArxa0DlXFHs2FT3cYHq5CnoPFvBVE7biKbHgbrp8yEIHu0Hd2fqI/Bm7o7Xl+sufhVBrBv50++oRPeNO5bqKaRMAZdEiweV+kNczCIwCO+bNkf65RiTnfs5v6qeQFuLlKe69FzI4sk1KwS4ruOtFWbxUpO9JrDRWb10kn2SR3qyGmY5PIV8IeJCStweUu8PVbkAsEJ4usjzrPp6nFVch+QwhV9WmEgn/mA0BMIWtGgh6k9i5My2jf3g=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935e1227-1c19-4f41-cb84-08d6cede8263
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 09:13:58.3942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671
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
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark

> On Sun, Apr 28, 2019 at 02:24:54AM +0000, S.j. Wang wrote:
> > Add pm runtime support and move clock handling there.
> > Close the clocks at suspend to reduce the power consumption.
> >
> > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > fsl_esai_resume is replaced by pm_runtime_force_resume.
>=20
> This doesn't apply against for-5.2 again.  Sorry about this, I think this=
 one is
> due to some messups with my scripts which caused some patches to be
> dropped for a while (and it's likely to be what happened the last time as
> well).  Can you check and resend again please?  Like I say sorry about th=
is, I
> think it's my mistake.

I am checking, but I don't know why this patch failed in your side. I=20
Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, al=
l are
Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/broon=
ie/sound.git.

I can't reproduce your problem. Is there any my operation wrong?

Best regards
Wang shengjiu

