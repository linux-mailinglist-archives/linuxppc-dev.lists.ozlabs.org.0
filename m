Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E069248AE3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 14:15:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYB4q5PvTz3bPT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 00:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qoUr+cpA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.47; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=qoUr+cpA; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYB400gr4z2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 00:14:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4LeU8Ysfh4BbqeebLsktk6ytdvL2OGTSDa748mvlgxW7hFkV3tgP4HOSgWZiTkaawllhgJr0exitc87uBQJACcvuGWNTk5iTrst8YCXiZgbwj/TwLNaliH6fdxbHVWT3OIMRycraPrtRV08ihtkn2Qo2K6TD1E5gGPy+mbwj0mVhanOnJH7INFwXauHSIBy4/vIbkBn5Zi5rQFtcPqsbZIl8JEPeNWGtzvcWR1zy0ErH06urO/g+85TZsYrB1gffnO2cokZiwRMtBrIOTaaRkjHS+uH/1UKmaJl+kvFpFBf4ETyAVSr2SXvn8/sF57HScqY7XF5fDvg4AWfHorQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtT/yqQWs6RWrXbBUqML/LkGZmsvQOUBxoQudH45W6o=;
 b=cSDHcOCr/BEjVZDX/UEW0BK+bRm5WJlZhUrY6fcLBrqRmDLn+OUe/YCJKehedCe7Ic5CasojXSWCgjqPhsIeX0YXlgyu5YEpfKiX527Ro0hYC5dFzj9mBWmnS7L/atLFV+AnnwVqriZoA27i+Mr+EXbtH/Id7fK5p+yzKFE+BHzkmEKfHosBFGi4irBx6abcuRJg4BkI9KN/fJhVZJREzm0p47WeQqqOhV6QfBMfC3EhuWoGNkPAu8ujWV5Bql7kWrlDHMXVXOPl5PVW4BSoRhuFKg+7Aum8qjqSRH4+WePtDBcb6t4bo3JPtrBjJjIDBV5UR2jaO2JigudMlkx5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtT/yqQWs6RWrXbBUqML/LkGZmsvQOUBxoQudH45W6o=;
 b=qoUr+cpAjBHBCVX2MaBzZVQRVOMt3evz5f5Tri71FosNHGTHwbLdnQVN4ou1sQc1d1rQ8Wje4VDZKeiuLlxwKtpCkmX/QI7kMIKuiksbjZRnJ62F1AXa7O2dwar388mINeEj4J3RLGHUBB9Da0s0V7Hx6Rfqie2n4yQbgZS0SHQ=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR04MB3200.eurprd04.prod.outlook.com (2603:10a6:802:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 13:13:56 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226%3]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 13:13:56 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Thread-Topic: [PATCH] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Thread-Index: AQHX/WognYLuoHin80+YgXjEGjdBC6xK/32AgAAG3gCAAYlvgIAPYBoAgAHvc4A=
Date: Tue, 11 Jan 2022 13:13:56 +0000
Message-ID: <20220111131355.djuyn6bbirqtsama@skbuf>
References: <20211230104329.677138-1-bigunclemax@gmail.com>
 <20211230130003.pzwzac5xttnnksz6@skbuf>
 <CALHCpMg8ZeQUcbA1EeUpXMcay0u=QZfnZZGpPb_HAXJeHoUQvQ@mail.gmail.com>
 <20211231125247.ugne3h44pmpzliin@skbuf>
 <CALHCpMgO2bqxPcaxwg29gEGF4te1HCgCa7SdNFVoxa6JDzrCrA@mail.gmail.com>
