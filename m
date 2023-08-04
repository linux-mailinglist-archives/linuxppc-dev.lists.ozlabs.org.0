Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AF77059A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 18:06:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=etgwgUie;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHVvG1x7nz3cVX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=etgwgUie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHVtJ4KdJz3c4b
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 02:05:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz+6cz73HDo1C91s5qd86ox7JBjv94ZmNhy8Iji2LzKbTgae4ZITh0gMHo5lnO7AXw98WhQslLO7qA2kgfwDZV9eCpJnem7cy6mi+I8rN1cfCwRB4Xk4hV++FiDQOdusQgK7M30AeunBYUL5adbPn2AzZNP7fWLXATo3UgwD7as1IwrMUa229I9BMcFPaUGmzui6ijvH+lu8Stm9RP3f8i2zeK3tTj00Me3ND5zZs3e//yycuSQ8jUHBRCOxrVNbqSdASr3s/Eno6kZ2UF2vTadQyh0ge14dQpykHGBRB1WkMpkHzdsumZiYdCbK4jX32cOyetPopS+lKObm0LniNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dop9P2dgkY/yYMWOTWKqP+VHfL8EwFmd+kdYkaTm1Yk=;
 b=SR4cQVPcsMm0DvxLlDeiyUyuI6rW6DMk/c/mucYQOzVrLX45+mekWaYLpLNzy8tz8NLsCcXwMdwgDcHWxhfZvCVoxPM9LSyq+XtuUgxcOPGe3DnOnphkLUCt2rpWlVVkQc50a056cDhq7QA1sj7KivfrO5tznVhJYCLM/DaJxdvmK9lzz1oua4jc3INfw3jl6pwpLe9ISV/tGKHADuQ43q6pi+tO+/GUR19RzJu6ASe9282DozMutcrbgcv92YbQMtgwIPNSdaq0x/tJNUZ+JgtROM1T2HC1jynM7ZaB/DV01NIyia7IQFO7+USB1Onqg0EPOaINMhxJ2xdemUVgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dop9P2dgkY/yYMWOTWKqP+VHfL8EwFmd+kdYkaTm1Yk=;
 b=etgwgUieXnTt6Lee2b8VoCZeeX5jf7qkFbBLylUsdNrv39BweugxOuEcoerB15wbL709P99UgbuVHvB9MU3DYhZQ9+FACrO0j4HiKISl+hKSlj1au/qXhFBc5do/lq2trbhv6qNZ4ka4OIHTcT80BRvXW3mEmGcbqNZZhqH3o21aCsBShW6jR69fh8+PVvMWojTiBXwIl0ztrc6sTs28FUCQCYG3s+WJgwfgr3OQIa1NaSHTtVzNdhyctkBbsl9x38cfFQJ/P5Ot/+xUDgg2QM6OvZ2jA8ecz8Mezmv/lq5Dme6vpQ/bEYo81hwHBI5cwyllPkGAZDHm0yplQqJ0ug==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 16:05:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 16:05:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "zhangyongle001@208suo.com" <zhangyongle001@208suo.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] floppy: ERROR: that open brace { should be on the
 previous line
Thread-Topic: [PATCH] floppy: ERROR: that open brace { should be on the
 previous line
Thread-Index: AQHZuvNjt4hs3H8U70SMv2cZJy1BoK/aZPuA
Date: Fri, 4 Aug 2023 16:05:09 +0000
Message-ID: <72a156e7-d15d-629e-9166-461622ad0f21@csgroup.eu>
References: <058c3448e220ee16bcb5e588271b685c@208suo.com>
In-Reply-To: <058c3448e220ee16bcb5e588271b685c@208suo.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3047:EE_
x-ms-office365-filtering-correlation-id: ba891879-1a4d-4dbe-92df-08db9504942a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hc+VdwcWwfp7q5gFq0KfiRb/t9eSYtlI0wmA4/JKKw6/jPXMWg+tgfaNzi5eVHSGLBF5S0cAHs0KjPptSiX/6gSomUgKLVdJiSOS3TenKV4gAOfq7S6t9ZhdS8gTJKtMNPFUOLMaSq1R+FwlxOeFmRXbo8MwnPJU2OVI4D/9e57LRzSarGof3O44+uDycysvj2dMSetY+hSokcCvu8ZHBPSLAm6zpTRvHowBIHk/sloY0rleaFAxySP2SfbMGqvv8BFKmmX/CJ+GXAIhrDnXEQ8APxqEiyRbagST3nSESxfkMt0UlMcxe36o47ZFWoNH9aCUURPpqmbzjFYvU6rPNO1noPxfjgMPDwbpV8QGlSvJhJ/0KgrOmUAKgMQIZNwDecNyuCoY7EfmisdIi5WqRUdjWQnmBA6Od6vz1dOZSlKdP6NUsLKbkvWEymCcywkFU+U8gSewMNfD/2M44vSW80xCrxuSukBxOWVTiFrkBKuY1VUrvE+mbWtkfJZ3qO+TYWJoCKEDFMZeMHBZDJaSSjcASkYY8Fs9vpXyJZsgeA2yroVH+SkZb7AZYMttW9/mqgA3v/gi916zjxJM8+e7Z1nsKAcgQ8GLvjtBIwi2RAW370i0qwJ1fqGoLHeOjPwAkQdJlQqCokvg6THp+3woetXZPSpdnGS2WYuG92qDubxxMrPTyfyh0Y6DQwo3Vtx1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(186006)(1800799003)(451199021)(91956017)(64756008)(31686004)(66556008)(66446008)(66476007)(66946007)(54906003)(110136005)(4326008)(76116006)(966005)(8936002)(316002)(478600001)(36756003)(6486002)(122000001)(41300700001)(38100700002)(71200400001)(38070700005)(2906002)(44832011)(6512007)(26005)(6506007)(8676002)(66574015)(5660300002)(31696002)(86362001)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MXc0STVLSEJiSEZCVW4xb1NvWDhmWFlzZjFCRXJIcFZDS2pQUlZRZ2VmS1NY?=
 =?utf-8?B?UjA0LzA2UjFVNFRPdmU4amFqVFN5bGlWdmFUZENsQU8wYnV3VWhzbHAyRFBm?=
 =?utf-8?B?YjlVb3I3dk5FbGtLKzliaTJwQUJTMW40V1VHT0E0cmx6VCtGQURwdEJUVTFZ?=
 =?utf-8?B?VW92NWtFRkJsd1grUDltU0FVcHpMNVp4elRPbFAyTWxPaHpTUGdZdGFRbEh4?=
 =?utf-8?B?cE1NQTJoSU1uYUEvUnFyOUJEU1M5MzJpcjhVUFczaEFuNHNoZm1zRkl5Sitp?=
 =?utf-8?B?ZlZ3MWlDazJMTGpXaVpvUGtnK1lERVh6N2JFa1ZRdnlEejVhRW9Ka05GU0pJ?=
 =?utf-8?B?UFIvUmVtRWRaVU9RWGsvakF4TVhjSWhYVWxodEtnRGZiME91ZDh1RWVqK0xk?=
 =?utf-8?B?YjN5dlE5dC9DVjRWdlBFcFU3ZTYydzdHb21sbEhTZWIxeG1DYTV1dGdiek9V?=
 =?utf-8?B?T1doUkl1UEYyUUFZVTJnKzJPa3dZbGxwTjZHcE02QmRRNEZHSVVFaC9BSFNz?=
 =?utf-8?B?Uk1KeHFPYkwvazZwTm9ZakJFOEhicGppZzZzQmlvY1hkOGI0VlRDcUZrZXFj?=
 =?utf-8?B?V0Y5VkR5S05hQXZTOXpMRE56YkJaT04rNnpNZVEyWHVNbm5xdEFPYUJyRFFp?=
 =?utf-8?B?TEYzWE96TlJhWE1xQ0R2Q2gwb2c2MTliYzBwaFVvS0VFRjlFVzBzQTJMY2I5?=
 =?utf-8?B?QlZLc3FyVzBZVU9mV1hqRGQ1UnhWNE5ZYTJiUG9tWWt5b1JqcWduLzhlWWxN?=
 =?utf-8?B?bzByNUxWSzAvcDBlR3J5Yi9xRFBFM3JVVUV6ZDdwRmFZdk1PV1FjUi9hUnFW?=
 =?utf-8?B?dHpSTGt4eW1vY2diMW14L0ppc1UyRURQa1dubW1KOGpTTGdGNzZUWStjNXd2?=
 =?utf-8?B?eXkwUlRiYnlLRzc4UWtmVEpQNUROakFKM20zR3VYS0plU3F2MmtheSs5eVpE?=
 =?utf-8?B?Z25EcEFwdHBrRWJKYmQzWWhNT25jbk1WYW5jeTFsY1RrYjYvWnl3WGIrd0ZV?=
 =?utf-8?B?ZU4xM1dXanJsUzZPWml1SUg3a1h0OWUzbFVoaU5GazZhUlRDdDdESFZHS0ds?=
 =?utf-8?B?MEd5cjhURi9Da3hYMjZ2ME1YcGl6VE9ndVRFVFB0eGhUcWFUNmpiUFd4Yy9s?=
 =?utf-8?B?c0VLOVJoT041NDNpSzlkd1Fmd2JxcFllaU5wSE85WUtqVVNnNWhwN25XOEFO?=
 =?utf-8?B?ckExb1ZoTk5xL3hLUm1UNWJjS2Zicy9DQlpHcFBuTFRHSm8reWpWYmhXU2lh?=
 =?utf-8?B?WWxsSDN5cWlrUGY1WExvalMzVGdDaFBUbU1vSm1STHdBUFlIVFlNcno5bmg0?=
 =?utf-8?B?and4Rk1CUlMzWWpPMm1nckNMd29YdkZEV005czBFSC9wK2lhYk1TSVlzbmVp?=
 =?utf-8?B?ZjZ3b3FTc1JlVzdRZ1N6b1gvK3MzdXRpVUtuektFUmpsMUVidEVhcmRRckxz?=
 =?utf-8?B?REdlTGVkT08vQ0NlcWJPN0FORFV1RytDRXRET1Vxd1dkZVdEYnR2QlMxdzVq?=
 =?utf-8?B?ZU5xZWVtZE9wZXQ3QnpVcjZycWQ2SWFBdEdNMTlTYXlyQnlVRnlOR2ZlNXNI?=
 =?utf-8?B?MG1kNWg0SkVpMk16bCtqNWZGSE90NExFZVVUZ1psRHpRMFBDSXBNY3lYOTQw?=
 =?utf-8?B?NmZqSUZmQy90NHZjUHkxSnYwL0pJa3d0eERDTENaZkp3MlpqR3duWWozdk1n?=
 =?utf-8?B?TVBIbk1lelpaSmFDd3hjSEpEZTk2K2RwaUVoUmlXYXlocEgvTVhyRTFhQWdh?=
 =?utf-8?B?OUExLzVObHEyOFZsV2FETjBWdjl0cVpPWEE4REpBaUxrZnhMc3RhVkUzbkEx?=
 =?utf-8?B?dXV2WllISzNFVXhqNWFvQU1sTTBSMm5vVTBRUmI2YXk4OFAxdnVoNlZQNjA4?=
 =?utf-8?B?OHhwR2huYmUzZjZZMGd5ZUpCemFBb2xQMlIvQzZIc0lNVFRkR3lNT1BWMFVq?=
 =?utf-8?B?eXpJbHI4aGtmeG1HUWFIYzYxdElyckVZVWlWS2JVOG5LYnRvUFpqcWpjOENv?=
 =?utf-8?B?MmlqUGtjMFdkdFB5bHBZQXhaSVhZc3RURzRFTTRicDZMT2RHQURMdWFqMTBV?=
 =?utf-8?B?b1BhR0RCT2JQZWZPb0xCOWRub1QrOG5JbWl5RVB0aUdtSDVqRFNjOWM5WU1M?=
 =?utf-8?B?cHM1QjdXbjM4dXhoRDZXcy9DNlN1cUJLcm9Ra2lYeXBnS0ZDWFhjRFhFSE54?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <258524C429137840BF11D901108B1370@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba891879-1a4d-4dbe-92df-08db9504942a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 16:05:10.1090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U1eOL6vLvj5lBNBRsxN5JC24TqbqBSmWh99TPR+cWJ2XcjovWqPRWjSOfuzkzYmjuphZCpw0aHtyY0PUK4VmfO+BY/8dS7XUv9l75ya8trk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3047
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNCkxlIDIwLzA3LzIwMjMgw6AgMTI6MTcsIHpoYW5neW9uZ2xlMDAxQDIwOHN1by5j
b20gYSDDqWNyaXTCoDoNCj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3Vycmll
cnMgZGUgemhhbmd5b25nbGUwMDFAMjA4c3VvLmNvbS4gDQo+IEQ/Y291dnJleiBwb3VycXVvaSBj
ZWNpIGVzdCBpbXBvcnRhbnQgPyANCj4gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uIF0NCj4gDQo+IEZpeCB0d29jZSBvY2N1cnJlbmNlcyBvZiB0aGUgY2hlY2tw
YXRjaC5wbCBlcnJvcjoNCj4gRVJST1I6IHRoYXQgb3BlbiBicmFjZSB7IHNob3VsZCBiZSBvbiB0
aGUgcHJldmlvdXMgbGluZQ0KDQoNCkNhbiB5b3UgcGxlYXNlIGV4cGxhaW4gdGhlIHB1cnBvc2Ug
b2YgdGhvc2UgY2hhbmdlcyA/IERvIHlvdSB1c2Ugc29tZSANCnRvb2xzIHRoYXQgZ2V0IGRpc3R1
cmJlZCBieSBzdWNoIGNvc21ldGljIGVycm9ycyA/IE90aGVyd2lzZSB3aGF0IGlzIA0KeW91ciBy
ZWFzb24gPw0KDQpXZSBkb24ndCBhY2NlcHQgc3VjaCBzdGFuZGVsb25lIG1pbm9yIGNvc21ldGlj
IGNoYW5nZXMgYXQgdGhlIGZpcnN0IA0KcGxhY2UgYmVjYXVzZSBpdCBsb29rcyBsaWtlIGEgd2Fz
dGUgb2YgdGltZS4NCg0KSWYgeW91IGhhdmUgbWFqb3IgcmVhc29ucyB0byB3YW50IHRob3NlIGNo
YW5nZXMsIHBsZWFzZSByZS1zdWJtaXQgd2l0aCBhIA0KZGV0YWlscyBleHBsYW5hdGlvbiBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQoNCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogemhhbmd5b25nbGUgPHpoYW5neW9uZ2xlMDAxQDIwOHN1by5jb20+DQo+IC0t
LQ0KPiAgwqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZmxvcHB5LmggfCA2ICsrLS0tLQ0KPiAg
wqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mbG9wcHkuaA0KPiBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9mbG9wcHkuaA0KPiBpbmRleCBmOGNlMTc4YjQzYjcuLjFhZTY3
ZDI2MjliZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Zsb3BweS5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mbG9wcHkuaA0KPiBAQCAtMTYzLDE2
ICsxNjMsMTQgQEAgc3RhdGljIGludCBoYXJkX2RtYV9zZXR1cChjaGFyICphZGRyLCB1bnNpZ25l
ZA0KPiBsb25nIHNpemUsIGludCBtb2RlLCBpbnQgaW8pDQo+ICDCoMKgwqDCoMKgwqAgcmV0dXJu
IDA7DQo+ICDCoH0NCj4gDQo+IC1zdGF0aWMgc3RydWN0IGZkX2RtYV9vcHMgcmVhbF9kbWFfb3Bz
ID0NCj4gLXsNCj4gK3N0YXRpYyBzdHJ1Y3QgZmRfZG1hX29wcyByZWFsX2RtYV9vcHMgPSB7DQo+
ICDCoMKgwqDCoMKgwqAgLl9kaXNhYmxlX2RtYSA9IGRpc2FibGVfZG1hLA0KPiAgwqDCoMKgwqDC
oMKgIC5fZnJlZV9kbWEgPSBmcmVlX2RtYSwNCj4gIMKgwqDCoMKgwqDCoCAuX2dldF9kbWFfcmVz
aWR1ZSA9IGdldF9kbWFfcmVzaWR1ZSwNCj4gIMKgwqDCoMKgwqDCoCAuX2RtYV9zZXR1cCA9IGhh
cmRfZG1hX3NldHVwDQo+ICDCoH07DQo+IA0KPiAtc3RhdGljIHN0cnVjdCBmZF9kbWFfb3BzIHZp
cnRfZG1hX29wcyA9DQo+IC17DQo+ICtzdGF0aWMgc3RydWN0IGZkX2RtYV9vcHMgdmlydF9kbWFf
b3BzID0gew0KPiAgwqDCoMKgwqDCoMKgIC5fZGlzYWJsZV9kbWEgPSB2ZG1hX2Rpc2FibGVfZG1h
LA0KPiAgwqDCoMKgwqDCoMKgIC5fZnJlZV9kbWEgPSB2ZG1hX25vcCwNCj4gIMKgwqDCoMKgwqDC
oCAuX2dldF9kbWFfcmVzaWR1ZSA9IHZkbWFfZ2V0X2RtYV9yZXNpZHVlLA0KPiAtLSANCj4gMi40
MC4xDQo+IA0K
