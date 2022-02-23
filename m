Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C774C1531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:15:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3dNX2KYkz3cCw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 01:15:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60a;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3dN10RZQz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 01:14:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGjtBPZVWHx8R7hBkMc5Y/S72QThzGNqNu90lD8NH+kl+XdFTQ3vEaOZwBJIpPwAQb8Orxa3a9Huh/XjuIRJXo+tJt8Qj8ATH/P2RSKlF1FiFcKDMx77LjdqV2FFVLfOAAERqeV/UhrmMcr5U/QQg6VIojHvmo0mAAWQ1k1kwyU+Oao6E3BfapLI/8eOgrYn12wO76quj6NqkX5XxIhStBfCJWDHTt1FGwCSjPBrQoeY2P5iwYh38ZEnGAQSYUyI5vNKpwb7k679+bCGwEjflBx5jUF71RUkVhFAFMAQ6IBQdq6FCn3SjsKsRPc+uFD/LNpXMmVUveTZ6xb3/1ckyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBOlDlJSBsnMPAzWjI8q4xl0YlY+9dWnYPfAWOpRQwU=;
 b=RbY5H268dx7vSTRbvl2JbzJNgrHbuDr9GpU8xdGt30qtW+cGj3g6eDcuzXq8I4emqdeCX/CxgbkzrTGgu7dKS5cOe6kXc8IPXS69kCF+Kzn2tXBVaHGUhkuXFnNCHy9rbseFyVIESoqHOj+FMLhyo+Srwjt6LgjxxF0mbj7SpBzwDi6bmir0SVC2I6MQ2xcPlxFsFQ8Z9srizF/ufuopgH7ziPjSHVaKrppvudrruC6+AO+iP7tT5ZD+wbv2yD6OUDDJusSllhawKLUuTF92ySqZr/76+TcyLfKBaPOE2SaKh2VFAxqXbIHS5AMO9Pyom3ztu6o02AM3huZbW7E7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0743.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 14:14:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Wed, 23 Feb 2022
 14:14:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/security: Provide stubs for when
 PPC_BARRIER_NOSPEC isn't enabled
Thread-Topic: [PATCH] powerpc/security: Provide stubs for when
 PPC_BARRIER_NOSPEC isn't enabled
