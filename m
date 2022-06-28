Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0255EB20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 19:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXWxj09T2z3dR9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 03:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eCJCbZ0C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eCJCbZ0C;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXWwz1696z3c7h
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 03:36:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxdU7w9xC2VK1NI/RG6zhshtBtzmK601+eYrwNI+NOX7F3xsAnV7vlNevCPjTWLr09FByFLjNZpY2OFnzAP+smb4/sxvjGdycXw6852UYlkb2gStiiJcYLpubmH1xvETGCMXvgyIWjQqmnkSV8srNJBXsXZuFdUYH9tlHbVT31Z/lQPLHq5C1xgCLSOneHYkW/KAI3FlECskDstD/XszmVVJuIkzPPVGcRETMp7WkQoN3dWMrots9v6Us/LOAmIW0m2qhB/fHh7NsDByaY3upuq8yl2MansJs6G+Xm1AaEVI4mY28muRcJR0k8RUBTzXW4L+IYRAwDDUC8DqVfsneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q70/1zb2HtHwtyY4qwLWrvy5mCI7m2AzxaIbJy+ZIuc=;
 b=l/pTNWGXKUD5myY0HtW7EYQp1lxQlBi2sP+fWUK9TQ2PgVKVbBJJLcWyVe0fRWbRhv1M2odPYm8VBbtvrvBC/isIjXnMHwlDCRhnry+4mSRYhkEzlUo/ely1leQa9A+fclWBgRs1sWtvd3ROA6VCXc9VCF9Evx+HJ/B/fZy2pRwt78ZYYtZeiWWrLFebH0sEn8VUZFKYGA7LG7uDwrHlGs7YCl8+XlzMIAlOHVGqKKC3xppcinENkYeqzX5v/ONfsfpYaz10+jV/gT+WJJevYtH+iS3J8blcYgdZaGwvw0yP7BrPrJL1FXFPABvR3xbVis9RIcAre1ouctvFqRkDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q70/1zb2HtHwtyY4qwLWrvy5mCI7m2AzxaIbJy+ZIuc=;
 b=eCJCbZ0CHWeJuw6j31YI+JjChc5C6elqW3uQRdwoxV+nc/Pct3oB/jV9EErbpgswH3EhvVg4BsQI/p/7DOUwF+SIOgS/uIEuj0jhv8yV7xdLf4nWK1U9SUyr2dGk3Rir9ACIy+0wZIfiGjoHr2TK64VNDye4Jt2uO8Ce2YBHyNPPquSXESmXwOaDDpHbj64KroaskLoiu8fuADb3x82kqEvebRiM2huBJ3P1Ec+IJWE3fcQOIEbdJ8qULmKNIH3hVdxQFymMFlr5m4g5qKCeflcXmM6Kt17gV6120KhMWSpXEe4EFuKzHqvpdtD8sVRJdt7w+eDgoanzT3nDJHbMGg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 17:36:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 17:36:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Xiu Jianfeng <xiujianfeng@huawei.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"paulus@samba.org" <paulus@samba.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH -next, v2] powerpc: add support for syscall stack
 randomization
Thread-Topic: [PATCH -next, v2] powerpc: add support for syscall stack
 randomization
