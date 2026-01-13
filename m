Return-Path: <linuxppc-dev+bounces-15663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2698D1B230
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:05:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drKwl5dyQz2xWP;
	Wed, 14 Jan 2026 07:05:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.17 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768334711;
	cv=pass; b=MG1WT+5aVevrmFV72yFKrDlnhMSMBYupPgNzxIQWXL10yfhTahbGgekbSBoWkiAMNLX/ppugkAKmRjczVq9OITE0WPE35UwMToqK7MoV4GZMKkm6erd6zN7kD3edBRepuXYFGrm6FFFfl0ggdToJSSEhLRoTJ/W9oAYr+PRCFDvtfVpE9b10VwgoKVs693JY5mlx5PwxHk2tmI6BUHXfOQGDFZzLA4d7LnpQHCLKwDxNp6wEY27uZpNTQS3GL56uDLMx0YoBMPsbLoGG0Bg6i9p2CsKZ4w8TVA7imRX8XRIYlHij8a/0TfpNeZZywvwOSmKU94mIHcIMfq/DTc48Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768334711; c=relaxed/relaxed;
	bh=yGOhj3PQ3wDem02v+a5lxa0pQr9j2IipeoIhKvVgP9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8I27j4CYCkm7PMCynOV2Qt5u9YKGL2c25BI5qpgvQPEac8kAZiYsTmNKXfm2nHh+79jqXVtfmErz+UUAIrcQbmxgVdE8JkrLyCnurY2kcj8ilG13khgx7tTbUwYe07bx6Hkn6ThTguig++samqWrT0Cvff4TrcIyeE48CV/U0ZcF4NN+fMWeun1aTuEQeE0R6ReYsP0WEL/Jlc3eqw/pkSqx1dEtTI/Fs9NziZ5mhe3AoN3JL7Mtc1u7ZE/pMSxFVazCAoB4n/7JdkaGrmz8rgKuEtbmffbRWLJuXA0uvmbeZjcCJF9FEq4G37/0qDk+hIO+scBKqcG6//6rvz5MQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M7wu4zi5; dkim-atps=neutral; spf=pass (client-ip=40.93.196.17; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M7wu4zi5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.17; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drKwk2f0rz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:05:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlPAKaFnLtwDL2u+sEtbSawRRD76ccZcYB7fXIjr9tcW8JHKxrLJxthydr3wkTr1zSRAMDVvuWhASzvkHvUD3SrDAMlhNXCDzHdYvWo9yb93Ivk0H+eVYO8mfk8ISPt4uSPlm6wYBl6u9sONSlKsWuaR4+2ibygurqgVBv/1Y4HKRYASi44reCD1B9nxbceiFD9Q0mcGb2qVdsjBW7J+2ubwnthHSOlVVYOIuvVLZY11UWJ+hI+H3hnLfVO2S0A/92/MjkvvFwdqWS6IRQDwAtFyTvLVXGjSYRACL3FePfVq0IlDVPETn242CVeIFydCpQoFSLNj4yxhe7G9/Hzs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGOhj3PQ3wDem02v+a5lxa0pQr9j2IipeoIhKvVgP9c=;
 b=vMFfRuPgkkqNuUX+adT6lSJamYdDh0bymbmnYpnCal6USvnFtxuWRgKYueQXA1o7S16NocU8V5YwCAJ7tKzI1X0vrQ94tLEKa6tFNF4LutOLPdIIRYBMu1sh6hwSQw5gUzDBHJGPNkZT6eLd2OutRwGzmzz2oYVjzbqDBbswBXSQAZQzDpqGjaO7vZPaVzF/Ap05w3ikYkVYWKo6+XklPtj0d5QrT7ncCXUVzw0+I+nbhYk7UJNYe0Dq+wbsxOTsLVMwRbI3wMyJdcBaf47kNu+i7IyoIvdW5Mj4DVS13xskxagXcyUUx7D1irp8MtolNsui/3JSrMCaVu4+IGZ5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGOhj3PQ3wDem02v+a5lxa0pQr9j2IipeoIhKvVgP9c=;
 b=M7wu4zi50h0Sw0pD5tl7N5hykFh3Z+kXi6vWnXrNzcI44bFO/EINbbWbEQQukTeoOLodh+6J9FqmZ/cbmtQ+fMhFdahw5hHGi1fTG40P24Yi410Mt7HJf7pa/PlBO2TyrkAiXxpQjGBUElDBqYIRywjiznFbKePm5sr1v61yP/RnOhULwf/c0Gy/i3NNRnLbWDJ59HlJFpz8xerUQj//eApBvkiI22UlYlso2gENG9L7gd5U3KVUKkZbHdVDfxs+PbJw8yzJ/EjCcmplG6TjDhw4ANEMy0JfsWMFTcMGrXL300s8f7eWb51CmT/0mJdJM5sl6+wCh9L3cY0QJ+iEkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 20:04:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 20:04:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Date: Tue, 13 Jan 2026 15:04:18 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
