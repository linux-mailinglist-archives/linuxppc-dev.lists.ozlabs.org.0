Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999792E238
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 10:29:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=rnD1cQMu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKSYt1SVnz3dT5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 18:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=rnD1cQMu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2612::62d; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKSY96tFsz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 18:28:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqL6p/GmKgGvqrqjxLCccDYfkaUaauzhxqkCjVJqUYAOH5T+WTdVlWdBIj6IGzAWHBW7owyvpKF2x4143l4lGOoIL0Bp0/XixchUEc9MczRONC4I/O2ug4qgK26n2URdc0ZiA3tfnq5LdDOq0tNl1C4NCKn52XvGXfVvhqXi+Zb48YMTu9CIo9tRYxZK/6irpRJSbWGhX30UUAaMp/Et3/P83c/M5d70ubJpGMIcm/BGbhSxT29SVNfM0ormkMzqzg1apFPjZbcocWiRHb395u92cF7RKPF8xXjCP7UH9whVGQTRMMM5tO47ln5JHXzHMIYoAOU/KwVvlhErwO4RGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6FazxyFZIIJ0Td++Nqx44iJ5csK+kt41nSXgki7NO4=;
 b=A5VCyLqBfajSz+0+9hyP6ByTTDp5SRULQdluwT8sfhZHRas11d3bMenEqCUSgMEmzyYYo2UHtKHxCO/VPxTwBk87Yk59lu7k+ctjghr5YN2jI2a2c+l55lLQcAyOGYcNMNOntO3JwZWDRu10TUOeZin2N1u4VFzrCCpsJ29pHD3vz0OYx60QJdXBK2Vx0Bd8ULVANHb1uz1e8Q9c5pwIWf7NZvICznbC5/6SR2l5mrIJiDeJlfpkRgIZWUL8Fc4fJSDu5SHNKJuDg99cBOH19SWU9UKc0GC0QVyPGwYrpFcQvjdcATcZ1djFg+xEmFe0kk9BP2L1vZW87cJHjyB0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6FazxyFZIIJ0Td++Nqx44iJ5csK+kt41nSXgki7NO4=;
 b=rnD1cQMutel/OjOFhS4m877iiGW8V+NKW5iT9d4R/OLoAmX/bJVtjhOnGyCexzTphUnZEd3EmTxWDSIXVB4eOFiOzubCgTR0kiw4cLmrk+fQQM20se+1uLETzBAtEviDJPWcopsVa+gs+3N1JihwZwsTj/vuALDJPPbRChZdK1YjAzdngfDrei3R1NZFuMn6ri/w20sqqDKOwflp3gY8mBJbRABZQF2Sn0NJ9rLggNyYIF+McQuSZK2g27A3l4X6E416/zpX0MmYfA6hndf+6ifymYLyOSa9V8OsNowyQ7B/fDfT0cnm27e6CpzWIA6pJWs60R5eISNbShguVAphrA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AS1PR07MB8783.eurprd07.prod.outlook.com (2603:10a6:20b:47b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Thu, 11 Jul
 2024 08:28:04 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%7]) with mapi id 15.20.7784.005; Thu, 11 Jul 2024
 08:28:03 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Suren
 Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lstoakes@gmail.com>, Matthew Wilcox <willy@infradead.org>,
	"sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Bert Karwatzki <spasswolf@web.de>, Jiri Olsa
	<olsajiri@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, Dave Hansen
	<dave.hansen@intel.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Dmitry Safonov <dima@arista.com>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Thread-Topic: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Thread-Index: AQHa0v6x9tK7ARqshUC4xDWzrUrlcLHwcueAgAAoXYCAAJc8gA==
Date: Thu, 11 Jul 2024 08:28:03 +0000
Message-ID: <26f9353e-fe0e-4a2e-ae12-8021f0c7bf40@cs-soprasteria.com>
References: <20240710192250.4114783-1-Liam.Howlett@oracle.com>
 <20240710192250.4114783-18-Liam.Howlett@oracle.com>
 <3843b797-8e31-498c-adff-153f9568505e@cs-soprasteria.com>
 <kuzulyzpa35xs7wevnklswchebc5xgnvtxpqly3wisfb7d34mp@npelpwy3h5wv>
