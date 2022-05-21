Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BC52FA5D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 11:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4z826bJ3z3cd5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 19:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4z7W6kLyz30RP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 19:39:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oa3HwM/RUAZGv+K7wRxF8aY8So9+ehKDhc+6Yi/f2JS+WItDI2ZWsWVEtuEtqC2aA7sRr0jj+6LZqpv9lBUDNS+O2nQc9szeVH5l2yz+7GTX/NQ+8rF19TV5gR/0PTxS1sORID5QoRPtcXlbzfU/2/yxgIKjG7aXPR/a80Qra5MkUcHspa0IakOj3CrveI3cwo9REchLBVLQzbM6UKB1g1dHMeJvc5/eZZv6MRWg9PSDK9xB0ve7AH0rtXg4eDiWfp4iLw4N1G/ng/GFqjXhtAMUVPoaC+Ghxqj+onieypGz2Svr+w7AoAmwZ2Me+8MlnaMpDHDRxhdrGrmvV+/YnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOoblDFttOBCeTLk3wf2KJIPO7zvP2+1YVGPhq0DFAw=;
 b=J8P2hwlkLoJoowEVpzRVxkn+24EBqiI6FybuxU5KQRg1WKXvPxZto48uZfpYBR6AQYmYHoDVECCESc2AEGAK1mdaYjPmjR8v3IfP3m+Hef+shOaOczbNScAHCxOBCt28hGdqthNFAbYH1lWeqcyOC5Y4x35LxjhbI8DNYFNDwUSyKmb1yzehk/TxXJkJfGWtWzR/wunYCsYjy3mH81O617m905ZVo2t6CGxeLRHiEt5kO2OReI7Fvgghb5G0q1CarwAL915UK5XoY/y5TxkNxAwb9DWb03BsKa6sr13vVB2Cnl4SXZ9xmkoxtWy21d6kZ8Z3L98SeFvJX52FHvGpEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2603.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Sat, 21 May
 2022 09:38:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.019; Sat, 21 May 2022
 09:38:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzS/yUAgAJH8wCARmM5AIAABXAAgA3HzIA=
Date: Sat, 21 May 2022 09:38:35 +0000
Message-ID: <bedd240b-d5b1-72f9-156d-96d160f180d4@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
 <b8fac6e2-c117-86cf-2901-5ae0852ca403@csgroup.eu>
 <20220512151206.dphxz5jyeshwc4jb@treble>