In-Reply-To: <CALHCpMgO2bqxPcaxwg29gEGF4te1HCgCa7SdNFVoxa6JDzrCrA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc0235c1-f62d-4e45-cf78-08d9d5043927
x-ms-traffictypediagnostic: VI1PR04MB3200:EE_
x-microsoft-antispam-prvs: <VI1PR04MB32007D0040B4CE8E3E6F41F3E0519@VI1PR04MB3200.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0W8TrSp2fTGrZO1RV+rf4dUUUJnp4dAs4teSXUdE6veSpYUVAEwD8X9pkwQRxq8UmpveQ1v80h9zZqwn+cW8uzz0/siaaLmjJbt7Fw7xbi0eFnfUQasUAm3voznnjqLUPZSlIM0xXp3eLfcm1+2D9FZxVnkomF7Cm28YIQcaENRpbZQlRwYCDbamXpnUd/zQi8FI+FMxAOzCPZbwVcEPtp6EowbresQabASjZTQyqpNYhuNoGf06lE6Sd9uPVnTsALYispUd6YrSpwEC+iTOb4rN5QM+uVlMPJPh7sRFJt4t2KSx54gQ1vQvIZUJtAaXw34e8x1I6y1NIDrS3BEL+uPTWuk6Ad1MLFGqaDY2Ys48UvJygKYAdUXfG8vVAYsZAJeH0Y3v+IAzq/vBAVBoWqbNhwcZ9jHMBHujMeS8OJMHQBhnLAZiLEGLDaztrVPeFbcXwK+0fAhwVZp2xAJXcf8n2uD/BJF0A5nT4f7iuSeM6XOMaJPOutrxXzU6GmZ2gVWbQPYJmWI4a2w8a4p7kGzlcretaRuxp2NLMJv/eziGGexpyb+qNmYvgtibPD6A+TePSiLuNNTUvZ6CXxs/di8OSSUqPcIAY5YVwvyW/MA/sdz4ZuJW1hXlNKMUhzQy4HN/psa6lm6IbRYlUxWkPOSKc9V+LbMwkb4bxo3exDqJRV6Q4MhzHcC0FPmWxjlrNa1er9ygGw/oFv+jsv4x7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(66476007)(2906002)(54906003)(6486002)(508600001)(5660300002)(6916009)(4744005)(66556008)(316002)(66446008)(64756008)(1076003)(38070700005)(86362001)(4326008)(91956017)(76116006)(8676002)(38100700002)(26005)(7416002)(71200400001)(122000001)(8936002)(44832011)(6512007)(9686003)(66946007)(33716001)(186003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YARafaFnTL6IXIVAo6NRZbtzywHJTIgqGmR+NVwddI/fZxDV3umr6zIdSCdz?=
 =?us-ascii?Q?+00KmDRtjby3+c78eUxN9KcDsvonWs9uOf7KMUIvsPwxHzyngIlFoHOmHShw?=
 =?us-ascii?Q?bA3op73+92kddPdZ/cnsaDeZBfEXzXSOXly00mxyvDfGpqArkVqYLhUq9U8X?=
 =?us-ascii?Q?2aq6esy0OtEr9vzXnU70q7rdo6gG9QXcCKDz3spxd1tphZJnTIZ3/Q+0dBB/?=
 =?us-ascii?Q?eadFlQWrxy9Igfhsfc6zBcY9lVnORkq+bAmAxYuyuKQQbSoskUiZg7vGGmBB?=
 =?us-ascii?Q?of5IyEemlp4SuToU2wLYBLBlmIgkQiukrYvO3F+SeWEjNWOh2eQId+fVfpb3?=
 =?us-ascii?Q?kWwzP4xCVdjPDQRE350RZtmVgUf9aJ0DLq4QFkhhozjouS6NVisS1hhRvxVi?=
 =?us-ascii?Q?js5SgShlrSCIM+S7O00f8iA6wp2mXa1+PJObg4urKL9fmK9Hwu2uVe1zUalg?=
 =?us-ascii?Q?y61gBx4tfP7UBdChvvRc2j5Rv3tzdTNGSthjIWZe5rSOVN012jx6//M13Wgk?=
 =?us-ascii?Q?YMWj5G0meeHknWbR67U43NHG5XOxrneYx7jlEPrWLsTHMgxKARk7q60OqsCY?=
 =?us-ascii?Q?soIDWCHNRpamkoSfaxXoc0QRYOoIXF6JQoLLffOM/Nm40nNwWGIp717hD+W1?=
 =?us-ascii?Q?mlRBQEPZTAiqzDsjRlRqaUWeR8qvvzrHt9TLtI7VQRxzK6kOm/hVXFXJX15D?=
 =?us-ascii?Q?FF0Fs7fP7VeA3rE48imsVYG2Gq0YScUtgG/TwtIZe3i20Tl/srj5P/J1FkWb?=
 =?us-ascii?Q?12Ha53m1ajPV/Y6WrAvzUHAA8UmBgI+zK4wzfWk5rGjjmB4CqZHpSM1YydEU?=
 =?us-ascii?Q?Ai/oLCvZ7vXJs+BxKxVSt/hHZ0lF3G0a+ONmga7ijZB1+1H5aaQboMy6qlZp?=
 =?us-ascii?Q?n1Pdv7k5hVe+qFja/KhN97O5xt8csXWAZzizVQgPnyus1d77qtsHY4AZzu0k?=
 =?us-ascii?Q?2k+jNYa1Vkc593g1zf7ZtCjxsX0PaddrsNUoPfoDNTuDssRf+7rEXKzkrF5w?=
 =?us-ascii?Q?Ti/w1vP372VCb4ZU6IDnwY35e2xh5k/c0jnMja6DzejIkia65/Ea18fZz/Hu?=
 =?us-ascii?Q?Xiz0dI9AnM2yQy8pod4Yuq0ITOTiz4ShctrP7A1P97X8m1sjb1AxKpmQ6cDy?=
 =?us-ascii?Q?cD48IAzzMwIwA3TrSfIEUyIIVdSZVIAr6m4ENNegYkCGhVKwMqWia/CUr7Oj?=
 =?us-ascii?Q?iCMiGeqFjSSyljKpHplpY8MzCwIiJnHJxfpa4OcGglaPU9QBSrcycpc5CxsH?=
 =?us-ascii?Q?XNFWJxk4saATMpl1AMyNZro8/Be7JgBX5610c5FQ7klqCaV9aeOnQ4dIJelh?=
 =?us-ascii?Q?fCLHqpHBBKf45c62s0FTpcSeYy2GJmvORvHC8QhJ9a5eTsD9pJS62lghEZ2/?=
 =?us-ascii?Q?hUdSwR8fZ/upFrp70KHe2YeICiz63D5Bq+8/gKb2nKrHDcLuWdweXpOeE4UW?=
 =?us-ascii?Q?oAUXB7ifZtQuLjMtSnZsouKwsPo/5xaqwfLoYNxKahnKjD7Lber85YBFPnuQ?=
 =?us-ascii?Q?FB2LgnoNEezwxGJiv1G/vihmtymoMoXjvuTWvelrd9UYocxno5tNxIrefkWe?=
 =?us-ascii?Q?sdCfPsDquz8v3VqNXYjPjqfsSp9Rg3Ex1E4iD1DvMVpKfpKuL8Z1zrU8yb1w?=
 =?us-ascii?Q?GyUi6DNoAllhsQ7R9tdzpUU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <714CD808197DFB4E9FE119FEAEC09384@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0235c1-f62d-4e45-cf78-08d9d5043927
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 13:13:56.4506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYGtmY50bnACm58INtHaVYSuYqskabTbuCzD9kTT8s85vVMMj5HBJI4c8Oy+o7wPZVbZoOrQD99o4Pq6KyATNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3200
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fido_max@inbox.ru" <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Maxim,

On Mon, Jan 10, 2022 at 07:40:38AM +0000, Maxim Kiselev wrote:
> Here are photos of my boards.

Your patch is OK to change t1040rdb.dts, but please preserve the existing
port mappings in a new arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts file.

You will also need to modify the /model and /compatible nodes of the new
device tree for Rev A, something like "fsl,T1040RDB-REV-A". Take a look
at arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dts to see
an example of what I'd like to be done.

Thanks.=
