Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B270D7EA835
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 02:30:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=EDVSVpxQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STpf04dTRz3clw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 12:30:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=EDVSVpxQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:2019::700; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STpd41Rnkz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 12:29:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G505GG13BcqpgljaW3WG8qpDUjqrY7X+MFqFCYZDKEoXxfnPcMS9MgDm+uqJfAfuZvOMuar9wfGbxVP7cfd91cIHhbxaFSGsOXN40D/NVAhNfLWtXkWiV41MDb/WdxI6oA5uXWzGAbIO+nD/3u01Ulcg+0oagwIpbxj439HduCwbxJKcCkmlEMPScdhiXP4nM3PxG62mVSI57//QywXvpz31+jKyD+auUT1Wm3HQt/TDozrNz9k9ZoHcNa3EwJbv2xWpgPuf8lKGRI/49LhC0bM0mrADULBvmMANSEktmrtNMO4mc/qC+yT2nnpLOpVZwo5RvkIPrsRxLrbl1JZbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZn9t7wCL6vJb6yuLG/JNgJtpOOCvCvDJxCCRy2GWOY=;
 b=FlQgFCjGzMfw3ahJzJ4psSIjbGz1iKwiwB/P3sWibTuytD19jewnycWygAtFIIbbKBeQ5mvZeIjHj9E4+Rl+/clndbXZTblkRCX3LJ9JRkIeTEwtNjzy8XoVy7sQH7yeLeB+5yvjYdJzWKJvHH0xt1uwuyVH8CTXYRZ1bw17+OpoPV235D5zCkS1fzB6d+oQr0H97oFkQReNnwg9ZyJFQD1TJvxoE6pq85LwhYcOkWNO3IqdL/lCAvDHbre9jAXrrwSirbjl9cbPzlZry+p9dDWLnN1PMqyeJHky08DAYOb/RXlbMz/VI3fYcOzxBw7ryQViYcratQBpNTdTJNeOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZn9t7wCL6vJb6yuLG/JNgJtpOOCvCvDJxCCRy2GWOY=;
 b=EDVSVpxQlt9aNRY+qPJPRdNV11qH0YFtLQeGDT52YdaD9oCp8AMTyPhkWLOOd2TGqaqKahWML6KMlkn4I4e5VdA8ozNo3O4wwQnZflZGT2lT7dAqR9m+3U9Rayk2iUwBm8D6PPXFDrvYgS40/CDLNMFJAVpY1dvEHwV8x5w3JVc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9923.jpnprd01.prod.outlook.com
 (2603:1096:400:237::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:29:30 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 01:29:29 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: RE: [PATCH 3/3] PCI: dwc: Add dw_pcie_ep_{read,write}_dbi[2] helpers
Thread-Topic: [PATCH 3/3] PCI: dwc: Add dw_pcie_ep_{read,write}_dbi[2] helpers
Thread-Index: AQHaFdFZ9OiYX0KtrUmMUQSxaLoFhLB4MciAgADU1DA=
Date: Tue, 14 Nov 2023 01:29:29 +0000
Message-ID:  <TYBPR01MB5341AEC6A301654C95012792D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113013300.2132152-4-yoshihiro.shimoda.uh@renesas.com>
 <tna3a5tn7ikg5vvsqadxrife6cihahsa7i2c6qqfihafxcrwx6@lx4l2j2es2yq>
In-Reply-To: <tna3a5tn7ikg5vvsqadxrife6cihahsa7i2c6qqfihafxcrwx6@lx4l2j2es2yq>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB9923:EE_
x-ms-office365-filtering-correlation-id: b9ffabd5-eee3-4f8c-362e-08dbe4b125d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dcmamSPq7LP+ZkSxd6CM39G0hddqF1Qo/xGKQGYuoQnLFseb3xPxxpxNZ15B+zbAowzFCY+cQ65A98W1Wtvpqb8Cv5pHkAzmD/7LLDDdM6fxoXq2B/sCKvxvqC7I5/hRjlNxR9tl98NvUN0cbCB99BgYszq7/rFdrDXhrLK9EvvD2bbzloRLVvxAQk9nepgexygWv7IgufUf3qxEdNeePoVfngxGPFORcOD5wdo2oouvnnBxHy1HOiRYl9WGixG6sZkRl7yfEsbmIX0cI1WFttHVw5lEAc3RNAanMdTb2mpbzObN9jICpk6UANPCpiuuHljTwy08WHE6Frg62GkB7iY3xSeWdq3z65bytm1Ego+78LgiJdIprkMlRHJkYAoEHIySYcTVxH8MJ//MGS1ep4QdTQwn0ckGh8enQkOWiZePdMm0rWZeIQxB84n/Jz9nfU1WOEagISI/jDrV8f1Wdms43jfNvqVFuyUkhF4n+DR2ljVOQowPso/7tgiOG0gdaSuQtvCYunc3uk67AH38wzhR9K1GvHqQH/N721NeHI6j4N+rhhtCIpEPKn8AgWhl2vnN4IjN467ZIiXKB5+dSviFojktTH3/iOQtghfJkYo+y4BPiPDCgh+vsOADEbZh
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(55016003)(30864003)(83380400001)(38100700002)(38070700009)(33656002)(86362001)(122000001)(4326008)(8936002)(8676002)(71200400001)(478600001)(5660300002)(52536014)(6506007)(7696005)(41300700001)(6916009)(316002)(66476007)(66446008)(66946007)(54906003)(76116006)(66556008)(64756008)(7416002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Ro3O0TbMNoi/Ee9fN9QGC22B08YMkgdisLS/1MN22XiD2gi8LL8oHJc4ThOP?=
 =?us-ascii?Q?kfhjn58x4MNGKjoYqOJaEDVMFYZ2KbesZ5hOt1cKMfXjX8iy5uXSm4coXmi+?=
 =?us-ascii?Q?VSOnaTxdhjRflxcqGsJJ2GrpMwXY9Z1XYkGjAjOQ/fOEcBBAlnzzQ3/aaK30?=
 =?us-ascii?Q?KYuwD4tF7hBPNOXSt2zhFJmCnNluKm73THzXnFEnsWM94CyB9apbeBXp4lev?=
 =?us-ascii?Q?aV/ej32qnAIGych4CcwYjrEohQzuMZFayZsn/Q/BbyuxjJNLLfToeS0sm9pc?=
 =?us-ascii?Q?U2nFc4HB+SxPY7ovwPO/puJhvpDxGQt8V1XkJwXFneAaUifeRWV5+jFJYD69?=
 =?us-ascii?Q?pJNMjMhK3olessP/QhUKHHntagf9odjbXScQ0IohNKzmcU5Gr6OcnhPwzEHc?=
 =?us-ascii?Q?VPUOKZrQeIS7HHBPnzPxArEotXFVTxmoP6HT89szNWzAI32xAx1qoZuOUsZb?=
 =?us-ascii?Q?07emjKHj4k5dd1LjMH2lV2yNjLb/9iegNPX3Yk9CQagq2cnn/i5+LkJpJmVJ?=
 =?us-ascii?Q?i7z8nciJQO5W9JITiiL2ctF9BREUmE4RXCwBV0QdaLvnNFgTc9A0L8X2+KFH?=
 =?us-ascii?Q?xHmUDeTo4vzLTlXVt8MEQxWok7Ehl3nXX31bj8+cGjO730b88b0S6CGDEdtB?=
 =?us-ascii?Q?rMhjFjfdc5e6mqkOmjr4pSq84Bs8oCSh4uE01bYtA/SogKwxBRBFMvlmn8yV?=
 =?us-ascii?Q?bbu292to6c5FMvv9j6IjEqn2+1b7KfdVQbGrOkPChVrtkIIEAjjySLwklccK?=
 =?us-ascii?Q?hS/VJw+2/Vn0gfeyWK7ohCbcCah7xy/W3hngtt/KvXjIFFUVDZdHs8QuDany?=
 =?us-ascii?Q?TmKH5Rq98/AV9BKKdbop1ZY6BKhCJC1fwt9JL803x2cahSaDsV6STaWolGNo?=
 =?us-ascii?Q?eiDfsi7wknoDs2bQA9bfrTDxViymwRFffuTBged+k6VnrqOdsl2D2qg0IvSM?=
 =?us-ascii?Q?0s49DA90gOyOTgaUM+P9jg10iQ7uIA2fOVhLWyb0KFg+uzWQ2cKga/n0uyF3?=
 =?us-ascii?Q?nI5ZJDFiURCe6Rn/rNXDH+QsohyUvmNpezAj70uGq83Gj+1bVTESlEjtGZko?=
 =?us-ascii?Q?RA7MZV4HVVNdQfUKZMLmyouw2CtOkxF2LCQIFZYabnWCKawwQvPt8QsVOL3g?=
 =?us-ascii?Q?6wt3hXDwxNMz+todPFicC3hTzlbEAmd6ZGNN4P7dOCmqbSHQXR0xKOsA+AWA?=
 =?us-ascii?Q?l5I0HnuKMHTW+Tfjb2meJR9iYsV5j98FJNgeo5voJERrm1YbBDyXPaLX63WS?=
 =?us-ascii?Q?/Okbs8Kx/3QWkh//FI+SjE7jT9HpUFZQkQPyNdkAPfQiz2nf1tyc5pjVVhaV?=
 =?us-ascii?Q?iQkoY7rXwyZFd4RfMv9CWi4/+ZrdRzEPAAGWw6boEe7bGqcZR4lA2eM2M8ZF?=
 =?us-ascii?Q?YwxtnEOOIK1J1j+FzoFiFMOzCQ13kJHl00knk5K+MqbBIxaIineYzvRBbvg+?=
 =?us-ascii?Q?I/I8ZOIwOAbXWdpndRZ5LS3tuhTuSkEGH0wffVrsS0DP4g8gHap99+8spBqI?=
 =?us-ascii?Q?Q/W+yr2FXCIWqaR+6fyPeN75A5LOrC+ZLsB1uobb+spVQ5oHUbh3+2MKeEB4?=
 =?us-ascii?Q?Cz7RWwivpGqVeNFiuqlGFHD605l+DwWAfIwJ1zy939W6L8BITSp9TQ6ab5zQ?=
 =?us-ascii?Q?gs5bDbEwSu8AfbU1Gn6zWJWJxEdYg81j6Z22UtadT3dwFNISZLqsdvsaearm?=
 =?us-ascii?Q?NSvQGA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ffabd5-eee3-4f8c-362e-08dbe4b125d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 01:29:29.7984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/kL0EKYeWjCNrgrxIBe6Xz3RlwIfXrIB3cnUXFTNTcXap0OWtwINpPQXfzl0+GV6oiBTxSP4S3zYyKGh4BsBhzu98smuHoG5qZFV3plQIsb74IdXAb6qkaiVyC4iN92
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9923
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
Cc: "kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "mani@kernel.org" <mani@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "roy.zang@nxp.com" <roy.zang@nxp.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>, "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Serge,

> From: Serge Semin, Sent: Monday, November 13, 2023 9:41 PM
>=20
> On Mon, Nov 13, 2023 at 10:33:00AM +0900, Yoshihiro Shimoda wrote:
> > The current code calculated some dbi[2] registers' offset by calling
> > dw_pcie_ep_get_dbi[2]_offset() in each function. To improve code
> > readability, add dw_pcie_ep_{read,write}_dbi[2} and some data-width
> > related helpers.
>=20
> Thanks for submitting this cleanup patch. That's exactly what I meant
> here
<snip URL>
> and Mani later here
<snip URL>
>=20
> Please note a few nitpicks below.

Thank you for your review!

> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../pci/controller/dwc/pcie-designware-ep.c   | 230 ++++++++++--------
> >  1 file changed, 129 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/=
pci/controller/dwc/pcie-designware-ep.c
> > index 1100671db887..dcbed49c9613 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -65,24 +65,89 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(stru=
ct dw_pcie_ep *ep, u8 func_no
> >  	return dbi2_offset;
> >  }
> >
> > +static u32 dw_pcie_ep_read_dbi(struct dw_pcie_ep *ep, u8 func_no, u32 =
reg,
> > +			       size_t size)
> > +{
> > +	unsigned int offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > +
> > +	return dw_pcie_read_dbi(pci, offset + reg, size);
> > +}
> > +
> > +static void dw_pcie_ep_write_dbi(struct dw_pcie_ep *ep, u8 func_no, u3=
2 reg,
> > +				 size_t size, u32 val)
> > +{
> > +	unsigned int offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > +
> > +	dw_pcie_write_dbi(pci, offset + reg, size, val);
> > +}
> > +
> > +static void dw_pcie_ep_write_dbi2(struct dw_pcie_ep *ep, u8 func_no, u=
32 reg,
> > +				  size_t size, u32 val)
> > +{
> > +	unsigned int offset =3D dw_pcie_ep_get_dbi2_offset(ep, func_no);
> > +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > +
> > +	dw_pcie_write_dbi2(pci, offset + reg, size, val);
> > +}
> > +
> > +static inline void dw_pcie_ep_writel_dbi(struct dw_pcie_ep *ep, u8 fun=
c_no,
> > +					 u32 reg, u32 val)
> > +{
> > +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x4, val);
> > +}
> > +
> > +static inline u32 dw_pcie_ep_readl_dbi(struct dw_pcie_ep *ep, u8 func_=
no,
> > +				       u32 reg)
> > +{
> > +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x4);
> > +}
> > +
> > +static inline void dw_pcie_ep_writew_dbi(struct dw_pcie_ep *ep, u8 fun=
c_no,
> > +					 u32 reg, u16 val)
> > +{
> > +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x2, val);
> > +}
> > +
> > +static inline u16 dw_pcie_ep_readw_dbi(struct dw_pcie_ep *ep, u8 func_=
no,
> > +				       u32 reg)
> > +{
> > +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x2);
> > +}
> > +
> > +static inline void dw_pcie_ep_writeb_dbi(struct dw_pcie_ep *ep, u8 fun=
c_no,
> > +					 u32 reg, u8 val)
> > +{
> > +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x1, val);
> > +}
> > +
> > +static inline u8 dw_pcie_ep_readb_dbi(struct dw_pcie_ep *ep, u8 func_n=
o,
> > +				      u32 reg)
> > +{
> > +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x1);
> > +}
> > +
> > +static inline void dw_pcie_ep_writel_dbi2(struct dw_pcie_ep *ep, u8 fu=
nc_no,
> > +					  u32 reg, u32 val)
> > +{
> > +	dw_pcie_ep_write_dbi2(ep, func_no, reg, 0x4, val);
> > +}
> > +
>=20
> I am not sure whether the methods above are supposed to be defined
> here instead of being moved to the "pcie-designware.h" header file
> together with dw_pcie_ep_get_dbi2_offset() and
> dw_pcie_ep_get_dbi_offset(). The later place seems more suitable
> seeing the accessors are generic, look similar to the
> dw_pcie_{write,read}_dbi{,2}() functions and might be useful in the
> platform drivers. On the other hand no LLDDs would have used it
> currently. So I'll leave this as a food for thoughts for the driver
> and subsystem maintainers.