In-Reply-To: <20260107091823.68974-12-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: ed79eb82-60af-4bb1-38ed-08de52def55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTdNZjlVMUM1ZmluZ0RXS1FGaDJHZTZ5RFFsOGpXUTI3OEZjVUVtakQxK0k5?=
 =?utf-8?B?OFVUQ3V3SEI0eHQ0SEhvVlBJcUJvckhRWHpITWxxL2Q2ZnBuMnArVkxaVk9S?=
 =?utf-8?B?VVNRMlJBTGdhZ2NhbnRpclBGa3ZtTjI3VWJKaEhnQUprOGJZMlZoTjlqTGxt?=
 =?utf-8?B?WUxaY3hiOGo3TWw4WDZIbWFiZkQyOE9vNjdaaVR5MDVKem5SSzY2WnduNVJO?=
 =?utf-8?B?RmUxTmh1Q20wb1VnZWtlRDFOMS9IczZLTG9WSXcxL2ZJcUIwVzlQeWdWWW5U?=
 =?utf-8?B?V0h6UCt4a3FMZ3ZtSzRNVE5sOWhMck1sYnh6K2NnZjhrNjA2RzNSbVg2WE1G?=
 =?utf-8?B?anlGYjNZbDl4b0ZSZmZMcHZTRGF3RzhUaTJQc3JMdnBLYXptQkVZb3ZXYThy?=
 =?utf-8?B?dHVGSGlwdEtVdGxsWFZBVnRiamN4ZE0weFArU3I3UWFzRjcrZkRVZVJ4YjBM?=
 =?utf-8?B?dmJkYzN6N3BjaXBMUDFDbStlT21PelFpVVRHb3VrZGFhYUpQYmVUUGM3VjAy?=
 =?utf-8?B?cS9xLzNvQkpLNmJDNnRrRHVLSUUvQlFCemtwWjVtaDd5eHF1aENjWmluS3hu?=
 =?utf-8?B?ajF6dU85bUxHbjNaWXRCV3hrQ2ZSV0I0R3dJdXdTNVNNQkRWREFvRE5oUE81?=
 =?utf-8?B?cERHN0VLTit5N3k5U01RMU1TWmtSUlF2NGhvblJFdXI5Z3VKdi9jUEgxYWEy?=
 =?utf-8?B?ZW9tdE5HVVlBbU1YWVJ2LzFpTDNHTzJTTHMxYUxPRUs0NWVDK05oYnhqcXRr?=
 =?utf-8?B?amx2dmZaOG5JUkpwd1ZUV0RIYjF4c2w4TUZEWVpOZDk1Z1VSakkvMzVkaXdq?=
 =?utf-8?B?UHlZRWkwNlpZTzhZN1ArVnljRGpuTDI4UnJ6T05vM1E5alVWakZMN0QxR3Z1?=
 =?utf-8?B?bWxzL2xHMEQ0MzFibS9tWWhlODBpM3JMSjBxRE5KdUppVnQ2RXpPRldVMmRt?=
 =?utf-8?B?SVdzTDdORDRITllZZ1dIcmlrWEJkZGdTQ0JNNTFQZnQwY2pVWGVjMWZPdDJj?=
 =?utf-8?B?TmFPM0orR1NXeWF2K3NoZjU0ZDYyL0ZJc1RrWXVvcnR1bW05R29tM0ZPbGFm?=
 =?utf-8?B?Y3l4K2xTVkFmMlM5NUhFeTkxNFgvUU9rbTlqUjBtWXVUdVBPSlp4enFyd0s2?=
 =?utf-8?B?MmI5elBFUGtyMkZpb3VTeHlMcW5iUnJrbmh0YWd4WXpkVXRnOHdyNGYrV0dh?=
 =?utf-8?B?RVBFSHV2b28yRkg0by9ucDJRLzZXNUU2Tnh4cUNCTzNWZnVqenFjTTdacUFV?=
 =?utf-8?B?VzVuOFZUVTlsR1NNMmkvVDJHeEd3czRZRjkyWTFreVZzTmVJV3ZJdHg2d0pp?=
 =?utf-8?B?eWVwTUpBWkxSOGNYWmFsb0ZSR3dCWlY1R25VQ01DelRzUzdUUVVNdDYvd285?=
 =?utf-8?B?cCtKRjJ3ZjE5Z2FIRmsvYllhaHlBaVlHQ1Bmb1VrUVlwclFuYjdlZzB5YUt4?=
 =?utf-8?B?WXBIczQxWktJZlppK0YzYTJCbzBhWkZOYWcvYVdKNSt3SkRpVEVuODd6N2ls?=
 =?utf-8?B?aEdSbC9qUDYra2lOZ2xvSW8ra3Q2RnB3MWxTQ3B2WHZJeXNiNVJCT2pYOE11?=
 =?utf-8?B?YU5RTkRyTFl3U3VmVEY5UmE1UEIrckEzZnNyc0QxTmpZTDBiR2c3OFhHY0Iz?=
 =?utf-8?B?cm4xNU9QVCtsbXRsVlk2bUYrQTVGbW5vRXVNNjI4WnBrbGtoQjdmbGM4ditI?=
 =?utf-8?B?Y3hIc0RNbjhHaFB5bGJaWWEwMEwwelF1RndBeGZ3a1g1N0d1cTc2cDZPQ3hH?=
 =?utf-8?B?UGpGK092VzJQZ3lla21oeWkrbG4vY2QxOEt6anlYWmIrcXZYZDVRZEV4WlBP?=
 =?utf-8?B?V3hza2RIUnNEZllCTUhjUkM1Rjc1cGxhYjBXaG1lMDNiR0hndXArWFlPeHVq?=
 =?utf-8?B?eERmczNJM2ZEekgzU00zNzJxRVJmYzZUdVdvN0k2OG1HOHJLWVZqSURvUXho?=
 =?utf-8?Q?CgbTmWVd4I8nEIVkMy88L6TbDCLDGoQm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FsUElKdllRRTd1S0l3SGVnTGJPWEM4OWtldmJUVWt1a08wZTczTDlsUm40?=
 =?utf-8?B?anIwaXNWRzREdzZKRi80bGJSbUd0dHhxbENQUksrSFVHb0xZN0ZtZ3l2bjJj?=
 =?utf-8?B?SjQ5K0xvV1MrMW1OUlBLRWhkUVpKQVdQNlZFeWY3Nm9lU2dTMFE1dHd6MzJ2?=
 =?utf-8?B?alNRVUxFckhhZnlOYzFqOW9zdk9PSHVjQU9oUnY0UU5DNzdvSDVYSXJ3SzlE?=
 =?utf-8?B?R0Q5V2JPbnJ1aVBFbC9XSUJBTDY5ZmY1NkxIRlFOYWNaZHNLaWp6ZkhtOUJW?=
 =?utf-8?B?WGdmL0ZoajlrcVY3djd2YkU2ekVqYkJ4c3RxZGEvdDkxSzcwQ2d1cGhzM1lw?=
 =?utf-8?B?WTN1ajQxb282dlM5aHlFSS9yMHJGVVlhVVRnZ1JXK2trTmZXclR2YTMzVG1Z?=
 =?utf-8?B?bzlTbTc5SFRkK0VlUWdvOG9ndTVjT3M5blBLT0tUM01FMm4zbElhZlhnNGFE?=
 =?utf-8?B?R3IxNm1hcFdXTlZVSVVFUWU2Ym9tajNtaVYxZDRYRUQvNloycHNDMU83NDFX?=
 =?utf-8?B?ZkxTZVpHMmdJOWxXZHJLQU9QZjBUM05kdjhTaktVWlpXeVo3MHRiTk1vSHVm?=
 =?utf-8?B?RENLR3R0cXRiS0c2UGpocnlBNDRFNTZVWThBMUxuNHZwTTNYald3di9MUSt1?=
 =?utf-8?B?V1h0SFBGSU1mZkJoY0p5a0xrZCtlY2lKT0pzZmRuY3QwZjMxZWZhNlNTWXBi?=
 =?utf-8?B?NS9zSkxvMldUcVNGaXNCTkpyUTVCaGVZNmtLamlSRTBNZ1g0NlgrZjNMZmFi?=
 =?utf-8?B?R2VBMFV1UGpnUDJLNnJjZy9wa2xkRVF1aHlhOHVxWkMvTzAvWXNrR1RTQTRl?=
 =?utf-8?B?UWZ5Sm4xa1dKa2Q5N2RIZ1pxdEE5dlE4V3h1NldPdFJZM1Z6Tk1TMmJOLzJD?=
 =?utf-8?B?M2RxUTN3TEpoWkY1M0JPVVZrT3d0WFNFNXlBNUJPclZzcW9GeWFxdENuUHRS?=
 =?utf-8?B?L09lZWIzYTVnU0VjTVpabU1VZDFaMVNMY2piTDAxMmxGWm9RTkZKWnR0WEgx?=
 =?utf-8?B?N214R2xjeVBJaWRsb2hvVEVGTDBFdUFTamY0RmFHdTdGSjVmSFdnZUdXY3RV?=
 =?utf-8?B?UkRhNDM4UkJocGxodk9FeSs2NEJmK1QwWUl1UzJUVTJPbTdnYll3SnFGN3hX?=
 =?utf-8?B?bmY1cWVQZzlJeDM3UmhhYVo1MSthTE1qc3A0MU5kdndLa1ZUWWk0T1c0ODQz?=
 =?utf-8?B?TVRjTkw5Wk1rRXlNQXl0Qlp1WFlhd292K0h5YndSQmpyNWRhQUZ1RWdOMVh1?=
 =?utf-8?B?bk55QytXYVhBSmFjbTBKakZqQUt1R28xd2h5MVZTUnJydHFQcGtkeU5tT1dp?=
 =?utf-8?B?MVpsaThFazdmdU9PUWw1TUErS0pETHBBYkM5OVdnM3NvbjVoWnlGUmk1M05v?=
 =?utf-8?B?ZU5NbnVhREhoRnhnR0VjWFgzTnZTTFQvbzJSUmErUWEzY202N1VuMXBhbHFX?=
 =?utf-8?B?QklRQjRzajU3T2lWdDFXNGpzTnVWd2I2QU9zaW1uY0p4Z0hjUXdYQ3RlVlFq?=
 =?utf-8?B?YWNLaGUwMXBWLzFSTjBRcUoxa2JueHRWR2pBOWZOTU1hcElMWXJjYXVXdFUz?=
 =?utf-8?B?RWlzWEpWUTlKSVZGTlk0ZEZzYlRtZ0drYU81aHF3ZlA2ZlBhUW5tMGRkM1Vs?=
 =?utf-8?B?a1RObGo2VlhlczhLZXpmdCtodm9BSmcvQ2NCaXdqd0dvQ3d4KzhZeXdTV0ZW?=
 =?utf-8?B?bDhBYzI1Y2J1U0VQam9ManpXdzhIVlNhUVU4YnhaY3NrOHY4M09jRUhuelVQ?=
 =?utf-8?B?UXRvRjRqWTFzQkZxd2gvc05uODZ5bHhETWNVNnB0eHZoQXAzdjVwSnBobFhY?=
 =?utf-8?B?UjY1VENKRDZab1JuNHBubDdPNzhoNVJESGlEMkZ3M3BUQ2ZMUm42ZGF0ZlNI?=
 =?utf-8?B?NGoyc1h0MVRIYXRudnB5ZUVSVzBTbDhGZ28reHpqbTZVaVJDZG5xL2g2OGlH?=
 =?utf-8?B?UklLc1VkN3dlM0JyYjQ4Tm5ObXMzTHJpVVQ4L3VOQ3VpSnFCNDYyL1psTlRE?=
 =?utf-8?B?MXlhYXFReTBnN2JBdjY2TXpoZ2t1K2lxMFZaV2VEZEQwSmovQjhvTTBTWStj?=
 =?utf-8?B?RXVTL3pTbE1PMzFuVHhzVmM3emVScFROT215cUVMSGc5aGNkQjJWNnVRNncx?=
 =?utf-8?B?eFNYTHYwdFcwRk9pcW5MMUdaYjZySitieElqaEE1NEQ5S2tvdXZ4MEY2WlNZ?=
 =?utf-8?B?YmZzMVNtWGNCa1JkdERtN1lFMGFzKzdGQWlMQ2Jyd0ZiN2tEalpERFErWkVV?=
 =?utf-8?B?ZmhSbHdjdStKYmp4bjdxNFZGZ1VEQnN1T2F6ZXlLdFZIb1duelJxc3E5YjJC?=
 =?utf-8?B?NE9UNzJZQklyYzNUNHJnZ0hRaHI5d3V6V2Q5ZHRwOVdvemVGQlBBdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed79eb82-60af-4bb1-38ed-08de52def55d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:04:28.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzSboNEHvdg/7LYKgk16WjV3R07nDrnk2PYlaGi83SuDabolP+rVMLBSBdeZmp5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 7 Jan 2026, at 4:18, Jordan Niethe wrote:

