Return-Path: <linuxppc-dev+bounces-5637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEFFA20DAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:54:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8wd5yckz305m;
	Wed, 29 Jan 2025 02:54:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738079649;
	cv=pass; b=YW118XH7irQADnRhpquZb0zzVRjKOVnm5z5mLLFx8DsBIsfaO8RWvPcIVQzoxcAtG/Gq6HbgEqwzdoKHe3X2S77Z/twshFwa/0Us1Gihhp2eIXaYp2nJqebEXJzxTmpSeYGl0wOSL2KoGsLMpD8LKZ1hceyIFE44rBa2zWNAKA+g+iCFTH2MLZRsdqwFiOOJOONjFOoFcuN+vnsYYE7WH92s4cCijecAQUSM77x/juS8/jC2vlPh1eBC5L7glBVHjgLY6zt9p2Q2s/FuLHnL1hU3S3NJTVSJVMk8qEG3uxL0JzgROxGnln++9DBcWfX1PmXCKGf0Wg1o9m9XnL19Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738079649; c=relaxed/relaxed;
	bh=i95QI9uxrJ1jG2qmxLGjkHcrycJe+ehHqd//8bsfQmU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C9xEZfo9ivVqrIs2fvZxbig7oc+J5yNypgSlDiRnMlJdCGOyaJ7MGq4SpbsCu76Kj+t+YH1VBDCh4rcL8aXtIoaf8CZrN5gp+6MVNF2BN3Ek+YlfKlB3TDA4ZNzabGy8Po341AuAPK5Wn057SauR3EHelfBFBAmOOYU3Cu/iGUdwSBUz6yRmvbP3sBzwXMlYInxok/LRqVWcnH1qpbsr3uCn+6h7v2/khPxQAXMGJEWm+e7Tn3d3jzt7EmaawXoJ5oVzlIrVC0F80shAnYdFwDfzHLsqFZ0WXxIfdFCbHe6XJIyH/KreB/98BT/omESWJGOI134daKqpSrDtixStEw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=ruLtgPEn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=kstewart@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=ruLtgPEn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=kstewart@efficios.com; receiver=lists.ozlabs.org)
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj8wc36JYz303K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:54:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCYUKtrcynAmA3WUBazTw/Zd4U8kyD+q0yXrl0yHCiSAOgfxi2Cw74jD7O1ytJdteEAZ+ozt897gNrhUHum1b2adBfXjJD7+ny/yTmFKPsLLH0/u/0asp+eLXROjeujkh1GHTQRLYLnKz6UHP3YP706LBFKyoVyWzmvVQTKbxhb51E44VjMr3hAZ+dHXCJFiHl1iLIl5q77eYtsspvdZ6JwO8aOtglteaiXZf1S0bOdXSew8Wv/F0np8Fl9ctj7uYkUTnBE/01ftWU3Ucp55CNJeTh3wkgfI2C0KU/zRj+GrGLC7NQUxwpAxbjwnHii0uIC7zpQ9XEvaUqejVMPgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i95QI9uxrJ1jG2qmxLGjkHcrycJe+ehHqd//8bsfQmU=;
 b=l0ECEMlDEFped+rMmYL5BAz3PXuHlBHh8UNXfr6q8FbQeMeuPpVGxw8wK827kE7uppmDIvEK30sLHhgKVfSJF394EzuRDN48ogKaOWSnaOfqzemFn9WpCwkXirBII/aIvu0uD8pqZAsGt6FoyV5aAn01pJDQ4zGO8uS9rRW6WVB8w7j4c322HCyM/ffc1VJNO+WS1dakwiI/Aufun2AM80vkZkdgWPCHVjSVptHSumxR9IlBlaFvU7XaCXyIqLK31UOJsXUARuhjBRFzMxE8KSI9BbG3xECuo2nUc1a2gc4wIMEgapJFnuGnx44itIMoIpdbxb6ZM9smJf0aG5PFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i95QI9uxrJ1jG2qmxLGjkHcrycJe+ehHqd//8bsfQmU=;
 b=ruLtgPEnNgIj4DUj3S++2/5zhnPTAvhGzJGdhEsffr4BXfUc988h6RFv+4bFZp7RF+DNvhdE+s+5RLENveLjLy/UZqP6wzIPedyN9n/gWRdnnZWZUe+2hJLjDVB3VqHuGaYjgCSgS2dL0R2wSuv2R59aXRUimjIVyB7ZDP/Wvct6VAKXggdO5O5AbK4mz49sySBQ2/gAkuKOC47PAJnui17O4+V74mpxU4NwxcHRxl7EcC57O1M5nBPuShTbD8t5noH0LM1xN+zgSWC7pBSV3driumIdf6xDhh7IyKCGXV26eKjrEf3ciaTOjbn13ixJM+iMYzueFpPrrWLsViMgnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e8::14)
 by YT3PR01MB5779.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:67::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 15:53:44 +0000
