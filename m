Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914027E9B69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:50:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nEcrYAwg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STSRZ3Nxzz3dJg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 22:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nEcrYAwg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:2019::701; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STSQj1Cnwz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 22:49:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZTY7GnQ86jIRRxEwsZ8/eUtLl3wEAccvB+oW6n2g+HClvSQKPFo7jSdJlxSjlC0qy6ekr/bie3IwdDrrqlw99QhJGtQewmyBtm9XgiwrWGDVz/BBONmDuzdNrZI+TxiDPckdiDcNRdq4znjVMuJhspdrUziEYFdXMINspIpVR+LUe6eqkeSW1koc4l8ylilOyNQWmw55AmQjbzA/NNJAGRVqm4RHoVvLdZ3aHwegMsXA2EBPbfcMMcLWzIIxViBspDci857iH49TLP9KCXmPals07p3iZqAjBesjxn2MeJNnf6tRSy5fCJCPhfPdlCISwxwXR13yNvr8Mlxc+KJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nU7iUd0TDd4JbH5aUiSNbqUClVzcGwY9gUWVpBgKsM=;
 b=XTDBxKU3yk1T+3G9kQUVTys3dv+YuDNf8R7em28+BfAV6YaQUPNc0v21zfE9NwZSaX/ik3f/P67rnibbv4ZK+6l4AzulArWEBDeh+wghItvHFxSSZFPBkQcsIwUT7KD/Zh0FpVKlUHXH5QI8oJZqp4ryqZA1zYHIxs2V6TY0DXU2nSql23iVgsuk+MWBq6yNRNx9PzeoljBVBpq6GI0I1+M3MTgC9fHptxsxUo1wpQNn8dekEPvWLszqFhsQQgbAur0s5qpdMTM2C1Sn/FdVE45Peg+jNZeyslQTEoaz5HkwkFFOrb5cDlOw9YRiTImXLfZWci7+WPda8TkiQUspRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nU7iUd0TDd4JbH5aUiSNbqUClVzcGwY9gUWVpBgKsM=;
 b=nEcrYAwgzCADJHKRUh2cIeM7FmXRlkmtM9fh3KyA1FcLWVeUbK0H+rp9KlO0DFpqWZpMFa5gfasp8dvCA45t82DmzuI/w9jkCgAD6p6kSjiooZwVUG9TyMRV+pS+jxdnwGaGPylfoC933NAXMj4wPlfruKawoGzP2K1BK0678bU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB5856.jpnprd01.prod.outlook.com
 (2603:1096:400:46::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 11:49:30 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 11:49:30 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: RE: [PATCH 1/3] PCI: dwc: Rename to .init in struct dw_pcie_ep_ops
Thread-Topic: [PATCH 1/3] PCI: dwc: Rename to .init in struct dw_pcie_ep_ops
Thread-Index: AQHaFdFZpPPnPR1g80GQzDwZ6lkJkrB4CM8AgAAZ/pA=
Date: Mon, 13 Nov 2023 11:49:30 +0000
Message-ID:  <TYBPR01MB53411FE1C96798B50E722295D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113013300.2132152-2-yoshihiro.shimoda.uh@renesas.com>
 <ctr22275xmbx2ztoo43fr5b4p4252j2ygqxzeybbmiwcghzho6@gglrclbpj6xj>
In-Reply-To: <ctr22275xmbx2ztoo43fr5b4p4252j2ygqxzeybbmiwcghzho6@gglrclbpj6xj>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB5856:EE_
x-ms-office365-filtering-correlation-id: 7247a463-980d-4f62-9b27-08dbe43e98a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  b6cCDcfutsTRDOQB5WLV8A/jhUWVOSA2oYNVufEPkScgkfEYSTMkMkLZuEx/M0Y/QpsCVMNafOgoUwBR5/j4LP+XcII+UTf5YjlGO7+n9BOpRYMZg/+e9jQqaQpueIyDvqNq1sktkD7TM98zQWiOK2k0hOf01tWHyxKdLyg74o1W93GllTeNyUaUcxAQ8PCqles4RSd8d6cv/0FNC8Z3hEV7sv8dgJ+6zSwjQgNeUduPL3QoSJcYNo3catF73Y4VxlN8HV10BNFsz06yMkgJOmF/X+xrcgw+yrFH7OBqpnxQvfZJQIn9nx3qk2LLLYNZf2wgHu3Hb2dEB5cMt4cQfMzov1WeV4ptGCcG+1Xxyyu9bx63ugdmbrWVa0XhoLQ12LpQf8tjn/OOgKeppDRN6bLYZzegDaLTos/9fI7eWkjh3yiWrxOJ4seu/9i41I+e8jppIfFeO94my3GCRK0Lq2F8V/zg1XsQ9DnISGAVOSfU2HLsxkYpTUikYJ1IYotdRAilvqjM/0ja8f9+Lz9al9FQvsY0yswzS/O+p+ZOIuNP/qXT5iqg+7IHBAcD6EbRm7ydy2EIdislF+rmIMZd/9hlzpyuxLEWQL58+h/LZsOGcm3z0k3Nbj8EwDcO6zO1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(86362001)(966005)(55016003)(478600001)(76116006)(6916009)(316002)(66946007)(64756008)(66446008)(66476007)(66556008)(54906003)(2906002)(52536014)(7696005)(6506007)(41300700001)(71200400001)(122000001)(7416002)(9686003)(5660300002)(38070700009)(83380400001)(33656002)(4326008)(8676002)(8936002)(142923001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?tJXKexloVUPwoKc5HVFWccmgr0soiaDQbpy0+OjNjzbrJNt3G9mgR1wXLZMi?=
 =?us-ascii?Q?VbeoFZEW2MzSudc+HSeRZzMYiPwGYMwwQZUpkNGeQEApUjvcUPLqY9jBe1u9?=
 =?us-ascii?Q?Au86P76bqpf2ZS0dp9q5fhsYSksnZKwX2RiE8LsQKzHhgJX14iLS7GKdtcTp?=
 =?us-ascii?Q?sUBoPURMeB0RPm68RCMlncPwrShyp+hao+cuf8Vj4GZ0lKIA63RbWgj3b9gs?=
 =?us-ascii?Q?/S2cR1DfWKX+l0JugVpG6SxdX4KlkJJXqU5a7TAZilSO/00gDDrANi5Nob4w?=
 =?us-ascii?Q?M6dj/hVbGIVIe2QTmVagofPzBQCD3K2soIqPSeobNA12q3omdD1WrMbj/8TK?=
 =?us-ascii?Q?3E6RWp8vgQKt4j++GX9TBVYKq9Y+L75Tvg6aSVzFVDZBC2/5kjcEfAeUTOgW?=
 =?us-ascii?Q?RCEIa2epX63gHHdHvTcJTIhDIThs1yno3rERaZHQ7bZXcKxWNEw3n6vV4zq0?=
 =?us-ascii?Q?vUz6wGBbkccGPE5D9eiNLegI7+DwdSqWLwRl3OKKwJr/Lvr+q32cv4xvsCDk?=
 =?us-ascii?Q?AzTbHiGLgbJDaP7xolAq3WpgSw5cua1rthPbyW6NpWNNXNEU/AlewYG0VtEP?=
 =?us-ascii?Q?scUQPHYvV/660DIeuJ7LUbeaon0q0+ozDZMtUxTVthhV8hsPbSG5MvpWcAGr?=
 =?us-ascii?Q?YJm08E7F2A538LZ4ttqBLKIj2NbcmIbsKhkVYYlQ38+kkEyl4a4kJdUouaWL?=
 =?us-ascii?Q?SxfIzPLxZW2nvneAPpTsMK51URwryiaK7/E/HNBZypRyTvdEHq2TF1t8I9AI?=
 =?us-ascii?Q?bdtAhG0rgRMITq0y4kERSs25jMGp2NxdN9CPwHONxw7mzMTDpTUNDd6KIA2u?=
 =?us-ascii?Q?7Hhh/PLG1rhZRmclnZoVzpDHlOD3hsD+27pJkIeyNhNL1gYPMc6gxKf+O9qc?=
 =?us-ascii?Q?nCuLA3v0NoXaNOSqzTbE7E3w5oexvNWwBcXi0WDXGYufL8muuZxd/lJYpo+x?=
 =?us-ascii?Q?oK47SOMmVqweK1df1ygA0kLwiEmQEguFQpuzZPADFPmeDgggjLpNdRMi9HJL?=
 =?us-ascii?Q?nCQy3hEHGVggT/meV+P53VKbwm62fI45tMbyDs3FJLDQOgWPdKTpxUDyi+J8?=
 =?us-ascii?Q?KTlFUwXWOds20XfXTJVA89GVpmaKwczXAoWuErb74JccuIJj/VzXBgaRFyNO?=
 =?us-ascii?Q?63XD959TlbDo71mSq7B5kOWqEuZVjftM1ct2pgHp0fcrw+ik4HCIMZLKFtx5?=
 =?us-ascii?Q?yYlTsBGVaLbIcfZGziJuKLQ1EX4IF7MOJj2+eFrmx0/JlJFp74ooeUXCrGId?=
 =?us-ascii?Q?f7pVIDvrqZVxSouXjzsHE+rUpDUHCGBr8/YDmAUlEU8VXrOT+s6hYWy2VUcn?=
 =?us-ascii?Q?u4cSVIH9OtKV2lCFPRuLdx5FL3QH8BI6YwC06zirwaVGgdY8YLb94DRHqDbS?=
 =?us-ascii?Q?dsjaJfF0YgCTqdyeKeCE0uOY0//28QZk51ONXpGfMamUBsJ2FFyNxBXDWzsj?=
 =?us-ascii?Q?i1jPIG4SNQ9DiOCg84suYyk6wUExki+BF406J0vGPZZhN8xSE0slPYUihqC2?=
 =?us-ascii?Q?ugDfI95TvP+l5hLIMiX5W12X2mf9/z5w7ogVhGnkSY/eiiH3nVuFiBn6t2Mb?=
 =?us-ascii?Q?Zmdx62inl9WWQ3gSvTJjDf/BPQKaRGVZQ7PAm5jsmOtZPmA3kB9yqeoj+2OU?=
 =?us-ascii?Q?oaCxTkFQXM6S2xfXbM1ZgSl90HFB6L7QwfRmkmc1pbOqQZYMEcGaPDbmm5fF?=
 =?us-ascii?Q?ckz0RA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7247a463-980d-4f62-9b27-08dbe43e98a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 11:49:30.2584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cjdvhSjg7396eD9A/ZiFdq7ys7mNbYyRyq2zhYpoPoiRrVWq9SxLcYdhu2HgSrnPOQfuClMCodm5q/CEg8MTwGqXMg5hW6OVXa7QQSZZJk17VQ9wgRNleJJtooB8Aee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5856
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

Hi Serge,

> From: Serge Semin, Sent: Monday, November 13, 2023 7:15 PM
>=20
> Hi Yoshihiro.
>=20
> On Mon, Nov 13, 2023 at 10:32:58AM +0900, Yoshihiro Shimoda wrote:
> > Since the name of dw_pcie_ep_ops indicates that it's for ep obviously,
> > rename a member .ep_init to .init.
>=20
> Thanks for the series. This change particularly looks good. But since
> you are fixing the redundant prefixes anyway, could you also fix the
> dw_pcie_host_ops structure too (drop host_ prefixes from the
> .host_init() and .host_deinit() fields)? The change was discussed a
> while ago here
> https://lore.kernel.org/linux-pci/20230802104049.GB57374@thinkpad/
>=20
> It's better to be done in the framework of a separate patch released
> within this series.

Thank you for reminding me about the discussion. I'll add such a patch in v=
2.

Best regards,
Yoshihiro Shimoda

> -Serge(y)
>=20
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           | 2 +-
> >  drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
> >  drivers/pci/controller/dwc/pci-keystone.c         | 2 +-
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    | 2 +-
> >  drivers/pci/controller/dwc/pcie-artpec6.c         | 2 +-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 4 ++--
> >  drivers/pci/controller/dwc/pcie-designware-plat.c | 2 +-
> >  drivers/pci/controller/dwc/pcie-designware.h      | 2 +-
> >  drivers/pci/controller/dwc/pcie-keembay.c         | 2 +-
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         | 2 +-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 2 +-
> >  12 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/cont=
roller/dwc/pci-dra7xx.c
> > index b445ffe95e3f..f9182cd6fe67 100644
> > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > @@ -436,7 +436,7 @@ dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
> >  }
> >
> >  static const struct dw_pcie_ep_ops pcie_ep_ops =3D {
> > -	.ep_init =3D dra7xx_pcie_ep_init,
> > +	.init =3D dra7xx_pcie_ep_init,
> >  	.raise_irq =3D dra7xx_pcie_raise_irq,
> >  	.get_features =3D dra7xx_pcie_get_features,
> >  };
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/contro=
ller/dwc/pci-imx6.c
> > index 74703362aeec..737d4d90fef2 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1093,7 +1093,7 @@ imx6_pcie_ep_get_features(struct dw_pcie_ep *ep)
> >  }
> >
> >  static const struct dw_pcie_ep_ops pcie_ep_ops =3D {
> > -	.ep_init =3D imx6_pcie_ep_init,
> > +	.init =3D imx6_pcie_ep_init,
> >  	.raise_irq =3D imx6_pcie_ep_raise_irq,
> >  	.get_features =3D imx6_pcie_ep_get_features,
> >  };
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/co=
ntroller/dwc/pci-keystone.c
> > index 0def919f89fa..655c7307eb88 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -944,7 +944,7 @@ ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
> >  }
> >
> >  static const struct dw_pcie_ep_ops ks_pcie_am654_ep_ops =3D {
> > -	.ep_init =3D ks_pcie_am654_ep_init,
> > +	.init =3D ks_pcie_am654_ep_init,
> >  	.raise_irq =3D ks_pcie_am654_raise_irq,
> >  	.get_features =3D &ks_pcie_am654_get_features,
> >  };
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/p=
ci/controller/dwc/pci-layerscape-ep.c
> > index 3d3c50ef4b6f..4e4b687ef508 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > @@ -195,7 +195,7 @@ static unsigned int ls_pcie_ep_func_conf_select(str=
uct dw_pcie_ep *ep,
> >  }
> >
> >  static const struct dw_pcie_ep_ops ls_pcie_ep_ops =3D {
> > -	.ep_init =3D ls_pcie_ep_init,
> > +	.init =3D ls_pcie_ep_init,
> >  	.raise_irq =3D ls_pcie_ep_raise_irq,
> >  	.get_features =3D ls_pcie_ep_get_features,
> >  	.func_conf_select =3D ls_pcie_ep_func_conf_select,
> > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/co=
ntroller/dwc/pcie-artpec6.c
> > index 9b572a2b2c9a..27ff425c0698 100644
> > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > @@ -370,7 +370,7 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep=
 *ep, u8 func_no,
> >  }
> >
> >  static const struct dw_pcie_ep_ops pcie_ep_ops =3D {
> > -	.ep_init =3D artpec6_pcie_ep_init,
> > +	.init =3D artpec6_pcie_ep_init,
> >  	.raise_irq =3D artpec6_pcie_raise_irq,
> >  };
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/=
pci/controller/dwc/pcie-designware-ep.c
> > index f6207989fc6a..ea99a97ce504 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -794,8 +794,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> >  		list_add_tail(&ep_func->list, &ep->func_list);
> >  	}
> >
> > -	if (ep->ops->ep_init)
> > -		ep->ops->ep_init(ep);
> > +	if (ep->ops->init)
> > +		ep->ops->init(ep);
> >
> >  	ret =3D pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
> >  			       ep->page_size);
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/driver=
s/pci/controller/dwc/pcie-designware-plat.c
> > index b625841e98aa..97088b7663e0 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > @@ -74,7 +74,7 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
> >  }
> >
> >  static const struct dw_pcie_ep_ops pcie_ep_ops =3D {
> > -	.ep_init =3D dw_plat_pcie_ep_init,
> > +	.init =3D dw_plat_pcie_ep_init,
> >  	.raise_irq =3D dw_plat_pcie_ep_raise_irq,
> >  	.get_features =3D dw_plat_pcie_get_features,
> >  };
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci=
/controller/dwc/pcie-designware.h
> > index 55ff76e3d384..cad0e4c24e11 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -332,7 +332,7 @@ struct dw_pcie_rp {
> >
> >  struct dw_pcie_ep_ops {
> >  	void	(*pre_init)(struct dw_pcie_ep *ep);
> > -	void	(*ep_init)(struct dw_pcie_ep *ep);
> > +	void	(*init)(struct dw_pcie_ep *ep);
> >  	void	(*deinit)(struct dw_pcie_ep *ep);
> >  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
> >  			     enum pci_epc_irq_type type, u16 interrupt_num);
> > diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/co=
ntroller/dwc/pcie-keembay.c
> > index 289bff99d762..3c38e047d5ed 100644
> > --- a/drivers/pci/controller/dwc/pcie-keembay.c
> > +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> > @@ -325,7 +325,7 @@ keembay_pcie_get_features(struct dw_pcie_ep *ep)
> >  }
> >
> >  static const struct dw_pcie_ep_ops keembay_pcie_ep_ops =3D {
> > -	.ep_init	=3D keembay_pcie_ep_init,
> > +	.init	=3D keembay_pcie_ep_init,
> >  	.raise_irq	=3D keembay_pcie_ep_raise_irq,
> >  	.get_features	=3D keembay_pcie_get_features,
> >  };
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/co=
ntroller/dwc/pcie-qcom-ep.c
> > index 9e58f055199a..2b6f7c144c61 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -796,7 +796,7 @@ static void qcom_pcie_ep_init(struct dw_pcie_ep *ep=
)
> >  }
> >
> >  static const struct dw_pcie_ep_ops pci_ep_ops =3D {
> > -	.ep_init =3D qcom_pcie_ep_init,
> > +	.init =3D qcom_pcie_ep_init,
> >  	.raise_irq =3D qcom_pcie_ep_raise_irq,
> >  	.get_features =3D qcom_pcie_epc_get_features,
> >  };
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/=
controller/dwc/pcie-rcar-gen4.c
> > index 3bc45e513b3d..2b7e0f213fb2 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -408,7 +408,7 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offs=
et(struct dw_pcie_ep *ep,
> >
> >  static const struct dw_pcie_ep_ops pcie_ep_ops =3D {
> >  	.pre_init =3D rcar_gen4_pcie_ep_pre_init,
> > -	.ep_init =3D rcar_gen4_pcie_ep_init,
> > +	.init =3D rcar_gen4_pcie_ep_init,
> >  	.deinit =3D rcar_gen4_pcie_ep_deinit,
> >  	.raise_irq =3D rcar_gen4_pcie_ep_raise_irq,
> >  	.get_features =3D rcar_gen4_pcie_ep_get_features,
> > diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pc=
i/controller/dwc/pcie-uniphier-ep.c
> > index cba3c88fcf39..40bd468f7e11 100644
> > --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > @@ -284,7 +284,7 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
> >  }
> >
> >  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops =3D {
> > -	.ep_init =3D uniphier_pcie_ep_init,
> > +	.init =3D uniphier_pcie_ep_init,
> >  	.raise_irq =3D uniphier_pcie_ep_raise_irq,
> >  	.get_features =3D uniphier_pcie_get_features,
> >  };
> > --
> > 2.34.1
> >
