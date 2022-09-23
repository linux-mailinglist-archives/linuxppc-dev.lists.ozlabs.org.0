Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459855E7442
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYjFF71Vhz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:40:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=v2Svnepf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=v2Svnepf;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYjDX09Xnz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:39:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+1BNER7NQhs0USnQ7UXKtBDMZFhxOUL1/gH0UScV+rD+zGNz/zDleJxUINxt/2MIh7DUWe9RnolRiZdgxhr0rMTxTe7MJXrcBXUeRtod/+/EL1r9N6BptRzRbIx/icY/pDcfxi9teycWf5goY9eSe/2Gn51GqPxeYfejg40UNE9JOufmxFk954IphgnmLRtWxVElGF62iDc6JQ91dX5DnT+Ym45efu+CMehpOkxfVAUrBh/VfFcCLiZnPnvPh0ZHrnM1caz8nQAC+Hut2CXANm+y1jycGXUxlQ76NsCyqBzflxu0xjWGtSkvw3kSjyCGonJ6PH95F2kqHaoOWxtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7w3ZoStSsKcfQ34HSgd4xXRc3zKzekZaDJwIEFMsM0g=;
 b=cltdv64lxP7sV7vpCJ/sqDMtVui7sABQZoIf6AoQphmNvVponJMVnyB7swjCxIW6HkHWaeZ+p5eTWpk7RiPFiWlAsyT1sArRe2d55BF+Ls2re+kR+iU7/rcNDhvw+/S5yZcpOqEeZw3XCTu5zKS3kqZZWlQwGjiC2L0Pp7Q3cJCuLEE5L6XJjO9GcNWYceaivHIFTYIckpCpd1X9J6XgD35kM4w1+KsTux5681beCzMEwlOSdz/Cj6LoHNERq8ZKk/YKFMo1bJzNPUba0tWzbvu+4VcNwFOea9ZO4XugV6YiCbESJHoCbsmHdBfNP4RPTrINT6U6jXioP00dy7z98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w3ZoStSsKcfQ34HSgd4xXRc3zKzekZaDJwIEFMsM0g=;
 b=v2SvnepfswjTCKAlXD3xSmDW/VxAGHSZsxk2sorqMvYCVCFPWDwW6CuUpSC0HPVpEu1VTSKxU6iq7wEKakh6XG5V1KRN0IkpvWYKbsC6PuhUH0J0QaH4e8xyLLUAFUPct7XEPxuuuNxloMz9H7gj5f92r43YnNrD71d0Tg9Gs7sTB7lUvxuyKrTfHctdN03revfrM+8nd47B35waghbT1e+PKIcCq1N777AhbA7sjtpcVtnNYPlfh2zaUm81mxgsbTVynaqNmbawkkJ7X+3SwJbB2uG5il5XLtMD/Ps+/9sAFKrvHFeio/baKpoEov/GnNFl6h6Q4gGnw52vP9EbuQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2131.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 06:39:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 06:39:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 3/3] powerpc: mm: support page table check
Thread-Topic: [PATCH v2 3/3] powerpc: mm: support page table check
Thread-Index: AQHYzxMSNyauOpl/YUGjTLRcgTJAKa3skDIA
Date: Fri, 23 Sep 2022 06:39:04 +0000
Message-ID: <b569dbc1-c11c-4143-7201-b57d13839c4c@csgroup.eu>
References: <20220923060802.1187520-1-rmclure@linux.ibm.com>
 <20220923060802.1187520-3-rmclure@linux.ibm.com>
