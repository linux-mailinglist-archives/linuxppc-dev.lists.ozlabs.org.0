Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2C6A27C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 08:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNzGb1jDsz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 18:41:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3JFtgAPH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::607; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3JFtgAPH;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNzFY3Gqtz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 18:40:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6/uxScIy02poTKbOERuNPAygvhVG9eVndJfIPoeY+NbGIkOqyPGeJEGQW7bxFibQyUTa9klneNH/X8yJRZwC+OYLY4ZIdM4cmY16bLlnNcmBlQ05PX/8yXu75twRVHRk/96KV9ZGAvcsrpB7MPRUderNp8gigYAZD1IcAveHjeHOLT46rElBnoxPcgJmU1jdOFUdPyaMsiHCk0BJHKyqJG49C9EaBrcCDbqTfcQaCilMp1kA7TSk9OHjilQCbbfvnsD5U7/mvwpDQ0GVU+hL8R02T9g9y5YLG+u5FmFaFZ0YtpS7A2IxuSFrZGSd5VKOznZFD03HJeDapsmYx6cEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbLHsgjcJG0YRZ5rZQIiV21tgd5oBfyRPrXwetik9aA=;
 b=lOf1CD+D1XpgBRA/yUVKj8hj+r9Kp1MnpoB6v318UiYsTmZ8iwo+Uun5gerrNm1Ps8bTVVBUUKGs8wSbhxTe33prNLhGJI/pFiknT3wZjWy8YAlWYM1mqlhrlFXsffHM0BesmBAsobtXB4OG0bEg1fVSLApFZTO2x44UhA/vpHwPNf5qYHvREvGlnzWxj3u3YAF4lHNtXqUKeWt/wjMw80WFmEtUNCGMP0e7lXo2jo7vK58XDUQwQdBcuu4r3yyQG0qA/+EG/X9ovBCoFylpxDa1zHQkW49vqk4ukGNBBG2RtlZQqTy+GAwQBqDScpfjNT1oVLc6Q8fkgkRl9txiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbLHsgjcJG0YRZ5rZQIiV21tgd5oBfyRPrXwetik9aA=;
 b=3JFtgAPHeehnxyqQVpCDMtSfdsPn2ewvvrkOGxQmuYkYyqc8JspmF6FG+h8qwTwmbqpl4StBF5n5XgmYK1DZMl7ZjvKGRT3FIrHfdrTohHL5yOM+Uto4nH5NFLLYaAIY24HNklun25LkSGTIXrN+7nSR5BtrQg/XhO/qCbqRG1dxTyZ8BdSS5SXGHq0bTIpeo59h7vzy51JjmmD/oc+1uOaF961xQZ1XodqgIlvqXot9x6U2ALon4Gt79geRzX7w6kdPNB6dn9Jqok6qXsZl8yI8M2VbcRq4olN41tUIf2nTpBM+JzFvTtndkYl6CMN7oOf16ZudeotkbCz4QfHdWw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2311.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Sat, 25 Feb
 2023 07:40:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6134.025; Sat, 25 Feb 2023
 07:40:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Index: AQHZRSlRQroQjo8Bc0a1UitSGMqXAa7fTnCA