Thread-Index: AQHYBgoR93DIYut/00ex7i54QzvdKayhc0WA
Date: Wed, 23 Feb 2022 14:14:32 +0000
Message-ID: <a6751b0c-23ad-0f22-218a-cc808ad1e92c@csgroup.eu>
References: <20220110100745.711970-1-naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20220110100745.711970-1-naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 981dc8d4-c6b5-4750-ed39-08d9f6d6d014
x-ms-traffictypediagnostic: MRXP264MB0743:EE_
x-microsoft-antispam-prvs: <MRXP264MB07437B0AF4A1F8F841118583ED3C9@MRXP264MB0743.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYQY73fuUesiZ768APxWoGxzEHVINvdF+nCxmBLi28OM3/YJN+1Wqp9+iBIuwagtZmGGIyJ1Mwz4bmDYj+kA0YePpKv0HnAHfvX89gGM2UliiKMBmGNT8o7KEOCHmRFnoojzFKJAzI92GkSoHN9i5kO5rnROWDRDtawOhgH3qhU9gBCwUpBiwDY2L819RsEaTJj/hds1GhM3HauM0bOCSpEL/gcHVJJKQfVQTUffktQ5FYLOfT1HiUQoBMeO8wVkn8UnRYg6vmTCumYW1cg0ebdMx6cP/IJLEem7Xl+csMTxEenqUIZG7X27F5q1kBc6mJwwvAKumeDAmTVMnUcuQkpEVGJnb2vCI8UFSh7gjY2WFhKjTZLmpC0o1oJq9u6OvcTYwpgvl87c4b1wqZBj8MZAeiXI8LPBulj73MPg3b6BurzmoB09YzU0lb79WZDnX70L6z7138fbRZU4juaN3qQxmC+F0exwHDtUgNRSVAEVdacIZpaz08qV8XyJ3XQchOHHOyE/7YD6cLchnBbTlh7U7ieBZGN3UepYb1myN8O+oHCw+vDJCZWiwUX5SDwpVIxIAbvxSJuH3itNBPaLS/QwMN7M+9GJySJxDlPL4zcOP3H6dM+vERdFG2fzTUXhXK9Gcx2Q/NaCj9PVSYau0i34AY4jyseaqh2zqFsjOvnRmIMfEXIazNdOxNzL7Wc4VBS7uTKzKL+BKC78myycgWsA/ED/T/N1Wej8uPA8ZPjiv5/Jd9wjK7C6E/D/7M1BSvyONrt2gfef+6zYG57fvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(26005)(66556008)(36756003)(15650500001)(83380400001)(44832011)(186003)(64756008)(31686004)(66574015)(66446008)(2906002)(122000001)(4744005)(66476007)(76116006)(2616005)(31696002)(86362001)(6512007)(38070700005)(6506007)(54906003)(38100700002)(8936002)(71200400001)(8676002)(4326008)(91956017)(110136005)(508600001)(6486002)(5660300002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjVnZXpmbTgvZXZZemhLWUliWFNCZndpQXMzQWV6RjhFQVIzWHNQYk5nRWZt?=
 =?utf-8?B?eVlBTnNMdWMrWnZwbXQvWEdvYm1GcjluNTFSTUZ2d3ZwSnZrNWgzTlZLYVVt?=
 =?utf-8?B?UDExNkVnT2ZqVVlMVWFqRThiMVJ2VmFYbURia3FOU2JHdGNzREQwUDJvSm05?=
 =?utf-8?B?Q1FhcjlYQVRyNkUzWEhWVlJvQ1Jwb3JPazlTZFlzdGRqcUJFUGJKTmVYSW8w?=
 =?utf-8?B?Ulk1RnBjY0tzSUd5TldwN3JMVTNVLzA1emZTOXRTek5EWE9xNHk4TForVTVz?=
 =?utf-8?B?ZHJ5UnNlaFlWaEE1cENSejQyMzAwR0FQWFB4dnE1aDJjZzJlOWZlaXNSRnJh?=
 =?utf-8?B?MVJpYjNVdEZOdklqb3A3YmgxVUF3QkZ3ajc0V1Y4dWttK3dFOVgvVDhGTC9k?=
 =?utf-8?B?dTVpN2xhWTJsa3lQMUhIdndsME5zU3JTMXFrd2I1MTRrVEcxVUFnSmtPYzNa?=
 =?utf-8?B?NjZlY1pCaDVHZXV4SUgyN3NuZ0RLcSt1RU9HODBERVJNOVpNMlNOU0lVci9Y?=
 =?utf-8?B?N3IrUmExaXJhcXIxTlR1N0RkajIwdnYrSzVIdDhjQXFYdStvY1BJdXBPM29D?=
 =?utf-8?B?bGlRNll0eVRvSERWTDhUUEhRSllON1Vjcy93ZzNWK0JiTHFjZG95WFlBTENs?=
 =?utf-8?B?V0gyNTVkVk9taWNBOE9vOGZKYXNkcGVHUXFJZDFFekoxbXpwaGpnbmtSUTY4?=
 =?utf-8?B?SlJPeFFoZ1NQTWJRUjhEMWY1MmZuTTI1VnliZW5hQUgwVjE4V1pBSWMyNElY?=
 =?utf-8?B?dmxqcTJMRnRkVGpLdGJobnJOdTZMRXlYNTNHUVhJVjhrZU8vd0Myc1QveVM5?=
 =?utf-8?B?S2diMHlhbXJxa0ZheHFaQ05GdkNyTTg1ZXd0VW8wM0xES1pjaXVQRU9BdTRU?=
 =?utf-8?B?aE11TUozMTIwV293Smp1RnpHMjZBZUpmTFJ1KzIvdUpqRVoxalZUM3FXOUZr?=
 =?utf-8?B?ZlVTRXBpQkNzOU9CcHVTMG13RnVtYVFGRXpTTmxncGlSY3J0OUo2KzREOG42?=
 =?utf-8?B?ek1jOG9zSEF3dG8yOEZyaVVsNGdYNDVJdmxJN3FwQTdxRkpCNXNUbk5UWGQx?=
 =?utf-8?B?bGgwWE94cG55dXdpNFNKaGJtd28yWmlzdmd0d21lUitkODNJREJ1MVRtRXZ2?=
 =?utf-8?B?THpiQzdBaEdPL3NnYlEzbzQxS0hUcVhtZlZySmFycGowRk51ZHRSUEJVRzAy?=
 =?utf-8?B?azM4bWYrYTR2eDJPcVRoenpIQTh1eEpQYzczZVkxOW1iUDJOeTBmUGc5SjlQ?=
 =?utf-8?B?SU5vQkVVdSt3a3ZmdW5UUVk4aGJyRExLbnh6b1BEL00xcUNvMDNlMmZFK3hU?=
 =?utf-8?B?UkgvcHZjTmw3NzVraGlmaGw3MkNVR0N4ZFJBVFJ3MzR3eUFNOWxEeTNXOWp3?=
 =?utf-8?B?OWhiUWt2OE1oMUlmL2JYOUloYWsvQytiaU05bE9RSlJNZ0ZoZEIxOGYvZ1A3?=
 =?utf-8?B?K3FRN0VhMmJDdHo1N3puWlo4MGFPSmRweXVqTG9OR0IxRjUwdjNiRGh1SXkr?=
 =?utf-8?B?MnJkZFJ4b2VLa0V0OVljV25mdFVJNUc3T3VvRXVYQnVHVm1JaGhjS1VsbTVa?=
 =?utf-8?B?cmhYUFFpenFMMFFOWVArWFJyOHM1cWg1aTdrVUpBWjE1SVNqRXE1LzFFVks3?=
 =?utf-8?B?ZmQ3d1dBdWZleWdDNXRYRUpvVHMxR2lZRTBjSTRPelJyYnNkUElkeEkrN1Ax?=
 =?utf-8?B?b3FBMzZnZ2xTTVFPTG94L20vRjdUUDBYNmxwblRHWmNUWldRQjZyMHBtdmdh?=
 =?utf-8?B?MlcwYjRxV0tFQ0xUS3VJSlNsQkRJSWtJRGtPSWRqb3pzMEhHaStKM2hXQmdq?=
 =?utf-8?B?eWVNMGFqbmczMklFQ3poTG4xamFZUm5Ua3EyZ21JVEwrYkdGZzBiazYyZUJh?=
 =?utf-8?B?VWMvQzVZNHQ2QW93TTNyYktod0c3UkFSSi9kZlFaRjNwTGNObDhXL0JvdVFu?=
 =?utf-8?B?TUkveHlsQTdWbXlua2tvSTcyajM0Wlg4Q01McHIwZk82WG5jckNQQkFuMExh?=
 =?utf-8?B?dVFqNmtOa0trOW53UkVWZDFrR1VtNkFndjk3RENGeFJNeXN0dW9KcWV6ZkRv?=
 =?utf-8?B?dzNTQzlETTBiS3BXaGM2WkF5WnkyaUFuOWJSTkdlUVUwaTUxenp5VElWL2hR?=
 =?utf-8?B?RU9IaGx5TTBVYnRtaGxWUGk3aDRpS29PRGZQRitaVW9PZEpPeUZsVjQzMmZw?=
 =?utf-8?B?YmlLNERVUVh1UVFjdUd6SkhRc2pqMjBkb2pidXFzVEFDUm02Nzgvb3UwNnNO?=
 =?utf-8?Q?npqruSPL3dhpKrmfFuoCE6wyScb6HsOUZssCM2JRSI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EAB565CE50B564C87524C3F1AE30F0F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 981dc8d4-c6b5-4750-ed39-08d9f6d6d014
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 14:14:32.3477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3i04th7jp02IhlMuqgyZ9wmm4fgkuoUabVGIGJ5IcJaSUcDP/wAQD3swwlgG97PPCF2SU6BQFvhdZcrLA+DaYcGGkOdxxmz7Kv5f5MRuqXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0743
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
 "lkp@intel.com" <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzAxLzIwMjIgw6AgMTE6MDcsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
a2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0ZWQgdGhlIGJlbG93IGJ1aWxkIGVycm9yIHdpdGggYSBy
YW5kY29uZmlnOg0KPiAgICBwb3dlcnBjNjQtbGludXgtbGQ6IGFyY2gvcG93ZXJwYy9uZXQvYnBm
X2ppdF9jb21wNjQubzooLnRvYysweDApOg0KPiAgICB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBw
b3dlcnBjX3NlY3VyaXR5X2ZlYXR1cmVzJw0KPiANCj4gVGhpcyBjYW4gaGFwcGVuIGlmIENPTkZJ
R19QUENfQkFSUklFUl9OT1NQRUMgaXMgbm90IGVuYWJsZWQuIEFkZHJlc3MNCj4gdGhpcyBieSBw
cm92aWRpbmcgc3R1YiBmdW5jdGlvbnMgZm9yIHNlY3VyaXR5X2Z0cl9lbmFibGVkKCkgYW5kIHJl
bGF0ZWQNCj4gaGVscGVycyB3aGVuIHRoZSBjb25maWcgb3B0aW9uIGlzIG5vdCBlbmFibGVkLg0K
DQpMb29rcyBsaWtlIHRoaXMgY2FuIGhhcHBlbiBvbmx5IHdoZW4gRTUwMCBpcyBub3Qgc2VsZWN0
ZWQuDQoNCkJ1dCB3aGF0IGtpbmQgb2YgQ1BVIGRvIHdlIGhhdmUgaWYgaXQncyBub3QgYSBFNTAw
ID8NCg0KQUZBSUNTIGluIGNwdXRhYmxlLmMsIGlmIG5vdCBhIFBQQzMyIGFuZCBub3QgYSBCT09L
M1NfNjQgaXMgbXVzdCBiZSBhIA0KRTUwMCBvdGhlcndpc2UgdGhlcmUncyBqdXN0IG5vIENQVS4N
Cg0KU2hvdWxkIHdlIG1ha2UgS2NvbmZpZyBzdHJpY3RlciBpbnN0ZWFkIHRvIGF2b2lkIHRoZSBS
b2JvdCBzZWxlY3RpbmcgYSANCmNyYXp5IGNvbmZpZyA/DQoNCkNocmlzdG9waGU=
