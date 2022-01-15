Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C186F48F65A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 11:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbYzF4QScz3bcB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 21:18:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbYym2lhJz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 21:18:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTW+/BEZCCfZobfO74x9cRe37LC8UxvGqi7yGyuCwvpAzKHmM9nNx67mBX4eLXtHlEUN2nLLdzUN/AYgMo4cH+TnNuuyhi8QGkGMiRpysq/10W7BtXKATDmQozgez9os992DQbI8U0l6oEkOKSHwzGyVevLAzrJ7ODduHQWbs4tsr+y03PeCctrlYKpbWI9HPYO7DExPbtdBnOd+Bobxnt7RIKUxgIbhqmQxABTxx3FsB8xFO2WBqXu7amI6bE36bhHo9icVvYHjf/68d2dq+By9NpTf5g5Ov9iIQw3Az5CYL7wdISXmsc4h/wNHmNPHX5DXfLi6gVOpAd44I1ahTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHBI4ddhLliZ4XFL0dIoN4ypaINtiNxAUY//1uAG8gA=;
 b=a5ViAz6FrxebxHkhmTedC6A0PGQt8ww2e9bMWoKaXqxHVHV8GzlutI7bGd9ewBGlWWxtIjoYi6/jTuJJizLz2gFWH4NJhFYtVNYcPzsGdrS4Zk+7hBGKl9mwUzsamGOMPTpWVcLdM/J4KzvhRvW8iRIxPSl0csl6mNVYEW7btRvt533ZNQFejjpRUr3M166M/lMAm10NvDZ5MleWwlMH32cBVxGqPPWRWUo5POQYpZ/xynoujvfrXaf+6RdyZSB2ezYCosqSpRjylMf997M+tqpqCSn+6wkv5/KHiVJksm+LTWurU15RsvHsqfDshOyhcac9O1X8EwhGEeWUqatKPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2568.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Sat, 15 Jan
 2022 10:17:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.013; Sat, 15 Jan 2022
 10:17:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen
 <dave.hansen@intel.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Topic: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Index: AQHX+zD/hWUWAcg7A0O0lNZsb1MJ4KxGfioAgAGXoTCAATqiAIAaq3mA
Date: Sat, 15 Jan 2022 10:17:48 +0000
Message-ID: <a4f4c4d7-4f53-d0fd-9db3-0e67335428a6@csgroup.eu>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
 <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
 <6cd5deb3-b71d-1058-f992-1c2f93c16ea4@huawei.com>
