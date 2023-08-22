Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BA783AF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 09:33:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EyN+7CIM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVLfq1r9Kz3c2Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 17:33:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EyN+7CIM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVLdt0s5Zz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 17:32:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/IyBZ/lVbGGH1GFYURI9pmiywTK/bYKQJuvZVsLCOUE30DO8+/Il+1qdwaiObc6hbrlO8PVQTDkq6XLAW+w8beJFLk1uLHk7HleesJteA6575KHzQAQo0BEc1nPa871QLu6e7In21T/6VFra8yojTa34428N5mwV7Oez/JNGnTUhEXXvToR8YrSkFLOAqQKMxMgfsiPBhg/I3njE4NisfdefWrNM1ekVmzj3XQ/Q3DvWs5mmgz6r6j4Y2r6hxt+/qTWCsw6UVjnWkNz6e5qKohuQMGHioDYNWPKooTBQwJCK4WTwuegHh0wM9/jbQLXcgsr+49rRTza/ikWHSJfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCdz+DvOogKWDq5NB98YfKnS43UYtKZFFyUIoMTyKwM=;
 b=ckCUiQ7qwPYrv1qQiWkO38zLVTxUmTumhdl0wGHFM0ulj7IRdsVYFcT/ZbbW9kZ3j4q2chzOAhWMJx7sHrk49uNcO46spSj3dJUom+xghBpcJnWwzTJZRbWQ+JGdmM/yLO19a8lQWccPXIPMyxKzxK6+VsZ/k7B4ndZh16duy3wHcnM9UtpY7SjMw/PWjjrTPhapcCBXEkL1VOb46Vm72cvKk608AOjHzyEvX3lYQKvYHKdu5MOdKLFeN3VO9jBevl3dQlHGMmbq1i3Yx/6zWocvNcrnD57H7Ms1X2znW7/RjyM46WE/KQ04U2huC/6nqvTXal5Cyqd5ftOaB/r9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCdz+DvOogKWDq5NB98YfKnS43UYtKZFFyUIoMTyKwM=;
 b=EyN+7CIMHYfLkJ2nopIHSw0TKvQ49we48yAfKiI0XY3UlN1bJh2RNwf9Xk4TR60JLVlMAtw01URGho5yDi2sVcSHZaeS9ucxyIc130f21qU2B+jn/n1YNPx5d11dMhfngOGwYhxtzS8wvavitmCmQuSczkJKO9MjW2IsKeYD+9cU8f0OsZ5jjH0qH6tcXh0C+r2ZECJJamrYRYznZoi7KtutvsXBM7GQgOdv3A76Gfpz0KmwgrsoiBgdy5uyjgY8p+MwjP3mcF4MN54jw2yD9bVqx/u3yewvYgfGIW+jI5RmVxdl7BkY61OxqdKEJlpCpTkxtT/yl/GltsoBYPbl2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 07:31:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 07:31:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyA
