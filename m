Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CFE7EA76E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 01:21:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kWjbN09Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STn6C0JPTz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 11:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kWjbN09Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:201a::701; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STn5H3Tq0z2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 11:20:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkCwHP8cnqQNSnRVriO6HnMhjvxfIAhgvBZ925EfT4b8+Z7Yo64LAszIObo50z5nEGXu3OoZ+YcdklzWD7ouSUMXmFtObIB7AO8lootODp5Ithnf7eBGN4bvzq9G0WKPv7zCLl+UOQWRUhNhbWS5bApWNBaMP6QFR7utOhh1E/zqbGw8ifBFsb4ciFc1dKVCEos4ApX8wA0p+zMP2oLryLSJ6ExnvplKEYDwTkm4c/7IO1TysurwLOsva236M1xj4ZRNKdqRUwvu1xDtGPDhX8rGnrHI1XQN8QNiapzbkqwLv2kgqI+yuVBB5Y3y+X7XxAmQPYqRpI0PKCu1HiuCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiF9oMC4BgzeqHfvFQotk3PjY+ZrrpiWqqNCrjbomrE=;
 b=lVswlSs7tUpGhyh3LdEBH4a4xtp0kYpi62Kc+bEO0OSYXsJZOx2Ik+y78oUSB1IW5JW4AybATmelsGH4TLs0kwrYkHbDpSU3QkmGrStyqxF2JpgIK/Eo86OYNq1GNemYzOMkmNfRFch5CbvBAlVEGZmBRspIdie3JhSS6E3CUmWgKjnXX51u0z8LqwS60s/ynKxAQ43u2G01wc56ZftfIWKpDYJoiQFQLbFaHScE1gmgnuclKPi3ALDzq1m3c8fHDvak+r+UeaPsW8O1Gj5xI3Jb6z2BXfKIgBGXKSqnuADtYvhGPOOqi0kW0VSEuAYE5JMnBsmAUq01ZzyQ61zbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiF9oMC4BgzeqHfvFQotk3PjY+ZrrpiWqqNCrjbomrE=;
 b=kWjbN09Zps7mYqm+7nhSf6NoSPVxPB84Biyx19rdKlmArGEUqe5tCRDM5USn7tuUVCO28qlRT1Dw9f5Wsz1JLxKnzAkGiwb2JwYnPkbscFPmcDEApvbJOXknjNVfA26/Wm+sIevaihiVii6+rtzfjVMiAz3Q4DJakcwoVVUa0ZY=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYVPR01MB10798.jpnprd01.prod.outlook.com
 (2603:1096:400:2af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 00:20:23 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:20:23 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>
Subject: RE: [PATCH 0/3] PCI: dwc: Improve code readability
Thread-Topic: [PATCH 0/3] PCI: dwc: Improve code readability
Thread-Index: AQHaFdFZE9Ce1zVW+UaSH+2OKmpsyrB4B0UAgAAQLQCAAApcIIAACqiAgADHm9A=
Date: Tue, 14 Nov 2023 00:20:23 +0000
Message-ID:  <TYBPR01MB5341C92E5A5DCCE8B1F92683D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113100914.GB1583963@rocinante>
 <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
 <TYBPR01MB53411530E01A90CB525DF814D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20231113122221.GA2418639@rocinante>
In-Reply-To: <20231113122221.GA2418639@rocinante>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYVPR01MB10798:EE_
x-ms-office365-filtering-correlation-id: 2c1169d8-d129-498d-78c1-08dbe4a77e82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PPZlp4izrtdt8aL4SNniV0VQ50gJV0Qa7JD7/7xcui9g7h1rvWA9HiAxV+fvXLUJe4JNL1k3ZBHzcWhhRDXvH6Qx9ubHEEFarHBM6VWQYQaE/vclrGTngX9iMqTU9PmJQPLb/ucD0OZb6TDNazGaqo9gbJXtoPr340DD3fCWU+2Dsrhno07HF50G0Y+9WQFOq/G2F/5jrLZaEjI23sQoEmMYi3d2JK8OR6Lv+5SMrnxFNHBNKY7cShA332JPcZshwxpGPrErZo8qgfBazsCCs3BHLuZsbhog9LHUBU3KmTzipTAgU0nQbOIeakPKsWfpZCklo1WCYPQ0WiAz1VBHGf0DCjsqXcLH6Ni7fIgjoSoNmq51W1zRFKgKRVjk5AW4DiDuu4Jsl3fjBAagzkZMKngmO6j2LCg/lM008Mfux02+D3ZC0/bxSKJgBawDegE8aISa24Wes++RACHocmFFRF4qdBSE4Hdvg+buJ7YTiIpcVa9WSqZUEbR444jnADTY5E+oLudSTtAmqQ1NLH49gW/rYolNvEi1qQraeHJqIZVIUK/UQn5JsA/pLioZZGc2N7ghCmlB6Llt4u4wVDkqPmOPJNNDvT1GUYwyYeSfHErQcUQKFaOt9MB19fUFpnbzSFAyHKJmQnFAkGWQwB/kn3o00nvvN71mesGFEiVwcQyCA2few0DzuhhuicsVOvpA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799009)(451199024)(64100799003)(55016003)(52536014)(41300700001)(7416002)(86362001)(122000001)(38070700009)(5660300002)(66446008)(66946007)(66476007)(54906003)(66556008)(316002)(6916009)(4326008)(8676002)(8936002)(33656002)(2906002)(64756008)(76116006)(83380400001)(66574015)(38100700002)(966005)(7696005)(6506007)(9686003)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?nDhCN0mdtpj7IJE8mgeXoGENmosWXAY8seJ0lhYlNybvSPBqMmw/oc22Hv?=
 =?iso-8859-2?Q?WQMD93doz7q/lMvFb6rbunt7BOD0GBj84ZnmrUudVgAIrzla41oqCb+N2o?=
 =?iso-8859-2?Q?Vejd8h8Gw0hBr0KVXDZ9TCvPNIavaIwgbImR3wZ0pNx6RK6NfERaZ4FhEX?=
 =?iso-8859-2?Q?+KegkcHWxhV5BpB5AoolLFkWUNszm3wkEQxrvrOVB8dQ5s4MkZISlLiODL?=
 =?iso-8859-2?Q?F3T8lNQHTKpijlS9Gg9BbseOIuBniLcweRmbtgexieCW2WjwjZ8Vaw67UP?=
 =?iso-8859-2?Q?W5zmjL3v1141w0gedkgf3vSIrzekg+GLgEKEEfSc/b/rBnKXAq9WE5OQr7?=
 =?iso-8859-2?Q?hQ68h2MUCx23WR56qBwpLyBLU43+n59hK3gzuxXsbqLfQRd3raX28qzKQI?=
 =?iso-8859-2?Q?iCFtSi+ZbjsbRzR6l0wDMAZDHKDZidHX9CrGhlqE3lugs0DbMCXHDk9e0f?=
 =?iso-8859-2?Q?0JfDz8FcVhGKFZSx9yzEkqN5uZVNpjvBlcgBh9GUgRYb3uRZAWNMKjxMfD?=
 =?iso-8859-2?Q?Hjeo8rEGGKpH3gF9hU9+0OTa9crIQ1ZAnEhr2xGxNtS4T63Au3wdzEy8jj?=
 =?iso-8859-2?Q?GJvkK44rc4LKFnCnue68cvJbYWYPxjnfFimBuVEndb13Ti/KcAooURotPG?=
 =?iso-8859-2?Q?i+HBkLUwfaYLoxIQ5FkvYSj5DiTvpvJL08zG3vYUHMdTqXAheH+RnHZkm4?=
 =?iso-8859-2?Q?ulmVMn2G8ea7WD1e4Jg6cgp220WMJZWV6UyZ693kqTxleArmRXtkeDzYih?=
 =?iso-8859-2?Q?uFq7nhVOSM9OVLt+UhE8CQWIdUMIc3bD0Qv/ftqGwFziKrofD2TqMbts9m?=
 =?iso-8859-2?Q?Az95tlmeZxX5NJCl9cpkPrIKUrXdsOXexrHj6wdaAl00LwAaePIO89sJm8?=
 =?iso-8859-2?Q?8HWYOJhzIQ8VeLY/G5sQ2E7crE7RY7lbINpsXVsTQu6H3067PQ+2sbwvre?=
 =?iso-8859-2?Q?XkQclLsOGU9FZG9G3Cw1OBP1kdfnBboEpvu4qT3OJ9CcD2ALyCVgTZIseP?=
 =?iso-8859-2?Q?qaUm0eXajkUrD4wex6kGWsI/30d8vSo/NAqAgYYu3kd1L2X89JvFw7FnTS?=
 =?iso-8859-2?Q?GMt+Fk9UDbi9qk7ZKJvm1wBWWGYVHzhfG3+nQThxIhE/Wuqu/T/Je7u47I?=
 =?iso-8859-2?Q?/r65sxUOalsRXX9bPOSEyOA1bigzUn15+6V5ZUqYIecWr1Etp8J03b6rJd?=
 =?iso-8859-2?Q?fYVNuhqb8YdTSLJ023h43Mj0ETKSXPqpJmabCXk+onOPTwFR+U4/pWn+TP?=
 =?iso-8859-2?Q?h/d6DUAB27VgtFe/l9QTnnPDqsL5Cl/t7d0xMzeVXyP0AHVLv1oamGidwk?=
 =?iso-8859-2?Q?JIp+J1gtS26sGvjv5HANTghTh3Aawa1icJ+EvQW0BiHu+mvZfo2jKq1YtX?=
 =?iso-8859-2?Q?QherUJ0IQVAT3FSGay2weak/qAFWcIrlGhRfVGCQNXIaT4oI3JzSvHbpCj?=
 =?iso-8859-2?Q?/fyT5s4KKyBud9P1E+2px/SFKTRgloLitNKnJ9h+T9hqmHsbR1D1cJl9hh?=
 =?iso-8859-2?Q?sGUF8BbbBrRS0mPitcukkS6yMpPdYKJ8xcFmNkLL0VhTItjU9XxLg1+Ox2?=
 =?iso-8859-2?Q?FVWd2ax/EsGfE2rkQNOx+i1rtsOb7gjVMp7F5CqaFLgCCkLJ9pYh711y7y?=
 =?iso-8859-2?Q?wEO/pcEDw0RmbkJOlZLxp5nri+VhiReZ9wXHOyq4S6VXh/NvjT7KPqurXx?=
 =?iso-8859-2?Q?RopugWPT+wX1fB0DyoZ4psgw/QEq/is0vF+FDKx8OId/YKX1dL6ikFqFt9?=
 =?iso-8859-2?Q?4H8w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1169d8-d129-498d-78c1-08dbe4a77e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 00:20:23.6072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RI2C7r7DtCTQDOV3Me3i/J/APVy9n83Z5iWuiGmAFqoUOCXzmgR0+J/8En99mSXAVZAjbZjBoERDA5uHjrTeAl5ukYw72Bz4rpPzgL2KZ4m0TLpEZ6amax5KHwpWedW/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10798
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
Cc: "robh@kernel.org" <robh@kernel.org>, "mani@kernel.org" <mani@kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "roy.zang@nxp.com" <roy.zang@nxp.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>, "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

