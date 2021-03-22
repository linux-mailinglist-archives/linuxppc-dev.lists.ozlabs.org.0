Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9579C34486E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:00:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yNK2Md5z3c6r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:00:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=n6aI9t5n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::604;
 helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=roy.zang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=n6aI9t5n; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yLZ51Spz30gW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:58:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ5++i5L6TKPOA7/cHrxVWGAORm8NV5hQ6mpztR5b0gYfkD8cdkFXciEPnMhkgct629NCAVDpSHT3q+OOw+lzaPWWYkg7YdV6TVRpIG+Of1BNpmogAwevjPk3d1mPFPybQB8sTc2g/ljsK3IE9TtxRhmleK1n3rT71PfkOxrSfozcC9b2DMe0wMLMZeiz906gOEzg1fIzR91RhieDejO/HkPiVjeu3gvRmtYQhUzDTWYEzFJfABc/WaqWyNn1QjyMsgKJatJc2AY4bc30iyhPexbTdvjHB9Ng1A30ZFW5GrJ6FqPx5WNf2gGhrI5YrIuiezdRI3xpPKBYi5jBlmnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPxM0XiNyofeGK65x+MzN5o83WpAWYqk3msuCRpaj58=;
 b=LMr3XHh+qtT9i80i+TcbQQljEwMD5bKKy0/4CfeCBsgzdWAUVyiWY7iY2L+p2L4N4nIh5mDVAwK8sx/OF4x0yDkQDuyYsj4BRPK//x+oe/HPpas9Ss5tX0pQGvy9B7E87W+m5UqjzIZRuhFXUKv5SCtPJBojl7pozfyQYk7WffoMHdvUk+RcVwzsuSdEKJMCZz5UfRWdHnON04OCTsbwze0O9i47EFoSJWC065fnmxLB6skkFnrdhjeaAy9YSCpkaeEILEiiicyoKoqWjQL0gW2iP9/+q86W5C7bWGStoPunENZ/y3JoXmDb0bWHcEXQTy4apT5YoEPRDAZw6tQsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPxM0XiNyofeGK65x+MzN5o83WpAWYqk3msuCRpaj58=;
 b=n6aI9t5nGdO9NnMzKXK6cGHNHrJIyUqa+IIrl8VM3PXGTDhPx/CxF1Lq9j/aBMYOqRgBvEOcKpNi8kEGGeS3xVajcZGmUAvZBW0fGnH3/WPE3ThCFstVindbI59VG80WTAFzLPU357aKfWSq4agTVqeleaEdRiWZTaETqhQeDIY=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by VI1PR04MB4832.eurprd04.prod.outlook.com (2603:10a6:803:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:58:35 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::d1cb:cbf8:2e78:8826]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::d1cb:cbf8:2e78:8826%2]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:58:35 +0000
From: Roy Zang <roy.zang@nxp.com>
To: =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, Bjorn Helgaas
 <helgaas@kernel.org>
Subject: RE: [PATCH] PCI: layerscape: Correct syntax by changing comma to
 semicolon
Thread-Topic: [PATCH] PCI: layerscape: Correct syntax by changing comma to
 semicolon