In-Reply-To: <6cd5deb3-b71d-1058-f992-1c2f93c16ea4@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 086d0934-1737-4e8a-c08d-08d9d81047a4
x-ms-traffictypediagnostic: PR0P264MB2568:EE_
x-microsoft-antispam-prvs: <PR0P264MB2568F270C73CE7DE78FD1417ED559@PR0P264MB2568.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q09mfmJPhZNLiLRN9AQbUtAkF5UC8FmI/vZoWnh39lXDfeyckUiyCw2WTdEgaVqr29NwUF1fZJg4IsTl2FCYx5SC/nRE5/5UhJsYLbvqVJO1LItrRp9K/snyKxg2lUpPXZin5zHluXIgBdP2MKsw2cuHbXomsgv3hsH7B3xRFemCWHXpxCyLPxpcMU5Vpm2GWS2kJJDMeez9gmA1r7Uag9n7O9420/mighgdGmbZiyZDZB/ijAdzocwVXzS5B+dQn5D21zQzHapDaOelIFnFKLuu1pn9uS/TLBcYkY4MQYOqJIReIJ4V9ZZ91FI2WZW1YDRtUTRnXqdB94/Qf7QpYoWU5ZgS+exk4r5ScGkezGdozlk6tsq97DEGcQM+W34Eplzjlfmc6dxRjrvOxbIRdUkEotg2ItdiT3OQxpxxUhPyKiMbrCAUXJrJOks6NzD0M1LR8c+sjtuUphEbnuyNpMJocGrz7O4LS/F8eFjAQgfDTIgWpyVv1jEjIHty2iiEJ+nRjkPPMJY4O50vdu3XBKEwWry3QDuMUeLKqCM35UcgeUODhZXJjY66iGXQhlETPdaf0j7H0UcfhCVIsK7HkjbzYpIgsfoU4Hrzh0Tz70MWQmm1A9T5i63z3Hid4DPMNHUoMXxo/WiQCI/xbkPKMaP61cM6qHU9b6hv5yBj0rzGgM7e+kFDBfeT0zjoaL/1EMkBkyCuuUQ0F0Cu565UF/G6e8Co6Nxs+UR4fBGARTasdOp5a7QbqPcbY9w6v3cVvEZVmDHLDnWs5OfG6t9PImggyw+e7HMceDKcEBGGBysPdpw8kfhgkbRypj7UpOut
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(71200400001)(38070700005)(5660300002)(54906003)(122000001)(91956017)(76116006)(8936002)(26005)(6486002)(31696002)(186003)(6506007)(38100700002)(6512007)(66946007)(64756008)(66446008)(66556008)(66476007)(110136005)(31686004)(86362001)(44832011)(2616005)(4326008)(66574015)(921005)(36756003)(2906002)(53546011)(8676002)(508600001)(7416002)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFphQWhnTXNGZW9rbEsyOWZlVWZMejExYWkzT0JtR2tReXN1OWRqWGNDbEJt?=
 =?utf-8?B?eTZ0VTF2b0p6MVhtTXR4TjMzanpZTTdwZy9nZEpSSkNrdGVkcFNrVFhlYk1o?=
 =?utf-8?B?N0swbngyTFVlUWlUU2gwU3VYa0N0ZTlzazB0Y1FJbmlxaHk5WGNTTDZZTFYz?=
 =?utf-8?B?dHpyWHp0cVZLdTlKU2tiNEord0s3aXJKWHMwTUowVk5md3FCUFJDWCtWbzBo?=
 =?utf-8?B?WmZQR01CMVNaWEpnU0xESythWTZTbmRnOGVNL0ptV3owSTJBRVhhUG5lV1NH?=
 =?utf-8?B?QTJPYXJOSzlZYVlSV2dhUTZ5YW5vaVZuQm16dWpZZm9lblA5VHZlN05yVy9C?=
 =?utf-8?B?Q1JYeTB4by92UC90eEQxWks0MWdMK3AzS0hJL0ErTnptRlRaZ1QvZDdwT0tx?=
 =?utf-8?B?OC9GU1BjNTZ2YlhrTThlQytSczVrK3ZNZ0lsdVNzc2IwdmsvN0N4K055SzI3?=
 =?utf-8?B?dm5ZK0w4WVpWN3pSVEE4Q2s1WmVqZHc0UEdwZ0t5ODVzclNJMFh3Z1EwdWhV?=
 =?utf-8?B?VnNNbGVEUWFneTZvT2YyVkZYNnhWeFJMS0U5Wnl2L2hmZlpzOVVEcTFpbzFV?=
 =?utf-8?B?ZE0xL0IwTFcxdTFNU1Z5N3hHNzBuTUJBbXFpbFRQTkpGRnVpSHVJeDVlMXhJ?=
 =?utf-8?B?aG5VOGlJcDBKN0VpUHFOZ2lCU0NkVThtdVNGb0NjdlNxb0I3QWwvQWJJL0VU?=
 =?utf-8?B?V0VpNnRMQnRwd3EvTmdtVjJWV0VOVFprTXpMcmRRQ3d4aTFlY3FuS2xuek9q?=
 =?utf-8?B?bW94Qkc1MmVHNVlKSlVxQ3pnUEFhV3ZBYkFiYm5ER1JzbmZHVFlNdUlkRGdu?=
 =?utf-8?B?V2JsQ3lNWm1aRzBta0NvdnhSWUU3cTRRNXdZN09sNUlYR1VBU3pwZ3pSRi9H?=
 =?utf-8?B?VUk2dTVLT1VZOGg1YzlwZ2l2em1jM29PQzJ1YWtDdDZac0M2UXo0MW4yT0tX?=
 =?utf-8?B?a2ZQUG5ybHZJc2p0WUxxWkZKN0NpQUpsWS9KVWhpdGpET3NEQnlDc1FKTzhs?=
 =?utf-8?B?UzJGT0pjZ1ZCVEVadDc0ek1URFB0ZW9aYXl4Z0g1YXpGS3lvVnFtU1JndTZE?=
 =?utf-8?B?WHMyTWRHWGlENEVoUm5UOGxDK1N0WUJ5OWMrMjBiMTJHQks2eXhZWEpTQzFp?=
 =?utf-8?B?NnFwQlk5Q1FqWGlVMVNSdWJ0OTFkN0szQ1VDazVUK1V0MnQzQ0lsVUUxT1dx?=
 =?utf-8?B?eURuY2ovc0wxWlRXUE1QUlpFbURZd1BnUGI1UHRsZ3Fodk53VFV1VW9sc0Z4?=
 =?utf-8?B?MU9XdCtaN2t1ZDE4VWoyOC93KzJLdHhXbllnVlJMaDMwaHlRdE0zelNsOGpP?=
 =?utf-8?B?c0VGZWp2bmtUUVU5WWR6MHQybm05TGtvM1dvbjJYU0xET2dRdTdEdkhJbkth?=
 =?utf-8?B?V3J2UEp4a0NpS0hWSUxSQm5HWU9hdW5heG9ocXFUVVlKQTdKaWxiakRLYzUv?=
 =?utf-8?B?OWEwQ0lWMUMrVHU0T3BSUTNIcksxTUIrTm9WSWNPY0hkTXFIOUo1ekJyRUxC?=
 =?utf-8?B?cmlzZnN2Tm5Kak51SytHbFFGUE1XSjJtcTVtUG5ySzVSQXhqZ29abFROS0Zp?=
 =?utf-8?B?WnRwMGdhVmtobmxtUjEzZnc0NEJ0cWh1RXNJTW5wYWpLWDBtTG5NM3lWMjMw?=
 =?utf-8?B?OHgraDB0MnMxaVFGaGxGYy81SHpCYWV4TFRUeFhsZHQ0aFErN2tvRU5TSm00?=
 =?utf-8?B?WWhuNzZ2T3p0QVJEdzFnN0ljdzhIOWlSM0o2SDZaTTRFWC9DNGljSjcwQ2tt?=
 =?utf-8?B?ZGVhbVpvUXZuMFhiY1UrNmFiSUFJbU1tZWNtWlFoa2hnaE5kY1hmT3E0a0c4?=
 =?utf-8?B?enVtMkpyYVFxeGZsSXZTUGNSd0Q0cWdzbjlpVTdNOHgwVDNWQStuNVhGR1dT?=
 =?utf-8?B?dnRjY2liQnJKZGs3c05RVW9kUERWcUJGWFNnVnR5b3pwTk45NVVDTThWd29E?=
 =?utf-8?B?U3RwMnBpbzZZVFFMSWw3d01iaitNOUpTQ0ZYYTIxZlFmbHlVMjV4NWtFcUV6?=
 =?utf-8?B?OVVNYWdLQlpkUlZaN2JCWjNIbjdBTXJleW13VXJSWU9FblhzcU1XdWxGbHFt?=
 =?utf-8?B?ZmJWb1JRczBxdUhtemNBQS81RjRQMm1FTVRSL2dvaTQ2b0R0ZWdZZDlFbzlq?=
 =?utf-8?B?Z1NvbHVCR1JSY1U3cW9iMFcrZlo5V1dZYmcwUGhOQ3pwNHQ3RDgyZzhuZExq?=
 =?utf-8?B?aC85ZFJIQ3Y0Mk9Sc2x0MXBmVURxdllsY25LWndrZFByak02Z3YzQmJRM0t5?=
 =?utf-8?Q?9WVbCjufD4jEBqqRnMFy6setaeF9KPieGmkQ6MgOoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC2D0CEDE735394CBEA933E6EB1DE565@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 086d0934-1737-4e8a-c08d-08d9d81047a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 10:17:48.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JT6kOBfplmHXWR3yBH5kJqyVMTgFIEPuzxhZbFAfm76cBO/lF83pZMDNRQvKjotJymsqA1FnzeWLUWUrkjhm853QkRPWAAXA6ek7J4Zv/oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2568
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzEyLzIwMjEgw6AgMTI6MDEsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IA0K
PiBPbiAyMDIxLzEyLzI5IDA6MTQsIERhdmUgSGFuc2VuIHdyb3RlOg0KPj4gT24gMTIvMjgvMjEg
MjoyNiBBTSwgS2VmZW5nIFdhbmcgd3JvdGU6DQo+Pj4+PiBUaGVyZSBhcmUgc29tZSBkaXNhZHZh
bnRhZ2VzIGFib3V0IHRoaXMgZmVhdHVyZVsyXSwgb25lIG9mIHRoZSBtYWluDQo+Pj4+PiBjb25j
ZXJucyBpcyB0aGUgcG9zc2libGUgbWVtb3J5IGZyYWdtZW50YXRpb24vd2FzdGUgaW4gc29tZSBz
Y2VuYXJpb3MsDQo+Pj4+PiBhbHNvIGFyY2hzIG11c3QgZW5zdXJlIHRoYXQgYW55IGFyY2ggc3Bl
Y2lmaWMgdm1hbGxvYyBhbGxvY2F0aW9ucyB0aGF0DQo+Pj4+PiByZXF1aXJlIFBBR0VfU0laRSBt
YXBwaW5ncyhlZywgbW9kdWxlIGFsbG9jIHdpdGggU1RSSUNUX01PRFVMRV9SV1gpDQo+Pj4+PiB1
c2UgdGhlIFZNX05PX0hVR0VfVk1BUCBmbGFnIHRvIGluaGliaXQgbGFyZ2VyIG1hcHBpbmdzLg0K
Pj4+PiBUaGF0IGp1c3Qgc2F5cyB0aGF0IHg4NiAqbmVlZHMqIFBBR0VfU0laRSBhbGxvY2F0aW9u
cy7CoCBCdXQsIHdoYXQNCj4+Pj4gaGFwcGVucyBpZiBWTV9OT19IVUdFX1ZNQVAgaXMgbm90IHBh
c3NlZCAobGlrZSBpdCB3YXMgaW4gdjEpP8KgIFdpbGwgdGhlDQo+Pj4+IHN1YnNlcXVlbnQgcGVy
bWlzc2lvbiBjaGFuZ2VzIGp1c3QgZnJhZ21lbnQgdGhlIDJNIG1hcHBpbmc/DQo+Pj4gWWVzLCB3
aXRob3V0IFZNX05PX0hVR0VfVk1BUCwgaXQgY291bGQgZnJhZ21lbnQgdGhlIDJNIG1hcHBpbmcu
DQo+Pj4NCj4+PiBXaGVuIG1vZHVsZSBhbGxvYyB3aXRoIFNUUklDVF9NT0RVTEVfUldYIG9uIHg4
NiwgaXQgY2FsbHMNCj4+PiBfX2NoYW5nZV9wYWdlX2F0dHIoKQ0KPj4+DQo+Pj4gZnJvbSBzZXRf
bWVtb3J5X3JvL3J3L254IHdoaWNoIHdpbGwgc3BsaXQgbGFyZ2UgcGFnZSwgc28gdGhlcmUgaXMg
bm8NCj4+PiBuZWVkIHRvIG1ha2UNCj4+Pg0KPj4+IG1vZHVsZSBhbGxvYyB3aXRoIEhVR0VfVk1B
TExPQy4NCj4+IFRoaXMgYWxsIHNvdW5kcyB2ZXJ5IGZyYWdpbGUgdG8gbWUuwqAgRXZlcnkgdGlt
ZSBhIG5ldyBhcmNoaXRlY3R1cmUgd291bGQNCj4+IGdldCBhZGRlZCBmb3IgaHVnZSB2bWFsbG9j
KCkgc3VwcG9ydCwgdGhlIGRldmVsb3BlciBuZWVkcyB0byBrbm93IHRvIGdvDQo+PiBmaW5kIHRo
YXQgYXJjaGl0ZWN0dXJlJ3MgbW9kdWxlX2FsbG9jKCkgYW5kIGFkZCB0aGlzIGZsYWcuwqAgVGhl
eSBuZXh0DQo+PiBndXkgaXMgZ29pbmcgdG8gZm9yZ2V0LCBqdXN0IGxpa2UgeW91IGRpZC4NCj4+
DQo+PiBDb25zaWRlcmluZyB0aGF0IHRoaXMgaXMgbm90IGEgaG90IHBhdGgsIGEgd2VhayBmdW5j
dGlvbiB3b3VsZCBiZSBhIG5pY2UNCj4+IGNob2ljZToNCj4+DQo+PiAvKiB2bWFsbG9jKCkgZmxh
Z3MgdXNlZCBmb3IgYWxsIG1vZHVsZSBhbGxvY2F0aW9ucy4gKi8NCj4+IHVuc2lnbmVkIGxvbmcg
X193ZWFrIGFyY2hfbW9kdWxlX3ZtX2ZsYWdzKCkNCj4+IHsNCj4+IMKgwqDCoMKgLyoNCj4+IMKg
wqDCoMKgICogTW9kdWxlcyB1c2UgYSBzaW5nbGUsIGxhcmdlIHZtYWxsb2MoKS7CoCBEaWZmZXJl
bnQNCj4+IMKgwqDCoMKgICogcGVybWlzc2lvbnMgYXJlIGFwcGxpZWQgbGF0ZXIgYW5kIHdpbGwg
ZnJhZ21lbnQNCj4+IMKgwqDCoMKgICogaHVnZSBtYXBwaW5ncy7CoCBBdm9pZCB1c2luZyBodWdl
IHBhZ2VzIGZvciBtb2R1bGVzLg0KPj4gwqDCoMKgwqAgKi8NCj4+IMKgwqDCoMKgcmV0dXJuIFZN
X05PX0hVR0VfVk1BUDsNCj4gDQo+IEZvciB4ODYsIGl0IG9ubHkgZnJhZ21lbnQsIGJ1dCBmb3Ig
YXJtNjQsIGR1ZSB0byBhcHBseV90b19wYWdlX3JhbmdlKCkgaW4NCj4gDQo+IHNldF9tZW1vcnlf
Kiwgd2l0aG91dCB0aGlzIGZsYWcgbWF5YmUgY3Jhc2guIFdoYXRldmVyLCB3ZSBuZWVkIHRoaXMN
Cj4gDQo+IGZsYWcgZm9yIG1vZHVsZS4NCg0KSSBzZWUgbm8gcmVhc29uIHRvIGhhdmUgdGhpcyBm
bGFnIGJ5IGRlZmF1bHQuDQoNCk9ubHkgQVJNIHNob3VsZCBoYXZlIGl0IGlmIG5lY2Vzc2FyeSwg
d2l0aCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkganVzdCANCmxpa2UgcG93ZXJwYy4NCg0KQW5k
IG1heWJlIHRoZSBmbGFnIHNob3VsZCBiZSB0aGVyZSBvbmx5IHdoZW4gU1RSSUNUX01PRFVMRV9S
V1ggaXMgc2VsZWN0ZWQuDQoNCj4gDQo+PiB9DQo+Pg0KPj4gU3RpY2sgdGhhdCBpbiBzb21lIHRo
ZSBjb21tb24gbW9kdWxlIGNvZGUsIG5leHQgdG86DQo+Pg0KPj4+IHZvaWQgKiBfX3dlYWsgbW9k
dWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4+PiB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gX192bWFsbG9jX25vZGVfcmFuZ2Uoc2l6ZSwgMSwgVk1BTExPQ19TVEFSVCwgDQo+
Pj4gVk1BTExPQ19FTkQsDQo+PiAuLi4NCj4+DQo+PiBUaGVuLCBwdXQgYXJjaF9tb2R1bGVfdm1f
ZmxhZ3MoKSBpbiAqYWxsKiBvZiB0aGUgbW9kdWxlX2FsbG9jKCkNCj4+IGltcGxlbWVudGF0aW9u
cywgaW5jbHVkaW5nIHRoZSBnZW5lcmljIG9uZS7CoCBUaGF0IHdheSAoZXZlbiB3aXRoIGEgbmV3
DQo+PiBhcmNoaXRlY3R1cmUpIHdob2V2ZXIgY29waWVzLWFuZC1wYXN0ZXMgdGhlaXIgbW9kdWxl
X2FsbG9jKCkNCj4+IGltcGxlbWVudGF0aW9uIGlzIGxpa2VseSB0byBnZXQgaXQgcmlnaHQuwqAg
VGhlIG5leHQgZ3V5IHdobyBqdXN0IGRvZXMgYQ0KPj4gInNlbGVjdCBIQVZFX0FSQ0hfSFVHRV9W
TUFMTE9DIiB3aWxsIGhvcGVmdWxseSBqdXN0IHdvcmsuDQo+IA0KPiBPS++8jCBMZXQgbWUgY2hl
Y2sgdGhlIFZNX0ZMVVNIX1JFU0VUX1BFUk1TIGFuZCB0cnkgYWJvdXQgdGhpcyB3YXkuDQo+IA0K
PiBUaGFua3MuDQo+IA0KPj4NCj4+IFZNX0ZMVVNIX1JFU0VUX1BFUk1TIGNvdWxkIHByb2JhYmx5
IGJlIGRlYWx0IHdpdGggaW4gdGhlIHNhbWUgd2F5Lg0KPj4gLg==