> Currently when creating these device private struct pages, the first
> step is to use request_free_mem_region() to get a range of physical
> address space large enough to represent the devices memory. This
> allocated physical address range is then remapped as device private
> memory using memremap_pages().
>
> Needing allocation of physical address space has some problems:
>
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. Th=
is
>      has been observed to prevent device private from being initialized.
>
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64 meaning the feature does not work there.
>
> Instead of using the physical address space, introduce a device private
> address space and allocate devices regions from there to represent the
> device private pages.
>
> Introduce a new interface memremap_device_private_pagemap() that
> allocates a requested amount of device private address space and creates
> the necessary device private pages.
>
> To support this new interface, struct dev_pagemap needs some changes:
>
>   - Add a new dev_pagemap::nr_pages field as an input parameter.
>   - Add a new dev_pagemap::pages array to store the device
>     private pages.
>
> When using memremap_device_private_pagemap(), rather then passing in
> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
> private range that is reserved is returned in dev_pagemap::range.
>
> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
> MEMORY_DEVICE_PRIVATE.
>
> Represent this device private address space using a new
> device_private_pgmap_tree maple tree. This tree maps a given device
> private address to a struct dev_pagemap, where a specific device private
> page may then be looked up in that dev_pagemap::pages array.
>
> Device private address space can be reclaimed and the assoicated device
> private pages freed using the corresponding new
> memunmap_device_private_pagemap() interface.
>
> Because the device private pages now live outside the physical address
> space, they no longer have a normal PFN. This means that page_to_pfn(),
> et al. are no longer meaningful.
>
> Introduce helpers:
>
>   - device_private_page_to_offset()
>   - device_private_folio_to_offset()
>
> to take a given device private page / folio and return its offset within
> the device private address space.
>
> Update the places where we previously converted a device private page to
> a PFN to use these new helpers. When we encounter a device private
> offset, instead of looking up its page within the pagemap use
> device_private_offset_to_page() instead.
>
> Update the existing users:
>
>  - lib/test_hmm.c
>  - ppc ultravisor
>  - drm/amd/amdkfd
>  - gpu/drm/xe
>  - gpu/drm/nouveau
>
> to use the new memremap_device_private_pagemap() interface.
>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> NOTE: The updates to the existing drivers have only been compile tested.
> I'll need some help in testing these drivers.
>
> v1:
> - Include NUMA node paramater for memremap_device_private_pagemap()
> - Add devm_memremap_device_private_pagemap() and friends
> - Update existing users of memremap_pages():
>     - ppc ultravisor
>     - drm/amd/amdkfd
>     - gpu/drm/xe
>     - gpu/drm/nouveau
> - Update for HMM huge page support
> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>
> v2:
> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(=
struct range, ranges);
> ---
>  Documentation/mm/hmm.rst                 |  11 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>  drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>  include/linux/hmm.h                      |   3 +
>  include/linux/leafops.h                  |  16 +-
>  include/linux/memremap.h                 |  64 +++++++-
>  include/linux/migrate.h                  |   6 +-
>  include/linux/mm.h                       |   2 +
>  include/linux/rmap.h                     |   5 +-
>  include/linux/swapops.h                  |  10 +-
>  lib/test_hmm.c                           |  69 ++++----
>  mm/debug.c                               |   9 +-
>  mm/memremap.c                            | 193 ++++++++++++++++++-----
>  mm/mm_init.c                             |   8 +-
>  mm/page_vma_mapped.c                     |  19 ++-
>  mm/rmap.c                                |  43 +++--
>  mm/util.c                                |   5 +-
>  19 files changed, 391 insertions(+), 199 deletions(-)
>
<snip>

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e65329e1969f..b36599ab41ba 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc=
_flags_t mdf)
>   */
>  static inline unsigned long folio_pfn(const struct folio *folio)
>  {
> +	VM_BUG_ON(folio_is_device_private(folio));

Please use VM_WARN_ON instead.

> +
>  	return page_to_pfn(&folio->page);
>  }
>
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 57c63b6a8f65..c1561a92864f 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigne=
d long pfn)
>  static inline unsigned long folio_page_vma_walk_pfn(const struct folio *=
folio)
>  {
>  	if (folio_is_device_private(folio))
> -		return page_vma_walk_pfn(folio_pfn(folio)) |
> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>  		       PVMW_PFN_DEVICE_PRIVATE;
>
>  	return page_vma_walk_pfn(folio_pfn(folio));
> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(c=
onst struct folio *folio)
>
>  static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_=
pfn)
>  {
> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> +
>  	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>  }

