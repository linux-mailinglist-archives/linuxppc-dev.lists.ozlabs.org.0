Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id BF85C8CEE47
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 11:11:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TstCgUa7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmbY12rH1z79VF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 19:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TstCgUa7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmbXD0Kb5z3g24
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 19:02:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/bx6CvMs85V6Q1d+b2nLd88i4qgCkoiL3nbs0UDQpaDz9rGQQ4CE5HpXVom2Ph049Eu58ewlfpdz3fkyUGwm426zc93FHWC5i3sfheNv9w87KZfzJM/i/YTBklIYeLk97tY01xzl35iz+zvDGWO/BeyF7X/ViSLQlCyZoJ/oALjgqyZS0t1VX/yZ6b+U12jwaoonYAfpWJ51ptlppfFGqqrPPLJGwjqPgniDjlgVeSg/DyH2hT1StuOYm1YTBLi+I4wU3A5paNEhok9yyRtMIOETM/5r79qZ+IR1UtfINzq5zlOO70flhKSfVcNU0ID8MrdfuFIB8mlRmMOTVTaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+6A8zdYTXFfuZppZ4M03th9EzOGnQfX9KqOMi+EwkI=;
 b=IwX7DwkAXQhzzS2RJtUKfJhYzdB5h6zHQE558/+P/fTgH8t9toGU25D/gw3r0TQXLOq8YDQKEtT8rUuxVgZ8i9/T39DtVX6yl/ZV7KrNgkq9k/IwIn0ipF/hb0ZNlct0ZgcgxbIZJA0sDqa2hf9pKlnNgLCieuAigk8RHt5ZWf0nUcgl9jqI3q5w6Beslrrst046hBtOomN3FPhQldzJCA4JYjI2vv2cj9KH9jEZxvhPFCkzTiy6GuEyo2eVY7j6PC1oNOL/xutVIukKIS7iq1LNZ93Zxg8qojPaEv3vsqe5F/jD0nVNGvYPtxomOvdjTYrlIjXc+o64GV001wprIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+6A8zdYTXFfuZppZ4M03th9EzOGnQfX9KqOMi+EwkI=;
 b=TstCgUa7wytyQRshLWAyFvQdaJif4j9mK2kYXcgUd4cxij+e1YGofzbIBqSEH0R4k87AYZ8D+MKCFhXgCJIwLmrv8hvlPZT+aZ25zzoTyscVdOqvdAP0II70jZKD+pKHnQZ97cksrLBGTLm1MVqxkF1o+k/SAQYFJHsGKazpDsIBJv6wVoWqzatZzjT4kQMttzpIKajB13eHSneWnBOITTGtSeCe+tdCJtZslB0beHzG2gs9iK4Q/FynaOUTRPjaH2wTbTkPyZMHI4QcTHwCdxu/YQyG+Cvb50CPMebzDEdsDRjX4L7K56NszGRKxNuaep1miireA5YCeDbxKfXCkw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1815.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sat, 25 May
 2024 09:02:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Sat, 25 May 2024
 09:02:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 15/20] powerpc/85xx: Switch to 64 bits PGD
Thread-Topic: [RFC PATCH v2 15/20] powerpc/85xx: Switch to 64 bits PGD
Thread-Index: AQHaqIx3uHI/lyrVtkKRd0iDhgkRD7GnbjsAgABFFgA=
Date: Sat, 25 May 2024 09:02:03 +0000
Message-ID: <1281454b-5025-4f18-b806-ca28b5136642@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <a1d92dd7c390672c163ce0611600dde8cb0eaab4.1715971869.git.christophe.leroy@csgroup.eu>
 <ZlFvFk6QmyD-ieS5@localhost.localdomain>
