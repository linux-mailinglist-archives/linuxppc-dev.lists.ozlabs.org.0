Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D34D6D46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 08:46:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFvxz54vnz30DF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 18:46:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFvxT11FKz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 18:46:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WadHGoX0/8t9CoFAuUVypXq+LJ8qs0HklWlmKWN/dm1jaBJH0tiLQHjk3klbpuvlRs85EQ+hZK+o66FuFHBbIZFFXfvPyckOMJ6aTPLUH/Fvtsgit6DRn6uCLR02aDdtLWO7dYmAXh5nX1jNLVutBN1ejwWqcYsQaCz3h8Mqf2PZlHVLjLL+IbNgg9F6Vh+HqkfyRyq7rV+u8w9bijXgrBoTFvf25hk7wR7K6MPW3U+dSStJg7zQNVfkv7hpJJvQWt5rEegv+1qodhapcjoe9HU+Zz3O3oD9tuG+207qM+vWDa9XOlqAVt59fQxCY6fbj1E86oQX1cqOXyLweDpjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryT8psBwowkluT5kP9iB1fuxItAz4t90/7sO6r/15YQ=;
 b=LtyFDF76qdxf9n31Lli6Oiyevs/kUKUHsDaazHqhWYYbwAu7jDggntXNW7ZguntPqei7+UhEZ2Udxpw09qTgpZ5a8SLepNCmK922pQrGQIXLyYrR8SOtZlGaQ3IJtkv/Ekdul9brs2XzRCfCBV6uTTavCcKN211XEpjFMIYAoIC2OvQHvXFYJOH/90+2jAT+L/aEKaTQg8iNvr7pG+lsptWfyKxs3obzJuicyGTBn8UC3/qVWSA3glkzuqgEvCBBG0usFsOxp/5Te8TBh5ykxtDR1AYbj7rTsX/coBjuV7Zd9mFY3GiGXRdT4r5LltEkyIJFy+CBEtY6BrWypvUKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB4141.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:118::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Sat, 12 Mar
 2022 07:45:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%5]) with mapi id 15.20.5061.025; Sat, 12 Mar 2022
 07:45:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Libre-Soc
 General Development <libre-soc-dev@lists.libre-soc.org>, openpower-hdl-cores
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>
Subject: Re: microwatt booting linux-5.7 under verilator
Thread-Topic: microwatt booting linux-5.7 under verilator
Thread-Index: AQHYAFOY3vo/wgZN5k+kvamc60gdnqy7ybWA
Date: Sat, 12 Mar 2022 07:45:43 +0000
Message-ID: <1dc3831b-9eef-2781-6359-e35239921140@csgroup.eu>
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
In-Reply-To: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a49fd40b-692c-4285-bb14-08da03fc4ff8
x-ms-traffictypediagnostic: PAYP264MB4141:EE_
x-microsoft-antispam-prvs: <PAYP264MB4141BC712A1634B0D0B30D73ED0D9@PAYP264MB4141.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TFXCpwpXQVlA34R/q+YDfFOyK8WF+AzEY4OLUAyGaAgMXePq+tZ610LRJ3Pi8KDuvlnGgslYgafh9ppBpHoiyD3WwX50uvx4Uny8zneeQ4Yur4whmFl/SFLesYjPn83tk6035yCRngPhKnDNBEu1ZYEh1Ml9sJoBDmVlXyp/NJvcBYOKocaE76sYWwz1vWcS23QpqwjIaJm9HGKXJHJAJwant77krbUvKNNmXXmt3POPDiHqqekU0y0HKkDFJLx36/HJuesjI08YBA3nSV7s6Ew6DeoPAQUxQiSixxnkcTe08iAtJTK5PHaeP3adVEybt04nW89ZHQ6XBT2lLoa9LuIPjw2pN9YJhjz+I8PCzKGwh8M7u1c2dk2on1e329dytmmdHbBlipW1W0LKtyN6avBWJntUnsxv5nRqCDIGI1gsX9m1HOxVU4bLJQQRX1EARxEp7fe/yacQL3meQmbFFL7Ym0G421krIgVcpnOJzqh/nE7FvzkEKAmdSCR/2h4g/qYteFyi01RShDOwK8kdiZsmsWwX41aw4TRIELUA31djlK9kbl3Ot4/6cnw7nC/K3AQpnfQavcoiMqLFM7dQojGMUkCknDJkbDRGAd4u9/VKDBhGL3yMyDhUcYcC2hXXwa5dGuOdIv5EOQJjhZrCfD/UjFdt6qqpfcBxGM+5yIgkY+eAJRf6wP8O4ULIfbLOWF03MbKOW+bsf8ctVdSv7l7Nn3P58ECTBAKCiclmTyhk8vH6VRGvUPtEXG1WMTLCFXT93WSwUvPRDOPApp3FAU9VtgeH0NXHYhHa4B/OOx85sth2wEBK6ffE0qYtjanJvux0TijpaJI1mmJd/M+ynLc143ntV1Z7IAMXHCBZbMc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(83380400001)(186003)(26005)(122000001)(2616005)(38100700002)(31696002)(38070700005)(86362001)(31686004)(110136005)(8936002)(44832011)(316002)(5660300002)(64756008)(76116006)(66446008)(66476007)(2906002)(66946007)(91956017)(8676002)(71200400001)(66556008)(36756003)(6506007)(6512007)(508600001)(6486002)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2hwZjkydVNUTXlDOWUwOFVuZHhrV0RMMWYyU3VxM25oL1krZ2dQeWdIK0th?=
 =?utf-8?B?SzdBelJFMkt0NVFMclFhWEthUld6a0hUNXhuQmx5UjJYUHllcllpSE4rQnhi?=
 =?utf-8?B?TDJVclR2Slc0Rzg3ZmR5dzdFTUNDRm13cHRtV1JCcy9sQXc5NklZM3p0ZWtM?=
 =?utf-8?B?M1p1UjZFRFJ1dTlZcmJUS01kaERWWG1aczdqaU9BQ0ppeUtMREdPY0dmejZj?=
 =?utf-8?B?dG43emc1M3RNVnZuUk1VRERzeFVLNk03VDZyZzYxeUxrUngvMnJOQ1JkNjBQ?=
 =?utf-8?B?N0NqdW4rWEdmb3p3TkxVMWhBQnBnUHpjaElkR3RsUFdLV3YvUm01VUZ4NmpV?=
 =?utf-8?B?anMvSDJ3d3ErUVBjdE1oNVNQVklBWHNXdnlnbElsWDhXbXFBUkVCdGsxaHFE?=
 =?utf-8?B?djNBd084VUJxNlVSOEMvdWhxRk13eFNpemJ3b0ZQQzlyNlE4a2EyeXg3WVAy?=
 =?utf-8?B?TFFzQURWYkZmWnlvMUZwaWltUUgrUzRvOWMwdHRxVTVla1VkV1RSL0hReWh5?=
 =?utf-8?B?d2ZVSkd1WGNvcmU1UDZUaFpxbTQwdFJIbGgxcFhQVXdxNncyUk9wTXJTb1hH?=
 =?utf-8?B?WkhVcjBhd2R4amwxL3hvT0ZaVytMdWh1Mk1Cb050cmw5Z0NpNUVBa1ZFM3B4?=
 =?utf-8?B?a0tTZDYwdFlEeHRwN3N0OG02RHEwbC9Mb1V6N0hiN1NKWXNMMGJpK25FT1Fy?=
 =?utf-8?B?ditNb0VZTGk1ZUZEeWF3VE5uUVBaczU1czBORUtBN0I4UUcxNk5VVzhnMW82?=
 =?utf-8?B?MXV4YktoWWdITHpRZzNDekFEcDU1dlVMMHhoeHZOdFNqYVh0OTBKaFRtbC9R?=
 =?utf-8?B?ODhmVnp6b3pWSlVUNjlpOXlxZVhCbVYzUVhKa1RUT2hvQ1ErekhjVTE5dk9K?=
 =?utf-8?B?Mzd2MmhRL3lYZzlheFI2MGZOUnMrN01OR25NUTJCWEZIZHdGWjZNUHEzaTUy?=
 =?utf-8?B?Q3pTZmRtdkJUbk94MnpWTC9PMXRMRW1VOUVkeVE0OWtkNDE1U0FianNxaG80?=
 =?utf-8?B?KzQwdjBienUzbmZLeDZTNGY5WWxRQmMxbnhhUnRYajRheW5JcldXV1RTRVIr?=
 =?utf-8?B?TzdHQW12TTh0NGs2N0tUaGpNalZHQllpSm9NY3plNE9FNHJ3dHc5UWNNYm1x?=
 =?utf-8?B?amtDN3FRek84N3RnN1Y0SzRBOSs3UG9ZcWdCYWErL2pOVkkybE5tSW9RYzgr?=
 =?utf-8?B?cVUzNU1JdHJRWGVNVHhiT25DYWRIa3V0eFhMZERrM2phbkM2Y2w3STR0Zlpn?=
 =?utf-8?B?VmVYMVdlUEFpTzRrVk55RzRoSTlSQXl1ZDZTc3BUSmJ1dllJZTBVLzZFTGxr?=
 =?utf-8?B?SGQ0UndBc214ZjhQWWNJa2ViK0hLMHlOSUNJSGpvdmdUZkdSckoyYW9qaFJi?=
 =?utf-8?B?YWFlbkdRRjdqakpCU25JczR1U2VVUi9VMHBDZmVaSjBQQmpMc0VaZ1JUd3ZO?=
 =?utf-8?B?SURFSlJFbmMzQXpkZFV4UGx5WW51eWdrSW9CMzVzaEFhNDdVdklNS2s4cFVx?=
 =?utf-8?B?bkp5eGwza0tiMkI0Q09BM2IxRUcyNlpyKzF2MzBYaCtGeDFSa0JwVDZDeWlM?=
 =?utf-8?B?VThxZEVPVmxpOEJ2Y29lbFFyY21NaGdtZ1ZWTHR0ODBPb0NtTjFoZ2ZTa3dZ?=
 =?utf-8?B?RktTUHE2UXRTWmVOdS9NbEdnWFhNWEM0dUE1U2JKeUdzTGVzcnAvOE9jV081?=
 =?utf-8?B?S1NoTE1UMkJhMmFOaGMvd1BaT09adExKNERjL29MTU45NzA3TFdMblRIRHQ5?=
 =?utf-8?B?a25SUVJHQ0o3Q1FKU1NCbzB0Zk5MK3IxK29EYzMrNHZyQWNHdHJ4WHJPSUpB?=
 =?utf-8?B?eWNWd1RBMVdpa1k5MWVYL3pvalpiV2tldG9WNmRzdFovMVpYb1BNdi96Y2p4?=
 =?utf-8?B?WWpPZnViN29FbGdTRTFVM21hMTF2Zm5IYXVPQXN2dXhuWVdYczN0QUJUSzFW?=
 =?utf-8?B?NHQyYXFrRC9sMEkyelBma3lBeG80YWlLTmF3T0RLWFlvSEMvdkh0bDhPM2cx?=
 =?utf-8?Q?PiwLyPybSI/EWzgIVHeVTdAG9C9WJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A06AEC9ACEA1B641A20C3F3CB793149F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a49fd40b-692c-4285-bb14-08da03fc4ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2022 07:45:43.3907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fKb73FB2dW+vPk48/yKnriSmwT5MCARsiA1IW7d5qBKIqCT2pBjKNJnkVK87RWAnaLRWqnoyrAzqOY/hCAzatZn7rBGwcXxkwL6qGpsq3Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4141
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzAxLzIwMjIgw6AgMDE6NDUsIEx1a2UgS2VubmV0aCBDYXNzb24gTGVpZ2h0b24g
YSDDqWNyaXTCoDoNCj4gaSBhbSBwbGVhc2VkIHRvIGJlIGFibGUgdG8gYW5ub3VuY2UgdGhlIHN1
Y2Nlc3NmdWwgYm9vdGluZyBvZiBtaWNyb3dhdHQtNS43DQo+IGxpbnV4IGJ1aWxkcm9vdC4uLiB1
bmRlciBhIHZlcmlpbGF0b3Igc2ltdWxhdGlvbiBvZiB0aGUgbWljcm93YXR0IFZIREwuDQo+IGZy
b20gYSBoYXJkd2FyZSBkZXZlbG9wbWVudCBhbmQgcmVzZWFyY2ggcGVyc3BlY3RpdmUgdGhpcyBp
cyBoaWdobHkNCj4gc2lnbmlmaWNhbnQgYmVjYXVzZSB1bmxpa2UgdGhlIEZQR0EgYm9vdCB3aGlj
aCB3YXMgcHJldmlvdXNseSByZXBvcnRlZCwNCj4gaHR0cHM6Ly9zaGVua2kuZ2l0aHViLmlvL2Jv
b3QtbGludXgtb24tbWljcm93YXR0Lw0KPiBmdWxsIG1lbW9yeSByZWFkL3dyaXRlIHNub29waW5n
IGFuZCBmdWxsIFNpZ25hbCB0cmFjaW5nIChndGt3YXZlKSBpcyBwb3NzaWJsZS4NCj4gDQo+IGh0
dHBzOi8vZnRwLmxpYnJlLXNvYy5vcmcvbWljcm93YXR0LWxpbnV4LTUuNy12ZXJpbGF0b3ItYm9v
dC1idWlsZHJvb3QudHh0DQo+IA0KPiB0aGUgYnJhbmNoIG9mIG1pY3Jvd2F0dCBIREwgd2hpY2gg
aXMgYmVpbmcgdXNlZCBpcyBoZXJlDQo+IGh0dHBzOi8vZ2l0LmxpYnJlLXNvYy5vcmcvP3A9bWlj
cm93YXR0LmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy92ZXJpbGF0b3JfdHJhY2UNCj4gDQo+
IHNvbWUgbWlub3Igc3RyYXRlZ2ljIGNoYW5nZXMgdG8gbWljcm93YXR0IEhETCB3ZXJlIHJlcXVp
cmVkLCBpbmNsdWRpbmcNCj4gYWRkaW5nIGEgbmV3IFNZU0NPTiBwYXJhbWV0ZXIgdG8gc3BlY2lm
eSBhIEJSQU0gY2hhaW4tYm9vdCBhZGRyZXNzLA0KPiBhbmQgYWxzbyBpdCB3YXMgbmVjZXNzYXJ5
IHRvIHR1cm4gc2RyYW1faW5pdCBpbnRvIGEgc3RhbmQtYWxvbmUgIm1pbmktQklPUyINCj4gd2hp
Y2ggcGVyZm9ybWVkIHRoZSByb2xlIG9mIGVhcmx5LWluaXRpYWxpc2luZyB0aGUgMTY1NTAgdWFy
dCBmb2xsb3dlZCBieQ0KPiBjaGFpbi1sb2FkaW5nIHRvIHRoZSBCUkFNIGNoYWluLWJvb3QgbWVt
b3J5IGxvY2F0aW9uLCBhdCB3aGljaCB0aGUgbGludXgNCj4gNS43IGR0YkltYWdlLm1pY3Jvd2F0
dCBoYWQgYmVlbiBsb2FkZWQgKDB4NjAwMDAwKS4NCj4gDQo+IG1pY3Jvd2F0dC12ZXJpbGF0b3Iu
Y3BwIGl0c2VsZiBuZWVkZWQgc29tZSBjaGFuZ2VzIHRvIGFkZCBzdXBwb3J0IGZvcg0KPiBlbXVs
YXRpb24gaW4gYysrIG9mIDUxMiBtYnl0ZSBvZiAiQmxvY2siIFJBTS4gIHRoZSBpbnRlcmZhY2Ug
Zm9yIEJSQU0NCj4gKGFrYSBTUkFNKSB3YXMgZmFyIHNpbXBsZXIgdGhhbiBhdHRlbXB0aW5nIHRv
IGVtdWxhdGUgRFJBTSwgYW5kDQo+IGFsc28gbWVhbnQgdGhhdCBtdWNoIG9mIHRoZSBtaW5pLUJJ
T1MgY291bGQgYmUgZW50aXJlbHkgY3V0Lg0KPiANCj4gaSBhbHNvIGhhZCB0byAgZnVydGhlciBt
b2RpZnkgbWljcm93YXR0LXZlcmlsYXRvci5jcHAgdG8gYWxsb3cgaXQgdG8gbG9hZA0KPiBmcm9t
IGZpbGVzIGRpcmVjdGx5IGludG8gbWVtb3J5LCBhdCBydW4tdGltZS4gIHRoaXMgbWVhbnMgaXQg
aXMgcG9zc2libGUNCj4gdG8gZXhlY3V0ZSBoZWxsb193b3JsZC5iaW4sIHplcGh5ci5iaW4sIG1p
Y3JvcHl0aG9uLmJpbiwgZHRiSW1hZ2UtbWljcm93YXR0DQo+IGFsbCB3aXRob3V0IHJlY29tcGls
aW5nIHRoZSB2ZXJpbGF0b3IgYmluYXJ5Lg0KPiANCj4gKG5vdCB0aGF0IHlvdSB3YW50IHRvIHRy
eSBjb21waWxpbmcgYSA2IE1CIGJpbmFyeSBpbnRvIFZIREwgbGlrZSBpIGRpZDoNCj4gaXQgcmVz
dWx0ZWQgaW4gdGhlIGNyZWF0aW9uIG9mIGEgNTEyIE1CIHZlcmlsb2cgZmlsZSB3aGljaCwgYXQg
NjAgR0IgcmVzaWRlbnQNCj4gUkFNIGJ5IHZlcmlsYXRvciBhdHRlbXB0aW5nIHRvIGNvbXBpbGUg
dGhhdCB0byBjKyssIGkgZGVjaWRlZCB0aGF0IG1heXl5YmUNCj4gZG9pbmcgdGhhdCBhdCBydW50
aW1lIHdhcyBhIGJldHRlciBhcHByb2FjaD8pDQo+IA0KPiBpIGFsc28gaGFkIHRvIGZpeCBhIGNv
dXBsZSBvZiB0aGluZ3MgaW4gdGhlIGxpbnV4IGtlcm5lbCBzb3VyY2UNCj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvam9lbC9taWNyb3dhdHQuZ2l0DQo+
IA0KPiBmaXJzdCBhdHRlbXB0cyB0byBib290IGEgY29tcHJlc3NlZCBpbWFnZSB3ZXJlIHF1aXRl
IGhpbGFyaW91czogYQ0KPiBxdWljayBiYWNrLW9mLXRoZS1lbnZlbG9wZSBjYWxjdWxhdGlvbiBi
eSBleGFtaW5pbmcgdGhlIHJhdGUgYXQgd2hpY2gNCj4gTEQvU1RzIHdlcmUgYmVpbmcgZ2VuZXJh
dGVkIHNob3dlZCB0aGF0IHRoZSBHWklQIGRlY29tcHJlc3Npb24NCj4gd291bGQgY29tcGxldGUg
bWF5YmUgc29tZSB0aW1lIGluIGFib3V0IDEgaG91ciBvZiByZWFsLXdvcmxkIHRpbWUuDQo+IHRo
aXMgbGVkIG1lIHRvIGFkZCBzdXBwb3J0IGZvciBDT05GSUdfS0VSTkVMX1VOQ09NUFJFU1NFRA0K
PiBhbmQgY3V0IHRoYXQgdGltZSBlbnRpcmVseSwgaGVuY2Ugd2h5IHlvdSBjYW4gc2VlIHRoaXMg
aW4gdGhlIGNvbnNvbGUgbG9nOg0KPiANCj4gICAgICAweDViMGUxMCBieXRlcyBvZiB1bmNvbXBy
ZXNzZWQgZGF0YSBjb3BpZWQNCj4gDQo+IHNlY29uZGx5LCB0aGUgbWljcm93YXR0IE1ha2VmaWxl
IGFzc3VtZXMgdGhhdCB2ZXJpbGF0b3IgY2xvY2sgcmF0ZQ0KPiBydW5zIGF0IDUwIG1oeiwgd2hl
cmUgdGhlIG1pY3Jvd2F0dC5kdHMgZmlsZSBzYXlzIDEwMCBtaHogZm9yIGJvdGgNCj4gdGhlIFVB
UlQgY2xvY2sgYXMgd2VsbCBhcyB0aGUgc3lzdGVtIGNsb2NrLiAgaXQgd291bGQgYmUgcmVhbGx5
IG5pY2UNCj4gdG8gaGF2ZSBtaWNyb3dhdHQtbGludXggcmVhZCB0aGUgU1lTQ09OIHBhcmFtZXRl
ciBmb3IgdGhlDQo+IGNsb2NrIHJhdGUsIGFuZCBmb3IgdGhhdCB0byBiZSBkeW5hbWljYWxseSBp
bnNlcnRlZCBpbnRvIHRoZSBkdGIuDQo+IGhvd2V2ZXIgaW4gdGhlIGludGVyaW0sIHRoZSBhdHRh
Y2hlZCBwYXRjaCBzdWZmaWNlcyBieSBtYW51YWxseQ0KPiBhbHRlcmluZyB0aGUgY2xvY2sgaW4g
bWljcm93YXR0LmR0cyB0byBtYXRjaCB0aGF0IG9mIHRoZSBTWVNDT04NCj4gcGFyYW1ldGVyLg0K
DQpJJ20gbm90IHN1cmUgd2hldGhlciB5b3UgZXhwZWN0IHRoaXMgYXR0YWNoZWQgcGF0Y2ggdG8g
bWUgbWVyZ2VkIGluIA0KbWFpbmxpbmUuIElmIHNvLCBjb3VsZCB5b3UgcmUtc3VibWl0IGFzIGEg
cHJvcGVyIHBhdGNoID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQo=
