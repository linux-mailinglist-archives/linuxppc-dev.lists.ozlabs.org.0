Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32587630A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 12:19:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=F25M/7RC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrkG659X9z3vZc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 22:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=F25M/7RC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:2019::601; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrkFQ0DDwz3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 22:18:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7fR/Me9+DdLkk8GqdTjaaaT/4MILdL0Uox4ClyZ47GNLWhrIi7Ug6VlgkJgCZzsQrqm7ZYIcgfC1QeX1M7NwZQYWjO+rE8S8GCiU9NCszoUfKK+DElX5La9u8/aJyStKzPJ+Fn6z4WHtR6Nxe8jDT4Ra6XgYvM7p42K0tI0N1Otb5wBXprehFIXwBjryZJg6awhdrSHYVxXlZjokyGHeiR3/nXSwQI4sH5PZThEdecx9BjF/f1kvxsj/CznZojCMIZspy7e+NWczw9+fxOxybkB5g/NWBp4i5QDri81b7FntnNg8UTzPDff0zPODqAl2l171mVb/Mwx7kfZDJTXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uCkyQcWM6UJNiRbaEs49KoRO8XYowQxc36iEDLP/JU=;
 b=CQwQTeylaRX+Em3h/D0f6hl7ixoEmPeDGssNPUpX3Z2sc1OIgzSgV1XqcFTCupBnn8TPpbx4WjINXmXmSH8PpVH7CsupKMlKF8ibUAOZy/mpvy7vo+nOsy4ZGg/ICc6S7s0qLMzfjV/fPN4S/lRLZEkzZ1VoDc6VXn9dE03k2diwrIk2teKJy5E+LUwpPJMKpWCus1TzWr53OdGrh8RtxosWh6HPJzCsvn7Ky/XOIsavdT0zAuyOaPkRcHpeliIZHZe71ov2lArkGsuKgEaNMKLHpJnHCQEOPuZ2Ix0RGQK5AysdduaGVWB9TbG01cZ0FvGPH80DS5t/PUKKB/eQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uCkyQcWM6UJNiRbaEs49KoRO8XYowQxc36iEDLP/JU=;
 b=F25M/7RCCvxE2cgD7oxma7CSAKjmotB60lKCNV8Ndp/2wS02L2Mha0zyQVN3A0VSjyMgiFCA7faxNbanDtXrVRCW64ce/WBLmpHi0AGe/L2CL9DEO7Cw+BFhO+Zi11v97sg1xyLUzGNWZ2Fhly4yyZzBIB9PltHuYLz5mwWEROk=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB7000.jpnprd01.prod.outlook.com (2603:1096:604:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Fri, 8 Mar
 2024 11:18:31 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f%3]) with mapi id 15.20.7362.029; Fri, 8 Mar 2024
 11:18:31 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jingoo Han
	<jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Marek Vasut
	<marek.vasut+renesas@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
	<l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Srikanth
 Thokala <srikanth.thokala@intel.com>
