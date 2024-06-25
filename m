Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F271915E1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 07:21:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=uoiRWKdq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Y8S6HRfz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 15:21:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=uoiRWKdq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2606::606; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20606.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7Y7l1ZlDz3cRY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 15:20:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWokz921shzX+q56edpCXMq84fQFHrjpGGrIDjZh2DkTJtuuHYclwe6olko4pR/FQYIjCjyfiKKW7vhp55j6K/I0XMQ1vewERmM1mF0f4vBAm9BqfBOf4V/rHvaLyJgn1emtypkvjW/KBjzZdum89JC58kyyUsCrKgfImw8BG9FmWluAX8rjgeq4DZpHwiG0/Mbzui0BhXoa3BoMgLCNs4RQnZS5ejqwZavpieSYDNnqurEM+b7zxEaHxueeeZo+7Ntp/hmiwgmlVwR7ysa2qEN58GWw9/f4QvBV7YYBx8licTIBSqrnE3Qu6H8f96YLaMGhAjY5B0PEYdVAI00Thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puBkLRVbIb7mQ38r4lD8CjAj6H3Ove7J7PO2LTvz6tU=;
 b=CUl9UXh8CbCsDzh1ScO6hXWCsATg4MVwTimr32zDzon3phldvmcZsMEMNLb3tSbyrPLIJWwiWGPn24aseOUcvuiA/ib37aJU3bcqlLMQyZfYIM72vcom/P4truXlnTtUT8a/9Z55XqTIyXZBu7F9NZCiog43rnRJKQhRKXqwHm17A7NQpHjF4DsVtMMidaL0h7q8b3fXtw7DvtaYg1Ix5HiONxz5PiDLhwFDmPSxgFnKpBdz80hif9v/53gQfECqYRynD9FEtkldZAxApvenf/jWLm0En5Gpu5XVPaXeaZbB0gmiVdYegLk0AkGbKL4rYSrx2FJFZ4sQ6A/5FkHJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puBkLRVbIb7mQ38r4lD8CjAj6H3Ove7J7PO2LTvz6tU=;
 b=uoiRWKdqd3Den1v++OWBAWSekBg8B+nN+Zr+ZOyx896blrrxolXYJoKmqMpqyi9QpkcvyqEL9kGF1xl3kMME+MlsH9M4JKSqKwh/MQ/KhRNk0Ceh8BslJ09Rp0QgT5WX+VKyftBx3DQiIiA8lpYXS4e9gjphKwR9tFxMV3BLzw3dx1w93KgU4CPAY1ni3baX+QxTFHuRgIJqE8IP+bemaLkUARjluERIe+6d/TE5L3H9LGza9tEwBN2uaWjBHjRlWHWjRvCtOmTDZ5M6fvTHnQx/PRYZDQ542VVAegwusNSfRedSPRuayMFExpFGTXXolFbtCFRgDxpXCWl2NZd9Aw==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by VI1PR07MB6720.eurprd07.prod.outlook.com (2603:10a6:800:179::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 05:20:14 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:20:13 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Peter Xu
	<peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v6 21/23] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
Thread-Topic: [PATCH v6 21/23] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
Thread-Index: AQHaxkVO0Vb1nOGuRkKWJSXRHz5LjLHX6aiAgAAIg4A=
Date: Tue, 25 Jun 2024 05:20:13 +0000
Message-ID: <a8f76535-2d5a-4f25-83be-31aab1cd38c4@cs-soprasteria.com>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
 <23f3fe9e8fe37cb164a369850d4569dddf359fdf.1719240269.git.christophe.leroy@csgroup.eu>
 <D28TSEV6QV38.2NWPFRY8KCQK7@gmail.com>
