Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FC690C8E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 16:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCL3q6NwZz3f64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 02:13:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=KWZgen4h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::610; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=KWZgen4h;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCL2v1H9Xz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 02:12:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUUmNEChuWVZ5nK5Sh0sL082WPqH9N3isjKkdGqFIhWN9nVp9AuZc578ih+L5uq3gW/sMKhrviI1NNqJJXMEmNqNuX9aV+5CIerVEpiuvm0axDTLL9oEwHYWTVRUw491ItoQRr9NRDNCiUWOdVg7YNCGFwveMhrq3KB6pygplGqrHLY6kv1HSIDHNRkAz/Bj3OZOzQmchsKFRJ5gkJGtVBqXvNfhpAXL0cu6ZC1DFuDCwsdMgkpnDYRoCtzFOXF1qoZ5zjkXvSqKOigI1wW1erPQVZ7UfNyBPLQWmy9Wf+9Rvvh3hWtxYuAK1AeVzu0VRSfeh9vm7pPQfehLuMAM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L043QECKaW17TkGogH3WZMXwk8LgBZNky9xxXFZx0oE=;
 b=dkirRjwtU45PHct80Dhk8MFOuy+tWAVMLCEsJhost6/5EA7dI7vd5R5MvQ8bpfOA1gQgTfwHXlD5ofy4KnH/hE5gdS4IGsVOxU73NSblE1sUFFBChO3ZtgIUgGZpVjG6xckUtUnxrli6fhL3jz4qVgg9SZnFiyfYCjyEYG4mhtE7YNgQgJ8Te46kjdKKS9yuc2qusqFCiCyeS5F0tz3twv2xlzhy/Xk78iQIl3GFrTjDTxnhjk5PfxZn4TC8p9HSvSGgwiVdfU4JqkKUZXnHFWM8m3NXVQcaBIu9dw4sQy4ItHGtEij//wjNXsuRmihdnYTdcUJxsoEWKbS7Jdwe4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L043QECKaW17TkGogH3WZMXwk8LgBZNky9xxXFZx0oE=;
 b=KWZgen4hdEzFEOcyorVQLEbwDxoKN/gvMysP+TTuL5fVgeX+r1/EVg2PbvNEQjw9krqNzH9ashmppY6wnxPC89/0CT+DbvYwbR9DKaTuHzFEBjTb3jlvEhfqxrtlHSbZDTsvv4fbhya3NGK4Yias0Lg70JIomR6iD2bA3eM9D9M=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 15:12:35 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 15:12:35 +0000
From: Frank Li <frank.li@nxp.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Bjorn Helgaas <helgaas@kernel.org>
Subject: RE: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
Thread-Topic: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
Thread-Index:  AQHZJrz7UNBwg0aD+0SFGvc7zfwgFa68DdDQgADCWgCABwHIYIAB+G6AgADNRICAAEySAA==
Date: Thu, 9 Feb 2023 15:12:35 +0000
Message-ID:  <HE1PR0401MB23314DE22C95A53D63946B0F88D99@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230208222311.GA2490083@bhelgaas>
 <46998ff6-bb1c-528a-a135-e492dd0a2cdc@oracle.com>
