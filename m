Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DE5B6B47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 12:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRfBf5jsJz30Qc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 20:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=i3VStD8G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.25.107; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=i3VStD8G;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01lp0107.outbound.protection.outlook.com [104.47.25.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRf9p3BpQz2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 20:01:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZh7qAnTv2jBRbUYsAXc3ucr0psoaWrZd4AGqyUW69AM5aVVl9Z/5AHtuuzeiS/IlocPU1eHUa3y+WEZFCXemKR/4ZiESHqx0kdpcCJuv09o6DZD+r5v9wFW8pujqJ/ddjYYRFzIaDKmEpWDyDtW4kfdzROSPZqbGfXyxuM+Uel0ZzWSUfvZ7HwkGcZtuESUFthAnxsdk59kuZmNC452WAzIRBxAZ1CBf1dqdkkzshAhDKe4EvMeXq6nitAdUrvisxWXE1e/dX8XgmcOgouZss2zU4xoBcYVSS4FZx9X1emh6xYiS5PCDZ7l7Juc6LeHBPi5NUvwDmZ6XJ8dtQ3p3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e0eWYVpSWLK45GfKVJnBrcsyWPuDLiPEgepQjOIkWU=;
 b=ICZ2UkzPGVRUSab52eWOKz4Nm11ygrmoCPNrbCUHaLnAcDxS/Lo0NWrlcIBKHJQpG9oIQkpQaWSI0j6yeTJQH0CAYUKCQnRtgOhUGlitxOAds9V4KiIqbrOWh5zw1fp8Rc1dDm02PlqSSA7l3Ug75rRzfcmuVFShS7LB7vLXyb2+SSaYpMMbgiYBHiJqyLAFrcqx69+LowvZWqn2ugGHzfjHKcaGhybS2nDcy2KoCJ/tx3J4O1Pnbh1Zv7h9VulyNeWLahMkR6T2SGVwMHES7foprQQccE6oR52wumAmRbOW/XKFe9tYz+wrmazOUEoxip6SwkkKuDRxd8nkAZGSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0e0eWYVpSWLK45GfKVJnBrcsyWPuDLiPEgepQjOIkWU=;
 b=i3VStD8GtkYCSTm07Uk1sFJaXOC6kewdt6PtdW82IwCtvYX3mIx3DVkZmCZCpweJHCXwU1OzaXHYQYeWQBE5x4XtlvLCYuHVrCKY7ICs9RlajDM0EkfS68zc7KzCNm2VPFcKtQ3/PqqIH7jtLmuRFAQPCLibNcMu9JtKf/+MD0V8S5VwYUUd1Lz7z8xEH4xSQLVZaGzs9lYCMD5vWXN3dqmWsVFx/GBY+h6q6jXNZ0CD4KLl1eEXvUYBKskosBxtDIE6qGEEmFp/9mStxAreIOJ8E8cuklSvURHXTAfJvNHZ+RX47/JeFRq2p978nliH+uLOhYZ+iewwPC4T2BS/GQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1613.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 10:00:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 10:00:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [PATCH v3 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index: AQHYxoDDsIr7ToClsUKAbgLROETTxq3dIlcA
Date: Tue, 13 Sep 2022 10:00:39 +0000
Message-ID: <da04b704-dfd9-3162-fc07-62d0a0450973@csgroup.eu>
References: <20220912082020.226755-1-sv@linux.ibm.com>
 <20220912082020.226755-17-sv@linux.ibm.com>
In-Reply-To: <20220912082020.226755-17-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1613:EE_
x-ms-office365-filtering-correlation-id: 6e33b187-9349-4364-cefc-08da956ed000
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  K62ZvK3WZ2DZ05VNuobQUn9ZTg+kmlaTTK+3qjP/vVGkw89TA96agYogUnL4aQ+0RqyhT/aMDcGnewyMCyhCMF9TGg9LxT44m85Xsjew10iHJqmzWqYJUIZZBKVC4MvIERSBVnfK8+c2BEAd+uv6y3ey9xyh51NMxdYcCNCTMYIXvAN6dSzXY7KNk7yVk9DCiAqZDXAMlG4J0f8RqGV0fn1YcloYxgqlgodq/Ce+arJss55TVPqXsHLWjP/90la5al/rDKGHNHz0xl1my1n86maztk8+GU+HJT5LPUuX/nrOF3mruZFeA17mOxoXvzheymV7mtY177eg22oMTuR4amw0XBvN8P9nR6sRI9s3j4Tr/eYBuuKUGGGVrPpxPVBz6yjurGys3sXvdI2LCYCPYmr7QxOdQ8RMyf9Uovl5D3utIMSOrUQEHDXBJO1Ze+J1URSpQ5UJ6LsVW/y6BEfVLxWdtwFrPUMNT+F1PIgLUyytHClFU+y7i772RaOvcnaHC5QDWrzzRvCkM3o2MFB8bmvKKR6/rqfWCJTE+mwwl04gxsv9Z83r7N+MoMELqz6Fl59ZwVhOuoecfLFB4XPTaphJefXNBIy1uV8mwP8qcHdc8yO+vk2npoGPoDRzGW2cQlpSgYkqFCT8cnbodIOyB0ZQzn1Hgni6SqkvxGkSIaYcHH4pF9/+xBm7myLqtK2ugCCmbR/UG650QfWtirszc4QQjs+zmi2qkFbJLS5hlD2v16d4sKC5pXFW+9A9+r4ggC8CsgGME2vfxhSBR2tuplOJRq6AGpa5uezV/4gbUFBpiyi2NkilGfg1AkBeFmQu/E67XWf1uFNFlbEftC7f3W5mLK4p7CBZLaRipDNAIIc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199015)(478600001)(66574015)(38100700002)(2616005)(86362001)(6486002)(7416002)(186003)(6506007)(38070700005)(91956017)(54906003)(66556008)(122000001)(110136005)(41300700001)(66946007)(76116006)(31686004)(4326008)(66446008)(8676002)(66476007)(36756003)(2906002)(31696002)(6512007)(83380400001)(64756008)(71200400001)(966005)(26005)(316002)(8936002)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akh6aWQwa2dUZlBpMFRUTENnMHlBMnhSSFpaVXRwb3ZZV0g4WERjQkhjUW42?=
 =?utf-8?B?YUJjblM1WVprYjRqUkVwMjJVdXRHTEE4TVNRaGZoaGJZSUZQUDdUd3l3QUZ3?=
 =?utf-8?B?WjdHTmpBSnJHVFo0WURBaEMrNmdyTnlrMDB0ZmhUaXdUTVlkR09YampZZHlQ?=
 =?utf-8?B?dmpIYWFnVTVEdERackUrTXFrTVN6SldqQmhxZ2duT2k2OER4czNCd1gxRkhC?=
 =?utf-8?B?Ykk1dzUxY1Y1RUhYeXJITnhIN1hwTldIZDQySTRrSU1XTUIzOUhoWWVyQWVG?=
 =?utf-8?B?U0dERW0rekpCRVY3Z3NqcXA1eURXUVZwamNmSDdaSUpOT0hncUxwdmkzaFRB?=
 =?utf-8?B?eEJVdnV6ZXZpV1hLNEo2SmFndkpyaHFnbTlHeEhGL0p2M1duL1FiZVRsbUQ5?=
 =?utf-8?B?eEUzZmF2MS9VYk1VeGJYc2xlL3dWSXpKRW9kODByRGlmbTN2UHJWQTlpbmkv?=
 =?utf-8?B?dVErSEJBc0hOWSsyNWRxQVdBdFJURFZUTzdnYkk0VmpyMTgyWXVlbENLanhQ?=
 =?utf-8?B?L1p1bHpQaHZzRTNlQlBnRlhraUsyWXVRSVRhYVQwc3FQQzZObktvMHRhMFJE?=
 =?utf-8?B?NUFsUzAyZVdXQ1NVWi9CV1ZVOWlxdG90QmxEZXk5bWQvM0tYNUpsY3N0ZFls?=
 =?utf-8?B?Zjk5d0hPa2JIdkFiYWpnOExDSHpnNXZ3ZFRQZ0FDMUgyWmJOTitYOHJRVm12?=
 =?utf-8?B?WlB1UmtEQmM5ZzRIKzZoQkZHTVlEd29NRVoxQ2RrYVF0b21VUG1TVG5idzZi?=
 =?utf-8?B?OTFZOXdVNjhWazgzemhaWHN1ZzRxbEp1cHRtVnR5MHVQSzJ2eno1dmdSL3Yz?=
 =?utf-8?B?YUpDbUhFdndnakNRSTNwTGR5RmZoKzFBeVRMdTN6SHVROThRcEVZSUo2eHBD?=
 =?utf-8?B?QmhybzZ6QTc0L2VDMjJjWXNrS0R5ZC9KeTVvaU56VTQ5NERRVzBHa05IZWZt?=
 =?utf-8?B?Y1pQMGg5Zi9Pc3JsSTJLUzkyMWVaNWlJbHp4R3EzcEhTQi94TzRVc0UrTlR6?=
 =?utf-8?B?Kys3RXd4bUFqL1NsWWtIbStONlRnUG5KWnZsdERpanUydHNJMHdOYjhDOCs4?=
 =?utf-8?B?Wjk1RkhQMzFuejNBWVNUMGJvZ0lTMVhUUnhaNitYajJIejRjMk1rUjRGRXpL?=
 =?utf-8?B?Qy9QL3R4WHArUUZOSFlkb3YxcVQwZ3IwSHJxK3U5TmQ4WjFaWEcvYUx2QkE4?=
 =?utf-8?B?T0lsVFBPTG9YZThudFRFTGRRMVEvTndlc3c4V3N2eUJaeTdxcUdxQTJzcnNB?=
 =?utf-8?B?Zk9nY3dBb2k4TmdQaC9INVRZVys2UE9jL1k4UmxOZytiOG96bWEzMmgxV00r?=
 =?utf-8?B?NDRBYU8raGludkxCMEVTeXdMOVVBb2JrbU5xU2ROUVRETXdXYXQwUUZtdTVE?=
 =?utf-8?B?a1ZybWlMcGlXV2gxRzlzWTJ4TStrbXB4N2lpUGs0aWlBYWg3aEdtakEvWkRp?=
 =?utf-8?B?a09sVk1hclFQZktoelAwak9tdjZPOFVRcmMxRmZuVmhSa2pocUN6czZqaTZQ?=
 =?utf-8?B?THo3SzVRbk1zbzhsYkpMdWszdUZIME1oQktvTzZyaXl3dDNsbzMyQi81a2hP?=
 =?utf-8?B?TFZHWWJCQjZEMEc0VDRReUhzaXVLemRmcG9SNURHL2dwalMxZEVBcjN2cmRk?=
 =?utf-8?B?K2hHYjlpSVBJUGx2VkhHZ1dpY3I3Tk9aTDlOOVl3MmZkZ0F4VWFHVkRDdXIx?=
 =?utf-8?B?d0N5UENxa0RLNTZ5VllTYXFkaEtHVnBjL09SYkVmZWtGcXE3Mlc3L3FORktH?=
 =?utf-8?B?dGpaeUJoZThPN2kyUmFha3dvenNvdlh5YlVURzY5c0FMWWRKTnhZaU5nRjNl?=
 =?utf-8?B?RktpZjVQN0hRYys5bzRYOVZXbUVWYllRYm5aM3pveGV5QStlQ3dxQTNoWmZR?=
 =?utf-8?B?YU41dTdPQXNib0lVY1NqSzdrWUJoTGowZDZYTjVWY2FFUzRnSU0zUTR0SkNu?=
 =?utf-8?B?bTlrR2ZaSkM3Sy83UjMyL1BJM3ZhY0tBd0VMczkrcWFQSENoVFM4TUxyc3R5?=
 =?utf-8?B?UGFtVWllbThMdFJIT3M0Z1l6V3NQU2pqZzd6VzkzMGRacTV1elFtL1pzbDNP?=
 =?utf-8?B?ZHd6Y3FGWkdIVm90WklZakgrc3JKdHRLdTNtQTJUR1hIclcwNHdrc2NOUFUy?=
 =?utf-8?B?VnlFSFljSmtrLzlvM1BweGpZL2k1cnlkRmxiYjk1YTRVdTNKOUdOOCtKZUMy?=
 =?utf-8?Q?VgSpVKVCQLSN+THwNB9dTR0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD8B00EBB89F1B45A18ABF501A4DBA6E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e33b187-9349-4364-cefc-08da956ed000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 10:00:39.4532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbIct859hNeKrMICvkOENKpl7i6H+mUDZrkqAtTQrWweJGhiju7Kw9DorfsCriFJp6X3fmCes23VlTGAwEk1iFyNdXOyUJzWfZycBIepKco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1613
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjIgw6AgMTA6MjAsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIGVuYWJsZXMgb2JqdG9vbCAtLW1jb3VudCBvbiBwb3dlcnBjLCBhbmQg
YWRkcyBpbXBsZW1lbnRhdGlvbg0KPiBzcGVjaWZpYyB0byBwb3dlcnBjLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+
ICAgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMgICAgICAgICAgIHwgMTYgKysr
KysrKysrKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXJj
aC9lbGYuaCB8ICAyICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2Nv
bmZpZw0KPiBpbmRleCBkYzA1Y2QyM2MyMzMuLjZiZTJlNjhmYTllYiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAg
LTIzOCw2ICsyMzgsNyBAQCBjb25maWcgUFBDDQo+ICAgCXNlbGVjdCBIQVZFX05NSQkJCQlpZiBQ
RVJGX0VWRU5UUyB8fCAoUFBDNjQgJiYgUFBDX0JPT0szUykNCj4gICAJc2VsZWN0IEhBVkVfT1BU
UFJPQkVTDQo+ICAgCXNlbGVjdCBIQVZFX09CSlRPT0wJCQlpZiBQUEMzMiB8fCBNUFJPRklMRV9L
RVJORUwNCj4gKwlzZWxlY3QgSEFWRV9PQkpUT09MX01DT1VOVAkJaWYgSEFWRV9PQkpUT09MDQo+
ICAgCXNlbGVjdCBIQVZFX1BFUkZfRVZFTlRTDQo+ICAgCXNlbGVjdCBIQVZFX1BFUkZfRVZFTlRT
X05NSQkJaWYgUFBDNjQNCj4gICAJc2VsZWN0IEhBVkVfUEVSRl9SRUdTDQo+IGRpZmYgLS1naXQg
YS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYyBiL3Rvb2xzL29ianRvb2wvYXJj
aC9wb3dlcnBjL2RlY29kZS5jDQo+IGluZGV4IGRjZDA5NzVjYWQ2Yi4uZWEyYjE5NjhmMGVlIDEw
MDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYw0KPiArKysg
Yi90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYw0KPiBAQCAtOSw2ICs5LDExIEBA
DQo+ICAgI2luY2x1ZGUgPG9ianRvb2wvYnVpbHRpbi5oPg0KPiAgICNpbmNsdWRlIDxvYmp0b29s
L2VuZGlhbm5lc3MuaD4NCj4gICANCj4gK2ludCBhcmNoX2Z0cmFjZV9tYXRjaChjaGFyICpuYW1l
KQ0KPiArew0KPiArCXJldHVybiAhc3RyY21wKG5hbWUsICJfbWNvdW50Iik7DQo+ICt9DQo+ICsN
Cj4gICB1bnNpZ25lZCBsb25nIGFyY2hfZGVzdF9yZWxvY19vZmZzZXQoaW50IGFkZGVuZCkNCj4g
ICB7DQo+ICAgCXJldHVybiBhZGRlbmQ7DQo+IEBAIC01MCw2ICs1NSwxNyBAQCBpbnQgYXJjaF9k
ZWNvZGVfaW5zdHJ1Y3Rpb24oc3RydWN0IG9ianRvb2xfZmlsZSAqZmlsZSwgY29uc3Qgc3RydWN0
IHNlY3Rpb24gKnNlYw0KPiAgIAl0eXAgPSBJTlNOX09USEVSOw0KPiAgIAlpbW0gPSAwOw0KPiAg
IA0KPiArCXN3aXRjaCAob3Bjb2RlKSB7DQo+ICsJY2FzZSAxODogLyogYltsXVthXSAqLw0KPiAr
CQlpZiAoaW5zbiAmIDEpICAvKiBibFthXSAqLw0KPiArCQkJdHlwID0gSU5TTl9DQUxMOw0KDQpJ
ZiB5b3UgYWxzbyBoYW5kbGUgYmxhLCB5b3UgbmVlZCB0byB0YWtlIGl0IGludG8gYWNjb3VudCBp
biB0aGUgYWRkcmVzcyANCmNhbGN1bGF0aW9uLiBXaGVuIHNlY29uZCBBQSBiaXQgaXMgc2V0IHlv
dSBtdXN0IGNhbGN1bGF0ZSB0aGUgYWRkcmVzcyANCmFjY29yZGluZ2x5LiBTZWUgDQpodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoL2ViZTExYjcz
ZDEwMTVhMTcwMzRhMmM0YmVkZjA5M2ZhNTdmNWQyOWYuMTY2MjAzMjYzMS5naXQuY2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1Lw0KDQo+ICsNCj4gKwkJaW1tID0gaW5zbiAmIDB4M2ZmZmZmYzsN
Cj4gKwkJaWYgKGltbSAmIDB4MjAwMDAwMCkNCj4gKwkJCWltbSAtPSAweDQwMDAwMDA7DQo+ICsJ
CWJyZWFrOw0KPiArCX0NCj4gKw0KPiAgIAlpZiAob3Bjb2RlID09IDEpDQo+ICAgCQkqbGVuID0g
ODsNCj4gICAJZWxzZQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hcmNoL2VsZi5oIGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
cmNoL2VsZi5oDQo+IGluZGV4IDNjOGViYjdkMmE2Yi4uNzNmOWFlMTcyZmU1IDEwMDY0NA0KPiAt
LS0gYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvZWxmLmgNCj4gKysr
IGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2VsZi5oDQo+IEBAIC00
LDUgKzQsNyBAQA0KPiAgICNkZWZpbmUgX09CSlRPT0xfQVJDSF9FTEYNCj4gICANCj4gICAjZGVm
aW5lIFJfTk9ORSBSX1BQQ19OT05FDQo+ICsjZGVmaW5lIFJfQUJTNjQgUl9QUEM2NF9BRERSNjQN
Cj4gKyNkZWZpbmUgUl9BQlMzMiBSX1BQQ19BRERSMzINCj4gICANCj4gICAjZW5kaWYgLyogX09C
SlRPT0xfQVJDSF9FTEYgKi8=
