Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF679519E48
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 13:43:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtZjN5vSCz3bd8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 21:43:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::600;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtZhw1B0yz3bbV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 21:43:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5cVvaZJaqqpBDkzEAMtX12BcpFpxnke0lc1kvlYBvy/xIQb5/KO/JufQucZ3KZ68CggzPk2vXh8/sl6nZR3zZuxKtdRrgMYuytvGaVd0+0dsUkdTCeYcq1HIfHxl4EhUAgrm8/xCHLKbIEnQvqNIqCA0HjBSF6xB8dRO4tlvd+AC+HIKCNocaRlpkqrTxAKNEGPct5wAoH3uTYJuI8XbN7MbTHZx4B0h8GFL3gNr5+Z/YugglNIggOfw9OWpvay8mN1MUCzeneGOjbTPdlj5FlCNF8h3WEsJD6RBAcwmtamZO7+fm32wOKUdz0gFaS4ps1BY2POn9TbUK9Cbg04ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dACDaUka53SaiA3gF8dxskCZP9GIsufSSk/0Uv2e/FE=;
 b=T/bjIFdUf7X/7GtIgIIpR6KbdHb/4P4niZun1ap4oxLJ8Wv5MD5KW9RUww1VbLuaD4bu4nV1AJlV/3ufPRHfK5RTF5bLiD9aded3nuh4nstYOO/rkREd83ONDdEyypuvof18lh+6dl7E3cHm59b+Cq0nN2lGdNSS6wUQRL770Y4ju84yxZWbuXjJTAb5QEOP/K8v5WILhjrPhDuFZN2E2wXHaBU9MME/oSU8p12objfAtSC6ep/ur5VL1+ez80p/GQxqdQ1pPSxarBY2q2cuPgEzKwPOT43dn9gDiMcCv2RfCGq/gDiBp9PgkTd28XgvqEtqDH3IbY/iTdyKqB+hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2347.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 11:43:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 11:43:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v1 06/22] powerpc/ftrace: Inline ftrace_modify_code()
Thread-Topic: [PATCH v1 06/22] powerpc/ftrace: Inline ftrace_modify_code()
Thread-Index: AQHYP4vJ69BycAo/wk2nwxR2peJst6z1Vg0AgBmDFgA=
Date: Wed, 4 May 2022 11:43:05 +0000
Message-ID: <1bacf92b-2ad1-9ebe-f332-4ee9dd147088@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <3b651381f4c53988ede62f4a1505e7e8ccab56b4.1648131740.git.christophe.leroy@csgroup.eu>
 <1650261933.e8kr43zvw0.naveen@linux.ibm.com>
