Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF38762FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 12:18:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Iv7yyja0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrkF40qQtz3vYk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 22:18:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Iv7yyja0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:2019::601; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrkDJ0J29z3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 22:17:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJXUXiDckPYjR19mMIbmpXRb2cKSNu82pnvnx8dw4CvlfO+8mHAt6lQjM5BbL1wA0vsXpwmipe4+xi1B6LpU4x2UKTb2cPDWEk9FWpphDVdksLahsTO4yaCz0vK2KTr859dhUWs6st+UpWW4i/TuFB92Vb8UVKW1CeJ1F30xGpvGnsO3UY6TosKLWqK6zcaQOneT9tmc2xHK+wuxbJAYZkPwsC9glgyrYSWCR9hSGZBPtOe3u+mMx/19EngFwZvYVZckGB34mxjFLbfZXJNeeAHGY29x728r0k1qBk+CXyu00G4sKYHR6HuRGwPQEfnb3vTYas0HOWRksuLOxjFu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv6Nv0Ct6tZLICYJEqb6GxkqSIqHtf5IYWtDjCaDlsc=;
 b=iLLGjsJNMHg2z6LOCt6rixaCS8Y7+eX+nAlAbuFmAxi1GuVQhvKd2m2pVN/JZG5CBZhZW9IwxFlUGIjPdXRQiQsEtdZOAN7uVi1Cwv8JjMmoIjh8fo94sSzK/xcZJdkP1byePTbxkkrDZYDcH9yuR3M5fkyEqTBMCA4QnetYcGAjvM6NTBdiOXFJ+/jPhxdiQIhOLq+1mwiTVRyErYyDsRoQtIQBuev+jt8lGdUj+sc2KtiQb9KO2p1NRS13S3ENDxMWSWnJJ8Xbuhh1GvIy5MLGNowzHaDVeK8g1nDufaPwS+Z828tUlcloFDRLeagzfKh7jDaAMP2Gk1U0NIBXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv6Nv0Ct6tZLICYJEqb6GxkqSIqHtf5IYWtDjCaDlsc=;
 b=Iv7yyja0Jm6g5wX+XTjfxHOhzPzVBgJuaj6ZmP+mQ0+xJQ8ENXEUbm6VSSntsCFR4qPjzRjsRzhLiBNebskv1BSqo4OhpQsrGXygyvS0CVAJ5ofTsrTakwBx7u0waT4YFQJew128Wn06Rrv3x+YD8JWVc2zyfAiOxFSHPDng3cs=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB7000.jpnprd01.prod.outlook.com (2603:1096:604:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Fri, 8 Mar
 2024 11:17:24 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f%3]) with mapi id 15.20.7362.029; Fri, 8 Mar 2024
 11:17:20 +0000
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
Subject: RE: [PATCH v9 01/10] PCI: dwc: ep: Remove deinit() callback from
 struct dw_pcie_ep_ops
Thread-Topic: [PATCH v9 01/10] PCI: dwc: ep: Remove deinit() callback from
 struct dw_pcie_ep_ops
