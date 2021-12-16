Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05558476E1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 10:49:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF6lD5zNpz3dfF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 20:49:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF6jv3FqVz2ynx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 20:48:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgEVAYLj8svMvS2Z6aveL4Lckx1mYCK+RK4rwEWT/9lFu/9oXGGM0GkyYlJDAlRX0qU8sQgfISjlA3yrOM9MldgOpH3Zumsxu9F52iudFMWFW8XosQDf20USpOhd5dytenJTSqKl0OHPs0PEKApysuobEIMrtHiM0HWdq4MSQVy7l4MzzZ9Ec+HoApuLMLnxwCPZlwS6A601grOhS3ibuR55Xxo7C3PJRlWtgfi2XkzNs30tQho6FAkcbZBKirf1f9q+GWbGkHePYI8Ygr1vdn3dpre605csvwxT1GQjtJrnyHijCJ0DOEQPfe57y8F0mfHPCeXVYgmmJDaEbCk9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/AYpFmzm/l326Uz6qH4hAaeuXpof2O6g2DZ8AezfX8=;
 b=NmlxIKQ9AlcStlmTr+DIS4tMA/ZDsE8tB6q5czXcs6oIKSvmDiqTOeTO7xu2ecR6BQP+XadXdzUgj2i1M/vHd5psIeetJhqoExBp9Bi4PVoapgZpRA16OxOCVnPD28vu4k4XyK6ORbh/M6V2synAjs8vxwPVOodmPAa0eELKxXVXee6YY49G8NzIak+EaMbZ2/Z8T2Ifp4TLVKV/r6VpZtLhhiJkC8hdXhaol9kMsVdlS82RkScKoxjCm1kB+zLGTdisLeRZtnFPgmhG10VsUh7mnzEi+mSrg42jyx1KKpIPiZYxAOvEw+rxQPES5veaF/0NOvWmGDsY9d8gFsImlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRZP264MB2005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Thu, 16 Dec 2021 09:47:43 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 09:47:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nick Child <nnac123@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 00/20] powerpc: Define eligible functions as __init
