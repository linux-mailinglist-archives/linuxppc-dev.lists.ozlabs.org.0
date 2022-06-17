Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8B54F60C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 12:58:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPbd144Pdz3bv3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 20:58:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=XYVz5mDb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=XYVz5mDb;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPbc939KJz3bq5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 20:57:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1N3Jpd/QLjlKgIbHiNRpScRcoKwf6+53X2mWjKk2LUuaCcGDoS5XEDLwrwZf2vsVJ1uK76vdxgv0V9xELAf4OlBE+2WHNN0MXLuoSw9FTyHLijnlZscdqtxvoKRBlIBW7DP/dG8SBR3DFa+EHCt0bIs7cZfSrQt05/K4lFtHDYxAORRBz7i6p0ur5192Ig2vHPmvl+ym4DmNnEjZD9/lJ8INQafOFr+lOg9xuFQJP56mKPRFPxDCopeWj59FU3GBfPgl41DF/3LjqddoBv/0obvAh8NN28aJz/qVCerp72+eu93ovPwfMw4sNEVbYKYiY6CTwlVww9G3JJ6H24e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBgjAhcd7x6wuVBPSSmulRKLHVlytHY27R71L0Juuhs=;
 b=aS0yd+VJ4vcE3znQfvEu44YG8yMHpk80zwSrvpPoQoYfgsZlrSex4uUIRZjzXSw/foDclD/aTEXFz75hEEVoCBOvyx3bMRc4mvriPwThGFgD1+HGkhdLpeycLWhXW3QS0XyCTFC7aCq7nUySWEYGXz+y2JHUQaNcDanL/d/LI2RnB4ywhXwHPGCOcSqYNetnTXhHpD0C5gf9QmPANGsa4sdBsQ3qUBOgVX/JMx2RIBJTYcmE4qDQ/dxhnq9F/Yd++4VsTlbTN4oVAKApXFdZv0iC3M0eusbeQ/2Yse1FCgKJRg9/V8Qtxbnz870sszNEAhWNXhx+eKuxY08oYcs8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBgjAhcd7x6wuVBPSSmulRKLHVlytHY27R71L0Juuhs=;
 b=XYVz5mDbk1V2uf4fLlgtxzrL9d4f8uUNXCMnUWb+d8IcR3QJ0R13OTlkimBqyICLEIdp1bs0cDZAJupsIfs//+I8aSb0OzEDfqerfYRrmOve4y6TPNYPNJq8enN/82ZR9xtjTUFZPddqZ3osIc9x1s4hUcw3SW9VaGXLUERcu8hKM+eWuJ93tMxAS+Rmos9GzBvNd0iConO+rZlunDTtlYlIgniwhRuucAu2bb/Gj5lOHYmZjo+FH1a5ETzvMUdyyprYuuCJ3+2ikYrRcjQW+GO1Ls+NiJLm9PCwz8PVWmPSHRJflyAAnIWG9fZYgi8nX0csZQS4QjlXEYJyWTsQ5g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3609.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:164::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 10:57:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 10:57:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liang He <windhl@126.com>, "Conor.Dooley@microchip.com"
	<Conor.Dooley@microchip.com>
Subject: Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Thread-Topic: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
Thread-Index: AQHYgjkOCymayD7j1k+DQNhVAl5A6Q==
Date: Fri, 17 Jun 2022 10:57:36 +0000
Message-ID: <f93ef357-3336-fdc0-55e9-b09beeb2da72@csgroup.eu>
References: <20220617060827.4004795-1-windhl@126.com>
 <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
 <16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com>
 <f79ebcc1-c060-f861-231d-85c377e2e885@csgroup.eu>
 <64ac3dc9.5bd1.18170bcb6a6.Coremail.windhl@126.com>
 <33668b61-4ae7-f625-0eb3-e15d2119623c@microchip.com>
 <71b517f4.7854.1817145ff77.Coremail.windhl@126.com>