Thread-Index: AQHabhWMG2mjXAc0akOh/twU+qSlorEtt+ig
Date: Fri, 8 Mar 2024 11:17:19 +0000
Message-ID:  <TYCPR01MB1104093E33C2ED82DC6EAC718D8272@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-1-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-1-29d433d99cda@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB7000:EE_
x-ms-office365-filtering-correlation-id: 12e3107f-16f8-4c77-ebee-08dc3f615204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JnXjPHu/ljPL1RY8VVYFEG3Y2NzhHsiBy9AlsvNtH4ySyreo7KcxRDxjIO/Jwa0z1oRBXyOo3Xh0oH3xnMGfWKprvslqq3MlliLoFA2V9aeyv4ETXKGecnyCPynBP0b/bHK2ld3vzcDhHVHw/s9wUTGPdL/9gRsDFDLXL2Ko1x3r4X3pzfJy5MgKUYRrbTkL3npw0bvFPx/08lSMrL2Es4NTkKjDKc6k9tTnYCZLNFJ63AZt+UT4SqyVn5Rk/2mU8hMUb9eCJnNCxhao4gifg98us9UjT2IfPca8qHjDO+Czhyl8XEWG6D7JLzb9v7iY+IF8DZ8ZOXeEGzHOkBdr8rfd3TagOz69SMr6P/dSde191yIEZFzlG8NpTZrcf2vyXF6U1jLwGrHWpUGgWmOI32nyS3T/Ax9Y+ng6F8otyfWGOAuu9vkFeooTAJc31pxnxFsAKIT+hhibJezqaWSNRpXs7i2cUr+f268Yl9xY1eQmKYG3Jxvu2ZayQ1UNtqJO4Qkk+K5lsGaLFkRXnFWQ5SsSVB74SXur0sm91OloyzoiCQGl6zv9P1sdf1sEj+NzIJWfNG0rwqTf6YL7I0rhHz/0v1NrB0gimAJRLof/2lJaZyj00cMu7zYrAT+fmEPwJdzG8hBgOqXcfk+gOcCsDdpBGlRGLgH+fsUMgNBxeAA4H+2d6V6Lsnsxk5zrc8NUS2hVh3ekq2vcf8Ep7pZjVjA5jokvExVLb8TnmOC/7Ec=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VXMwVzR1STNOSUp0T2ZibkhqaXp1WWg4dkpXclkzdGJOSnNINko1L1pySVdW?=
 =?utf-8?B?ZmF0VTd0K1VHS2U0ak1oazhiNWJSNzlKZ0NaVnNnQWNGNDVkMERjSlpQUyta?=
 =?utf-8?B?NFJmUzJaT3JMdU01bFR1Wmt3WklWTUZXZWZxb292SW1RMHRuMHd3MlJHQ24z?=
 =?utf-8?B?VnVDU1JwUElPQ205TTBMZnl0dTJkYTJ4d3dkUGxHTmZyRElaQi8yWm03NjBY?=
 =?utf-8?B?L1d6R1Jodm1aSG1IQkRDYk9RMDUrTm5TbUg3K01qSCtYdzFEdjlkclJMRW5j?=
 =?utf-8?B?VTdlbmtjcXhDM2tBbDRET0dkai9BazhSWDFCUzB4NjNyY3BxWCtGUFNOTy9O?=
 =?utf-8?B?Z2FMOVNpdWIxbUhvbVZzcVRQVHp4K1BUZzZYY2dubGliRU5SdVk2d1c5eGUr?=
 =?utf-8?B?M3A3SW1heWtoTEh0NVFadU15eC82ZXYzNDc5aCtjVWxqL2tlcGxlL0ZQc21x?=
 =?utf-8?B?bkttdlIxdlBrdktuZVQzVklLRGlHYStWbTZVZVVTNVU2WXdUMEU5SGM3WTEy?=
 =?utf-8?B?ajBxNVNjd2hXRFFTRk01OGplWDZ2cW94dzJVY2d2aTZHdlh6M0Y4RGRaY2c5?=
 =?utf-8?B?cVAvWHpDeGlMdmE5aDAyMVV0c2F0N1gveTdiQmdyUWlTZk1mRytFYi8rN0lQ?=
 =?utf-8?B?cDZCU1E2UUFIVEZlUGV3U0tSQlBraVpZdk5EbWZPUHFIY0dlV1psU09NR2F2?=
 =?utf-8?B?TmVXR0RpRTBDQU11a1dqRjZabFA1VjJNN3hkZ0hNck40Z2pBUVQ2TVdJSE95?=
 =?utf-8?B?VEJmVlpYK2Z1VUJJdGR1V0ZkRWcrcTN2dUNibkxyS05TRDZzWXk2TTRzUm02?=
 =?utf-8?B?TUhSbXNFRFlWZ0MwS3JoU2tHWlg2OGNyT0UrdWlCODhUQm9VdzhYTFNmcUJi?=
 =?utf-8?B?VmszdGtYTHNwSjVpWXR6YlJNdDBWMkdIaUp2K2crUWV6OUY3eTNpT3hlZnpq?=
 =?utf-8?B?YWZiSHJrVVBFcEgxK09RWTF5NUhRWjBVaE0yNnVXUWZ3Z0h3Ni96YzNRbG1R?=
 =?utf-8?B?YkdycHJqa1c3bERxWGhUc0VpRG83ak8yMnhPK0V6c1NlWWp0bXZoQTAvdnAy?=
 =?utf-8?B?NmxsYmJUYUdmV0laakZTUmhIeVhaUitTeXNSM1Rnb2FXSm5XYmQ0ekJDaXUv?=
 =?utf-8?B?cGxNUlJEb1pDTjBQYjFCMDZURDMwVGhYVlNXOVRoanlOb3FWSUJmWFR2d2VV?=
 =?utf-8?B?algxVWZUVzJTRkc4SzRhTi9RaDN1RlFiWEpLNUFoYlplMU5td2dyYlR4MlNV?=
 =?utf-8?B?SUlYZlRwVTlFdGJHUGVFdFhtUXN3eEFHREtyZHN3dWM3NlNPTGdBb0FhenF0?=
 =?utf-8?B?WUhnMEIza2dyQjBZTU5SMWZpR3RVVFQwUlVhRGhIS2JNcDA2SGIwT1JOZ3hM?=
 =?utf-8?B?ZWxTS0lJcDhmYUEwNUxTbXNBbzJzZWk4emJHZDRiRi90L0E0VTVBL3d5WEdC?=
 =?utf-8?B?a1pCZ3dIdnVxVFF5Z1dWTWF3QlNMZVh1M0U2UzlrWExzVklXaXA4cU5IUGtE?=
 =?utf-8?B?a1FnMG5wenVRMEVucEFrTDVxZVMza0EwRHYwR0pXRllrTHRaZi9CQXRHMnJR?=
 =?utf-8?B?cDhxZTEyOTFRUkZIeWR3aVFXRHhmaXF3dGM5UWxJcTI4Y2o2VkdrdnVUUC9Z?=
 =?utf-8?B?V2ZsWDhwQjNCWEdOWEgwNGN1ak0xOG5UL280eTdaaHNaR2VvTy94NERCOThO?=
 =?utf-8?B?TE5Mb2MwWVM0dUNFdGw2M2xLWHpOUG1wZlBpUkZOT2xFdjdXdTBscnhxZ0Rq?=
 =?utf-8?B?R0MrSWtZQ3AxT1NiZ3RHYUZETElzRXhwS1V5YnJmRWgxODMvcVNjL2M3S0F3?=
 =?utf-8?B?SUU0elpKNk8zeDhNdzlDMS8zM0ZSU3dlbGtOa21rV2hlaHJldEVsZUNqTzBK?=
 =?utf-8?B?ZlhTQjYxZkU3VjJNeXBFYVpyZld6RlpFMkJnbVNnaTVwSjhsZ1lQTGJjQzE5?=
 =?utf-8?B?SHFFeXRoNU9rMnZWL0J6enczcS9kcTd6Y1NLR0RKMXM3citENElLbWxTZUo2?=
 =?utf-8?B?UEZmUXNHa3JHUzY2UG5JamhUMmFhY090SEpxMXU5azJsMHFjYVJTVEo4R3JF?=
 =?utf-8?B?dUcxMEJCTWthaEpjSitNM21pR0swbFF6bklJSFdNV2Nkbm5SVC94WU5ldUlu?=
 =?utf-8?B?bCtkTmpFdlJFK3A4SGJYTmh0Yjl0OVMwYmRUNDIzUm44dmI2MXdyYloxWit0?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e3107f-16f8-4c77-ebee-08dc3f615204
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:17:19.9696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W4A2Um5RIFYrnp5EWeSUXW1J1uzcgZugtQ77mh3g2SvK04MBGGQle2HJFs6g3rFtRAl/nLi2ub5FHEIJxaUsF4wUsZ72iFDsTSGawC+lkphlPYUxRXHZWFxBWgwK5Y5u
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