Subject: RE: [PATCH v9 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Thread-Topic: [PATCH v9 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Thread-Index: AQHabhWTsbJBnQgExEi8zzAZXLkDwrEtuGKA
Date: Fri, 8 Mar 2024 11:18:31 +0000
Message-ID:  <TYCPR01MB110403E0DD611ACCAF0213AC9D8272@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-2-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-2-29d433d99cda@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB7000:EE_
x-ms-office365-filtering-correlation-id: e9d5fbc5-5bc7-421a-b16e-08dc3f617c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5UmLON6mf3jIjiZI8woHaAE31eWV62T9UJiWgwsmwnPIXMsVezEEezq4b3Hpgu9gZLK/x3YMQaDG9qbXZMuMdNSLeOGbRSNTEw+z3gbf8ZtFA/ml75hMl3suBuNZsXK8s2XS1bt+UBiu0WW1AZLSI0D0asrYBXSSRLLgl8mfx5TjGypx9Ne2nH23rIjPCSujyXe+aroFc8GFVZbvwYuMj3MrRgKlKlxhuPCEIeN3BROq0MEH7MUuFr78nPxVxidkHTxwm9+4a0MDbERG2jVWaaTK/qtR7ML9j7mtlqoEpsFi4Wljl+2VZfFkF3e2Hu/Ig6FGsRZkPUMUzMYUR7+TTyPo4ca0CIN42AM1Hfw/QAwIFVY3tvFlT/uVe01Vbdi17xqlmH0SgsGI+w9SY07f3vKdRrTymYvhmPSKlj0jEOM6Hk2EbLaq25vUS+hTznLBQI5piwsWOmFkC3ehUL8DnS0kbDY7RnFjxaVoy/k3q8Gjjh/oRTw/K9XK3mgPNtmZdRH3hkD2O6CAbgDct9HNCqZUvQWBg4TCtPDw0RtRU3HIbywhKWLAUzx5A9BjGuG7iDAuoByW4iEZHNNDf6/OUAS4G6RqlI9UpYv/1PxDOuN/knOKqmBL7NNXmoPkxQ2Ex3icJ+RvyMBiOKp18hWSHATC6f97gL6dT/iEXfzSgA7wgdhFJTfGAS6iHbac/BLu8gKAKc1HI6WtgBYe7afEonxVK5feQgb5KKZ9yMACUog=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z3VZUlBDQUhOWEdDampNWjZicndOTHYxN0hGTVdzM0h2SmIvOUViZUcrZEJu?=
 =?utf-8?B?TzBGYXFSTHp4OUM5d3l3UEhmT3BFa09SWGwyZ3Z0K1RnejA5dnprcWcxMnBi?=
 =?utf-8?B?MmdZTGY4YjZONEVmOGhEL2RZNWRFOWxHcktMNmFvaTRJQ2F0U3RDdnYxaXRs?=
 =?utf-8?B?cGRQYTFLOGxjVE5HUXR3QnlPSnF3RHFaMDF0QlhKUDM0UU5OTFA5eUNoMDc1?=
 =?utf-8?B?VnVMMTlOYnN3Q282U3R6NEx3WVdJaitpSDJKVW16L2NNK2l1S3lNRC9Rek1m?=
 =?utf-8?B?TGJ2ckxyUjdjSjFJUTVtTWZ0MC9KOUg2ZmVTZmd5bzdxV01MTEJNMytLSjE4?=
 =?utf-8?B?alZiaHJSTVJQbkhTdjIrY1hhV2hXNnVrZE1CaXp2MEl1SW15dGE4dnl6YmVi?=
 =?utf-8?B?SFNsUkR2bURPT2pVZ3BrcDdUbWFHK1o2eEVaaWRTWWJwbVZLbExDZE5FNjdr?=
 =?utf-8?B?bnprOUkra2NwUWQ3b2hUSzlJKzZuYnM5czVraUplcUIzWU1vWG85ZTlneUxG?=
 =?utf-8?B?cnZaUWJmY2VDWUZEdkk2ZVRsdDh5aGZ5N0pqeEFZNm9mWWhsQkovOVlYdTJx?=
 =?utf-8?B?dm5Tc3dLdS9rTVR1NFhNMzloQVFKTitkSy9acUphRGR1Y3FxbVV5aFgweUVm?=
 =?utf-8?B?TGlVRG9hVkJEc2MydUo5TTZXbGJZc051eTU5dDFpTEl5dTFlSDN1R3dRVUFz?=
 =?utf-8?B?MitFREU4dHBGdUpSUDR2SXoydHkydFQ4WnlEZUpPMVVqR241U1ErOXIwNXht?=
 =?utf-8?B?dTJZaGhIN000eWZpeW1VUlBSbkZLT29nbC9iSGluNTVxbGRsMk05dkcrb3lY?=
 =?utf-8?B?cjFBQXE2SVpMbTJJWjNPZXpJQ1d5Tm5VbWxNdGxUclo0Ylo2dkJueDlFT3RR?=
 =?utf-8?B?MXhSVERRWnFUKzVpay9hOTlPU1E0VDgyQmVVUFY5Y2JHM1pwZ3ZzdmxOelJn?=
 =?utf-8?B?NHN6WURqVUxNTHlxMjNFMnBuaGhlM1pnRTdydnlYRlRvMGZSZ3RrdzFTSGRI?=
 =?utf-8?B?YmM5c21saDl2UkYybXloOTNEOWJTenNwL3RXRFNLbTVQZFJRWk9QanBKZmtn?=
 =?utf-8?B?Vi85T2U3M2VzMkVTNXJjaXQrVlpQRElmWWh6d3VnOGRpYnFDd0RSSFVveVYw?=
 =?utf-8?B?b1hRSm55ZzRPd3RnN2hodDZMU1RZT3MwdkxFenY4R1ZybFQyNmNzaVRKSTdq?=
 =?utf-8?B?VkRvWHIyWnJBTStheXVEWGV3NFJxU24wY3FmcTdGOVkrWXQ4NThmRWI5N0Vz?=
 =?utf-8?B?VHorSzBPbHJEQmdrSTFpaHhXd3FnWmN1akl6eFFsV3AwaGJyNFZoMjFnZWpZ?=
 =?utf-8?B?cC9wSHl6M1h1VGtnazR1ZDlPQ1J2RmFNR1pBVXgvdmw0MzlCano3MlNrcmVu?=
 =?utf-8?B?cGNwbHdSTTZ0NnVscGhYWFBVU2hZbVBic3JNZWk2TlpqbEZrMGkwQXRWaWZW?=
 =?utf-8?B?UHAxdExsamg5TnZQREVKYk5XRjZhTXRiNnZMNG1BUGxrdy9KRm9xVTk0UVNM?=
 =?utf-8?B?bHFrazluU1JBSC9iMVNMbjFmQldnenV2ZDhCMFlpL3lZb29HVVNjQTJ1Rkdr?=
 =?utf-8?B?U0xqT1YxS0NpSmkwNlRtZm4rbC9aMjBwZCt1U1N5aTdPcHk4L0VzcGUyQXBZ?=
 =?utf-8?B?KzJNQVRoWUJTb0RiR0hJRUdrVUdMNUU5NkswbGh5eE54YlhVVVFvdG5oRFh6?=
 =?utf-8?B?UVZrRlMxeEpoSEttSDBzTmp1NklnRDliOFRZaHlTbHhoOU5YR3hkbCtrZjBs?=
 =?utf-8?B?ZEMyQmp1Qkh6SXJCNkdzKzVDME1TS0RkWFhpU1JqR2N6Q2JGd0VhYW1EOW5o?=
 =?utf-8?B?NFVnbWo4c1Q4N29OSFFvc2syRWNKYmdpQTVJeTh3c0I4QTZoTW5hcmh6VVYr?=
 =?utf-8?B?Ky9Ga3BpSG40Vzd3NWFDNzNlZ1ZLZ1d1NStQcFVNaWdaOFFFSjhNcmxML2p2?=
 =?utf-8?B?WUtUcjNac1VvcXVwN0VCVUZXVmZHRXVPaWhWZ0FUa01qellOMzNsQ2J0VkNV?=
 =?utf-8?B?VUdOckJhQW10WlVZMi9BMHYyd0JTN3VDR3E1VFpTeHQyNmVCY01CTEtMRjNV?=
 =?utf-8?B?MlI4UE5WWFRMdmNOZVoyem1jTzl4UkszMGNTazArajYzKzZnM3REYU9Fb1NH?=
 =?utf-8?B?bmNqNVpWOGdMVU5wR0pqMHRyMkZHNU1ibittNExmMTgvLzdIZXNEY05KY29W?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d5fbc5-5bc7-421a-b16e-08dc3f617c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:18:31.2615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dv0m+PIqXq0lAcfIZLLmdUocl/ilDsQ4toaNcXYslYPzKLuJ1hOYFtb8tMWhcjUr7f1olubWEtBeET7EBY7tnV6+BwtEPPqGAB0/cc0R7/bTk4OF4Vf71l0Hw1Bn+NG0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7000
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Niklas Cassel <cassel@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0sIFNlbnQ6IE1vbmRheSwgTWFyY2ggNCwgMjAy
NCA2OjIyIFBNDQo+IA0KPiBkd19wY2llX2VwX2V4aXQoKSBBUEkgaXMgdW5kb2luZyB3aGF0IHRo
ZSBkd19wY2llX2VwX2luaXQoKSBBUEkgaGFzIGRvbmUNCj4gYWxyZWFkeSAoYXQgbGVhc3QgcGFy
dGx5KS4gQnV0IHRoZSBBUEkgbmFtZSBkd19wY2llX2VwX2V4aXQoKSBpcyBub3QgcXVpdGUNCj4g
cmVmbGVjdGluZyB0aGF0LiBTbyBsZXQncyByZW5hbWUgaXQgdG8gZHdfcGNpZV9lcF9kZWluaXQo
KSB0byBtYWtlIHRoZQ0KPiBwdXJwb3NlIG9mIHRoaXMgQVBJIGNsZWFyLiBUaGlzIGFsc28gYWxp
Z25zIHdpdGggdGhlIERXQyBob3N0IGRyaXZlci4NCj4gDQo+IFJldmlld2VkLWJ5OiBGcmFuayBM
aSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4NCg0KVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2ghDQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNo
aW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2Rh
DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUt
ZXAuYyB8IDQgKystLQ0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253
YXJlLmggICAgfCA0ICsrLS0NCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcmNh
ci1nZW40LmMgICAgIHwgMiArLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWRlc2lnbndhcmUtZXAuYw0KPiBpbmRleCBkMzA1ZjliNGNkZmUuLjJiMTEyOTBhYWI0YyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJl
LWVwLmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJl
LWVwLmMNCj4gQEAgLTU2NCw3ICs1NjQsNyBAQCBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2ly
cShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ICAJcmV0dXJuIDA7DQo+ICB9
DQo+IA0KPiAtdm9pZCBkd19wY2llX2VwX2V4aXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKQ0KPiAr
dm9pZCBkd19wY2llX2VwX2RlaW5pdChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApDQo+ICB7DQo+ICAJ
c3RydWN0IGR3X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7DQo+ICAJc3RydWN0
IHBjaV9lcGMgKmVwYyA9IGVwLT5lcGM7DQo+IEBAIC01NzYsNyArNTc2LDcgQEAgdm9pZCBkd19w
Y2llX2VwX2V4aXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKQ0KPiANCj4gIAlwY2lfZXBjX21lbV9l
eGl0KGVwYyk7DQo+ICB9DQo+IC1FWFBPUlRfU1lNQk9MX0dQTChkd19wY2llX2VwX2V4aXQpOw0K
PiArRVhQT1JUX1NZTUJPTF9HUEwoZHdfcGNpZV9lcF9kZWluaXQpOw0KPiANCj4gIHN0YXRpYyB1
bnNpZ25lZCBpbnQgZHdfcGNpZV9lcF9maW5kX2V4dF9jYXBhYmlsaXR5KHN0cnVjdCBkd19wY2ll
ICpwY2ksIGludCBjYXApDQo+ICB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaCBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtZGVzaWdud2FyZS5oDQo+IGluZGV4IGFiNzQzMWEzNzIwOS4uNjE0NjUyMDNiYjYwIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaA0K
PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaA0KPiBA
QCAtNjcxLDcgKzY3MSw3IEBAIHZvaWQgZHdfcGNpZV9lcF9saW5rdXAoc3RydWN0IGR3X3BjaWVf
ZXAgKmVwKTsNCj4gIGludCBkd19wY2llX2VwX2luaXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKTsN
Cj4gIGludCBkd19wY2llX2VwX2luaXRfY29tcGxldGUoc3RydWN0IGR3X3BjaWVfZXAgKmVwKTsN
Cj4gIHZvaWQgZHdfcGNpZV9lcF9pbml0X25vdGlmeShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApOw0K
PiAtdm9pZCBkd19wY2llX2VwX2V4aXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKTsNCj4gK3ZvaWQg
ZHdfcGNpZV9lcF9kZWluaXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKTsNCj4gIGludCBkd19wY2ll
X2VwX3JhaXNlX2ludHhfaXJxKHN0cnVjdCBkd19wY2llX2VwICplcCwgdTggZnVuY19ubyk7DQo+
ICBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2lfaXJxKHN0cnVjdCBkd19wY2llX2VwICplcCwgdTgg
ZnVuY19ubywNCj4gIAkJCSAgICAgdTggaW50ZXJydXB0X251bSk7DQo+IEBAIC03MDEsNyArNzAx
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGR3X3BjaWVfZXBfaW5pdF9ub3RpZnkoc3RydWN0IGR3
X3BjaWVfZXAgKmVwKQ0KPiAgew0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBkd19w
Y2llX2VwX2V4aXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKQ0KPiArc3RhdGljIGlubGluZSB2b2lk
IGR3X3BjaWVfZXBfZGVpbml0KHN0cnVjdCBkd19wY2llX2VwICplcCkNCj4gIHsNCj4gIH0NCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXJjYXItZ2Vu
NC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1yY2FyLWdlbjQuYw0KPiBpbmRl
eCBhYzk3ZDU5NGVhNDcuLjlkOWQyMmUzNjdiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1yY2FyLWdlbjQuYw0KPiArKysgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLXJjYXItZ2VuNC5jDQo+IEBAIC00MzAsNyArNDMwLDcgQEAgc3RhdGlj
IGludCByY2FyX2dlbjRfYWRkX2R3X3BjaWVfZXAoc3RydWN0IHJjYXJfZ2VuNF9wY2llICpyY2Fy
KQ0KPiANCj4gIHN0YXRpYyB2b2lkIHJjYXJfZ2VuNF9yZW1vdmVfZHdfcGNpZV9lcChzdHJ1Y3Qg
cmNhcl9nZW40X3BjaWUgKnJjYXIpDQo+ICB7DQo+IC0JZHdfcGNpZV9lcF9leGl0KCZyY2FyLT5k
dy5lcCk7DQo+ICsJZHdfcGNpZV9lcF9kZWluaXQoJnJjYXItPmR3LmVwKTsNCj4gIAlyY2FyX2dl
bjRfcGNpZV9lcF9kZWluaXQocmNhcik7DQo+ICB9DQo+IA0KPiANCj4gLS0NCj4gMi4yNS4xDQoN
Cg==
