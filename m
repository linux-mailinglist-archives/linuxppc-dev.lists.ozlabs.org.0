Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0B5A63B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 14:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH6SC111Cz3c70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 22:43:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dPgRpXoB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.51; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dPgRpXoB;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90051.outbound.protection.outlook.com [40.107.9.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH6RM5YFwz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 22:43:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdCfzUKxA3CVnXHQH08stwX63aIlUowl5Ds71uXjfnP7MyyEuVveHpiRU4HX4b79CGfuSkntnb/YoUw7KTMQm7mW0x8gc6RpT6tioS9Nq0YVJjHqrXGQaJhPFPTRwawCen0Q9v2J8U9hm6URiiSsBDcvMDlyPigui1pufyUma66EqBpDaFGXokcKeaZ1NcPbCYEOmqQ/mHEsY7K1Yb1G+wGjHYUOvHT2a088p2pMBVmtVtz7evtWl5SbYezk4S1r3VWbP1FyrAywRpXTayvFEmW40JUhkwalWotiebcYtXHF5thw9k5jAKVs4XlGoHb9MuMr+SuZKkdpHgyJNp4reQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6VmnaDONRDyzyKFc3Zv17NGV7Ul+HYXmZ0C5LxCfDY=;
 b=nM+vrwaDUU7rqTRSssDz6Ns6rasILeuHeXCw5HNMgYDEeFej/A0dfAKo4Hh2xRlzfrbyd7NuMy7A6fscfH/7gMmcgv1DFDB1apUaWLtbr3ds2fbrrpP6eNZ3Wz7bEXxetoJt48fb5RjulmqJXCHfl94UulyIh2nWPT1w+93mzyRiNuck/SwvQnxfHKPWs5KbPReXMmRzQhvq7TaLNBODhL2xrle+UNa0BRu1CknOBEqm15zSJ8NuftnXJcDDaL96QeR29wsdaY+4h0Ej3pTK6eVZ2OFcwrkxRuqq1HM7myKEjJl81LYPXdCY7ruz7YSySMjZBfpdCDQSMADo3YzvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6VmnaDONRDyzyKFc3Zv17NGV7Ul+HYXmZ0C5LxCfDY=;
 b=dPgRpXoBSm76DVXAvkkkDwNm3jlINRLJbJFWeZzat4GzP/GCH/yvfADBmbQTces46j0wOe6sN3Y3r5TIAsmrhiVdYTAU5CV6s1mjL7epgomzJHbjd9aBI2gOGOJX1C5DuWJbFpLfrIs9BETVcnzRdT9i8j/A+xYklHkIj2xKPqegrEJ3zQZADaTvt/59zsXQZCE4nv+cxzefLh74RrUZmW9kl/biQs7UGqOLNEJUBYzQjWbrtP6sMyOmgTfydm/WV4AJOsacaTNGLBo1kHfVxKwQIBVx7BOZbN8kRO5HMsqNpkSMo5o54klH62nYbfHHhzBGMQcZjdYZ6iWSn/hoew==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB1429.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:18b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 12:42:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 12:42:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 03/16] powerpc: Fix objtool unannotated intra-function
 call warnings
Thread-Topic: [PATCH v2 03/16] powerpc: Fix objtool unannotated intra-function
 call warnings