Thread-Index: AQHYaPdTunVcEFnzrkuVGzylM2/kWa1lWS8A
Date: Tue, 28 Jun 2022 17:36:14 +0000
Message-ID: <cfbfcbf8-0350-9b73-bacc-53effeb1f1f2@csgroup.eu>
References: <20220516073225.112875-1-xiujianfeng@huawei.com>
In-Reply-To: <20220516073225.112875-1-xiujianfeng@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fde031a-d553-43d1-26a0-08da592cb2fc
x-ms-traffictypediagnostic: PR1P264MB2175:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IPijhAJ8nMLVTkSBMo9lvG7f+Ak9tQPezvblDY8P0XDrQ5jgMIXn+RHSFgkrYGfa8zOBnC9/5ic+o9lBDmkplHwGJFsXKPo562cQUgWyqsgpKLhjHW1Oo+dRC9A9hr36CJd3mq07gnhnTJa93FfkSR7XMUpY8oKmp3EQh+wIXe2rBVpwWmXIowqJzgLw4XyqelGvybncr8+Dmd9MXZY5W+pF8LOF2X0akP0a+Ru++pxLjU8U5Oxj6DAw3oJZNGk9r4lNk8htcWml16CvMSAN82IBEraoWPsQeUdGmGNHGRAQjcAccI4dvjCX5HVPRbv3RQBCj8F7tYGPBkyUjy+3l+FMfna1ZrKKqinBDBHkA1AJ06HEX2Hha7pBgCZA2/eug8j7sg5SVaLSqH8WE+NgbXITJFj3Twz0FQapUaHbOJWHvv5LU7xdXNWywRuXZ62vV6lkonMdZE/QIMUCKjUeJRr3CKnQeH4OS2WMmhsfzyv0d5+C3MZqJyxU/Ius9s+8Mvx8JcqLF5iz9XBZGzhwYiMu7tv65Qz+akjqvkeaV4kVmpBbpJ3nEd+GMLl0G6kyXKWlycVnoy/ji3LsKf/aFJViF6lg0BafqapqA5bUdRYA8Wmp4oFQRpmei0zVNGQdoo4vV5EQQmO0JrZsByL2uCziFo70VKh+imAe3Z9zueag4nyjK32Nqk+i67u2U7VkIN1SdXhj4yJI4COxJE0eDeeoFt/xc3VcWSfU5xaU+lzIbi2IXRLkuzFg/XP5xJIYACKOl8zDROXm1rqDVbKQgbeJaRpOLk0VBRRM3Mltxq1U3U++LEXq4i+bGevmQUgPQ/sWajy64Qnbqu+TFliQSh1WBFJTWqWD8R+2FAeseBXtcBQT37TGjlvnOM7a3/0ZyGDqTklynV4kzhOQcdCvMw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(31686004)(66574015)(31696002)(64756008)(122000001)(2616005)(110136005)(7416002)(478600001)(26005)(186003)(36756003)(71200400001)(76116006)(38070700005)(316002)(66476007)(54906003)(38100700002)(83380400001)(66946007)(91956017)(66556008)(66446008)(44832011)(4326008)(6506007)(966005)(8936002)(86362001)(41300700001)(6512007)(8676002)(5660300002)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aU5PRzIwYTFCUWlQTFN6TUt0N29qYi9ITUoxVmdTRnJwQW5ESjZocUhJZHhj?=
 =?utf-8?B?TFk3dUhIZlZsUHVIVkJjRTVBcTQ1OHN2SmFWTjVPOGpuazhwVnVWb3JhVnkw?=
 =?utf-8?B?NmJKc1lRQXdZbWpqZXl4RzdMUnY5VFZUOERvMGRkTnJYTmxxVEZJQ3BzZDZ5?=
 =?utf-8?B?d0lIcy85NVhGaFZJTE5DNjRZMWV0aElyMTUvWHVPVkl5ak9RMnNnZFA3Q0Vs?=
 =?utf-8?B?cFkreWhIbGo1MExINERKNUxJY2tVREZ5d1R1ZXFkK200T1lrMlMxdEd4ekgw?=
 =?utf-8?B?YWg3b1BuU28xVElTWis4OGs1NG00dldMZSswN2R4bnlwQWNVeE9uNzdhMmNM?=
 =?utf-8?B?ditvQlQrclZCcTZsbzJOZXJuRm1ML3dHWG12d3dJZW1QZjF5Y3R3TmhMdGNE?=
 =?utf-8?B?bmdjdkk1clVBdFZxQmllUktMVUpZMmpNWXdHb2lKb2U1a0ZPeUFheXpjdCtM?=
 =?utf-8?B?am1YNkcrTGxFQXhxU0tTb2dFNFlHaWt5WjVkYy9pci9MNk1uRFRJbzF6dVJF?=
 =?utf-8?B?SkNzQTZRV3dKUGtHc3Y1ckFNZnNpMHpmZm0wUHJ0S1QzVk55RTVZeFF3T3lh?=
 =?utf-8?B?SVVSZmQvZ2Zhd1hIeWFXdXlwYzlFWEdzWlh2MElWQ01ocGk3R1hRbmpmRHdz?=
 =?utf-8?B?U3RYQkZYenJVQ1NjSjJ3OVIreDNFSU9ZRjJ6VTFSTkdiZnJQUW9UVkQ5OVRL?=
 =?utf-8?B?SlhDb1RteE1haFNMMTdKb096OGw5by84bG9vcnNaUGlrU0V3R1QyWmY4UlNM?=
 =?utf-8?B?UjBMRDltdHNyYVR0ZFd2L0VRVWU4dXFndzFZNVZHYXRxZGUzT1BmNHBITWsz?=
 =?utf-8?B?WERDWi9CQ25HLzVueS8xdWRzWGkxT0lLV0k4bmJJWEdZUkltRDFuZWZwdGRl?=
 =?utf-8?B?bnNPeDFNVXU1Q3prL2JMNWRVMzdkTUNkdWlvWVFpRWJQVWtJYVNTZWhGNE11?=
 =?utf-8?B?U3NybFNHcFdnTXluMXlscVZ0d3BtV2lEUU5vY0pOUldLeU1LQ2JMMlg0WGtJ?=
 =?utf-8?B?MjdLYVBIVENPYVJtYmczcGFlRlN4TTdqUzBnQWUvcmU5d0liSHNHK1F4NU1q?=
 =?utf-8?B?QmM0VGt2MVdXTlhreFlZY2JQYkJ5VU0wSVVrOURjd2kxUzFueHFZdmVMV3Z6?=
 =?utf-8?B?cjBhM29haVArRFovSnRBSFN6d3Rvb0lWZFFoWmlpVDNKVEdueDRFSHZrTURm?=
 =?utf-8?B?NW00VlE2NHA4bXh2VVVMZWVja1ZKNk9za29teXJua0QxaUFlcENuUWVzUTJi?=
 =?utf-8?B?U2tzNmloWk94WHJmVFhURnZHR3M5K1RoSDdzR3ZvTUJBMkEvYjVNS0Z4ZDFD?=
 =?utf-8?B?WFRhOWQvdkdyRWtaSlpvaEpONWRoclFTRGluRG5FNkFwWjZUaWtadmJNemR1?=
 =?utf-8?B?OEdwWTBrRG14ZFFSZUhvL3lCcml5MUZDN0dDZkpKZUF2WlhJWk5DWEJROVVr?=
 =?utf-8?B?eG1NN3V1VjFMV0ZZQ2hWcEtIR1JmRENWTmNZTkNyQ2NJMHcxaVQwTmlyRldH?=
 =?utf-8?B?UG5RMTgydC8ycUJocTlkQVZYOVlZZS90aUk4Njcvb25GaTR5ZnhLS0x6VWx3?=
 =?utf-8?B?UzZiUklSMUtzbnMwRVBVUHZUTVpsMWRiVFp6Ym5VbUlWME9VYjJCcGRwalNz?=
 =?utf-8?B?Q29wZy9DZWtnNStHeExJYmt2S3QvdzI0M01wdDVYT0l2OWFmQWZKNVF3U1hu?=
 =?utf-8?B?dVRSZEJtYUZab1U0eHRLdGVQc08zT1ZybitCUVFNaUozUmU4NkF6aTNERG55?=
 =?utf-8?B?VXNOMEFqRDgzenI4Q1ZnaVFRZFRzVFVRN01UN3RHZW9nYnFiQ2VRYnRpdFJk?=
 =?utf-8?B?K1FBTDNWdHRabGdocDM5WEMybVBUQm5WK1FDTTN5WDFHNlhyMGc3bVpWMStH?=
 =?utf-8?B?L2F5dVJDd0hMWktxL0RFQVJDZXdSWkM3QWhLVTNVS2ZDT2tKRWlzQXVsUjRT?=
 =?utf-8?B?VGR1bWROTHhSNHJGSXBHeERMMW4vUzVCTDl4cVFMTzZTdlBRbU82bkNnS1Az?=
 =?utf-8?B?bklmOVIweEhIZ1lXSnUwTy9LMnAvNUFJYWVSaWNNNGhYRVB0TDF4STdmK1Fr?=
 =?utf-8?B?Ty9NSnNycXpmQU1CTXNlR0JFbElNVjF0aERBRHNBQnhEdnh6RnpFUlZ3NHNJ?=
 =?utf-8?B?TTAxRHRuLy9sUnV4S08weUlVbHd4NHVndXBHR2ZmTE9OWVdIY2U2S1hKaFdy?=
 =?utf-8?Q?y4VIgOuRs7PDQWZmeR04l2w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C11FFD2945DF0439B7126A1F546C5A3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fde031a-d553-43d1-26a0-08da592cb2fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 17:36:14.2180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0YLvoKgqsmd7ptpC1qc+8mPZYw8MQySZQvTclxh8IpHFwiDl8Xx5tOOS6EAXoSOYACKezN6VeO8kK64G9k0r0V16RTn30qdSWchl99kaNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2175
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA1LzIwMjIgw6AgMDk6MzIsIFhpdSBKaWFuZmVuZyBhIMOpY3JpdMKgOg0KPiBB
ZGQgc3VwcG9ydCBmb3IgYWRkaW5nIGEgcmFuZG9tIG9mZnNldCB0byB0aGUgc3RhY2sgd2hpbGUg
aGFuZGxpbmcNCj4gc3lzY2FsbHMuIFRoaXMgcGF0Y2ggdXNlcyBtZnRiKCkgaW5zdGVhZCBvZiBn
ZXRfcmFuZG9tX2ludCgpIGZvciBiZXR0ZXINCj4gcGVyZm9ybWFuY2UuDQo+IA0KPiBJbiBvcmRl
ciB0byBhdm9pZCB1bmNvbmRpdGlvbmFsIHN0YWNrIGNhbmFyaWVzIG9uIHN5c2NhbGwgZW50cnkg
KGR1ZSB0bw0KPiB0aGUgdXNlIG9mIGFsbG9jYSgpKSwgYWxzbyBkaXNhYmxlIHN0YWNrIHByb3Rl
Y3RvciB0byBhdm9pZCB0cmlnZ2VyaW5nDQo+IG5lZWRsZXNzIGNoZWNrcyBhbmQgc2xvd2luZyBk
b3duIHRoZSBlbnRyeSBwYXRoLiBBcyB0aGVyZSBpcyBubyBnZW5lcmFsDQo+IHdheSB0byBjb250
cm9sIHN0YWNrIHByb3RlY3RvciBjb3ZlcmFnZSB3aXRoIGEgZnVuY3Rpb24gYXR0cmlidXRlLCB0
aGlzDQo+IG11c3QgYmUgZGlzYWJsZWQgYXQgdGhlIGNvbXBpbGF0aW9uIHVuaXQgbGV2ZWwuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBYaXUgSmlhbmZlbmcgPHhpdWppYW5mZW5nQGh1YXdlaS5jb20+
DQo+IA0KDQpEaWQgeW91IHNlZSB0aGlzIHBhdGNoIGdlbmVyYXRlcyBzcGFyc2Ugd2FybmluZ3Mg
Pw0KDQpTZWUgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMt
ZGV2L3BhdGNoLzIwMjIwNTE2MDczMjI1LjExMjg3NS0xLXhpdWppYW5mZW5nQGh1YXdlaS5jb20v
DQoNCkl0IGlzIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHRoaXMgcGF0Y2ggYnV0IHRoYXQncyB3
b3J0aCBhIHBhdGNoIHRvIGZpeCBpdC4NCg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gICAg
LW1vdmUgY2hvb3NlIGNob29zZV9yYW5kb21fa3N0YWNrX29mZnNldCgpIHRvIHRoZSBlbmQgb2Yg
c3lzdGVtX2NhbGxfZXhjZXB0aW9uDQo+ICAgIC1hbGxvdyBmdWxsIDYgKDEwKSBiaXRzIG9mIGVu
dHJvcHkNCj4gICAgLWRpc2FibGUgc3RhY2stcHJvdGVjdG9yIGZvciBpbnRlcnJ1cHQuYw0KPiAt
LS0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgIHwgIDEgKw0KPiAgIGFyY2gv
cG93ZXJwYy9rZXJuZWwvTWFrZWZpbGUgICAgfCAgNyArKysrKysrDQo+ICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9pbnRlcnJ1cHQuYyB8IDE5ICsrKysrKysrKysrKysrKysrKy0NCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IGluZGV4
IDk4MzA5ZWVhZTA5Yy4uMmYwMDE5YTAwNTRlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
S2NvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBAQCAtMTkyLDYgKzE5Miw3
IEBAIGNvbmZpZyBQUEMNCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTgkJCWlmIFBQQzMyICYm
IFBQQ19QQUdFX1NISUZUIDw9IDE0DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS0FTQU5fVk1BTExP
QwkJaWYgUFBDMzIgJiYgUFBDX1BBR0VfU0hJRlQgPD0gMTQNCj4gICAJc2VsZWN0IEhBVkVfQVJD
SF9LRkVOQ0UJCQlpZiBQUENfQk9PSzNTXzMyIHx8IFBQQ184eHggfHwgNDB4DQo+ICsJc2VsZWN0
IEhBVkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVA0KPiAgIAlzZWxlY3QgSEFWRV9BUkNI
X0tHREINCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9NTUFQX1JORF9CSVRTDQo+ICAgCXNlbGVjdCBI
QVZFX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFMJaWYgQ09NUEFUDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmls
ZQ0KPiBpbmRleCA0ZGRkMTYxYWVmMzIuLjVjNWU4NWI4MjI5YiAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL01h
a2VmaWxlDQo+IEBAIC00MCw2ICs0MCwxMyBAQCBDRkxBR1NfY3B1dGFibGUubyArPSAtRERJU0FC
TEVfQlJBTkNIX1BST0ZJTElORw0KPiAgIENGTEFHU19idGV4dC5vICs9IC1ERElTQUJMRV9CUkFO
Q0hfUFJPRklMSU5HDQo+ICAgZW5kaWYNCj4gICANCj4gKyNpZmRlZiBDT05GSUdfUkFORE9NSVpF
X0tTVEFDS19PRkZTRVQNCj4gKyMgUmVtb3ZlIHN0YWNrIHByb3RlY3RvciB0byBhdm9pZCB0cmln
Z2VyaW5nIHVubmVlZGVkIHN0YWNrIGNhbmFyeQ0KPiArIyBjaGVja3MgZHVlIHRvIHJhbmRvbWl6
ZV9rc3RhY2tfb2Zmc2V0Lg0KPiArQ0ZMQUdTX1JFTU9WRV9pbnRlcnJ1cHQubyA9IC1mc3RhY2st
cHJvdGVjdG9yIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZw0KPiArQ0ZMQUdTX2ludGVycnVwdC5v
ICs9IC1mbm8tc3RhY2stcHJvdGVjdG9yDQo+ICsjZW5kaWYNCj4gKw0KPiAgIG9iai15CQkJCTo9
IGNwdXRhYmxlLm8gc3lzY2FsbHMubyBcDQo+ICAgCQkJCSAgIGlycS5vIGFsaWduLm8gc2lnbmFs
XyQoQklUUykubyBwbWMubyB2ZHNvLm8gXA0KPiAgIAkJCQkgICBwcm9jZXNzLm8gc3lzdGJsLm8g
aWRsZS5vIFwNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0LmMg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdC5jDQo+IGluZGV4IDc4NGVhMzI4OWM4NC4u
ZDdjZGNiNmZjMzM2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVw
dC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0LmMNCj4gQEAgLTQsNiAr
NCw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9j
b21wYXQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQvZGVidWcuaD4gLyogZm9yIHNob3df
cmVncyAqLw0KPiArI2luY2x1ZGUgPGxpbnV4L3JhbmRvbWl6ZV9rc3RhY2suaD4NCj4gICANCj4g
ICAjaW5jbHVkZSA8YXNtL2t1cC5oPg0KPiAgICNpbmNsdWRlIDxhc20vY3B1dGltZS5oPg0KPiBA
QCAtNzgsMTAgKzc5LDEyIEBAIG5vdHJhY2UgbG9uZyBzeXN0ZW1fY2FsbF9leGNlcHRpb24obG9u
ZyByMywgbG9uZyByNCwgbG9uZyByNSwNCj4gICAJCQkJICAgbG9uZyByNiwgbG9uZyByNywgbG9u
ZyByOCwNCj4gICAJCQkJICAgdW5zaWduZWQgbG9uZyByMCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
DQo+ICAgew0KPiArCWxvbmcgcmV0Ow0KPiAgIAlzeXNjYWxsX2ZuIGY7DQo+ICAgDQo+ICAgCWt1
YXBfbG9jaygpOw0KPiAgIA0KPiArCWFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpOw0KPiAgIAly
ZWdzLT5vcmlnX2dwcjMgPSByMzsNCj4gICANCj4gICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQ
Q19JUlFfU09GVF9NQVNLX0RFQlVHKSkNCj4gQEAgLTIyOSw3ICsyMzIsMjEgQEAgbm90cmFjZSBs
b25nIHN5c3RlbV9jYWxsX2V4Y2VwdGlvbihsb25nIHIzLCBsb25nIHI0LCBsb25nIHI1LA0KPiAg
IAkJZiA9ICh2b2lkICopc3lzX2NhbGxfdGFibGVbcjBdOw0KPiAgIAl9DQo+ICAgDQo+IC0JcmV0
dXJuIGYocjMsIHI0LCByNSwgcjYsIHI3LCByOCk7DQo+ICsJcmV0ID0gZihyMywgcjQsIHI1LCBy
NiwgcjcsIHI4KTsNCj4gKwkvKg0KPiArCSAqIFVsdGltYXRlbHksIHRoaXMgdmFsdWUgd2lsbCBn
ZXQgbGltaXRlZCBieSBLU1RBQ0tfT0ZGU0VUX01BWCgpLA0KPiArCSAqIHNvIHRoZSBtYXhpbXVt
IHN0YWNrIG9mZnNldCBpcyAxayBieXRlcygxMCBiaXRzKS4NCj4gKwkgKg0KPiArCSAqIFRoZSBh
Y3R1YWwgZW50cm9weSB3aWxsIGJlIGZ1cnRoZXIgcmVkdWNlZCBieSB0aGUgY29tcGlsZXIgd2hl
bg0KPiArCSAqIGFwcGx5aW5nIHN0YWNrIGFsaWdubWVudCBjb25zdHJhaW50czogdGhlIHBvd2Vy
cGMgYXJjaGl0ZWN0dXJlDQo+ICsJICogbWF5IGhhdmUgdHdvIGtpbmRzIG9mIHN0YWNrIGFsaWdu
bWVudCgxNi1ieXRlcyBhbmQgOC1ieXRlcykuDQo+ICsJICoNCj4gKwkgKiBTbyB0aGUgcmVzdWx0
aW5nIDYgb3IgNyBiaXRzIG9mIGVudHJvcHkgaXMgc2VlbiBpbiBTUFs5OjRdIG9yIFNQWzk6M10u
DQo+ICsJICoNCj4gKwkgKi8NCj4gKwljaG9vc2VfcmFuZG9tX2tzdGFja19vZmZzZXQobWZ0Yigp
KTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBub3RyYWNl
IHZvaWQgYm9va2VfbG9hZF9kYmNyMCh2b2lkKQ==
