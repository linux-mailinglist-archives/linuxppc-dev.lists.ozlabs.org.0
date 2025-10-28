Return-Path: <linuxppc-dev+bounces-13440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AEC14FA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 14:52:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwsHc3FH9z3dTl;
	Wed, 29 Oct 2025 00:51:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761659516;
	cv=pass; b=Eq+JD1pkyn0kHSN6v9tnbot5cqW28xMQz74yBe/1Nr4P0gbz+I4Lsqou1oJHHaFae7zRQITHJrlWgLnXzCpA7aKc+suBS602dQ+dTSu9i5yz75oAAc57C9v7Vqbugn16z+7OTE8+/7ZNnf1ooiZ3lyQTM0AJtJfpqvFaN+V3K4dPeZis4cPXWLeBm64AC88cw8RUzHhPH40snFiyEPEzaKftQn+tNkYULw9wmxGNpx78RU/H0gi9XNno0ne2YqDda4nUDSFD3rIAvHxbUaE3TVJwqE/gH4jtU1NkTUN/IDtwsb93JCkC4U82p134kT/sraIUR4sdBRRifFTUV8KS+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761659516; c=relaxed/relaxed;
	bh=CSpjMDFzvoZiahWNLB8AqsQvehKUDuvlS8DM8cOs5I0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CBvBu7b9ttYz3f1p7Xg0uVIKGv+kJ/daOO67cqcz5aNfyh/DKaXlupfO/rW0CNFAvEwTpSda59OTiQl3AhnOt5RH05QzDCXmvJtITmzckANyXb1UoWMUVP+2+cvmWrxTskZrhA0Z8v59dgqCF6tM0TjGPN7ZbN09LAxuP9gn86OdIllnN9UNthO24ZsLSjIhFMKrbpLaOXq8p/PhtdeNmz+s2FMWWaaF/mrN5e6j3ySOKZCAkNzQzK3TAl8/yxtSQGhpEII0cmc8TN8MrWUQSxctybsPidLQjcrnZ5383k5Vix9fkg/ShsMBu1VW9MLFaw3CJ3fZ/dPbXcLWzv7zqw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=qZFHiiut; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=qZFHiiut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwsHb6Fr1z3btv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 00:51:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MelzqHi13a4dasKrb97baISj/e1Bz3Mt3TMAYowUSrJtDrLSdCkrL0fa1dnaf1XnDukIK+Hj7ILv39ASwalJr8vQXTRQtPMjQ52Pp/Ge00MOxJmU4esX225gq++6kSkL0f2VS7Sot8Aj1Gz6cMsHmIKPNBcUunTrdaXDbEPfGRBBtJFZSvzvH9G36oDHI8v1OeLh5//O82j5uGBZ7yK66paFn1z3vG7So+0wg8nc1tK+Pq5H9Tkg5ilwC81m9PmNwzRpKDQoJkWe0v0aYM37waY6kw+0TfgQImfOHvzr/c/Ak6GJGry4BZHH5ndJlYsCXaiy9Xv7uteLptRflRKNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSpjMDFzvoZiahWNLB8AqsQvehKUDuvlS8DM8cOs5I0=;
 b=X4yvEvxw12N65n6QB/Oj/1+p7gxzkz8+3ONFB6ycWX7UGeANgrcHfWFzSZRORB6whngXKx2FzjYU+z+WwPY4llmH29O6r75C1P6eI3xoCzXsc7M7SzMOjDNEuhx7k4jrqhcZ4lcfMvlx1hsvlCF0fZdGmAPtc/xLjXTuKNs1jdwSTFz1LAEHwFg8aQEXINclV78pS5iPKOi3bCevowNhT6piJpDSbDAnB07ZZC0BqvTQazv2r7N3bFLVUaIvvw5VRDXtQL/sRJ7Yu6p2ncQmO8P/nzz4ayGAypyz4TzwBcUpY1pMruCyrVexP0ptVImnKIA7qleHMnRmlqtAf+CEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSpjMDFzvoZiahWNLB8AqsQvehKUDuvlS8DM8cOs5I0=;
 b=qZFHiiutJydKAib5UhfDza5nkG0r0kdBkN9QApbWAj7YOs36dqx+kzrI6j9EvNEKNdtCT+ZxxlPNP2g9Po9CAoozKcaQLn/NxQ82IzxymlqOmotq/AxXh1i+VZmPgFELzMr1L9OTTo2wND8PMolegOxYNi7lYSF7OxM5CCvm6w1AAj6haJop9Z25AzoDzASz15hXBRLGh5zEPJ+xkTyfUPPe/dF/F2DI+4mlAxgDSQsJIOYgKRwCv61DhNemGBNjhc8YOi7g5REnVaT2HfDSXJNAQZDX6VWdznskF3THDhL1dssLnTKJAzTA6hSajLZwv/n+bsv1qfn3pZfBfzKzlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT1PPFC07946807.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::581) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 13:51:31 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 13:51:31 +0000
