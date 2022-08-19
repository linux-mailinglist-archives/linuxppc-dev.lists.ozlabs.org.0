Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5F599546
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 08:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8BXt2S98z3dtN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:23:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RdQCO3Ml;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.78; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RdQCO3Ml;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120078.outbound.protection.outlook.com [40.107.12.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8BX42vnNz3c9P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 16:23:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQzfG1ZgfrtwD8xHhis6U6uwKdtAk4lRSZ6FWJHOkXw3ruWdepqb6lq+ACY+rGV8lCbzN8UNffT6XZYJqlaAJ1OkVN0+Sy/obwMGbVL5jI8XsIh1d379qk/u3Q9g+Mq/ter4PBTHa3vcHbP79/2zw/EEl6E4tMPm56gcoPEsKRxDT2457aI5111yiXp6rbeRi0qN7rt62tQ+miT3FOvBROC5T1EorlB22pRwl5iL9uX2dYugVhjFlEdmIO8pCGJX8bk78c1N82qMeuJv2q2hY/cJjLRIRTxL2VoZtXrO68VQmLpr3ae+BirLta7TPMj7LUvbVnGfpYg37EseXiWWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czQdspmo/R22TYBHHajqRNJzzWhkUpvKo0o/F+BavFQ=;
 b=GLntYvQPh9hZYYQBaaHkIazvPlyS0Gi42qNHrLx81oXa+I1rQxXfQyXJ1QH/rpUOxXJiP82nswC9J5t29PW+yt4l0XWjxcHLgOaM3Tn5thSTNPsBBtwwn3iB4XxDx815vFzcs38ZSbR26w+K5oBlwS6RIJHAIut3MLkDyXYyBFdRZOwkZjmNOo6raHXrPWP7X2maLmwb4X5vGUOLeGE7ZlT/SabiEIjL7lbWPILuxnKB2Dot9fkBY2NsLNv+cIm4GE6RPR5eumDY2evSZcMPwIDQ0EkWqFKhnmwnCRG5dp09SUbGUJjlaZIwahdhjE/BlnbjmWFFMAQT/weieskovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czQdspmo/R22TYBHHajqRNJzzWhkUpvKo0o/F+BavFQ=;
 b=RdQCO3Mlui9DAyUU/RpAkwgak5poTL/xfd/2slE5JuLlxtx2e4C6Thy5/UkMsec9owa2xDUhxwzDCbnQEcKZO6spkHycKT7vzAmZhRUWe27shCqMf/TKm2SfrohdvPp5tuqm147kalV+LFjBoiI3PTEWZ6hiWQFOWBawrQMuOvUiBK3o04YsPbRmzLzXO1jTfb0Elf065aF8ay+1QMmLT9m2cBi9V08ibQl+xMGCG6S+x1w3YhkpcHjKpF+vvYl65Z5muyhhVYGSpYNC6s3Hy20I+fCTKGXdRhbNd/ya1umsnXtuQ8QwwyBA4rYFmzpJfI0oK1a+epHUtUKgSBjfvw==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR1P264MB3832.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:253::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Fri, 19 Aug 2022 06:22:55 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fdc6:a1de:d9e8:cb45]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fdc6:a1de:d9e8:cb45%3]) with mapi id 15.20.5546.016; Fri, 19 Aug 2022
 06:22:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, Segher Boessenkool
	<segher@kernel.crashing.org>
Subject: Re: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Thread-Topic: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Thread-Index: AQHYn/BJNn0ehsxpLkmDJS03mwTPka2p6dIAgAAHhYCAAAI1gIAFQDmAgAa0loA=
Date: Fri, 19 Aug 2022 06:22:55 +0000
Message-ID: <627ae8be-28c5-4c1c-36a7-62ac67145461@csgroup.eu>
References: <20220725063111.120926-1-rmclure@linux.ibm.com>
 <20220811151302.GF25951@gate.crashing.org>
 <cd3f5a35-dfda-ef2e-dd13-93d5c4011f16@csgroup.eu>
 <20220811154751.GG25951@gate.crashing.org>
 <D85E8A64-456B-4334-9C97-29A56936E22A@linux.ibm.com>
