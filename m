Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68C822D66
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 13:46:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=alrXYbrz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4qG44LBJz3dBY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 23:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=alrXYbrz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4qFF2PbPz3cSJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 23:45:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1B7OshpmCKp0OwwM4djjt4syiYvzq7pEg0gXMT1H0Izzt26gDlCFgLxkqG84RWyQPJd+l+H79cX42CpPMyVqS55u3EOrx3aK+KsWI0ENLmXO4RHrqfQjh5jD24qzXfQ+u5DNL1DszZ11N/xzt/y5jvIFw8jWFqWWwCH0JSRxVFXFNVC23fPpyItegjiompWvD5fPnkUgWi1rtsqCJ3Q8hgQSd7svok3nHO2WCwyYinvEaPbnGFME25zFp8S25tGDLZekjmQFdlcZhxKLuIaW/dRXcdfFRo5MOKm1zuNPzq8XcTEJGAxvQx11QsZJ/0O9rZGzNTowdgYY9FPMHn0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ui+2EIMKielWr4+81SlLjkZhrpwZbG/KOpAFhOuxbaA=;
 b=OuBvvueLnrYJgEVvpP9NuIxuRNZaQE6ViR9p9PRR5ndBgx1jlh6o37c1QIeA1wY4rlMiimM0/1rVRWat3jz3p/OV6avtk7W62GBdn3SB0O9mcdID11QKRuvZ56HFKVVy/+9YuQBx9HCw0P/IAyzuQ0uRKU1qKu7qZfBfD/BcUMiVNsvx31mQHd+9K7SQVGxMfRYhDznyb7zyLwcUx6lCr7GQo0zy91xFqjnFxlvLfTM5Nsmh2Ebnmw8tZGYOAC7Hu4ZJer4VuThOFkGMtnbsWLLBxerWfmzKXE0O5LtiK5Mvx8+P0nBlcCrX3zxWIzTqFdFhelhF9blvaB8kFfdqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ui+2EIMKielWr4+81SlLjkZhrpwZbG/KOpAFhOuxbaA=;
 b=alrXYbrzS+4qJJjSIRERgjNgct5izn0ZU6tbLfefj7jOR6FBPqhGkF9PzULGVkg5IUFB3DoyjhhfDfD8D5EPhHrpp2d8Bjq2WyTsn/QMI/Lg43WeISd4QigqRgEluOfjF7xCeWs/ibMBMzSSVFlCyqtpXJ+gy+zl2QBabHF7UegLhqcDcqShwFUwTWF4APIrOPahpGX59E9Pt3UqURaF5aVAcihfltVeM/6PQZGeGwdOHJxIapvDcBOPdJot2nalhYuzsZAhCe8OgzOz+DCME6xt10fwlRePysMi0FARmrxl3LHfB9JbFqbYU+BFmKy3NKKqG46TcIVbD7bwtWfkOA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2367.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 12:44:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 12:44:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luming Yu <luming.yu@shingroup.cn>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v1 1/1] powerpc/powernv: fix up kernel compile issues