In-Reply-To: <D28TSEV6QV38.2NWPFRY8KCQK7@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|VI1PR07MB6720:EE_
x-ms-office365-filtering-correlation-id: 3a575a4f-0943-40f3-5415-08dc94d67e14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info:  =?utf-8?B?bzJJS3ZyZ09tN0g5RXFVTUZYNmkrMWdiNm1DNU9xM0YyeG56QXhuY1p1L0R1?=
 =?utf-8?B?bGprSWRadTlqdEpUc0ROMmY1L0V4UFpXRFVwcUpJd3EyN0lIdTNheFpWNlRX?=
 =?utf-8?B?YmZhYXhXN0pzaDkwTDR4WnNpNExHb2YvL3VycjZqZGs1U2x1NmpJVjVlNk9x?=
 =?utf-8?B?c3ZLUStWU1VCSUtwUXZ2b2VvVmlhc04xQ1NoQmMyQ3d0aEV4c3NBd054V2dD?=
 =?utf-8?B?cEkvTCtMelRTM1F4MUZHNTNYcFZWNUwvWERTbHV4Y0NlUXI3RGNjWkFTNXUr?=
 =?utf-8?B?dEVvenVIUHVDbDJPR2tRNFRqUTN0eUVMd3VXejdzL1JrdU1yT2lXR1JiaUw3?=
 =?utf-8?B?ZVlFYkhXTCtnN0hkbGpkMUtKeGpydUI0djFsMzgwVHN2aEFLVG1CZGxFUyto?=
 =?utf-8?B?TXBkcndsSWtHZzVCSy9CcHg1Wnh1cEhzNThLMFgwQm5wb0pZalczTkErVlk5?=
 =?utf-8?B?YlBta3RRQ0lscVpMUVRuRG5QN0x2aXpzQTk3NFkvL3FOY2M2ZFlER1l3cjVj?=
 =?utf-8?B?dTh0OVhPV0dKNEdUc3gxSGRrYThHODExbGdlV1FBYmg5akQ0UklMS1ZpK21r?=
 =?utf-8?B?bnNXV0hnUGNabUQzdmloTjJpcmdPUWR5WXkzTlRjTHJITWdGRlhmSzY5Y2li?=
 =?utf-8?B?ZHpvK0l3QXhtL1dyakQwNis0OXNwblFoK2k4TkxaWGh5MGloQXZIcnRvdFNN?=
 =?utf-8?B?dnZPZVU3UmpzbitVUlJ4eWRDL25BU3NoQmdqVk5Sa0JNTmt2djBKZUZRamZ5?=
 =?utf-8?B?bjV5RDlWSDE2aThKOWY2dFRlTVlOUTVxRml3SkNRTEd6UmYwWjdwcnR4SmM4?=
 =?utf-8?B?ZHpoeERmdmQ4OGRtNUlWcFllNVFVSkFFcW1YbGlpR1UyZkVvMGhGMGpZSFdC?=
 =?utf-8?B?WmdJWlo4S3VWTGZwdkE5ZGg4ZjhJcFdyajZHUUI2T1MycUc2cjlvV1VvbTNz?=
 =?utf-8?B?WENwUDBxendaYXA0UTU0V1FGczJPdEtzeU50aVJiT1MwSVdHYlNrZHhaNVBz?=
 =?utf-8?B?SFNtbHNzdndZVDh2SGVaWWdGeHRYenUyNCtFM2x5TFkvcTZLcG5YeXFaSWRt?=
 =?utf-8?B?cVZmL2FwSDJJYkxLVUZjL3FRYmo4S2RrMndMSVI5WldaNW5WdmlhMVpaNnp6?=
 =?utf-8?B?ckJEcXJwc2hFZlVFS0ZHdVBMYlloQ0ZqY3ZGZ2ZXcW9jR0RNeDcyZkV3b3Ev?=
 =?utf-8?B?TFZFNFcwOGxET1cxUVhoVlJKbzhlUWc4ZllsNTNJeHdDalU5dXNncmdwZDhZ?=
 =?utf-8?B?T3g5Qzl3M2xCeGZCZmNGbklrNGVkZW15ZjUxU2IyZWc2TUxKQ1FvQk5Wc0Np?=
 =?utf-8?B?eXpKd01tR2FSNU5Hb3pTaVhGeDE0ZXlkTy9aRHNvS3pPdXpHQ2ZGRld5bkdu?=
 =?utf-8?B?b0FMRFBKR3JqZHpXQzcwdlR4dzk5YzNmSFQzMW45RlF5Q3VVZXl2RGVjZWE1?=
 =?utf-8?B?cGR4UXo0VW1LWmo1R1g3eWhsK2ZzbnFYWkhvdEpuTWsrelE0KzR5ZnJsMkc1?=
 =?utf-8?B?cWlDYUxOZ0ptNjh6ZGlUTk15bzd6cUZFWldmbXRKZEM3aDlYL0d0eUxqU2Yw?=
 =?utf-8?B?WU1SSEQxaTJJUEZsTVVRem5oWTJUeS9ST3V2MHpic1dSWVUxcmY0VVZRQjhS?=
 =?utf-8?B?ZHVBY1VPY1RwOC9DTjZMWFRpWDVWaE5NT1l6RHMvYlFnaHFPVVQybGhLY2Ro?=
 =?utf-8?B?dDJQU2l1cS9GVzJnMEJBOHk3Nzlsb2d0RXJZUzFCOTBOSWZ4R3l5b1RMU04x?=
 =?utf-8?B?WFF1MEhReFd1MGRRM0Zxc0tvR0I3R1BOa2s4T0FCbDBVYURnM3p1dlMxRTdE?=
 =?utf-8?B?MFF5U0oyODNocUxNY3VaRUVvYktRTDY0NDltb1FhdGJFSmN0MlB1Mk5tamxh?=
 =?utf-8?B?SDYrRVEybkRvT3hsczd2NGQxNUFFZllRYkh1dUk4K1FzT3c9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZGZsYkpsOFE5TU0xNC9mUEY4ZlFURjNTRFNPNnkzK3NpL3ZlZHZXQVJOVUVK?=
 =?utf-8?B?eU5kcDIvTm5GOFo0U3JWdjBMejVpK0JaeEU1ZTFIckZleWVuZFBSdjZyeUUy?=
 =?utf-8?B?T2pETEtzWVhtSjRVWE5GemxjMDRiVnl3YVpCanhBSnJ4VTNTM0NuL094bDBG?=
 =?utf-8?B?WGtqMUhDTlpxdG13NXQ1WGpncktmdGg1MlZIaFhaVmswUGJZUjFxbFRpRGMz?=
 =?utf-8?B?aEJlZ3lxNTZ4bExTZGkzejdSUm1na2JGclNmbjJ2eGxNaXhFRGtidG4vVi9R?=
 =?utf-8?B?emNJaTZSWitKR3AxbnFMbGxTNXYwQzBhVndlTGVZSUtSZDZCc1VJem1wYW9t?=
 =?utf-8?B?OVlaVWN0WDRwSDhrTmxmWnIzbUNRbjVKZWdBN2xqc0FmR2lVMVVLNkhoV3kv?=
 =?utf-8?B?d2d6YksybWk4OUZnM0xmb2RiVnhqdE93MUtBSSthbXpnYkFjMHZWbzdabmxp?=
 =?utf-8?B?TktFZzZXKzZBTzlCQUxIQi9rZWV2UWsrSzBxWC9GdHl4bzNPMFkyTG0vZmNa?=
 =?utf-8?B?S0Z2TVRsalgyNHpndVdESjFBOXFuS3FWL0ROU0R3ck9IU0RxTXVoMHpRaEc2?=
 =?utf-8?B?VW5rd3RIRjRuZXdqNWRXd2Yzb1hmVDhQbG9xcjFiaEtZS0s4WUsrcklpbzVQ?=
 =?utf-8?B?eEhnS1Q1QnVETHpHNWZaQVgwZnFFYXJpbExaVlJENkxmVHYyUC9yajFNU2E2?=
 =?utf-8?B?MlI0dGtxbW9RTmZsS25GQmp3dzlUd1N1SlYyQjNwQTNVdkx1U3RhYU1PaFlv?=
 =?utf-8?B?cWNxVVh2Ulg1K0JpbkVuZ3NvQ3g1c0E1cmR0bWx0YnR6c1F0MFk3bVlnR1Zy?=
 =?utf-8?B?bzZlZjFoLzhhY3FJUVp1OVJtREprU3Zzb3NWSDhNNEV4NndVZDhOUFA5Y2xw?=
 =?utf-8?B?dFl6TVNLRVlkUk5rVnVZcmtkQklmQms1WHBoZGh6NkcwbWxRRVlPeGJUaWd4?=
 =?utf-8?B?V2F2WW5SVEVZZkhPTHFRSnBnQ3gzM2RaNnl4WTlBV2U5bk8zaTNHNWlGdkV4?=
 =?utf-8?B?cU1BUk40RTdEQlk5a3h1aEZ3RGFxOU5UZUMxSkVJTzdRLyt6V2I1UkVqd2Rz?=
 =?utf-8?B?SFpXVDBCbnlkTlRob2xQdXNxK1Qwdk94d0ZBdjNUWGYrYS9EZitrQk5YNWZG?=
 =?utf-8?B?ZnJtTHE2UCtMYm5RLzZNYktpbW0vZ1ZEQ1hIMFJvNkZ0UkdXQUFJYnF0U2t2?=
 =?utf-8?B?Z0hsRjlVb3lXcG5xY3lWdzdvZWtFdzdzQ2NNNUhDZldrZnFJNlJ3S2lzNjFa?=
 =?utf-8?B?dXg2dmJUNEs5KytKTlArVTVTSkNmTHpoQVFYV1l3K1FjNnhPNHRJRFpFVjQz?=
 =?utf-8?B?TUtEOUpEMXFtTG9GVTlkQUJ2MzRrNGExaXVyMWZ4bUJNMXZ6YTNHOFdSSDgy?=
 =?utf-8?B?RUsrQTVzRVg5N2tnNTNzcEdIdUN1ZEtiTWNKaWJLYjhSWFEzZkY2VTRlVHFj?=
 =?utf-8?B?emVOTFVVTngzR2tQTndmaXZObXBCeGlXeVRhL1BuQ0YxL1VkbGp3SnJqNUp6?=
 =?utf-8?B?L2dzVDJ4YjcwM05SVjI1TXczVWlIbmkrUDBxaSsxdHBEQ2lRNjl3U25nbktU?=
 =?utf-8?B?dGNMaVcwQkVUdHgxazRhSkw0b1Z5MzRURktuVHVaWlY0dUxBb0lmZk9uRmVQ?=
 =?utf-8?B?bFRaYnEvUkhkYmZGc2x5KzlMT3d1YkJlYzYzT0tCWTV2Ui9zY2hlVFZ6Z1hW?=
 =?utf-8?B?amxGSUdRRHFqcUdYeTNPcVhMeSt3NWoxRnlHWUMxRHNJcjlrQ2NyQnYwMjRa?=
 =?utf-8?B?elpKV1VHQWFNWnpXcXJmRW1oYzN4cytyR0pwMy9LakhyaWdPaWcwSFdHcmND?=
 =?utf-8?B?ZytOM0I5S09ueW5vWGNFMmxQbzJteDJ6L25uUXFnaHNPLzlpRloyZzQwSzdl?=
 =?utf-8?B?U1YySlJvYnhod3dkbUVWWk9Fd2JBM0R1dFRaWWRnKzhyQ21wbGlqWitycnVp?=
 =?utf-8?B?dHJtOUxSYUJUOVFiUytkcHExVlBlaGpncDVtZWU0TXdPQnJzNXF1VkxqWHZH?=
 =?utf-8?B?ZzFOblpaUndMRW5NbU9lcmhpdkRCRWFjMC8wZGZDdVVoMWRxV05YMWxaR1dQ?=
 =?utf-8?B?MkZpVkJodGI5bUZFNk13dERrcXZIbElWNTVvOWttR1JoMW5XWDM0cGI2Y0tn?=
 =?utf-8?B?UGE4S1Z2dmtaNGZ4NVNmWDNNeUlYNG5BRWcvNm5lZkZTdlJzNXlsanhJWTdl?=
 =?utf-8?B?d3VaTml5T1duSk9ib0w3aGFqVC9Ma041RG1FRXdTb0R6a3JodS96dG9tcGND?=
 =?utf-8?Q?V3UK3/B8N52tEKHrc/MJUgP9soaWga+aPAlZeOr7vA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD37A860407656438224C436517D524A@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a575a4f-0943-40f3-5415-08dc94d67e14
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 05:20:13.8812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LodIMLrBgRwIbVgs/n6RxbbnDSQgg8B0UWVFTGxLPLee+zvhqtGRK/gs1bAEa5q2G6BYqRktEzMVMZIgPGhO88zOuvzEBc83WYobhx+UlqlmJtbFwD6W4AvQZblqISTq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6720
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: VI1PR07MB6720.eurprd07.prod.outlook.com
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA2LzIwMjQgw6AgMDY6NDksIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBUdWUgSnVuIDI1LCAyMDI0IGF0IDEyOjQ1IEFNIEFFU1QsIENocmlzdG9waGUgTGVyb3kg
d3JvdGU6DQo+PiBPbiBib29rM3MvNjQsIHRoZSBvbmx5IHVzZXIgb2YgaHVnZXBkIGlzIGhhc2gg
aW4gNGsgbW9kZS4NCj4+DQo+PiBBbGwgb3RoZXIgc2V0dXBzIChoYXNoLTY0LCByYWRpeC00LCBy
YWRpeC02NCkgdXNlIGxlYWYgUE1EL1BVRC4NCj4+DQo+PiBSZXdvcmsgaGFzaC00ayB0byB1c2Ug
Y29udGlndW91cyBQTUQgYW5kIFBVRCBpbnN0ZWFkLg0KPj4NCj4+IEluIHRoYXQgc2V0dXAgdGhl
cmUgYXJlIG9ubHkgdHdvIGh1Z2UgcGFnZSBzaXplczogMTZNIGFuZCAxNkcuDQo+Pg0KPj4gMTZN
IHNpdHMgYXQgUE1EIGxldmVsIGFuZCAxNkcgYXQgUFVEIGxldmVsLg0KPj4NCj4+IHB0ZV91cGRh
dGUgZG9lc24ndCBrbm93IHBhZ2Ugc2l6ZSwgbGV0cyB1c2UgdGhlIHNhbWUgdHJpY2sgYXMNCj4+
IGhwdGVfbmVlZF9mbHVzaCgpIHRvIGdldCBwYWdlIHNpemUgZnJvbSBzZWdtZW50IHByb3BlcnRp
ZXMuIFRoYXQncw0KPj4gbm90IHRoZSBtb3N0IGVmZmljaWVudCB3YXkgYnV0IGxldCdzIGRvIHRo
YXQgdW50aWwgY2FsbGVycyBvZg0KPj4gcHRlX3VwZGF0ZSgpIHByb3ZpZGUgcGFnZSBzaXplIGlu
c3RlYWQgb2YganVzdCBhIGh1Z2UgZmxhZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IA0KPiBbc25pcF0NCj4g
DQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhhc2hfX3B0ZV91cGRhdGUoc3RydWN0
IG1tX3N0cnVjdCAqbW0sDQo+PiArCQkJCQkgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gKwkJCQkJ
IHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBsb25nIGNsciwNCj4+ICsJCQkJCSB1bnNpZ25lZCBsb25n
IHNldCwNCj4+ICsJCQkJCSBpbnQgaHVnZSkNCj4+ICt7DQo+PiArCXVuc2lnbmVkIGxvbmcgb2xk
Ow0KPj4gKw0KPj4gKwlvbGQgPSBoYXNoX19wdGVfdXBkYXRlX29uZShwdGVwLCBjbHIsIHNldCk7
DQo+PiArDQo+PiArCWlmIChJU19FTkFCTEVEKENPTkZJR19QUENfNEtfUEFHRVMpICYmIGh1Z2Up
IHsNCj4+ICsJCXVuc2lnbmVkIGludCBwc2l6ZSA9IGdldF9zbGljZV9wc2l6ZShtbSwgYWRkcik7
DQo+PiArCQlpbnQgbmIsIGk7DQo+PiArDQo+PiArCQlpZiAocHNpemUgPT0gTU1VX1BBR0VfMTZN
KQ0KPj4gKwkJCW5iID0gU1pfMTZNIC8gUE1EX1NJWkU7DQo+PiArCQllbHNlIGlmIChwc2l6ZSA9
PSBNTVVfUEFHRV8xNkcpDQo+PiArCQkJbmIgPSBTWl8xNkcgLyBQVURfU0laRTsNCj4+ICsJCWVs
c2UNCj4+ICsJCQluYiA9IDE7DQo+PiArDQo+PiArCQlXQVJOX09OX09OQ0UobmIgPT0gMSk7CS8q
IFNob3VsZCBuZXZlciBoYXBwZW4gKi8NCj4+ICsNCj4+ICsJCWZvciAoaSA9IDE7IGkgPCBuYjsg
aSsrKQ0KPj4gKwkJCWhhc2hfX3B0ZV91cGRhdGVfb25lKHB0ZXAgKyBpLCBjbHIsIHNldCk7DQo+
PiArCX0NCj4+ICAgCS8qIGh1Z2UgcGFnZXMgdXNlIHRoZSBvbGQgcGFnZSB0YWJsZSBsb2NrICov
DQo+PiAgIAlpZiAoIWh1Z2UpDQo+PiAgIAkJYXNzZXJ0X3B0ZV9sb2NrZWQobW0sIGFkZHIpOw0K
Pj4gICANCj4+IC0Jb2xkID0gYmU2NF90b19jcHUob2xkX2JlKTsNCj4+ICAgCWlmIChvbGQgJiBI
X1BBR0VfSEFTSFBURSkNCj4+ICAgCQlocHRlX25lZWRfZmx1c2gobW0sIGFkZHIsIHB0ZXAsIG9s
ZCwgaHVnZSk7DQo+PiAgIA0KPiANCj4gV2UgZGVmaW5pdGVseSBuZWVkIGEgYml0IG1vcmUgY29t
bWVudCBhbmQgY2hhbmdlbG9nIGFib3V0IHRoZSBhdG9taWNpdHkNCj4gaXNzdWVzIGhlcmUuIEkg
dGhpbmsgdGhlIHBsYW4gc2hvdWxkIGJlIGFsbCBoYXNoLXNpZGUgYWNjZXNzIGp1c3QNCj4gb3Bl
cmF0ZXMgb24gUFRFWzBdLCB3aGljaCBzaG91bGQgYXZvaWQgdGhhdCB3aG9sZSByYWNlLiBUaGVy
ZSBjb3VsZCBiZQ0KPiBzb21lIGNhc2VzIHRoYXQgZG9uJ3QgZm9sbG93IHRoYXQuIEFkZGluZyBz
b21lIHdhcm5pbmdzIHRvIGNhdGNoIHN1Y2gNCj4gdGhpbmdzIGNvdWxkIGJlIGdvb2QgdG9vLg0K
DQpUaGF0IHNlZW1zIHRvIGJlIHRoZSBjYXNlIGluZGVlZCwgYXMgd2UgaGF2ZSB0aGUgZm9sbG93
aW5nIGluIA0KaGFzaF9wYWdlX21tKCk6DQoNCiNpZm5kZWYgQ09ORklHX1BQQ182NEtfUEFHRVMN
CgkvKg0KCSAqIElmIHdlIHVzZSA0SyBwYWdlcyBhbmQgb3VyIHBzaXplIGlzIG5vdCA0SywgdGhl
biB3ZSBtaWdodA0KCSAqIGJlIGhpdHRpbmcgYSBzcGVjaWFsIGRyaXZlciBtYXBwaW5nLCBhbmQg
bmVlZCB0byBhbGlnbiB0aGUNCgkgKiBhZGRyZXNzIGJlZm9yZSB3ZSBmZXRjaCB0aGUgUFRFLg0K
CSAqDQoJICogSXQgY291bGQgYWxzbyBiZSBhIGh1Z2VwYWdlIG1hcHBpbmcsIGluIHdoaWNoIGNh
c2UgdGhpcyBpcw0KCSAqIG5vdCBuZWNlc3NhcnksIGJ1dCBpdCdzIG5vdCBoYXJtZnVsLCBlaXRo
ZXIuDQoJICovDQoJaWYgKHBzaXplICE9IE1NVV9QQUdFXzRLKQ0KCQllYSAmPSB+KCgxdWwgPDwg
bW11X3BzaXplX2RlZnNbcHNpemVdLnNoaWZ0KSAtIDEpOw0KI2VuZGlmIC8qIENPTkZJR19QUENf
NjRLX1BBR0VTICovDQoNCg0KPiANCj4gSSdkIGJlZW4gbWVhbmluZyB0byBkbyBtb3JlIG9uIHRo
aXMgc29vbmVyLCBzb3JyeS4gSSd2ZSBzdGFydGVkDQo+IHRpbmtlcmluZyB3aXRoIGFkZGluZyBh
IGJpdCBvZiBkZWJ1ZyBjb2RlLiBJJ2xsIHNlZSBpZiBJIGNhbiBoZWxwIHdpdGgNCj4gYWRkaW5n
IGEgYml0IG9mIGNvbW1lbnRzLg0KDQpZZXMgd291bGQgd2UgdmVyeSB3ZWxjb21lLCBJIGd1ZXNz
IHlvdSdsbCBzZW5kIGl0IGFzIGZvbGxvd3VwL2ZpeHVwIA0KcGF0Y2ggdG8gdGhlIHNlcmllcyA/
DQoNCj4gDQo+IFtzbmlwXQ0KPiANCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaHVnZXRsYnBhZ2UuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFn
ZS5jDQo+PiBpbmRleCA1YTJlNTEyZTk2ZGIuLjgzYzMzNjFiMzU4YiAxMDA2NDQNCj4+IC0tLSBh
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jDQo+PiArKysgYi9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2UuYw0KPj4gQEAgLTUzLDYgKzUzLDE2IEBAIGlu
dCBfX2hhc2hfcGFnZV9odWdlKHVuc2lnbmVkIGxvbmcgZWEsIHVuc2lnbmVkIGxvbmcgYWNjZXNz
LCB1bnNpZ25lZCBsb25nIHZzaWQsDQo+PiAgIAkJLyogSWYgUFRFIHBlcm1pc3Npb25zIGRvbid0
IG1hdGNoLCB0YWtlIHBhZ2UgZmF1bHQgKi8NCj4+ICAgCQlpZiAodW5saWtlbHkoIWNoZWNrX3B0
ZV9hY2Nlc3MoYWNjZXNzLCBvbGRfcHRlKSkpDQo+PiAgIAkJCXJldHVybiAxOw0KPj4gKwkJLyoN
Cj4+ICsJCSAqIElmIGhhc2gtNGssIGh1Z2VwYWdlcyB1c2Ugc2VlcmFsIGNvbnRpZ3VvdXMgUHhE
IGVudHJpZXMNCj4+ICsJCSAqIHNvIGJhaWwgb3V0IGFuZCBsZXQgbW0gbWFrZSB0aGUgcGFnZSB5
b3VuZyBvciBkaXJ0eQ0KPj4gKwkJICovDQo+PiArCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBD
XzRLX1BBR0VTKSkgew0KPj4gKwkJCWlmICghKG9sZF9wdGUgJiBfUEFHRV9BQ0NFU1NFRCkpDQo+
PiArCQkJCXJldHVybiAxOw0KPj4gKwkJCWlmICgoYWNjZXNzICYgX1BBR0VfV1JJVEUpICYmICEo
b2xkX3B0ZSAmIF9QQUdFX0RJUlRZKSkNCj4+ICsJCQkJcmV0dXJuIDE7DQo+PiArCQl9DQo+PiAg
IA0KPj4gICAJCS8qDQo+PiAgIAkJICogVHJ5IHRvIGxvY2sgdGhlIFBURSwgYWRkIEFDQ0VTU0VE
IGFuZCBESVJUWSBpZiBpdCB3YXMNCj4gDQo+IEknbSBob3Bpbmcgd2Ugd291bGRuJ3QgaGF2ZSB0
byBkbyB0aGlzLCBpZiB3ZSBmb2xsb3cgdGhlIFBURVswXSBydWxlLg0KDQpCdXQgd2Ugc3RpbGwg
bmVlZCBhbGwgZW50cmllcyB0byBiZSB1cGRhdGVkIHNvIHRoYXQgcGFnZSB3YWxrZXIgd2hpY2gg
DQpkb24ndCBrbm93IHRoZXkgbXVzdCB1c2UgUFRFWzBdIGdldCB0aGUgcmlnaHQgaW5mb3JtYXRp
b24gPw0KDQo+IA0KPiBJIHRoaW5rIGlzIG1pbm9yIGVub3VnaCB0aGF0IHNob3VsZCBub3QgcHJl
dmVudCB0ZXN0aW5nIGluIC1tbS4NCg0KVGhhbmtzLg0KDQo+IA0KPiBUaGFua3MsDQo+IE5pY2sN
Cg0KQ2hyaXN0b3BoZQ0K
