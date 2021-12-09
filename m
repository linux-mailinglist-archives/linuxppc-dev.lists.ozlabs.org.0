Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1F46E7A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 12:33:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8sNt1f1Vz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 22:33:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8sNJ2dfWz2xsX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 22:33:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrjNBMU0d9ZD1UsFuboVKAli+yh6Dm5F2nCfQbLh7nFP3ypY2LOW1uq5Iun7PmZRKD8R0HQvhp2WxFownrOf3FmEmypHdE7AHgiGbsn3E8ONxCY8hnIKLtsDP2QCMLwW7OyZQdIDXSXtGnoUqykrsQr2Q+c9WoJMhpXJlFC5YS8Ohq23jN3bQJDWtaXGkpNydBXWZD/lceExHDU7qeHAoncw9AbrMARHsCsvjJOX2H46TE/RrcoiTJ4mzeDQnUrSKNyOu21ZkaoK0qQmhhTUBOGGOrTCuNvKVjo+AamwqNVCZ/zwgGe95+p0X6MRFYuVvyqqFF1tS2812oCVPhZlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa6s4KBYoUfMcrb7HcY/hsM0Cm06unEHKWAxlbUdMNY=;
 b=GF7hnZd9bX4S92DO4Amnd5on5jEjVuBK8Qqj1Terp+RJ2XDqyzXAUpwFNzap3wUJh8lymNFg4EcrtSQWOmmoVkVpZ57W12S5Pupa1/FlwAtHesW4IVWNwRNchN8NQvAFOLLBBHcrqqqazO0Rx+znDxC7LMUvjjDKuc6eDbzWiAcnaKvrehKfE25GnqBKU4bFpVm+uAA5EnhmXQvBvA6285JKx6PttPSaStoyDPSgHd/1vcXSPs6eITUPL4CGtlLRpilo0upcQDxTocNKypLecePmAujrtEjMUTGyMT0bwrSaX24OgsyTHWgNULgPFlTygVOvWemmKEF6WgdYHQ6Cpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1940.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Thu, 9 Dec
 2021 11:32:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 11:32:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Topic: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
Thread-Index: AQHX7FeaDIjAZ/GjkUuXVuFYrIE566wp8sIAgAAByICAAAX+AIAACuKAgAAC2oA=
Date: Thu, 9 Dec 2021 11:32:41 +0000
Message-ID: <7990b457-0b16-b4fb-d279-89a4cdc093a7@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
 <1639044621.jeow25j0pr.astroid@bobo.none>
 <360e2a3e-63c6-3ce2-f481-695ad0ec4880@csgroup.eu>
 <1639046542.qkwu4mjtew.astroid@bobo.none> <87v8zym39m.fsf@mpe.ellerman.id.au>
