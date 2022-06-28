Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D055EC6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXXwk23h9z3cg7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 04:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=s2b/sgaO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.13.48; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=s2b/sgaO;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130048.outbound.protection.outlook.com [40.107.13.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXXvw4wfGz3c85
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 04:20:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdHGCVBORuLj3aBGaI6x4fZ/i2u+ML3UzftFgqgkv5X6/ToR/PDZ2jgHW6elXPkps3Pn/epHumSiY7h3SdyvSrBiDgV4RskgVN4SQh9Ji9eaINE4OMX9J5Qp4A3xS9hP5C5cetnM5A0wPhVyuliwriX1KNhFIWIZAhvR/CGzH0DAlTyKhVkZtBmWIdevgdnRFZDDu68SyPNtWbIppFwEAZUQHKQgSDYwVv+Y0ZobFFHCaapJy8UmwH5kH6q5PPS/Ol4PKWtEKCDl8HFIWy4Eu55jALLhWU0xw11QvfCiRphu1rDKgyt6sZ9B1aY/EMJH2/BHElCeQ7IQIJezOuoR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/nnLlNN5pC//rNUAbZlsSSI2kjE9ztE0lckTvk5M64=;
 b=iM1aMW/0PPQ/3p69y8V69BG/rb0ZG+MIAt3rNUhQskkpy/LctHD36J90kC1yvHdHWwddL2uWj7PtrZYKXhQ5FzLNi0ZKcGS0hBb3mhEU9PQf3FfUeXC+0I23AHOiFgF2PUl7uhV2ybberu0MZtAR6MS4dTeAInti17HsYdiLutAks12lkIipbCGHykzIBmOaBo5oeuZlAnjaI5yaH3Z2o0fgUh0qyY8DmZaY+y1nC1k0+slZI30tNorpJ5URPLVTCPUZk8rH9millkYNbhc5Qf99mqP14CRslH8liWPqGT51p0NlJtJ7PkcdldtYn866pedRHvcbjKmBYF6fL4wKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/nnLlNN5pC//rNUAbZlsSSI2kjE9ztE0lckTvk5M64=;
 b=s2b/sgaOEmJ8SoW7uChNuhOZXcYODepc2yI0tChHeLsKlKDzj85PiW8JQeKwXpmmpCEzCIVthvInW3KTheZAt+qMxfP/8G+WF9gTxZSyOmvWtwz2eTsmqNufZisCIWhNNA+QmIOLuDSyJwK3kzfEWGvjgNz+hdtGuzdFsFKqWhc=
Received: from DBBPR04MB6298.eurprd04.prod.outlook.com (2603:10a6:10:cf::14)
 by AM6PR04MB6613.eurprd04.prod.outlook.com (2603:10a6:20b:f4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 18:20:23 +0000
Received: from DBBPR04MB6298.eurprd04.prod.outlook.com
 ([fe80::294d:36b8:425a:db27]) by DBBPR04MB6298.eurprd04.prod.outlook.com
 ([fe80::294d:36b8:425a:db27%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 18:20:22 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Michael Walle <michael@walle.cc>
Subject: RE: [PATCH RESEND v2 0/7] soc: fsl: guts: cleanups and serial_number
 support
Thread-Topic: [PATCH RESEND v2 0/7] soc: fsl: guts: cleanups and serial_number
 support
Thread-Index: AQHYSAplPI3pIiFNiUa1bxyOdYFHw61bv1iAgAeVwICAAlIiAA==
Date: Tue, 28 Jun 2022 18:20:22 +0000
Message-ID:  <DBBPR04MB629889078724FD72E49778B68FB89@DBBPR04MB6298.eurprd04.prod.outlook.com>
References: <20220404095609.3932782-1-michael@walle.cc>
 <0bde7550b0bbd1b0a478139d296f92a2@walle.cc> <20220627065321.GA819983@dragon>
In-Reply-To: <20220627065321.GA819983@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 182ba0d9-17c9-4cb0-d095-08da5932dd7e
x-ms-traffictypediagnostic: AM6PR04MB6613:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B23f0Epdf6tGLzkpJzFlEzMp/9IGSY1sn8c+1BOqmfca/3VS2lw/WNXVb4gc6DfsWHv4A28kxC6EkDAN51koWk6zSzrKc8eaN4rgufWCOFWW1ruARAhBrazZBzUOdjAahAa91ZJpSI2pBNLugcSW7N2Fp2Hy6fv4zi0P1OtyorWiVvmXiGmRjw8szmvfPuc1SnTc/vWCHesRhUzKQ/9KpRgiFX6avGRro7nuqc3HGNSVAj+2yIJOltFILjQlEfiPI+4GBq5m6qPrGt+fHlfZ6AHPfP//1RQRWR70eyBviI9Ak05vPpctinxEYPvoRo5NxLB06jROH/G64mI1jqnEGGBCYU19U/qrDcBe8bQAoy9N0r21Y+x6ZoR8XjAmT0rBYsZyAUMXZ1w1yQHzzh8Eql4kjZfe3bRFkfzgrSUjGz1UWPBZ4UD6aak/f7Ks+9a/BQ7KfqTrOnV17P/uXO7zJEpvstgSBkKcW/e5ntE/G+AewkElsp/okmM5YYw5j2otOTQZeP8BnY3F1lO9tJNgKnOa/pRQi6tVbSQ8tBJ68loEUVfwvOOSkR5MZ2+soKbPxNGBSpZGfC7dchsxVYV4nZqC3IG4N1yJfbXYO4KPpvd5JaH63BDkTaem/p524u1OzqtKB+cr0g8Anu4C13LLzvNvuHKCYZ9R5w+T7KO66yDPKL2xYrpgKbW+OVQFV7srcXs3mnFHsICTDE0vVR7IyfesNJjSTVjacJDydi921Jnuqh1isC4S9hvQ+Q9FhQGJB9F0pkYkV96/O30oFVXNNiaVfwTPC3mmtjCUnfjTbqA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB6298.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(2906002)(7696005)(86362001)(41300700001)(71200400001)(6506007)(8936002)(38100700002)(186003)(478600001)(5660300002)(52536014)(83380400001)(76116006)(66476007)(122000001)(26005)(33656002)(66556008)(64756008)(9686003)(55016003)(8676002)(66446008)(54906003)(110136005)(66946007)(316002)(55236004)(38070700005)(53546011)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?1XX8shSPn6cCqFHwjkgooFmUOgojdivnyZZowQcV6MBy488zok4NNevvhZ2X?=
 =?us-ascii?Q?nJxUBfPTFq9o9OmVoEpJHPCBPVImFC+Wes+JYpljo6xQVIEgTNQ06S7eGLL2?=
 =?us-ascii?Q?WpGKO5RSpVmuajIQ8Wimkr71yPb+8piw8nNUH4JvByyJs/aYAlIRXtutEBfW?=
 =?us-ascii?Q?kesrhPLxTZSiDN+Ng0vSGapcPbOunYFU5uWhaLuJSsgY3EQD7Sh0X3/NSkz3?=
 =?us-ascii?Q?2qp149WvNnq/bQWZ3AoZz2+/SH3maUuQkDfcPTEgX9eErZc81EDZhZl8P1Ge?=
 =?us-ascii?Q?TN+R6nXHE6HmQ/Nm4qOgggxeZsUEu3c8+wB7f9RjFme3DPK2cZb1IL0/BpIA?=
 =?us-ascii?Q?JIp+9ChrH6cMU1M2ID/S9y+q/18ojLEjq2z6RV884JK7oUfzAt6KyZITNz74?=
 =?us-ascii?Q?RimuvnsskNc21ubSGThOcI13N2UBalBLbkI02Y7lGiCpDIFE+QUpAH/+HotW?=
 =?us-ascii?Q?ko065dqItH13gfp0iefwNncdfmuMAhJLItKFq0Quock+ClHAFkbBXRw0g09t?=
 =?us-ascii?Q?RfdowmLqMu0Wqgbch09tmq6r9GQJRaWTR5YxzBNaHiZFen/oQhDqMHRyKhd3?=
 =?us-ascii?Q?fG5B5dVZJpYAxoU2m2ww93xNSOeXqEjzwlIZCccWrueUrTybPIHsXcOuIMXz?=
 =?us-ascii?Q?6fPzcH6JmIAVNKr7g6jaQY5YOZGPfRCk3d36sfeuG+VDAwSjjVNTj+3xjpqb?=
 =?us-ascii?Q?vwU+XqQaTyL3RWmq1EsCEBrgZt7YxQU0ofjJbzIPcIZFrnx9C0CpyUoX3bst?=
 =?us-ascii?Q?x/DDClRqfpCBmZOEAS703oPnuHrV2l0Spwi+xgcILEFza6JTaJqhGirR1by2?=
 =?us-ascii?Q?LIUqpnyIrn+il8LdvquYXgeLXigRXVplW49bl9fDeQ87wVHcmGw0s/tCrMvt?=
 =?us-ascii?Q?hB9vkIyDlNv7cVptxifacq8xpjcjLILRJddFJmjHKBGQV37epilJuyw9kR11?=
 =?us-ascii?Q?Ja3SKGpWSg88sCdrhBnaz/3wtr7NPe8PEFfxtwKThOdOrEqEZ4B6aXeKgNA+?=
 =?us-ascii?Q?NP5lse8PlBAftWgOhgK7FqXys3Rp2bKvAAMqYrfhfNrNKDykjUnmd8j4bkJy?=
 =?us-ascii?Q?bvb1pAgji98sdqfzJ8DF+G81wZ1mDrneXjG14dRAyLVe/fy2956Ig9B4GT/3?=
 =?us-ascii?Q?irFvItQ7AlqmprNrhcNVJKdaYchfNxsXnbHQqe0QIYoYSQoLYwmsfEwy6wCM?=
 =?us-ascii?Q?GKoLYYXJCemaFM/uK3QSEImcDr9fo6fyJAweATU3pooRtcIxJk4JSTD9Egr6?=
 =?us-ascii?Q?VsQZIRrm+XYlXmYGpXGtVQasJEsVny0swRIBf9aNFmoudUxBkNPybusduHlY?=
 =?us-ascii?Q?OAyW2W9LB+0FQqB016PE3jfwJhGm2EysBoA5f36pKhR95A0vIcx1ea9cRuND?=
 =?us-ascii?Q?YwIEyYLAZxZlh94d/FWvn6r0lLyBorDS58htD8Fvlj31zjtJn3UHGDDEmM73?=
 =?us-ascii?Q?X45ZU+GeLBEO/0bFUoj6YFImOCR5iyFDmyyb2Y6gJWlrRxjlvmNP4UHVZSkg?=
 =?us-ascii?Q?n9lnH/8ICAdTDGfou4MTwE2vvO5WiYmajPtS0uSEYVrJF7FKhGOeho+LVUdG?=
 =?us-ascii?Q?ClwO2qZ7qB9ySYtsv9ewCJWuNftxtmpHA08rV9Hv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB6298.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182ba0d9-17c9-4cb0-d095-08da5932dd7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 18:20:22.5190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPDD5e8B//Gk/fiblkatViDFJMIRs8J9XwMyXCCIjNJrus5a5k5MR/Dmx/goRpLhOCGTLWohgKDwdxY4SIXp5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6613
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Sudeep Holla <Sudeep.Holla@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, June 27, 2022 1:53 AM
> To: Michael Walle <michael@walle.cc>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Leo Li <leoyang.li@nxp.com>; Ulf Hansson
> <ulf.hansson@linaro.org>; Sudeep Holla <Sudeep.Holla@arm.com>; Arnd
> Bergmann <arnd@arndb.de>; Dan Carpenter <dan.carpenter@oracle.com>
> Subject: Re: [PATCH RESEND v2 0/7] soc: fsl: guts: cleanups and
> serial_number support
>=20
> On Wed, Jun 22, 2022 at 01:03:33PM +0200, Michael Walle wrote:
> > Am 2022-04-04 11:56, schrieb Michael Walle:
> > > [Resend because of new development cycle. Shawn, can this series get
> > > through your tree? Sorry you weren't on CC on the former
> > > submissions.]
> > >
> > > This series converts the guts driver from a platform driver to just
> > > an core_initcall. The driver itself cannot (or rather should never)
> > > be unloaded because others depends on detecting the current SoC
> > > revision to apply chip errata. Other SoC drivers do it the same way.
> > > Overall I got rid of all the global static variables.
> > >
> > > The last patch finally adds unique id support to the guts driver. DT
> > > binding can be found at:
> > >   Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
> > >
> > > changes since v1:
> > >  - call kfree() in error case, thanks Dan
> > >  - add missing of_node_put(np), thanks Dan
> > >
> > > Michael Walle (7):
> > >   soc: fsl: guts: machine variable might be unset
> > >   soc: fsl: guts: remove module_exit() and fsl_guts_remove()
> > >   soc: fsl: guts: embed fsl_guts_get_svr() in probe()
> > >   soc: fsl: guts: allocate soc_dev_attr on the heap
> > >   soc: fsl: guts: use of_root instead of own reference
> > >   soc: fsl: guts: drop platform driver
> > >   soc: fsl: guts: add serial_number support
> > >
> > >  drivers/soc/fsl/guts.c | 219
> > > ++++++++++++++++++++++-------------------
> > >  1 file changed, 118 insertions(+), 101 deletions(-)
> >
> > There goes another kernel release without any comments on this series
> > :(
> >
> > Shawn, can you pick this up and give it some time in linux-next?
>=20
> Okay, I just picked the series up to IMX tree.
>=20
> Leo, let me know if you want to drop it from IMX tree.

No problem.  You can take these through your tree.  Thanks.

Regards,
Leo
