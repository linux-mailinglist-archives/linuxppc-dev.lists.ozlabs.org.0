Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8D4311B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXq6p5G6Wz3bVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:00:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VPY0PSWs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.95.62;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=chaitanyak@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=VPY0PSWs; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2062.outbound.protection.outlook.com [40.107.95.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXltT6p7hz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 16:34:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkFlXdP7nxzGzd+Jpr2dtvsYaEvX4WEANNCQwukksK37LWnQSz6xoqkrFfEL85mGi8Jvy09xs+guBZe8hw9E2xhwLRBfDhg62pVwXImhMazjXf0q8O75kYDJQEJnJW+Kgn+qt3cnC4cIHCyxVCeOvkNm89T1Gi6dQJIy4yM3qODVN3+9hWRN456w0FeYQ2jtK8ija0Dx9RLJMFA4xJV7cX5m/G5+oUO1Lhe62a/bCLfg0FE1C3vJp6N4SSFlPy4603k+jJyL8rXFl4bqT6yJ6WqNYnwasHg4xpnKySVrjK52wtlLd2WrUF+lhcDa/pnu7DZR5+tu9WV6JUO48n98UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8HfABdoK1WORKK1qh7/5b/I1BJF0sx9gWERXBVzWuU=;
 b=bfd8uKXkLd4n9SG2/3WyiMjWC19JXqudqVh/sSDRYKjGCtE4vY/o40nR6DMPqylFd2uhB/EMdXQkfZfHR70FW7M/k13hb+IS8hxdoOiwPCE/o4Tmb8sCHF5NsWYamWLDxyM3Y6Yg1xUdwUlaS2JWOTKL3ZFbQLo7+XDYc3QpmLwQaF80pkxKur8ru9ObLEVchopXX8ECdlb7Q+1KQyIexyZbaVNDts2dAkvbxOfZSdVGH0cZuQPbZPayt05np241fiew0Dl+zQeBpr+G6grny8VIhdFb5kimtCAVncEcK0P1K62WrN9tlpSFfa5swooeUGfsaIiRtGsnWXH4WZQqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8HfABdoK1WORKK1qh7/5b/I1BJF0sx9gWERXBVzWuU=;
 b=VPY0PSWsTOkiwPuQ+Gy3mDHnh6AGxtn5tp4cobGCBa2+b7KTk8s4LHnD3O/yKbObuzEjtDEKihuvuekiy4PmfPli7g3vxdZvARMXA0OWicJiYGUNbt7mDU1sVLrxonY11Z8La062K2QSMphCJAtTkrldvnvBQ2TqUgdEJ2yotII161jliCy/sDojfz5Q/XsuLtYSKBnwAkwZ3WlJ1IM+MsNF0fG+uqPtqZ9f41LCVWcVZWMA1WjdKcM9ounxYA7qfMw/6J8/OgQq9Hiq1NvRSfq3+Bt7PmazFZypZBd+DXZ9seCRmYn08TLxugB0OY8iEe077gJjbZD3ghFddGDgsQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MWHPR12MB1392.namprd12.prod.outlook.com (2603:10b6:300:14::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 05:34:13 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 05:34:13 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
 "geoff@infradead.org" <geoff@infradead.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>, "jim@jtan.com" <jim@jtan.com>,
 "minchan@kernel.org" <minchan@kernel.org>, "ngupta@vflare.org"
 <ngupta@vflare.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "richard@nod.at" <richard@nod.at>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, "dave.jiang@intel.com"
 <dave.jiang@intel.com>, "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "sagi@grimberg.me" <sagi@grimberg.me>
Subject: Re: [PATCH 02/13] nvme-multipath: add error handling support for
 add_disk()
Thread-Topic: [PATCH 02/13] nvme-multipath: add error handling support for
 add_disk()
Thread-Index: AQHXwh/gt9PBjaNbHkuXMsY5hErhlKvYP1AA
Date: Mon, 18 Oct 2021 05:34:12 +0000
Message-ID: <f312b3a4-3ab4-9897-877b-458c3eed2dd8@nvidia.com>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-3-mcgrof@kernel.org>
In-Reply-To: <20211015235219.2191207-3-mcgrof@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ec7078d-13f3-4ede-db03-08d991f8eb08
x-ms-traffictypediagnostic: MWHPR12MB1392:
x-microsoft-antispam-prvs: <MWHPR12MB1392BC181B77D6CBECD3BC36A3BC9@MWHPR12MB1392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hnU4B3xRvwjiOSouMQqysCjomKBb02Wuw18TyARuD9GH/KJVdoOLqregaVb4vU7xXRyLYsNq0Dwf+agfKf2O23hnILk0hNg8rYVexMeYKLN7vD7drdgjsnwxqOAmPWTsAmz/lR2kF8JM5YwMlQBGQk22MvafBByuhCHVonEY57XziIrb1kOZOXWuddAfHrDCWnGChPQGL8+jJ3YuuCWeZ8URDbCcfVx8vzi6JlVeypQHjYBPAwaDuMDvxlGIUBCSbW/hxgS3EalQFT6WoOR6m5wieN6oSAnC3TI5ddiseTnSFCzwSmKwBd+QXZLTcYK4euYrz4Ij0FPfoJfyXSJU1bDS74O7NhN42t19+DCv4i9XpyX7qRr9ERfT27XnGUpOQlWkyAJ6rSn72tS9KZd2sCLAG0nVwzwylRNl142HJUnQX9vUGhmqAfPyH//O/RbjJiuqzR3JBCgUshr+kjOeJbmwrO+d9rkc3mEwqHPK8ecXwrAwmIjTQfxz1r1d1m+qW2RmVLCCd4g3pyKygeohyjOh9eulxYgqRzOUbSqN8Q1mgGiMZeAWoH0C5AElkJP70svFmljlAZO+6PvxC4ZJ1wcPamINPxY7+cfyjcjiusYmxJF/N2aPj9FySLSQ2MoC9OzdirRFjljEO5/BDe+X7hV1yE5Kb0KSg+afGpb8okp14MbuwysoPJQJyzCGqYx+0FGLuY4Ubi1fjaKsTYfC+xsy8f3iDJHIkVhF9t4zdmUsTYFJlKIb3vRfsH/NrZXR7rO3B+ra2yjIk2Go4/kNhgPylWQDNJDqs89kg6Q+qAI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(4744005)(31696002)(8676002)(31686004)(38100700002)(2616005)(66476007)(91956017)(66556008)(36756003)(66946007)(26005)(86362001)(921005)(6486002)(5660300002)(316002)(66446008)(64756008)(71200400001)(6512007)(54906003)(6506007)(38070700005)(8936002)(186003)(53546011)(508600001)(122000001)(110136005)(4326008)(2906002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWRkOUtZdmVraGNxOUJRc0ZObXZlUGQzZFVOSDZvZzlDWm1rK2Ixbi9tUUNJ?=
 =?utf-8?B?OEVYdjhnZEVwYjR5U2NHVFMvNzdRaFZGaTdKTm5FY3NrR2Z0VUR3SGFhc1RB?=
 =?utf-8?B?Yk1qNm8rbGtTcWtnT2lhMDRZeTVUcElNTW44UTRSa0IwVFZDaXcxbUU2cEsz?=
 =?utf-8?B?a24rTTNqa3V1bXhJdDFNb2dUUTN0ajVLTDNpeml3U0RXb1NCaWJFVmxuN1Y1?=
 =?utf-8?B?Rk1GKzJxZzBlcjJpODIwVnQ2eEpPZkhaSTBKQk9Uajg2QTFrd3F0Q3g1amRH?=
 =?utf-8?B?bWk4d3k0bnRLR3hPR0lBNmFRU0phVy9FeElWMTZsTHJRSm1lcytERXAxOWZ2?=
 =?utf-8?B?RE12M0ZUcDE4Y2ZpTWp3R21hQ1U5Rkg3SXFiZXNyeVJiSXF5TW40ZCs2NVJt?=
 =?utf-8?B?dlJ5TStuNHdaWm9Cejh1aWc5VCtRV1pKdk5Pbjc2SEZvRGdEWkVDVHZuRS9y?=
 =?utf-8?B?dHVDREV3RzRuNFVIdlRXS0hVU0RCLzdGQm5GWVZrcDhhU1FPRExwRUJMM2lX?=
 =?utf-8?B?TFlkcGttS0YzSzFuWHZzUnBFMGV3T0wyNncyQzBWRTJqSDlrcy9ySjREWll6?=
 =?utf-8?B?ek9rS1AvZ0l5WmtpWjZuWk1JQ1FaNU10R01aNERSWXVERXhKQ09jVWxBVlN4?=
 =?utf-8?B?UWNjZjlXZGd0V2xrRkkxdGVITGJvWG01L0V2SW03d3VURldmczNWbXllYnor?=
 =?utf-8?B?TmVtTGt2UGkxQ2xrelVmQ2hMYnFDM2lOTUg1UkE1bW1zQjhEajVEb3R2dnZw?=
 =?utf-8?B?NnJZZG1FWEpWVmg1MWpJRWxrOTdMdE01UGxnSHZkU0NObkhlTGlnOEdvOVBG?=
 =?utf-8?B?U1owK045Wkg0SjZISWt3cHdQWlpvK3E3aUxGeWprV2pnN0xha3o0WjR4cm5E?=
 =?utf-8?B?NE5sdW9Hdm9FWTVPT3o5c3JKWXBpZzFrbjdWdlFtVEpxMWFGd3dvNFBpNVVJ?=
 =?utf-8?B?SmhCNkZPVElPR0lMbWoxWWhPRzd3Y1NaMC9FR2xwcFZsc3doaVlwYk5yT01n?=
 =?utf-8?B?bFNTc1JBeGNuZXJ6Z0dxWjdXajczOVM4Zlo1LzNQNmNBdXZXQVJKZUMzTGtp?=
 =?utf-8?B?bHVabDZpeTh6NEozclV3cjYrbmNMaG9JTXFzdCtlY2dhckpkTTVZbUFXUWJM?=
 =?utf-8?B?d3kvYjdFN0hGMWFPWEIzTlFRdmZnYjVwSy9Gci8vMWNFRWwxaFRHWldFWVZJ?=
 =?utf-8?B?Wm4yV2RxTEN2L2RKLysweTQvYnpOYStpbHZKNTlkVE9adyt2bzJSR3hweWlB?=
 =?utf-8?B?UUpLcUhJV2xtREpubC8wTGpvRkRvNFNPVEJXWUlwV1lxVUh4aGMzbE1UV3dH?=
 =?utf-8?B?UWR1eUFRanA5UlZHOGNFUmdlcWpSL1kwY21mTXpmbzlQZ0lscWt2cFhvcEpm?=
 =?utf-8?B?aEtaUlVMUlEyYk9OdVlxOFFGcG9MRStoYWozSytlS0lXVFBMZEtENDlYZ3NJ?=
 =?utf-8?B?UVRxeG5zM1lUY0RISVp3Y3RsSUt0MFZPSmpPZ3NBNmVzdjE1R2dhMGJnL1Uw?=
 =?utf-8?B?bE1pdDJ1NUxHWkYvV0ppQ1lWZDFIcjZUZ0xWa2Z1b3pORW1ZQTZ2a210Qm9N?=
 =?utf-8?B?cTl1Nk5OOXdqcy9jdTEyZnFVU0JpNUt6ZjlLcDFBWVFIQkVOSm10NzRkTFVR?=
 =?utf-8?B?RnI1Tlp3WXpkNHJMNHpSd3JNYk9ib3hLMTlWcndkUU5sOFVVYlZBanNqcmE3?=
 =?utf-8?B?Ym4xb3B5aGlhcll3Ky9adllNY3M0cmUzVTRQUVA1UXUvVTdqdkh1b1lseHov?=
 =?utf-8?Q?hdbZFygMUyfHaK4PRM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC59B2D1E544344EBE8595BF7C37E65D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec7078d-13f3-4ede-db03-08d991f8eb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 05:34:12.9159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e48IYkwRDv5ix58u7PvCUuSAFRDuEuaTh26Sash1lxDI3Nc/Jr7Rs+h8O4hbWL+q2kLtPNY32fFGrrw4+jV3kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1392
X-Mailman-Approved-At: Mon, 18 Oct 2021 18:59:39 +1100
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMTAvMTUvMjEgMTY6NTIsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6DQo+IFdlIG5ldmVyIGNo
ZWNrZWQgZm9yIGVycm9ycyBvbiBhZGRfZGlzaygpIGFzIHRoaXMgZnVuY3Rpb24NCj4gcmV0dXJu
ZWQgdm9pZC4gTm93IHRoYXQgdGhpcyBpcyBmaXhlZCwgdXNlIHRoZSBzaGlueSBuZXcNCj4gZXJy
b3IgaGFuZGxpbmcuDQo+IA0KPiBTaW5jZSB3ZSBub3cgY2FuIHRlbGwgZm9yIHN1cmUgd2hlbiBh
IGRpc2sgd2FzIGFkZGVkLCBtb3ZlDQo+IHNldHRpbmcgdGhlIGJpdCBOVk1FX05TSEVBRF9ESVNL
X0xJVkUgb25seSB3aGVuIHdlIGRpZA0KPiBhZGQgdGhlIGRpc2sgc3VjY2Vzc2Z1bGx5Lg0KPiAN
Cj4gTm90aGluZyB0byBkbyBoZXJlIGFzIHRoZSBjbGVhbnVwIGlzIGRvbmUgZWxzZXdoZXJlLiBX
ZSB0YWtlDQo+IGNhcmUgYW5kIHVzZSB0ZXN0X2FuZF9zZXRfYml0KCkgYmVjYXVzZSBpdCBpcyBw
cm90ZWN0cyBhZ2FpbnN0DQo+IHR3byBudm1lIHBhdGhzIHNpbXVsdGFuZW91c2x5IGNhbGxpbmcg
ZGV2aWNlX2FkZF9kaXNrKCkgb24gdGhlDQo+IHNhbWUgbmFtZXNwYWNlIGhlYWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4NCg0KDQpM
b29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlh
LmNvbT4NCg0KDQoNCg==
