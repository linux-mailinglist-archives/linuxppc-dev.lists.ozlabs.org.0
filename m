Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E58010A5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:59:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FoWhYZfd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShfR836vHz3dC0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FoWhYZfd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::604; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShfQK2rBjz3cfn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:58:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQDg0/9ETcn22wc2o6sSffpO9mAOxaUoYScU7/crew8B2rSRfeDboZcGY66tMzgvwXcYkqoN/lVulIj2XQ1xoWbW5hNe24a+968Upq89wNSBNtTT/JAm1IPgH3VQrnCBkIWnAMbUcgmda3zvKWQ0dQOUr7WkD8ZZYYGuOLuqLHdA+LE/POjmUaHhJHi0D5jyzsRt8Xk54FSOaqFBPEsfn/DrGHOBubDCj/aZc7uuAuGGwHZXRanIKw/PpDBW3kHU6+eJdl8BAGRXhSruHVULO+GJCDfq5+R8lDTHi+3G7xONBUpU2/PklEMcK5ibjDbujaC2HcUEN1rxGAqGk0D9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exM7pQii7xBQlI4hetaZD2uQ6p8dFoNyHPVysuK6AmE=;
 b=Pj9XeatpMt6AsCwJDThb7Czz2oFTpRHhi7gzpYTxyBgkJyEm4+97a8yL88RylCxnPOn6QITosfzz2iEWuxQ01Z9RnizcPhMNooUarRjfqfCfuY1owPimPq/fW+DeD1sOp13N4HLdxsSYztfJQHwgqH6aYQMvQkylSbq+P+NjV2fe/W6IAeK7y+YJG89Jq/EW1Or7x1FO9QDo4wFMyzAefL+N2YSg7RXQRd6vJIbRKk8gAfFzzp/a6PrYMytwM0sUth1G4RLoanzsRtdX1bf/uer5jAw4T0ncqzGwi8g5zNUfVKZuK1o/lq5J1jUAzZ6vqsGf5ejqFQPvYhTjcLj99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exM7pQii7xBQlI4hetaZD2uQ6p8dFoNyHPVysuK6AmE=;
 b=FoWhYZfdh5buyEH9JQiPMuOGEOftfpCgxPSSha3MJ4P24fNcmiOslqXdtza17ODD20WEcrN1uUisXTyndnWbUSQBgoW65OQjZ8prOUOJmPLzhvDyaSp016Au3hLJXH2TVYcsvJ5CCHlWqfz/hFs1hxJ0p7nz5l6SL/2YFyOTocI=
Received: from AM0PR04MB5956.eurprd04.prod.outlook.com (2603:10a6:208:114::23)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Fri, 1 Dec
 2023 16:57:54 +0000
