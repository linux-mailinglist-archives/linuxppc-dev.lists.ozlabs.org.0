Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 918608CF8B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 07:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=I7lslOx9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnkSK5FH9z3gGt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 15:18:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=I7lslOx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnkRZ4vBXz3ftc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 15:17:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8QBUsAtpltnWmUI5ShvnWgv+4qYzCPixa6N1729rPSX3FdSferAGVmQysbJYQkHRC/xGwBAepeKf5IMyf1KOYv/R+ZqxOXmjLYYq1/qgmQwj0itRJRodNIlgc11cka3ENH4jlWW/SXI/kop1WtNcBjPqWgbIZX4bf8IXM2IJbhcs2Z4PkVxHixPYRy+BXrWwWNSAyR/ov3gpx6serpCX378Sqv/jnfuAZV5OkB18yppfS77qRu2hk0N4rybC2K9wTSYiZjqBZGAZPzbKCfNfKFTsQabkiojFu+uEtQitag70zSDqkDCnanqvpldz+o/4a51ckAV5P3McgOdG/ZbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFdcOeVA24Btcov2yuWjhuC4am8SrFURCkmAD/3Sqts=;
 b=H68TbosaP9pzFhisV3wkF0shWFQJb/Lp1aWK6hQ+5CNRNyEv0Sob/KuWsXrWjcxipXtMDHQI5xDuzsPGMXIEzfOe2FGyrf4L8pUjM79MY+7JZPjdBftQyKtEl27+S7bDo5JLB4AsCkm6Nw8xvSdqt11tV6nAA3tlo92fbK9ZQjwHomP2y+XxEZdGvT9F8j0V/23PrxSX59RLtySt1wZ3Hidj/0t3kOblvJM7lA0z6xXEcte1Fzwf3Yr4R+KPxjPlTXCHaBleY0d5XcgUBOdI7Nlhf9U5nms1RntbsYnyKrumqQCSIDdxKx26U8id0ma04qj2bwQIul7hdabhz3MteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFdcOeVA24Btcov2yuWjhuC4am8SrFURCkmAD/3Sqts=;
 b=I7lslOx99HDmfE9+9ye+LYK1P/Wtdj839wBVTjADNz5nDJYuETB8Q1AKKtY7WhiIfGhLRFoOVmBTD+hDjHpVynUnsM+wIHLW8Q4mPh7PerpXC4VanxaMebfVptv326JO+6LxQKDYV05sSqOEpd8v4EmgrFcaixoGbsMlj7THy8pHTHBLmveQFVDvz7+sE4SudsbxJIwL5qwzYTrr0HKCug0YmXTCLQGKMPI7F9nqCmQ+3of/F6m1N+0OQIej+SU0Bnr8m57vExQTkJmp5+LooVBYdK9/I58qKMj8l8tnPjroChmfGLzzsO4kRe/TmV4VyWW+YpaonjC25uZoC7C2nA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2593.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 05:16:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 05:16:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v3 05/16] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Thread-Topic: [RFC PATCH v3 05/16] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Thread-Index: AQHar049CXGWjZmzDkuxeOKb9gg3yrGqhbGAgAAF4QA=
Date: Mon, 27 May 2024 05:16:57 +0000
Message-ID: <80afc0fd-75ec-496a-a1f1-46df62805390@csgroup.eu>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
 <aa54834e9ee5e40179def32ff5834a8a2a02c413.1716714720.git.christophe.leroy@csgroup.eu>
 <ZlQSWRvZuyaY886M@localhost.localdomain>
