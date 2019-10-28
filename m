Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745FE6D89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 08:49:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471n1M2WQ9zDqfP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 18:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.70; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="UiyCZN+G"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130070.outbound.protection.outlook.com [40.107.13.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471mzP6gxHzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 18:47:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5s6FYE6vH5liyocQfY+b8dKkKH7lG/7jjCNRcgvDUSYQNLveMrk/0KBQWQRGmC/bFVkmsnchcp3VU00Wzl4Lsi9KYRt4ERLmLoaF/tgtmbHdHXjh1W52D6ME/9UD/W0jCeORQ8TECEa9MTKnEeryf9Br0SA2rQ5BXuvTzoj0vfN7JwXJkuXXgxLaGffC4IehCRoEjudp5WqmOrBstgEcFV7qHxetpuUBnKPx9Lz8rZklo/XIEA/POMiKoWZD7H0RI/mDbEBCUrIAgT0IiD87HH82P7EIKTPx3AEQKI5ZBVDUo1pnCFIC1qQX86SqrrUCiEt6CM2UdxzT5Zy20eO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh+MnHDOR6FKVUKWefs3YTRv+AL+3LYegFZgSqg3dmI=;
 b=FKIlYdBcDVbnlqPCDLaBFS6seYCDGkZGGWHbWI7sVENtDMD1gJ1iksA0Jb2+MLPr/91Om5j0eG7UVWsedn+SKkO+eVPkZZ5ODRWNliIPaPKQPc/uyAxpgVcIOlQ2JI6sCr7iB5fFJsoqaVg9wdSy06zAiDalolU14Ev6JnkPuZwNt73O2rTuQLSXPZDhvh00Fyi/R8h4/pqBbIymrDNuem3NIYBf5TpC+h2w7QwD3iyfzm1S4H6iEclOABqdZ4DXNYeQwW8dbPPKl2N2hBw+ty4+71T1dNgynnvwRhvHt1OMzd1w44D7lek8HIknnyovjLWlcowc4GjHOPYIwjBiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh+MnHDOR6FKVUKWefs3YTRv+AL+3LYegFZgSqg3dmI=;
 b=UiyCZN+G11opAVJJ/W3Ss2rvoGBUomgXr2qplSmZuFrhoAWMKRpTdxQr7QgPEmSQXpcMneOOKfnmB++Lf9YgtllescFzi6J2fUG8dYCcPxvh1x8m3RAQMdxXSGnu9BVbwrwdL3/QMEjG+sD5QYf6eay3VKljuAmgM4vp3D7Xivs=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6430.eurprd04.prod.outlook.com (20.179.232.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Mon, 28 Oct 2019 07:47:51 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Mon, 28 Oct 2019
 07:47:51 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V2] ASoC: fsl_esai: Add spin lock to protect reset, stop
 and start
Thread-Topic: [PATCH V2] ASoC: fsl_esai: Add spin lock to protect reset, stop
 and start
Thread-Index: AdWNY/owwLufHxxAQSqOpSi0OV5oBg==
Date: Mon, 28 Oct 2019 07:47:51 +0000
Message-ID: <VE1PR04MB64794BEB41E8A3DB9C7AFB10E3660@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f447758a-d31a-49a2-47bc-08d75b7b22b4
x-ms-traffictypediagnostic: VE1PR04MB6430:
x-microsoft-antispam-prvs: <VE1PR04MB6430C62ABBBE33A1A767EAD3E3660@VE1PR04MB6430.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(189003)(199004)(2906002)(305945005)(25786009)(7736002)(74316002)(7416002)(66066001)(229853002)(52536014)(6436002)(4326008)(76116006)(64756008)(66556008)(5660300002)(66476007)(66446008)(66946007)(8936002)(55016002)(6916009)(9686003)(54906003)(316002)(6246003)(99286004)(81166006)(81156014)(8676002)(1411001)(71190400001)(71200400001)(33656002)(14444005)(256004)(102836004)(7696005)(486006)(6506007)(186003)(26005)(478600001)(86362001)(14454004)(6116002)(3846002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6430;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d96KwWFhzAkrV7UqcWZisV0YSdWxS1LCA38z4vHivyAm7dZazowLYJ3mI4QQ+vDRbojkr0zCDq4GV7EWsG119Cnr/BxmnX5Gb26HHUwsZx1C/3To0ajQjmiSenkNvGDiMU5ihwe66PyyKtuUN3sDdtGydR5/VB+ZuhVA4SXWJp/PpH4YBb0+MQWcUdUSCAmH5sGklj1CLx8mbYAsRPqNnDFBqVCucGt3KDD8S9gpcLruM3QPriC21tYLeCuq5X9YqUNR6mcLxnLTCLmiXyw7uizQqP7n++FMoXaMQ1xnm8dSMNT7+0nBMx8HhjCxvBQwNTUS73UpuTna1Hp8eVuImSYgx8EWkAZn/02Xx/mVI0FtoC8gCjzLlpse60z3bXj40CSAoOEcg3dKcIrMTcYNZa/nHGyTrmjv9sdgva1mE0fQXbu47No1cnL1Lb1MH1BT
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f447758a-d31a-49a2-47bc-08d75b7b22b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 07:47:51.6530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3lf0gtxnJQQ/k7s415xoPKpweRgrhcqH/dNZW6jDajznrKoLOJgx2ll04mHJMmKmvtFOhZ+a1VDFL4SH+iQ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6430
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
> On Fri, Oct 25, 2019 at 03:13:53PM +0800, Shengjiu Wang wrote:
> > xrun may happen at the end of stream, the
> > trigger->fsl_esai_trigger_stop maybe called in the middle of
> > fsl_esai_hw_reset, this may cause esai in wrong state after stop, and
> > there may be endless xrun interrupt.
> >
> > This issue may also happen with trigger->fsl_esai_trigger_start.
> >
> > So Add spin lock to lock those functions.
> >
> > Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after
> > xrun")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> Some small comments inline. Once they are addressed, please add:
>=20
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>=20
> Thanks
>=20
> > ---
> > Change in v2
> > -add lock for fsl_esai_trigger_start.
> >
> >  sound/soc/fsl/fsl_esai.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c index
> > 37b14c48b537..9b28e2af26e4 100644
> > --- a/sound/soc/fsl/fsl_esai.c
> > +++ b/sound/soc/fsl/fsl_esai.c
> > @@ -33,6 +33,7 @@
> >   * @fsysclk: system clock source to derive HCK, SCK and FS
> >   * @spbaclk: SPBA clock (optional, depending on SoC design)
> >   * @task: tasklet to handle the reset operation
> > + * @lock: spin lock to handle reset and stop behavior
>=20
> Should be "between hw_reset() and trigger()" now.
>=20
> >   * @fifo_depth: depth of tx/rx FIFO
> >   * @slot_width: width of each DAI slot
> >   * @slots: number of slots
> > @@ -56,6 +57,7 @@ struct fsl_esai {
> >       struct clk *fsysclk;
> >       struct clk *spbaclk;
> >       struct tasklet_struct task;
> > +     spinlock_t lock; /* Protect reset and stop */
>=20
> We can drop the comments here since you add it to the top.

Here is required by the checkpatch.pl, so still is needed.

Best regards
Wang shengjiu