In-Reply-To: <ZlFvFk6QmyD-ieS5@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1815:EE_
x-ms-office365-filtering-correlation-id: 7e6624ad-e06b-4b16-019c-08dc7c99588f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?bnRFNDFxY3ZobVhmS2lUU3F3WnpFaE9WRWpYVm5MK2hPTWp1dlo5ckZyQ3VN?=
 =?utf-8?B?RG5XREdUeFJqRUV4NXZRL3NFWGNIV09zNnIzVHFaZDZDbXJVUzFFMlY1T1Nj?=
 =?utf-8?B?ek13cE9PNmhpYStXRzNySXFYZEptdWpMTVFUaXVvV3hCckUrTVFDdjdidGpJ?=
 =?utf-8?B?RFJKMDZucWZUS1B6QytCWDRrZmtkcHhYMDVYYVBJRXZFS3JnS2FDUHhlRFFv?=
 =?utf-8?B?R0IrbGJzRitxY2NBZzQwVXEyMk1aU0s3SXA2Z0lyREowZjRTSUxmUGJCS2Vq?=
 =?utf-8?B?UkdxbGVvUHhKeHhzTXlxNHhZUGRLY2tCemFGUmVhQytWZ21JZVVZZ1cwc3dR?=
 =?utf-8?B?Mk8yOCtRZ0NSQkFPNWVYMWpDNjlRTHJmU0Ixa3l4ejZMRnBFaGw5cWV2T0Zh?=
 =?utf-8?B?MHo0ZXdsaTFKUVhncThvd3hIK0VyRGxmVW4rSWVyc3g0aGtGZkxRUzE2OGpM?=
 =?utf-8?B?cTczcEpERDkra3FxeUNNV1pCMzlJcHI4TG5UUmRVTThsckVKSGU1QlJGS1J6?=
 =?utf-8?B?MytsejZ1MnlsdGY0WmVma1RyaTZDOUJMbUtXTGgwMkFVYUNsZXd2TVhnL2tv?=
 =?utf-8?B?ZDRTWUhTdzVRQk1SY1gySWJjeVp5bmVoNnRkaGpCT2g0OGJ2aWpUclo1MUNw?=
 =?utf-8?B?Qy9jcmxsR1F2MWRpTVM0YWlsQU1EaFdDWGplNGRqWXg5ejlaQVZISmFhOVBx?=
 =?utf-8?B?ODFSTmc2NDRkdSt2anFoYUFxMFNnVlMzTE40MTMvM1p0YWFVdmFSWHZIUVhQ?=
 =?utf-8?B?RVhKZHBRbmxuS3RqeDJKZEdvWVd6SE0vdjRtTnRtZXhGZ0kwSTJlajU1QlRH?=
 =?utf-8?B?b1oyZ3I0VlJMWUlxVWtTbHBGSSs4UGRmN1ZsMm8rQlhtdFR5b3BFdzlKY3FW?=
 =?utf-8?B?Qjk5NkFUQVFUZUJSRFE3QndQL0VYY0hmTkg5ZXV2T1o2NlR6VElmV1dyamhG?=
 =?utf-8?B?WEU1K0U3eVEvSmU0cFkwL3l3dWRmZ0xZdGkxbGtzNXo1QzBzcjF2QUV0dTh2?=
 =?utf-8?B?VHNKa3B5dkNFVnBCUU51Y1Y4SWdoQU0yellsc0RVTTlmV0J3VDVFZDBVcHNm?=
 =?utf-8?B?cFpvTVRjZUd6VEFsbWkvdkt4dE43cExGNGFQVEdpUmx4WTh0NFBFNll1SFJs?=
 =?utf-8?B?aCsxcDZRL3ZEenRhNk9tMkVpRWxQSWVodHArN2xRRytZTVlVREh3aUpEOHpN?=
 =?utf-8?B?eEVoQ2dwUlNLYlpKcWdsRDVzei90Qi83QTVCRXhOWWhrN2VuSDFLQWlkcURv?=
 =?utf-8?B?S3hoMWdacTN6RWNYR0ZTSXJvd21tT055MHFyNkQ3WFZhZUhsb1cwTFNDQ0th?=
 =?utf-8?B?OGp2RHlqUjlLQmYxbDBub2xqRUdDMXJIL0J6MEhKN1Y5azNPNHpENlFtazVa?=
 =?utf-8?B?cGVJMENqU3FOWHliSGpHZUVVSndjbFNsakZUT1ZVcGVTQlpRUnZIdDBXdUoy?=
 =?utf-8?B?TmFLNkpKcmZoSHFwOHRTRCtwNTY1M2NRSVZzK3VlR2ViZ2JqUUo0QWM4a0pU?=
 =?utf-8?B?SUFKc0w0UFlydG0wSVJra1dZUGxROWgydWU0S2dQaDloWUFxTngrWHJ1MTFU?=
 =?utf-8?B?bWgwaXIzZWlobE5Kb0lCZjg1Y1BtYnZ5T2c0YkJFWU9pWm9BV2NTaGNQczZh?=
 =?utf-8?B?ZlN5M2d5azk1azZDaEkxS29FazV3ZHhndS9RRDFqNnB1dk9QcGpQcDlMTVFp?=
 =?utf-8?B?S3R6eXpZMzFnWDdHUGNoLzFWbDhTYVQvRVFrVkRqK0puYlEwcDR1aXlrVWdY?=
 =?utf-8?B?ZGV5WSs4VUtkZ1dKTkFFWnIrQ2FqQ1E2ZEdTRFVSSHA1Z0pxYXBQZkZZQ0dj?=
 =?utf-8?B?Y0J3N2ZCMjVmWDBuMlV0QT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MkdIbDdOd1RmdVNrbk8xS3VjbzV4b0o5MUxwMyt3dXc3dm9MUVUyamwzT2pB?=
 =?utf-8?B?OENJL0h4cGZVUmZNK3VwL0VyR1pCYlQyNCtveWVXQTBpdkNPc0lSKzdRaVgw?=
 =?utf-8?B?MXlYN25xTDNRMzlISHJ4UGZGb0FDTkVMQTd3OWZNTkVxeno4UTg2UmZoTHgv?=
 =?utf-8?B?SWRsVnpJMS9saGxRRnM0STVKSGxQT1k2YStHUmF1UCtwTnNZbElyUlI5UXRN?=
 =?utf-8?B?SEpWSllJajZ6YU9yYXc1d3ZmR3czYThBcDROUXhDSDMyNDZpbTJqY1c5Tnpn?=
 =?utf-8?B?Mkw2c0NhSUkxTkpyMlRrUjlMZ21WNmQrK2U2ZFZHVG1EUll3WFg0b3l3Z2Q1?=
 =?utf-8?B?dG96cmpzRkJDN0x1cFJJT0hPVjNIbVplY3Q3bGN2N2RicWlORlE5aG4zL21Q?=
 =?utf-8?B?TVNlYmhDbmovM1JSNExYZUtYbzZ4d2lrWWh2MFZaS0lZelRhVzVtTisyZFVu?=
 =?utf-8?B?TDJJcVV3SGpqMU4vWUxVU0RIZ2ZSZmQzZUlKeGRCWW96TkVYMGR2bXNMenBE?=
 =?utf-8?B?dml3MmNybDZFMnlxY2NZVmZrdWxYMExldjh5dUhzNGJxUi9JTk44SDdFYjZ4?=
 =?utf-8?B?RytQcEVXNWZsZkJWNGNPZzdTZmNEQ09Bc2w2Mm43SHhmUTIrTDBtQVVUMlR3?=
 =?utf-8?B?M2VpeUlCTnNjTkhOR041djE5akZPMzRxamxucXlEMStVSXVJVnVBODRFUFFD?=
 =?utf-8?B?T2VodWlnenE4NjY0cmUzY3ljeVRQUXZlN2dwSHJ0aWFja3RuVk5GSWNuY3FK?=
 =?utf-8?B?UzFXQWFCMUNqVy9aOWhzM1padTFFcGoyd0RtZDhNMHdYL0hDb0Z3N3p3eXlo?=
 =?utf-8?B?cWYyWTNyWmFqbnBhcTl1Yk4wQk5uc29GeHA1VkFPVU1XRkJDZE1SNTk2WDNU?=
 =?utf-8?B?dmx6Mlc0M1FsdlBRNWRWYkRqdkZYQ3lTZ1FtLzZKR2RDMGlGSHB5U3lDMytK?=
 =?utf-8?B?NG04Sm5TNy93VjdIenZ6aXFkQUpQNWg1U21vOTZiT0R0RDEvVVFjaFJjOGJY?=
 =?utf-8?B?NWpYVmRkcVNtejZjU1dBWFRidk5KaFlNMnVLM29xb0ZQakZhaFhvcTIvekRq?=
 =?utf-8?B?K0VtTjg3UFJsZXM0cDJUODAwckQ3QlJZMG9qUG9lc0JXdk50OHZXbHRBb2dj?=
 =?utf-8?B?TFprVE9RZnhVT1lMUkVIMlErbWZKOUVTUjJZcGVIS1orcUpNWk4zd1FWeUc4?=
 =?utf-8?B?cmg4TzFqbjVQTzUxTElzRGwybjNHNzFOTDM2WG9ZSERIbEE0VGp5STlJbFRm?=
 =?utf-8?B?YU0vcFk0NmtaSGhoZkJkVy9EU00xczMzZjMxTWJXQUN4RjRkRks5MEpBVE54?=
 =?utf-8?B?NllyckFBcGhGUzMxdWY1TkNVSU9JcUJQV1JpS1pqcW85UFNzMG5OSjc1YjRy?=
 =?utf-8?B?ckRvY3E5Vzc2SkJuYklsQ3ZjcDVqS281Q3d1dEZ6bVVjdmV4WFBEM2hzYWNI?=
 =?utf-8?B?dWZjVHBEb0I1VjJwR1VPRllhODNMUWRZZmlpbWg1dTRDTlhualN0WlNSUlda?=
 =?utf-8?B?clFaM1N1MWZLY21pNGx3WGtCQ3BEZjRidFVMZ05JdkE1TWpUcVUrWVdrdzB0?=
 =?utf-8?B?RWFDNXFHSEZJS2Q0VXV6MmRmRU5PcEJKQUdTUklXb205OTZCcE5rTkpzdUlR?=
 =?utf-8?B?Yld2TndaNzFFQ3lTMEZlRGhQb2NyN3BXbUVYVEVLazVWS2RGOHQ3WDRKeTJT?=
 =?utf-8?B?aFZ6VE1SUFlnWjNsTCtsUVhEcDUrSEFsbzBqZXJ4elRoRjdZMmNxTUJWYnNI?=
 =?utf-8?B?OGdDUEUzdHhjTXQvYUlmYzZLdzBkUW5CSXh6b1NwVnNqemI0TFMvclNreUtE?=
 =?utf-8?B?ZExrclJHOHB2dU0xYlFuMWFDQ2FZTEdyU3pRdEgvZDN0TisyTWZmSS9WTXN1?=
 =?utf-8?B?VFYvSWswTnJDYWFBQUkxMWRncW04bWhheldBYnREdDNNamliMDhPaE56dW9C?=
 =?utf-8?B?NTVkNldFMWdVUTVDOTRnN2Z0VGVudUp4Rjg4T2h6K0prQU9MZHJzeEx0Z0R0?=
 =?utf-8?B?azF3eVo4Q2dSU3VHWHl0T2dYQk5KeW5IQTF2UTFmQUFWR0oxRHVGMk1mbGdK?=
 =?utf-8?B?cUU4NHU1Z2RqWmxraXBqQ2pzZy81TTdYbzZscXZMWkNTQVJsY0ZyRGt4RWhT?=
 =?utf-8?B?ZnBCYys1YWJINkc4cnJ4dHZyOXdDWENpU2JSMTZNVVBFdDAvRU9xaTQ2Vkxs?=
 =?utf-8?Q?+jWU8xY8Mn5DFFgELi3KTQMv7vljnGLGplaxazJ1utpR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9393BABF71E4E49901FD9D82ECA2E7A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6624ad-e06b-4b16-019c-08dc7c99588f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2024 09:02:03.7255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GK8CZ0lhxcT03xpxm0jlHDP+MQetjEWwoSi3rNKItFBdXrKYns82vKgo+23vApL/xDKhU8ddmvz8ECOnKK80dlfW6kBQBXPTslUalC+RHfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1815
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA1LzIwMjQgw6AgMDY6NTQsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA5OjAwOjA5UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBJbiBvcmRlciB0byBhbGxvdyBsZWFmIFBNRCBlbnRyaWVzLCBzd2l0Y2gg
dGhlIFBHRCB0byA2NCBiaXRzIGVudHJpZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiANCj4gSSBkbyBub3Qg
cXVpdGUgdW5kZXJzdGFuZCB0aGlzIGNoYW5nZS4NCj4gQXJlIG5vdCBwb3dlckU1MDAgYW5kIHBv
d2VyODV4eCB0d28gZGlmZmVyZW50IHRoaW5ncz8NCg0KWWVzIHRoZXkgYXJlIHR3byBkaWZmZXJl
bnQgdGhpbmdzLCBidXQgb25lIGNvbnRhaW5zIHRoZSBvdGhlcg0KDQplNTAwIGlzIHRoZSBwcm9j
ZXNzb3ItY29yZSB3aGljaCBpcyBpbmNsdWRlZCBpbnNpZGUgdGhlIE1QQzg1eHggbWljcm8gDQpj
b250cm9sbGVyLg0KDQpCdXQgQ09ORklHX1BQQ19FNTAwIGlzIGEgYml0IG1vcmUgdGhhbiBlNTAw
IGNvcmUsIGl0IGFsc28gaW5jbHVkZXMgZTU1MDAgDQphbmQgZTY1MDAgd2hpY2ggYXJlIGV2b2x1
dGlvbnMgb2YgZTUwMC4NCg0KbXBjODV4eCBpcyAzMiBiaXRzDQplNTUwMCBhbmQgZTY1MDAgYXJl
IDY0IGJpdHMNCg0KDQoNCj4gWW91IGFyZSBjaGFuZ2luZyBtYWtpbmcgaXQgNjQgZm9yIFBQQ19F
NTAwXzY0Yml0cywgYnV0IHlvdSBhcmUgdXBkYXRpbmcgaGVhZF84NXh4Lg0KPiBBcmUgdGhleSBz
aGFyaW5nIHRoaXMgY29kZT8NCg0KTm90IGV4YWN0bHkuIG1wYzg1eHggY2FuIGJlIGJ1aWx0IHdp
dGggMzIgYml0cyBQVEUgb3IgNjQgYml0cyBQVEUsIGJhc2VkIA0Kb24gQ09ORklHX1BURV82NEJJ
VA0KDQpXaGVuIENPTkZJR19QVEVfNjRCSVQgaXMgc2VsZWN0ZWQgaXQgdXNlcyB0aGUgc2FtZSBQ
VEUgbGF5b3V0IG9uIDMyLWJpdHMgDQphbmQgNjQtYml0cy4gQnV0IG9uIDMyLWJpdHMgdGhlIFBH
RCBpcyBzdGlsbCAzMi1iaXRzLCBzbyBpdCBpcyBub3QgDQpwb3NzaWJsZSB0byB1c2UgbGVhZiBl
bnRyaWVzIGF0IFBHRCBsZXZlbCBoZW5jZSB0aGUgY2hhbmdlLg0KDQpXaGVuIENPTkZJR19QVEVf
NjRCSVQgaXMgbm90IHNlbGVjdGVkLCBodWdlIHBhZ2VzIGFyZSBub3Qgc3VwcG9ydGVkLg0KDQo+
IA0KPiBBbHNvLCB3ZSB3b3VsZCBiZW5lZml0IGZyb20gYSBzbGlnaHRseSBiaWdnZXIgY2hhbmdl
bG9nLCBleHBsYWluaW5nIHdoeQ0KPiBkbyB3ZSBuZWVkIHRoaXMgY2hhbmdlIGluIHNvbWUgbW9y
ZSBkZXRhaWwuDQoNClllcyBJIGNhbiB3cml0ZSB0aGlzIGlzIGJlY2F1c2UgUFRFcyBhcmUgNjQt
Yml0cyBhbGx0aG91Z2h0IEkgdGhvdWdodCBpdCANCndhcyBvYnZpb3VzLg0KDQo+IA0KPiAgIA0K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLXR5cGVzLmgg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS10eXBlcy5oDQo+PiBpbmRleCAwODJj
ODVjYzA5YjEuLmRiOTY1ZDk4ZTBhZSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wZ3RhYmxlLXR5cGVzLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLXR5cGVzLmgNCj4+IEBAIC00OSw3ICs0OSwxMSBAQCBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgcHVkX3ZhbChwdWRfdCB4KQ0KPj4gICAjZW5kaWYgLyogQ09ORklHX1BQQzY0
ICovDQo+PiAgIA0KPj4gICAvKiBQR0QgbGV2ZWwgKi8NCj4+ICsjaWYgZGVmaW5lZChDT05GSUdf
UFBDX0U1MDApICYmIGRlZmluZWQoQ09ORklHX1BURV82NEJJVCkNCj4+ICt0eXBlZGVmIHN0cnVj
dCB7IHVuc2lnbmVkIGxvbmcgbG9uZyBwZ2Q7IH0gcGdkX3Q7DQo+PiArI2Vsc2UNCj4+ICAgdHlw
ZWRlZiBzdHJ1Y3QgeyB1bnNpZ25lZCBsb25nIHBnZDsgfSBwZ2RfdDsNCj4+ICsjZW5kaWYNCj4+
ICAgI2RlZmluZSBfX3BnZCh4KQkoKHBnZF90KSB7ICh4KSB9KQ0KPj4gICBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgcGdkX3ZhbChwZ2RfdCB4KQ0KPj4gICB7DQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzg1eHguUyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVh
ZF84NXh4LlMNCj4+IGluZGV4IDM5NzI0ZmY1YWUxZi4uYTMwNTI0NGFmYzlmIDEwMDY0NA0KPj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzg1eHguUw0KPj4gKysrIGIvYXJjaC9wb3dl
cnBjL2tlcm5lbC9oZWFkXzg1eHguUw0KPj4gQEAgLTMwNyw4ICszMDcsOSBAQCBzZXRfaXZvcjoN
Cj4+ICAgI2lmZGVmIENPTkZJR19QVEVfNjRCSVQNCj4+ICAgI2lmZGVmIENPTkZJR19IVUdFVExC
X1BBR0UNCj4+ICAgI2RlZmluZSBGSU5EX1BURQlcDQo+PiAtCXJsd2lubQlyMTIsIHIxMCwgMTMs
IDE5LCAyOTsJLyogQ29tcHV0ZSBwZ2Rpci9wbWQgb2Zmc2V0ICovCVwNCj4+IC0JbHd6eAlyMTEs
IHIxMiwgcjExOwkJLyogR2V0IHBnZC9wbWQgZW50cnkgKi8JCVwNCj4+ICsJcmx3aW5tCXIxMiwg
cjEwLCAxNCwgMTgsIDI4OwkvKiBDb21wdXRlIHBnZGlyL3BtZCBvZmZzZXQgKi8JXA0KPj4gKwlh
ZGQJcjEyLCByMTEsIHIxMjsNCj4gDQo+IFlvdSBhZGQgdGhlIG9mZnNldCB0byBwZ2Rpcj8NCg0K
WWVzIGJlY2F1c2UgbGF0ZXIgcjEyIHBvaW50cyB0byB0aGUgUFRFIHNvIHdoZW4gaXQgaXMgYSBs
ZWFmIFBHRCBlbnRyeSANCndlIG5lZWQgcjEyIHRvIHBvaW50IHRvIHRoYXQgZW50cnkuDQoNCj4g
DQo+PiArCWx3eglyMTEsIDQocjEyKTsJCS8qIEdldCBwZ2QvcG1kIGVudHJ5ICovCQlcDQo+IA0K
PiBXaGF0IGlzIGkgb2Zmc2V0IDQ/DQoNCkl0IGlzIGJpZyBlbmRpYW4sIHRoZSBlbnRyeSBpcyBu
b3cgNjQgYml0cyBidXQgdGhlIHJlYWwgY29udGVudCBvZiB0aGUgDQplbnRyeSBpcyBzdGlsbCAz
MiBiaXRzIHNvIGl0IGlzIGluIHRoZSBsb3dlciB3b3JkLg0KDQo+IA0KPiANCg==