SGVsbG8gTWFuaXZhbm5hbiwNCg0KPiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0sIFNlbnQ6
IE1vbmRheSwgTWFyY2ggNCwgMjAyNCA2OjIyIFBNDQo+IA0KPiBkZWluaXQoKSBjYWxsYmFjayB3
YXMgc29sZWx5IGludHJvZHVjZWQgZm9yIHRoZSBwY2llLXJjYXItZ2VuNCBkcml2ZXIgd2hlcmUN
Cj4gaXQgaXMgdXNlZCB0byBkbyBwbGF0Zm9ybSBzcGVjaWZpYyByZXNvdXJjZSBkZWFsbG9jYXRp
b24uIEFuZCB0aGlzIGNhbGxiYWNrDQo+IGlzIGNhbGxlZCByaWdodCBhdCB0aGUgZW5kIG9mIHRo
ZSBkd19wY2llX2VwX2V4aXQoKSBBUEkuIFNvIGl0IGRvZXNuJ3QNCj4gbWF0dGVyIHdoZXRoZXIg
aXQgaXMgY2FsbGVkIHdpdGhpbiBvciBvdXRzaWRlIG9mIGR3X3BjaWVfZXBfZXhpdCgpIEFQSS4N
Cj4gDQo+IFNvIGxldCdzIHJlbW92ZSB0aGlzIGNhbGxiYWNrIGFuZCBkaXJlY3RseSBjYWxsIHJj
YXJfZ2VuNF9wY2llX2VwX2RlaW5pdCgpDQo+IGluIHBjaWUtcmNhci1nZW40IGRyaXZlciB0byBk
byByZXNvdXJjZSBkZWFsbG9jYXRpb24gYWZ0ZXIgdGhlIGNvbXBsZXRpb24NCj4gb2YgZHdfcGNp
ZV9lcF9leGl0KCkgQVBJIGluIHJjYXJfZ2VuNF9yZW1vdmVfZHdfcGNpZV9lcCgpLg0KPiANCj4g
VGhpcyBzaW1wbGlmaWVzIHRoZSBEV0MgbGF5ZXIuDQo+IA0KPiBSZXZpZXdlZC1ieTogRnJhbmsg
TGkgPEZyYW5rLkxpQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hbml2YW5uYW4gU2FkaGFz
aXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+DQoNClRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoIQ0KDQpSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5z
aGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9k
YQ0KDQo+IC0tLQ0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJl
LWVwLmMgfCAgOSArLS0tLS0tLS0NCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
ZGVzaWdud2FyZS5oICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1yY2FyLWdlbjQuYyAgICAgfCAxNCArKysrKysrKy0tLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jIGIvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMNCj4gaW5kZXggNWJlZmVkMmRj
MDJiLi5kMzA1ZjliNGNkZmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+IEBAIC01NzUsOSArNTc1LDYgQEAgdm9pZCBkd19w
Y2llX2VwX2V4aXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwKQ0KPiAgCQkJICAgICAgZXBjLT5tZW0t
PndpbmRvdy5wYWdlX3NpemUpOw0KPiANCj4gIAlwY2lfZXBjX21lbV9leGl0KGVwYyk7DQo+IC0N
Cj4gLQlpZiAoZXAtPm9wcy0+ZGVpbml0KQ0KPiAtCQllcC0+b3BzLT5kZWluaXQoZXApOw0KPiAg
fQ0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfcGNpZV9lcF9leGl0KTsNCj4gDQo+IEBAIC03Mzgs
NyArNzM1LDcgQEAgaW50IGR3X3BjaWVfZXBfaW5pdChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApDQo+
ICAJCQkgICAgICAgZXAtPnBhZ2Vfc2l6ZSk7DQo+ICAJaWYgKHJldCA8IDApIHsNCj4gIAkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBhZGRyZXNzIHNwYWNlXG4iKTsNCj4gLQkJ
Z290byBlcnJfZXBfZGVpbml0Ow0KPiArCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gDQo+ICAJZXAt
Pm1zaV9tZW0gPSBwY2lfZXBjX21lbV9hbGxvY19hZGRyKGVwYywgJmVwLT5tc2lfbWVtX3BoeXMs
DQo+IEBAIC03NzUsMTAgKzc3Miw2IEBAIGludCBkd19wY2llX2VwX2luaXQoc3RydWN0IGR3X3Bj
aWVfZXAgKmVwKQ0KPiAgZXJyX2V4aXRfZXBjX21lbToNCj4gIAlwY2lfZXBjX21lbV9leGl0KGVw
Yyk7DQo+IA0KPiAtZXJyX2VwX2RlaW5pdDoNCj4gLQlpZiAoZXAtPm9wcy0+ZGVpbml0KQ0KPiAt
CQllcC0+b3BzLT5kZWluaXQoZXApOw0KPiAtDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIEVY
UE9SVF9TWU1CT0xfR1BMKGR3X3BjaWVfZXBfaW5pdCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaCBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oDQo+IGluZGV4IDI2ZGFlNDgzNzQ2Mi4uYWI3NDMx
YTM3MjA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRl
c2lnbndhcmUuaA0KPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2ln
bndhcmUuaA0KPiBAQCAtMzMzLDcgKzMzMyw2IEBAIHN0cnVjdCBkd19wY2llX3JwIHsNCj4gIHN0
cnVjdCBkd19wY2llX2VwX29wcyB7DQo+ICAJdm9pZAkoKnByZV9pbml0KShzdHJ1Y3QgZHdfcGNp
ZV9lcCAqZXApOw0KPiAgCXZvaWQJKCppbml0KShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApOw0KPiAt
CXZvaWQJKCpkZWluaXQpKHN0cnVjdCBkd19wY2llX2VwICplcCk7DQo+ICAJaW50CSgqcmFpc2Vf
aXJxKShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ICAJCQkgICAgIHVuc2ln
bmVkIGludCB0eXBlLCB1MTYgaW50ZXJydXB0X251bSk7DQo+ICAJY29uc3Qgc3RydWN0IHBjaV9l
cGNfZmVhdHVyZXMqICgqZ2V0X2ZlYXR1cmVzKShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1yY2FyLWdlbjQuYyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcmNhci1nZW40LmMNCj4gaW5kZXggZTkx
NjY2MTliMWY5Li5hYzk3ZDU5NGVhNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtcmNhci1nZW40LmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1yY2FyLWdlbjQuYw0KPiBAQCAtMzUyLDExICszNTIsOCBAQCBzdGF0aWMgdm9p
ZCByY2FyX2dlbjRfcGNpZV9lcF9pbml0KHN0cnVjdCBkd19wY2llX2VwICplcCkNCj4gIAkJZHdf
cGNpZV9lcF9yZXNldF9iYXIocGNpLCBiYXIpOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyB2b2lkIHJj
YXJfZ2VuNF9wY2llX2VwX2RlaW5pdChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApDQo+ICtzdGF0aWMg
dm9pZCByY2FyX2dlbjRfcGNpZV9lcF9kZWluaXQoc3RydWN0IHJjYXJfZ2VuNF9wY2llICpyY2Fy
KQ0KPiAgew0KPiAtCXN0cnVjdCBkd19wY2llICpkdyA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7
DQo+IC0Jc3RydWN0IHJjYXJfZ2VuNF9wY2llICpyY2FyID0gdG9fcmNhcl9nZW40X3BjaWUoZHcp
Ow0KPiAtDQo+ICAJd3JpdGVsKDAsIHJjYXItPmJhc2UgKyBQQ0lFRE1BSU5UU1RTRU4pOw0KPiAg
CXJjYXJfZ2VuNF9wY2llX2NvbW1vbl9kZWluaXQocmNhcik7DQo+ICB9DQo+IEBAIC00MDgsNyAr
NDA1LDYgQEAgc3RhdGljIHVuc2lnbmVkIGludCByY2FyX2dlbjRfcGNpZV9lcF9nZXRfZGJpMl9v
ZmZzZXQoc3RydWN0IGR3X3BjaWVfZXAgKmVwLA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd19w
Y2llX2VwX29wcyBwY2llX2VwX29wcyA9IHsNCj4gIAkucHJlX2luaXQgPSByY2FyX2dlbjRfcGNp
ZV9lcF9wcmVfaW5pdCwNCj4gIAkuaW5pdCA9IHJjYXJfZ2VuNF9wY2llX2VwX2luaXQsDQo+IC0J
LmRlaW5pdCA9IHJjYXJfZ2VuNF9wY2llX2VwX2RlaW5pdCwNCj4gIAkucmFpc2VfaXJxID0gcmNh
cl9nZW40X3BjaWVfZXBfcmFpc2VfaXJxLA0KPiAgCS5nZXRfZmVhdHVyZXMgPSByY2FyX2dlbjRf
cGNpZV9lcF9nZXRfZmVhdHVyZXMsDQo+ICAJLmdldF9kYmlfb2Zmc2V0ID0gcmNhcl9nZW40X3Bj
aWVfZXBfZ2V0X2RiaV9vZmZzZXQsDQo+IEBAIC00MTgsMTggKzQxNCwyNCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGR3X3BjaWVfZXBfb3BzIHBjaWVfZXBfb3BzID0gew0KPiAgc3RhdGljIGludCBy
Y2FyX2dlbjRfYWRkX2R3X3BjaWVfZXAoc3RydWN0IHJjYXJfZ2VuNF9wY2llICpyY2FyKQ0KPiAg
ew0KPiAgCXN0cnVjdCBkd19wY2llX2VwICplcCA9ICZyY2FyLT5kdy5lcDsNCj4gKwlpbnQgcmV0
Ow0KPiANCj4gIAlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1BDSUVfUkNBUl9HRU40X0VQKSkNCj4g
IAkJcmV0dXJuIC1FTk9ERVY7DQo+IA0KPiAgCWVwLT5vcHMgPSAmcGNpZV9lcF9vcHM7DQo+IA0K
PiAtCXJldHVybiBkd19wY2llX2VwX2luaXQoZXApOw0KPiArCXJldCA9IGR3X3BjaWVfZXBfaW5p
dChlcCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmNhcl9nZW40X3BjaWVfZXBfZGVpbml0KHJjYXIp
Ow0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCByY2FyX2dl
bjRfcmVtb3ZlX2R3X3BjaWVfZXAoc3RydWN0IHJjYXJfZ2VuNF9wY2llICpyY2FyKQ0KPiAgew0K
PiAgCWR3X3BjaWVfZXBfZXhpdCgmcmNhci0+ZHcuZXApOw0KPiArCXJjYXJfZ2VuNF9wY2llX2Vw
X2RlaW5pdChyY2FyKTsNCj4gIH0NCj4gDQo+ICAvKiBDb21tb24gKi8NCj4gDQo+IC0tDQo+IDIu
MjUuMQ0KDQo=