Perhaps, when a device driver needs to use these functions actually,
we can move these functions to pcie-designware.h, I think.

> >  static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> >  				   enum pci_barno bar, int flags)
> >  {
> > -	unsigned int dbi_offset, dbi2_offset;
> >  	struct dw_pcie_ep *ep =3D &pci->ep;
> >  	u32 reg, reg_dbi2;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -	dbi2_offset =3D dw_pcie_ep_get_dbi2_offset(ep, func_no);
> > -
> > -	reg =3D dbi_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> > -	reg_dbi2 =3D dbi2_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>=20
> > +	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar);
> > +	reg_dbi2 =3D PCI_BASE_ADDRESS_0 + (4 * bar);
>=20
> Semantics of the both variables is identical, could you please drop
> "reg_dbi2" and just use the "reg" variable instead here? You must have
> just missed it because a similar change is done in the rest of the
> places in this patch.

I think so. I'll drop reg_dbi2 on v2.

> >  	dw_pcie_dbi_ro_wr_en(pci);
> > -	dw_pcie_writel_dbi2(pci, reg_dbi2, 0x0);
> > -	dw_pcie_writel_dbi(pci, reg, 0x0);
> > +	dw_pcie_ep_writel_dbi2(ep, func_no, reg_dbi2, 0x0);
> > +	dw_pcie_ep_writel_dbi(ep, func_no, reg, 0x0);
> >  	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > -		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, 0x0);
> > -		dw_pcie_writel_dbi(pci, reg + 4, 0x0);
> > +		dw_pcie_ep_writel_dbi2(ep, func_no, reg_dbi2 + 4, 0x0);
> > +		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0x0);
> >  	}
> >  	dw_pcie_dbi_ro_wr_dis(pci);
> >  }
> > @@ -99,19 +164,15 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enu=
m pci_barno bar)
> >  EXPORT_SYMBOL_GPL(dw_pcie_ep_reset_bar);
> >
> >  static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no=
,
> > -		u8 cap_ptr, u8 cap)
> > +				     u8 cap_ptr, u8 cap)
> >  {
> > -	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	unsigned int dbi_offset =3D 0;
> >  	u8 cap_id, next_cap_ptr;
> >  	u16 reg;
> >
> >  	if (!cap_ptr)
> >  		return 0;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D dw_pcie_readw_dbi(pci, dbi_offset + cap_ptr);
> > +	reg =3D dw_pcie_ep_readw_dbi(ep, func_no, cap_ptr);
> >  	cap_id =3D (reg & 0x00ff);
> >
> >  	if (cap_id > PCI_CAP_ID_MAX)
> > @@ -126,14 +187,10 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pc=
ie_ep *ep, u8 func_no,
> >
> >  static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no=
, u8 cap)
> >  {
> > -	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	unsigned int dbi_offset =3D 0;
> >  	u8 next_cap_ptr;
> >  	u16 reg;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D dw_pcie_readw_dbi(pci, dbi_offset + PCI_CAPABILITY_LIST);
> > +	reg =3D dw_pcie_ep_readw_dbi(ep, func_no, PCI_CAPABILITY_LIST);
> >  	next_cap_ptr =3D (reg & 0x00ff);
> >
> >  	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> > @@ -144,24 +201,21 @@ static int dw_pcie_ep_write_header(struct pci_epc=
 *epc, u8 func_no, u8 vfunc_no,
> >  {
> >  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> >  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	unsigned int dbi_offset =3D 0;
> > -
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> >
> >  	dw_pcie_dbi_ro_wr_en(pci);
> > -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_VENDOR_ID, hdr->vendorid);
> > -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_DEVICE_ID, hdr->deviceid);
> > -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_REVISION_ID, hdr->revid);
> > -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CLASS_PROG, hdr->progif_code=
);
> > -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_CLASS_DEVICE,
> > -			   hdr->subclass_code | hdr->baseclass_code << 8);
> > -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CACHE_LINE_SIZE,
> > -			   hdr->cache_line_size);
> > -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_VENDOR_ID,
> > -			   hdr->subsys_vendor_id);
> > -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id=
);
> > -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_INTERRUPT_PIN,
> > -			   hdr->interrupt_pin);
> > +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_VENDOR_ID, hdr->vendorid);
> > +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_DEVICE_ID, hdr->deviceid);
> > +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_REVISION_ID, hdr->revid);
> > +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CLASS_PROG, hdr->progif_code);
> > +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_CLASS_DEVICE,
> > +			      hdr->subclass_code | hdr->baseclass_code << 8);
> > +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CACHE_LINE_SIZE,
> > +			      hdr->cache_line_size);
> > +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_VENDOR_ID,
> > +			      hdr->subsys_vendor_id);
> > +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> > +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_INTERRUPT_PIN,
> > +			      hdr->interrupt_pin);
> >  	dw_pcie_dbi_ro_wr_dis(pci);
> >
> >  	return 0;
> > @@ -243,18 +297,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc=
, u8 func_no, u8 vfunc_no,
> >  {
> >  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> >  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	unsigned int dbi_offset, dbi2_offset;
> >  	enum pci_barno bar =3D epf_bar->barno;
> >  	size_t size =3D epf_bar->size;
> >  	int flags =3D epf_bar->flags;
> > -	u32 reg, reg_dbi2;
> >  	int ret, type;
> > +	u32 reg;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -	dbi2_offset =3D dw_pcie_ep_get_dbi2_offset(ep, func_no);
> > -
> > -	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar) + dbi_offset;
> > -	reg_dbi2 =3D PCI_BASE_ADDRESS_0 + (4 * bar) + dbi2_offset;
> > +	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar);
> >
> >  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
> >  		type =3D PCIE_ATU_TYPE_MEM;
> > @@ -270,12 +319,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc=
, u8 func_no, u8 vfunc_no,
> >
> >  	dw_pcie_dbi_ro_wr_en(pci);
> >
> > -	dw_pcie_writel_dbi2(pci, reg_dbi2, lower_32_bits(size - 1));
> > -	dw_pcie_writel_dbi(pci, reg, flags);
> > +	dw_pcie_ep_writel_dbi2(ep, func_no, reg, lower_32_bits(size - 1));
> > +	dw_pcie_ep_writel_dbi(ep, func_no, reg, flags);
> >
> >  	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> > -		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, upper_32_bits(size - 1));
> > -		dw_pcie_writel_dbi(pci, reg + 4, 0);
> > +		dw_pcie_ep_writel_dbi2(ep, func_no, reg + 4, upper_32_bits(size - 1)=
);
> > +		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0);
> >  	}
> >
> >  	ep->epf_bar[bar] =3D epf_bar;
> > @@ -335,19 +384,15 @@ static int dw_pcie_ep_map_addr(struct pci_epc *ep=
c, u8 func_no, u8 vfunc_no,
> >  static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfun=
c_no)
> >  {
> >  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> > -	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	u32 val, reg;
> > -	unsigned int dbi_offset =3D 0;
> >  	struct dw_pcie_ep_func *ep_func;
> > +	u32 val, reg;
>=20
> Special kudos for preserving and adding the reversed xmas tree order
> here and below. =3D)