In-Reply-To: <20220512151206.dphxz5jyeshwc4jb@treble>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71455fcd-ff7c-4e19-80b5-08da3b0dad52
x-ms-traffictypediagnostic: MRZP264MB2603:EE_
x-microsoft-antispam-prvs: <MRZP264MB2603F1127EC73E5DA7E96878EDD29@MRZP264MB2603.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HEPJlvjhknNS2ixyMnlfMs7SbVpyLylrA7c8IT4BkbKylSd2Dumn8xapx4gQaAwqHI1p1WXbK8Ub52h8rvSN0NTDhoOjmY119Jikb35FPbpM1bXPBAfsziT0z7mS88if9luzxM+6OMVJWdjJ9XMXOiVMK/x7O+jKMvTjHo6gcScS/EFOXd5Jr/VxPhKTGT6D4NC3xiSBuOVOaS5UBC/S6S48+9c7nfyM6EIrbH6B3hFekaVFn65dxA/QTLYPaeF4wC22qhrczgW3sws8zbNlEAvZienDf5C/aqgt4Ptj130ZJVzV+1CNc2THcr1L1PNASJm30QMHJ6jap894QtxhjqqLDlJ81cb/4SRMTzJffG5W4ndF+UeCLnUwLod9T1ehKwQMCu7qDc+37Ed0N3QE4N6RvFcPMnQGYWtWv+SAG++mZ0B1wkPoDOUheKYqY/NdOZ+940JwKB5569LKmE19aQGSQ+vESHIokH2BvkOm7risN7k2Oyhkl0RgzHop7nAsjYhMfj+uWrTry9yeWMQ0dFJ3t3GcHLlBpTfb5mN/iddl2/Vz0WgCKFtyGTLfaeAUd8xhZQEtBZ6rO96WR0aXzzK8FdJ5Mt2aTorI0hXM8J059TXKl/EDI0qUfUelgb/kBmAvmX0z5xt59PRrYOM9HiBsxKhRCOdE/o7Wb68yJNFB4E9UTQGQOkw4/i1H5NluzvzUIDV16Pra5h1kZf0wqaVK5EdNej65knkMA9Ggl9agaiYCxWjMhIFJltFasu+aS7ziPYjSIVKhUP4gPDCB3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(64756008)(66556008)(66446008)(66476007)(66946007)(4326008)(91956017)(71200400001)(6916009)(316002)(54906003)(76116006)(86362001)(31686004)(6506007)(6512007)(31696002)(26005)(122000001)(44832011)(508600001)(6486002)(66574015)(186003)(2616005)(83380400001)(36756003)(38070700005)(38100700002)(2906002)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDFQWGhjSm1lNytXTFVvY0pjMUMvZDViblY4NklwQmFDS0l5VEo5RURtM2JN?=
 =?utf-8?B?cFFUVHZNTm1pWlVpTUl3eFJHeXBxZjZIdDFmUzNNbnkvcDhMeUZ1S3I0TnVO?=
 =?utf-8?B?UTF4dStNeFl3QzhnZFFLemhIcTNjNkc2dStiL2tRRDFVMWdLMWUrY3dOY3ht?=
 =?utf-8?B?eThaMHI5Ky9pSEdwb0MzczRsUnRMREp1UVJGQS9lV2NmeVM0NUFiN3dwOWxt?=
 =?utf-8?B?ejlnV3hPd2xDQ3ByUjRMd2RsOSs1MTc5dVN0WXVkamtLcFZHVVJtOUdmeHJM?=
 =?utf-8?B?bmIrZHV3MGlVcExCVmdTQzVLYlova2tZTUViNllBL0c4N3BETUlrNUdnTTY5?=
 =?utf-8?B?R1hRZGxkR01JOW5IaUNQNmlYK25CMDZXRk5uNHB4L0RpeUhSKzE2M1BJbVVi?=
 =?utf-8?B?TzhnMVhXSXRFTE5FOHV2UDZhVDNBeklaUFlJeE5hY2NPTGpWcTBtL3V6Z1ZN?=
 =?utf-8?B?RXA1WkRZL2Z4cUVSSzhlZW4vcWhkRGFqcU5rTC9VbUh1Y1hnVzYwdUhPNWlC?=
 =?utf-8?B?NDVFd0Fnc1VZYlkvcG9wbGZWRDFrWlhMRGRydmtKYU4zSUcrakEvTG9QdGUr?=
 =?utf-8?B?LzBJMkJlZ3hJM3pTUS8zZGs5T3hOcW9XWUh4N2QyS2MyUnZ1ejB1T3VsNWpY?=
 =?utf-8?B?N2xsTDZ0WkpWMzdQc0JsZ0lLR1JDaHNoVHF4VHY0UGYyRnR0aU1TMlJxZTZY?=
 =?utf-8?B?bDN4WFBrdW94b1dVM3dRUFNoZjdjc2gweFNNUXJ1QUN1cEUxcVZ0a3NlVVFC?=
 =?utf-8?B?U1FYNjZGa2orREtZZ1N2TW1IaUI4WWtLaWN2UEtsOHcrZW0wS0NKREc1YUIw?=
 =?utf-8?B?VGtBUW5vb0xkdE1ZUSt6SnBJTlhtTyszVElOMDR6ZE0rWVkvMFEyZlpiYmxG?=
 =?utf-8?B?ZkRjUTJGTHo5ZXRydWJUZHROT0tpMzZIbHdQWXNKQzlNM3ZwVWp4RE4wMTgz?=
 =?utf-8?B?cU9aTGRORU5kZkUzT242cFNoS0s2U0tRVm9hd3QyUXkyS0NZdkpabkl6Tmpm?=
 =?utf-8?B?V2dSTENvVlRmTTQ2dVJlODJ0cEVxMW9qUjAybFNuUGRreStwRzRycDNZdFJU?=
 =?utf-8?B?YWhDK3o4SThPOW9MaXlHNkdXbzZwTENHRWdRMk5wRUtlZ2tkSEJOeE5kZSts?=
 =?utf-8?B?cGpudGdKcGhtV2JwcnM4eEN6NFNTUXFkb2x4ei9zOGFjNm5lM3VhNUVtT0FP?=
 =?utf-8?B?UzhCUCtxek04Sm52ZVhERU5XWlpxVXJ4VnhrYzI3MnpObkt5akFXVW9kQjZX?=
 =?utf-8?B?NzBYQW5IaWUyRHlBanBKK3RQSXpBVHZFNEhsd1FGZEprR2VVWk91WXZKQjZx?=
 =?utf-8?B?UXB4KzV0ZHNrNUZseURMRVd1dU5MVWdzRGhxR3NJUUJtYjJ1RzIrVDZyYVls?=
 =?utf-8?B?YjE3Mm5SVTRVSk1wR2V6MFk2a0xDVHVCbVBIYWZPaGRUaEpqQjFYb2RsZzlN?=
 =?utf-8?B?WG9uUUtJTjZkTjZudGt1SEhPaWVCQ2NpQXNxclNMZGFyamVlMlE0Tkg5d0Nt?=
 =?utf-8?B?MERCVTY3d3p2TGlPamFYaFpGWGxpeWoycTdIbk9rdFhLMlJpRU52QU43OEZC?=
 =?utf-8?B?NkI4NHB4dk1lNStRdHJrWnBjS2dzMWhBMzNpYTdPY0IxejRrcW9FZlNwbnJv?=
 =?utf-8?B?K2pjeFFUL3lSVW0wOVEzdjRRSEYrZllhVURmcVBjZTNvbnNuNXlvTG01bTVT?=
 =?utf-8?B?cHlvM2QxTE1VU3NWNmc2SzFYeEI5Szl3aktOSFN2Qy9TWjNhbzY4dkErVHow?=
 =?utf-8?B?TVBjZ2lnbldvWktUenBSY09oZ1FDaXJESC92bUZMVzhIdm1KNE9kN0VybUNF?=
 =?utf-8?B?SDA4L1Rka1o1ZzBuL0NvN1lDRlZJVVY3NHB0QVhOVGRKS2phRWNoenl0UGtG?=
 =?utf-8?B?UFhKZjJNa2lydlVpRGNZUjBFa1gyVHZYc1Q3SWtxL09oQXlTelUxSmNRMEdM?=
 =?utf-8?B?ZTVmVnBzUjI2aFZqeUpXU2IxeGlzbmZncmw2bW9Pb0VHZUpHa3kxaStIM0tV?=
 =?utf-8?B?aXQ4T2hFN0FoTnVXdldPZWZFQjNka1hueUdSYkM4azIrUStpNVN0WldLRHlW?=
 =?utf-8?B?KzNtdGpzaGFCV0QzYzgrNXBnTmJoMHVJWStZSDcwSWlhcjExaHlBMk1ucGVK?=
 =?utf-8?B?SzRrK2M5QkZWU1VSSzAyUjNxZS9NNkFMN3E3bEhZNEY1Y0poRzdJcUtVVVZT?=
 =?utf-8?B?cE1TTnBCY00xYlJvNzhnSy80Q01uN3AxZjd2QW9YSTBpUXRrUGgrNkVlVy80?=
 =?utf-8?B?ZHA2NmxudEFFdTl4YjR6ZkxIaS9RYWNvZHE2NTU0N0hacytlekpPVGN4cmhF?=
 =?utf-8?B?QytISW5UQUxrdUZ1VjlweXFkTkMrNjZsWWI5NjVSUGdKVmhxTzZGdVVaOXIy?=
 =?utf-8?Q?9oPZNPUGoJdrxJwTJS/7qMMdYKTckqy4qbA5Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59FD544E88CFDF41AB96E7573AF0C44B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 71455fcd-ff7c-4e19-80b5-08da3b0dad52
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2022 09:38:35.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dunn6jY2AS0GO5p5NUIRFC0P8gSt0hd1U4AvvLJeb7Br4hYTOIQfm3AP/1OnnAEl7ydW/vBLNQ3TOecZTIoyQmALqZeSFjaAMFp2+kRF9GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2603
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMTIvMDUvMjAyMiDDoCAxNzoxMiwgSm9zaCBQb2ltYm9ldWYgYSDDqWNyaXTCoDoNCj4gT24g
VGh1LCBNYXkgMTIsIDIwMjIgYXQgMDI6NTI6NDBQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+IEhpIEpvc2gsDQo+Pg0KPj4gTGUgMjgvMDMvMjAyMiDDoCAyMTo1OSwgSm9zaCBQ
b2ltYm9ldWYgYSDDqWNyaXQgOg0KPj4+IE9uIFN1biwgTWFyIDI3LCAyMDIyIGF0IDA5OjA5OjIw
QU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+IFdoYXQgYXJlIGN1cnJlbnQg
d29ya3MgaW4gcHJvZ3Jlc3Mgb24gb2JqdG9vbCA/IFNob3VsZCBJIHdhaXQgSm9zaCdzDQo+Pj4+
IGNoYW5nZXMgYmVmb3JlIHN0YXJ0aW5nIGxvb2tpbmcgYXQgYWxsIHRoaXMgPyBTaG91bGQgSSB3
YWl0IGZvciBhbnl0aGluZw0KPj4+PiBlbHNlID8NCj4+Pg0KPj4+IEknbSBub3QgbWFraW5nIGFu
eSBtYWpvciBjaGFuZ2VzIHRvIHRoZSBjb2RlLCBqdXN0IHNodWZmbGluZyB0aGluZ3MNCj4+PiBh
cm91bmQgdG8gbWFrZSB0aGUgaW50ZXJmYWNlIG1vcmUgbW9kdWxhci4gIEkgaG9wZSB0byBoYXZl
IHNvbWV0aGluZw0KPj4+IHNvb24gKHRoaXMgd2VlaykuICBQZXRlciByZWNlbnRseSBhZGRlZCBh
IGJpZyBmZWF0dXJlIChJbnRlbCBJQlQpIHdoaWNoDQo+Pj4gaXMgYWxyZWFkeSBpbiAtbmV4dC4N
Cj4+Pg0KPj4NCj4+IFdlcmUgeW91IGFibGUgdG8gc2VuZCBvdXQgc29tZXRoaW5nID8NCj4gDQo+
IFllcywgdGhlIG9ianRvb2wgcmV3cml0ZSBpcyBub3cgaW4gdGlwL29ianRvb2wvY29yZSBhbmQg
bGludXgtbmV4dC4NCg0KTmljZS4NCg0KSSBnYXZlIGl0IGEgdHJ5IHRoaXMgbW9ybmluZywgSSBz
ZWxlY3RlZCBIQVZFX09CSlRPT0wgYW5kIA0KSEFWRV9PQkpUT09MX01DT1VOVCBmcm9tIGFyY2gv
cG93ZXJwYy9LY29uZmlnDQoNCg0KU2VlbXMgbGlrZSB0aGVyZSBhcmUgc3RpbGwgc29tZSB4ODYg
YXJjaCBzcGVjaWZpYyBzdHVmZiBpbiBjb21tb24gY29tbW9uIA0KY29kZSBhbmQgSSBnZXQgdGhl
IGZvbGxvd2luZyBlcnJvcnMuDQoNCkFsc28sIGlzIGl0IG5vcm1hbCB0byBnZXQgdGhvc2UgZnVu
Y3Rpb25zIGJ1aWx0IGFsbHRob3VnaCBJIGhhdmUgbm90IA0Kc2VsZWN0ZWQgSEFWRV9TVEFDS19W
QUxJREFUSU9OID8NCg0KICAgQ0MgICAgICAvaG9tZS9jaGxlcm95L2xpbnV4LXBvd2VycGMvdG9v
bHMvb2JqdG9vbC9jaGVjay5vDQpjaGVjay5jOiBJbiBmdW5jdGlvbiAnaGFzX3ZhbGlkX3N0YWNr
X2ZyYW1lJzoNCmNoZWNrLmM6MjM2OTozMDogZXJyb3I6ICdDRklfQlAnIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIA0KZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ0NGSV9TUCc/DQogIDIz
NjkgfCAgICAgICAgIGlmIChjZmktPmNmYS5iYXNlID09IENGSV9CUCAmJg0KICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4NCiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQ0ZJX1NQDQpjaGVjay5jOjIzNjk6MzA6IG5vdGU6IGVhY2ggdW5kZWNs
YXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSANCmZvciBlYWNoIGZ1bmN0aW9u
IGl0IGFwcGVhcnMgaW4NCmNoZWNrLmM6MjM3MTo0NDogZXJyb3I6ICdDRklfUkEnIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIA0KZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ0NGSV9SMyc/
DQogIDIzNzEgfCAgICAgICAgICAgICBjaGVja19yZWdfZnJhbWVfcG9zKCZjZmktPnJlZ3NbQ0ZJ
X1JBXSwgDQotY2ZpLT5jZmEub2Zmc2V0ICsgOCkpDQogICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+DQogICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ0ZJX1IzDQpjaGVjay5jOiBJbiBmdW5jdGlv
biAndXBkYXRlX2NmaV9zdGF0ZSc6DQpjaGVjay5jOjI0OTk6NzA6IGVycm9yOiAnQ0ZJX0JQJyB1
bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyANCmZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdD
RklfU1AnPw0KICAyNDk5IHwgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG9wLT5zcmMucmVn
ID09IENGSV9TUCAmJiANCm9wLT5kZXN0LnJlZyA9PSBDRklfQlAgJiYNCiAgICAgICB8IA0KICAg
ICAgIF5+fn5+fg0KICAgICAgIHwgDQogICAgICAgQ0ZJX1NQDQptYWtlWzNdOiAqKiogWy9ob21l
L2NobGVyb3kvbGludXgtcG93ZXJwYy90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZDo5NzogDQov
aG9tZS9jaGxlcm95L2xpbnV4LXBvd2VycGMvdG9vbHMvb2JqdG9vbC9jaGVjay5vXSBFcnJvciAx
DQptYWtlWzJdOiAqKiogW01ha2VmaWxlOjU0OiANCi9ob21lL2NobGVyb3kvbGludXgtcG93ZXJw
Yy90b29scy9vYmp0b29sL29ianRvb2wtaW4ub10gRXJyb3IgMg0KbWFrZVsxXTogKioqIFtNYWtl
ZmlsZTo2OTogb2JqdG9vbF0gRXJyb3IgMg0KbWFrZTogKioqIFtNYWtlZmlsZToxMzM3OiB0b29s
cy9vYmp0b29sXSBFcnJvciAyDQoNCg0KV2hhdCB3b3VsZCBiZSB0aGUgYmVzdCBhcHByb2FjaCB0
byBmaXggdGhhdCA/DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ==