Received: from AM0PR04MB5956.eurprd04.prod.outlook.com
 ([fe80::611a:53a9:3185:c548]) by AM0PR04MB5956.eurprd04.prod.outlook.com
 ([fe80::611a:53a9:3185:c548%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 16:57:54 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Frank Li <frank.li@nxp.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>
Subject: RE: [PATCH v5 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Thread-Topic: [PATCH v5 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Thread-Index: AQHaJHHnnq69VzUD20q7VrwvBWLj1LCUpguQ
Date: Fri, 1 Dec 2023 16:57:54 +0000
Message-ID:  <AM0PR04MB59568824DB8F8509363471B38B81A@AM0PR04MB5956.eurprd04.prod.outlook.com>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
 <20231201161712.1645987-3-Frank.Li@nxp.com>
In-Reply-To: <20231201161712.1645987-3-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5956:EE_|AS5PR04MB9800:EE_
x-ms-office365-filtering-correlation-id: 20834806-c2d6-4e64-2632-08dbf28ea998
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uHrw5XLep8sjv5iD56mfoGEz3oH8wHV8nQyhVy1xKVGnS882IG9AjALCwhfpoDdBuUqsdYepiXzztQznghEE/fkLRALvef+tA3NGAYhnGyF1dVdel4Oxe1VmHyCWfi6yj0IGH2pby3Wsi/bvGHWT7vAbpEj0T6ohXNSCapIJbQzKnPQl/ZBSMQOqda3n39Sgj4GlTTBjr5ylGh7xCUWu5bq6aQkYUZp1zCw14kf/4YUZ0xt09GfP/BkunOLabWhZy69j9TfqKJh/iuZ0WQNGzSJNBOTut/gDFUSfinbgdj6RyxTSraWSv8ICaneyA/RkumIvXHOtGwxqdYs8yT4FOwvmeTR39tDRdcP26pqL/2ODqUUcQCvxavwhhIexwHL+SCVuPfXAYXR5M9GucfkY+ner8CRbSQIdJW2+JuSdT9P22elneVf2SmxMEacGuZ2y8tgYi6R+nJysX5BhQfJGHfCH5rKMvgX2mk0U7DYfPq4+eDo2A6wVanC/lMaeP+die1aoNTMWeNuE3pFqCzWVaw3j6/lGOlO0nDEiYuFF8ntoUy4Z07PjRsY6pxYY2fZFLhWB9X3r+YK0m9dlc7NkH/gCCjEv1i03ElcZU/wKjF094YKc7qtsAPOjVIqPV6yx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5956.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(26005)(38070700009)(8936002)(6506007)(9686003)(66446008)(7696005)(83380400001)(66946007)(5660300002)(15650500001)(7416002)(55236004)(52536014)(71200400001)(2906002)(478600001)(41300700001)(316002)(4326008)(110136005)(44832011)(76116006)(66476007)(66556008)(64756008)(4744005)(54906003)(122000001)(86362001)(38100700002)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ajpnF2icG0/+QPBB0/sT+mBeQcNO/pu8jtQxN0zKuhjsfaG7ZFKA/laWNaXv?=
 =?us-ascii?Q?glL02RW1wPNYAs+GHgxYWFvPgi1JLDABJEhrSsjrIieOcL7DbwWFqJbY3ukH?=
 =?us-ascii?Q?BXS5GqoSQzgpxy8IyhlsRlYAjuIONXJWBUkYasLu0r48BYEEKkBXk5wKyKtE?=
 =?us-ascii?Q?bt4XtUVabw8rSTsqwI0P0M8Hg3FwFWnFwisCry+5LwILg05VWZZvOfwzzWGy?=
 =?us-ascii?Q?IZT23ReMFV2dAzJeV4TczVYMpcBxUYMqIceI2R7R4l5YjEW6KsvdeqXYgvmo?=
 =?us-ascii?Q?fvZiyG7EGJVw0c4npHtKrMAI8KGkwcwEgfF2RzcCMrka6SKDrP9Yt+oVyK6x?=
 =?us-ascii?Q?r6FIeWHOXiLnnXjUNaX95RS25nZ52urodfyerEaWVcp711V2sg+fqFfcNG06?=
 =?us-ascii?Q?TXKO6KEzPj6IPzHKzFdlEyWHyjcxzCWP3rW/wpSkgch81MBKUaHT+b9fzUJv?=
 =?us-ascii?Q?x3RCtJ9cssFIvkCCtckmPO/lxO5gBKrAgGP2Zab1CvE/E9jM0yk9xxPXDWaT?=
 =?us-ascii?Q?ftu1dYNwhHsfrLhqak8WuypJ3ehgN2hb+1ljdr6luASiX9kaVKhuClIUHVzo?=
 =?us-ascii?Q?9/Tbzk90Ry6X6y+yU88j8x/LFs+PTVrCRFS/jHkVWtoCz6od9pBAoCBlvJdJ?=
 =?us-ascii?Q?gDnnGuFUOS77St4b5zMaSlSdAFk8cIbHYjumSb97eCQo0ljT/EpqQNpCGbU3?=
 =?us-ascii?Q?IjLSQBhv+qYq+P6LB8vtrj1Y2CKwyBIS2ri9ix44W7iubf+ATaou0LqLfiTC?=
 =?us-ascii?Q?xV6Qx/2YpF2OvpYt6BeabwWBBKLSMDRxOgfYr/rEyPdO9GAutjlFQFOPkHNd?=
 =?us-ascii?Q?aG/ohfHkU9jql+aP0HPJpAJZkHwAQLdLrxWNMjJMXQ/zJPHd4pLKbGhQGYM+?=
 =?us-ascii?Q?5x376FqP2t5SkW5FmX0alLJPOswbOw9BZoZAgSD5q8byuDm02rV8Sct4538I?=
 =?us-ascii?Q?dnOlpQsZrO9l79cK3qoG6WhId3HzuV2f07TsovYSt3w1a1rv4m569C4uDmG8?=
 =?us-ascii?Q?8+hW0qL4wQaCHuPadtD4f33MKdi2Xj3WEe6ph2nmfcRZD9CO3Gra8l2U7raE?=
 =?us-ascii?Q?s4EM1KFAP0aGH8xswADKzXD/GbeI50RWSKWtHq++rtqYDSBfoRhzzp3LeBmq?=
 =?us-ascii?Q?vSbxKXmD5n2PmzZzD+g/ngvUUNKvz2QpUeu7FRWFuCLYt6Zervb7HiZq3azz?=
 =?us-ascii?Q?qQUEVyfUcJXodUiY0fy/UFIWUqgGyirgzbth/uDJjWk4w1CjljfciW8oDaKP?=
 =?us-ascii?Q?9NYkcRsaS2z2L+cK020Rz7ADETAMdwjrHDLctgDvQNcGhPax6xE7z8PCWGNC?=
 =?us-ascii?Q?ap5zOi0S2YHAgPPKPvGiAbRJjNopEyf7d/eL2zhkr19MONy9H3kTl1w5PELy?=
 =?us-ascii?Q?Gunt8nT495CcCF0OyRpaU5FjHZnuGYQYGxX7DwZGmXtgP3OtwLC4/OEv5yrn?=
 =?us-ascii?Q?JI+9/PSWUlxzfaL2/EHhe1cXZbW9fLpCELhOkp4zD9x1CBcsV7D52pCD+x4Q?=
 =?us-ascii?Q?5zgGw6AxTraSv191YK/ciiiGbC7JLcIw7Ck1cIvs7d6pon44cdV2+0MzaYct?=
 =?us-ascii?Q?PlJvqkG1az3tSDqWODc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5956.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20834806-c2d6-4e64-2632-08dbf28ea998
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 16:57:54.7026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hzHziuYGgakWOheNxGL4OSwV2PDn0EgWZ5KORdU34IAAFtv2fL/a5hBMxiZSWPsbtJBftphE16vdcAK0W1QYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "kw@linux.com" <kw@linux.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Frank Li <frank.li@nxp.com>
> Subject: [PATCH v5 2/4] PCI: layerscape: Add suspend/resume for ls1021a
>=20
> Add suspend/resume support for Layerscape LS1021a.
>=20
> In the suspend path, PME_Turn_Off message is sent to the endpoint to
> transition the link to L2/L3_Ready state. In this SoC, there is no way to=
 check if
> the controller has received the PME_To_Ack from the endpoint or not. So t=
o be
> on the safer side, the driver just waits for PCIE_PME_TO_L2_TIMEOUT_US
> before asserting the SoC specific PMXMTTURNOFF bit to complete the
> PME_Turn_Off handshake. Then the link would enter L2/L3 state depending o=
n
> the VAUX supply.
>=20
> In the resume path, the link is brought back from L2 to L0 by doing a sof=
tware
> reset.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
Acked-by:  Roy Zang <Roy.Zang@nxp.com>
Roy