Yes :)

Best regards,
Yoshihiro Shimoda

> -Serge(y)
>=20
> >
> >  	ep_func =3D dw_pcie_ep_get_func_from_ep(ep, func_no);
> >  	if (!ep_func || !ep_func->msi_cap)
> >  		return -EINVAL;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> > -	val =3D dw_pcie_readw_dbi(pci, reg);
> > +	reg =3D ep_func->msi_cap + PCI_MSI_FLAGS;
> > +	val =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	if (!(val & PCI_MSI_FLAGS_ENABLE))
> >  		return -EINVAL;
> >
> > @@ -361,22 +406,19 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc=
, u8 func_no, u8 vfunc_no,
> >  {
> >  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> >  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	u32 val, reg;
> > -	unsigned int dbi_offset =3D 0;
> >  	struct dw_pcie_ep_func *ep_func;
> > +	u32 val, reg;
> >
> >  	ep_func =3D dw_pcie_ep_get_func_from_ep(ep, func_no);
> >  	if (!ep_func || !ep_func->msi_cap)
> >  		return -EINVAL;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> > -	val =3D dw_pcie_readw_dbi(pci, reg);
> > +	reg =3D ep_func->msi_cap + PCI_MSI_FLAGS;
> > +	val =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	val &=3D ~PCI_MSI_FLAGS_QMASK;
> >  	val |=3D FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
> >  	dw_pcie_dbi_ro_wr_en(pci);
> > -	dw_pcie_writew_dbi(pci, reg, val);
> > +	dw_pcie_ep_writew_dbi(ep, func_no, reg, val);
> >  	dw_pcie_dbi_ro_wr_dis(pci);
> >
> >  	return 0;
> > @@ -385,19 +427,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc=
, u8 func_no, u8 vfunc_no,
> >  static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfu=
nc_no)
> >  {
> >  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> > -	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	u32 val, reg;
> > -	unsigned int dbi_offset =3D 0;
> >  	struct dw_pcie_ep_func *ep_func;
> > +	u32 val, reg;
> >
> >  	ep_func =3D dw_pcie_ep_get_func_from_ep(ep, func_no);
> >  	if (!ep_func || !ep_func->msix_cap)
> >  		return -EINVAL;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
> > -	val =3D dw_pcie_readw_dbi(pci, reg);
> > +	reg =3D ep_func->msix_cap + PCI_MSIX_FLAGS;
> > +	val =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
> >  		return -EINVAL;
> >
> > @@ -411,9 +449,8 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc,=
 u8 func_no, u8 vfunc_no,
> >  {
> >  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> >  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	u32 val, reg;
> > -	unsigned int dbi_offset =3D 0;
> >  	struct dw_pcie_ep_func *ep_func;
> > +	u32 val, reg;
> >
> >  	ep_func =3D dw_pcie_ep_get_func_from_ep(ep, func_no);
> >  	if (!ep_func || !ep_func->msix_cap)
> > @@ -421,21 +458,19 @@ static int dw_pcie_ep_set_msix(struct pci_epc *ep=
c, u8 func_no, u8 vfunc_no,
> >
> >  	dw_pcie_dbi_ro_wr_en(pci);
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
> > -	val =3D dw_pcie_readw_dbi(pci, reg);
> > +	reg =3D ep_func->msix_cap + PCI_MSIX_FLAGS;
> > +	val =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	val &=3D ~PCI_MSIX_FLAGS_QSIZE;
> >  	val |=3D interrupts;
> >  	dw_pcie_writew_dbi(pci, reg, val);
> >
> > -	reg =3D ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
> > +	reg =3D ep_func->msix_cap + PCI_MSIX_TABLE;
> >  	val =3D offset | bir;
> > -	dw_pcie_writel_dbi(pci, reg, val);
> > +	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
> >
> > -	reg =3D ep_func->msix_cap + dbi_offset + PCI_MSIX_PBA;
> > +	reg =3D ep_func->msix_cap + PCI_MSIX_PBA;
> >  	val =3D (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
> > -	dw_pcie_writel_dbi(pci, reg, val);
> > +	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
> >
> >  	dw_pcie_dbi_ro_wr_dis(pci);
> >
> > @@ -510,38 +545,34 @@ EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_legacy_irq);
> >  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  			     u8 interrupt_num)
> >  {
> > -	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > +	u32 msg_addr_lower, msg_addr_upper, reg;
> >  	struct dw_pcie_ep_func *ep_func;
> >  	struct pci_epc *epc =3D ep->epc;
> >  	unsigned int aligned_offset;
> > -	unsigned int dbi_offset =3D 0;
> >  	u16 msg_ctrl, msg_data;
> > -	u32 msg_addr_lower, msg_addr_upper, reg;
> > -	u64 msg_addr;
> >  	bool has_upper;
> > +	u64 msg_addr;
> >  	int ret;
> >
> >  	ep_func =3D dw_pcie_ep_get_func_from_ep(ep, func_no);
> >  	if (!ep_func || !ep_func->msi_cap)
> >  		return -EINVAL;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> >  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1.=
 */
> > -	reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> > -	msg_ctrl =3D dw_pcie_readw_dbi(pci, reg);
> > +	reg =3D ep_func->msi_cap + PCI_MSI_FLAGS;
> > +	msg_ctrl =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	has_upper =3D !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> > -	reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_LO;
> > -	msg_addr_lower =3D dw_pcie_readl_dbi(pci, reg);
> > +	reg =3D ep_func->msi_cap + PCI_MSI_ADDRESS_LO;
> > +	msg_addr_lower =3D dw_pcie_ep_readl_dbi(ep, func_no, reg);
> >  	if (has_upper) {
> > -		reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_HI;
> > -		msg_addr_upper =3D dw_pcie_readl_dbi(pci, reg);
> > -		reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_64;
> > -		msg_data =3D dw_pcie_readw_dbi(pci, reg);
> > +		reg =3D ep_func->msi_cap + PCI_MSI_ADDRESS_HI;
> > +		msg_addr_upper =3D dw_pcie_ep_readl_dbi(ep, func_no, reg);
> > +		reg =3D ep_func->msi_cap + PCI_MSI_DATA_64;
> > +		msg_data =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	} else {
> >  		msg_addr_upper =3D 0;
> > -		reg =3D ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_32;
> > -		msg_data =3D dw_pcie_readw_dbi(pci, reg);
> > +		reg =3D ep_func->msi_cap + PCI_MSI_DATA_32;
> > +		msg_data =3D dw_pcie_ep_readw_dbi(ep, func_no, reg);
> >  	}
> >  	aligned_offset =3D msg_addr_lower & (epc->mem->window.page_size - 1);
> >  	msg_addr =3D ((u64)msg_addr_upper) << 32 |
> > @@ -582,10 +613,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *e=
p, u8 func_no,
> >  			      u16 interrupt_num)
> >  {
> >  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> > -	struct dw_pcie_ep_func *ep_func;
> >  	struct pci_epf_msix_tbl *msix_tbl;
> > +	struct dw_pcie_ep_func *ep_func;
> >  	struct pci_epc *epc =3D ep->epc;
> > -	unsigned int dbi_offset =3D 0;
> >  	u32 reg, msg_data, vec_ctrl;
> >  	unsigned int aligned_offset;
> >  	u32 tbl_offset;
> > @@ -597,10 +627,8 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *e=
p, u8 func_no,
> >  	if (!ep_func || !ep_func->msix_cap)
> >  		return -EINVAL;
> >
> > -	dbi_offset =3D dw_pcie_ep_get_dbi_offset(ep, func_no);
> > -
> > -	reg =3D ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
> > -	tbl_offset =3D dw_pcie_readl_dbi(pci, reg);
> > +	reg =3D ep_func->msix_cap + PCI_MSIX_TABLE;
> > +	tbl_offset =3D dw_pcie_ep_readl_dbi(ep, func_no, reg);
> >  	bir =3D FIELD_GET(PCI_MSIX_TABLE_BIR, tbl_offset);
> >  	tbl_offset &=3D PCI_MSIX_TABLE_OFFSET;
> >
> > --
> > 2.34.1
> >