Thread-Index: AQHXFifqc+ug5G3wy0WmEdHDbcdViKqQKiag
Date: Mon, 22 Mar 2021 14:58:35 +0000
Message-ID: <VI1PR04MB596784C0447CF16BC84051C78B659@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20210311033745.1547044-1-kw@linux.com>
In-Reply-To: <20210311033745.1547044-1-kw@linux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.com; dkim=none (message not signed)
 header.d=none;linux.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [72.177.85.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da9c544d-11b1-46b6-d0a9-08d8ed42f7b7
x-ms-traffictypediagnostic: VI1PR04MB4832:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4832A1EA5E0DE8034C20A8718B659@VI1PR04MB4832.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:418;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ReotNsbiGy0ujEJQrHIWlDgqbP47SIYWvoGVIcSkrSDCVhPJGAYbhVhwNDUAJyUbfs2ANlbGGQF0LZFwgnoY3biQ5dqiC/tzwUKsaEFfhZKIC7J+lbN/XzK7lu7DC5tE61KBUyJefQCZ2HXstffpmVJ38M8ORD8MT7vrzs7xrKaDR/Nlk/B47MsVNHxEd/FKzbrn/S2S/CZo5MNe5hLOCUkMd7BgOclcz+HRqGp1IaFbJ25WqHoZCnLUl5c5V6iqq5uDfPm34M2aLA45p0t5W7v7mEzQUiKDHLgYBj7cAGUmnELmOoTgAHiRNYuDUh2dhuyOOQfD7kAvK+/3JkniLWZMoLxmmhLlNd7gsFV9e+UsLbAj0rWfUwxyCEMH6rOifvJSnhmwGJQLde/z6SqMFgkznZC5kiSkRjKscA83LxRtWc8h11XYMYDybGKu1GafPcm2UeiYURHrvVf9+aCL/7bbHGb/ZEiu0oBrcRI03A84Kcj2ME/Deif7eLX2Xk7gz+3xBz/3EyVpsmH82hfh06uvAFy0FlX001+/XgxuS79GFwryoX/G0bsUbzbnIpgFkJh10gKHNyex26NKUQpZhS7Xh+HiOWragGrorxjVaKKk4TD/yyt5lQBXNJyU9W23HGacuBCLaShWss7Q63Wf60xsXVDToSUV237pnx/QR1Iw6TSUH7Ot1pJAukGO9wrtwL8RI6UmaZRydR2tJNhKCkHmonytWLWEghsAhOLNmUr9H7b4XewZb9f7SRrz7vOz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5967.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39850400004)(7696005)(83380400001)(45080400002)(86362001)(55016002)(6506007)(44832011)(966005)(8936002)(110136005)(66556008)(66574015)(52536014)(66446008)(8676002)(478600001)(2906002)(38100700001)(316002)(9686003)(54906003)(186003)(66946007)(66476007)(26005)(64756008)(76116006)(5660300002)(4326008)(71200400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-2?Q?Fzv1aSMOzzsq1xqRz7uOUuRh3JltVB2P14/lpCqDQnjGcgUtdYZgdvKhbP?=
 =?iso-8859-2?Q?utBAwLjlPDjxIe4AfxJq6UcFTBpcJgltS6iPZ1Z6QBUTEPPOiqRW3fSgeR?=
 =?iso-8859-2?Q?1laZ4hbedn5TT7eBpTkNXe/BhZHzMs4B2b7/syyAyAPiB++8EVGds5qvJx?=
 =?iso-8859-2?Q?FeOXmoDDY1HWVFXdbIl8ySIdnFyZXjQwBNnVJiNMhXfO/r+enlLTM0OrJH?=
 =?iso-8859-2?Q?r9Nce/ZCeVIteSORTnyJI2VXNVFcp20Hsh7jDqB30E5pb5hPz3p3yJSlpB?=
 =?iso-8859-2?Q?isGgTIfhTNL5ug/LSHf5C/wyshdc1FbR1Uqx1pCrscxc8+U939bQ2/rldg?=
 =?iso-8859-2?Q?bLMCr9KBg1WaAfHLwJ/X19wfl3m6GaxKnSB8palvZ7rTyaFTPAYVct1U2w?=
 =?iso-8859-2?Q?fwsNbTiM3N0Ewsexqx37CRCoG+sPmo8ZTOfsYLrAYRurUwDaHYakwvPgI1?=
 =?iso-8859-2?Q?NSkb4hEaUYDobHAJPX+uQWljLgAm95WKUmNWFM//wBu4K8z9NTTqRFHO0d?=
 =?iso-8859-2?Q?bnXP3NGfvE5lPlQKdceEBXYeSq4zhWfT+Pi7i/evvLk3Kbx70M7/K+NGhf?=
 =?iso-8859-2?Q?J+b3jv9Yzr9LPyDzd82+a8e/rFVH0LynKMDF6iSuGUVb4+jtsSfex0QLUt?=
 =?iso-8859-2?Q?ogQyrjybQaM8DG8yRf3u0d8+lxu2hrCOhaviAzjD8TOpUfZQy4kKJ99oO6?=
 =?iso-8859-2?Q?fyw83cKP990ZHrhk1aGJXvUiO2Otu5xwnQ4N0wHLXGtLH473H4NJFbeyKg?=
 =?iso-8859-2?Q?gW/yH8wKzjIpsOeuexFdJNrbYJy3/JvV8JYuxxELIzwDcUn3gyAQsDbm6H?=
 =?iso-8859-2?Q?U0qyEi91p9ql2X+njyf3mQVbhMaYzadT5OQxUnLQcnUFE3l78W9JN3m/on?=
 =?iso-8859-2?Q?+nd+UA5w3nHRZRi6mGH6guhSyzEFkfvvudIUYTRuTthRtUEXn6g97RbsN0?=
 =?iso-8859-2?Q?N+TDF1HzaNmfb90QLDQlj/H3kHIb9rCgzBvlV6NZ0ZIDZWfVPVi7zPtIQY?=
 =?iso-8859-2?Q?0cuGRqNanm8MTvw2w7vJjRxUXaAd1jwW5UCCCo3asK1IYeh5l7u+55v6lZ?=
 =?iso-8859-2?Q?ZvaXGEJ2Qfhz1lh+owz9w+9m8KIJLKwQcGJqGtSJZgwwBa3vZVKJC3aNc3?=
 =?iso-8859-2?Q?LCfxtqNQ2dO4x4qtXHpMMUblO2VBtDyC+IjSzeUmad1Qb1RsRTyTZ4PJz5?=
 =?iso-8859-2?Q?B8+p6ghOUBYosnpT6d9TaEcm9bOsLxkWYVUR0cENI25QncHgnII4R6PWrq?=
 =?iso-8859-2?Q?GnMsXAu0dtl3ipfDTqIaklMmCwtZ+Kmnuhdl5MxIMXs6y3A4J4TV8YOWSv?=
 =?iso-8859-2?Q?vCiJduJch3GFfrp9E9dxSLKPzqekvgfTH+40qu5s4Fd+kSfRfwWWytTlm1?=
 =?iso-8859-2?Q?lX8j6QOjBU?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9c544d-11b1-46b6-d0a9-08d8ed42f7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 14:58:35.1688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+od69FmQZWeYBlUC6ZaFQQ/pT3xImnF2y67ShAhHqQLMHvtQQip/3U5oXzITFgJr/ZiDoZ3LYEPyHZwb00Mcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4832
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "M.h. Lian" <minghuan.lian@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Roy Zang <roy.zang@nxp.com>

Roy
-----Original Message-----
From: Krzysztof Wilczy=F1ski <kw@linux.com>=20
Sent: Wednesday, March 10, 2021 9:38 PM

Replace command with a semicolon to correct syntax and to prevent potential=
 unspecified behaviour and/or unintended side effects.

Related:
  https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Flinux-pci%2F20201216131944.14990-1-zhengyongjun3%40huawei.com%=
2F&amp;data=3D04%7C01%7Croy.zang%40nxp.com%7C8bc03d11ee3f47753d7e08d8e43f0c=
15%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637510306719022629%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C2000&amp;sdata=3DcoDaErstzzBiGcJUykscD38ogbGXQyvrxt7ZI8cBk%2Fs%3D=
&amp;reserved=3D0

Co-authored-by: Zheng Yongjun <zhengyongjun3@huawei.com>
Signed-off-by: Krzysztof Wilczy=F1ski <kw@linux.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/c=
ontroller/dwc/pci-layerscape-ep.c
index 39fe2ed5a6a2..39f4664bd84c 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -154,7 +154,7 @@ static int __init ls_pcie_ep_probe(struct platform_devi=
ce *pdev)
 	pci->dev =3D dev;
 	pci->ops =3D pcie->drvdata->dw_pcie_ops;
=20
-	ls_epc->bar_fixed_64bit =3D (1 << BAR_2) | (1 << BAR_4),
+	ls_epc->bar_fixed_64bit =3D (1 << BAR_2) | (1 << BAR_4);
=20
 	pcie->pci =3D pci;
 	pcie->ls_epc =3D ls_epc;
--
2.30.1