Message-ID: <71454a26-7ea2-48c0-83bc-84ac7c80ff8a@efficios.com>
Date: Tue, 28 Oct 2025 09:51:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 04/12] powerpc/uaccess: Use unsafe wrappers for ASM
 GOTO
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.356628509@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251027083745.356628509@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0483.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::22) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT1PPFC07946807:EE_
X-MS-Office365-Filtering-Correlation-Id: 755a6793-e8f1-491d-5012-08de16291953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXU3RTVxeTZMNm94VTM4ZXRrazQrbElnc0FJU2NGcWtkVVhQMXlJdThZMjUr?=
 =?utf-8?B?Wk03WnJNNDJnTmtuS3F5TXliSFFLTnNESXFidzJZSHR1VmdkK0hGRDh3eGty?=
 =?utf-8?B?TXpBc1VQc3o5aXNWZ1J5YTBzRVgxUG92QmRTMmxQQTlVd2ZycVZOV2pXNCtv?=
 =?utf-8?B?K0w2a3VoMk9UTFgycUpJNGJxUUQwelNYSDFyc2g5dnFScU5ITWlhTGs0VGg1?=
 =?utf-8?B?TVFFVmpMK3J5L3ByY3FiWit1U0pPVGFqZjlTaXFYQ3lVK1d3U1J1elh3REhl?=
 =?utf-8?B?TmRUUkdDL1BiVHAzQTRmS1hsb0lUWk51VlVGd01mWU83K1FKWFprbTk2a0s3?=
 =?utf-8?B?YVlPV2VBN0FySHhaMnFwTmxsRDNQS2N2TFRJNVZzdmxEZUMxeitUd2grQ1Zo?=
 =?utf-8?B?VFl5Nm9mdjZJQnRveElndDk4WU5zeXhJaG5sSmY5M2FtYVFlU2VVQmFJalZx?=
 =?utf-8?B?NE5ocXJGOTJMSTRSc3A4SWtRZndFbXh0aW5DWkRZbkJqMkJ6Z280ZHA3cVBl?=
 =?utf-8?B?MGtEWmZKMG55Mk03WEdFKzZNeGRXMTFpeUpaTmFVVkFlL3VVL3dxMW4zTVBk?=
 =?utf-8?B?Y2RxVE5XU2tzeWdudWc0QUR4QUxyL0w2OTVJUUovOEJ3VGVlcUhvc3BTNTFT?=
 =?utf-8?B?M1FaYUc3Kzd0WWdzMTdsNy9xNFNmL2lQcDB6VElQTmdjS1ZkTGYzRldXMHQ1?=
 =?utf-8?B?S3JIRkwxaWVzSE02cUcvUXZnbDBMOHJ5c0ZhMHcwdHJXMVo0ZkpKYlZKNmg3?=
 =?utf-8?B?eE1wd0pLdUhEUmhpVXZxWHEvL3EzR1NwQ09wL1Y5eGgxa1RiZ2lrRkw2NzVx?=
 =?utf-8?B?ZXdKTXVZUTVNV2tYWm54eVJ0dGJjRHloaURyWDRiTzhLY3FZN0FPdjVVY28x?=
 =?utf-8?B?UU1KaDUwaEx3ZjRaUzI1M2hWaUIvYnlnS2RwRU42R3JJbDZ3T0x2R2diOXM3?=
 =?utf-8?B?TzJwNUlOaWZ1VzdXQ1ZUalZrMjBjbGFOelpFMnA0TFUrbk9MQTBDdjU3aGI0?=
 =?utf-8?B?dWQ0Q2JuTGJjZldmZGl0ZlVVUW9keXN2TUZCR3ZldHg4elRZd1d0NjJOVzZu?=
 =?utf-8?B?c2RFaFo2YWR0eHJzVG1od1J0dVZRemw4RWd2U21QSnNydlhLZUcxMlFEUzZG?=
 =?utf-8?B?cml6NkJ2WnpwRHlrc2FQMytFek9GNitzSEtWb1V5UEUwU1JDZ29xK3RJMjVv?=
 =?utf-8?B?VDZHTWlFeDJ3VnZNMTYxTHBja0o4NXBEQ21vcmhoZysrMlhxekpKeFhwNmR3?=
 =?utf-8?B?UXpyNlgxL0RPNytoVStDUy9zbU9LMXR2N1I5eDFvaE4vZUF2aEE4dTdTZndN?=
 =?utf-8?B?STU4NDFXa2trd2pmdDVHaCtHc1Y5bjVVQzdSN0huVUR3VXRxZTJsYWo3OHZs?=
 =?utf-8?B?MUJOcTBjRzR4V0g3UTdlam1lUEVoeEtLN3h3K2xYSCtHTnBoM0Q0N1JtTkx5?=
 =?utf-8?B?UGViUzFrMTBueTUrdkR4ZGpjai9taE1aK1NkNkxGdXR6cG1TZGR4YmlQZkZh?=
 =?utf-8?B?aDVJYzBpcFNpTzNYZGtlNExBQkt1am5VUlVLcDd2eUxXRTljdEV0V2RuL0JO?=
 =?utf-8?B?Vjd4MGFhQ1RaRzR2bWw1NVFUUHFuaWU3ZFRBSml0azJoNnZqOEM2UkFoczZW?=
 =?utf-8?B?UzB2SWI2TnoydHd4dGtGMWtUR0ZQNGFubUVtWXJxNTJwL1ZWZzg4akZOcldx?=
 =?utf-8?B?UTNMUzhpYWI1eUZYdDFUazVCTkM4RkJBdE9rdnVCMTZJQ0pMSUVEN1ZMY1dp?=
 =?utf-8?B?U2FzbFhYMVAvaTVpSURQWFJkNVk1ZE5VeG5PMU9tckVOK2ROUUdjekJtWito?=
 =?utf-8?B?THhqbk5Ibm9WUHNKdmdQU2FQTDFwcXRydkVvVW14TExYVmRiQW9zR2pnSXNW?=
 =?utf-8?B?alh2K3A0ZXllOEJYVkJZanQ2VjVjV1RhSGxqWThhQmhhd1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WENFamhrTUpnWDRzaGNNcFNkMCtqNmJ0TDNvTk0rK2Z0ckJ0QkszakJ6SmZv?=
 =?utf-8?B?YW1aTHpvV3orVHJEMkFUS3lrVmNoWnZhM09wUXQvMCtteVV6Q2Q2SzhuaDhY?=
 =?utf-8?B?SEVPcTk5MncxMjNVcW9ma1NSU0Jkc1ZiY0Q2WXNRbnlrOWVrVGJPZmp3Y0Rj?=
 =?utf-8?B?V3JKblVMa3FsZnBDQ3lXYmxnVUd6aTlzTzVUR21tVHJMRTArbkkxUEptNC8x?=
 =?utf-8?B?R1hweFdENkU4K1BLODg0Mk5DdWVoTEV4TGMraVlLdzZ3Nk9zNlBNbEpxbkFk?=
 =?utf-8?B?SUJkWGIwV0U0VktzMElYZElFVUtpZjExb2VVZUJSQ3BSdHg2Ri9NOURpaG9z?=
 =?utf-8?B?K01odzQ0cHRUSFBkcS84cVorOWxWa2VqdzZTL252SkFsdHI5UGl1bDY1SHA3?=
 =?utf-8?B?ZEVpZVkwczRRak5taDJFYkhCMmpFQ2xRcVZYU2hOUEVpN05CQlM0Z2ZGUWt6?=
 =?utf-8?B?MTFhdU1SNGV2RXpFRncyUHBEZzZudkwyVFFsZ2JpMEx5bHhyUFlvTWZTZzQ0?=
 =?utf-8?B?dXNVckV4eVNaa1pkaGw0OVJlOUlVaFRVRjJpMHA3RHgrV3p4QmJMM1NmMjBV?=
 =?utf-8?B?aGJrbVNjNWpmY3hkVzJjdHlycXEyNFpZZjNlN2lTdktlUXRpOWVFbGJTd3pZ?=
 =?utf-8?B?anY3MFVBVHZ3RnE5Y05IcGVjRmhOSU9lNWhNbFMzQWdsVklPazk4K3Y4a1RV?=
 =?utf-8?B?L3llak9MYzY1N08xUzJYM1dMbitWR28rbDY1L2pJNTdDRVk5SGR5dlBTSmM0?=
 =?utf-8?B?MEROZGdwbVBjODBIWHJxdWNiQnU4U1hwQ3dVcmFjcnlxM0xublRSZHJtR0g1?=
 =?utf-8?B?ejR2T09ONThXTm1qanVUSjJIYjBGR1g2WG9xZi9yTUdtbUE0UkM3c0tMWkRV?=
 =?utf-8?B?eVVlRVFEbDlKQnBOa3JXVitxV2RRNWhaVVc5czBoVStHR3AzUExGYU01MElw?=
 =?utf-8?B?b1pFaWxBYWZwVGFuMkp0LzNueW5ZT3ZHM2hPdjBjbWtlYmZPVGVQNkpwR1JQ?=
 =?utf-8?B?WkpjUFFuZjEzUkpFUnZ2NXlPU2pVZExEdCtKZkloNTNVdGhtVXArR0tWdXZ6?=
 =?utf-8?B?NWtOcW5heUpxcXpWR2dWb2JmZEl6QndmcjR3aVczUVdTeHphdnZ4T1FidHRp?=
 =?utf-8?B?bUFGZEVvbVdUYmVUb3kxOENIdHJQL3FvTzMza1ZqTVJKQ29VOHVwQ21ObDFj?=
 =?utf-8?B?MXFrTm5Sbldsek4zZDVEZ3N6cE8wdjhJNDhlaCtUbFd3R3ZFczkxV1N2VW5I?=
 =?utf-8?B?T0h3K3hRaFIvYUdhaU9hT0lYdnhnck9JMDZMVER0bmNTVE52MWU0RStaQW9s?=
 =?utf-8?B?NTBiMjhINTlZSzZkZmtsMEdqRENCMlBzdDhOWG9UR3NOY0o5cU5KR2s2b3NU?=
 =?utf-8?B?alI0RFBuaExkMlRnSjZyeEtjWTlHcm9zbVJRTGE2cHR1alU3SmRxQVRtcyth?=
 =?utf-8?B?SjdTNTFyemVVQldSQTRCT2ZpRnhhNnpUeXM1ZTRzWmxEaUxHc1owM1ZJMlBJ?=
 =?utf-8?B?K2poaHZJaDZ6SSt0TzFsbjFzRGdaY0J6Q1BUZzFFMTNxMkhpV2dUY3orMGZj?=
 =?utf-8?B?OHpvV1N6Q1hvOVFXb0doSDh3ZU0yTHZBR2JxUXFVeVZ4WFZiazd5SmZTMEpn?=
 =?utf-8?B?MmJub1FzK01IcmMvMnZSVWQzSnZJa1NFTjZLeXZWSVZqc1IvYXVZaXhCazV4?=
 =?utf-8?B?YTZvMVY3YWUwNGM1VlgxZEtLUDJ4QUZ5TU1mVWdKejIyd3M3MFJwMXVTZnRv?=
 =?utf-8?B?WmVzTm0yZkwvT3BYU1YwUDR6dEZndngwSEdQVHJVVWNKSDg3eXVyd2wwOHRu?=
 =?utf-8?B?WS9KbFdGN1ovSHU2TFRwYTErZjdpV05OV0ZwU0lGazcxYjRJanpBa293MzdM?=
 =?utf-8?B?cnR3bDdKaXkyNXh2ZlJBSThiNXlUTzRaQWV0M0FwK25YZUVTUXVxQTR6blRS?=
 =?utf-8?B?Z3hnSEM0TlV5RlFXdUlmeXdGZmtSUGpKSHJKVmg0WGpRTVBhYUNaUW8xRlpN?=
 =?utf-8?B?WXRKRkNuV2pPTnJJdy9aYXgrS08vMzVHa3YxZWRtelY3bUdQK0J0TEVWR1Qz?=
 =?utf-8?B?YWJGL2gycTBreWplcXZaZG9FcVpocHBwditFUkx6QVBmSDVEMm1DYWhMMk9F?=
 =?utf-8?B?MGFxdXJZR2dxb3piK1RJZklxOWRDV3Y4UEtaVCtmRTExcjhPYzRweXFiR0ZE?=
 =?utf-8?Q?dODdidmKb9ikjsJZtEoJAdk=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755a6793-e8f1-491d-5012-08de16291953
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:51:31.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zH2oXHakrP3o//NUT92TpGE8GeIlUbKH5Lj8zPS3bGXbsuCcASudBC3u9Y1/I4ZqhYWD68n0HP3p+7p/LS65byIH9wqmYWAwbrT2NBBGtP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PPFC07946807
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-27 04:43, Thomas Gleixner wrote:
[...]

> Rename unsafe_*_user() to arch_unsafe_*_user() which makes the generic
> uaccess header wrap it with a local label that makes both compilers emit
> correct code. Same for the kernel_nofault() variants.

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