Thread-Topic: [PATCH v1 1/1] powerpc/powernv: fix up kernel compile issues
Thread-Index: AQHaPSaRuGkZ9dO/TUao+ECde1bUHLDICwWA
Date: Wed, 3 Jan 2024 12:44:59 +0000
Message-ID: <8457cdeb-2bf2-41a5-a26f-d16547f84aff@csgroup.eu>
References: <9D8FEE1731685D9B+20240102024834.1276-2-luming.yu@shingroup.cn>
In-Reply-To: <9D8FEE1731685D9B+20240102024834.1276-2-luming.yu@shingroup.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2367:EE_
x-ms-office365-filtering-correlation-id: b39d7828-ab91-4069-b529-08dc0c59cc2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  f/aOZiAHzxlinfl1n3KG5YN6dx156x5BrzfOS9GnKeKtBb/j8iF9KF5tC+zNIjt/Ot+f8ar8XaKuS/h1RVTskHNV6CaJArmLOJIjmPZ1zn5fj/CYn3wQ9xZxO2NYP9ZgBvphfOUYJeBra+JUPrHsOIWQejoUsjilDNlbc3Wx5GXeGBulhl/RqTdRHkxc5ez9w8RiOVmX1JsYLBzk+47aPNkdsyx71O13cv7cXP+tuPVcgTJ4YBzxw2fufgfBpc62EzGPO//6SZFQsxJ1FAPLnhdOS+ih0fFVCxr3FmWZufEoTlwEe9MkqE1uCiyCVyMdNTVREX3lvBJ4A+x7uXp5kJ7yELbMxR99tZI7N+PilGTeCr1dQ7KlDnzSmiidnbbwBZ+J/iuAXmEB16vzbq7lSyz972qyX9pCy90qTJ8ZijTdXQFyB21D6hEZxyn2YFiPlh0V43uMY7Jwf7lifQgrS4QP8qSNiPAAZd5jIyTUtpLAyxN69c2yxVlIvC0v9S7L/+9fJld7ttI5m05ebX6dO6HK4Mznph6qDorikIMIPCxmSUw2pPq0v5XcX11PEqHOK4/rhMwbzaKm4Hri9ZpDMBnPnFj1PGyr8CIyt8jDRMXqjxKNmShWhuQcWw5942InUscV4pUPWfnYQJ0cf3WEf66EAvM9CA/tTm6IszBiww4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(366004)(396003)(136003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66574015)(2616005)(26005)(83380400001)(5660300002)(6486002)(41300700001)(31686004)(38070700009)(31696002)(86362001)(36756003)(2906002)(966005)(478600001)(8676002)(110136005)(44832011)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(8936002)(66946007)(316002)(6512007)(6506007)(4326008)(122000001)(38100700002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eG15RzJqNlh3YWV2azdydXp1Qk5XZGJLN2kwSTExWG00SGxQVEo0K2pRT2tI?=
 =?utf-8?B?dHI1a2xJbmVZTFZxeDRCaEFxNUxDcDVqNmZKVDQ3ajdBSURNZTJUb3VjbVJ1?=
 =?utf-8?B?Z3VGMWlKM2ZqQm5aemRQMWdWeVRnRExPRXlmRXZBcnpFbCs4VUdibWFYTElY?=
 =?utf-8?B?d2NIS082Q1FWQi95MG1nUGNKYWV1ODhXcDJkcmJQRGdSV1M3N2R0Zy9tQU9z?=
 =?utf-8?B?dzVHd05vK1Q5Uy9mQWFsUzgwK1RMT0l4VmhyekpKU3ZjQ3d5alc1dXE1bGNK?=
 =?utf-8?B?UzNPTWNGUEMvR3A5RXBHdWdDcXpIZ0dTbWNZQXVmQ1FtQzZUdEY4ejFyVnM0?=
 =?utf-8?B?RmpUS0JSRmZ0cHBOUEZVK0djUHdYQTZSTE5ZVHZEdk0yVjZmRktJTVA0eUZv?=
 =?utf-8?B?NTAzMEk0Qkx0WllWVmREWFIrMUlvZ3cwSVlra0twWmZ3a0FmUWVnTy9ZRnlD?=
 =?utf-8?B?L3R0M2I4SDRVRlE3bWhtZXA4VHBOL0gxWEhZbTI3M0tEUy9zS2lDaEpzaVhu?=
 =?utf-8?B?ZW5WVk5aVjhNbmtSNmJTYllwZk5NemVJQ3pmazFkdUdOZjJUNWcwc2M1N3Ay?=
 =?utf-8?B?MkU2aER3UzRFc3BNRUNCZ0dNdFFsQW54K25FNFZoMUN3MkVRRW82Tng5Q1dV?=
 =?utf-8?B?U3I4anVmUHpJNXB4WnZKY1loMXdqMHFvYjNmbXhxdkpQR0dNUysvMmlST1Jk?=
 =?utf-8?B?bkdrL3ZMS09YNlk2aGc2SE4zZ1poOFNpK3VOZWNPYXdFTzhITTA4Vm9SYzRE?=
 =?utf-8?B?S0Z3d2lOOGdOZ01uZm14M3l1N2Z5Z3JVU0NSdmJvdjRmY0htM0xjckdQVkV6?=
 =?utf-8?B?Y1M4Wk1QUWJuSlpTbWZFUWsrT0Y3MzE0WXlUbnBwQmtFbWJHbW9lWGlaWGFE?=
 =?utf-8?B?VWhIbFFsS3FLK3RrVjdPclE3cjB4TVJxekwrVFVXdXp6L3cxQy9TRDIvZkdW?=
 =?utf-8?B?dTdxNTZFUi9Tc2doL3lRZnRMc3VCOUY3cE12dXg1WkhkeElURFJQc01MS1NN?=
 =?utf-8?B?RHZQZmVWSCt5UEhPcGN3L3c1cGpJV1NnZUtFQ3l1YW5IQndVTkxPbmxrMW1Y?=
 =?utf-8?B?QjBEM3ZnS2s5Z2hVSHpDaExDdDc3WFNkWE5VeGVnZ29JK0ZRcWlPdzVpbnZv?=
 =?utf-8?B?d2g1QWtHbmFsemZ3NDVWYzRQVEtERm5tK2lEMmNRbXFzOGpJMUswSWtoM2Vk?=
 =?utf-8?B?UFNoNlJDNnJiWklKVUwvM3VaRDE4SjBkZ3RjL2JiOHpndUZOS0FQMmtqZkpN?=
 =?utf-8?B?ZGo2blltYmdnWUVKM05Dc05XT01qQWNzNkJZWUFhYXhOVVBSZExoK0VnSEdZ?=
 =?utf-8?B?N1dHQjRaQXJRTE9BVWd3VFJqVXgwandKeW41dFBhRWdIbytISjhxeE9qQ3Yr?=
 =?utf-8?B?a3dpSEtHTjNwWitZdkJPRmFwSzlqVWhKT0RqekVGemlPVlpseFJrMUVJcGV4?=
 =?utf-8?B?N3M5NTlmZXV6RysyS0MxbnZscDUyNGRsWVR0cjEyekN1a3dTWHU0SThnaUJa?=
 =?utf-8?B?dmRWajdUQUJLYkxxNDhPOVRqSkJCd2g0OHozZExSOHk3NnNzUGpvMFlVdjFV?=
 =?utf-8?B?ci85ZDI5Y1FnS3IwYXQ1SHRPOTN0bFhIZmgybmtKZDZJbVM4b0lZRnlmMHhm?=
 =?utf-8?B?Vk5zaVA1SmV6YnVIVFZjVVl4MVJSV0NWaFRmdTM3cHhrbXZ5Y1lZV0JXTFI0?=
 =?utf-8?B?eDJwVVNOS09TSzQzbEFnZXhjTjBJQlhMR2o1dDdMdkxmL3UrWC9OVlE3bkRk?=
 =?utf-8?B?b3RYZStHdUp1WVB5d242QlJOTTNhSVdTL3hBaEpmRjErQnhZaUJ4RS9weU5w?=
 =?utf-8?B?VFZ6TzV5VHo0NUU3K2Nndkh0cnRzOGlxRGQxL08rWHJtbUJlQjlLVWpFQy83?=
 =?utf-8?B?aDNITGRPVlp4R3Q5YkFyWmFsZzliM1YyazJTN2VOSnpJN0dtWURXV21STDlO?=
 =?utf-8?B?c0hIL1dZZFNFS2poelhDdzc1N1hMelhVMHdFR3BLZzIvZDU3SHlOTElwNThz?=
 =?utf-8?B?Tk1rUU9RTmVkTUltS3o5dlN3ejA0WkhiNDJMQUZGUEtSYkM1RW9yWEdVRnY4?=
 =?utf-8?B?RE1rcDBieXYzVjhDWVZzOGpBTisvNktuZms0cEliRDYxRFZ1LzN4QUdzZHI3?=
 =?utf-8?Q?j5eLXSStC1QMG+PQ+sMISW5id?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E48632E59E46674E9A80A07A0FAE9D00@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b39d7828-ab91-4069-b529-08dc0c59cc2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 12:44:59.6892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtYEZBJrPnSiWzC0rmt3b7u7CO635dHkIJG514AK8vtxrriLH+MUEdRC9PDLReMRZ7goixQ+ReBOTQbIsZKnyBiaa6SqzDXttqrY15iqsrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2367
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
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>, "dawei.li@shingroup.cn" <dawei.li@shingroup.cn>, "ke.zhao@shingroup.cn" <ke.zhao@shingroup.cn>, "luming.yu@gmail.com" <luming.yu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDAyLzAxLzIwMjQgw6AgMDM6NDgsIEx1bWluZyBZdSBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBsdW1pbmcueXVAc2hp
bmdyb3VwLmNuLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRw
czovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gdXAga2Vy
bmVsIGlzIHF1aXRlIHVzZWZ1bCB0byBzaWxpY29uIHZhbGlkYXRpb24sIGRlc3BpdGUNCj4gaXQg
aXMgcmFyZSB0byBiZSBmb3VuZCBpbiBzZXJ2ZXIgcHJvZHVjdGlvbnMuIHRoZSBmaXhlcyBhcmUN
Cj4gb2J2aW91cy4gTm90IGxpa2UgSUJNIHBTZXJpZXMsIGl0IG1heSBiZSBub3QgbmVjZXNzYXJ5
DQo+IHRvIGhhdmUgcG93ZXJudiBTTVAgZm9yY2VkLiBJdCBpcyBkaWZmaWN1bHQgdG8gY29tcGls
ZSBhDQo+IHVwIGtlcm5lbCBmb3IgcFNlcmlzZXMgYXMgSSd2ZSB0cmllZC4NCg0KWW91IHRpdGxl
IGFuZCBtZXNzYWdlIGFyZSBjb25mdXNpbmcuICJmaXggdXAiIGhhcyBhIHN0YW5kYXJkIG1lYW5p
bmcgaW4gDQplbmdsaXNoIGxhbmd1YWdlLCBzZWUgDQpodHRwczovL3d3dy5jb2xsaW5zZGljdGlv
bmFyeS5jb20vZGljdGlvbmFyeS9lbmdsaXNoL2ZpeC11cA0KInVwIiBhbHNvIGhhcyBhIG1lYW5p
bmcsIHNlZSANCmh0dHBzOi8vd3d3LmNvbGxpbnNkaWN0aW9uYXJ5LmNvbS9kaWN0aW9uYXJ5L2Vu
Z2xpc2gvdXANCg0KVXNlICJub24tU01QIiBpbnN0ZWFkIG9mICJVUCIuDQoNCkZvciBpbnN0YW5j
ZSwgc2VlIGNvbW1pdCA1NjU3YzExNjc4MzUgKCJzY2hlZC9jb3JlOiBGaXggTlVMTCBwb2ludGVy
IA0KYWNjZXNzIGZhdWx0IGluIHNjaGVkX3NldGFmZmluaXR5KCkgd2l0aCBub24tU01QIGNvbmZp
Z3MiKQ0KDQpDaHJpc3RvcGhlDQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVtaW5nIFl1IDxs
dW1pbmcueXVAc2hpbmdyb3VwLmNuPg0KPiAtLS0NCj4gdjAtPnYxOiBzb2x2ZSBwb3dlcm52IHZh
cyB1cCBrZXJuZWwgY29tcGlsZSBpc3N1ZXMgZm91bmQgYnkgbGtwIGJvdC4NCj4gLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L0tjb25maWcgICAgfCAxIC0NCj4gICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1pbWMuYyB8IDEgKw0KPiAgIGFyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi92YXMuYyAgICAgIHwgMSArDQo+ICAgYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy9wb3dlcm52L3Zhcy5oICAgICAgfCAxICsNCj4gICBhcmNoL3Bvd2VycGMvc3lz
ZGV2L3hpdmUvY29tbW9uLmMgICAgICAgICB8IDIgKysNCj4gICBhcmNoL3Bvd2VycGMvc3lzZGV2
L3hpdmUvc3BhcHIuYyAgICAgICAgICB8IDUgKysrKy0NCj4gICA2IGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cG93ZXJudi9LY29uZmlnDQo+IGluZGV4IDcwYTQ2YWNjNzBkNi4uNDBiMWE0OTM3OWRlIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvS2NvbmZpZw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvS2NvbmZpZw0KPiBAQCAtMTUsNyArMTUs
NiBAQCBjb25maWcgUFBDX1BPV0VSTlYNCj4gICAgICAgICAgc2VsZWN0IENQVV9GUkVRDQo+ICAg
ICAgICAgIHNlbGVjdCBQUENfRE9PUkJFTEwNCj4gICAgICAgICAgc2VsZWN0IE1NVV9OT1RJRklF
Ug0KPiAtICAgICAgIHNlbGVjdCBGT1JDRV9TTVANCj4gICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQ
UE9SVFNfUEVSX1ZNQV9MT0NLDQo+ICAgICAgICAgIGRlZmF1bHQgeQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLWltYy5jIGIvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9wb3dlcm52L29wYWwtaW1jLmMNCj4gaW5kZXggODI4ZmM0ZDg4NDcxLi42
ZTllMmIwYTViZGMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJu
di9vcGFsLWltYy5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFs
LWltYy5jDQo+IEBAIC0xMyw2ICsxMyw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJl
c3MuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvY3Jhc2hfZHVtcC5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9kZWJ1Z2ZzLmg+DQo+ICsjaW5jbHVkZSA8YXNtL3NtcC5oPg0KPiAgICNpbmNsdWRlIDxh
c20vb3BhbC5oPg0KPiAgICNpbmNsdWRlIDxhc20vaW8uaD4NCj4gICAjaW5jbHVkZSA8YXNtL2lt
Yy1wbXUuaD4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi92
YXMuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi92YXMuYw0KPiBpbmRleCBiNjUy
NTZhNjNlODcuLmMxNzU5MTM1YWNhNSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9wb3dlcm52L3Zhcy5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJu
di92YXMuYw0KPiBAQCAtMTgsNiArMTgsNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3Byb20uaD4NCj4gICAjaW5jbHVkZSA8YXNtL3hpdmUu
aD4NCj4gKyNpbmNsdWRlIDxhc20vc21wLmg+DQo+IA0KPiAgICNpbmNsdWRlICJ2YXMuaCINCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvdmFzLmggYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvdmFzLmgNCj4gaW5kZXggMDhkOWQzZDVhMjJi
Li4zMTNhOGYyYzhjN2QgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93
ZXJudi92YXMuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvdmFzLmgN
Cj4gQEAgLTEyLDYgKzEyLDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvZGNhY2hlLmg+DQo+ICAg
I2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiANCj4gICAvKg0KPiAgICAqIE92
ZXJ2aWV3IG9mIFZpcnR1YWwgQWNjZWxlcmF0b3IgU3dpdGNoYm9hcmQgKFZBUykuDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvc3lzZGV2L3hpdmUvY29tbW9uLmMgYi9hcmNoL3Bvd2VycGMv
c3lzZGV2L3hpdmUvY29tbW9uLmMNCj4gaW5kZXggYTI4OWNiOTdjMWQ3Li5kNDliMTI4MDljMTAg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9zeXNkZXYveGl2ZS9jb21tb24uYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvc3lzZGV2L3hpdmUvY29tbW9uLmMNCj4gQEAgLTE0OTcsNyArMTQ5Nyw5
IEBAIHN0YXRpYyBpbnQgeGl2ZV9wcmVwYXJlX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQ0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUwsIGNwdV90b19ub2RlKGNw
dSkpOw0KPiAgICAgICAgICAgICAgICAgIGlmICgheGMpDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsNCj4gKyNpZmRlZiBDT05GSUdfU01QDQo+ICAgICAgICAgICAg
ICAgICAgeGMtPmh3X2lwaSA9IFhJVkVfQkFEX0lSUTsNCj4gKyNlbmRpZg0KPiAgICAgICAgICAg
ICAgICAgIHhjLT5jaGlwX2lkID0gWElWRV9JTlZBTElEX0NISVBfSUQ7DQo+ICAgICAgICAgICAg
ICAgICAgaWYgKHhpdmVfb3BzLT5wcmVwYXJlX2NwdSkNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHhpdmVfb3BzLT5wcmVwYXJlX2NwdShjcHUsIHhjKTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9zeXNkZXYveGl2ZS9zcGFwci5jIGIvYXJjaC9wb3dlcnBjL3N5c2Rldi94aXZlL3Nw
YXByLmMNCj4gaW5kZXggZTQ1NDE5MjY0MzkxLi43Mjk4ZjU3Zjg0MTYgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9zeXNkZXYveGl2ZS9zcGFwci5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9z
eXNkZXYveGl2ZS9zcGFwci5jDQo+IEBAIC04MSw2ICs4MSw3IEBAIHN0YXRpYyB2b2lkIHhpdmVf
aXJxX2JpdG1hcF9yZW1vdmVfYWxsKHZvaWQpDQo+ICAgICAgICAgIH0NCj4gICB9DQo+IA0KPiAr
I2lmZGVmIENPTkZJR19TTVANCj4gICBzdGF0aWMgaW50IF9feGl2ZV9pcnFfYml0bWFwX2FsbG9j
KHN0cnVjdCB4aXZlX2lycV9iaXRtYXAgKnhpYm0pDQo+ICAgew0KPiAgICAgICAgICBpbnQgaXJx
Ow0KPiBAQCAtMTI2LDcgKzEyNyw3IEBAIHN0YXRpYyB2b2lkIHhpdmVfaXJxX2JpdG1hcF9mcmVl
KGludCBpcnEpDQo+ICAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICB9DQo+ICAgfQ0KPiAt
DQo+ICsjZW5kaWYNCj4gDQo+ICAgLyogQmFzZWQgb24gdGhlIHNpbWlsYXIgcm91dGluZXMgaW4g
UlRBUyAqLw0KPiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgcGxwYXJfYnVzeV9kZWxheV90aW1lKGxv
bmcgcmMpDQo+IEBAIC02NjMsNiArNjY0LDcgQEAgc3RhdGljIHZvaWQgeGl2ZV9zcGFwcl9zeW5j
X3NvdXJjZSh1MzIgaHdfaXJxKQ0KPiAgICAgICAgICBwbHBhcl9pbnRfc3luYygwLCBod19pcnEp
Ow0KPiAgIH0NCj4gDQo+ICsjaWZkZWYgQ09ORklHX1NNUA0KPiAgIHN0YXRpYyBpbnQgeGl2ZV9z
cGFwcl9kZWJ1Z19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqcHJpdmF0ZSkNCj4gICB7
DQo+ICAgICAgICAgIHN0cnVjdCB4aXZlX2lycV9iaXRtYXAgKnhpYm07DQo+IEBAIC02ODAsNiAr
NjgyLDcgQEAgc3RhdGljIGludCB4aXZlX3NwYXByX2RlYnVnX3Nob3coc3RydWN0IHNlcV9maWxl
ICptLCB2b2lkICpwcml2YXRlKQ0KPiANCj4gICAgICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiAr
I2VuZGlmDQo+IA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGl2ZV9vcHMgeGl2ZV9zcGFwcl9v
cHMgPSB7DQo+ICAgICAgICAgIC5wb3B1bGF0ZV9pcnFfZGF0YSAgICAgID0geGl2ZV9zcGFwcl9w
b3B1bGF0ZV9pcnFfZGF0YSwNCj4gLS0NCj4gMi40Mi4wLndpbmRvd3MuMg0KPiANCg==