In-Reply-To: <D85E8A64-456B-4334-9C97-29A56936E22A@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de78776c-29db-4f54-95ac-08da81ab4105
x-ms-traffictypediagnostic: PR1P264MB3832:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HLyV2slmhefPCf/2/HtW8vCakPril/t9G2mMPvMxYwKDrxk0QTgo/bZatlMhd5YWTSijPUpLF8zE4CPeUewBGGCq7mRU9ITKEc2CnPeIyum+s9yDnFXthfJx48/3U1hVx7zXiCGjBGni0dP3taf4WZt8YDQjkUce4pvRIZvQ7DolDAMAbfLwXD3rmdOKCgrhU9Nb3DhXB92f9eXx1ZMpmOrZ1SCfOzfru2n419g4WiIt0I8D4Nh7bQ8nbD4WvQUBeb8bj+YArYywfhzOyJCfaYYs6ydyUmARsBlrUTH6jcYeS6pdVV5yKJI7RtyqKp1j1yVPfxLdfeg4Q2ojuybG5YooWQ1SsYERaPqP+LOmClL9RhMt/JhVVwWRYMVnDpT3pRcOljDOykQoJajxZIWkaHeTGKhWfqf+rfhVkeqEjzvKjgi9DFvkcDu20O0PDAQhtzItIXOhnWimF6PD8HjauJUwwmpjs8xInF7fNV3+L0n3w5/27nAGe5DKR/5WDPynaKptGCXJbGxSlLO+3AvLm/8iIslTnpD/zQk/sZgnifkx1xESvUkBm/koccU8OBc8Bpj6Vam4Y/nz/EjQbJfATEnCUJxD4opoqZnpG3Hu8elnYYUz+xayWyI/xmrMFt1sUYl34KfIDz85QA1DEQoJFWvCM8cBwi8uXshbwI0TPrARzR0L8KZia4FGtZPejCiBtI3oHM/yGO9uLnXWyyxne2PvW38Mkh8MNVVlIEl15dWoXchYC9AvdeMG5p4VIAdWexVcVCtLMs078dMeeS5kRtrMkFLzgh5QU+oukBQKWznhaIqOnyjpCzf+mtoD9lZrAvxEBO42MKIzvG4Z4y3EEQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39850400004)(346002)(366004)(4326008)(8676002)(66556008)(64756008)(66446008)(44832011)(66946007)(110136005)(316002)(54906003)(66476007)(36756003)(8936002)(4744005)(5660300002)(2906002)(6486002)(71200400001)(478600001)(41300700001)(6506007)(26005)(6512007)(2616005)(122000001)(86362001)(31696002)(38070700005)(83380400001)(76116006)(38100700002)(91956017)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akdtbVJYVGZIT2hDdkkrQXVpeDFXRUplWDYwSWVOZG5VcjZ2WjkvM2p4V1dP?=
 =?utf-8?B?N3V1Z3dKNGFjQUlDbkpRc1VyRDNrQkU5c1p1ZXRka05Ja3h6TVFySHN4a1kx?=
 =?utf-8?B?WTVCbTNvQW0rcGlyLzQwTFpOWFh2am1QbzIzYzROeFNjbUF4TU5Ud2IvRjJi?=
 =?utf-8?B?MnM2NXc4dmhJcTJsd3dzdGh5Y2J5Z3orbXBZVUNCMjU0KzBjLys3RWRQeVVn?=
 =?utf-8?B?dUZzdGVxRFZzeEZMbWhjNElwS3h1d2dJcWdUeUlBeXg3TjNpWm1RcHJDQUxy?=
 =?utf-8?B?aVFTeFVUbHpjZ2doL004VmJqaDNDRDhoa3RTSS81Wm1FaldGOU9uVFVQTTFh?=
 =?utf-8?B?aUd4czMrR3piUXB5TFFreTVuRHVyUFNZdjNuN0ZyTXYxRmpRQzBNWkpNWmF2?=
 =?utf-8?B?cjdFcnJzY3hlTGR3YkljWHk0b3F5c0huK1BCYk1FcmZhaUw1WUY3RHNiQVlr?=
 =?utf-8?B?OXNKMVUrZGxYbnhNTDJ1VEhIU0VvSCtUdEhQN0dCNTZaQnpWMnIxa3lBNzM5?=
 =?utf-8?B?QndJOUV5ejVBSVYyZlpyK2NlajJtZ0NrUUVWM2t2NGU4LzQ0WGZMN2JuYndY?=
 =?utf-8?B?WUtINGx1ZVEzVXI0Z0JHT2IzT01pOWVsdDk3cmNFemV4aWpQc2pIbnRYU2RR?=
 =?utf-8?B?Qllwdy95bS9WaFZQVXlIaml2Vy9QYXVyQnJ1TzVnVzhGVy9IamlCQStSS1lP?=
 =?utf-8?B?aDZqcGliNVN5a24xMmxPbXRtQTdZSEY5UmpBLzVJdmNrMHI0d2sybEFEcmtV?=
 =?utf-8?B?QlVXdTJGRTVEQi8yeEwxYjJiQ0s5azI0M05GWGtXZXl2eHRrQ2dIaXFsSkR3?=
 =?utf-8?B?SjlUYnlGaTIvQm11NlZuc1AySU5KcnFMZWZBTnh3ZHhJT2YyNmRSVlhUdVdX?=
 =?utf-8?B?QjdIeUtkaTh0ZnZSdjhSM01lNG91cHFlVk44K0FFQUtTK0VPOVI1N2pIM3BH?=
 =?utf-8?B?WC9ZWUFyQXRJRmIrY1Z5eVNFbkk2cnB4aUo5cVo3YkkwTkgyWHc2VXQrUUtT?=
 =?utf-8?B?TTJ3NVg5UmxXTThVNG0ydzRnS1JmL0s2cjBCMnRVbTJRSTJoVkxNSHZiMUJR?=
 =?utf-8?B?M2p6ajJ2aUpDTlhUaEtSZ3dsY1lON0pNdUJkYUZvTXJQeldUcVdpcm1wdDZG?=
 =?utf-8?B?WmRrSjlYbUxNdUw5Q2YwR243bXdDZkREVUNKWDF5bkJiN3BYUS95a0NvdTlw?=
 =?utf-8?B?TUtBU2tWV0phL0N0bzVyYlZvbUtPNFdOSGJSbmRvZnZjWE8rZllkdTVBdGV0?=
 =?utf-8?B?OVVSTk56SWJSYXJIbi9vLzdSTzhKbmlXNm9sZ0R1eFBRWXJhbjZxOWtwVWQ3?=
 =?utf-8?B?Njg3alFaSGJsd1JUZWkvVGQvUGpxWjkrRGxBU1BhMUVianhKRytSK2tUQUJn?=
 =?utf-8?B?NGlPVmpZWHlpUVRuNjI1ZWQwV29KUTNzTVhuUzhIcjlmRlNvQnh5bzN4SmFv?=
 =?utf-8?B?anoxMzgrMFhKRUV2T1M1N3hZNVZoN1N2QmQreFMyUTRlS0hGOXNIakxRSUIw?=
 =?utf-8?B?RUZVbytEWVRwbkFXcElMUFJlZ05VcGh5TTE2emJKcDNuRTViMHNUVjI2UWRZ?=
 =?utf-8?B?dENDOEh2bUt5TXM4cjZ3SUxtaC9tMndQRStFMFFSdmhPSU1wYUtnZG1QUTNK?=
 =?utf-8?B?QTRhZUNQY0MyWVJzY3IwNTN0Q0l5dFBPTlRqcXBnekxQWm1MYUwrWEN3T0xo?=
 =?utf-8?B?dEJRQi94elRBSVRjQ0VwMHcwM0l5NHZHc1AwN1dqSXRIK0t5aDArVW1ja0NG?=
 =?utf-8?B?VWg3eldLZ1NZQ0pVcU45ajVhZ0U4bllnbDlLUTA5b3RQNDBmOW5hSHlqdWJK?=
 =?utf-8?B?NDNHeWZubSt6eU5uTG5FYU9Gd0VlOU1SSzBrR3M0eGtOandCNlFESzBJbm5C?=
 =?utf-8?B?VkJVYWNreUJMTzRXazYzQ0ZsWHNpejdPWlZiczgxN1RjRUZBbVJUQ2U3bUdz?=
 =?utf-8?B?K1lGRWIyRlFmM1Z0NjdTWHZ3UmhjaXc5YlZlemsxWGY0TXhhandsUjlSQWF0?=
 =?utf-8?B?NGFZS09sWkcyRFVUcklQUDNaYVJDOFhQMWVtTlBuamtmOGoyYXdubnIzQndH?=
 =?utf-8?B?NWpXOWRDY21JUmt6NWtvZS85Sk01aytPNHdwVU5TOFBkOGd4YkUxUTdPU3Yx?=
 =?utf-8?B?NTVYdmczeDFBRW5GUkZSMk9wL1JzT2hvTGdKMkdtdVFsTlpCMlNxeGFyRzdo?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EB5538852026D4588A1CF6AD8DB46EE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de78776c-29db-4f54-95ac-08da81ab4105
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 06:22:55.6154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClOwpU7VZJkbm2xTA5h8agM9WfJhA4sc/sgtfvtfKZN6v/J88maJR/Ytit0GLBJ5SR3kruqxwStwcu0kADgpobB8Ef1q4aPluSsAYGXrSIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3832
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA4LzIwMjIgw6AgMDE6NTksIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPj4+
PiAiTnVsbGlmeSIgbWVhbnMgImludmFsaWRhdGUiLCB3aGljaCBpcyBub3Qgd2hhdCB0aGlzIGRv
ZXMgb3IgaXMgZm9yIDotKA0KPj4+DQo+Pj4gV291bGQgIlplcm9pc2UiIGJlIG1vcmUgYXBwcm9w
cmlhdGUgPw0KPj4NCj4+IFRoYXQgaXMgcHJvYmFibHkgYSBnb29kIGNvbXByb21pc2UsIHllcy4g
IEl0IG9idmlvdXNseSBpcyBhIHZlcmIsIGl0cw0KPj4gbWVhbmluZyBpcyBjbGVhciBhbmQgdW5h
bWlndW91cywgYW5kIHRoZXJlIGlzIHByZWNlZGVudCBmb3IgaXQgZXZlbiA6LSkNCj4gDQo+IFpl
cm9pc2UgaXQgaXMuIFRoZSDigJh6ZXJvaXpl4oCZIHNwZWxsaW5nIGV4aXN0cyBhbHJlYWR5IGlu
IHRoZSBrZXJuZWwgc28gSeKAmWxsIHVzZSB0aGF0Lg0KDQpJIGhhdmUgc29tZSBwcmVmZXJlbmNl
IGZvciBCcml0aXNoIHNwZWxsaW5nIG92ZXIgQW1lcmljYW4gc3BlbGxpbmcsIGJ1dCANCm5ldmVy
IG1pbmQuDQoNCkNocmlzdG9waGU=