In-Reply-To: <46998ff6-bb1c-528a-a135-e492dd0a2cdc@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|VI1PR04MB7005:EE_
x-ms-office365-filtering-correlation-id: cd18969d-2b38-46ec-2a26-08db0ab01314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PIq18K6ScPJ/zGCAbIVzZfnG3XewlV7LRa54CRc+L9Vm4Qjgiv1sSi1Yg7zEjjyGTDUQ8FaR1Q8WP5pd+4meCLTkPw71BdMllgt2C5GO7g6h7NlXnB5DgrLt8YU1fbGr2WuRl8yx6Qtyd/KOaMq+f/6wVgmnLSqoiB5Wt0ED9pw+DvPpBhS/k8J8gyweXUlSRNqWQybec7UZSNE3OnGH/wlLdAuKTIqJCMyKUyGMzTNvCpwITJZP/V457Rue1c1aTyeETMUcuqgV5rwmPjS36z20c2XBcR/cmpeECDz41tWw8pBrChzeAekCDS5ee/+Lna6fYGhQOZaKvQw5qHO+snu85BC0GJC9ldwQNQ2VmEVJrDBYfAgH28ZWJ5sVmCIx76H+8LecG99qmUInaG6A2HCmDPBvyiH9Q8PcPO/RcULOJWD1DbG5dAEO41AXNyb0um2eRQ0uXCT4l8MhYb41bY+r6S5CtZberf/+2CLPWYuHh5/WfRnQuYqTlbLoDA4N3XA7SCjQayS9E44/y0YAoWah/mYOfO49pozgggpxlzcRK7sQZNXQvMnf4yJygfL756wPoIOzxk3qzYe27WnwM4RRR1447roz9YX94FDrcWpyidAatVLnBu7WUVPmMYEZsaTipE+AS8eX9WkcmbDBEqw2617oGveJi3p7vfGOzTCvjO1YqIQEsxRWdG1xY9EP5mmD/UtugqZEHt4WNZDveg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199018)(8936002)(2906002)(5660300002)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(66446008)(44832011)(76116006)(64756008)(4744005)(52536014)(316002)(55016003)(110136005)(186003)(9686003)(26005)(55236004)(71200400001)(478600001)(7416002)(7696005)(6506007)(54906003)(33656002)(38100700002)(86362001)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TU53SEszSklKb294VUNBOWo4K2pVVnlzenZCY3AzSGNBTzJPUGRsVzZSME1X?=
 =?utf-8?B?eTFOemZxSEh5NURyVFlpdTVScWxWSCszZm1VNmpJRWRjbDlJVVkyMVVJbW5n?=
 =?utf-8?B?ZFFQYUpaMUZOaVVvWDR1Vm9pbVI2QWEzL0t1b09HKzZ5VmNvczBYWSt6eUd6?=
 =?utf-8?B?SzFFS3E0YkMvRjFTdUNaRjZBbk1LcGJYUTkxaVFmcmhJSkJnU0xSWlgxQWQ0?=
 =?utf-8?B?R2JtYm05U1FldTYyU1BiMlZkQ21yZ2JDTkYzZGtLNnp4bUp2RnYrT2ZEam1X?=
 =?utf-8?B?NGNZaWxoNC91Y2Vrb0R5N2FsQ1N1WG5TSUpLd3lGd0lHaVVGQTV3V0xESGtw?=
 =?utf-8?B?MitTTjdHcEF3anhjRXRxTVMwSjJlTjVyUmtUdDYvbnd4M01vL0tsczg2RmlL?=
 =?utf-8?B?RlgxdmFwa2pFUjdYT09DcEJVYnRBNVV0U3JDbHRFVTZkU1R3QmxmSWJZUU1k?=
 =?utf-8?B?b0w4bEdLRFJuc0l2N1RMKzNqN0FIbXp0RENkV0pGY2N5WHZGeCtwZHBLR01L?=
 =?utf-8?B?VlZBVnRRNXk0S1Bhc0FjMG9zWWttUnVFZGNUdEtWRWFqcGpLOUQyL1dsNjVm?=
 =?utf-8?B?TGZtdUJBWGU0SW04dEoySmFGZUlnNForRTBZOG9hdjVEUHkvMVVFWExUaUhh?=
 =?utf-8?B?V0R2cXZON0VQVllESWVKZnpTMFFsQk9TenlYQm53Y2hhQTVvYmZrbEdWNkNj?=
 =?utf-8?B?OWwxbGRzaWdLQTI0SlkvUGZodTZiY25kNFRSTlpYR05wRSs4bFVaZkRJMUtM?=
 =?utf-8?B?YlpYOHh5eEprK3FkMWdFYTNTWTFmbWlRbDR1VlpjVldXMFhwMm43SmVvbDlp?=
 =?utf-8?B?bFpTTjc4Z1pQUWRBUTBHSk52TVJxdkNMNmZlNTluY0RCN0d3SlY5OUpvcGcv?=
 =?utf-8?B?SWpjQ0N0aml3VjBDUGdna0xWaVJ1TWdhQ3o0TlFxQVpkVERnYkRaVzNrMVhu?=
 =?utf-8?B?VVdFU0dFSGhNR3FKWUMzZ29manRMdjcreHg0QXhIOWJtVHFyZnNvZFN3NmlF?=
 =?utf-8?B?bmlJMStubnFUMGtJM2JmT21Uc1lOeVdRcXB1RXFuOW1vNUthLzJVbnZ6QU9k?=
 =?utf-8?B?cFVPdXdTZ0lkTWZGTmt4TlZXTmtoRTU0WFd1aytwNlcyV2dxTXExdDlKY0U5?=
 =?utf-8?B?Rnl2YlJqU3NsQkxwWmdGSkNsd2VxR1h6QXg4RzR2cEoyYUFJYUpocDJtbHY0?=
 =?utf-8?B?ZUIwYWRRbUwxeEhpQ1F6TVlhZDZsQzRXOEZIOHEvUlE4NkhKYUtGTGNuZEJK?=
 =?utf-8?B?K0pCN2Y5L0FaN042OW5PdGhXUWVsb0J0RFZ1Kzc0VUxRSTVDb2JodWdyZWRi?=
 =?utf-8?B?RFpmUjRiY0M1S1hzcmpKUE1pcVlkMXoybENNNHBTeGluSWlXdDdtSytSc3ZV?=
 =?utf-8?B?QjhDci83Qzk0UUNRTkd6L1hCY2k3YzE4NGpMUHZCRWRIWGo0R3lSVGVtOXFa?=
 =?utf-8?B?RytIdERudEhiNzFLdHptdHVhaldXRHduVVN5bDNHZk1ZanlFdFNMZ1hiY0x3?=
 =?utf-8?B?N2VBS2Y5dk5Oa0dhYm4veWlDWUJlbFB3M1Y1TkpUVGltc2p4Q3pqdHFDVy83?=
 =?utf-8?B?T3dzWjQ5ZHh3Q0hsVzJiUlFBWGFHT21mTDV5WEVpTkwrRzBlbkQ0TVRBaWNC?=
 =?utf-8?B?U2hoZmhsZDd6Ynl6SjI2TW0wYjhjbFY5NVBWNGtLNzd1MWl0Y3VPc1lQOVFl?=
 =?utf-8?B?d2lLN01vV24xc2tTd0hQd0JySCtzK0FRQm03M01KWTlhOS9icGN4Q0M3ZExv?=
 =?utf-8?B?c0dtLzdiNmtlVW1Rd0JoU214K3pMUHZMSGFKdmppekVjc282L2poTFRoLyty?=
 =?utf-8?B?bUhOSGw1YWd0cmc5a2JCaTRMY25mTlFLdkI3NW1Ba2RScGdVMmgva2dDT2Ux?=
 =?utf-8?B?bjRRbUZLSnZZbDdlZWUxZStjbEw1Sk1CelFQK25DOXh4UW1tVVNycGxpZUVF?=
 =?utf-8?B?dldNcFFOV3h6ZmFkMTd3bU5LZ0I3U2Q2eWFjUHI0b3hCUVZwUVZ1NnhkOHFj?=
 =?utf-8?B?bzZTejRIZVl4R0dCbDRXK2p2WkQ3U04zV3dtYlI1UDI5SlBUeHpPYVh1TkVT?=
 =?utf-8?B?cm5OK3NobVo3UzU1am1aMmFGTEJOYm14UmlZb0ozeGJ4YWtvcTRsTUlHam5k?=
 =?utf-8?Q?Yc7I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd18969d-2b38-46ec-2a26-08db0ab01314
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 15:12:35.3042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ey3ouM8C+SFRJptMQ4szQw1bTzpfPZpA324Jb7sQZQWOZWhYAfm/G8zCywA26mHzP4M58RMFdy8ZwDgghKYi4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005
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
Cc: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Rob Herring <robh@kernel.org>, "open list:PCI
 DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "moderated
 list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IHllcywgaXQgaXMgbW9yZSBhYm91dCBz
b3J0IHRoZSBsaXN0IHVzaW5nIC5kYXRhIGFuZCAuY29tcGF0aWJsZS4ga2V5DQo+IA0KPiBtdWNo
IGJldHRlciBpZiBpdCB3ZSBrZWVwIHRoaXMgYXMgc3VnZ2VzdGVkIGJ5IEZyYW5rLA0KPiANCj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsc19wY2llX2VwX29mX21hdGNoW10g
PSB7DQo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1wY2llLWVwIiwgLmRh
dGEgPSAmbHMxX2VwX2RydmRhdGEgfSwNCj4gICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2ws
bHMxMDQ2YS1wY2llLWVwIiwgLmRhdGEgPSAmbHMxX2VwX2RydmRhdGEgfSwNCj4gICAgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llLWVwIiwgLmRhdGEgPSAmbHMyX2VwX2Ry
dmRhdGEgfSwNCg0KVGhhbmtzLCB2MyBzZW50Lg0KRnJhbmsgTGkNCj4gDQo+IA0KPiANCj4gVGhh
bmtzLA0KPiANCj4gQWxvaw0K