> From: Krzysztof Wilczy=F1ski, Sent: Monday, November 13, 2023 9:22 PM
>=20
> [...]
> > > > Now, while you are looking at things, can you also take care about =
the following:
> > > >
> > > >   drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast=
 to smaller integer type 'enum
> dw_pcie_device_mode'
> > > from 'const void *' [-Wvoid-pointer-to-enum-cast]
> >
> > Thank you for the report!
> >
> > > > This requires adding structs for each data member of the of_device_=
id type.
> > >
> > > That sounds like overkill to me.
> > > An intermediate cast to uintptr_t should fix the issue as well.
> >
> > I confirmed that the uintptr_t fixed the issue.
>=20
> We declined a similar fix in the past[1] ...
>=20
> > I also think that adding a new struct with the mode is overkill.
>=20
> ... with the hopes that a driver could drop the switch statements in plac=
e
> of using the other pattern.  Also, to be consistent with other drivers th=
at
> do this already.
>=20
> > So, I would like to fix the issue by using the cast of uintptr_t.
>=20
> Sure.  I appreciate that this would be more work.  When you send your
> patch, can you include an update to the iproc driver (and credit the
> original author from [1])?  I would appreciate it.
>=20
> 1. https://lore.kernel.org/linux-pci/20230814230008.GA196797@bhelgaas/

I got it. I'll include the following patch on v2.

https://lore.kernel.org/linux-pci/20230814-void-drivers-pci-controller-pcie=
-iproc-platform-v1-1-81a121607851@google.com/

Best regards,
Yoshihiro Shimoda

>=20
> 	Krzysztof