In-Reply-To: <87v8zym39m.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc7d93cb-00b4-46fb-b4f7-08d9bb079cbd
x-ms-traffictypediagnostic: MR1P264MB1940:EE_
x-microsoft-antispam-prvs: <MR1P264MB19403CFCE3FBE80039280BF1ED709@MR1P264MB1940.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m2OSws3LsdXUafq8XQfsdbf9uc2bqfYYBlU3oFhXSq5OUg/0SM9EZE0QbC7/bh36vmVKU9mt6Cj8ZZFM1tnqDQb27DbwHfFOOw0uwnQNuiQ4Nf0b+2+2jOL4vDWJ5quHA/1HtlAMp9CPjtoCWm7rgWPdc8sJ5VK7ZmayDgh6CJhGIA6S9As81x00jBLs6/TYy1BgrHfurd5fsf/pHgg5p2kMlKAntT/zSGI5yC5p6k2fndJm7jivp3+njhVR9bnsV6/6GMCzntFJX7K6kYrrwUJuvnh8yNkud/s7Othifn231NdmhmqZbWkFNx2w9MrPfdNxHmzgwVdaKU6R918mOP389TFE4Glq1HvDJQIPa7pZ0tNXgxW+CcX4PKwMcJRMYJLUkyJ/ruXJwSSStOti8BbrgMPppbWOJixzqZZubAzQvnMab7u/b4vvFRSO/FzAOQDDnxD0yaI9H+wR96VzOqi/7LQTFxauU3g+tOA9ZjtwNkd/eMGjM90hN0XqOdV8XQksMFeRw5Xk4XQMqa8r85bxsJqtEYQSAOO07qqu8vNeSv9cCzLkRU++DLS9vEEboVMLJmHKlJJJ9T6lMEPdeicmen5xV+Al8icusOZc2Kzw3c266QvoO3gPp4S0ySxoU7ftDj4gVVy70fezNRchEyvJeEwgXagPMj7LOyt1rMQ6DB1i09dDkotcXVG3xoBQPh4Id13zJINVxE8MnJ8BH1SSP1S89LyqgWuplAcQex4iGZFXU4vdH5rSYlUuhPf9pMKX/c84f36a/3sxKzR+a4I01EHOWrSSxB5IAgKO2KMk17S9sEF/HRv8FUMwWiOGBhhLPBtp8RvkeKpkMgSbmdFohjxXQ9dg7vqATMI0k6s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(5660300002)(2616005)(66574015)(26005)(122000001)(38100700002)(83380400001)(6506007)(44832011)(38070700005)(66446008)(91956017)(66946007)(66476007)(66556008)(64756008)(8676002)(316002)(8936002)(508600001)(2906002)(4326008)(31696002)(966005)(54906003)(36756003)(110136005)(6512007)(31686004)(6486002)(86362001)(71200400001)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2FYbmFKRmMrVGhjRnVwdE90L1pEQXJzMitwVEJmVVhLdkUrQVBvaWlMU0Vu?=
 =?utf-8?B?eC9OdktMajRPRlMvNVJPcXUwZUJwTmg4ZGVEU3BvTUpxRS93WlF5bnZ2anB1?=
 =?utf-8?B?cWxLdlJGQi9qVDZHRkFjMllmdHU4ZWRZU2pUQUhFbVlwd2RJdzhRZml4SGw2?=
 =?utf-8?B?ell2QXRWVmdERlhNYVNoNktyS0duOWd6Mk1LTmIyQ3BEeDNSS0kyS1ZpNlFv?=
 =?utf-8?B?V3lxMnVndFNrTkhVRjNjcElQN0pieWJ1M1lMZ0FHd250R0tJSGlRYjUzc3Er?=
 =?utf-8?B?KzU1ZGFxVTFGMVpOc3FvNVlBQUgzUWRqZ2tXQXJtcWRhelBVUlhzMUNldTNL?=
 =?utf-8?B?K0FDWDF2VFhKWXdUaFB1QmhYM0V0dGVyNWllYUFlSDZqK1RjUS9SMGtnSDRL?=
 =?utf-8?B?NTBuUnU1aWdXdjg3UWxyNzU2MGYvS0dlaXpZVGJiaXUvOFliU0pxK0x0N3dH?=
 =?utf-8?B?UWlzU2ZEVWtMeisyTWZQaE9wSFN5c1BlUnpYam0yNXhqU2RsRHBYZm1BNk0z?=
 =?utf-8?B?bjFkWGpqaXVwbjVUb0xkQ2tLejZnUk90aDlVMVRCYWVvUElwcHMxRFEyTHEw?=
 =?utf-8?B?RXE5NjJLMGV1aVVSd3dQNVptdDVMMHZjbXhvVEZHYloyZnR5N3ZJM0FDQzU3?=
 =?utf-8?B?VS83QnFHR1FSdnVyQ1dXQm1mbVVNcFE3WlFCd0ZzUDZQRy9KNThndjArWkN2?=
 =?utf-8?B?d2xxdWgvYUxUYzRTa2lDNnl5ZjF3eW40ZURnZk9JUlJUZU5nWk1TS1h5aXN3?=
 =?utf-8?B?V2dHb1I4cDdzYlUyUG1GclJLK3FhTEVUOUFPQ01IRmFPb0JOSXhweDdEeFNP?=
 =?utf-8?B?ak5iYk5oZDFiWm9ncGVxbW5ZdXhnV0VDWGhmUTJsNUxMdjU5cTBjRGxnYy85?=
 =?utf-8?B?M1lESDF1SG1VL1g3VHhKdHVhbFJtVFYybk5sR2NIMnZnc0tDbVhXRisxZ3hZ?=
 =?utf-8?B?NmZYYVVidzJwWnd2WEhpOGN1OWlKZ25xdGtWWnU0cElHQXNZUTRoTDFRNFNB?=
 =?utf-8?B?OHVQR1lxemhMSG1VUHR5Rm5jT01JVzQvbS9XWitBSno4dW0wYVorclZhQ25r?=
 =?utf-8?B?OW9mcmF5TWRxWC81VU8wMVI4RS9FdU1UYjI0cEc3dVR0b2ErbHlHV1V0N2Rw?=
 =?utf-8?B?ZGRjdG9aRmd1UUZPWkJqSm9YOGlGNzJpVE80eFlwL2ZQc00yNVZjRnRJRlQr?=
 =?utf-8?B?WTlIbTl2ZFFFRHI1TEx6MmlWWFd0K2gyelJ3Mi9EeCtHaTliSURBK3dKVDd1?=
 =?utf-8?B?MWZReGdwWnJ5dEdmVE85WlRqMDlhendxZ0lhQ2VIdCs4WFhWd0xpdXNwR0Ir?=
 =?utf-8?B?WDBCOE12R3dUUngvMzNhaWthY2JUSDNLNEZKVmFEL0JoMUE1N1J5bC9BNjJV?=
 =?utf-8?B?UVprWFQwcENiUmptaGR4YjhoejE5MVRlUGxCM3kvUldjTGQ0eHRwd3RMRW1U?=
 =?utf-8?B?dzE1VnY4OWdBbXpTOWxSbHpDZ0RxSk9ndDNMRHlpRWRMbTNNd0tHcGU5U2w4?=
 =?utf-8?B?T0dXTnNzUEg4cEpVVlhMMGVCZzU1eUg5aEhuQVRTWjVvb2NCZi9xc2ZLek5G?=
 =?utf-8?B?THFIRU85akJ3aVlqekdRMU1JVjR2cjNodjI1cDYwZ2NKV01RUGtobXJQMmVu?=
 =?utf-8?B?SVhkK2NpOU5MRThQYk02UnhQQmk0S1RQcVl5STZOaGNpSktnS2ZBTmVjRWJF?=
 =?utf-8?B?STg1Um1GV2xIUStRbjRvUFNDZUsvNXNtNWVtbzMyb1VNbVhOakRZeHlQY0Zy?=
 =?utf-8?B?Tll5QXlCTHU5Ly9rQlJqcVlQYVdPT2JWWkE1TnYyQXZzaFNHTUJiaXpYOGcy?=
 =?utf-8?B?Ymh1M09pakZxT1RWeVJ6bUpTVUhiVTlVbUZlSDdzc2J5ZG95bGVpOVBzK2ty?=
 =?utf-8?B?YzIrU0ZOME0waU5vbDQvVG42dWV3enR3ODBGWGhYQVdsWkIvSi9CaHFaVzJz?=
 =?utf-8?B?ZE5KVVBsUENGVzMyTUdEZk9pazI3VCtGNFlIcVJvenBEOUQxQW9IKzVaNzRk?=
 =?utf-8?B?Nmg3T2tYVUdEaW56WXd2eGU4Tkp0NXIxSXE1L0RiNWFIdXNSTzlCWklEYnJp?=
 =?utf-8?B?QWtQTlpWTDRnQnRmR2xZOHREeW02UTQ1bXQvSDcxOVhwYm9lUTYyNXZTOFpj?=
 =?utf-8?B?cFlzREp1VWpJWlIvOUVaT3RMbXA0UU40b0FraThydzhwSjM5dk1lOW9DeGJJ?=
 =?utf-8?B?V3pyTndmWDBNVzBYK0xlbTRlck1XMFBOQU10Ylk2Qmp3MTJKaFpxakRGQlJI?=
 =?utf-8?Q?0Y0gnJNvikgQaGF9dCi570oldQLGiJpUlW/+sULp9s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FA27485BB5D4C45A097386262895E03@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7d93cb-00b4-46fb-b4f7-08d9bb079cbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 11:32:41.7423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kIO/fubvHgCuWYf046x3QNZX355CJP7szr8PEJNPkSc3Uzzo3NL4/Im7PnPQVtIvFHY+flCsX7nEKB5a4PFBo0JHdpGMq42cjvY9/wNeqS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1940
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMTI6MjIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4gd3JpdGVzOg0KPiANCj4+IEV4
Y2VycHRzIGZyb20gQ2hyaXN0b3BoZSBMZXJveSdzIG1lc3NhZ2Ugb2YgRGVjZW1iZXIgOSwgMjAy
MSA4OjIyIHBtOg0KPj4+DQo+Pj4NCj4+PiBMZSAwOS8xMi8yMDIxIMOgIDExOjE1LCBOaWNob2xh
cyBQaWdnaW4gYSDDqWNyaXTCoDoNCj4+Pj4gRXhjZXJwdHMgZnJvbSBDaHJpc3RvcGhlIExlcm95
J3MgbWVzc2FnZSBvZiBEZWNlbWJlciA5LCAyMDIxIDM6MTggYW06DQo+Pj4+PiBTZWxlY3QgQ09O
RklHX0FSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQgYW5kDQo+Pj4+PiByZW1v
dmUgYXJjaC9wb3dlcnBjL21tL21tYXAuYw0KPj4+Pj4NCj4+Pj4+IFRoaXMgY2hhbmdlIHByb3Zp
ZGVzIHN0YW5kYXJkIHJhbmRvbWlzYXRpb24gb2YgbW1hcHMuDQo+Pj4+Pg0KPj4+Pj4gU2VlIGNv
bW1pdCA4YjhhZGRmODkxZGUgKCJ4ODYvbW0vMzI6IEVuYWJsZSBmdWxsIHJhbmRvbWl6YXRpb24g
b24gaTM4Ng0KPj4+Pj4gYW5kIFg4Nl8zMiIpIGZvciBhbGwgdGhlIGJlbmVmaXRzIG9mIG1tYXAg
cmFuZG9taXNhdGlvbi4NCj4+Pj4NCj4+Pj4gVGhlIGp1c3RpZmljYXRpb24gc2VlbXMgcHJldHR5
IHJlYXNvbmFibGUuDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gQ29tcGFyaXNvbiBiZXR3ZWVuIHBvd2Vy
cGMgaW1wbGVtZW50YXRpb24gYW5kIHRoZSBnZW5lcmljIG9uZToNCj4+Pj4+IC0gbW1hcF9pc19s
ZWdhY3koKSBpcyBpZGVudGljYWwuDQo+Pj4+PiAtIGFyY2hfbW1hcF9ybmQoKSBkb2VzIGV4YWN0
bHkgdGhlIHNhbWUgYWxsdGhvdWdoIGl0J3Mgd3JpdHRlbg0KPj4+Pj4gc2xpZ2h0bHkgZGlmZmVy
ZW50bHkuDQo+Pj4+PiAtIE1JTl9HQVAgYW5kIE1BWF9HQVAgYXJlIGlkZW50aWNhbC4NCj4+Pj4+
IC0gbW1hcF9iYXNlKCkgZG9lcyB0aGUgc2FtZSBidXQgdXNlcyBTVEFDS19STkRfTUFTSyB3aGlj
aCBwcm92aWRlcw0KPj4+Pj4gdGhlIHNhbWUgdmFsdWVzIGFzIHN0YWNrX21heHJhbmRvbV9zaXpl
KCkuDQo+Pj4+PiAtIGFyY2hfcGlja19tbWFwX2xheW91dCgpIGlzIGFsbW9zdCBpZGVudGljYWwu
IFRoZSBvbmx5IGRpZmZlcmVuY2UNCj4+Pj4+IGlzIHRoYXQgaXQgYWxzbyBhZGRzIHRoZSByYW5k
b20gZmFjdG9yIHRvIG1tLT5tbWFwX2Jhc2UgaW4gbGVnYWN5IG1vZGUuDQo+Pj4+Pg0KPj4+Pj4g
VGhhdCBsYXN0IHBvaW50IGlzIHdoYXQgcHJvdmlkZXMgdGhlIHN0YW5kYXJkIHJhbmRvbWlzYXRp
b24gb2YgbW1hcHMuDQo+Pj4+DQo+Pj4+IFRoYW5rcyBmb3IgZGVzY3JpYmluZyBpdC4gQ291bGQg
eW91IGFkZCByYW5kb21fZmFjdG9yIHRvIG1tYXBfYmFzZSBmb3INCj4+Pj4gdGhlIGxlZ2FjeSBw
YXRoIGZvciBwb3dlcnBjIGFzIGEgMi1saW5lIGNoYW5nZSB0aGF0IGFkZHMgdGhlIGxlZ2FjeQ0K
Pj4+PiByYW5kb21pc2F0aW9uLiBBbmQgdGhlbiB0aGlzIGJpZ2dlciBwYXRjaCB3b3VsZCBiZSBj
bG9zZXIgdG8gYSBuby1vcC4NCj4+Pj4NCj4+Pg0KPj4+IFlvdSBtZWFuIHlvdSB3b3VsZCBsaWtl
IHRvIHNlZSB0aGUgZm9sbG93aW5nIHBhdGNoIGJlZm9yZSBkb2luZyB0aGUNCj4+PiBjb252ZXJ0
ID8NCj4+Pg0KPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBw
Yy1kZXYvcGF0Y2gvN2RhYmYxY2JkZTY3YTM0NmExODc4ODFkNGYwYmQxNzM0N2UwMzM0YS4xNTMz
NzMyNTgzLmdpdC5jaHJpc3RvcGhlLmxlcm95QGMtcy5mci8NCj4+DQo+PiBZZXMuDQo+IA0KPiBN
eSBjb21tZW50IGF0IHRoZSB0aW1lIHdhczoNCj4gDQo+ICAgIEJhc2ljYWxseSBtbWFwX2lzX2xl
Z2FjeSgpIHRlbGxzIHlvdSBpZiBhbnkgb2YgdGhlc2UgaXMgdHJ1ZToNCj4gICAgDQo+ICAgICAt
IHByb2Nlc3MgaGFzIHRoZSBBRERSX0NPTVBBVF9MQVlPVVQgcGVyc29uYWxpdHkNCj4gICAgIC0g
Z2xvYmFsIGxlZ2FjeV92YV9sYXlvdXQgc3lzY3RsIGlzIGVuYWJsZWQNCj4gICAgIC0gc3RhY2sg
aXMgdW5saW1pdGVkDQo+IA0KPiAgICBBbmQgd2Ugb25seSB3YW50IHRvIGNoYW5nZSB0aGUgYmVo
YXZpb3VyIGZvciB0aGUgc3RhY2suIE9yIGF0IGxlYXN0IHRoZQ0KPiAgICBjaGFuZ2UgbG9nIG9m
IHlvdXIgcGF0Y2ggb25seSB0YWxrcyBhYm91dCB0aGUgc3RhY2sgbGltaXQsIG5vdCB0aGUNCj4g
ICAgb3RoZXJzLg0KPiAgICANCj4gICAgUG9zc2libHkgd2Ugc2hvdWxkIGp1c3QgZW5hYmxlIHJh
bmRvbWlzYXRpb24gZm9yIGFsbCB0aHJlZSBvZiB0aG9zZQ0KPiAgICBjYXNlcywgYnV0IGlmIHNv
IHdlIG11c3Qgc3BlbGwgaXQgb3V0IGluIHRoZSBwYXRjaC4NCj4gICAgDQo+ICAgIEl0J2QgYWxz
byBiZSBnb29kIHRvIHNlZSB0aGUgb3V0cHV0IG9mIC9wcm9jL3gvbWFwcyBmb3Igc29tZSBwcm9j
ZXNzZXMNCj4gICAgYmVmb3JlIGFuZCBhZnRlciwgdG8gc2hvdyB3aGF0IGFjdHVhbGx5IGNoYW5n
ZXMuDQo+IA0KPiANCj4gRnJvbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9p
c3N1ZXMvNTkjaXNzdWVjb21tZW50LTUwMjA2Njk0Nw0KPiANCj4gDQo+IFNvIEkgdGhpbmsgYXQg
bGVhc3QgdGhlIGNoYW5nZSBsb2cgb24gdGhhdCBwYXRjaCBzdGlsbCBuZWVkcyB1cGRhdGluZyB0
bw0KPiBiZSBjbGVhciB0aGF0IGl0J3MgY2hhbmdpbmcgYmVoYXZpb3VyIGZvciBhbGwgbW1hcF9p
c19sZWdhY3koKSBjYXNlcywNCj4gbm90IGp1c3QgdGhlIHN0YWNrIHVubGltaXRlZCBjYXNlLg0K
PiANCj4gVGhlcmUncyBhbHNvIGEgcmlzayBjaGFuZ2luZyB0aGUgbW1hcCBsZWdhY3kgYmVoYXZp
b3VyIGJyZWFrcyBzb21ldGhpbmcuDQo+IEJ1dCB3ZSBhcmUgYXQgbGVhc3QgbWF0Y2hpbmcgdGhl
IGJlaGF2aW91ciBvZiBvdGhlciBhcmNoaXRlY3R1cmVzLCBhbmQNCj4gdGhlcmUgaXMgYWxzbyBh
biBlc2NhcGUgaGF0Y2ggaW4gdGhlIGZvcm0gb2YgYHNldGFyY2ggLVJgLg0KPiANCg0KVGhhdCB3
YXMgdGhlIHB1cnBvc2Ugb2YgYWRkaW5nIGluIHRoZSBjaGFuZ2UgbG9nIGEgcmVmZXJlbmNlIHRv
IGNvbW1pdCANCjhiOGFkZGY4OTFkZSAoIng4Ni9tbS8zMjogRW5hYmxlIGZ1bGwgcmFuZG9taXph
dGlvbiBvbiBpMzg2DQphbmQgWDg2XzMyIikNCg0KQWxsIHRoaXMgYXBwbGllcyB0byBwb3dlcnBj
IGFzIHdlbGwuDQoNCkJ1dCBJIGNhbiBjb3B5IHBhc3RlIHRoZSBjaGFuZ2Vsb2cgb2YgdGhhdCBj
b21taXQgaW50byBtaW5lIGlmIHlvdSB0aGluayANCml0IGlzIG1vcmUgZXhwbGljaXQuDQoNCkkg
YWdyZWUgdGhhdCBvbGQgcGF0Y2ggd2FzIG9ubHkgcmVmZXJpbmcgdG8gc3RhY2sgbGltaXQsIEkg
aGFkIG5vIGNsdWUgDQpvZiBldmVyeXRoaW5nIGVsc2UgYXQgdGhhdCB0aW1lLg0KDQpDaHJpc3Rv
cGhl