In-Reply-To: <ZlQSWRvZuyaY886M@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2593:EE_
x-ms-office365-filtering-correlation-id: c4f26a7a-32ec-42b9-aab1-08dc7e0c3afb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?dUdzMXVBNGt2THpzVDJXWVJBYTBVU1pNMXdGcnNPaXpnek5uK2NocHNDRUtE?=
 =?utf-8?B?TFd2Z0ZpUFRqMjh0VjhkMnFERnpQSThhcnhJMExKSzZESGNwNlJjUDQrUS85?=
 =?utf-8?B?eU5lOVFhY1dIS0VYancvU1lxdjRvYmsrU01MRkJheW5BMk44ZEE2S2VmNG1E?=
 =?utf-8?B?K2s1RERMdmNpdlBuZjRSZndjUndRU28zT3FGZ1Y2bG56dGtqZEFoemhxOEJl?=
 =?utf-8?B?TTlVSWNRMnN2NnpFd2VOYzNsczZVdlNuZmszM1NyaHhFSmFseHhhOUF6dGNF?=
 =?utf-8?B?ZDlkQklJQjQ0d29tMEl1eDRSNytyZzNmbnZaVmNpMWN1ZFdLNGpLMXBnM0NB?=
 =?utf-8?B?U1dVNWtqL1FJVzQzS1Q3T1I1TnlzV1ErZ1Q4V2k1YnFLbThZTHFTbTZuaVQ5?=
 =?utf-8?B?RVYyUzN0Q3VvU1QzbHphQ3BwRHdBczNIM1pSaTZUMEVQL3VxNHpVUzl6aG45?=
 =?utf-8?B?ZkVLV016dG5YU0RkMWx0TURJMHJxckdnMUpCWTNrV3FwQlJkdDFrbytKUGN6?=
 =?utf-8?B?Z1Z4eVMrODd3T2syakdmSjBUMGg2R1NLTUkwQk54NElkUXM2ck5BckVoYWVh?=
 =?utf-8?B?cmdwWTJFRCthUGpXaXJlK25mRHdxbEVZUk1uQVhOL05aLzlCeFlvWXdPNVps?=
 =?utf-8?B?V2hDRGxGejQyQ1p3UXlEVmZKTXZBVzFvbjBGV0ZBd1BabDluMzdMRjQ2b2Zs?=
 =?utf-8?B?VDdzUVVhbzNuc3JlZ3BOUDFoT0RvQU9YR0hYRHowaHNLRnNtUTNhOFhBOGVB?=
 =?utf-8?B?OEQ1NGJKdENZWGJ5cG9yYW8wZ1hmaFE1VHNiQ3ZKMXovWFlNS04vanh5a3A0?=
 =?utf-8?B?eHZsWkZWREpSU0RQZjBHM2xGK3l5T2ZjeUhHSFlqUm00TVBmajZnNTB6RVY0?=
 =?utf-8?B?cGxCRm05Y2k0SUY4WEpncTYxSUpUaHJ2VTNJRm5nYW9CZkxrakdRc2RpODhk?=
 =?utf-8?B?Wi9KRFlKb2tua2tRbkJUaHdoaVVZOFhYOFNyS2FVSDJtSVhZWEtmRGhNMnE4?=
 =?utf-8?B?Mjcyc1AxbGFoUUMybGYwTVNKcXJVR1BtaE1sR0IxNGdIeWM3dW1NMmt5UGs0?=
 =?utf-8?B?dGNjQ29tMWx3SFhGN0kwSkRkK1krYWx2OUllTVByb3RvTlhiSWVNODBHVEdS?=
 =?utf-8?B?N1MxdG1kTStZcTcrQVFtb0FmaHg3d0FhZWJBKzlWTk8yRWlEaXN0N0ViMDRG?=
 =?utf-8?B?Wkcrb2w5RXIweWxKZW1PaDFnaWZtS29BU3FWaytBeVAxOEZPMEY3TXZIWDds?=
 =?utf-8?B?NDRwZkNTbmZwOTFGTnBvRGYxVWgyanNTSWdVa1NFbmx6b0lKdlBaK2szUHgr?=
 =?utf-8?B?YkpMTThmQnhvaEluOS9zcG9ZVDNoVWgzL2hIQVM3SE1CcDg1MUJsZHE2THZC?=
 =?utf-8?B?WXczaVgyam1MRUxUTFlKSmVLMm5yOEtlbmR1UTVsakphaU02S094MzRuY2F3?=
 =?utf-8?B?OXFJZ0lUaVJ3WDNxcmpnZmRXYWVsMGpoZmZvcklmVFpaeTBFZi93RVl0MHk4?=
 =?utf-8?B?Q0VsYVRKWjZwMXR0N01VeHg3aGR6NnJWTlEvTWs2cHJ6MmRTS242cWgzdU5h?=
 =?utf-8?B?WFhzZFVmelZuTlRTZlEyUjlQamh2NEFmVjZSNzVEcVg1TEdBY1V3WTF3UWZ1?=
 =?utf-8?B?dEl0azFjc1dDa2IrRmJ3Y2o5WlV5L04zQVY1Q2p5UzVwalhKS01hQ2U5MU04?=
 =?utf-8?B?QVg0Mlg2cHcxTTBnMHFlTksreEFXUnhYbWhoRjNyVEFFdWdTSFRuazNnRURT?=
 =?utf-8?B?NEZFYnN2UldpK05lVlBPM0JMTHhnMzNDN05QQzYycFU5a1FDeXpXYzdEQTQy?=
 =?utf-8?B?ZSs1YnhCaDJ2cTluTTg1Zz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cjV1dFgyUEVER0tVRnBMbmovSzAzSXY4WDYwSWdWQ0ZmMXlZelM5MUVBaXdW?=
 =?utf-8?B?VlFjcXJ4VlpzWnYvcnVpY3JyZko0eHhaOVNCUm9yMWFuRmE5UVZWRnMyMkZt?=
 =?utf-8?B?M2dkdTdnTHdYM1BNekF0RU5MM1RhRndKdndQZjNtbXgycEl1SktoRHJqZEFX?=
 =?utf-8?B?UGdZRDRvd2tZYkhYdkxlS2lqNk9GamFoNGJvUFFYVE0xK21rS2VOMFJOWlhl?=
 =?utf-8?B?dnBERjhjTENBUlBqZC9VNlFSWVd2TFdPcVpPWnZabG5XUWo4SFJhZzEveDFy?=
 =?utf-8?B?SGM1RFNDZ3lzYmxMYm9NV2lHMGROUGt6YW5DMXl3em9pWW00Z1RuVFhlU1Fl?=
 =?utf-8?B?L0c2TC9qZGtQRjVldHlkQWZFamVYbUcrYjBZcjVBNHhGazFhTm8wWVpMUzhn?=
 =?utf-8?B?T1pnUk9BL0ZLY015MFZKYVltQURIUXlITFQ2UTd2eEtib2dOZ3FQSVlFZEF3?=
 =?utf-8?B?TXlUNjY4RkhDTlBsOWNpNXFZNjFPeTNIK1NZYzByWnFqRTMwTlY4S0k0SGlX?=
 =?utf-8?B?SUZzSmNIQ01nbWtqU0xucFZOVUpSaktDajJ6Zk1YcW9YSnh0bXJjUUtibXBT?=
 =?utf-8?B?eXoyZU5FVnR4Y3ZqNEcxdkJKc1ZITk45MlJ6VmNjdk5WU2ZkMEtHRHByYmhx?=
 =?utf-8?B?QWphaW1mWGV0UW1adzJwN1hhQklKb2ZTTWtiemVVc0xpZ3BCR3RnemcxUExP?=
 =?utf-8?B?ZkpYSnhYeHg3a2ZTZ2RmVlhIa3ViZks2VGFzMWRsc0xEMHgwd0NEZFhDYXR5?=
 =?utf-8?B?Z1E4bU9Pb3hvMW9sdHpQMHVES3M5RWdHVy9uSEdoL0tGandtVEhCYlFCU2pQ?=
 =?utf-8?B?c21qem9Sc0QxYWYvdkcrU1pmWXM0UXRSeHh5U3ZKY1g1akczZ2U0REJLVHF1?=
 =?utf-8?B?eVg2WnRIaGtTR3B6Um9wQmhYYThXcU92enJPZjZyc053OUxyakp0TkVxREt5?=
 =?utf-8?B?c1FnZ09TVlJhdFlMSGhtc3djRldjdGZKNUYxR05ISWIyZitRSnpKU3l2RXRG?=
 =?utf-8?B?YlVvUTM4bjgwREhkc1QyMnJ6M0h3cmJzNHFEM3BlNy8rTXp4aUpBSUVIUWpp?=
 =?utf-8?B?bkY4dHVPSkd6Vjd4QTMyZ2VSYm85azg5Y0FtZVdDSUhSdS84cC9PQTI5VnBE?=
 =?utf-8?B?Q2hOOWU3QVZSUHdwMkkrclN6NStFWWVBSTJiK1U5bTRjL3lDSnI0WUZOUHNv?=
 =?utf-8?B?U2tFWW5WcGQ1UG1Dc2dpYm4vcGprdlk1b3lNZWJ3aTloTmpNWEY1T251ckRl?=
 =?utf-8?B?dXJydjlMaGhnc29sOUJuK2h5UjFueUZ6U0YyYU9MR1JrTnBYOHV1cGRxNS9q?=
 =?utf-8?B?M2pKWjlJV1FQWk14UDJWU0RRNHY1bDJqRExZQ0xsalJ6VlIxcVllRzhyTFE3?=
 =?utf-8?B?bjJPLzcydlFJVkxqTmNMb2JoUjh6SUhtTFJMVlN4THBtRFg5ZlN1c3F6a3ZQ?=
 =?utf-8?B?cWdETmVqU1FDTEFRdHNUZUNOQ3F3QXQ0M1g5by9FMHZPNy9lOW5DUEppOXY1?=
 =?utf-8?B?Q3J2aUNwWTFid0k2T1VJQ3Yxd01MaDk0MDNBYkJTbUVEckhUa1A4Q2FwSjRm?=
 =?utf-8?B?ZkprYmRQRDRGai9pbTJXR2Q5V3UyMEJiWitGeXdiZnJESnVRckNnbzgvNnBB?=
 =?utf-8?B?cGdBWTMrYml6RWV6TlZRaEEvdWV4N3ZvR0drRThuczQrZzBDcXZjWVpzQmlu?=
 =?utf-8?B?dEVZTSswZWN0eG9MeVBVU2VJQStMMy85MFcrUjdoeUtQWE5IZTM3VVJocnN3?=
 =?utf-8?B?TndDb2ZNZCtibURuT1k4NDhyTDkzT1dZQnNMbXhVMndxdHNJQWUzMGptaVdZ?=
 =?utf-8?B?cXV1OG1UeXBWeVJ6TDgyWDh2amNpVnhMZlRWYTA4SEUxMnFEWTF5aWgva2FL?=
 =?utf-8?B?Tmx6MXg5WUZoQ0xReWZNYVRIeTlBM29PcUZmZmtDbnZnMXI3KzhYUk5sVm9U?=
 =?utf-8?B?UkM5K00ydUIyVnVwa0ttbVdjeTBZd29icmFRZjI3U0MrNmVscUZqS25hcER6?=
 =?utf-8?B?Vm8rSzZ6QWE3aDFiM2RTTjEwY2VLSE9tN1ZvWEFuWTdhSUR6RGtmR3dDSTFT?=
 =?utf-8?B?cXRydjRTU0JPQjRMeTlhT0VBUDFvaGxBeUNPNmdzeWZULzZ2dTZ1SHlTMEJo?=
 =?utf-8?B?S08rWjRGbWlJeEZ0NFZydjcwUEtIVHF6NnhaTzFNS2xYR25CQmhCU1ZiQ0s1?=
 =?utf-8?Q?jFpPXbuT/bLuagnUtaq8c22VwuBcSsjcvR4hsxH6qyIM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CE86D4D91E389499A1DC73A3D3930E2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f26a7a-32ec-42b9-aab1-08dc7e0c3afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 05:16:57.4029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iyu9dl6ru8A8kIVEXTgDYSksy4fXzDT/PW8aTeKG9FO2nRwjbFFI4kJliwcag+srwCUgNFvquOZLTvX+gcB/Zz7x8MCBLG22JHG10bMctD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2593
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

