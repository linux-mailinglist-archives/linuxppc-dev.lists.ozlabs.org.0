Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B635B2DE9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:03:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP3lk6Dsdz30Mr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kj01MpPs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kj01MpPs;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP3kw642Lz302x
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 15:02:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mwi2yyyqj9euvczeP7pU6iUjrIezumWqtkiaIOqZUGWI6fJFT7QYpBGvC8VuI4G/PHrmFip9UuqxhJWbxNJBPihPeMrmyRjYEF092OElMciQ4YAQr5a6oWYRYMVHLwq9KYmVQqmxdkzXkroZxeBDKUz0kZZQLnzW7SCgzCnMrCj4vjb2eYKPtLhLDlyY/Q2OrFrE4Y4Lpd0tvpGOoD7HOvOyeZcMblu1YdwpP4KAlFduv/tHUW8vcqfla+P6fMhPIcTkHx20RVgB8R6L7vPomyq9ogFIFIg3lgdkqr3rbl+FOU/Wa8uCqehQHIinj5pP62ddkFqUlEqU9h4VIgkSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voAN2KHpGmRiBgWKw7/oFpAtiaVdsQDfvWpc7qAxGFU=;
 b=QH6rgFV6uaPxTb8ozjK0zO1FjEauD5esruQmEE1NmwLSuGM1gtxWeFbhG5W+KxHhHpkwgDCm9fDV79FCylT1HmL2MIAJ8dfPqcoAt22UWqroGH3Zb/ntn1osW7GcOUzPqe2gDy7igAT9/37ZEk8pE1v5H7Pdfl8jOKq3RJ8kULrznpTh+RIwJg5lgilSsxvqVnHrvn7BeTZhqKRULniavzBwFTK5LCEpPK30W5uai0RiVdZADlcWJMDVbbS5wkZNEBNI+vBtYkxDVsiB7+lYPRQtd/Nuyc/r1w7tcESdy6/kAoJ1HdIWfGy7Ji1JRZ+QuVD+ofZz4qSfkMv9DnmhZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voAN2KHpGmRiBgWKw7/oFpAtiaVdsQDfvWpc7qAxGFU=;
 b=kj01MpPs8inWzbkp2UM+ILaZ8EfRMCWGojgIC4uODkcXomwAyYULGpdHrOQbsyoYdbrYeuXQNJVuEXV83OQ1aEOc5NWn/6ZXsjVhFRjaRY5jR4edegFSzbABUZWs2lkrlCcFu6QudTP3nhXohWYb7S5Ns0Kt+XK36BlDwYVneH8HuLNv3U3SZWVynbVP+7onVCMG0eeNj/DlYynEiZ14pv/K+hpaU74H3roEltS2X/T19hUjB5pRP6tRx+uZMbYN6eA6N77j03XmaRmVmWC3HGnnyDmyiHcr+bX2C4PK7/pIkliH8frOD7Cl5anPT0E1fLOA0RWNVYHrHKE4KxBNTg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2973.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 05:01:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 05:01:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
Thread-Topic: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
Thread-Index: AQHYwt5IbXw86yz8YkOMKad6a0rWY63UrcWAgABdEACAAIKmAIAA/1kA
Date: Fri, 9 Sep 2022 05:01:56 +0000
Message-ID: <3e2a3718-9d10-d909-b273-7a86b1d0d0ae@csgroup.eu>
References: <20190621085822.1527-1-malat@debian.org>
 <7cb1285a-42e6-2b67-664f-7d206bc9fd80@csgroup.eu>
 <87v8pyemmw.fsf@mpe.ellerman.id.au>
 <9a5bd7c2-13ee-2517-48f6-e61a6dc9c076@csgroup.eu>
 <20220908134800.GM25951@gate.crashing.org>