Received: from YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e27c:c1e2:e6e:9256]) by YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e27c:c1e2:e6e:9256%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:53:44 +0000
Message-ID: <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
Date: Tue, 28 Jan 2025 10:53:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
Content-Language: en-US
From: Kienan Stewart <kstewart@efficios.com>
In-Reply-To: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::13) To YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e8::14)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10341:EE_|YT3PR01MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 51569954-23f0-4f87-a47a-08dd3fb3f1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODVLMXE3SFBPY1JTREtOMEU1cEpnQWZhK01aUVdTeVB2WW8xRk1meTgzMzAy?=
 =?utf-8?B?WG9CSGsvaldVeUUwQmluandMU2Z5Uy9nUVJnYlpFeXVMa01aZEd1dHlIaFFu?=
 =?utf-8?B?SjRuMDNidUVMd1lsdkdtdW1UVWFoR29ObW41VWl6dTlkOFJ0Q3YzL3BacE5Z?=
 =?utf-8?B?VzlqelVxbis0Uzd5azIvK2dGVGdPeTM3Qm0wMlJMdEZiY1FCc3plSzBwbjBO?=
 =?utf-8?B?aGlMZkc5NHVzbTRPR3FPSU9VNXRSNDhmLy83ZHlCZnVVb3ZkYjV1TVV6cmov?=
 =?utf-8?B?VmRFWWRYK3ZVTlR0RzJIWGdINzVIcU96VEUrZUN2Qmc3eEhjWXJ2SXNHRHlE?=
 =?utf-8?B?dnE1UFR1V2RacHh6TG9ObkpvZGNDMlpsN3FrNENXTzZ5aXQ1MGxzeUMvVW53?=
 =?utf-8?B?RXRLNzBEcm9Zcnh3TnA4TXZCRXVOOVlIdDlJWWg5SkRVNVpaUG1zK3lFYjlZ?=
 =?utf-8?B?ZGs1djExWWh1RXZFa3lCN1BlaXdVbkdhVXpZUHRBa2UzVnRzOGhUckxJQlY4?=
 =?utf-8?B?NEVjby95SEZ6c2xJZ1dUVVdRSzdpcjNTS2ZjbzdjMVBWeVhzQmFiL2xKL0Zh?=
 =?utf-8?B?Y09KaDFKd2ZyWnJ2TmJBSHhTekJTd3l0aXExQmN6L1JBKzZvMXRyWFVzVVdP?=
 =?utf-8?B?K3FEanJ0Tm9NN0ZBNDJzRDRwM25ReFZWdUpaQ0hWUnFQREMrTC9rY0g5dEJo?=
 =?utf-8?B?LzJDS1BsdTNIN3M5Sm43MHMxYUtHTktrLy96MzMvVk5RSGcyUUJlTDk0aXkz?=
 =?utf-8?B?WjdNMjc2bGFPQ1krQnNPcUpoZUlXR2FNU2VCTHJTUjBtQlF1OEFObE5kaWJV?=
 =?utf-8?B?QTZVZE9jRnhjbzE3RFpiVDR3M0ovbWlWOXpjc2lWa0t1QkZaMlVPYTNqR0FD?=
 =?utf-8?B?eWE4a1c5aDBWNWpWR2tIbm9XVy85YnlzZXVkdDc0WkltQllVZTE0NkZXZDJE?=
 =?utf-8?B?TWcrY3NRYnJqUWVvcW4rUXdJN1ZoOU1nYldrcUlIZERxenJTc0JYejd4dFJ3?=
 =?utf-8?B?ZWRCc1dLR3hUaG9ReWxwOWxVNThSOGpuWVZkamg2aHlWNDcrUk5Edk85YVBs?=
 =?utf-8?B?OHRtdlhEbjVTM21UcU1qZDdwK1ViSCttM1RJYld6UXNFZ0U5VEdMV01vY0ZH?=
 =?utf-8?B?VThMaEJOODBRSzlPRUJaWDA5M2c0TzFWSWJVcCsxVUkrZjNOYUdWTzhYa3Vn?=
 =?utf-8?B?cnpYOGpiWml1ZktFYXI5SnFqNXYrV01iRWlHTDBlcDJQV1FnVFZHQytPQ3hH?=
 =?utf-8?B?UWxQelRZMWhSNHRCcWlKV3NicEtFdjZ3N3krSENQS3FXTU54anJ0NzZkdE42?=
 =?utf-8?B?Tm9tNVVyK0NVNFVqb0RMdE1OYkRXTC83a1V4MUNpWlJRSEUrZHBBbC91Umpq?=
 =?utf-8?B?US9ybTN4WTJMZDlaRlg2MHRSeGtiK3V4aEE0VXcwL0JIbTY3NStVQkV5cTRQ?=
 =?utf-8?B?RDhmMDEwVmY3RFIwdFRoTzhHbU9wdFJjVUNRbU16THViRmJPQm9oWjgyZzlW?=
 =?utf-8?B?a2dYYjFiZVRYRkhsVWtCdW9uOXU2cWxJWTEzSE16cGxWQkxBL2hEWTRhMi9L?=
 =?utf-8?B?Z2RFQU1nbWlNT2l2MnkyY0NPVVVhUUhtbGZBSERqOWhUalMxVUdtNU1hT2xz?=
 =?utf-8?B?dk1EN2JlSGg5UXhIVDV6d051Q0VsK2NrMU1FaHFBZDNXeFRHdzFCcDViRC9Q?=
 =?utf-8?B?ODBVeVl1emdCT0oxMnhmRjFObUZWMDZzc0Ywb3BUNVdKbXgwQTJDcVN3Y1pC?=
 =?utf-8?B?dGI1RFpnb2lGRmRoL091NXdGY1g5M3lNVTJERWlGMVVWUHB6MnduWDB6K2lo?=
 =?utf-8?B?QWszNjVHTUhPVTZGek0zWnFObWg4TiswbUhveWkvNnp5WFhYV1BEd3NFY1Ny?=
 =?utf-8?Q?7FGJSt9dCX7Ij?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3lJRlZzOXpjT1dBTndwZHFiaWZjOEM0d3YwZlc0VlZqMzB4MTIxQVNraDRW?=
 =?utf-8?B?L0lreHBJV1RKcVpjK2c5L09XL29IZWtCNFExZitUcHVNeDIzR0kwVGIxZFcx?=
 =?utf-8?B?dzBCV3NGaGZEYWtTVW5xUEU0WjJFK05Db1ZCa0NMWm9YZ2p4OVVkcTZib05I?=
 =?utf-8?B?YU44eFRia05ZeXlHMjh1WUNDNFozYU1wanNQYy9SK2pxOWx4bkY4UTdxYUlN?=
 =?utf-8?B?QzlGOE9QbUNldXRTK21DZnViQkpZY1ZLcWRzMnV3S2ZVc2NTOEhCUXBaTlM1?=
 =?utf-8?B?NnE0T0F5VzJqdHdhUVNSalNyTXlDMks0NEo5ZFNsVlgvQWVTaXc4TjhMdDBY?=
 =?utf-8?B?bTNEeFBBblI1RWEvcWhSZDQvSVYxNWVTOWlMSmVMM0Z3S0FwVDg3NVc1NGlZ?=
 =?utf-8?B?cDJYK1FKMlo5emlxNlJMUS9aNHBqWjVFOENWNFRhVC9jNjZOWlVGNG5WenE2?=
 =?utf-8?B?K01HalVJSitSUEtQSFpzcVB4MVlPNVBkMHVvQ2NhNnZsMWZhN0tFbFMySmdj?=
 =?utf-8?B?UndUdWpZTStBZFZRRmNTeUsvQU9OeXNuK1huOXZmak5SZG9Qc1RLcG84MlRU?=
 =?utf-8?B?YlJnTktxSmlIMTZVdW5DSFhBMTVFUVMwTVFoY1IycGV3TEpsaitjSzYxUkZ5?=
 =?utf-8?B?Tk04RlVzSC9pNWphVVZHZ2RlOFhuQk5tcWlLZ2ZVWmdCRTJxRzVzeEVYNUVG?=
 =?utf-8?B?SkxTWmZiNVU2QytPbXFZZ2tqZzIrOC8wUm1ZNWFiYlYrOVVYeGpIdFdqTGFp?=
 =?utf-8?B?Tm9yQzEwMVhtSEU0UDVQOVk1RnJoaHBmUGZ0dC9IeFNzTTRHbkxCVHlEUkhw?=
 =?utf-8?B?VnJLclIva2dVRDFBYUFHYU56Y0xkK1BmRGc3bTE3TUJoSHpXK1Fqdldyc1dO?=
 =?utf-8?B?a3pCaE1VdHZCUzBMckxBc2NnU00vMm5UcnR3cWJpM3U3QUhUV1o5cTJSRXp3?=
 =?utf-8?B?VHEyWjNwNmRkMmNMcUQ3TjRicmlLVEJ6SXphVDVmMzhKNXZtZ0lxK0t0bklm?=
 =?utf-8?B?aFZ3dWhQckYvNVBzRlArYUNOclFqTHZYaytCWmtGNFZUYWh5SlVrc0VJcE13?=
 =?utf-8?B?aHlxU2ZPT2k2M1lCcUpGSGltanFqa2ZqNkcwRURUL3RPZmxUMWdJa2tCNEpE?=
 =?utf-8?B?cHJPYStESEZtZDhQVnVVQ1kyS3NnRkVkb2RtSkJhZkZEN2hSa2FnZFo5NGJL?=
 =?utf-8?B?VHdRb0xkbjR2SG9qRzVKajg5YSt5SHNUUVMrcmhxY0VSeGpOTUNPYURMb0pJ?=
 =?utf-8?B?MmNnTkpwTjZOWUlwQ3RUUE9TTWZOc0dyMkNua2w4OW4xTFNlekwwUk9DWVMy?=
 =?utf-8?B?emRzV083MjlLR3ZKQ0Y3TXE2TDc5NzRNbmpnL2UyMEtYakRLR2JQWGFNVyt1?=
 =?utf-8?B?cEQzajl4Q0YvK2l1RDIra2hRVWhWZ0txVTlDMUxTUE5xNjBJZVpkakZvRm9l?=
 =?utf-8?B?bEJPVFBSRy9ZekhPZ1pDUTdXVWkrcUNVdFpEakhGWVJSWmNiaHFFdy9kMVhF?=
 =?utf-8?B?MEJTYjNBcURDK29Xajg0VmtEdExpWnZLRjBBNU0rOGdwWkVSamRmc0NaY2hM?=
 =?utf-8?B?QjMyeUxNdENMc1JEbVpGdXB4QUNaZmMwR3lLRUxzQU1IbEFuM1M5djBPSGgw?=
 =?utf-8?B?d2FleVVFRDBkVk5QaC9xdm1MWVBpQ0dQVytTY0diWGVZSVJqeVpGN2h6RHBT?=
 =?utf-8?B?TjVzTEFQNGVtMys0YlE4WmFqRDNveVlHQW9zakZHVVVxSlltMmdoQjRhVldP?=
 =?utf-8?B?VFVyL2hlb0VFSmJLV21JYjdueCtObFRIT09aRGFEMnBodWRIbG1UMkN4M1Ra?=
 =?utf-8?B?VXRNck0wbDRkeHlyNE1xdC91NjZhMjUxcW1NNnZ4eENOdTluTW5QVDBVbmhy?=
 =?utf-8?B?YnpiMjF0NTVmWTVXS09JOWlLR1B3QXRTbHlCZkYwUktyRlY3cFp0T3RMOXZs?=
 =?utf-8?B?dFJORE5lZVlkUHlPWlRCR08xc0xjbnBuWkg3UWpCbUFZaVVMUlV3bnVwODI5?=
 =?utf-8?B?c0lockJYemwvSnNhaE1BeEs1L280bGhyREVlZ2xNTFhTdUVlRkVoeEhUUmVp?=
 =?utf-8?B?aitkcEIxNTA3TDUvYURJckxyZkVTeHBzZW9meUlmZkE1V09QRitzUTM0ZXFK?=
 =?utf-8?Q?fA4eiM6vGQQkL33ml7Qb/17Zq?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51569954-23f0-4f87-a47a-08dd3fb3f1c7
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 15:53:44.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fepqQ4zJl+kevdCQp3Ifb4BLSUOczJCTUYZ28+/CMB5HHB2d/z2RZr/OIpQnMRZm7dTtyDOBx+eNqQeSUf1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB5779
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

I missed a few CCs, looping them in now. Apologies for the extra noise.

thanks,
kienan

On 1/27/25 1:47 PM, Kienan Stewart wrote:
> In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> artifacts required for building out-of-tree kernel modules had
> $(objtree) prepended to them to prepare for building in other
> directories.
> 
> When building external modules for powerpc,
> arch/powerpc/lib/crtsavres.o is required for certain
> configurations. This artifact is missing the prepended $(objtree).
> 
> External modules may work around this omission for v6.13 by setting MO=$KDIR.
> 
> Signed-off-by: Kienan Stewart <kstewart@efficios.com>
> ---
>   arch/powerpc/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d36155cc61ab4460c7 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>   # There is a corresponding test in arch/powerpc/lib/Makefile
>   KBUILD_LDFLAGS_MODULE += --save-restore-funcs
>   else
> -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> +KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>   endif
>   
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
> 
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83
> 
> Best regards,