DQoNCkxlIDI3LzA1LzIwMjQgw6AgMDY6NTUsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIFN1biwgTWF5IDI2LCAyMDI0IGF0IDExOjIyOjI1QU0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBCdWlsZGluZyBvbiAzMiBiaXRzIHdpdGggcG1kX2xlYWYoKSBub3QgcmV0
dXJuaW5nIGFsd2F5cyBmYWxzZSBsZWFkcw0KPj4gdG8gdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4+
DQo+PiAgICBDQyAgICAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLm8NCj4+IGFyY2gvcG93ZXJw
Yy9tbS9wZ3RhYmxlLmM6IEluIGZ1bmN0aW9uICdfX2ZpbmRfbGludXhfcHRlJzoNCj4+IGFyY2gv
cG93ZXJwYy9tbS9wZ3RhYmxlLmM6NTA2OjE6IGVycm9yOiBmdW5jdGlvbiBtYXkgcmV0dXJuIGFk
ZHJlc3Mgb2YgbG9jYWwgdmFyaWFibGUgWy1XZXJyb3I9cmV0dXJuLWxvY2FsLWFkZHJdDQo+PiAg
ICA1MDYgfCB9DQo+PiAgICAgICAgfCBeDQo+PiBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jOjM5
NDoxNTogbm90ZTogZGVjbGFyZWQgaGVyZQ0KPj4gICAgMzk0IHwgICAgICAgICBwdWRfdCBwdWQs
ICpwdWRwOw0KPj4gICAgICAgIHwgICAgICAgICAgICAgICBefn4NCj4+IGFyY2gvcG93ZXJwYy9t
bS9wZ3RhYmxlLmM6Mzk0OjE1OiBub3RlOiBkZWNsYXJlZCBoZXJlDQo+Pg0KPj4gVGhpcyBpcyBk
dWUgdG8gcG1kX29mZnNldCgpIGJlaW5nIGEgbm8tb3AgaW4gdGhhdCBjYXNlLg0KPj4NCj4+IFNv
IHJld29yayBpdCBmb3IgcG93ZXJwYy8zMiBzbyB0aGF0IHBYZF9vZmZzZXQoKSBhcmUgdXNlZCBv
biByZWFsDQo+PiBwb2ludGVycyBhbmQgbm90IG9uIG9uLXN0YWNrIGNvcGllcy4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAu
ZXU+DQo+IA0KPiBNYXliZSB0aGlzIGNvdWxkIGJlIGZvbGRlZCBpbnRvIHRoZSBwYXRjaCB0aGF0
IG1ha2VzIHBtZF9sZWFmKCkgbm90IHJldHVybmluZw0KPiBhbHdheXMgZmFsc2UsIGJ1dCBubyBz
dHJvbmcgZmVlbGluZ3M6DQoNCkkgcHJlZmVyIHRvIGtlZXAgaXQgc2VwYXJhdGUsIHRoZSBwYXRj
aCBpbnRyb2R1Y2luZyBwbWRfbGVhZigpIGlzIA0KYWxyZWFkeSBiaWcgZW5vdWdoLg0KDQo+IA0K
PiBSZXZpZXdlZC1ieTogT3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPg0KPiANCj4g
DQo=