In-Reply-To: <kuzulyzpa35xs7wevnklswchebc5xgnvtxpqly3wisfb7d34mp@npelpwy3h5wv>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AS1PR07MB8783:EE_
x-ms-office365-filtering-correlation-id: 97d0ad3b-ebe7-4441-95bb-08dca183621f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?cUpkTE4zS2cvRHAzaW9PVnZ3NzFkNlMvMzhOWUNjV3FjTXpQQ0pxRmhwT2JS?=
 =?utf-8?B?ajFWZkF4QmhMOTBRaU92Y3FiMTRXeWhQRiszNGdzdy8vYklVeWRxN3lYNFgr?=
 =?utf-8?B?R3lObW0wQ2FSRzE3emp2L25rS1JySlExNitLTGwyWjFIWWVYSnFtVWpVWkN2?=
 =?utf-8?B?L2ovU3N2Sno2SHVIOHhweS9Cc3JLU0lyYkVoamVGWHlYM2d1QlBZVktPa3ND?=
 =?utf-8?B?K0pWT2t3eFhnR3pvVlVpMjVvb2RpQ2pYZzhGVWw5aFBNaUlsc1NBRXBNdWcv?=
 =?utf-8?B?TUtHTmJlS2pjRU9TS2ViOTVpK3pWbzJZQ3ZRTGhSNU5TMG9rRnBtU25IeHA2?=
 =?utf-8?B?YlJaVjB6OEJqTlQ0d1BzTUpxdmtFNVdrcXM1YlNRWWp1QzdGanMyR0FNYy9k?=
 =?utf-8?B?UWM2d1g0U3ovMlhZZ1dNQURvem9jOThjZlBhWEhsMXZVb3RXTVJFUGRDT2J1?=
 =?utf-8?B?M1pXRmFTOEJodXVFN3hVd0hnck5yemlzT2VtZEpETDNYVlBjYzFOOVRlakJ3?=
 =?utf-8?B?SCtZS3hGcXpUOTVHVVhlM2dGZmQ5MDZEYVZ6TXMxRjdOTVZyeEwvR2dOS21l?=
 =?utf-8?B?WXE5S3p0b05lN2JKMjBtMlllQi9MM1lSek1EOU1iYVdRT28yeXV0VXY1K1Q1?=
 =?utf-8?B?Q2dhNUVSeGxGaSt6S29PME1FRnBLR0d1YlU2RVJaRVFtM2xscGcxbUNxVlp4?=
 =?utf-8?B?Tmd2V2NNa2dZUHpKMks5bElwTWhZQ1hvaDNLeS9YQUJKMUVROTlQeFAwZGE2?=
 =?utf-8?B?NWViNU83alU1bkN3b2ErNkdPVVVyV24vYnRXOFhkaFRxTGFyTXZUZ05MWnFu?=
 =?utf-8?B?NGcrdy9tRWE5UzFQU2haQ0IxaGQ4OG9FSWVpajE2UzI2dUNtYkJlbUlSSUNt?=
 =?utf-8?B?dkRMaFN0bG1ESXdiQkRnZkVsTUplRUZoV0dYYzhFczB6emxMcUhnK3J4RTcr?=
 =?utf-8?B?ZHNZeFJwME5kN1JRQUZudHNTcG5jOUJpN0NmS0JQRkVscEErZy9Pc1d0QVNy?=
 =?utf-8?B?dFFjUUNOVzdXQVVZU0tlNTRKVk5NTkx2MFhYNVB5RWF0UHMrR0xLWVE3emdL?=
 =?utf-8?B?d21Qa21GMkpOUjRrVFhkMkJxZjIyVUFaZnFDcVBnQXlBL1cxVnZvNzVTYUFY?=
 =?utf-8?B?YlpadWJzcUVlbTlKM2VlYnRRM3ErWjV6RWc2MllmMU5zUDdpMnFEZzZaRFdi?=
 =?utf-8?B?aUZmcmlaaGhoWEJFL1MyZ3luSkRCV29GWUQ3VzNiUmpKSytMdkhlWjZBMzlL?=
 =?utf-8?B?eUJSQVVkVkNFVTR6ZFVLZWNrV3ZaWGJ1NlRleGxzY3JEc2gwN1RUYU1KSlA5?=
 =?utf-8?B?UWdGSnRMZXVyU0xXczUwSGdQeDdTdDRjc2tVelQvMGF1Q0hUNnEwNGVGNVpp?=
 =?utf-8?B?dldqSW1tV3RheWxlR3FJUHRpRng1SGZuRm96K3ZuNVhEdnRiU2NNVk5ra3Vt?=
 =?utf-8?B?MTRHMUx3NlcvZ2N4OEtSNnpVUzFZNnpjV0RzZ3VvRk5raWt6S1lEWnY2TkNp?=
 =?utf-8?B?RFY1aHBJMVhuUlpaSHZueVZEK25FV2JaV1lwQlArbGRGeHVhS0tLUFAxODZl?=
 =?utf-8?B?VURjWUsyTDMwVWk2V2MxZW5ONHZ2SjUrRVZPRjhjUW9yOW15WGo4bklyc2x4?=
 =?utf-8?B?NjBBcEdhUHVLTXE0MmJIYUZrenJENCtDemtvRW9GaGorK0Y3T3d1cjBzSnAx?=
 =?utf-8?B?cTRDb2pNY2NkOGo0TDJ2cGJpcmVGMXpYYkE2NDJXUW5LRHkvK2xYNW12RVRK?=
 =?utf-8?B?aTNVdFJmRi9JRHluNzFlSzBFVGppbUdmb3R0alJmMXd4b2RIOWMwOW5ZcHdh?=
 =?utf-8?B?UXpZN2x3M0NTVEx6cmVGY2k1ZmxWNkc1cGtOZE43OTgxUWYwSlBwVExmajU3?=
 =?utf-8?Q?ns+vlpAmRxmhT?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OEpHaCtidGZnNklqT2djaEw2ZzYrejgzWTBuSTJxRmFFZFhKaWVHOHROcVNS?=
 =?utf-8?B?bHhqOTdHcFV0RS9KbWNObFIxYlFTY25QeEdhSGdEWFh6ZHNORW5NeWhoM3Zt?=
 =?utf-8?B?a3IxMkd6VXVOSzE2S011OHpvOWJibDBvbXYzeWFlS205Ym1NTXQyNmlBMnV4?=
 =?utf-8?B?b2MvMGNjZm5FbWcyK1QwcGloYU0wRHhDenUxUlBuaDZzMDNkTnowU3FSVE9o?=
 =?utf-8?B?dGtFUHBnaXRZa2VoWE9CczZrWkY4MDBPOXl5MlRjWXU2Qml5L3RWM2MxWkJX?=
 =?utf-8?B?Z3RSdzdINE5kaU4yLytzZllleGx1RFRER1gwSVFwTklodmkzQnNWcmw1VFZn?=
 =?utf-8?B?Z05KYTVGazlaM215OWpvYXNzSFhuQUVzTDZndUJoeXB5VEdaK3ZIVjNhazEw?=
 =?utf-8?B?aEtZVjJtaGE3TlNLSEtJM1doOERHNDhHOFpwbW5xWXVVNjdiUjdkdENKckFR?=
 =?utf-8?B?eUlSMjN3ZTdsVUZMY0tuY0tnVkhQWG5LSFBWcTM3elQ1SGVZWCs5SmpzdEp3?=
 =?utf-8?B?Tkd0NjJyRHVlRWlxeW9pNGJGWXc0Wkt3Z0VNUHRPdjZsQVFxTDNlZ1J4QlpX?=
 =?utf-8?B?Vi9Mei82dkV0WmkxOVVjREJsVnFSMGZvRis0bnpsckdvR0I1YnR0YUIzcWtH?=
 =?utf-8?B?ZkJNTUtpcm9rb2FxUFRyNi91ekYrbEFBVU9xUDFVU2N2aVJjZXRaRXJPeEpX?=
 =?utf-8?B?QnZKUDZydjlycFN2MUtqOGRlOHFTZW1hbDgwZlRTSUxaOHVYbS8xVlBsRjg3?=
 =?utf-8?B?UWFJQ2xvS1RiMXNtckwvUXp3YUhpN05Bc1lFQnIxZDJMQ25QVXhXV251ZGR6?=
 =?utf-8?B?NjZVbGFMN2FxWHI5bks5OW9hL0NKVmRzWFFnMWNxMkFTcUo4R1pwVlUzcTJE?=
 =?utf-8?B?RXhQMFhjQWpaR08zVUFGcjNTNlZpT3MxeS9PenNjaHFwd3pRdHN1UHdQVitu?=
 =?utf-8?B?S2JDazRCSVRkSkc1c3dzU01tNTJ4YmpVc09rM2NDUmpTbWl1TlJLWUJoL01X?=
 =?utf-8?B?ZE1Sci9CQW1yQjZIOVpWQXYwclY3OXIvVndDdFE2UlV1Q2pFK3ZqdStTMm9u?=
 =?utf-8?B?cXJFNGR3ZXdPMm1pTnhNNDl3WS9nbTlNTnFsRUtWQ20vQ005WEdGSXg0Wmcv?=
 =?utf-8?B?b2Z6aVRXM3lVdmpDcWpmUWZMVkxXdEJUM2padDNLbVQ3OGJOd3dRQ0ZtQml2?=
 =?utf-8?B?dzk5Y21xZFpNangvMjJUWnM1dnNVWjVtNUF0b1ZmYXNmeTl3MGNlU3h0Qk5s?=
 =?utf-8?B?bEV5NGFSOVFuRld2YmtxNTVhMjBlSDVwelNYNEZTZjRScGVXK1pMUGdqSDJN?=
 =?utf-8?B?eFR1RW1TOEZRRE5JSXlrbFpkOVU3SDROK25zc2Y1UTRLVG9kTWZJbVFqbll2?=
 =?utf-8?B?OHlFZHlvZHBXVVFCOTNFTmJjSUlzUlZkZjk0MFAraDRZWUt5Z1JxZGgxc1Fy?=
 =?utf-8?B?b1ErUWJhRktkZkJUV1g5TDVoQkoyS2FHb2hMd1NpZlI5UDhyb1JHeEZNMERC?=
 =?utf-8?B?NS92SWpRcFBoR05Ec0pzbUVPQWhwY00ra1BzTFRraG1RLytBTDh1Y1ErR1FT?=
 =?utf-8?B?S0huOTNhVG9jT1R5azVMY1pNS3A5bWhlbXJvN0FjMllvb1Y0ZEJ0L1R3N1dU?=
 =?utf-8?B?ZTBjYk9VZ3JITmU4NTB3UHRWSCtSSksxaXFxSTNGalpEVU1lZk9lYnQ2SWt0?=
 =?utf-8?B?TlpGV0xMK01LeVllek1xbTJFZXd0OUNBbTFGamdRRmlPbDBIR282RGczYTJ3?=
 =?utf-8?B?TWtaRXpWWVFqSXB6ZzhuRGoxaE1hWDVTMm04RGtOZlYrWURNVjhqeStyT283?=
 =?utf-8?B?NEt5TDcrUUtjdzFwVEFnNWFLWmZxZ296VWVPWmIzYTdibm4ybndXdTBXcy9J?=
 =?utf-8?B?NFpZbms0U09MZmN4UXltRUM0VllGVW5NbncyRUZqRlJxeDFEZWpOMW5KRjBJ?=
 =?utf-8?B?cWg0R1VzakpsNWxWQ3hEbTg4ZmdGc1dkZEVIb2RtZ0F3VzNDbmJSemlFNTA1?=
 =?utf-8?B?OC9TU2hqS2xPblgxR0EzUHhqYXJtaWwyR3FpMjlJdGZ6TmdWdXA2SGRZOER0?=
 =?utf-8?B?dTVGRyt1ZDhZRmsxUUFkM0VOMTFHaEdGSmswZnJpbjZ5RVVlNm1lQ0JId0g4?=
 =?utf-8?B?QmZWeE51eklJZ2VJdElGbG1lSlRkSkNBZ2dUTWdiRmxoYVJUVGp0QThZNmdF?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DD2041094197147916B56EC1857BBDD@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d0ad3b-ebe7-4441-95bb-08dca183621f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 08:28:03.8514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPSt3cOCwsOvLv648HIdeDCWWevguftt29pN9j7Q1Niin0btLUrS1hXR7E7jsWQmSaL/sr4UQhHHX9YrTZKh5wezGqpXDklDZmSj7Yd6cPZB6MQihXHuLT+AjM6VZwRM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8783
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.128.88.60
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS1PR07MB8783.eurprd07.prod.outlook.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA3LzIwMjQgw6AgMDE6MjYsIExpYW0gUi4gSG93bGV0dCBhIMOpY3JpdCA6DQo+
ICogTEVST1kgQ2hyaXN0b3BoZSA8Y2hyaXN0b3BoZS5sZXJveTJAY3Mtc29wcmFzdGVyaWEuY29t
PiBbMjQwNzEwIDE3OjAyXToNCj4+DQo+Pg0KPj4gTGUgMTAvMDcvMjAyNCDDoCAyMToyMiwgTGlh
bSBSLiBIb3dsZXR0IGEgw6ljcml0IDoNCj4+PiBGcm9tOiAiTGlhbSBSLiBIb3dsZXR0IiA8TGlh
bS5Ib3dsZXR0QE9yYWNsZS5jb20+DQo+Pj4NCj4+PiBUaGUgYXJjaF91bm1hcCBjYWxsIHdhcyBw
cmV2aW91c2x5IG1vdmVkIGFib3ZlIHRoZSByYnRyZWUgbW9kaWZpY2F0aW9ucw0KPj4+IGluIGNv
bW1pdCA1YTI4ZmM5NGM5MTQgKCJ4ODYvbXB4LCBtbS9jb3JlOiBGaXggcmVjdXJzaXZlIG11bm1h
cCgpDQo+Pj4gY29ycnVwdGlvbiIpLiAgVGhlIG1vdmUgd2FzIG1vdGl2YXRlZCBieSBhbiBpc3N1
ZSB3aXRoIGNhbGxpbmcNCj4+PiBhcmNoX3VubWFwKCkgYWZ0ZXIgdGhlIHJidHJlZSB3YXMgbW9k
aWZpZWQuDQo+Pj4NCj4+PiBTaW5jZSB0aGUgYWJvdmUgY29tbWl0LCBtcHggd2FzIGRyb3BwZWQg
ZnJvbSB0aGUga2VybmVsIGluIDQ1ZmMyNGU4OWI3Yw0KPj4+ICgieDg2L21weDogcmVtb3ZlIE1Q
WCBmcm9tIGFyY2gveDg2IiksIHNvIHRoZSBtb3RpdmF0aW9uIGZvciBjYWxsaW5nDQo+Pj4gYXJj
aF91bm1hcCgpIHByaW9yIHRvIG1vZGlmeWluZyB0aGUgdm1hIHRyZWUgbm8gbG9uZ2VyIGV4aXN0
cw0KPj4+IChyZWdhcmRsZXNzIG9mIHJidHJlZSBvciBtYXBsZSB0cmVlIGltcGxlbWVudGF0aW9u
cykuDQo+Pj4NCj4+PiBGdXJ0aGVybW9yZSwgdGhlIHBvd2VycGMgaW1wbGVtZW50YXRpb24gaXMg
YWxzbyBubyBsb25nZXIgbmVlZGVkIGFzIHBlcg0KPj4+IFsxXSBhbmQgWzJdLiAgU28gdGhlIGFy
Y2hfdW5tYXAoKSBmdW5jdGlvbiBjYW4gYmUgY29tcGxldGVseSByZW1vdmVkLg0KPj4NCj4+IEkn
bSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kLiBJcyBpdCByZXBsYWNlZCBieSBzb21ldGhpbmcgZWxz
ZSA/DQo+PiBXZSB3YW50ZWQgdG8gZ2V0IHJpZCBvZiBhcmNoX3VubWFwKCkgYnV0IGl0IHdhcyBz
dXBwb3NlZCB0byBiZSByZXBsYWNlZA0KPj4gYnkgc29tZSBjb3JlIGZ1bmN0aW9uIGJlY2F1c2Ug
dGhlIGZ1bmN0aW9ubmFsaXR5IGl0c2VsZiBpcyBzdGlsbA0KPj4gcmVxdWlyZWQgYW5kIGluZGVl
ZCBhbGwgdGhlIGRpc2N1c3Npb24gYXJvdW5kIFsyXSBkZW1vbnN0cmF0ZWQgdGhhdCBub3QNCj4+
IG9ubHkgcG93ZXJwYyBidXQgYXQgbGVhc3QgYXJtIGFuZCBwcm9iYWJseSBvdGhlcnMgbmVlZGVk
IHRvIHByb3Blcmx5DQo+PiBjbGVhbi11cCByZWZlcmVuY2UgdG8gVkRTTyBtYXBwaW5ncyBvbiB1
bm1hcHBpbmcuDQo+Pg0KPj4gU28gYXMgbWVudGlvbmVkIGJ5IE1pY2hhZWwgeW91IGNhbid0IGp1
c3QgZHJvcCB0aGF0IHdpdGhvdXQgcmVwbGFjaW5nIGl0DQo+PiBieSBzb21ldGhpbmcgZWxzZS4g
V2UgbmVlZCB0aGUgVkRTTyBzaWduYWwgaGFuZGxpbmcgdG8gcHJvcGVybHkgZmFsbGJhY2sNCj4+
IG9uIHN0YWNrLWJhc2VkIHRyYW1wb2xpbmUgd2hlbiB0aGUgVkRTTyB0cmFtcG9saW5lIGdldHMg
bWFwcGVkIG91dC4NCj4NCj4gSSdsbCBhZGRyZXNzIHRoaXMgYWZ0ZXIgdGhlIHBhcnQgSSBtaXNz
ZWQuLg0KDQpBZnRlciA/IFdoYXQgZG8geW91IG1lYW4gPyBJdCBuZWVkcyB0byBiZSBhZGRyZXNz
ZWQgX2JlZm9yZV8gcmVtb3ZpbmcNCmFyY2hfdW5tYXAoKQ0KDQo+DQo+Pg0KPj4gT3IgZGlkIEkg
bWlzcyBzb21ldGhpbmcgPw0KPj4NCj4NCj4gSSB0aGluayBJIG1pc3NlZCBzb21ldGhpbmcgaW4g
cmVnYXJkcyB0byB3aGF0IHlvdSBuZWVkIGluIHBwYy4NCg0KSXQgaXMgbm90IG9ubHkgcG93ZXJw
Yy4gUG93ZXJwYyBpcyB0aGUgb25seSBvbmUgZG9pbmcgaXQgYXQgdGhlIG1vbWVudA0KYnV0IGlu
dmVzdGlnYXRpb24gaGFzIGRlbW9uc3RyYXRlZCB0aGF0IG90aGVyIGFyY2hpdGVjdHVyZXMgYXJl
IGFmZmVjdGVkLg0KDQo+DQo+ICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCBvdGhlciBwbGF0Zm9y
bXMgc3RpbGwgbWFwIGFuZCB1c2UgdGhlIHZkc28NCj4gKGNvbnRleHQudmRzbyBpcyBzZXQpLCBi
dXQgdW5tYXBfYXJjaCgpIGRvZXMgbm90aGluZy4gIEl0IGlzIG9ubHkgdGhlDQo+IHBvd2VycGMg
dmVyc2lvbiB0aGF0IGNsZWFycyB0aGUgdmRzbyBwb2ludGVyIGlmIGl0IGlzIHVubWFwcGVkLg0K
DQpZZXMgb24gcG93ZXJwYyBpdCB3b3Jrcy4gT24gb3RoZXIgcGxhdGZvcm1zIGxpa2UgYXJtIGl0
IHNlZ2ZhdWx0cyBzbyBpdA0Kc2hvdWxkIGJlIGZpeGVkDQooaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC84N2ltZDVoNWtiLmZzZkBtcGUuZWxsZXJtYW4uaWQuYXUvKQ0KDQpDb3VsZCBiZSBm
aXhlZCBieSBwcm9wZXJseSBpbXBsZW1lbnRpbmcgYXJjaF91bm1hcCgpIG9uIGV2ZXJ5IGFyY2gs
IG9yDQpjYXJyeS1vbiB3aXRoIERtaXRyeSdzIHNlcmllcy4NCg0KPg0KPiBnaXQgZ3JlcCAtdyBh
cmNoX3VubWFwIHNob3dzOg0KPiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11X2NvbnRleHQu
aA0KPiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oDQo+IGluY2x1ZGUvYXNtLWdl
bmVyaWMvbW1faG9va3MuaA0KPiBtbS9tbWFwLmMNCj4NCj4gVGhlIGdlbmVyaWMgYW5kIHg4NiB2
ZXJzaW9ucyBhcmUgZW1wdHkuDQo+DQo+ICBGcm9tIHRoZSBwYXRjaCBzZXQgeW91IHJlZmVyZW5j
ZWQsIHdlIHNlZSBjaGFuZ2VzIHJlbGF0ZWQgdG8gdGhlIGZpbGVzDQo+IG1vZGlmaWVkLCBidXQg
SSBkb24ndCB0aGluayBhbnkgb2YgdGhlbSBkaWQgYW55dGhpbmcgd2l0aCB1bm1hcF9hcmNoKCku
DQoNCkluIHRoZSB2MyBzZXJpZXMgZnJvbSBEbWl0cnksIFtQQVRDSCB2MyAxNi8yM10gbW06IEFk
ZCB2ZHNvX2Jhc2UgaW4NCm1tX3N0cnVjdA0KKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIxMDYxMTE4MDI0Mi43MTEzOTktMTctZGltYUBhcmlzdGEuY29tLykNCml0IGlzIGRvbmUgdmlh
IHNwZWNpYWxfbWFwcGluZ19jbG9zZSgpDQoNCj4NCj4gYXJtOiBhMGQyZmNkNjJhYzIgKCJ2ZHNv
L0FSTTogTWFrZSB1bmlvbiB2ZHNvX2RhdGFfc3RvcmUgYXZhaWxhYmxlIGZvciBhbGwgYXJjaGl0
ZWN0dXJlcyIpDQo+IGFybTY0OiBkMGZiYTA0ODQ3YWUgKCJhcm02NDogdmRzbzogVXNlIGdlbmVy
aWMgdW5pb24gdmRzb19kYXRhX3N0b3JlIikNCj4gbWlwczogZDY5N2E5OTk3YTBkICgiTUlQUzog
dmRzbzogVXNlIGdlbmVyaWMgdW5pb24gdmRzb19kYXRhX3N0b3JlIikNCj4gczM5MDogY2IzNDQ0
Y2ZkYjQ4ICgiczM5MC92ZHNvOiBVc2UgZ2VuZXJpYyB1bmlvbiB2ZHNvX2RhdGFfc3RvcmUiKQ0K
PiByaXNjdjogZWJhNzU1MzE0ZmE3ICgicmlzY3Y6IHZkc286IFVzZSBnZW5lcmljIHVuaW9uIHZk
c29fZGF0YV9zdG9yZSIpDQo+DQo+IGlhNjQgaXMgZGVhZA0KPiBuZHMzMiBpcyBkZWFkDQo+IGhl
eGFnb24gaGFzIGEgYnVuY2ggb2YgdmRzbyB3b3JrIGluIHRoZSBsb2dzIGFzIHdlbGwuDQo+DQo+
IFRoZXJlIGlzIGFsc28gYTZjMTlkZmUzOTk0ICgiYXJtNjQsaWE2NCxwcGMsczM5MCxzaCx0aWxl
LHVtLHg4NixtbTogcmVtb3ZlIGRlZmF1bHQgZ2F0ZSBhcmVhIikNCj4NCj4gSSBkbyBub3Qgc2Vl
IHNwYXJjIGNoYW5naW5nIGF3YXkgZnJvbSB3aGF0IHRoZSBwYXRjaGVzIHdlcmUgZG9pbmcsIGJ1
dA0KPiBhZ2FpbiwgdGhlIGFyY2hfdW5tYXAoKSBzZWVtcyB0byBkbyBub3RoaW5nIHRoZXJlIGFz
IHdlbGwuDQo+DQo+IFNvLCB3aGF0IEkgd2FzIGxvb2tpbmcgdG8gZG8gaXMgdG8gYXZvaWQgYSBj
YWxsIHRvIGFyY2ggc3BlY2lmaWMNCj4gZnVuY3Rpb25zIHRoYXQgZG9lcyBub3RoaW5nIGJ1dCBz
ZXQgdGhlIHZkc28gcG9pbnRlciB0byBOVUxMIGZvcg0KPiBwb3dlcnBjLg0KDQpUaGF0J3Mgd2hh
dCBpcyBkb2luZyBEbWl0cnkncyBzZXJpZXMsIHJlbW92aW5nIGFyY2hfdW5tYXAoKSBhbmQgcmVw
bGFjZQ0KaXQgd2l0aCBjb3JlIGhhbmRsaW5nLiBUaGUgYWR2YW50YWdlIGJlaW5nIHRoYXQgaXQg
YWRkcmVzc2VzIGl0IGZvciBhbGwNCmFmZmVjdGVkIGFyY2hpdGVjdHVyZXMsIGltcHJvdmluZyB0
aGUgY3VycmVudCBzaXR1YXRpb24uDQoNCj4NCj4gVGhlIHRocmVhZCByZWZlcmVuY2VkIGluIHRo
ZSBnaXQgYnVnIFsxXSBzZWVtcyB0byBpbmRpY2F0ZSB0aGlzIGlzIGZvcg0KPiBDUklVIHVubWFw
cGluZy9yZXN0b3JpbmcgYSB0YXNrLCBidXQgQ1JJVSBub3cganVzdCBtb3ZlcyB0aGUgdmRzbw0K
PiBtYXBwaW5nIChvciBqdXN0IHdvcmtzIG9uIHBwYyBhdCB0aGlzIHBvaW50PykuICBTaW5jZSBb
Ml0gaGFzbid0IGxhbmRlZCwNCj4gaXNuJ3QgdGhpcyBzdGlsbCBicm9rZW4gZm9yIENSSVUgb24g
cG93ZXJwYyBhcyBpdCBpcz8NCj4NCj4gU28sIGFyZSB3ZSBrZWVwaW5nIHRoZSB1bm1hcF9hcmNo
KCkgZnVuY3Rpb24gYXJvdW5kLCB3aGljaCBoYXMgZXJyb3JzDQo+IHRoYXQgd2VyZSBuZXZlciBm
aXhlZCwgZm9yIGEgc2luZ2xlIGFwcGxpY2F0aW9uIHRoYXQgdXRpbGl6ZXMgYSBuZXdlcg0KPiBt
ZXRob2Qgb2YgbW92aW5nIHRoZSB2ZHNvIGFueXdheXM/DQoNCkFnYWluLCB3ZSB3YW50IHRvIHJl
bW92ZSBhcmNoX3VubWFwKCkgYnV0IHdlIHdhbnQgdGhlIGNvcmUtbW0gdG8gaGFuZGxlDQppdCBp
bnN0ZWFkLg0KDQo+DQo+IE9uIHRoZSBub3RlIG9mIENSSVUsIGl0IHNlZW1zIGl0IGNhbm5vdCBo
YW5kbGUgdGFza3Mgd2hpY2ggZG9uJ3QgaGF2ZQ0KPiB0aGUgdmRzbyBtYXBwZWQgYW55bW9yZSBb
M10sIHNvIHNldHRpbmcgaXQgdG8gTlVMTCBpcyBwcm9iYWJseSBhIGJhZA0KPiBwbGFuIGV2ZW4g
Zm9yIHRoYXQgb25lIGFwcGxpY2F0aW9uPw0KDQpCdXQgYXMgbWVudGlvbmVkIGJ5IERtaXRyeSBp
dCBpcyBub3Qgb25seSBDUklVLiBUaGVyZSBoYXMgYWxzbyBiZWVuDQppc3N1ZXMgd2l0aCBWYWxn
cmluZC4NCg0KPg0KPg0KPiBTbywgSSB0aGluayB0aGlzIGp1c3QgbGVhdmVzIHRoZSBmYWxsYmFj
ayB3aGVuIHRoZSBWRFNPIGlzIHVubWFwcGVkLi4NCj4gV2VsbCwgaXQgc2VlbXMgd2hhdCBwZW9w
bGUgaGF2ZSBiZWVuIGRvaW5nIGlzIHVubWFwIHRoZSB2ZHNvIHRvIHN0b3ANCj4gdGhlc2UgZnVu
Y3Rpb25zIGZyb20gd29ya2luZyBbNF0uIEF0IGxlYXN0IHRoaXMgaXMgd2hhdCBzb21lIHVzZXJz
IGFyZQ0KPiBkb2luZy4gIFRoZSBhYmlsaXR5IHRvIHJlcGxhY2UgdGhpcyB2bWEgd2l0aCBhIGd1
YXJkIHZtYSBsZWFkcyBtZSB0bw0KPiBiZWxpZXZlIHRoYXQgb3RoZXIgYXJjaHMgZG9uJ3QgZmFs
bCBiYWNrIGF0IGFsbCAtIHBsZWFzZSBjb3JyZWN0IG1lIGlmDQo+IEknbSB3cm9uZyENCj4NCj4g
SSBhbHNvIGNhbm5vdCBmaW5kIGFueSByZWZlcmVuY2UgdG8gb3RoZXIgYXJjaHMgY2xlYXJpbmcg
dGhlDQo+IGNvbnRleHQudmRzbyAoYXNpZGUgZnJvbSBmYWlsdXJlcyBpbiBfX3NldHVwX2FkZGl0
aW9uYWxfcGFnZXMpLg0KPg0KPiBCdXQgbWF5YmUgSSBkb24ndCBmdWxseSB1bmRlcnN0YW5kIGhv
dyB0aGlzIHdvcmtzPw0KDQpJIHRoaW5rIHlvdSBmdWxseSB1bmRlcnN0YW5kIHRoYXQgaXQgZG9l
c24ndCB3b3JrIGFzIGl0IGlzIGV4Y2VwdCBvbg0KcG93ZXJwYy4gQWdhaW4gdGhlIGdvYWwgc2hv
dWxkIGJlIHRvIG1ha2UgaXQgd29yayBvbiBhbGwgYXJjaGl0ZWN0dXJlcy4NCg0KVGhhbmtzDQpD
aHJpc3RvcGhlDQoNCj4NCj4gVGhhbmtzLA0KPiBMaWFtDQo+DQo+DQo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzg3ZDBsaHQxYzAuZnNmQGNvbmNvcmRpYS5lbGxlcm1hbi5pZC5h
dS8NCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvOWMyYjI4MjYtNDA4My1mYzlj
LTVhNGQtYzEwMTg1OGRkNTYwQGxpbnV4LnZuZXQuaWJtLmNvbS8NCj4gWzNdIGh0dHBzOi8vZ2l0
aHViLmNvbS9jaGVja3BvaW50LXJlc3RvcmUvY3JpdS9pc3N1ZXMvNDg4DQo+IFs0XSBodHRwczov
L2dpdGh1Yi5jb20vaW5zYW5pdHliaXQvdm9pZC1zaGlwDQo+DQo+IFRoYW5rcywNCj4gTGlhbQ0K
Pg0KPg0K