In-Reply-To: <71b517f4.7854.1817145ff77.Coremail.windhl@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf7b7492-3cad-415e-bdd8-08da5050308a
x-ms-traffictypediagnostic: PR0P264MB3609:EE_
x-microsoft-antispam-prvs:  <PR0P264MB3609B02539572118B95EFAF0EDAF9@PR0P264MB3609.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9NIfxlm9/ul9t3pfqUyXGa6HybiPbgaZH9nZxNkVXshFNkwMcm8TPEm1tRD9r7jKCzeI7lYN767UC8fopglBiZDCVvUXma+BAXbg92T5YPsTFMLsBmLcEFigczoR7IWn/YGTYWbE5ofu/yguKPX+we17LVjU0Lkuin8lFeAhw1GmM4qEI8mNzLC45yvqfK8Aqv+8Q2fGV/mclHvoIJYGseronNOwnEIm2gvJyA6SJlnvnJ8zmtfdOYwavfSwvKQ25Zqh+0AB7hbKjgSguwYUGtqQ5/Hd6+6uTUw4UL4SpWUtfFBRUr3asRY/EWsOpIeOI7tJRDc73bLiFejCCnxOtLSkg/8qG9iX3xHMkxOK+VHjuFI+gIR2QpAxo4ueA8SeOF509ihERzK89ACE39y30Ak9yQxudCyvagKnb/vdh2Xif76bxIgKTUGhP0UAgnwHRwIsw+dZuD/upPJ2gywHRcEIcXFtfxgKJfQVaJt8FH+o+0uFhNpqy7usOP5Y7ZouY+hSacAuy6+aDx3LoD7iUEb/BL5l30np/chHoLJe5t3gGiKGsba33M4HykC6mriTCczl7NTyTmgcwmDl3fZ56HNF3glP0SCBSS3IS/C9h368RkhQUSnzwypzetx7O6Y3iDADXrF1v8C3ex8BrJnjKpoEsFpndAtROmRBrlJ9yVYio0ghedXOvKP6hdg6kl7uHXADauY7ALTNsZkCQ9ltd/wyzRl0aaZBf28uhuV/yLF2hWMg+BspMWsNzLKv+lywAiwbTC0BkEaJ51O0GNokNbRiLt55V6zXsAS2+J673HKNIf5CVU6RE/5lkN9X14jywmANukMnmwqaZa1IRa83JqHhlkmm17GKbD14TGGfA78=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(26005)(6512007)(2616005)(54906003)(4326008)(66556008)(66476007)(31686004)(66446008)(38070700005)(36756003)(64756008)(91956017)(76116006)(110136005)(53546011)(966005)(8676002)(6486002)(186003)(71200400001)(316002)(6506007)(38100700002)(31696002)(2906002)(122000001)(44832011)(66574015)(8936002)(66946007)(83380400001)(86362001)(5660300002)(498600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ekw0dzZDdU1MQjlqYVhUSVBTYVphNGxsQ05temlJUlkwWGtjNnZJRytpYlFr?=
 =?utf-8?B?T3ltTnZ6VU94YVJ3ZGtxWE5uV2dNQ3RXOE5Ia2tYOCtXYXRUYjlIc3NiMExm?=
 =?utf-8?B?RnVwUUczazYvOEhoalR4N0lteGlOdThqaGNPOVYzY3p2ejJjSXdJQUFGWDVt?=
 =?utf-8?B?OE0wQjNQNjc0cDI0dXptTzJZaUljcW4zWitDNkNUMCt1aGJFcW8zOTI5UXBw?=
 =?utf-8?B?WUdYdXlsMDdhTUJGb3pqL3FDVGlLVTVwNmpVL0tNU3BSbk9Ld3l0Z0lxbTFp?=
 =?utf-8?B?Y0hzc2Y1ZE5kbjNHMWtEVE5jUG1aNWZDd0tyMU02VVR5MG1DWE1EZFhNOGVH?=
 =?utf-8?B?UGZOamk0WTE4MldYOTZGUEZWTkNzeTdpOXJVVmxqWkxwekJiOG9TOXF0K1pL?=
 =?utf-8?B?UThqREI5NFdGc1lQTnNGc1ZwZE9oRkVNY0YrZGVWclZiR1lDQytyN3NQNDFB?=
 =?utf-8?B?Uk84dU5EK0NSTnRLamt3UjQ1UGJFMTBhSXRyZW9BR2NZcG9TeUpjOXEyU2Fw?=
 =?utf-8?B?eS8wbWFoQXdsR1JGc0pDMGpZdXFjREpVaUZiRHlOT2k2RzhmdERobDMyU0dZ?=
 =?utf-8?B?aWpEWGtEeUE5Y0Q1ZlZienA0a0ZneFJ2ZlQvK2JJVUp0TFZHRG5UZlpMNHl4?=
 =?utf-8?B?UDFvc2lkc2VZTldGdTNZNnZCWVVCdHZ0WjRod2t2bXRrYXY2OEE1ZUNGRVll?=
 =?utf-8?B?YWRCRUllWTJjSWxVTWV2L0wrRHF6V1pmUWFiUW1hZUE2d1dQQVkreXhtcFRB?=
 =?utf-8?B?SWRGMWpBWjlncEF4UWVOYitWMlkwRlkrUW9UMWVtVjhOeHd5UFRrTFVYeGVa?=
 =?utf-8?B?VkhWMVF2S2NObE1vaEkrTFRSRlhZajhuYnBmcFNkdU1sZXVNZU1KZHFSWmJL?=
 =?utf-8?B?ZmoxQU1qRW8xYnVsNC93MlFLbDdLd3RFL1ZueTNrQU0vRGhoWndMaUlXV1hH?=
 =?utf-8?B?U1MvOFFJMENsSlBzdEIyblZDQWVtejVVdkhkMHZGTDM2bi8xNnJmNkVORW5Q?=
 =?utf-8?B?OVNCQkRkbnVKWGVLZFd4QmVmeU9rWWNYQzhaVkZpSGtwRUsrTkF6TllaeVg4?=
 =?utf-8?B?eUlhRUNRRzVoWlRXLzl3RGd1czlXVU0vUWFwSzRFS2ZlOExUQy9wdlBQdFFk?=
 =?utf-8?B?OXJsYkdnRkRnZVdGcFZLcE94OG1tdHdIMkEvWlhuN0dybUM0NmRZK2lDYmVG?=
 =?utf-8?B?V2I5N0VRNTJhWXU3WWNhZnNkd1J2VFhzbGg0ZmZCcmNBdXN6VENuMXpzbVFE?=
 =?utf-8?B?NEwrV0pjNG8xMEtXVmNuaW1sRjJINDhxR3l5N3RxbmE4eG1hSTJEWVMrZFUv?=
 =?utf-8?B?VjRTMDhONnNmWlZyaHEwWENhYkY0VTFhNHlZY2FxUHlRNXVLQk9ESzRkOUpI?=
 =?utf-8?B?bThyaktIdGFDWkFhMk1IcDN6SVhMSTc4TnMybXpWa2IydEZUM2RneTZQTTk5?=
 =?utf-8?B?UHhYK2JVUUlmQ2JOWU9iT2lCKzRWMDNOMmpvcnJBRG1LZzliQjJtRXpYSFBr?=
 =?utf-8?B?b0RSb1BaUTl2RFVscUJVZ2c0T2RsRllBV3ZxVUZBakc1azNmcmFNb2dNTHBq?=
 =?utf-8?B?aitwNE5GVjJJNTF6c1JEUjBnaGlpUXovRUFtMWN0ZE1xdTNNYVdWQTNpckoz?=
 =?utf-8?B?T2hheERqRGl4VXJ0ME5VZ0FDOWsyMW93V3lWbXNsb3EySy85amN2VUdPQlRT?=
 =?utf-8?B?LzJveUt4b3pBdCtlZkh4cU9RdG05SDNNWTVGRGc2akpBVzdIMEpVdU1JTUNh?=
 =?utf-8?B?bHhHdU1meHAzMDFLMmNXL1hGT2U2eExXU3JsRjZsSVpPYVJnaXhPNEtDTks0?=
 =?utf-8?B?VE5Ic0JRN1JGWkVURVNESXF6WldoYTVuV3NPdmZzbEdramFrQXFzVWt0Qkpo?=
 =?utf-8?B?OUVEamtSZkFidDJud3ovK1JNSXhYdnZYd09vNExJdGJzOCtIVWxncjVOdzkx?=
 =?utf-8?B?aEYyT1lOek5vTHJrcWdHTEhUZVVCQklSSE9DQlYzV2RLV2F2Y2hqd0xRYmp1?=
 =?utf-8?B?blNpaGk0am5WdkpIYUVySHZ5RTgvWnBWVHVpeFljcmJQdVFwQnFaWUV2M1JD?=
 =?utf-8?B?RDNrbnZxRTYwSEU2V09VOGxFMi9zVzJ1VkFvbXl6bTRGc0U5VWMvYmlIUldE?=
 =?utf-8?B?ZUxqYWtESElGUTRPdUVJMUhsaFovVHVBYlZ0ZUc4a2tSQzNBT1FNdG1xYnBk?=
 =?utf-8?B?K1RFWWlvRVRMK0hVSzNRMjJVdnlvVHpwUHZZTlFZNTBsWFZ1MVpJakFsRSs3?=
 =?utf-8?B?cEJnNHY0L1dncUljYmJqL3FNbFlPSWpmcmNxcjFSZ25uVGNpVkl1bktXZmhO?=
 =?utf-8?B?RkF4TzFvQ1JtbUgrTkxCK05Ba3hHK0NOTVRKN1RUd2xKa0ovK3V3c3daRXFL?=
 =?utf-8?Q?Y7CZMvU8WPmFGW9i521I4pGF+wFoLSnl36zl0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECC2A0E76B813E4685A65DDC5D1C6C7B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7b7492-3cad-415e-bdd8-08da5050308a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 10:57:36.7882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRkhdWp1kKUF2bD1GhYBr9tNxasA1d4qtxZ3ZLahDexFdH4fzmriTUkA4L6UvR5nA4jiL5GCsSaXePkt9pLG4D9c2u8ZSSZvrQLHEkrPScc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3609
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oss@buserror.net" <oss@buserror.net>, "paulus@samba.org" <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA2LzIwMjIgw6AgMTI6NDcsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+IA0KPiAN
Cj4gDQo+IEF0IDIwMjItMDYtMTcgMTY6Mjc6MDMsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29t
IHdyb3RlOg0KPj4gT24gMTcvMDYvMjAyMiAwOToxNywgTGlhbmcgSGUgd3JvdGU6DQo+Pj4NCj4+
Pg0KPj4+DQo+Pj4gQXQgMjAyMi0wNi0xNyAxNDo1MzoxMywgIkNocmlzdG9waGUgTGVyb3kiIDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+PiBMZSAx
Ny8wNi8yMDIyIMOgIDA4OjQ1LCBMaWFuZyBIZSBhIMOpY3JpdMKgOg0KPj4+Pj4NCj4+Pj4+DQo+
Pj4+Pg0KPj4+Pj4gQXQgMjAyMi0wNi0xNyAxNDoyODo1NiwgIkNocmlzdG9waGUgTGVyb3kiIDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+
PiBMZSAxNy8wNi8yMDIyIMOgIDA4OjA4LCBMaWFuZyBIZSBhIMOpY3JpdMKgOg0KPj4+Pj4+PiBJ
biBncGlvX2hhbHRfcHJvYmUoKSwgb2ZfZmluZF9tYXRjaGluZ19ub2RlKCkgd2lsbCByZXR1cm4g
YSBub2RlDQo+Pj4+Pj4+IHBvaW50ZXIgd2l0aCByZWZjb3VudCBpbmNyZW1lbnRlZC4gV2Ugc2hv
dWxkIHVzZSBvZl9ub2RlX3B1dCgpIGluDQo+Pj4+Pj4+IGZhaWwgcGF0aCBvciB3aGVuIGl0IGlz
IG5vdCB1c2VkIGFueW1vcmUuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IExpYW5n
IEhlIDx3aW5kaGxAMTI2LmNvbT4NCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+ICAgICAgY2hhbmdlbG9n
Og0KPj4+Pj4+PiAgICAgIHY0OiByZXVzZSBleGlzdCAnZXJyJyBhbmQgdXNlIGEgc2ltcGxlIGNv
ZGUgc3R5bGUsIGFkdmlzZWQgYnkgQ0oNCj4+Pj4+Pj4gICAgICB2MzogdXNlIGxvY2FsICdjaGls
ZF9ub2RlJyBhZHZpc2VkIGJ5IE1pY2hhZWwuDQo+Pj4+Pj4+ICAgICAgdjI6IHVzZSBnb3RvLWxh
YmVsIHBhdGNoIHN0eWxlIGFkdmlzZWQgYnkgQ2hyaXN0b3BoZSBMZXJveS4NCj4+Pj4+Pj4gICAg
ICB2MTogYWRkIG9mX25vZGVfcHV0KCkgYmVmb3JlIGVhY2ggZXhpdC4NCj4+Pj4+Pj4NCj4+Pj4+
Pj4gICAgICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyB8IDM1ICsr
KysrKysrKysrKysrLS0tLS0tLS0tDQo+Pj4+Pj4+ICAgICAgMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NneV9jdHMxMDAwLmMgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYw0KPj4+Pj4+PiBpbmRleCA5OGFlNjQwNzUx
OTMuLmU0NTg4OTQzZmU3ZSAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84NXh4L3NneV9jdHMxMDAwLmMNCj4+Pj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84NXh4L3NneV9jdHMxMDAwLmMNCj4+Pj4+Pj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGlj
IGludCBncGlvX2hhbHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+Pj4+
Pj4gICAgICB7DQo+Pj4+Pj4+ICAgICAgCWVudW0gb2ZfZ3Bpb19mbGFncyBmbGFnczsNCj4+Pj4+
Pj4gICAgICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+
Pj4+Pj4+ICsJc3RydWN0IGRldmljZV9ub2RlICpjaGlsZF9ub2RlOw0KPj4+Pj4+PiAgICAgIAlp
bnQgZ3BpbywgZXJyLCBpcnE7DQo+Pj4+Pj4+ICAgICAgCWludCB0cmlnZ2VyOw0KPj4+Pj4+PiAg
ICAgIA0KPj4+Pj4+PiBAQCAtNzgsMjYgKzc5LDI5IEBAIHN0YXRpYyBpbnQgZ3Bpb19oYWx0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+Pj4+ICAgICAgCQlyZXR1cm4g
LUVOT0RFVjsNCj4+Pj4+Pj4gICAgICANCj4+Pj4+Pj4gICAgICAJLyogSWYgdGhlcmUncyBubyBt
YXRjaGluZyBjaGlsZCwgdGhpcyBpc24ndCByZWFsbHkgYW4gZXJyb3IgKi8NCj4+Pj4+Pj4gLQlo
YWx0X25vZGUgPSBvZl9maW5kX21hdGNoaW5nX25vZGUobm9kZSwgY2hpbGRfbWF0Y2gpOw0KPj4+
Pj4+PiAtCWlmICghaGFsdF9ub2RlKQ0KPj4+Pj4+PiArCWNoaWxkX25vZGUgPSBvZl9maW5kX21h
dGNoaW5nX25vZGUobm9kZSwgY2hpbGRfbWF0Y2gpOw0KPj4+Pj4+PiArCWlmICghY2hpbGRfbm9k
ZSkNCj4+Pj4+Pj4gICAgICAJCXJldHVybiAwOw0KPj4+Pj4+PiAgICAgIA0KPj4+Pj4+PiAgICAg
IAkvKiBUZWNobmljYWxseSB3ZSBjb3VsZCBqdXN0IHJlYWQgdGhlIGZpcnN0IG9uZSwgYnV0IHB1
bmlzaA0KPj4+Pj4+PiAgICAgIAkgKiBEVCB3cml0ZXJzIGZvciBpbnZhbGlkIGZvcm0uICovDQo+
Pj4+Pj4+IC0JaWYgKG9mX2dwaW9fY291bnQoaGFsdF9ub2RlKSAhPSAxKQ0KPj4+Pj4+PiAtCQly
ZXR1cm4gLUVJTlZBTDsNCj4+Pj4+Pj4gKwlpZiAob2ZfZ3Bpb19jb3VudChjaGlsZF9ub2RlKSAh
PSAxKSB7DQo+Pj4+Pj4+ICsJCWVyciA9IC1FSU5WQUw7DQo+Pj4+Pj4+ICsJCWdvdG8gZXJyX3B1
dDsNCj4+Pj4+Pj4gKwl9DQo+Pj4+Pj4+ICAgICAgDQo+Pj4+Pj4+ICAgICAgCS8qIEdldCB0aGUg
Z3BpbyBudW1iZXIgcmVsYXRpdmUgdG8gdGhlIGR5bmFtaWMgYmFzZS4gKi8NCj4+Pj4+Pj4gLQln
cGlvID0gb2ZfZ2V0X2dwaW9fZmxhZ3MoaGFsdF9ub2RlLCAwLCAmZmxhZ3MpOw0KPj4+Pj4+PiAt
CWlmICghZ3Bpb19pc192YWxpZChncGlvKSkNCj4+Pj4+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+
Pj4+Pj4+ICsJZ3BpbyA9IG9mX2dldF9ncGlvX2ZsYWdzKGNoaWxkX25vZGUsIDAsICZmbGFncyk7
DQo+Pj4+Pj4+ICsJaWYgKCFncGlvX2lzX3ZhbGlkKGdwaW8pKSB7DQo+Pj4+Pj4+ICsJCWVyciA9
IC1FSU5WQUw7DQo+Pj4+Pj4+ICsJCWdvdG90IGVycl9wdXQ7DQo+Pj4+Pj4NCj4+Pj4+PiBEaWQg
eW91IHRlc3QgdGhlIGJ1aWxkID8NCj4+Pj4+DQo+Pj4+PiBTb3JyeSBmb3IgdGhpcyBmYXVsdC4N
Cj4+Pj4+DQo+Pj4+PiBJbiBmYWN0LCBJIGFtIHN0aWxsIGZpbmRpbmcgYW4gZWZmaWNpZW50IHdh
eSB0byBidWlsZGluZyBkaWZmZXJlbnQgYXJjaCBzb3VyY2UgY29kZSBhcyBJIG9ubHkgaGF2ZSB4
ODYtNjQuDQo+Pj4+Pg0KPj4+Pj4gTm93IEkgYW0gdHJ5IHVzaW5nIFFFTVUuDQo+Pj4+Pg0KPj4+
Pj4gQW55d2F5LCBzb3JyeSBmb3IgdGhpcyBmYXVsdC4NCj4+Pj4NCj4+Pj4gWW91IGNhbiBmaW5k
IGNyb3NzIGNvbXBpbGVycyBmb3IgbW9zdCBhcmNoaXRlY3R1cmVzIGZvciB4ODYtNjQgaGVyZSA6
DQo+Pj4+IGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL3Rvb2xzL2Nyb3NzdG9v
bC8NCj4+Pj4NCj4+Pj4gQ2hyaXN0b3BoZQ0KPj4+DQo+Pj4gSGksIENocmlzdG9waGUgYW5kIENv
bm9yLg0KPj4+DQo+Pj4gU29ycnkgdG8gdHJvdWJsZSB5b3UgYWdhaW4uDQo+Pj4NCj4+PiBOb3cg
SSBvbmx5IGtub3cgaG93IHRvIHF1aWNrbHkgaWRlbnRpZnkgdGhlIHJlZmNvdW50aW5nIGJ1Z3Ms
IGJ1dCBJIGNhbm5vdCBlZmZpY2llbnRseSBnaXZlIGEgYnVpbGQgdGVzdC4NCj4+Pg0KPj4+IEZv
ciBleGFtcGxlLCBJIHVzZSB0aGUgY3Jvc3MgY29tcGlsZXJzICdwb3dlcnBjLWxpbnV4LWdudS1n
Y2MnIHRvIGNvbXBpbGUgJ2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5j
JyB3aXRoIC1mc3ludGF4LW9ubHkgZmxhZy4NCj4+PiBCdXQgSSBtZWV0IHRvbyBtYW55IGhlYWRl
ciBmaWxlIG1pc3NpbmcgZXJyb3JzLiBFdmVuIGlmIEkgYWRkIHNvbWUgJ2luY2x1ZGUnIHBhdGhl
cywgZS5nLiwgLi9hcmNoL3Bvd2VycGMvaW5jbHVkZSwgLi9pbmNsdWRlLA0KPj4+IHRoZXJlIGFy
ZSBzdGlsbCB0b28gbWFueSBvdGhlciBlcnJvcnMuDQo+Pj4NCj4+PiBTbyBpZiB0aGVyZSBpcyBh
bnkgZWZmaWNpZW50IHdheSB0byBjaGVjayBteSBwYXRjaCBjb2RlIHRvIGF2b2lkICdnb3RvdCcg
ZXJyb3IgYWdhaW4uDQo+Pg0KPj4gaWRrIGFueXRoaW5nIGFib3V0IHBvd2VycGMsIGJ1dCB3aGF0
IEkgZmluZCBpcyBhIG5pY2Ugd2F5IHRvIGdldCBhIGNvbXBpbGVyDQo+PiBmb3IgYW4gYXJjaCBJ
IGRvbid0IHVzZSBpcyB0byBzZWFyY2ggb24gbG9yZS5rZXJuZWwub3JnIGZvciBhIDBkYXkgcm9i
b3QNCj4+IGJ1aWxkIGVycm9yIHNpbmNlIGl0IGdpdmVzIGluc3RydWN0aW9ucyBmb3IgYnVpbGRp
bmcgb24gdGhhdCBhcmNoLg0KPj4gRm9yIGV4YW1wbGU6DQo+PiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eHBwYy1kZXYvMjAyMjA2MDYwOTEwLnJZTlRGcWRJLWxrcEBpbnRlbC5jb20vDQo+
Pg0KPj4NCj4+IEluIHRoaXMgY2FzZSwgeW91ciBidWcgc2VlbXMgb2J2aW91cz8gWW91IHR5cGVk
ICJnb3RvdCIgaW5zdGVhZCBvZiAiZ290byIuDQo+Pg0KPj4gSG9wZSB0aGF0IGhlbHBzLA0KPj4g
Q29ub3IuDQo+Pg0KPj4+DQo+Pj4gVGhhbmtzIGFnYWluLCBDaHJpc3RvcGhlIGFuZCBDb25vci4N
Cj4+Pg0KPj4+IExpYW5nDQo+IA0KPiBUaGFua3MsIENvbm9yIGFuZCBDaHJpc3RvcGhlLg0KPiAN
Cj4gSSBmaW5hbGx5IGZpZ3VyZSBvdXQgYW4gZWZmaWNpZW50IHdheSBpbiB3aGljaCBJIGNhbiB1
c2UgY3Jvc3MtY29tcGlsZXIgdG8gY2hlY2sgbXkgc2luZ2xlIHBhdGNoZWQgZmlsZSBhcyBmb2xs
b3c6DQo+IA0KPiBwb3dlcnBjNjRsZS1saW51eC1nbnUtZ2NjIC1XcCwtTU1ELGFyY2gvcG93ZXJw
Yy9rZXJuZWwvLmlvLm8uZCAgLW5vc3RkaW5jIC1JLi9hcmNoL3Bvd2VycGMvaW5jbHVkZSAtSS4v
YXJjaC9wb3dlcnBjL2luY2x1ZGUvZ2VuZXJhdGVkICAtSS4vaW5jbHVkZSAtSS4vYXJjaC9wb3dl
cnBjL2luY2x1ZGUvdWFwaSAtSS4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvZ2VuZXJhdGVkL3VhcGkg
LUkuL2luY2x1ZGUvdWFwaSAtSS4vaW5jbHVkZS9nZW5lcmF0ZWQvdWFwaSAtaW5jbHVkZSAuL2lu
Y2x1ZGUvbGludXgvY29tcGlsZXItdmVyc2lvbi5oIC1pbmNsdWRlIC4vaW5jbHVkZS9saW51eC9r
Y29uZmlnLmggLWluY2x1ZGUgLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmggLURfX0tF
Uk5FTF9fIC1JIC4vYXJjaC9wb3dlcnBjIC1mbWFjcm8tcHJlZml4LW1hcD0uLz0gLVdhbGwgLVd1
bmRlZiAtV2Vycm9yPXN0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJpZ3JhcGhzIC1mbm8tc3RyaWN0
LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1mc2hvcnQtd2NoYXIgLWZuby1QSUUgLVdlcnJvcj1pbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV2Vycm9yPWltcGxpY2l0LWludCAtV2Vycm9yPXJl
dHVybi10eXBlIC1Xbm8tZm9ybWF0LXNlY3VyaXR5IC1zdGQ9Z251MTEgLW1jcHU9cG93ZXJwYyAt
bWNwdT1wb3dlcnBjIC1tMzIgLW1zb2Z0LWZsb2F0IC1waXBlIC1mZml4ZWQtcjIgLW1uby1yZWFk
b25seS1pbi1zZGF0YSAtbW5vLWFsdGl2ZWMgLW1uby12c3ggLWZuby1hc3luY2hyb25vdXMtdW53
aW5kLXRhYmxlcyAtbW5vLXN0cmluZyAtbWJpZy1lbmRpYW4gLW1zdGFjay1wcm90ZWN0b3ItZ3Vh
cmQ9dGxzIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLXJlZz1yMiAtZm5vLWRlbGV0ZS1udWxsLXBv
aW50ZXItY2hlY2tzIC1Xbm8tZnJhbWUtYWRkcmVzcyAtV25vLWZvcm1hdC10cnVuY2F0aW9uIC1X
bm8tZm9ybWF0LW92ZXJmbG93IC1Xbm8tYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyIC1PMiAtLXBh
cmFtPWFsbG93LXN0b3JlLWRhdGEtcmFjZXM9MCAtV2ZyYW1lLWxhcmdlci10aGFuPTEwMjQgLWZz
dGFjay1wcm90ZWN0b3Itc3Ryb25nIC1XaW1wbGljaXQtZmFsbHRocm91Z2g9NSAtV25vLW1haW4g
LVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1jb25zdC12YXJpYWJsZSAt
Zm9taXQtZnJhbWUtcG9pbnRlciAtZm5vLXN0YWNrLWNsYXNoLXByb3RlY3Rpb24gLVdkZWNsYXJh
dGlvbi1hZnRlci1zdGF0ZW1lbnQgLVd2bGEgLVduby1wb2ludGVyLXNpZ24gLVdjYXN0LWZ1bmN0
aW9uLXR5cGUgLVduby1zdHJpbmdvcC10cnVuY2F0aW9uIC1Xbm8tc3RyaW5nb3Atb3ZlcmZsb3cg
LVduby1yZXN0cmljdCAtV25vLW1heWJlLXVuaW5pdGlhbGl6ZWQgLVduby1hbGxvYy1zaXplLWxh
cmdlci10aGFuIC1mbm8tc3RyaWN0LW92ZXJmbG93IC1mbm8tc3RhY2stY2hlY2sgLWZjb25zZXJ2
ZS1zdGFjayAtV2Vycm9yPWRhdGUtdGltZSAtV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5
cGVzIC1XZXJyb3I9ZGVzaWduYXRlZC1pbml0IC1Xbm8tcGFja2VkLW5vdC1hbGlnbmVkIC1tc3Rh
Y2stcHJvdGVjdG9yLWd1YXJkLW9mZnNldD01NzYgLVdlcnJvciAtREtCVUlMRF9NT0ROQU1FPSci
ODV4eCInIC1ES0JVSUxEX01PREZJTEU9JyJhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5
X2N0czEwMDAuYyInIC1mc3ludGF4LW9ubHkgLi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgv
c2d5X2N0czEwMDAuYw0KPiANCg0KRWFzaWVzdCB3YXkgaXM6DQotIERvd25sb2FkIGNyb3NzIGNv
bXBpbGVyIGFuZCBleHRyYWN0IGl0IHNvbWV3aGVyZSBvbiB5b3VyIFBDIGFuZCBlbnN1cmUgDQpp
dCBpcyBpbiB0aGUgUEFUSC4NCi0gVGhlbjoNCg0KcnVuICJtYWtlIENST1NTX0NPTVBJTEU9cG93
ZXJwYzY0LWxpbnV4LWdudSBBUkNIPXBvd2VycGMgDQpjb3JlbmV0MzJfc21wX2RlZmNvbmZpZyIN
Cg0KbW9kaWZ5IC5jb25maWcgdG8gYWN0aXZhdGUgQ09ORklHX1NHWV9DVFMxMDAwDQoNCnJ1biAi
bWFrZSBDUk9TU19DT01QSUxFPXBvd2VycGM2NC1saW51eC1nbnUgQVJDSD1wb3dlcnBjIA0KYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NneV9jdHMxMDAwLm8iDQoNCg==