Thread-Index: AQHYu2uWL25Ba+2cW0iO9XNvE+mJmK3HZS0A
Date: Tue, 30 Aug 2022 12:42:49 +0000
Message-ID: <b6d68580-b4ee-6d4e-0e83-8b7fe6962f01@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-4-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-4-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49233e24-f439-4c09-d7f3-08da8a8525f2
x-ms-traffictypediagnostic: PAZP264MB1429:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fHpp3SBlj/YVw9NWjxxpC8qkMrvcwF3w5+NmG5td9Cc0ZrLRrJh6fvh2XBYBOBdp2XY2/EReTlBgb7SBgx5iS/IZJvxjxL4D+nFi0wRm+/BbBG/BSwfCQepIlPl6zdSBDB1e90YCWfAQufRPxz+EPrOPmxToGwU1borqiHfBWUHA5BwMbgJCTe2Xbi2nBoMTtYKAKJ2fIjQ4z3TYm9CJfeYSI66vw5pu+k0QAdwuMpeUlI3w3cCi8PKgZFzFtICm4TSoD9ZPQdsdcU6a+qHP4+oRgsAtEp3J8UD6F6uFk2faoTTiRU/+nOvWoFi1/VE3BuiQo17b8CmZY6NpfX12OtoF4yrbQNtGWdPDKT5hhy4+egtZxdWVnXcEulNz6itPTBUeFgabCJiWSyAD0e6eKTHP697y1GA8kfbgJ6N/GKenG3/lGfvngkHzU1mgfU/HhuZtcT6hjtSmmr6/LNASg+0/cXBSh6zIAlZJFWbLUnFvJA4zl/7LpD7I6bQREsVffckyevhi8P9QJwpyN1w2NciNA31scK/26lSVGuIK4+iFG7ldZ3lv44BVz0tzdF1ww3SBwlo9PK5RjSlfPz+yDr52tqEEEIk81UihnBC8nW9WE9Nfkar1h9t6vYtQCNKFAzoaPnItKCsG99zeLinEmVZycjg4gOdfIjRQNeI7d/jq/bNLaFue0+tVj7CoBfYuVAl6SdSzmry2ChTCsPxU8iy33FYSs54N9XESFMegvURTiPfVdOQyc/oHc4kbPw0K1tjkpTptLRzGoxlShc0ZB2oSVU1fYjLurAdDUNoHUXqziizNqtwPb/nwNIxy4zP6WyPvPROZ37/J4IBJgzI54w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(91956017)(110136005)(316002)(54906003)(86362001)(4326008)(66556008)(6486002)(31686004)(8676002)(76116006)(31696002)(66946007)(66476007)(64756008)(66446008)(71200400001)(5660300002)(478600001)(36756003)(38070700005)(7416002)(41300700001)(8936002)(44832011)(2616005)(122000001)(6506007)(26005)(2906002)(38100700002)(66574015)(83380400001)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TGQ3aVNZR1BORFlBY1FJZUVEeDNkdHdleHk3ajRFNklZUUNyVHhnVmwvMGZY?=
 =?utf-8?B?WjdyaGppRDE3eVA2Vmg1NlRrYU1RUE5ZTW9ELzVjSWQzZjVjT0lXRzMyWXRs?=
 =?utf-8?B?MTNlbFN6WEUrVWRlMm45WTBEaUlCS0dzUEtmc0daLzgyempxdlFETWhydmhs?=
 =?utf-8?B?M1N1NzA1TzZTaTlwQUpVTmRTWkNYMyszaVJFZjlZOGM1T0tVdlI3N28ySEFM?=
 =?utf-8?B?SFhLMVJWUjBEYmN6cU9qSm9TaFhPRTRZejNwYUwyN3BKNDFIYkZTb3JiSUNF?=
 =?utf-8?B?cmp4b3ZuR0VaY3ZoaUZ2SVpuY2c3Q2JiSUpFNGhiUTFXQ2NyZzdSWDdzMzhP?=
 =?utf-8?B?M3QwVmhlQTVnWXRuTTZOa0JJLytGK1Z6eXFqcitZUTVIazIwdFJDemtoMVVE?=
 =?utf-8?B?VnovOW1RczZjVmtvSERBM1NXeFBQSEdDUE43UlBscmhEalRrTU55dm9tVkdX?=
 =?utf-8?B?QWVHcElETi9JVVA5UGF3SkM4bmhrakR6OE1yanFtRC9HRk1HZFB1NjRvVlpv?=
 =?utf-8?B?Y2JBYjRjRUI4aVkrVGNtbFl5Zi9oRkVwNUxRYi9UNU1zekhSUmNaZm9zT0xR?=
 =?utf-8?B?eXE2WFE1eEJvMlB6bjl3OGIzOUlSbVp2TlhZdk9VcG9WcjB5blQvMnIwMzlG?=
 =?utf-8?B?dHkvUVZ1YXgyc0lFL2UwWEM1THdhS0tWN050UGQ0TzhMVFpHejRzcGNVVWtl?=
 =?utf-8?B?c2w1YjlIU0NtZUhSenU0VjhBaWZVMzJUWFo5dGUxbW9HakJIdzk0aFN6TUtO?=
 =?utf-8?B?cTFPYWJJVE9nQVRIeHorSmY4RURqR3Q0SFVScGQvQ2MwT2xGanYrZ2gwYkhP?=
 =?utf-8?B?ckxvRVNYRy93VHdubE9JUEZOT2xPTmt6Z21kdUp3UGNZY0FMSVJ4NVhSdDd5?=
 =?utf-8?B?NWRuUmVHSTRqbHhPQTJWRi9KYjl2dkk5WXJPNVFSc2Q5M1dzcG1lVTZyenZL?=
 =?utf-8?B?enZhNUlPRjNOYi9ReDVuQUEwZlgveU1GS1Vkc3M2WGNFR2xrRUlHZDlkSWpC?=
 =?utf-8?B?QlVqUUE1NWRVektKcURZbGdQUHI0VTJjcGZTN3NmaEEzaUt0ZUlncUpnandL?=
 =?utf-8?B?cjFacm5UaVBTL3d5cktNaVU0aDhIbFRWWmZzdEo1OG4xSndEajJKNjVlK2k1?=
 =?utf-8?B?cjdzWmlLRDNzK2ZBQmloOWNTUnBwVmd4azdTeisyNTd1OW9xNTg0MWlIV0NE?=
 =?utf-8?B?UXZpTDdTcFJUcmYzMTZFTTl3R0l4T21jdzJ2cXptZ2graHV2a2NIRzhvSnN0?=
 =?utf-8?B?V20xZlpSZWg0OXl5cFpjYm1UTmFFa05yeW1xRnM1V1dXZjZHQm15R0FBeXI1?=
 =?utf-8?B?NHYxWWxUZEFUVUdXRHpGczlSZURpTnVNSnA5R3pDdml2NU1KMldESkpCZFlv?=
 =?utf-8?B?dlk4NzYxY3BjcXIwak55czJhZWxzV1J3b0JqekRscktid3Uva1lTRTcvcjNs?=
 =?utf-8?B?NElFWUlBTzRsc3MvOGU2VU9scXBBY1gvTXQ1bjJNMWtjTFMrc3o2by91OW02?=
 =?utf-8?B?Sk51N0l1enordmJJb0VMYTV4RmVWRE5WMEdvRkNZRVV2K29mMzBoQ2VDbVR6?=
 =?utf-8?B?QXJObW92MlRTMUtNNXFZaWhWODBSMHRHUmdVSlEyNjZvdU5GMFV4enNjR01X?=
 =?utf-8?B?UGFmdkhtTWZWN1JQTy9ocS9rRmZ6SnE0VDlzS3I0czZueFNxSDBicVZJdWth?=
 =?utf-8?B?UHdTNXNITU1yNEI0emdXVnJjZStLdVJ4eUgwNEYwWTBoY1krVWdXSllQRXBk?=
 =?utf-8?B?bmtlL0FjWCt1NlkyS0RZckpjbVhvOG9rcGtaa00xRHN3eTlNZS9sNklRUUlS?=
 =?utf-8?B?SllsMlc1ajV0WUo4d3U4RzR0MlJheWFYanVJOUo5blUvWk0rd0RPNTlzeUts?=
 =?utf-8?B?UXRzbGlGNHdtTG9rUmZHSVVqREQrSWNzNDZKY2JIdGhFQlZ6cHEwSzdWSzQy?=
 =?utf-8?B?bHRsMG5YV09HZm1jV1VYNmJqdG9MODNFMXFITWdFRWZJVGdSUWJTT0lMQWo1?=
 =?utf-8?B?VGhianVuV0Fuc3ZGM0JwZEZFNFVFZGgrRWp2bjlaVWVDVm9HTEF4WjduYUEr?=
 =?utf-8?B?aTAxQkN6NCs3YkgyemEyamNHMUhhR1NwRlhGdVNQSFcyQ3hkQngyRXpWNCtY?=
 =?utf-8?B?NHFFM3lFOCtUaFNWdVFSQm9uSzdoajU1bCtDN1o0TUg5VTB3WmhvTHVDbndt?=
 =?utf-8?Q?/0d7vSS0bcbOMzG8+lp8nkw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45444B92EF743E4B9301C5D569F257A1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49233e24-f439-4c09-d7f3-08da8a8525f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 12:42:49.7677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuYosx0/oT44rp4YnzdNTLB8XVH78G0vP4F8vMxoK8jvOkm2McaRtlTnhheyTc8nZ0fTrwVZ87nLuPCuhFXOMzjwYWrdgOep2tSU5pc6fj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB1429
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

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBvYmp0b29sIHRocm93cyB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxsIHdhcm5p
bmdzDQo+IGluIHRoZSBmb2xsb3dpbmcgYXNzZW1ibHkgZmlsZXM6DQo+IA0KPiBhcmNoL3Bvd2Vy
cGMva2VybmVsL3ZlY3Rvci5vOiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDUzYzogdW5hbm5v
dGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbA0KPiANCj4gYXJjaC9wb3dlcnBjL2t2bS9ib29rM3Nf
aHZfcm1oYW5kbGVycy5vOiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDYwOiB1bmFubm90YXRl
ZCBpbnRyYS1mdW5jdGlvbiBjYWxsDQo+IGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X3JtaGFu
ZGxlcnMubzogd2FybmluZzogb2JqdG9vbDogLnRleHQrMHgxMjQ6IHVuYW5ub3RhdGVkIGludHJh
LWZ1bmN0aW9uIGNhbGwNCj4gYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfcm1oYW5kbGVycy5v
OiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDVkNDogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rp
b24gY2FsbA0KPiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9ybWhhbmRsZXJzLm86IHdhcm5p
bmc6IG9ianRvb2w6IC50ZXh0KzB4NWRjOiB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxs
DQo+IGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X3JtaGFuZGxlcnMubzogd2FybmluZzogb2Jq
dG9vbDogLnRleHQrMHhjYjg6IHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0aW9uIGNhbGwNCj4gYXJj
aC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfcm1oYW5kbGVycy5vOiB3YXJuaW5nOiBvYmp0b29sOiAu
dGV4dCsweGQwYzogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbA0KPiBhcmNoL3Bvd2Vy
cGMva3ZtL2Jvb2szc19odl9ybWhhbmRsZXJzLm86IHdhcm5pbmc6IG9ianRvb2w6IC50ZXh0KzB4
MTAzMDogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbA0KPiANCj4gYXJjaC9wb3dlcnBj
L2tlcm5lbC9oZWFkXzY0Lm86IHdhcm5pbmc6IG9ianRvb2w6IC50ZXh0KzB4MzU4OiB1bmFubm90
YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxsDQo+IGFyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF82NC5v
OiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDcyODogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rp
b24gY2FsbA0KPiBhcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfNjQubzogd2FybmluZzogb2JqdG9v
bDogLnRleHQrMHg0ZDk0OiB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxsDQo+IGFyY2gv
cG93ZXJwYy9rZXJuZWwvaGVhZF82NC5vOiB3YXJuaW5nOiBvYmp0b29sOiAudGV4dCsweDRlYzQ6
IHVuYW5ub3RhdGVkIGludHJhLWZ1bmN0aW9uIGNhbGwNCj4gDQo+IGFyY2gvcG93ZXJwYy9rdm0v
Ym9vazNzX2h2X2ludGVycnVwdHMubzogd2FybmluZzogb2JqdG9vbDogLnRleHQrMHg2YzogdW5h
bm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbA0KPiBhcmNoL3Bvd2VycGMva2VybmVsL21pc2Nf
NjQubzogd2FybmluZzogb2JqdG9vbDogLnRleHQrMHg2NDogdW5hbm5vdGF0ZWQgaW50cmEtZnVu
Y3Rpb24gY2FsbA0KPiANCj4gb2JqdG9vbCBkb2VzIG5vdCBhZGQgU1RUX05PVFlQRSBzeW1ib2xz
IHdpdGggc2l6ZSAwIHRvIHRoZQ0KPiByYnRyZWUsIHdoaWNoIGlzIHdoeSBmaW5kX2NhbGxfZGVz
dGluYXRpb24oKSBmdW5jdGlvbiBpcyBub3QgYWJsZQ0KPiB0byBmaW5kIHRoZSBkZXN0aW5hdGlv
biBzeW1ib2wgZm9yICdibCcgaW5zdHJ1Y3Rpb24uIEZvciBzdWNoIHN5bWJvbHMsDQo+IG9ianRv
b2wgaXMgdGhyb3dpbmcgdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbCB3YXJuaW5ncyBp
bg0KPiBhc3NlbWJseSBmaWxlcy4gRml4IHRoZXNlIHdhcm5pbmdzIGJ5IGFkZGluZyBTWU1fRlVO
Q19TVEFSVF9MT0NBTCgpDQo+IGFuZCBTWU1fRlVOQ19FTkQoKSBhbm5vdGF0aW9ucyB0byB0aG9z
ZSBzeW1ib2xzIHRvIGJlIGFibGUgdG8gc2V0IHN5bWJvbA0KPiB0eXBlIHRvIFNUVF9GVU5DIGFu
ZCBzZXQgc2l6ZSBvZiB0aGVzZSBzeW1ib2xzIGFjY29yZGluZ2x5Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBh
cmNoL3Bvd2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRzLlMgICAgfCAgNyArKysrKy0tDQo+ICAg
YXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzY0LlMgICAgICAgICAgIHwgIDcgKysrKystLQ0KPiAg
IGFyY2gvcG93ZXJwYy9rZXJuZWwvbWlzY182NC5TICAgICAgICAgICB8ICA0ICsrKy0NCj4gICBh
cmNoL3Bvd2VycGMva2VybmVsL3ZlY3Rvci5TICAgICAgICAgICAgfCAgNCArKystDQo+ICAgYXJj
aC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfaW50ZXJydXB0cy5TIHwgIDQgKysrLQ0KPiAgIGFyY2gv
cG93ZXJwYy9rdm0vYm9vazNzX2h2X3JtaGFuZGxlcnMuUyB8IDIyICsrKysrKysrKysrKysrKy0t
LS0tLS0NCj4gICA2IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02
NHMuUyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02NHMuUw0KPiBpbmRleCAzZDBk
YzEzM2E5YWUuLjQyNDJjMWEyMGJjZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5l
bC9leGNlcHRpb25zLTY0cy5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9u
cy02NHMuUw0KPiBAQCAtMjAsNiArMjAsNyBAQA0KPiAgICNpbmNsdWRlIDxhc20vaGVhZC02NC5o
Pg0KPiAgICNpbmNsdWRlIDxhc20vZmVhdHVyZS1maXh1cHMuaD4NCj4gICAjaW5jbHVkZSA8YXNt
L2t1cC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2UuaD4NCg0KQ2FuIHlvdSBrZWVwIGFs
bCA8bGludXgvLi4uPiBhbGwgdG9nZXRoZXIgX2JlZm9yZV8gdGhlIDxhc20vLi4uPiBvbmVzIA0K
YXMgdXN1YWwgPw0KDQpDaHJpc3RvcGhl