Date: Tue, 22 Aug 2023 07:31:54 +0000
Message-ID: <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
In-Reply-To: <20230818182316.79303545@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2001:EE_
x-ms-office365-filtering-correlation-id: 0eac742a-59e2-4ba8-b6e9-08dba2e1dc39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KcggUOJzw6hFfe3Q4QjeM2vf+t/HHQLIiunXueK/N626ILr+F9+CTlaJqCXjzgmzEjFnpWhn6uSmOmDFGuBrheJ/6sYCxwkgbUgOzpKEc/npgk+UCuJ8fbD0R7wwzU3Kn9Lbi6u5ijSMNw6FUf5gjwkvGHOSLfQ/MX8s5g8C5SvWBO8UqyEssHpK+K18BPorDCGPmf/psDy6IHSIsPYFNpTFzCraG50LXOlGop3FEKOW7DkKQFc03WapVE5Ae6zwArysZpCd3JRt2phbp5r+00F+i8HFvoYInF1SGWfBw9II63mzTmBtriWZ3eIsmEE/Bhr2eigYCDNTgcFtr1Ii0tXAvUj8yvjA17sdf0L5Y8pXOEI9N3+lF9RB0NpHwV3/rs8Yh09Lz3WgYjxDHGOj0Zcorl0DQ/AJ6w9V88YPljHFe8VVEZrBUy+Q2GaKmzxZ/KwY+LhgB1XprSCq8ZDLgjoED4NNLkLxVYr2K+qZNDiaQplikuu+jcEo8H9im8V/nSlIuqn1b53ydUqioaVD82OKhunYoi5Hss5dCai/rz4O5L9q+A0BySnEkesyJsa8+S4WDEaq0sUes+cg48VkJUnerIYJ9VGy5AVFL3uz2VzzfIiiriHKly5pVspJK6wJmHgsEWTx0bCVo7gZJtB+c67o1wRXfFoc4e4jn5EIjKJzfJqi8/pdHbAaQGH5Kf8O
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39850400004)(1800799009)(186009)(451199024)(54906003)(66446008)(6916009)(76116006)(66476007)(66556008)(64756008)(316002)(66946007)(6512007)(91956017)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(122000001)(478600001)(71200400001)(38070700005)(38100700002)(6506007)(6486002)(66574015)(2906002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UlZYRDh4WmdnenV5d2pmZnFNWEFtV1BlVmZNQlhLTlFZNmJqUDZUaWYrcEN2?=
 =?utf-8?B?c3F1UDhoeTRuMVNCZ2tYeTQ3THgxU3VqV280QU5rbWo3Q21vSituZUFVVFJF?=
 =?utf-8?B?ejZZRkRKWlNSeStEVjhnaTZkWkFEdXErelJhcmVjUS90dHp0M21vUVZtQVhm?=
 =?utf-8?B?Vmd1QWorS0hCa28vWU1VWWtMNSsxZm1odUVHckhrNW1RYWc5aTFRTFBwZllk?=
 =?utf-8?B?VHE2bmw0NmZ5WjFEWnVoaXNrbTUyQ1JtclJXOTBCSWJGbjFaL2xPb2FZZUNn?=
 =?utf-8?B?Z1JNMklZRitCdGYrZXQ2bUd1clZkYUZQbmgxcUR5U21rMHpxYmJxR243aWxQ?=
 =?utf-8?B?SCtzNHlpNDN3dC8remFmV2xFb2tWTjA1aGpUdWFEQ282Q05pL1Y4d2NDNXgr?=
 =?utf-8?B?UkxObGZqbXRKMjlSdkZtV3I4UTZsNWN5UVQrVTYyV0h5YVRJR1k0Q3k0c3J6?=
 =?utf-8?B?c0RheEE2bEphWjhlVVoxZUVFZXhodlR4ZUVBSjVSRktha1ZMbXcyc1hWa3VU?=
 =?utf-8?B?TFdIRmVYTnpCK1dnTGxMWEFjTFdYdUN4d25oUndQeitsZGVxcXQvamlCYlUw?=
 =?utf-8?B?MUpwRDY2NmlkUkc4aExnK1lZVlF1dDlmeTZKalNabmRFQWRSb3dXajlYQnp6?=
 =?utf-8?B?dHpWMEZRWXo2MXhHTTVkZFlqaE8zWWdMTXVKa25GbjZZZlpVQzFuY29DaEZv?=
 =?utf-8?B?UEJScGNBL1JZV2huRHlBcFBrYkNoT1cxeWxxZmQxRnhQNU5DbThDbDlwaEdx?=
 =?utf-8?B?VUQ4amxzekNUODJadC83d2FwWWNQb3M2TmtQb2lsYW5RcWVKRHdpZ05vZGhR?=
 =?utf-8?B?cmNzVERPWkxzTW0vL3M4WG5LdENxVERnV1NhdG45VXdKaEpkc28vZmYxbnVF?=
 =?utf-8?B?S1o1a2w1WFhBT1c4TUtYQjFqV3JnbCs4SGIvV1A1ZWJYR1ZEbkg2TUsyYXpM?=
 =?utf-8?B?STZwaWhHazZuTGdKRHEvYVJaNXVZbHgyZkt1aEhDNXJpeGVJWjRQZGR2L1hU?=
 =?utf-8?B?aWtVYjZUVUhoZ0RZUzlmamYydzNKNDJvdi8xUTNkVDFYL2ZraTlNQ1U2UGd6?=
 =?utf-8?B?aTN4V1JzZUFFQldnVzgwK0xkSGIzN2VLSXNaL2dzR0RvZ0llcmR3UEYwMWx5?=
 =?utf-8?B?VDRaY29MZnZyRzd3L3MxYTV3Z29IVUE0MDg2QW1RNjJxcXd6WnlRWnR3MFVz?=
 =?utf-8?B?QVhwaFBjSzYwb3UxYVl0V3pVVnMwTk9IbTRPUHc4WmxDSzhHOUcyT1RNakg1?=
 =?utf-8?B?VXBNUkhYaElnNmk2Mkdjbk5EZnVJZjB4cWRJZjN3ZkpRWG5reGFZTjVtZTNI?=
 =?utf-8?B?MTVwRVN6S0YxY3lUakQvRkQwWm83elFCTUg3RHBGWHk2aDVrY0Z2SXM3OHpu?=
 =?utf-8?B?WlhWZW44cjR0cDIxY2pzK3FQWXczbFliTDB3dG1URXFlWjVjNGc4em45YkFl?=
 =?utf-8?B?c0lrWHpTN0RuakdwVHNQUlZBUjR3UysxV1B6TnNDSlg5dHNUYUlDNkIveVhr?=
 =?utf-8?B?aTQ2UlVON0k2VmdUUm9kVGFpSUN2Nmcxeldpa25MSUlkYkhZeThpU0JSOFVZ?=
 =?utf-8?B?djFjaFpkbHRsL0dZdnpGZzlmSlptM0F0bS92Q1hFMXpZY1hJSFRYc0x4dGZZ?=
 =?utf-8?B?czFyWWxvL05EUDJQZHllQVlNV1R1SjJWR3lPdmpFVHMwWWtlY1FSaGVHb3dM?=
 =?utf-8?B?b3BKZHFhMUJyOC9zeVM2QStFRlZLbXQyOEFiNW5MZG1oYnFia29va2o3MThZ?=
 =?utf-8?B?TngwV2lhdno5UEVQYi93TEs0a2dmQkg2VnZ0SWp0eFRaRmZQNFhCVzF2U2Fi?=
 =?utf-8?B?a2QwTllkTFZTMWMxZjFOZWNLT2M5Z3ZIV2xlMzdYa3dYK3MrOXhwc2Z3MTZj?=
 =?utf-8?B?dWlmelN3dk1BV0s4UlVRM2tsdVBGTlY2dWJ1US95cmxtTU16QThSMkF2Z2Vr?=
 =?utf-8?B?OXRKNW4wUENuNlNQakpDVFVZdTdIYjNwSEVNNXIxTXJyYiszaXZqbnVRWktH?=
 =?utf-8?B?MVc1a2M2ekxPWFp0ZFJ2SlRORFErKzhaTVRkMDlYZDFIS0ZuSG1jMkRPY3Er?=
 =?utf-8?B?OHNGUzZDRDNmbGVmUElvclpNakpqTithK2tBb0psb2twSDh3OGVLTFV2ZlZa?=
 =?utf-8?B?UkkxSHV4TXNMSXl0RnRHK3V6aW5HTjNTcEtSc0pJVi9CdURpZStCZWlaY1lV?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4226BA32FF542E46A36653B23352BEA2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eac742a-59e2-4ba8-b6e9-08dba2e1dc39
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 07:31:54.8722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9oWp0mxw4VKvuaYI+2MBYUvJUH+F3464ZrQN14BtA8bortciJcnFOHYyz+0jWhhcJjbuLC4ApLUpmDHKYLLwg84IWWmM1uqD/48Q0OpVRNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2001
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA4LzIwMjMgw6AgMTg6MjMsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgMTggQXVnIDIwMjMgMTU6NDc6MzggKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBJJ20gd29uZGVyaW5n
IGlmIHRoZSBwcm9ibGVtIGlzIGp1c3QgbGlua2VkIHRvIHRoZSBrZXJuZWwgYmVpbmcgYnVpbHQN
Cj4+IHdpdGggQ09ORklHX1NNUCBvciBpZiBpdCBpcyB0aGUgYWN0dWFsIHN0YXJ0dXAgb2YgYSBz
ZWNvbmRhcnkgQ1BVIHRoYXQNCj4+IGNhdXNlIHRoZSBmcmVlemUuDQo+Pg0KPj4gUGxlYXNlIGxl
YXZlIHRoZSBidGV4dF91bm1hcCgpIGluIHBsYWNlIGJlY2F1c2UgSSB0aGluayBpdCBpcyBpbXBv
cnRhbnQNCj4+IHRvIGtlZXAgaXQsIGFuZCBzdGFydCB0aGUga2VybmVsIHdpdGggdGhlIGZvbGxv
d2luZyBwYXJhbWV0ZXI6DQo+Pg0KPj4gbnJfY3B1cz0xDQo+IA0KPiBXaXRoIGJ0ZXh0X3VubWFw
KCkgYmFjayBhbmQgcGxhY2UgYW5kIG5yX2NwdXM9MSBzZXQgdGhlIGZyZWV6ZSBzdGlsbCBoYXBw
ZW5zIGFmdGVyIHRoZSAxc3QgYnRleHRfdW5tYXA6MTI5IG9uIGNvbGQgYm9vdHM6DQo+IA0KPiBb
ICAgIDAuMDAwMDAwXSBwcmludGs6IGJvb3Rjb25zb2xlIFt1ZGJnMF0gZW5hYmxlZA0KPiBbICAg
IDAuMDAwMDAwXSBUb3RhbCBtZW1vcnkgPSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBmb3IgaGFzaCB0
YWJsZQ0KPiBbICAgIDAuMDAwMDAwXSBtYXBpbl9yYW06MTI1DQo+IFsgICAgMC4wMDAwMDBdIG1t
dV9tYXBpbl9yYW06MTY5IDAgMzAwMDAwMDAgMTQwMDAwMCAyMDAwMDAwDQo+IFsgICAgMC4wMDAw
MDBdIF9fbW11X21hcGluX3JhbToxNDYgMCAxNDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIF9fbW11
X21hcGluX3JhbToxNTUgMTQwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBfX21tdV9tYXBpbl9yYW06
MTQ2IDE0MDAwMDAgMzAwMDAwMDANCj4gWyAgICAwLjAwMDAwMF0gX19tbXVfbWFwaW5fcmFtOjE1
NSAyMDAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBfX21hcGluX3JhbV9jaHVuazoxMDcgMjAwMDAw
MDAgMzAwMDAwMDANCj4gWyAgICAwLjAwMDAwMF0gX19tYXBpbl9yYW1fY2h1bms6MTE3DQo+IFsg
ICAgMC4wMDAwMDBdIG1hcGluX3JhbToxMzQNCj4gWyAgICAwLjAwMDAwMF0ga2FzYW5fbW11X2lu
aXQ6MTI5DQo+IFsgICAgMC4wMDAwMDBdIGthc2FuX21tdV9pbml0OjEzMiAwDQo+IFsgICAgMC4w
MDAwMDBdIGthc2FuX21tdV9pbml0OjEzNw0KPiBbICAgIDAuMDAwMDAwXSBidGV4dF91bm1hcDox
MjkNCj4gDQoNCg0KVGhhbmtzLA0KDQpDYW4geW91IHJlcGxhY2UgdGhlIGNhbGwgdG8gYnRleHRf
dW5tYXAoKSBieSBhIGNhbGwgdG8gYnRleHRfbWFwKCkgYXQgDQp0aGUgZW5kIG9mIE1NVV9pbml0
KCkgPw0KDQpJZiB0aGF0IGdpdmVzIG5vIGludGVyZXN0aW5nIHJlc3VsdCwgY2FuIHlvdSBsZWF2
ZSB0aGUgY2FsbCB0byANCmJ0ZXh0X3VubWFwKCkgYW5kIGFkZCBhIGNhbGwgdG8gYnRleHRfbWFw
KCkgYXQgdGhlIHZlcnkgYmVnaW5pbmcgb2YgDQpmdW5jdGlvbiBzdGFydF9rZXJuZWwoKSBpbiBp
bml0L21haW4uYyAoWW91IG1heSBoYXZlIHRvIGFkZCBhIGluY2x1ZGUgb2YgDQphc20vYnRleHQu
aCkNCg0KV2l0aCB0aGF0IEkgaG9wZSB3ZSBjYW4gc2VlIG1vcmUgc3R1ZmYuDQoNCkNocmlzdG9w
aGUNCg==