In-Reply-To: <20220923060802.1187520-3-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2131:EE_
x-ms-office365-filtering-correlation-id: 61ee116b-614b-40b4-0eea-08da9d2e4efc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IuU+piOK7+KNM3WGZuX7bh7G1Fqi05y+HJfJ8VIn/iaY/EMNUqGoRDZ27qbkbdssjuNvG0Vlt7bKVxDOOBG1VxjfsJncXc9XtuAM3MmqZPdWQmogYaOJGJc4cXhBCreD26z+a4S/sWbIBbEC7/vSGX9q9Fv21jzdfvG3ZtCbRJ9AEbQuzBiG6y/JebdJIcOWUNABJrj7mEkJom2zvwuYQYO4ooU3DsKByi94OebBng4Pq5gbBN1OvMc5GvdeK6YTReObODNXvYZvhcsFJxhii6brqfC0gFccIVv2tzPL8wXhYG0QZNEMUA3m8WCBLHcbzacW5g+BAu5rP6LGYNkpCKxKcbfaGL7djbjDUp9VH+BTB1Fsm/iAHSOM86Z7yD2RtaL3U8PIXcXYvfb/TvkuuCBatxRz6LznR41wOCbaP7xvgFYg41zEK2ZnGuRWJ9GaSyvWOVaoYYDukQ36iwTGMqlI3qMCQXM6Wg1iKCPlbd5AFGZq6rbocpUEph1k/LcR+EkvW56erQwRf6GOIvs/0jRNh/ybfRG8uqGIxpyUjZilO5A7JaJqu3UN2ISBHnriaWXTc+dGcTR990QQJsLtD5+RRPVjhdSjkTI5WHWjVEo9i++Rs2AFmCiHZhD0ciOv++k7XKFwYDew5GslHPH+xLmYtYQkEWdX/kpOiUNjJzYPDnTceeCoTkg25gWMyf008ionVF7MNBhrO60ICNHKufNwCVcEdadvKNWAxbqxiKQpYRt9zQIq5PxRUkA7HjwF5cir6NGnOoZ3MP1Rhz6wKN5c2XmXXYLXunZhJ/yeWMn9qbf0/U0po3YYSzmL/dK+5nohMGwfBRxWRp3RXNj31A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(36756003)(44832011)(6512007)(26005)(31686004)(110136005)(71200400001)(66446008)(64756008)(316002)(8676002)(41300700001)(66476007)(76116006)(66946007)(66556008)(91956017)(5660300002)(6506007)(86362001)(31696002)(478600001)(8936002)(38070700005)(122000001)(83380400001)(38100700002)(6486002)(186003)(2906002)(2616005)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dVhxdkhuMStaR1dyMm1yZE1SWWVqckx0Qms5ZmU5OUdpWTdMM1BJSEZvejJ4?=
 =?utf-8?B?NUQ1NGhQUi90Y3o0SVpFWE4vZy9ZYkFJSVA3cGg3amg1dTVUcDNVWFBLVFpk?=
 =?utf-8?B?eDVPWE5BU1hKV2E1TlJMblA0c3psVmcweGdDeVV5bm5YVDlJL2NEeEVLTnk2?=
 =?utf-8?B?RTBVaHRSbWxPOWFrODM1QWtBUXNUTW9hUGdONWd5a3VEd0NSWXBlTko2aTNx?=
 =?utf-8?B?SlJCTkdrRVdTYWVtaTRMSC9GeUppS1RTbGxJNHM5V0QwVlFocmNDcEx0SFFJ?=
 =?utf-8?B?K0pVd0lKYnk1ejJReFo2Q0E4OTVxb2lZN1JNdkNrbzNJdnlxb21XTlJJU3Rv?=
 =?utf-8?B?eEJweUJZN29oYjJrZG4xeDkzSG5lc1MwUGV6ekxWaEtySFJTcWlNVU9TbGh6?=
 =?utf-8?B?cDhGUi9oN01BNTkvV29mVjhxakFoTStsSWNWRCs3WEo2RnYvdVJ3ZkxGdUpN?=
 =?utf-8?B?Z3JSbWI3N3JVbFpMK2Y5UGRkVzVMRjYxYU1ST2tmYjlYOWhFbU4wLzdIQ0Zw?=
 =?utf-8?B?Q3YwL1BMNFVrOGR0dEdud3YxSG5maElSQitkbVhXb3VERkFHci9Ga0JMMGpH?=
 =?utf-8?B?Nkt0eTFPdGJFUWtqMXJ4bkI0UlZheHV4ZjRvb2JwbFdsSG5EWmMvWEJ2VzAz?=
 =?utf-8?B?MmNCWCtSMHVWcGtpSFJER25ubTRoSmdiYmh2WFk5c1ZCYndFbkI2NlhTOWNI?=
 =?utf-8?B?ZGp2Nk44YmZnV3FlQk9LRU5rQzVZSHl3MGJ0WHZ6SHo4VVFncGZRVkRQb0tR?=
 =?utf-8?B?MzhsblhEMld3UmlzQ3FhYmpEQmhScXhPYm5ickcxamNpSG9nZzFKWmtoSFhW?=
 =?utf-8?B?ankrVGNTLzQ5MkJFeXAxUHJpV0JtUmkrVlFBbUhFeWJOL3RXOExYZDZQb094?=
 =?utf-8?B?bUtsWlhxRXB5cTNnUU40UnI2SVh6RnltQlJBcVcrTkt3M3VkZWJnL2cwUGR3?=
 =?utf-8?B?Q2wxQ0E1RWExQmJrUTRWdTVLZys0RjVQZEc2OTlGWk5ReDZhTnJmNGthQklK?=
 =?utf-8?B?NWgyd0ZtdkdMSnREaUJvVDI0ZUhFYlh1a2l1TVYvWFZITVdzUzMwYWVaNnIx?=
 =?utf-8?B?Ni9HL1BBRTFtem1aTmc0WW5leHA4bVJQcFVDeFFTTWpSMlJkYU5mNDR1cG1G?=
 =?utf-8?B?bS9xTzFoRnovU2pNVVNtVVU1YzBBU3NtUzhkZWpFcFlxclJVQU92eU9zc0Vo?=
 =?utf-8?B?Si9PajZySjZHbW1UUUt6alFVN09NRktrZmxadTFIT013M24vVlhHV3RwWGZG?=
 =?utf-8?B?d1NIVWViRVU2OUhaRjFSRHAxNTc1M3FzWTVJYUpKRTF0RFdlN05EOVgwaFpI?=
 =?utf-8?B?OGxGOVg2VTRiMmNPa1ZzeDQxcXhLREkwRS9oTmdWeUQwYktCd2piNFhKMDBs?=
 =?utf-8?B?L2t4V0dJWnJkMCtYcUljOGpRSXJOd1V5Skd2MUJOMFVqbjAzUlB6aXhtYm1W?=
 =?utf-8?B?UHJ4TUJabWQ1aGsxL2tjb3E0WmJnTHU5dUNFTjBIOHRSR0N3ZTlabXBjWkJw?=
 =?utf-8?B?NEM5MXRpWmZlYmZWN2dLeis5N3hSSXQzKzdIUlRmdG9pT3RWSUo0QkpCYW9a?=
 =?utf-8?B?MzlhMk13VnR2bnJaZmlYZFEwd3hWUGt1YkFXeTZ5bEpuckRXN0pOL2txcEEr?=
 =?utf-8?B?bElCeGZiYk15ZHQ4eWh2TktxUy96eTlrcnBKWjA0UXJyRDhTaXZEelNxUjJF?=
 =?utf-8?B?TFpqWVZ0UVhYaWoySEFCYVNPTVNsbFFMUUlnQWYwUnNRS0toWk43UjVHUUJi?=
 =?utf-8?B?VGJCaVpUZTJTc2h1Zm5qb0czOUV0RGQ0WWNWSzlMYkpDL1lxa3FrcHdrUVAr?=
 =?utf-8?B?NzBnSlB1Z1FlaXdxL3pkTnBrMytVNFBhalI4MmkrTXo1RzRjbUhNcXVqLzNN?=
 =?utf-8?B?N3NmS2Zrb0kyNVl4eS9VaE1Ddyt3eG1NZzMvVDNFZ3JqbGthbW8zdXhDSUZ2?=
 =?utf-8?B?eDNEQzhPU3prRWFmSnZhYWh1cDNla3N6U0lVSkxBT2QvZW5sOEswYzdnYUZl?=
 =?utf-8?B?ZFZZZ3B1ZFBoQllEOENtZ2tUemhoUW5aSnE0Z0hHcVJmVWhaais4LzlzZ2RN?=
 =?utf-8?B?aXY0NDg2dG9lcUxXdTVXWXJRc1UxM3pzdGNPRGNIOTZqSDk0eWQrQUFvNUtI?=
 =?utf-8?B?eGl5cGVvdlJaSjNTOWFoSWhFVFlUQ1YwS0oxeWlrL3MwNko2N010Tk9EU0ZU?=
 =?utf-8?Q?a1YiMM+A5iFA/g7dfmAl9zY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF9EC87C9A3F914B94ECED6180C8A87F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ee116b-614b-40b4-0eea-08da9d2e4efc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 06:39:04.5076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2d/1A+l7LVVO/p2MxK/IWPVU8XfkjrM3NDwVIPITAy2UiPzaYhbjKViPJT8qMvVSHvEfAd5mIamZ3HDBZrtOWpxgL5DCwDH5Ke8EeImNosI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2131
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMDg6MDgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBP
biBjcmVhdGlvbiBhbmQgY2xlYXJpbmcgb2YgYSBwYWdlIHRhYmxlIG1hcHBpbmcsIGluc3RydW1l
bnQgc3VjaCBjYWxscw0KPiBieSBpbnZva2luZyBwYWdlX3RhYmxlX2NoZWNrX3B0ZV9zZXQgYW5k
IHBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyDQo+IHJlc3BlY3RpdmVseS4gVGhlc2UgY2FsbHMg
c2VydmUgYXMgYSBzYW5pdHkgY2hlY2sgYWdhaW5zdCBpbGxlZ2FsDQo+IG1hcHBpbmdzLg0KPiAN
Cj4gRW5hYmxlIEFSQ0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSyBmb3IgYWxsIHBwYzY0LCBh
bmQgMzItYml0DQo+IHBsYXRmb3JtcyBpbXBsZW1lbnRpbmcgQm9vazNTLg0KPiANCj4gQ2hhbmdl
IHB1ZF9wZm4gdG8gYmUgYSBydW50aW1lIGJ1ZyByYXRoZXIgdGhhbiBhIGJ1aWxkIGJ1ZyBhcyBp
dCBpcw0KPiBjb25zdW1lZCBieSBwYWdlX3RhYmxlX2NoZWNrX3B1ZF97Y2xlYXIsc2V0fSB3aGlj
aCBhcmUgbm90IGNhbGxlZC4NCj4gDQo+IFNlZSBhbHNvOg0KPiANCj4gcmlzY3Ygc3VwcG9ydCBp
biBjb21taXQgM2ZlZTIyOWE4ZWI5ICgicmlzY3YvbW06IGVuYWJsZQ0KPiBBUkNIX1NVUFBPUlRT
X1BBR0VfVEFCTEVfQ0hFQ0siKQ0KPiBhcm02NCBpbiBjb21taXQgNDJiMjU0NzEzN2Y1ICgiYXJt
NjQvbW06IGVuYWJsZQ0KPiBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0siKQ0KPiB4ODZf
NjQgaW4gY29tbWl0IGQyODNkNDIyYzZjNCAoIng4NjogbW06IGFkZCB4ODZfNjQgc3VwcG9ydCBm
b3IgcGFnZSB0YWJsZQ0KPiBjaGVjayIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1
cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+IFYyOiBVcGRhdGUgc3BhY2luZyBh
bmQgdHlwZXMgYXNzaWduZWQgdG8gcHRlX3VwZGF0ZSBjYWxscyA+IC0tLQ0KDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3BndGFibGUuaCBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oDQo+IGluZGV4IDkwOTFlNDkw
NGE2Yi4uNDViYTM2ZDk2OGFhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vbm9oYXNoLzMyL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
bm9oYXNoLzMyL3BndGFibGUuaA0KPiBAQCAtMTY2LDYgKzE2Niw3IEBAIHZvaWQgdW5tYXBfa2Vy
bmVsX3BhZ2UodW5zaWduZWQgbG9uZyB2YSk7DQo+ICAgI2RlZmluZSBfUEFHRV9DSEdfTUFTSwko
UFRFX1JQTl9NQVNLIHwgX1BBR0VfRElSVFkgfCBfUEFHRV9BQ0NFU1NFRCB8IF9QQUdFX1NQRUNJ
QUwpDQo+ICAgDQo+ICAgI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4gKyNpbmNsdWRlIDxsaW51eC9w
YWdlX3RhYmxlX2NoZWNrLmg+DQo+ICAgDQo+ICAgI2RlZmluZSBwdGVfY2xlYXIobW0sIGFkZHIs
IHB0ZXApIFwNCj4gICAJZG8geyBwdGVfdXBkYXRlKG1tLCBhZGRyLCBwdGVwLCB+MCwgMCwgMCk7
IH0gd2hpbGUgKDApDQo+IEBAIC0zMDUsNyArMzA2LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IF9f
cHRlcF90ZXN0X2FuZF9jbGVhcl95b3VuZyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gICBzdGF0
aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyBhZGRyLA0KPiAgIAkJCQkgICAgICAgcHRlX3QgKnB0ZXApDQo+ICAgew0K
PiAtCXJldHVybiBfX3B0ZShwdGVfdXBkYXRlKG1tLCBhZGRyLCBwdGVwLCB+MCwgMCwgMCkpOw0K
PiArCXVuc2lnbmVkIGxvbmcgb2xkID0gcHRlX3VwZGF0ZShtbSwgYWRkciwgcHRlcCwgfjAsIDAs
IDApOw0KDQpZb3UgbWlzc2VkIHRoYXQgb25lLCBzaG91bGQgYmUgcHRlX3QgdG8gYXZvaWQgdHdp
Y2UgX19wdGUob2xkKQ0KDQo+ICsNCj4gKwlwYWdlX3RhYmxlX2NoZWNrX3B0ZV9jbGVhcihtbSwg
YWRkciwgX19wdGUob2xkKSk7DQo+ICsNCj4gKwlyZXR1cm4gX19wdGUob2xkKTsNCj4gICB9DQo+
ICAgDQo+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQX1NFVF9XUlBST1RFQ1Q=
