Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AB5B694E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 10:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRbs85kNsz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:16:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DQ11EFMF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.75; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DQ11EFMF;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120075.outbound.protection.outlook.com [40.107.12.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRbrQ16hKz2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 18:15:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmqHQr/QHXOASxOIqwTTaQ+96Jl5b13JOkNzV7v9Erk1XWSPQFLcoGCBh36ycbULVKAWxpFwv9CSd2VwLNAywmmTP1Y6eRzVJAJV2CY/xljNI/TQvShzklSKmvBThOUqY3wz2IzaUZQoeuavKhKindMbv/+E+uxQkrQyt8FHp0ygU4DX5MISJvw9hO6mVjxhJIUDPW4lFHXIJWAB0ot/07urPPhCCN6w8WcOvHSFSv0xh1AHCi7WuQrQ11D4PooAKz/p0awecm2WKtCO/cPL/y6l4plh1qxOA9V+C9vHtQhjQBFU4BfJnpy0ivzMCpc5kXqrzhDk6nTm8esGdHvuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsVFuWCewIlN1jCoDn5t2ajUEkTjmsS/6RcxUdbfEj4=;
 b=CrTt4EVC2xlBeC+3W4V4fA8Vqc83ZdLfqxeobhOngVolriFVdMLSkmdDLuGOs59atTml+/XwJUTcMB361iNen/tkKbW1cIlUsEUhmnAcHDgyxi3BfHNK4ft220iBmUOrM94lQHl2ZGipjKTpcMfNhVSxVVMLhiJRrEQ5E1aheNgaC06PaIm4MprXCcbZBR0HU0F8zZKweAa1NOFuYgDFtkmvn/ZplEtGvsCH79AEgdfS5uJHdCq0mJeBSZdSvvvPvL9Nq5Ds1rvL4r0+4pSVyxacnLnEiu59zt+cWIZOnsdKM5vkA4ULgnLUfiKdCGt3FXBTAUPTwV3A8wQ7SFBtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsVFuWCewIlN1jCoDn5t2ajUEkTjmsS/6RcxUdbfEj4=;
 b=DQ11EFMFRvdHiaOYd7TnFNBFkICeGvQdenUAvnc7OZkSle5SeR1bhww/mizPOvXN3BLWKCbyuF5liAeY3DNZC9WqxZAWqIjOHhVEvFcNP104V7uRWzvCDkgKwQ3bjvaADj90WtyxNd4ZKVbSNjTICK6jQz1Qe5wbJkddz5uYY0Zb/K13nib7UPnYgvaDU8hINkaOnviF6ESiTGTSOVu5LUXtY7MAvbNHfuZj4KI+Zk41zmsqKw2CPf8qpSP5LoOiRywgJMZLKcZaxwN5tFj7fjdYQnU+mf9NkBHj0/L7GydAFT1+mWOxadlmdyYdxlE9qCg5hdTcNObz5JuZt9M76Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1971.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 08:15:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 08:15:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Disha Goel <disgoel@linux.vnet.ibm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>
Subject: Re: [PATCH 0/4] Remove unused macros from asm-offset
Thread-Topic: [PATCH 0/4] Remove unused macros from asm-offset
Thread-Index: AQHYx0Q1lioUgjXst0GdjzgHRwcgh63dA2+A
Date: Tue, 13 Sep 2022 08:15:29 +0000
Message-ID: <1fa0b040-a9ec-aa22-e928-55df91bad19a@csgroup.eu>
References: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
In-Reply-To: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1971:EE_
x-ms-office365-filtering-correlation-id: 216cce09-6e80-4076-b291-08da95601f0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yeMmGd6x9PsEeHj7FeFzX7u1Rrhm0Sxa/x3elxJtRUJ4kfntL9SdHhPu6lJkhNOC+3XraLXMxHHlJeYQyBRBhCf5eGEJBtG3S6jgjZqbZcK8yxj5/vjWmgFYrHItyb6JC01L8s82ayHe49AQQnXiF6IUJDn9gtTw9OKUaTNwm6UJNhCkebBcLssKsmEqAP/BF7vmlwSp8j8xUtA+vliRtGk8XQiNXCDnLVctmZdA6ghEwQ6VceyntrZI7OggrYlBM/0OA1wn/UU/lN0ZnxYzk4NNUj9bpteQurk/hAJhFFwTYLiiC8wDcBjwv8VeaHZM5F75K8um6d6cSivBtZPefn+P0XQ8UbEIv2cDXND1snuLi1+99cNTyMLMsdP2JO8fprEXxiPMWlioG8OryMee5Ch1BAsAhJDFwuAlvmxZ0Y7LwncRHJmNFa8UR/Ld6Vsd+f6I10RC+anC28N3NltGZYcmMD8phNPM3ZQc8Wz6ktexB3xxN6e7jPr1rdWzWUJOf9l86Bm4vGZ7DDx5GAFeOachybegSWq2K4HcJI4F1GnhPMH3kLSFucEjp7FV562iaP7fwBbszUFm7GmkXjIpzB3wYtU5giEfsvz6Yt6h+1relnCXjU/APsmorTUpekdYztP6V0ENdeAdAwQrvTsjC4w4LkHHoALXtLmiljXu0uGXvDgBgqErk/MR9bLBihAA6oBl6kBgBF/cJgcN1cmxeNUWbst8NH1GjSvJjbIBPAX+yfVQiVkd3ysjVKQ+YN8dRG3KRfZ5wonn35Ju2CkPHG9cLAlKxT37tZBr7NbdWbA2MHvm62WxdzOcFfAXeau0SFj3K4WPSq6KNDgZC8JCHWav2IjtMhlytbDJFepIjnF4hoy1fIzU0kZaBSjn3nD5qvH8jx+azk+cYFmjbkyM7g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(366004)(396003)(376002)(136003)(451199015)(66476007)(478600001)(966005)(110136005)(36756003)(76116006)(6486002)(66556008)(26005)(44832011)(6512007)(86362001)(186003)(41300700001)(54906003)(71200400001)(91956017)(2906002)(66946007)(8936002)(2616005)(83380400001)(4326008)(66446008)(8676002)(38070700005)(31686004)(31696002)(122000001)(316002)(5660300002)(38100700002)(6506007)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VFh5VlJBODlHQ0dXME5peGx4N2RDZTNRWFBTdjkxTDFEK1FDQXVoUnhqM09R?=
 =?utf-8?B?THI4c1JyaC8wdHhJNU5waWU4M1c5akM2L2NrYnVaU01oc2thd0paczF3S243?=
 =?utf-8?B?MU9hdXg1VGU2VjRzOXhuTXZja2VKSnZwNUNheS9abW1lNnRkdkFpQnZ6WXM4?=
 =?utf-8?B?L3NRTWFCa041R2RIalNXOStieEpnRDE0TFZSL2hHNkxRc2lXN1lyU2pDNnRZ?=
 =?utf-8?B?N1FFbDhKRlhPcE5YVmx4b1BzSUo2ZEFpYkFCczRjT2N6SzV4NFRvVmg0TlBk?=
 =?utf-8?B?RXZtUjh5d1JzVzh0c2xZcmZadEdjZmNhS0hhc3N3TTdzb0RZUTFPU3BsQmho?=
 =?utf-8?B?SDVMbHF0dmtTOWptei9xVEdpMVZPUU5KaHRlaDREamhVWFg4WXVXQ21rNlFH?=
 =?utf-8?B?OVJhMzFVMXpreG9YdmZKSE9rV3YzK09iSUFSemViU0JzSFAwcVNLTmtyY1la?=
 =?utf-8?B?djBReEdmM2lVRm1Oc2lxVTU5TU5pTkptUDUwQk9OckxPYTRhTk1aZDJoZGdi?=
 =?utf-8?B?TG5VWnE3MUlIZEdVL2NOdzNua3NkMG1seXk3OTBzUncwUW5ncTRESStlTGtz?=
 =?utf-8?B?WDFTeDNFa090dW5LbUcySW5Ka0pQTnNyazZpRVhINVlsaG1mSGJsRTFldEhX?=
 =?utf-8?B?b2xndW1NZ1NDMXUweU9adExJQXRNK1FMaXJCbXNkKzJYRDZXSkFJRlF0akw3?=
 =?utf-8?B?SE11K3VwVDNJSE8rd1dRaHlBMzZydkZMcWI5WGRseTR5WjR5dGpxeUgwVTVj?=
 =?utf-8?B?RTU3QXVEY3ZYbExiU1Raa0ZIaXliQzZMQ3o0MnEzdTZRQk9qZUNRZnlveDNm?=
 =?utf-8?B?cHJ3cVhoOWQ3Z0grQnBOT0YwZjRNamlIUU1pNkRGYkN3TnlFWXBocmpLME1R?=
 =?utf-8?B?T1h2aXNsN2NqTEVFWWtSMUQ0SGJmWTVSbTlacHR3bUREYmNOTjdnODZJdUoz?=
 =?utf-8?B?Vm5mUlVReUhzRUIvVTVDN0hPUHhmSEdTTS9FQnJPWGEyeTZvdm5zWEpJMDdo?=
 =?utf-8?B?SXhRM0plamp5N21WMktNRnRpSytYdjlNdGxBMDVOZ0dqMFJTem95UHZSak9Z?=
 =?utf-8?B?ZUpTTkVwcHgvRWg3UkZBRmMvWFM4TzM3c0FkQUV4VUdCd3MvK05kd2pEN0k1?=
 =?utf-8?B?V1hHczRPZ0orNEhIamFrdW1nMGRwSWo3Vk9MMGRqM0xrdVk3OVJuaDY4WFMv?=
 =?utf-8?B?L3V0QThpSFhuSnl6YldDdk9xWmN4YitTUnN6b21TS3B1N2RXcHBvR2Z5M25s?=
 =?utf-8?B?QkNKSjBkNDlFTGVOUkkzdmNrU3RYUW0rbTgyaGpmdCt1RHZpQU1YRDBZV3FF?=
 =?utf-8?B?K1gwcUdyRXl2L0VzaGhLSkpSbEpXTVZzVEV2d1ZXQmRlVU5pNUJCTWo1ZnU5?=
 =?utf-8?B?VkNkQzZ4aUQzdWhLaVpFZ3lFZ0MrUFhtMlk1WGJUelNYc1JOR1l1TlpzY042?=
 =?utf-8?B?TEFTYTFKTXRUcEMzZEVsaEtNSnRIWGl3NHFiN01XN3VRYi84L0lzbktmWExV?=
 =?utf-8?B?K2hMeHpUUW53cEdBVlBDVTlzcXU1azE4UVBRTnFDVWxpZW1tM1NEWU5lVmRR?=
 =?utf-8?B?UCtjV0J5TEpya05BazNxa1RoSGlEREJzRVdUMmcxZEsxOVNUdjliN2Nvcm1w?=
 =?utf-8?B?UENYTms0dXVscHBCZUpvSmJLSFBTRlp2ZUhyTnhnRlRmV3BnSTFEQndIU0x5?=
 =?utf-8?B?dnU0ckMrd2l5cTIydGRUZVZlR1pWdi90c2ZqSVhrNURnOHhJdlNNanU3MFRK?=
 =?utf-8?B?V3JEQjJ4TGVtcU5WUW5HUVlvL0ZtYkxlZFl2QlNnRWdRQXlTT0JDcS9rSncr?=
 =?utf-8?B?RE4veFZaeVdJYXJEOU5WOUJzNWFlcVpkQkhQa2lQaFF4SnJmTkM4L0QxQkRo?=
 =?utf-8?B?SjVWZWJlMzAra2hob3VmdDg4Slk2dTVhZnlKT2s5cjNxV3pHQ1NsbFBrTnN1?=
 =?utf-8?B?NWVmZW43dSswenRZRktuWHplVjhncEZDYU44dXBreEZFa2JzcS8zeDZCeEt1?=
 =?utf-8?B?ZE5ndy9zdzNGQTgya3NpbEFRdHAvUFBranM5Y2FIKzRSR3hTQ2JZK21wY0ZH?=
 =?utf-8?B?QTg4V3V6emtOT3hseU1wOHZJZDBVMHVpZTZoWlVTQXFlbHhZT01NdHd6SFJC?=
 =?utf-8?B?MUVEUDhvd0NzN0czR3RFSU5vOUxWMERMY0tLZzl4VVNaaWZhMW1SSDM5c1Zp?=
 =?utf-8?Q?IvqQNM29zpsednOL1bh2xRA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34A2582BF99E8A469951402D92E2C5E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 216cce09-6e80-4076-b291-08da95601f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 08:15:29.6243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9fSjW/naznUbAZDjH9hRQ6/DLZUy481OpsBmHCF+dDdEY4ebpQXUk9vVraDArnUOl43F5uhzAjOoe6vnf82cQvpf5heYuLLL79rVsz9AkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1971
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
Cc: "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA5LzIwMjIgw6AgMDk6NDAsIERpc2hhIEdvZWwgYSDDqWNyaXTCoDoNCj4gVGhl
cmUgd2VyZSBjb21taXRzIHdoaWNoIGRpZCBjb2RlIHJlZmFjdG9yaW5nIGFuZCBjb252ZXJ0aW5n
IHNvbWUgb2Yga3ZtDQo+IGFzc2VtYmx5IHJvdXRpbmVzIHRvIEMuIFdoZW4gZG9pbmcgaXQsIG1h
bnkgb2YgdGhlIGFzbS1vZmZzZXQgbWFjcm8NCj4gZGVmaW5pdGlvbnMgd2VyZSBtaXNzZWQgdG8g
cmVtb3ZlLiBQYXRjaHNldCBoZXJlIHJlbW92ZXMgdGhvc2UuDQo+IA0KPiBQYXRjaDEgcmVtb3Zl
cyB1c2FnZSBvZiBLVk1fVExCX1NFVFMgbWFjcm8gZnJvbSB0aGUgYXNtLW9mZnNldA0KPiANCj4g
UGF0Y2gyIHJlbW92ZXMgS1ZNX1JBRElYIG1hY3JvIGZyb20gdGhlIGFzbS1vZmZzZXQuYw0KPiAN
Cj4gUGF0Y2gzIHJlbW92ZXMgYSBzZXQgb2YgdW51c2VkIGt2bSB2Y3B1IGFuZCBoc3RhdGUgbWFj
cm9zIGZyb20gdGhlDQo+IGFzbS1vZmZzZXQuYw0KPiANCj4gUGF0Y2g0IHJlbW92ZXMgdW51c2Vk
IEhTVEFURS9ob3N0X21tY3IgcmVmZXJlbmNlcyBmb3IgTU1DUjMvU0lFUjIvU0lFUjMNCg0KSSB0
aGluayB5b3UgY2FuIHNxdWFzaCBhbGwgY2hhbmdlcyB0byBhc20tb2Zmc2V0cy5jIGludG8gYSBz
aW5nbGUgcGF0Y2guDQpUaGUgRml4ZXM6IHRhZ3MgYXJlIHVucmVsZXZhbnQsIHlvdSBhcmUgbm90
IGZpeGluZyBhIHJlYWwgYnVnLCBpdCdzIGp1c3QgDQphIGNsZWFudXAuDQoNClRoZW4gaGF2ZSBh
IHNlY29uZCBwYXRjaCB0aGF0IHJlZHVjZXMgdGhlIHNpemUgb2YgaG9zdF9tbWNyW10gaW4gDQpr
dm1wcGNfaG9zdF9zdGF0ZSBzdHJ1Y3QuDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBM
aW5rIHRvIHRoZSBzY3JpcHQgdXNlZCB0byBnZXQgdW51c2VkIG1hY3JvOg0KPiBodHRwczovL2dp
dGh1Yi5jb20vbWFkZHkta2VybmVsZGV2L3NjcmlwdHMvYmxvYi9tYXN0ZXIvY2hlY2tfYXNtLW9m
ZnNldC5zaA0KPiANCj4gTGluayB0byBsaW51eC1jaSBqb2IgcmVzdWx0Og0KPiBodHRwczovL2dp
dGh1Yi5jb20vZGlzZ29lbC9saW51eC1jaS9hY3Rpb25zDQo+IA0KPiBEaXNoYSBHb2VsICgzKToN
Cj4gICAgcG93ZXJwYy9hc20tb2Zmc2V0OiBSZW1vdmUgdW51c2VkIEtWTV9UTEJfU0VUUyBtYWNy
b3MNCj4gICAgcG93ZXJwYy9hc20tb2Zmc2V0OiBSZW1vdmUgdW51c2VkIEtWTV9SQURJWCBtYWNy
b3MNCj4gICAgcG93ZXJwYy9rdm06IFJlbW92ZSB1bnVzZWQgbWFjcm9zIGZyb20gYXNtLW9mZnNl
dA0KPiANCj4gS2Fqb2wgSmFpbiAoMSk6DQo+ICAgIHBvd2VycGMva3ZtOiBSZW1vdmUgdW51c2Vk
IHJlZmVyZW5jZXMgZm9yIE1NQ1IzL1NJRVIyL1NJRVIzIHJlZ2lzdGVycw0KPiANCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2Jvb2szc19hc20uaCB8ICAyICstDQo+ICAgYXJjaC9w
b3dlcnBjL2tlcm5lbC9hc20tb2Zmc2V0cy5jICAgICAgICAgfCAyNSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDI2IGRlbGV0aW9u
cygtKQ0KPiA=