In-Reply-To: <1650261933.e8kr43zvw0.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da137498-463a-4c5a-e139-08da2dc3409d
x-ms-traffictypediagnostic: MRZP264MB2347:EE_
x-microsoft-antispam-prvs: <MRZP264MB23471ED0AB8D90B9013FA5A5EDC39@MRZP264MB2347.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zJFJPkwV8vZpdDuJsPF+IiDVSEzGb1ZHiLsNgJko/9hPz0+p7QH6Qu61lReaRDdimz/UMLtCk1xobKDcTI0Wf31O+HwqlYRCK+kv1HtdNwVCXjcs0CUokR8qRAhm3pXRv5SlICzIVgWok9MJRReqE1o0tSPSKMZA6ts+JQk7rNCl6UWTPfDTiSqhmTU4H3dEtXwMRb12jbqGCy+/1CRYfyc5dCvUh4q8StD25WgE+uvOU7JSgLnA5NF0CQb2ZAGMmcIZPTTOqLlZ+NtI6t2znOMnS+jlwOKrIKVXvQ9DY5ZdkRPl8hqTDSfzFHNI1kW9YsElAuNj9n0inLq2U3RwqgpByruh141zHyfnvIL7qyEV7WRLOX3X531zgMGC6ZV16yTZK4H47XNmNbYJMus3NDj4StJelfLpGuvBNZxq8Im5/9dY5qAOR73DjuWN1dJrZDOJkddjZmgwafIywE2CQsnENIJyf2l4zYewbgCkZMBI6LmwWRmD4LaRvcFaGaRVxjJbt3i1/uOeGGdzhCutSwRDVsfd6SSMudJo71HKHx3GhMKkeVcKhYWEiHfX9XZY3LRthNo5m0j1xsnAwyAgkf0nZAR+eAWR4z1GZfvq2D/UGBq2rN4LjfGOSjt6svBfUbVY50XZxyNWnok4Pj8UInwEW6mT5C+NnhUlFc0ybJ4+4yhBiXcA2lWoNqtDpYu5eWM9941bPTj9b9izMXwHByuwRNCBQnaS0CXow/SirXzEb9ThQXmvkGb654WVSM898ytMOJA5c8Ipog1R6aq+wA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66574015)(36756003)(6506007)(2616005)(26005)(6512007)(2906002)(122000001)(38100700002)(38070700005)(83380400001)(5660300002)(66556008)(54906003)(66476007)(66946007)(76116006)(91956017)(316002)(66446008)(110136005)(8676002)(8936002)(4326008)(31686004)(64756008)(508600001)(6486002)(44832011)(86362001)(31696002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGxqKzNGSDJXd3lmbWZmSjJpRTdVVEJaU3VBL1Zqb29QSk5PZFNvWU5iRjhJ?=
 =?utf-8?B?WWlqbWRwR3ltQzBhZncyakxvSEdQUTlRZzZ0VjdMRE1mSDlpL2dtQ0tFM2wr?=
 =?utf-8?B?YWZPWHM5SjVSSkJidGZnQkpycit3R2xiTlI0dy91b2l1ZUluRmJuL3VVb29P?=
 =?utf-8?B?OXJEUGNteGR2K1ROTXVoOEhkZkNzVFM5VWlSK3JKemFYR0RPOHdYZHZ2TEdX?=
 =?utf-8?B?RHlhRXFqMVBUaXAvWHoreE9tU05DMUdudTU1MlZsaDhNUENnYzU4SlE4OS83?=
 =?utf-8?B?cVB2RVQ4R0FWT3RCRTQvL1lsVVU5aEJxdlJibGVmMXlxRkltMXJ5azVadDVj?=
 =?utf-8?B?bW83RzlCVXRlM1lxTVZUUEFPTlViQ2pwZlpZVkJyNWl4Wkw2RFRkaXdxNVUr?=
 =?utf-8?B?N2ljeU9RQ3plUHNZMHN0SmZzZitkSitodHE1VDk3N29oY0J6K3hLL2FtcTBV?=
 =?utf-8?B?NnVOZFZtVFBaR1NBWFljZkZaV1ZGdzJFV3dpZEJsckdtYkdFWVEzeTVSd0JT?=
 =?utf-8?B?cDFJVUhVTkJoMk0wNm1hUXlOMUtQYk1SU1FKd05WSVJIY25TYWVSTlA3TjZO?=
 =?utf-8?B?SEU3cmlKZUV2dXhOK2ZZUTJES0pKbHRpRStLc3prZjgveXU0U0lQSXBpU1JZ?=
 =?utf-8?B?RHRhYjRya1NJZjFEZVFOV2MxcWVoZzQvSEw0ZTdmd3cxUlBpaThjRENpb2JG?=
 =?utf-8?B?Y2FDZG9McDNZejFBNDU3OEtPQTl4ZXpCalhwUGhhWkUzRVFOOHZjUDMvSW5i?=
 =?utf-8?B?cGEzU0tuOE1NdHZCajBuZkQ2SERpK1RpY2xzbWxvWXVWcWVqQkc4SDhxYUdu?=
 =?utf-8?B?ckJ5a3UxY25TdDl6NnQwQ0NvMFBJazg1LzJtMUc5c0E3eUpPbVkvVnVvVTNW?=
 =?utf-8?B?bFdCK01ub3ZxMmlNS2JoejNNZ3dGcXI4Wmd1ak5hWDRoSE01Y1k2NlNYTUh0?=
 =?utf-8?B?UnRyUVpVYS81bk8zd1UvMUt5RXNMSE1hcFRlZm5QNVl2VWVhVU93QXlMcCs5?=
 =?utf-8?B?ajd3aWZGNTRDcDZVRmpjNnZqUmhrS1NFYnU5SmRmS2o2Sy9VaWk3VmRBSDV2?=
 =?utf-8?B?eDJwcnNWeTBBS29SQmJGSlRvc3VhUTFGeTBJTzdoNGpxZStwYUpuckxwTVRS?=
 =?utf-8?B?YVVNczlxUmZQeDBzTmNDaExjYUdZMS9hdmpYVjlJeDlrZjdaRXNwR3lOYmRE?=
 =?utf-8?B?Y1grSHhKdHRXaFdXd1NQQ01vZEJEVkMwQWVrajR5RmxNc21RYmM4Q084TWhT?=
 =?utf-8?B?THZCeTkzZjFSeFNLWTgvVFM2RlVGRENlcFA1aHQvMiszOWFrUmhpOC9sbnZL?=
 =?utf-8?B?ZWhRa2hjM2pGVUF2WWl0V3ZmREltdkJBcWpjZ2Vyd1RQWWYvUG9sdUhUbHg3?=
 =?utf-8?B?WGlpS050VDl4bWt1Q2FqZEF5cW0xaFY1djQ4czZESGNtOEJlcDhsYWoweEdX?=
 =?utf-8?B?UWh4ckw0cG9hZURBbzl2UldvY04xL0lhWFpxMzJMNmVMMDVvak9KblZHZ0pR?=
 =?utf-8?B?dHBrRmZGQnlNZXFERGV2bTRtZ29zb0xCcWhqZG1tZDJNd3dWeVRxTHNqUTk0?=
 =?utf-8?B?VlU5dnRUZkxURDI0TkN2MUZGcFo3cysyQVdmYU1YdEp0QllHU0MrUVpJbGor?=
 =?utf-8?B?RjU0UTJKNXh5M2NuRk1ZYlFpQ1VHbHFRclVKaWRkeW8xOHRFNmpHT0RQUEdM?=
 =?utf-8?B?TmV3Vi9VZ0lDNW95ZEJsRmx1THlCajg3bmVsbnJ6aUpnaUFHbERRdnNneU1o?=
 =?utf-8?B?WVhlcVhGcEZQc0VBdnphWG5pbnQzWlI1SFM5OG5vNCtWazNwU3l0cDAySFFE?=
 =?utf-8?B?cmU2dit5VVA3QytNbXZnbFhsRnFyUCt6MFV3SzhrV096QTVScDhFblpjQW1C?=
 =?utf-8?B?REpXZWNpVG1QVjl0Z1FoV3JEbTE2VG1JRkdRTWh4bnllYVJEelR3RzA3dy9X?=
 =?utf-8?B?WDhGNkF5azlicWpzZDhJR2RiNEdKR21QcHZIcVpRQmwxMjBCSFNvdkRtTldi?=
 =?utf-8?B?OEowL1dNU3lZT08xd2x4RmJETDlocjUxMGJ5NjJLNDNNVWhYZ0NkT3JaN0Mr?=
 =?utf-8?B?UHVmZ3BVcURGOS81LzJzWWQ3dHRRK082T3FldXYxQU9EVjNYQ2xzazAyK2NN?=
 =?utf-8?B?alE2NjlZdUJlcXdxNzMxc200MTRySlU3Q3luWG5RdTR3RFhaS3lUUUpIaHAw?=
 =?utf-8?B?Szh2azgxa29lRzVjdnNLN2RNQkc5UjB0VmJQZXNMeTVpc01XeFJhSlBoZFlP?=
 =?utf-8?B?UzMwV2htTUF0MkZobFFkdjByYTVHZ2Y3Y0RMdDhaVGJNSFl4V3g5NXJiRHhC?=
 =?utf-8?B?eHljUzBMT2VRRHBDc0NzMzJaaXdIMlY0bVZYejl2WGRzZnFPNmFkMHdZRi9p?=
 =?utf-8?Q?K8xwp0VgphwoJjLdxn3KGvQIzR/RONDdDzSC5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2227DFFAE44586458481A87993B50D14@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da137498-463a-4c5a-e139-08da2dc3409d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 11:43:05.1839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLrfOVb8K8tsiZYNZRgKTnIn4zjCKMaRQNySOs66K9IXSFur4fLDzO2cPRwsRajJpJQuPQYtuAAcxIZUY24b3bo7cy3mmfHVpN6S70pd+O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2347
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA0LzIwMjIgw6AgMDg6MDcsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IElubGluaW5nIGZ0cmFjZV9tb2RpZnlfY29kZSgp
LCBpdCBpbmNyZWFzZXMgYSBiaXQgdGhlDQo+PiBzaXplIG9mIGZ0cmFjZSBjb2RlIGJ1dCBicmlu
Z3MgNSUgaW1wcm92bWVudCBvbiBmdHJhY2UNCj4+IGFjdGl2YXRpb24uDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0K
Pj4gLS0tDQo+PiDCoGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgfCAyICstDQo+
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIA0KPj4gYi9h
cmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiBpbmRleCA0MWM0NWI5YzdmMzku
Ljk4ZTgyZmE0OTgwZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2Uv
ZnRyYWNlLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMNCj4+
IEBAIC01Myw3ICs1Myw3IEBAIGZ0cmFjZV9jYWxsX3JlcGxhY2UodW5zaWduZWQgbG9uZyBpcCwg
dW5zaWduZWQgbG9uZyANCj4+IGFkZHIsIGludCBsaW5rKQ0KPj4gwqDCoMKgwqAgcmV0dXJuIG9w
Ow0KPj4gwqB9DQo+Pg0KPj4gLXN0YXRpYyBpbnQNCj4+ICtzdGF0aWMgaW5saW5lIGludA0KPj4g
wqBmdHJhY2VfbW9kaWZ5X2NvZGUodW5zaWduZWQgbG9uZyBpcCwgcHBjX2luc3RfdCBvbGQsIHBw
Y19pbnN0X3QgbmV3KQ0KPj4gwqB7DQo+PiDCoMKgwqDCoCBwcGNfaW5zdF90IHJlcGxhY2VkOw0K
PiANCj4gSSB0aG91Z2h0IGdjYyB3YXMgZnJlZSB0byBpbmxpbmUgZnVuY3Rpb25zIHdpdGhvdXQg
dGhlIG5lZWQgZm9yIA0KPiAnaW5saW5lJy4gRG9uJ3QgeW91IHNlZSB0aGlzIGJlaW5nIGlubGlu
ZWQgb3RoZXJ3aXNlPw0KDQpZZXAsIGdjYyBpcyBmcmVlIHRvIGlubGluZSwgYnV0IGluIHRoYXQg
Y2FzZSBpdCBkb2Vzbid0IGlubGluZSB1bmxlc3MgDQp5b3Ugc3VnZ2VzdCBpdCB0byBkbyBzby4N
Cg0KPiANCj4gT24gdGhlIGZsaXAgc2lkZSwgZG9uJ3Qgd2UgbmVlZCBfX2Fsd2F5c19pbmxpbmUg
aWYgd2Ugd2FudCB0byBmb3JjZSANCj4gaW5saW5pbmc/DQoNClRoZSBxdWVzdGlvbiBpcywgZG8g
d2Ugd2FudCB0byBmb3JjZSBpbmxpbmluZywgZXZlbiB3aXRoIA0KQ09ORklHX0NDX09QVElNSVpF
X0ZPUl9TSVpFID8NCg0KV2l0aCAnaW5saW5lJywgZ2NjIHNlZW1zIHRvIG5vdyBpbmxpbmUgaXQg
d2l0aCANCkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfU1BFRUQgYW5kIHN0aWxsIGtlZXAgaXQgb3V0
IG9mIGxpbmUgd2l0aCANCkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRS4NCg0KQ2hyaXN0b3Bo
ZQ==