In-Reply-To: <20220908134800.GM25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2973:EE_
x-ms-office365-filtering-correlation-id: 5c1d50d1-af3d-4eb3-7b83-08da92206b6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MJC2H5YpgxDSnVfRqd4fvvj7vwAAmJni2sZdbMWAaRtkawZ/icAx65wqDCXLLzaepww2N3k1K8ZeZmAMj05MPZ90q5roiOQk2abzSU1YnV7bQ+zw/SAGBStkxS60vNBpR0C0HDJ4vecvRdq86TmHTizNjpzKL325+79WZuoMCqrMTYmV6sAsDLGmOeikjv04QQBHfyNHuFOw+u4U0ojNPC8R9MnHYiU5Qu8El2NjqXB9YSqSnHCEd3KzC9k5AMm2wfM9ArrZEt5EcTYckl7M56vVcSSFvpVX55bSNLWGZpQ74V6X0J5pEUPykFK/fMZNPzpEOtprmbanAG66HpdHc1TPRuc2x/qi6C7xshvgh1bg2l66YeT3sBlbP7ogZKIedlYWJYJ99U580wnEnsF25hPKd5ai1NfD0ydYYON/WkMIw5W4j8WSXJCIkF6QHs7gAttytF6YWvsx8UD1PKGMfE5dwwqPJastBFhXnzBDNsStZS7nzChGZRUPB/jhZMhuM1fgCki1N1VqRrVmqLmnBcL8tAr5htoe0D4SepA2XLu1CvDqAK/rpWRYw9gwt6VEODyktCqHrmbxSTj6OQRkJhN9HGAjAVMqXOj7ZM6RhD+2iT2ovTMzm3cSf8gnrU67LxJ8uVnnP21QYd5nTIGA0jaTfU85S6VI4obcQjBYvII30iVcyEK25Wn4DZ75k+qcvBIB+bxEDqIYfck4iAMehwVUFwh2OvkmXcHsQRyyFWU/9DXXYy6JNmuT0LRu2GQ3N3H5Sp6BtR6CG9uhfwihTzHo3hc/1+NIkvKJhTQdBM/2mRAh5SLXX4ShfCUXB++ZKhL7itVd3jGr50xJNF8Cng==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(186003)(71200400001)(2616005)(54906003)(31686004)(122000001)(86362001)(36756003)(6916009)(316002)(38070700005)(5660300002)(8936002)(6486002)(8676002)(66556008)(66946007)(76116006)(66476007)(478600001)(26005)(91956017)(66446008)(44832011)(4326008)(38100700002)(64756008)(41300700001)(6512007)(31696002)(2906002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TDdQSmw5WDY5OWdPYUZPNCtSZmlRSjQzU093ZVlQM1ZJa3NSKzN0MVZULy9J?=
 =?utf-8?B?UDhpQlE0Z2xuS2o1OVRuOVRjcDRxS0ZLSWlzVVdKbXh4MHMzWERiWEVOTVZx?=
 =?utf-8?B?R3ZUVm5Qcm5Gbk8vTjV3aWM3bUJ2OHl6U0dZMHdKNlhxOW9CbllMR3RlWEpx?=
 =?utf-8?B?OXV6U0lxRm84VTdLZ3RuQXVBQzZJYm82VWlBY0FzSmlhajJERUVhc2ZKdS9F?=
 =?utf-8?B?Yk1QQUFSZmU4U0JRUitIRXVxV05mQVJLS2pvbHh6cXJKNWppendIbmU0WlZa?=
 =?utf-8?B?MGViOHNnb2tRKzZTcnVlNnZFZkVrd3lIeUZ0K09MbkpXQmRZbHRqakw3bFdx?=
 =?utf-8?B?SjB2QThUcU92ei9pZHYwaUl1dVcxWkJVVTFrU1VERmlRREtjNkdmbTJPSCtV?=
 =?utf-8?B?TlhVU1AvYndNRnRYL1NTWlhBeFJwUysxd1hMd3IrK01vZC9EbHdmaDBvcFRs?=
 =?utf-8?B?MDFiTXBjRHY1RjRBZWd2S2dFaDNhZ1MxNDduS3hyUHowN0RPSFdkenZBeE5M?=
 =?utf-8?B?SmhheUo0TVJzT25YQnBiemdZUFFjNGRjZGMxdVd3S1FXV3R3aWZ6NmlPaERz?=
 =?utf-8?B?L3NlVjBwa2ZCRkhMQW4xOERZYjczVDI3QlpEQ0tPVWlBdkZaaGtJZW03QzY2?=
 =?utf-8?B?L0hLZzR6a29zbGwwU2JRZFAxbUtKdzlZZDV4RzRJcjEyQXh0dE1HTXA2MVlF?=
 =?utf-8?B?Z01hYXp5WlptUFhaeFNkcnlYTFozLzZoakdtblRITFpZVHFvS1A4ZHdjUEQy?=
 =?utf-8?B?ZHJRTVQ1U3ZmSlk5WmtsdWRXRW9DMzJic3F3TTBPVWUyNUVvMVozRHVjVHRH?=
 =?utf-8?B?QlpyYmpVa1ZCQ3NtdWdIZGFGSGw4bisxKzlYOFl4enRmM0JVcVpFYU1zem9M?=
 =?utf-8?B?Nmd3TlZ1bmNUcmFscmdNV2YzdGVOdys3OTZEeHlCaTh5VzlqQy9MSndkWVYv?=
 =?utf-8?B?WU5qeTY1em1MOGk2VFI2V1FKUENibENBSC82eWtuU0NHNHoyYzJkWGVDdXpt?=
 =?utf-8?B?eWNpWElQcm9qZlhNbFF4UzM0TytWUVovVGdvYUpwV3hpSmtSR0NVb0JJL0pI?=
 =?utf-8?B?MHZ4SzllUGo5SlJIa2ZjeWJhMGZ0algwczV1K0MwUW50eHhrUTdOK2QrUzhU?=
 =?utf-8?B?VXVlM2FKWElWUWlPOUJWOENKTjNHMlhwemZZMXptd3h3UTJoQmJGejh2REZr?=
 =?utf-8?B?bTF3YTdhSWtsY1JMUnZ2UXBxdW5iM01VQjVOWVh1akVhYXpYWStyWTNUcGlP?=
 =?utf-8?B?emZMNFVIUG84eUlTZHh5K0xVVi9lVEJOTkx5dEo5alVjMkNUTXFLY3YwaE0x?=
 =?utf-8?B?bzk3VXR3QWNoTnZta0EydW8wakI5MGhhRURMNytZSG5ZZ3FwWWlwVXNZRDQz?=
 =?utf-8?B?L2tudkVHYnVBUng5cHBmTFNzQlVxeFZEMmErbU5xbkZrYnVPR2gwUU5rcnZW?=
 =?utf-8?B?U0dHUEZJaHhqYXo1UzhPRTYrcjZuNXJValVnUExrRkdEQ3orMUZUVzI2aE43?=
 =?utf-8?B?cnh3a3dNRXhkY2lvZUhmSmJUbHJKRjN2eDZ2cjdPejRJamJwdWxSOUVyNncz?=
 =?utf-8?B?ZU9QOWN5dXhkaGZMTkZpUi93emdaY0paNWp3ZG1nbXNDKzdNZDdDUG1DU29N?=
 =?utf-8?B?WDgzQmxRVmxVT0tyaGI3WDdYbThaU09aNWJIUGJWcFdMTjJEamduV3VzbmdD?=
 =?utf-8?B?dnVVQWtNcHhnTGljc01OVFdJU20xQnB3WjlNWm9tMFJWZ2dXQ3VoTTU2WDB6?=
 =?utf-8?B?c1NGOVNiWmhjUXhIRW9vcFYyWEFWZE8zbVFnN2txU2J5aXk5TlB6OTk5K2Vn?=
 =?utf-8?B?OXpzYTl4VlhhMFdPK2drb0lSUFlncFJ4VlY3b283SmRyUkdQTnNPb0NWcTA5?=
 =?utf-8?B?TFp1YUk2ZTR0U0NlRWZQQzM2NDI1VjNKL2E2WEx2ejJ0eEtQbkQyb2ZqbkN4?=
 =?utf-8?B?MjdnaTJLbGZyeEJkRll4UklhUE1hUVJIdU5sSEpGamg5L0dhRkI5ZCtKNklF?=
 =?utf-8?B?YW03NE1TemxLWlRIOHZadjExamppT1VwMENpQzhkT25ueHJsMUpEaHV6Z1c1?=
 =?utf-8?B?TWJHZ2lrMUw5dzhGb0Z4cHQ3VGJTc2VNUFh2Z3NQVlhHUG5aVWxNVVFjVUM4?=
 =?utf-8?B?V2I0ZW14aU5TT0kyK1FhNUNlTWVQdlJPeHZsSEtPMUUvQ2VxajZUUjhwR3NR?=
 =?utf-8?Q?YKmkGqsKsz7ogSJqJ7BwZEk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CCF50EE2FFDE14A8A5CA59A3546ECA3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1d50d1-af3d-4eb3-7b83-08da92206b6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 05:01:56.5267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gmi0Ubi3JoHHtNeue88Xq9yfBjKMECcekfIGUN3JYxxLvuE3FCKtcXQKBePDLXG/W2ulBsSs39REEgoNNHN9J0JcDYc8PZ9bkKMK3UIf70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2973
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
Cc: Mathieu Malaterre <malat@debian.org>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA5LzIwMjIgw6AgMTU6NDgsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBUaHUsIFNlcCAwOCwgMjAyMiBhdCAwNjowMDoyNEFNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4gTG9va2luZyBhdCBpdCBtb3JlIGRlZXBseSwgSSBzZWUgc3RyYW5n
ZSB0aGluZ3MuDQo+IA0KPiBJJ2xsIGhhdmUgdG8gc2VlIGZ1bGwgZ2VuZXJhdGVkIG1hY2hpbmUg
Y29kZSB0byBiZSBhYmxlIHRvIHNlZSBzdHJhbmdlDQo+IHRoaW5ncywgdGhlcmUgaXNuJ3QgZW5v
dWdoIGluZm9ybWF0aW9uIGF0IGFsbCBoZXJlIHlldC4gIFNvcnJ5Lg0KDQpXZWxsLCB3aGF0IEkg
Y2FsbCBzdHJhbmdlIGlzIHRoZSBmYWN0IHRoYXQgd2l0aCBHQ0MgdGhlIG51bWJlciBvZiBieXRl
cyANCnJlcG9ydGVkIGJ5IC1XZnJhbWUtbGFyZ2VyLXRoYW4gZG9lc24ndCBtYXRjaCB0aGUgdmFs
dWUgdGhlIG9mZnNldCB1c2VkIA0KZm9yIHRoZSBzdHd1IGF0IHRoZSBzdGFydCBvZiB0aGUgZnVu
Y3Rpb24sIHdoaWxlIGl0IGRvZXMgd2l0aCBjbGFuZy4NCg0KPiANCj4gVXNlIHByaXZhdGUgbWFp
bCBpZiBpdCBpcyB0b28gYmlnIG9yIHVuaW50ZXJlc3RpbmcgZm9yIHRoZSBsaXN0IDotKQ0KPiAN
Cj4+IFdoYXQgaXMgdGhhdCBmcmFtZSBzaXplID8gSSB0aG91Z2h0IGl0IHdhcyB0aGUgbnVtYmVy
IG9mIGJ5dGVzIHIxIGlzDQo+PiBkZWNyZW1lbnRlZCBhdCB0aGUgYmVnaW5pbmcgb2YgdGhlIGZ1
bmN0aW9uLCBidXQgaXQgc2VlbXMgbm90LCBhdCBsZWFzdA0KPj4gb24gR0NDLiBJdCBzZWVtcyBH
Q0Mgc3Vic3RyYXRzIDExMiBieXRlcyB3aGlsZSBjbGFuZyBkb2Vzbid0Lg0KPiANCj4gVGhhdCBp
cyB0aGUgdmFycyBzaXplICsgdGhlIGZpeGVkIHNpemUgKyB0aGUgc2l6ZSBvZiB0aGUgcGFyYW1l
dGVyDQo+IHNhdmUgYXJlYSArIHRoZSBzaXplIG9mIHRoZSByZWdzIHNhdmUgYXJlYSwgcm91bmRl
ZCB1cCB0byBhIG11bHRpcGxlDQo+IG9mIDE2LiAgRml4ZWQgc2l6ZSBpcyA4IG9uIDMyLWJpdCBQ
b3dlclBDIEVMRi4gIEZyYW1lIHNpemUgdXNlZCBieSBHQ0MNCj4gaGVyZSBpcyBqdXN0IHRoZSB2
YXJzIHNpemUuDQoNCk9rLCBzbyBpdCBtZWFucyB0aGF0IHRoZSBzdGFjayB1dGlsaXNhdGlvbiBp
cyB1bmRlcmVzdGltYXRlZCB3aGVuIHVzaW5nIA0KR0NDID8gT3IgaXMgaXQgY2xhbmcgdGhhdCBv
dmVyZXN0aW1hdGVzIGl0ID8NCg0KPiANCj4+IFNvIGl0IHNlZW1zIHRoYXQgR0NDIGFuZCBDTEFO
RyBkb24ndCB3YXJuIG9uIHRoZSBzYW1lIHRoaW5nLCBpcyB0aGF0DQo+PiBleHBlY3RlZCA/IEdD
QyBzdWJzdHJhdHMgMTEyIGJ5dGVzLCB3aGljaCBpcyB0aGUgbWluaW11bSBmcmFtZSBzaXplIG9u
IGENCj4+IHBwYzY0LCBidXQgaGVyZSBJJ20gYnVpbGRpbmcgYSBwcGMzMiBrZXJuZWwsIG1pbiBm
cmFtZSBzaXplIGlzIDE2Lg0KPiANCj4gSSBuZWVkIHRvIHNlZSB0aGUgZ2VuZXJhdGVkIGNvZGUg
dG8gbWFrZSBzZW5zZSBvZiB3aGF0IGlzIGhhcHBlbmluZw0KPiBoZXJlLiAgSXQgc291bmRzIGxp
a2UgaXQgaXMgZG9pbmcgdmFyYXJncyBjYWxscyBvciBzaW1pbGFyIGV4cGVuc2l2ZQ0KPiBzdGFj
ayBqdWdnbGluZy4gIE9yIGp1c3Qgc2F2aW5nIGEgYm9hdGxvYWQgb2YgcmVnaXN0ZXJzIG9uIHRo
ZSBzdGFjay4NCj4gDQoNCk9rLCBJJ2xsIHNlbmQgaXQgdG8geW91LiBCdXQgb25jZSBhZ2Fpbiwg
SSBkb24ndCBtaW5kIHdoYXQgdGhlIGNvZGUgDQpyZWFsbHkgbG9vayBsaWtlLCBJJ20ganVzdCB3
b3JyaWVkIHRoYXQgR0NDIGRvZXNuJ3QgcmVwb3J0IHRoZSBlbnRpcmUgDQpzdGFjayB1c2FnZS4N
Cg0KDQpDaHJpc3RvcGhl