<snip>

> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 96c525785d78..141fe5abd33f 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw=
, pmd_t *pmdvalp,
>  static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long p=
te_nr)
>  {
>  	unsigned long pfn;
> +	bool device_private =3D false;
>  	pte_t ptent =3D ptep_get(pvmw->pte);
>
>  	if (pvmw->flags & PVMW_MIGRATION) {
> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pv=
mw, unsigned long pte_nr)
>  		if (!softleaf_is_migration(entry))
>  			return false;
>
> +		if (softleaf_is_migration_device_private(entry))
> +			device_private =3D true;
> +
>  		pfn =3D softleaf_to_pfn(entry);
>  	} else if (pte_present(ptent)) {
>  		pfn =3D pte_pfn(ptent);
> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *p=
vmw, unsigned long pte_nr)
>  			return false;
>
>  		pfn =3D softleaf_to_pfn(entry);
> +
> +		if (softleaf_is_device_private(entry))
> +			device_private =3D true;
>  	}
>
> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> +		return false;
> +
>  	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>  		return false;
>  	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *p=
vmw, unsigned long pte_nr)
>  }
>
>  /* Returns true if the two ranges overlap.  Careful to not overflow. */
> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pv=
mw)
> +static bool check_pmd(unsigned long pfn, bool device_private, struct pag=
e_vma_mapped_walk *pvmw)
>  {
> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> +		return false;
> +
>  	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>  		return false;
>  	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk=
 *pvmw)
>
>  				if (!softleaf_is_migration(entry) ||
>  				    !check_pmd(softleaf_to_pfn(entry),
> +					       softleaf_is_device_private(entry) ||
> +					       softleaf_is_migration_device_private(entry),
>  					       pvmw))
>  					return not_found(pvmw);
>  				return true;
> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk=
 *pvmw)
>  			if (likely(pmd_trans_huge(pmde))) {
>  				if (pvmw->flags & PVMW_MIGRATION)
>  					return not_found(pvmw);
> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>  					return not_found(pvmw);
>  				return true;
>  			}

It seems to me that you can add a new flag like =E2=80=9Cbool is_device_pri=
vate=E2=80=9D to
indicate whether pfn is a device private index instead of pfn without
manipulating pvmw->pfn itself.

Best Regards,
Yan, Zi