Thread-Topic: [PATCH 00/20] powerpc: Define eligible functions as __init
Thread-Index: AQHX8lR4FtWX4PjkRkavACvCTm5hjaw030cA
Date: Thu, 16 Dec 2021 09:47:43 +0000
Message-ID: <9c2cfdd4-4175-313b-630d-5556ae59c732@csgroup.eu>
References: <20211215161243.16396-1-nick.child@ibm.com>
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 024b4b8a-56d1-408e-f351-08d9c0791b50
x-ms-traffictypediagnostic: MRZP264MB2005:EE_
x-microsoft-antispam-prvs: <MRZP264MB200521C5247E70CC67CB818EED779@MRZP264MB2005.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X99PvNalHn3Nuk9pqDNtj6yAFPZ1Tf90wjrICUSm/n4oErRVovs31g5xpZLjwurhG/9E3YKcLvUuHaTjFxWsaGLwtY4gplW4SiiUInAqfo7GDDonfng9e2O7Mbre5cpAHfBCEsU8fEiQCH+SuofaVcIBlllF9RBfPpsZOxuVi4LI8ycvIS4HS+bjOUtFi/FFKk/1plRhPPcB43CoPJedF26gTl0NkqUfzS66wtB7TPruk41L835n1bKLZqLFihVDBKQ91wwmRezhbsilZfkzetLtrufbaMJmRG4ZJWmCmm94mCnCWdsk46MbCyb4Z2DZ17oAjp3FnNKvQuGIiWrVb6KmZY8xP8V3mPA3QTbgeg9Ubhr4biubc7+WjVIsU/Q2LpSyGL5vIgo7o9n1yVp/NBAJMnq59fJyh/0P6lNeYpfY/RkCUWkmxIeKiwo8ZTKVMv2yi1nJu2w/uW0oWQPqwGs2MoPbswIt31yyb6FAD4g8vyld6i9evK+kOOoeRKHnhVC0nqYkdBArn21BMsx+FYNX+K/h9IzGgxTUjDwLkYSlmjLh/u86fCcyDAC4Rrc20VuokL2GbzTqBUWzATLOaGJSGosvH6m5iGNsI0Z1hkcInRCTNBdO3Xi9KZnKZFRnELXb1WdCs9TZu5wP+L+q7FCkG2WBl8+sK1NMCU/2IgdJ5Bs31KZFq8137gwONMVSbdye1fBROxKmBcRvV5tRkEpYgq0vEtd/Tr7U7bYmvn0DxufzpOOgp9r198u6LRBACc+QMVnlujuFj2sBYguW2lrCTsyKaquIuIFHwown1FvwheRFIZLEmX6C/qpEWrf/MKDg4JxwIXon5oU/IAHCR2VNxPkgyU22PcSlsTiFaBc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(5660300002)(66556008)(186003)(316002)(66946007)(8676002)(66476007)(6512007)(38100700002)(26005)(36756003)(4326008)(31696002)(110136005)(2906002)(54906003)(122000001)(6486002)(44832011)(508600001)(6506007)(38070700005)(71200400001)(2616005)(64756008)(4744005)(966005)(91956017)(86362001)(76116006)(31686004)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REZoMmNXY3ZFcVlTV2U0dTlCOER4NitKSjNrUlN1WG4yMEhjejNzTkVTcGpB?=
 =?utf-8?B?UEdwUnVEeGMraCtDM2NkZ1ZMZ0d6V01qakhuWitFd25wQkZnb21VVUU3M29Q?=
 =?utf-8?B?RUJkTk9VWTNIS0VyZjNqY2lNdXp4cFNvYzBQM0d0dE9GSWJOdzNqMlBhYnBK?=
 =?utf-8?B?dFMxTEFhZ1dFbEs4SkRpck5lMUtpYVBGSklOMHlXMzVNZUpEeXE5a0RyMzRs?=
 =?utf-8?B?NXRjR1hkaGZwWCttOVc5SVQrQ0RhNnRkYzRKOGF3MjNDWmlObDZocTZPc0Fs?=
 =?utf-8?B?ZSsrTTVhdHBzU1NJcDRKRXhsWlp2ajZnQng0REpCZjNQVVZtNEdVV21VOHlr?=
 =?utf-8?B?ZGZOK04vMTQrTXpyM0xoM2Y2MEV5T0JlQ2xuVEZNN0ZKK1VLM3hSSzBVUW1k?=
 =?utf-8?B?Z2VBQVJsWGpNdUdNMHdvSGgvd0NuaTFyU3ZyMy9lMU4wcVk4R2FsWDhWbUVF?=
 =?utf-8?B?dDVEMTZ1NmhNWHovRjdlUDZQQS9LZEhtQ08xM29oakJlTkFPTWVMK0V0SWkz?=
 =?utf-8?B?SmtsaUY0amtjV1RqQnJQZWtYTUN6ekJzczIzb2dpSTcxRHRwSElJbjlVdVMw?=
 =?utf-8?B?K3lndjlEYXNKbksyVWI0L2s1Vm52NDRydHVRM3FiZFRQd05ROXRFczBMZ1JI?=
 =?utf-8?B?eVNGLzkrcHEwbmFBU0tFSk1LRkNkZDhqZmFNSzRxVU96NFdkWEg3emF2MStD?=
 =?utf-8?B?VXNhTWs1Q2duUmRmSFNyMU5jKzBFSndSb0FQbkQ0Zy94ZG44djdYSHBZejlS?=
 =?utf-8?B?UE5McE1CS3lxREFYV05sUDhESGErSTFTRFRBNnJmeGhxVVVYVUprb0JucE0w?=
 =?utf-8?B?L2I4elhLdmpvVUJMaVpUR1k4VkVsMlZJUXRUUkJWVW4wRmhTcjAyZHpWbGlX?=
 =?utf-8?B?c1RMbEZGaSszWUMwVTlKdFZuTXRiQkQ5QzNqa2ZvMjFrbEk0c1VmeWcxY1Vt?=
 =?utf-8?B?ZWV4eFBKZkdUNXNDTEVGdDdWaEd3ampuejlPRmJXeDBmOExsMnd4b1hvR3NQ?=
 =?utf-8?B?SWpFaGR1bFh5RktIRS9wOHVtZGlEa1NRNGJHVFhZTVIxQlRvY2tQOHNGOERk?=
 =?utf-8?B?ajI2eisxdXROOGRDZXJvV2RWVnhGY2VMNFdNUjZDdkI2UnRSVVVBcVFjOTRG?=
 =?utf-8?B?UjgrODhjMCtKY0dhVHVVbXdTU202VW8yMjNESGw4MFozWmlnZmFCU2hNM1Jy?=
 =?utf-8?B?R0t0U0pyUmFLWW1FWnlPQkZYc0laQjd3VTBkbEozSlJ4RG53UFhZNUdQMEVm?=
 =?utf-8?B?cDY5ekd6eTlaTHFMN3VuTVNVbXppZjNseXB0VzhXUjNMYm9zd1BrdkI1MSs2?=
 =?utf-8?B?ZDM5Z05DcFRTeXRQNjFNRzdFM2plVzRxYlRBcmcwcnRZZmYwY3ZwOVFraHQz?=
 =?utf-8?B?MU41bHprbWhlclY5WnVSWllVWWhRaE5SaURmdDBCY21ZdnVodk1vdWRLc2pp?=
 =?utf-8?B?dU1JSEM2QTZxZFB5WkZDdUV4SDNEMHlXSXhuUDV3T1VFbjdQUzB4VFNQa2Fn?=
 =?utf-8?B?cmJGeFdXYnB4OXJEYjlLWTlISmNqdWxyRXhMeVp5U2Q2VzQvcld1ZWsrR0Z0?=
 =?utf-8?B?ZGFmOFpweCtUVnEybVdRbmFVRElKNDJYTndmQnFSYitrNWlNczFJWFdzQVIw?=
 =?utf-8?B?SUlSSEswL1FGZ1c5VTd3eHo3RTF1VnlVeE5ub3BkcmdFdUFnNmlmVzJQczZ5?=
 =?utf-8?B?elBUbFhHZDhZMko1eDNPR24wc0orcmYrN1ROYWcrSUl4ZEoxa1VFU1VnSU1Q?=
 =?utf-8?B?UmVMRHI2RzF3T2I1d3gwTWxuVXJ5SWp1MlpBMWZqVStKOEZRRWFkS3VFSVY4?=
 =?utf-8?B?VnNJayszWkZJaHd5Mk1VREdGWjhBaC83Q2FpdkVFSllBUjZ6SURvR3hqY0Zx?=
 =?utf-8?B?OUwwSHdKTkY0UkljYzMzVzVvR3dLdFlpYXJ0TWRvVVBsbFB2Tm9LZ2JUc0xm?=
 =?utf-8?B?OFB4QUxZNDAwdnAvY1dsTzNUL1lYNXBWNHlsUGkyeG5MdW9Kb3RReDNDL0Vy?=
 =?utf-8?B?bEIrQTVzemRaM2dWczhKNEhabUF0amo2S0pSQnR2SVFCUEJiQ3hSaW0wZ3Ri?=
 =?utf-8?B?dHZ3bEh4bWc3WjJmN0Z1cmVJT2prOGJmN0VtdlFxSzNLYkJDQXZBTGxaYmxz?=
 =?utf-8?B?MlAwSWZ3TjZuQWF0QjJCNGJxRkMyaW45MUh2ZExNeHBCYVcrLzh4YldPZnAz?=
 =?utf-8?B?RUlKMTN0NnJtODdzSkhnKytVWVdpU1dVQlBxaTBGbnBFbXJhbkhWZDZCNFAz?=
 =?utf-8?Q?xr4d4kEaD0gZCTxaW+yh6KsTSJ6dZ3KwKx4qgxmD4k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7A8215CD73E51409BFEE7D771FBDDCF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 024b4b8a-56d1-408e-f351-08d9c0791b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 09:47:43.0794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pU/1mSBhvqxwH+pXB8GAxKo4YKDIcRCQTHw1EgnG7SLi410xF5yFrFfLx/++yjH0A2s04BAICiId5hYYbfl7WEdTPLdgnGgpyRj4psG/q9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2005
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
Cc: Nick Child <nick.child@ibm.com>, "dja@axtens.net" <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzEyLzIwMjEgw6AgMTc6MTIsIE5pY2sgQ2hpbGQgYSDDqWNyaXTCoDoNCj4gSGVs
bG8gYWxsLA0KPiANCj4gVGhpcyBwYXRjaHNldCBmb2N1c2VzIG9uIHJlZGVmaW5pbmcvZGVjbGFy
aW5nIGZ1bmN0aW9ucyB0aGF0IGNvdWxkIGJlDQo+IGxhYmVsZWQgd2l0aCB0aGUgbWFjcm8gYF9f
aW5pdGAuIEZyb20gbXkgdW5kZXJzdGFuZGluZywgYW4gaW5pdGlhbGl6YXRpb24NCj4gZnVuY3Rp
b24gaXMgb25lIHdoaWNoIGlzIG9ubHkgbmVlZGVkIGR1cmluZyB0aGUgaW5pdGlhbCBwaGFzZXMg
b2YgYm9vdGluZywNCj4gYWZ0ZXIgd2hpY2ggaXQncyByZXNvdXJjZXMgY2FuIGJlIGZyZWVkLiBJ
IGZpZ3VyZSB0aGF0IGFueSBmdW5jdGlvbiB3aGljaCBpcw0KPiBvbmx5IGNhbGxlZCBieSBvdGhl
ciBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgbWF5IGFsc28gYmUgbGFiZWxlZCBhcyBhbg0KPiBp
bml0aWFsaXphdGlvbiBmdW5jdGlvbi4gVGhlcmUgYXJlIHNldmVyYWwgKG1vc3RseSBzdGF0aWMp
IGZ1bmN0aW9ucyB3aGljaA0KPiBjYW4gYW5kIHNob3VsZCBiZSBsYWJlbGVkIGFzIGBfX2luaXRg
LiBJIGNyZWF0ZWQgc29tZSBzY3JpcHRzIHRvIGhlbHANCj4gaWRlbnRpZnkgdGhlc2UgZnVuY3Rp
b25zLiBJdCBzY2FucyBhbGwgZnVuY3Rpb25zIGRlZmluZWQgaW4gYGFyY2gvcG93ZXJwY2ANCj4g
YW5kLCBpZiBpdCBpcyBvbmx5IGNhbGxlZCBieSBmdW5jdGlvbnMgd2l0aCB0aGUgYF9faW5pdGAg
YXR0cmlidXRlLCBpdCB3aWxsDQo+IGdvIG9uIHRvIGFkanVzdCB0aGUgcHJvdG90eXBlIGFuZCBk
ZWZpbml0aW9uIHRvIGluY2x1ZGUgdGhlIGBfX2luaXRgDQo+IGRlY2xhcmF0aW9uLg0KDQpNYXli
ZSB5b3UgY291bGQgYWxzbyBtZW50aW9uIG9yIHJlZmVyZW5jZSANCmh0dHBzOi8vZ2l0aHViLmNv
bS9saW51eHBwYy9pc3N1ZXMvaXNzdWVzLzI4Mg0K
