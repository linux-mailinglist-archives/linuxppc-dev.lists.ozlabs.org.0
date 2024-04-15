Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA28A5A6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 21:13:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P5rNh4SP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJGzk2DGfz3vbd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 05:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P5rNh4SP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJGyw6yBMz3dSv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 05:12:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsF7VKvyjT+uX53djQHS9hvo2f28VGPggxvbEa8rQAdgzUuLln3wXMTM2c7vAvp05KS7ZtsWX02tG2zGC9XOL6xbrZcUwCxQrNl4GUXB66HCcTi28ZjBqbyGL4nKEV3Idz//kBR/A1cHbNFLCvJShzot14jm2GN10VwhX3CAeF7MwKsH4zR2klOs55+pLNKqxCdwG/XcSU6wczU3sZ0SPt5DAB1r/1+VcAU8SDeu9yBKcIdmOVxEED5CUJkUt0k3IDfSL9mWhHapw8refTN7+MXbrq3KrUN075C/e7Qbv/l3cACTGchX/CtgKfgb0LNmvLQ/8AmfqucLjli3zMetmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia2n2KzpbDLjaTms/DTpbmfvViK+MO+lW7uXCi7nxqE=;
 b=fsVdW2PSyKEhLUWIRv1mVFt9/5co/0GHwiL2oSR8FexB2ONrkcTKNvGx0uKToxtAA6iEPsMNQK8c4UhOl0DgT30j3ABWumDaY4fS3dxCQeMvrh8w09Y1Pf57owbPPCwPsijVJKjONEi8C5+XmXwT5rNd6ke6kcIxCJDuJXXdyGKE6fTPZfhtAXohz2KIOtJIyT/DMDw3VndDgNBQipAoEHZPIbPURulpCsaH4heaBMlWAzsMEhWWOSikHqnitznSfMDBvjoialgDcghmH/5hcqrLFGUW1274lOLnAfHPqPjhs/c+pHA+uRvG21XiQzPSDr0AQDVbXK06DmXY0NefiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ia2n2KzpbDLjaTms/DTpbmfvViK+MO+lW7uXCi7nxqE=;
 b=P5rNh4SPiEIh8d/sHbeoutbFwRlqD3m9JBCIpqjjbwaSRVx14Tc9gtACr/uipw03VEZz1A5KXidPztNsQVEzykWDmqo37LH8qqaPjr2rotkBPZFtRaI+Szps7gQtfiu2SNDNzQ0nXyhX4cYl6/sILpUoTBdJCISL2Ujm8maHx4tpFrQzdpsJSauF0ozsa6at34LRWBE50C0DpUc4uxpwZKOkh/Sg1cj/Ql0xttzGYveoqyTwlUvVIlAf4YP9mQXcWupp/ZMu+xkpcvNULACu2WOvmB/2Ao9m7yAf/1je5fSP1NTir7MUgfMqcVrq5KaqJLJmLnV2e3l+SOZqLibY9A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2682.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 19:12:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 19:12:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Thread-Topic: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Thread-Index: AQHafsSU45Ki1FdCPEivNpHUmuU++LFIqD8AgBqxMACAAW6xAIAABmgAgAUFpQA=
Date: Mon, 15 Apr 2024 19:12:29 +0000
Message-ID: <d3a4c5a6-0fd6-4518-a76b-04dcf2ea2f2c@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163840.GF6245@nvidia.com> <ZhgMqF7SNaISrYMJ@x1n>
 <d236ce4a-1dde-4ee9-8cef-fe96242c2f4b@csgroup.eu> <ZhlFokakZo3c90C6@x1n>