Date: Sat, 25 Feb 2023 07:40:08 +0000
Message-ID: <211175b3-bae9-4f66-8532-fe48c6421180@csgroup.eu>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2311:EE_
x-ms-office365-filtering-correlation-id: a8b879c7-03a9-4e58-7bdc-08db170384c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ft/zto8FzUKYTplT7RsEUpbGamzAVZgXCcEf1A/dzkn6wMLps0Vf0J2vw/CCDWPIYOHeLvWSkmfzF13OIXhtSx4T9eZiE9EUnqGB0zMHRD5ecRBM0iinYD/orQ8gIL9dAJJ2FtxdSC9Zcyv84NgooLBZyT+A/zRBAzJAfFQgZiDNcOfxNspp2lTLe3IzngfIta615vnfDqvY6gfarIqOAt8fyg3jESx7huoGzXJUONdsG7qP1C+/JYYkUxFL+H8jERMGsQ4ek6o0wgFaaYpVa+qfznc5PrMkuTk++JAHADbhCXg5Y7On+AUSc/7svZih8QYT3IUDDrKl76P+B8SgCxkxG/v0PwdZMiarqGittimkK1nB85x7n6ECiz8JMfv3K6wI93zCMKmjcbZx/rv5kyWfEbaLsWKLvx6hk1CgQ6GtXziaSLbOalU7P4brHuE8g0Wt+lz2TCi1uZ1Iqooo/jpSdIG6k80vlrX4GX5Jd4qIXCrq1ghAM6d1BOskkhq8fo2TQhq51hy0usvRjGG/fXmeOiv7Ov0VZeiD7bQxM99uiruA1hCB3KulKwo6A5pYCpZztXR2lkSh32xULfsIM+7gc/v3gYQNbfspHqa3GX0NvcKIbwo0Ft3/ZfwCjCQc6VNVxTAqHlBtYhmvOlTt3B/IG/j1t4H8lbj0H7U/WyGSjAyMynnUjHMBbcJTt16xBfBOkUGnzfQR+92M2VrI/Y9W3E62vXHbcfx+ns3rpnVint+BSkpXVahHX3baMBWZ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(376002)(346002)(136003)(366004)(396003)(451199018)(8936002)(5660300002)(91956017)(44832011)(2906002)(66946007)(66556008)(76116006)(66476007)(64756008)(66446008)(31686004)(8676002)(4326008)(316002)(110136005)(54906003)(966005)(6486002)(478600001)(71200400001)(86362001)(122000001)(31696002)(41300700001)(186003)(38070700005)(6512007)(26005)(6506007)(38100700002)(36756003)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OExFek40Q1B3Ymg0VUI0KzFqQU1rWHJqSHdBMThGbEtBMVZPNzQxK25DVTNH?=
 =?utf-8?B?bnN0d0tCZXdhYi9NSXorUDljSXY1U3ZBcXFHc0VzSlZjVUh3MXczZGJndGw5?=
 =?utf-8?B?YzV3eXVCaFRyeFRyQ0R2RldPN0UwbGh4YnJjS3dLR0xyTktBY3RhM2E3SzB2?=
 =?utf-8?B?MGdQaE0vYmx4OWV5NXR6NGRhdmZ4WEQ1R0pFVnhZVXdJYWxLaDdtWVZ1NTJS?=
 =?utf-8?B?UndHTWRRaHBMRjBNR2N4S3lCQjYxU2ZuZ2JGSzBUeUtJYy9MYU5pd1gwUktl?=
 =?utf-8?B?SmdPZWVhYTB4Z1VSYW10aXJIYlR3cDZtTDRhZTYrTlNqM0FuaHVDTGNBQmxP?=
 =?utf-8?B?OGZGRXUxa2E3REZTQTcxN1BzZmxNcHBsc0crMEttbmZvYXpqOGxWQUpDbTh1?=
 =?utf-8?B?Y0M5RUhkUTNCMGFIb1hsbDhqa2lnTkVtV3Mvb2YxQTAzaGJ1S0JpT3Jmb2lB?=
 =?utf-8?B?VUVSMlhlY2tlTzBEZm1XaXIwS2M1a1JkL3hScWMvRC9iR3h3czdLUUt6M3o0?=
 =?utf-8?B?OEU4RXBTWWR1Ym5FWDJEOEVwci8xc3FQVE5palQzZkkxME9OVStNeFNraUNT?=
 =?utf-8?B?NmVmQ25venprNmdnSUNqNmQybGVGbmx4UlpYNkF0Q0cwM0s2UnMreitqMWRG?=
 =?utf-8?B?VVZJOURyajRWNUNvanBiZHFaR2JEb3pkOFJNUys1bVI4UzdVVXpxdCsya0M1?=
 =?utf-8?B?SnVEYXNOYzNBeTFQWlBsOWxCZDBPelNiSWpLNmNTMHRvL1luemtHZGVTc2N0?=
 =?utf-8?B?YXNGMVU4WTkrUFdndGhwWGo0WDhIdC9xbXovS1cxb0ZZcHNiTE9QNVBQMWd0?=
 =?utf-8?B?eGtTOG41QWNhUWEyQXVJQzNnWVE3TER3aWFvWGpaa2lwb2llTlNKOWdFdDFB?=
 =?utf-8?B?bXIvRGpEaytENlRrR2FGeUtGRFAwZkZ5TVpJbkdRSzRNYzlib2NlUE9DZVAr?=
 =?utf-8?B?L1BSOGJ0SEN4VGZwYUViZGc5VDZYVmxuRzVQWnV0Vnd4Qm1NWTdCSUlMSGpI?=
 =?utf-8?B?NXpYd0ovUGpQVFloU0dwWnBSMXZVbVpTcktFekozSythSEJXbk5lWitFZlhU?=
 =?utf-8?B?T3Y1dmh4WnRMQVJRdk9FUlpzQm1wL255VFlOQUNncldKU0VqTitQVEtkZXpm?=
 =?utf-8?B?Wk9yRWxYYXprMDk3ekE0ZzRKUnU2M1ltc0t5a0ZhNlI1VldCUU9VWWtCWnJZ?=
 =?utf-8?B?dFhJQ1NLbU1DUk56RnpGSlpZZjdJWnJXcXhGNTZkSjVNY3hBU0JodHd4VEtR?=
 =?utf-8?B?K3BVR2JEMXd1RjRXNXZJMUVrNjNJeExPVHFaZTFlZzRLSXlQNVV3dkx2Y2hV?=
 =?utf-8?B?Z3lkM2JZdXZkVlc0QlpTcXlGTm5BcWxnaDZuU1EvRjkzcXJnUWpUaGtWdGl6?=
 =?utf-8?B?REZuSlVtZDRpUXU1Wkx5RTJvT0pvRWNyZUROQ0dPOGFGanNhOFJGTnN3WVZ6?=
 =?utf-8?B?SWpkam9lNmFQNlUzbHl3cm9DTm9uV3RYTWJza3BNOUxVeHRmTEd4UHhHd1dL?=
 =?utf-8?B?NER4Q0JieksrUzhkUDJ1QmVJemZjOVBxei95KzlKeTlDQUdITW1Uc1F6N3JC?=
 =?utf-8?B?RmFsbmFoUUpKSlFTbjA2SkFYZ1UwS3VUWm9YQXFOT0VpY3Z3Wmd0Q1lTcmVB?=
 =?utf-8?B?Z281V2M1YTgyM0Q4djYrZ2FabU9ZSkVyMGd1RWRrNGI5dS9lQXhoeFNoaENK?=
 =?utf-8?B?SHNkZHhpTlprUC80UlRGbmU0VzlleGZNa3llTTlWc2g4cjNESko5TTNjZ1M2?=
 =?utf-8?B?bVJSdEl0cXNzZGJPVVB6czdISDRrbmI5Y3R2Q1U5Zi8zbUtFWkh1dzhrS3VE?=
 =?utf-8?B?TkFqa2FBN3dBRlo3WHpHcVgyMXlienpubVYyU1F5RzJ4WFFBcnlUQjEvc0Yz?=
 =?utf-8?B?V1RWSFltbmFpSVFWeGpDQmlzY0hYMFdkaHQxNFFYaXAyN1lYOUdEOHJ2WGIv?=
 =?utf-8?B?d1BwQ1VzeGg5SEx6ajdSdlJRSmVDMGR4RzhIRGx4T0ZzVXdiNGZzUVJObmdN?=
 =?utf-8?B?M2FsWnpBY3A0TTFrdS9jL2cwMEk4UnJsblR2TlhIb0pNNDNYWW8zNkcwUzdo?=
 =?utf-8?B?dkYxS2JmcEFMTDdsM0FsRXVXaFNEQ2tIeW10eU5SeWZmZkQ0ZnRuVGNDVjhT?=
 =?utf-8?B?cnpZMHFqSXgzTzhkVXhJNnVyZU1ZMlpOQm1sYmxGVk9RNGIybUdTOXc4Qy8x?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EAD99E9FE30304988D96951CB08C41C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b879c7-03a9-4e58-7bdc-08db170384c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2023 07:40:08.2621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2c9R4TXD1WQ7Qty7GXBIiv2eolhdarqej7i66XB996n+GccGSjy2SrWC05nM7a36leOgIuANO50oFUWSFLN02zHqcPC5I83YfrszELgNAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2311
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
Cc: Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzAyLzIwMjMgw6AgMTI6NTksIFBhdWwgR29ydG1ha2VyIGEgw6ljcml0wqA6DQo+
IFtUaGlzIFJGQyBpcyBwcm9wb3NlZCBmb3IgdjYuNCBhbmQgaGVuY2UgaXMgYmFzZWQgb2ZmIGxp
bnV4LW5leHQuXQ0KPiANCj4gVGhpcyBzZXJpZXMgcmVtb3ZlcyBzdXBwb3J0IGZvciBmb3VyIGUz
MDAgKE1QQzgzeHgpIEZyZWVzY2FsZSBwcm9jZXNzb3INCj4gZmFtaWx5IGV2YWx1YXRpb24gYm9h
cmRzIHRoYXQgd2VyZSBhZGRlZCB0byB0aGUga2VybmVsIGluIHRoZSAyMDA2IGVyYS4NCj4gDQo+
IFRoZXNlIGJvYXJkcyB3ZXJlIGFsbCBvZiBhIHZlcnkgc2ltaWxhciBmb3JtIGZhY3RvciwgYSBs
YXJnaXNoIFBDSSBvciBQQ0ktWA0KPiBjYXJkIHRoYXQgY291bGQgYWxzbyBiZSB1c2VkIHN0YW5k
YWxvbmUgd2l0aCBhbiBleHRlcm5hbCBwb3dlciBicmljaywgYW5kDQo+IGFsbCBzaGFyZWQgdGhl
IE1vZHVsYXIgRGV2ZWxvcG1lbnQgU3lzdGVtIChNRFMpIGRlc2lnbmF0aW9uLg0KPiANCj4gVGhl
c2UgcGxhdGZvcm1zIHdlcmUgbWFkZSBpbiBsaW1pdGVkIHF1YW50aXR5IGFuZCB3ZXJlIGdlbmVy
YWxseSBkZXNpZ25lZA0KPiB0byBnZXQgZWFybHkgc2lsaWNvbiBpbnRvIHRoZSBoYW5kcyBvZiBP
RU1zIHdobyB3b3VsZCBsYXRlciBkZXZlbG9wIHRoZWlyDQo+IG93biBib2FyZHMvcGxhdGZvcm1z
LiAgQXMgc3VjaCwgYXZhaWxhYmlsaXR5IHdhcyBsaW1pdGVkIHRvIHRob3NlIHdobyB3b3VsZA0K
PiBiZSB3b3JraW5nIG9uIGJvYXJkcyBhbmQvb3IgQlNQIHN1cHBvcnQuDQo+IA0KPiBNYW55IGVh
cmx5IHJldmlzaW9uIE1EUyBwbGF0Zm9ybXMgdXNlZCBhIG1lY2hhbmljYWwgY2xhbXBpbmcgc3lz
dGVtIHRvIGhvbGQNCj4gdGhlIEJHQSBDUFUgaW4gcGxhY2UgdG8gZmFjaWxpdGF0ZSBDUFUgdXBk
YXRlcyAtLSBzb21ldGhpbmcgbm90IG5vcm1hbGx5DQo+IHBvc3NpYmxlIGZvciBhIHNvbGRlcmVk
IGRvd24gQkdBIGluIGEgQ09UUyBzeXN0ZW0uDQo+IA0KPiBUaGUgcG9pbnQgb2YgdGhlc2UgZGV0
YWlscyBpcyB0byBnaXZlIGNvbnRleHQgdGhhdCByZWZsZWN0cyB0aGF0IHRoZXNlIGZvdXINCj4g
Ym9hcmRzIHdlcmUgbWFkZSBpbiBsaW1pdGVkIHF1YW50aXRpZXMsIHdlcmUgbm90IGluIGEgZm9y
bSBmYWN0b3IgdGhhdCBpcw0KPiByZWFsbHkgImhvYmJ5aXN0IiBmcmllbmRseSBhbmQgaGVuY2Ug
bWFrZSBzZW5zZSBmb3IgcmVtb3ZhbCAxNyB5ZWFycyBsYXRlci4NCj4gDQo+IEhlcmUsIHdlIHJl
bW92ZSB0aGUgTVBDODU0OEUtTURTWzFdLCB0aGUgTVBDODM2MEUtTURTWzJdLCB0aGUNCj4gTVBD
ODM3eEUtTURTWzNdLCBhbmQgdGhlIE1QQzgzMngtTURTWzRdIGJvYXJkIHN1cHBvcnQgZnJvbSB0
aGUga2VybmVsLg0KPiANCj4gVGhlcmUgd2lsbCBzdGlsbCBleGlzdCBzZXZlcmFsIGUzMDAgRnJl
ZXNjYWxlIFJlZmVyZW5jZSBEZXNpZ24gU3lzdGVtIChSRFMpDQo+IGJvYXJkc1s1XSBhbmQgbWlu
aS1JVFggYm9hcmRzWzZdIHdpdGggc3VwcG9ydCBpbiB0aGUga2VybmVsLiAgV2hpbGUgdGhlc2UN
Cj4gd2VyZSBtb3JlIG9mIGEgQ09UUyAicmVhZHkgdG8gZGVwbG95IiBkZXNpZ24gbW9yZSBzdWl0
ZWQgdG8gaG9iYnlpc3RzLCBpdA0KPiBwcm9iYWJseSBtYWtlcyBzZW5zZSB0byBjb25zaWRlciBy
ZW1vdmluZyB0aGVzZSBhcyB3ZWxsLCBiYXNlZCBvbiBhZ2UuDQoNClRob3NlIGJvYXJkcyBhcmUg
c3RpbGwgYmVpbmcgc29sZCwgc2VlIA0KaHR0cHM6Ly93d3cuY29tcG9uZW50cy1zdG9yZS5mci9w
cm9kdWN0L05YUC1TZW1pY29uZHVjdG9ycy1GcmVlc2NhbGUvTVBDODMyM0UtUkRCLmh0bWwgDQp0
aGV5IGhhdmUgNDYwMCBwaWVjZXMgaW4gc3RvY2suDQoNCkNocmlzdG9waGUNCg==