In-Reply-To: <ZhlFokakZo3c90C6@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2682:EE_
x-ms-office365-filtering-correlation-id: 4fe038dc-649b-488f-e522-08dc5d7ffeb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WvAYAZOgueXT7NwAJNJVHD1gtB6tJT0iG1GxFpi694f7WiOJEmjisbmAwD5E2ZotHeCtQ36/SsRJEnAKzWuNgZU6v61jIrLQeJcPDOcq2UZarSmeve2Bb4qDKcFYKHEJLTQpTvsBNQPclBsyzkY4xMhgBFOqdQr3o0K/DT4k/ehyV5WoLl7CBc0ixxYktPbmsGQFA7zN7vYCYy7bUq4MF82jZX8pqDULnra4Mu15fTI+0WpDtVpJpANh9fhg8V0rkpBTpNFVtvQB+uFyD2VF9wm3Hsge011GWdWedpq+I1QmA/OtVJfLHjJBeKNSfT0Z6++0QHRXXL9vgMprebYzZbXps+gKsLjdMgf+NakG6dRsnA800/ixjjt+tejIgcavpCGqgDtKfOMvhPXDl7CzeFUK5bDA+oRBu1T+kBmtQ3qsyuTVMhZ04cOD0PU1F1Xkm18BvxOXVIWUhLHLxCaSgSk44MsDeo4NdKepfgvIXtxjElRfuXIy8AnWLgxPrCavdPdE8GOcYykTk5Tj3waMIVp2aCDup6cyXP7D5e9iFE6IGmHDnsoEyo+Y4Gi+FcTyHMV7b5epXvoD+/UVDytTyVLACycmKGvD2pZCO5+WrR3sQ7VbzVAiH/9UiM5f84CAH+Tm4oJrFe3nu7V888soTlm9yZhKoDtTGm4nnMDpeA4YMcpv5Yj5LOMAZK5jCZeDwrqImTp2Uph0hAQAv1QyNJAfZ44Ns1CyU6TodNgQKII=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dEpwY2NaalFqK2l2THBoSm04elVkempWQnFubEY3QmhoRXhkTVhaOHlaMm9v?=
 =?utf-8?B?ckNOZkVRdW9RSTg3VGJKSGRYNGc5QnZxNWcrWTRNRnQ5enFNUWdFck1pRms4?=
 =?utf-8?B?N3NRVCtCZHh4T3dOWFNUM0tpTldLN3U0NnRPOEJzbEY5UlFZT1JkT215RXhm?=
 =?utf-8?B?ZzRsU2JhZmh4R1VzVElHZ1dTS04vS21iUmxOU3diVm1TU1RKUHhYNjZicVZV?=
 =?utf-8?B?aGRPaGQ4c1RGYkVjbWlpQ3Zva2ZUcEhGeXRMamFSekt3ZjNhMnhucmUyVVlh?=
 =?utf-8?B?TXp4Z2hvOWZpWW96Z1VPRVdNOTdFM2x5ZTJWMWQ1M0hsY1RRMG54NTZSQlVz?=
 =?utf-8?B?cUk5NEVPNDY0S1JraFgwQVJKZUJidU9yQjNQZ3RlSFpNbmVURzZIUDlPcXIz?=
 =?utf-8?B?TDM4bXUrVGZHdzRBVE04RjUyOHhwOGNCVEVuZU9xbWtyaXFjbGV4VmROWTZW?=
 =?utf-8?B?YVRQY2NuU3JpQ1VyWW0vcWxZckUwdFhPcGdHVjJGaVhObWRJMlQxdEJTdUh4?=
 =?utf-8?B?U3VjNHdUd3NsS09ocWFROTRyaE5ZbUtJUVNOa0Q2MFlTVDZ3WHE0NytLTEp6?=
 =?utf-8?B?T2Y3NC9aeWFzTVZRVURDMHFKVlBpMk1xQzNVWHN6UWFpZlltQXRBRllOWlVu?=
 =?utf-8?B?Qm81L25FY0NOVGNwUE93M3lKdGwxdUs3cTlvZVB4c3A0RnFjVmNhSHlXaFZq?=
 =?utf-8?B?ODd5bmNXeDVRK2FGd3hlc2JweWg2WnA4cU00VE94elBTWC9vS3hwRWozcDEv?=
 =?utf-8?B?TCtJR2JMTDhPN21rYzl1WEwvVjFMRjk5YUFoa0JpUWtGWFhMRDVzN05OYU5Y?=
 =?utf-8?B?RVZTaU03Nmwwa3oxUnN6dEgxblByOCs2Zmx4RVB6Q0FUWlJFY1BPa1FEVmdl?=
 =?utf-8?B?RDYxZjIzK1phQW9ZVnBZUy9objRabW1SWlV4WTZqNVBQbW1Wb0oxZkF6aFp4?=
 =?utf-8?B?Y2FGNzNyY1BzclRUems0b0JnMzhkeTJEdzJvTTF6Tm9OL1RFRUI5LzN5Yktu?=
 =?utf-8?B?OGRyaVhMemloU0JsanRwMFNQeW92cXN1L3UwSjlSdTRwLytvTGR6MEgvdElM?=
 =?utf-8?B?Y3N3R0pSOXZVay9XQmhrMkVhUFBnNno2aVdySlQ4RHFPUXlEUmZ2MjhBK1dI?=
 =?utf-8?B?S2U0bTRzTHZubjZiK1ROY1FiZ1V4UUpETnZ0cE5qUnN6QkFjRUdXOVN1MXFz?=
 =?utf-8?B?b0lVaWpBS213blA3QlQ1T0pWSlVLUmdZSFdxUzdxTDkzc1NQdkVERXRTcVZk?=
 =?utf-8?B?VGp2bzZhV0VMYjUrY2dPUTQ0dXlsZjV3TXl3V0R5b0p4SktqNnBPbWRqTzZt?=
 =?utf-8?B?WmRpUVp2ZU00VXI4Rys5cDVWN0VxZk5sdjU2dDFjSndUc3ZwZHp1VWY2cHZG?=
 =?utf-8?B?Sk1NanE5QXBwL010ZDhYTHNKTWpJVGkwQkNaV2lqc2NoVlFSZnpTaVFERTMw?=
 =?utf-8?B?QUwwbkYzM3JxU0s3ZHozRTVJekZsSlVWbGpzalNETi84Q0RjbmcyNUtxOVVI?=
 =?utf-8?B?VGpQSjl1dnVMenNPNjlVWnk2VUFtQUNRRzRCOU9nSmtGOUdSSmtEUGpvaHdp?=
 =?utf-8?B?aDdWNFBuaUc5TUVmK2dsZ2wwbXBzdWVvWktHanFXbjREb2xha0JMaGx0d3pJ?=
 =?utf-8?B?Vk5UZSsvVHFBZTcyTHZFNzVOOEJyQ0lFb252OXBRWkIxYXIrMXhpektiWTkx?=
 =?utf-8?B?Z2JMN3BRZGQybnlOMnV5WjFuelZLWSsyU2NQdXVYVmlLTWlsVy9DRGRPVzN0?=
 =?utf-8?B?T0liL0IzY081Tlo2NVUraDcvMThYbUdSSklIODYrdEMxZFZZN2R1NlFFNVN5?=
 =?utf-8?B?SERiQjZ3UVpBamNuWlNUTUlycE9mdmhoQUhmak9SczNHVkpScXFlWHIwKzZC?=
 =?utf-8?B?cGxXYUhjMEZSRlNKd0JaUVBmQ3dCRnVCQXA4OEJkZ2kweHV0MWczczQyMmk2?=
 =?utf-8?B?S3E4S0lXM2FuWjczRmQvUlZydkd0WTFCT1B1ZjFLTHdtMnE5V3FJR3VrNVBx?=
 =?utf-8?B?RnZGYVBYTjFMV3pVdkFDKzdyci9YWDdtS1ZISUxUSHVyVW85RUZiYTZTeGRQ?=
 =?utf-8?B?WmFqUlJldFpHK2Z6L3k4cHpIUGlqU0hnNW12Q2JIMUhCa2ZnVmtNdHNvemNX?=
 =?utf-8?B?VW8zWWJoQk03VEpsQnJTa21LY1dJUDROYWVod3hRRTRtdVRlNEV5Tys1cCt3?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92F8775591270499DCCE2F52D8D0B70@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe038dc-649b-488f-e522-08dc5d7ffeb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 19:12:29.4987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+MKFocacZY510/BvjAkAmQvomgRXIvkM54WXD5t1WOE1SRNMh5xTCkewMI5ClPFQDYLpzXVzM4rAPn+7m7C9MiHfJ120fa3fVh9yfkN13s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2682
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA0LzIwMjQgw6AgMTY6MzAsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIEZy
aSwgQXByIDEyLCAyMDI0IGF0IDAyOjA4OjAzUE0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pg0KPj4NCj4+IExlIDExLzA0LzIwMjQgw6AgMTg6MTUsIFBldGVyIFh1IGEgw6ljcml0
wqA6DQo+Pj4gT24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMDE6Mzg6NDBQTSAtMDMwMCwgSmFzb24g
R3VudGhvcnBlIHdyb3RlOg0KPj4+PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwMzo1NTo1M1BN
ICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pj4gVGhpcyBzZXJpZXMgcmVpbXBs
ZW1lbnRzIGh1Z2VwYWdlcyB3aXRoIGh1Z2VwZCBvbiBwb3dlcnBjIDh4eC4NCj4+Pj4+DQo+Pj4+
PiBVbmxpa2UgbW9zdCBhcmNoaXRlY3R1cmVzLCBwb3dlcnBjIDh4eCBIVyByZXF1aXJlcyBhIHR3
by1sZXZlbA0KPj4+Pj4gcGFnZXRhYmxlIHRvcG9sb2d5IGZvciBhbGwgcGFnZSBzaXplcy4gU28g
YSBsZWFmIFBNRC1jb250aWcgYXBwcm9hY2gNCj4+Pj4+IGlzIG5vdCBmZWFzaWJsZSBhcyBzdWNo
Lg0KPj4+Pj4NCj4+Pj4+IFBvc3NpYmxlIHNpemVzIGFyZSA0aywgMTZrLCA1MTJrIGFuZCA4TS4N
Cj4+Pj4+DQo+Pj4+PiBGaXJzdCBsZXZlbCAoUEdEL1BNRCkgY292ZXJzIDRNIHBlciBlbnRyeS4g
Rm9yIDhNIHBhZ2VzLCB0d28gUE1EIGVudHJpZXMNCj4+Pj4+IG11c3QgcG9pbnQgdG8gYSBzaW5n
bGUgZW50cnkgbGV2ZWwtMiBwYWdlIHRhYmxlLiBVbnRpbCBub3cgdGhhdCB3YXMNCj4+Pj4+IGRv
bmUgdXNpbmcgaHVnZXBkLiBUaGlzIHNlcmllcyBjaGFuZ2VzIGl0IHRvIHVzZSBzdGFuZGFyZCBw
YWdlIHRhYmxlcw0KPj4+Pj4gd2hlcmUgdGhlIGVudHJ5IGlzIHJlcGxpY2F0ZWQgMTAyNCB0aW1l
cyBvbiBlYWNoIG9mIHRoZSB0d28gcGFnZXRhYmxlcw0KPj4+Pj4gcmVmZXJlZCBieSB0aGUgdHdv
IGFzc29jaWF0ZWQgUE1EIGVudHJpZXMgZm9yIHRoYXQgOE0gcGFnZS4NCj4+Pj4+DQo+Pj4+PiBB
dCB0aGUgbW9tZW50IGl0IGhhcyB0byBsb29rIGludG8gZWFjaCBoZWxwZXIgdG8ga25vdyBpZiB0
aGUNCj4+Pj4+IGh1Z2VwYWdlIHB0ZXAgaXMgYSBQVEUgb3IgYSBQTUQgaW4gb3JkZXIgdG8ga25v
dyBpdCBpcyBhIDhNIHBhZ2Ugb3INCj4+Pj4+IGEgbG93ZXIgc2l6ZS4gSSBob3BlIHRoaXMgY2Fu
IG1lIGhhbmRsZWQgYnkgY29yZS1tbSBpbiB0aGUgZnV0dXJlLg0KPj4+Pj4NCj4+Pj4+IFRoZXJl
IGFyZSBwcm9iYWJseSBzZXZlcmFsIHdheXMgdG8gaW1wbGVtZW50IHN0dWZmLCBzbyBmZWVkYmFj
ayBpcw0KPj4+Pj4gdmVyeSB3ZWxjb21lLg0KPj4+Pg0KPj4+PiBJIHRob3VnaHQgaXQgbG9va3Mg
cHJldHR5IGdvb2QhDQo+Pj4NCj4+PiBJIHNlY29uZCBpdC4NCj4+Pg0KPj4+IEkgc2F3IHRoZSBk
aXNjdXNzaW9ucyBpbiBwYXRjaCAxLiAgQ2hyaXN0b3BoZSwgSSBzdXBwb3NlIHlvdSdyZSBleHBs
b3JpbmcNCj4+PiB0aGUgYmlnIGhhbW1lciBvdmVyIGh1Z2VwZCwgYW5kIHBlcmhhcHMgd2VudCBh
bHJlYWR5IHdpdGggdGhlIDMyYml0IHBtZA0KPj4+IHNvbHV0aW9uIGZvciBub2hhc2gvMzJiaXQg
Y2hhbGxlbmdlIHlvdSBtZW50aW9uZWQ/DQo+Pj4NCj4+PiBJJ20gdHJ5aW5nIHRvIHBvc2l0aW9u
IG15IG5leHQgc3RlcDsgaXQgc2VlbXMgbGlrZSBhdCBsZWFzdCBJIHNob3VsZCBub3QNCj4+PiBh
ZGRpbmcgYW55IG1vcmUgaHVnZXBkIGNvZGUsIHRoZW4gc2hvdWxkIEkgZ28gd2l0aCBBUkNIX0hB
U19IVUdFUEQgY2hlY2tzLA0KPj4+IG9yIHlvdSdyZSBnb2luZyB0byBoYXZlIGFuIFJGQyBzb29u
IHRoZW4gSSBjYW4gYmFzZSBvbiB0b3A/DQo+Pg0KPj4gRGVwZW5kcyBvbiB3aGF0IHlvdSBleHBl
Y3QgYnkgInNvb24iLg0KPj4NCj4+IEkgc3VyZSB3b24ndCBiZSBhYmxlIHRvIHNlbmQgYW55IFJG
QyBiZWZvcmUgZW5kIG9mIEFwcmlsLg0KPj4NCj4+IFNob3VsZCBiZSBwb3NzaWJsZSB0byBoYXZl
IHNvbWV0aGluZyBkdXJpbmcgTWF5Lg0KPiANCj4gVGhhdCdzIGdvb2QgZW5vdWdoLCB0aGFua3Mu
ICBJJ2xsIHNlZSB3aGF0IGlzIHRoZSBiZXN0IEkgY2FuIGRvLg0KPiANCj4gVGhlbiBkbyB5b3Ug
dGhpbmsgSSBjYW4gbGVhdmUgcDRkL3BnZCBsZWF2ZXMgYWxvbmU/ICBQbGVhc2UgY2hlY2sgdGhl
IG90aGVyDQo+IGVtYWlsIHdoZXJlIEknbSBub3Qgc3VyZSB3aGV0aGVyIHBnZCBsZWF2ZXMgZXZl
ciBleGlzdGVkIGZvciBhbnkgb2YNCj4gUG93ZXJQQy4gIFRoYXQncyBzbyBmYXIgd2hhdCBJIHBs
YW4gdG8gZG8sIG9uIHRlYWNoaW5nIHBndGFibGUgd2Fsa2Vycw0KPiByZWNvZ25pemUgcHVkIGFu
ZCBsb3dlciBmb3IgYWxsIGxlYXZlcy4gIFRoZW4gaWYgUG93ZXIgY2FuIHN3aXRjaCBmcm9tDQo+
IGh1Z2VwZCB0byB0aGlzIGl0IHNob3VsZCBqdXN0IHdvcmsuDQoNCldlbGwsIGlmIEkgdW5kZXJz
dGFuZCBjb3JyZWN0bHksIHNvbWV0aGluZyB3aXRoIG5vIFBNRCB3aWxsIGluY2x1ZGUgDQo8YXNt
LWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oPiBhbmQgd2lsbCB0aGVyZWZvcmUgb25seSBoYXZlIC4u
Li4gcG1kIA0KZW50cmllcyAoaGVuY2Ugbm8gcGdkL3A0ZC9wdWQgZW50cmllcykuIExvb2tzIG9k
ZCBidXQgdGhhdCdzIHdoYXQgaXQgaXMuIA0KcGdkX3BvcHVsYXRlKCksIHA0ZF9wb3B1bGF0ZSgp
LCBwdWRfcG9wdWxhdGUoKSBhcmUgYWxsICJkbyB7IH0gd2hpbGUgDQooMCkiIGFuZCBvbmx5IHBt
ZF9wb3B1bGF0ZSBleGlzdHMuIFNvIG9ubHkgcG1kX2xlYWYoKSB3aWxsIGV4aXN0IGluIHRoYXQg
DQpjYXNlLg0KDQpBbmQgdGhlcmVmb3JlIGluY2x1ZGluZyA8YXNtLWdlbmVyaWMvcGd0YWJsZS1u
b3A0ZC5oPiBtZWFucyAuLi4uIHlvdSANCmhhdmUgcDRkIGVudHJpZXMuIERvZXNuJ3QgbWVhbiB5
b3UgaGF2ZSBwNGRfbGVhZigpIGJ1dCB0aGF0IG5lZWRzIHRvIGJlIA0KY2hlY2tlZC4NCg0KDQo+
IA0KPiBFdmVuIGlmIHBnZCBleGlzdHMgKHRoZW4gc29tZXRoaW5nIEkgb3Zlcmxvb2tlZC4uKSwg
SSdtIHdvbmRlcmluZyB3aGV0aGVyDQo+IHdlIGNhbiBwdXNoIHRoYXQgZG93bndhcmRzIHRvIGJl
IGVpdGhlciBwdWQvcG1kIChhbmQgbG9va3MgbGlrZSB3ZSBhbGwNCj4gYWdyZWUgcDRkIGlzIG5l
dmVyIHVzZWQgb24gUG93ZXIpLiAgVGhhdCBtYXkgaW52b2x2ZSBzb21lIHBndGFibGUNCj4gb3Bl
cmF0aW9ucyBtb3ZpbmcgZnJvbSBwZ2QgbGV2ZWwgdG8gbG93ZXIsIGUuZy4gbXkgcHVyZSBpbWFn
aW5hdGlvbiB3b3VsZA0KPiBsb29rIGxpa2Ugc3RhcnRpbmcgd2l0aDoNCg0KWWVzIEkgdGhpbmsg
dGhlcmUgaXMgbm8gZG91YnQgdGhhdCBwNGQgaXMgbmV2ZXIgdXNlZDoNCg0KYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmg6I2luY2x1ZGUgDQo8YXNtLWdlbmVyaWMv
cGd0YWJsZS1ub3BtZC5oPg0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3Rh
YmxlLmg6I2luY2x1ZGUgDQo8YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3A0ZC5oPg0KYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmg6I2luY2x1ZGUgDQo8YXNtLWdlbmVy
aWMvcGd0YWJsZS1ub3BtZC5oPg0KYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9w
Z3RhYmxlLTRrLmg6I2luY2x1ZGUgDQo8YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3A0ZC5oPg0KDQpC
dXQgdGhhdCBtZWFucyB0aGF0IFBQQzMyIGhhdmUgcG1kIGVudHJpZXMgYW5kIFBQQzY0IGhhdmUg
cDRkIGVudHJpZXMgLi4uDQoNCj4gDQo+ICNkZWZpbmUgUFRFX0lOREVYX1NJWkUJUFRFX1NISUZU
DQo+ICNkZWZpbmUgUE1EX0lOREVYX1NJWkUJMA0KPiAjZGVmaW5lIFBVRF9JTkRFWF9TSVpFCTAN
Cj4gI2RlZmluZSBQR0RfSU5ERVhfU0laRQkoMzIgLSBQR0RJUl9TSElGVCkNCj4gDQo+IFRvOg0K
PiANCj4gI2RlZmluZSBQVEVfSU5ERVhfU0laRQlQVEVfU0hJRlQNCj4gI2RlZmluZSBQTURfSU5E
RVhfU0laRQkoMzIgLSBQTURfU0hJRlQpDQo+ICNkZWZpbmUgUFVEX0lOREVYX1NJWkUJMA0KPiAj
ZGVmaW5lIFBHRF9JTkRFWF9TSVpFCTANCg0KQnV0IHRoZW4geW91IGNhbid0IGFueW1vcmUgaGF2
ZSAjZGVmaW5lIFBUUlNfUEVSX1BNRCAxIGZyb20gDQo8YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3A0
ZC5oPg0KDQo+IA0KPiBBbmQgdGhlIHJlc3Qgd2lsbCBuZWVkIGNhcmUgdG9vLiAgSSBob3BlIG1v
dmluZyBkb3dud2FyZCBpcyBlYXNpZXINCj4gKGUuZy4gdGhlIHdhbGtlciBzaG91bGQgYWx3YXlz
IGV4aXN0IGZvciBsb3dlciBsZXZlbHMgYnV0IG5vdCBhbHdheXMgZm9yDQo+IGhpZ2hlciBsZXZl
bHMpLCBidXQgSSBhY3R1YWxseSBoYXZlIGxpdHRsZSBpZGVhIG9uIHdoZXRoZXIgdGhlcmUncyBh
bnkNCj4gb3RoZXIgaW1wbGljYXRpb25zLCBzbyBwbGVhc2UgYmFyZSB3aXRoIG1lIG9uIHN0dXBp
ZCBtaXN0YWtlcy4NCj4gDQo+IEkganVzdCBob3BlIHBnZCBsZWF2ZXMgZG9uJ3QgZXhpc3QgYWxy
ZWFkeSwgdGhlbiBJIHRoaW5rIGl0J2xsIGJlIHNpbXBsZXIuDQo+IA0KPiBUaGFua3MsDQo+IA0K
