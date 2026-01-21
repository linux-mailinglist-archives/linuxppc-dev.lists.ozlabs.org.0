Return-Path: <linuxppc-dev+bounces-16087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOaTBv88cGmgXAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 03:42:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921F4FF54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 03:42:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwpPQ36TPz2yFg;
	Wed, 21 Jan 2026 13:42:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768963322;
	cv=pass; b=il7lo0sPZmTlrZVpfE25rE72HOk2JPOpwsr23ICVwxR98VXFQoH8Va6fS8MOiifql+rO7yakPhwVyrmNjyVSHFDJvziQCTjKdsLRekYKVL3QRWDF/5VOvLs4+lKntbaxvWcywIzUky1vlARD31nnQGaycXl0TxvcBiVPj4kmDlaXsHi1blKPqC7BGUl4oOmGAK3N2UcpEESFHecNg94WBGqFvyvd7WzBUna+bhA5H8kiqiJ2GXm3udUZwbfLqFF3EjP3YCIax9flRSWEpeE65S+G5PCTc+DG+jy0JZ+NdkfJBxPBw46AZlrr0aunzhD3yehS1H7kk/yWvaid03IjlA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768963322; c=relaxed/relaxed;
	bh=+GwwR18OS1+4ZPR6i9SW7Q0SG4ujDVNzWChuPawKPBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d0D6QvIhz/bkF3SOM+Fsc8n5ey0KDNhns1JQpUrJxjYZeThGQSfwYBdTmiUlZk2RapRDoYnrfTeDE/6cBj48kyPU5oFhXUdwL/G1OSUT4KkYTTg+qKpdc23AXwGXB/hK/UKhBGFfQ8tmJvWl7y/CM+1jmRRYBP0XC9SM1cZNnOZRbeeRiIVZpGDf/wA23nWLMXJwRHAYe/JSBmuDgYx3SrrfPKtzx1131n84WLko4ZUDV/Rle/FTHVGvj+Z6MaDC06gfd+66fIZGB+PuU5R5BjuTnfR7BU2LPfd4E7wWdbfb1KltABofzm/4B7SsnV6LiNiZFYizerPoOnFc1sh4Qg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cstmkwo5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cstmkwo5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwpPN14yvz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 13:41:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIFJVYOtbJZTcgJT/ProB1Fi9+H2fP2I0K3LFfAqLJFCGvtyweNACNbMo8pfGjzyuwSa7gTnFPIU3QtgXUdEb/S7bBNY+pS3TU4z9cBTqkAg0GDGJmpR2vXvEmX7JCBrSx1SLJVQxkVudAYqFCwqGlBXn6bnVRFrGdoOrSGXwr+77v2PwyMsvUAjETpPB/0kU6CtBqch658Nfq3JpiSO1CUUnJD34T95YmlnvV9C09ED8WEHVtpiVpXhJxegKcO03zSzPAZInbeGOD1b0q8+hZVY8TBMuUz8qnfJobMos8yBJN5vep8Mi3tU0GjI6dblCtzx8OPDi1E1vi62p0/10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GwwR18OS1+4ZPR6i9SW7Q0SG4ujDVNzWChuPawKPBk=;
 b=Gp02TVrPsgYVjkEfKxK6P2thtPkFAinK48CZ08aVfggRvQb6uJBPNnRhpny9OURjCmB8qatwF8R0phMEmkeXOf3RFIoFDpye1JA5rhCfyn3CdVR0YfGanSuXjxthKahfv6HN1RKvHdO3TFEB3bdb28PbXZeU2qnf3LRTDWJ0KOBaOn8Y3zJskW2Rk3dCI9elYXG7NIJUUdpyHqxH+Ax/vbB/0MYvujR5yY2f9wVs+02RdXvW7gtI182FJQ2rbvt8dJrdfRNDWPRDLqmVlP86QS1Xb83lpaG67WrPJvbiidr8XKL0Z5tsY+rUl0qI8ipgACbWTQ6pLVClzCNp7dbfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GwwR18OS1+4ZPR6i9SW7Q0SG4ujDVNzWChuPawKPBk=;
 b=cstmkwo5p3wL2Uoktz18lVVjWMOox72vDilUBA7q8GGp3XsKFZlXTVJdOrisx9VGkhsExDG6P3ogiD+y8oJggSbWLoxlB2nfX32H71Yfim1cw6PPP5DKgi70b/vfl+/PkCXfT7KmJOXYeDML5neTn9O0Gte/wV44YIfj8g8Z68fGThLv/XTckYwZVBrhy2ifw1eN+Uh1XMBj9UsD5Ae2jkEB4qF2e2/Q6pzgOJN5e1yUXXjLD4p/PvI3VT2VcEUgN+eI8J45IgEhRMxSi1tfsyGunfKpTM+hK6mFhykwfVmnrF7Ggs/1bHJCkv6LajymlctRsnGDIbgle+Mn1yeoTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 02:41:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 02:41:31 +0000
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
Date: Tue, 20 Jan 2026 21:41:25 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <C2A9F124-9EA8-4916-AB86-659BD280390D@nvidia.com>
In-Reply-To: <649cc20c-161c-4343-8263-3712a4f6dccb@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
 <649cc20c-161c-4343-8263-3712a4f6dccb@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: e9806105-0d1f-49b9-0232-08de58969599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGlEckRtM3FwRmx6K1kza0JKb00zcHNKODEzUU5WTXpvemljNmZWTkY0d2NY?=
 =?utf-8?B?dDdmcTJhZHkwemNIa3ZRN0xrbWVTM0xKYW9acTE2aDh2NHFoQzlQdjVodDlm?=
 =?utf-8?B?V3N1WTl4ZHh6c1FwTGpUTXV4QUE2cHBOSzZsV2Z4NGFzMHNNYTBSZW1NTlNI?=
 =?utf-8?B?YUROQVlnQnd6YklrMGoybVJYZFkxdXp6KzFBaXBtY1ZYQlFhc1hMNVRLbkh4?=
 =?utf-8?B?aG5LYkxkMDY3bitrd3F2Ym10OVcxQWtQd2RZWW5Uc3ZLa28rZjYxbERmZkky?=
 =?utf-8?B?L1l4MGxVK3Y4QXNIaUZ2TjFtWk4rS2ZrTklSenhGejZEanNDS1JHbFpuYjE4?=
 =?utf-8?B?czFRYThDdXpjd293OFB2aFFYckcvTk5ZT2ozaDFkK3NMeDVqYXVFbU56QzJz?=
 =?utf-8?B?ckJsQVpwVmhNbUk5eHJOZDVwcjNYUHZQTVVwSWNPT3p0VUdmeFlob3l0c0FJ?=
 =?utf-8?B?blFieXFuWWtmU0RhNGUrR05teU9oc3ZvZHg4Q1ZtR1dYbzkvV3FTY0lRbTA4?=
 =?utf-8?B?WkN6a3JQMmxxZnN3WFlTK0tIRUdqNnByOGhwQzhwRUtGNmpZV3FTczZrZnp1?=
 =?utf-8?B?TkJUQ0paZEJLNWViN3RIeTMrUzdjTTZ6dVlsL1owS2VDSU5FNHc4N1FubHpY?=
 =?utf-8?B?UWs3NEFOYU1lTTVXWHVNaVgvNm1rVytFbDNPR1VxT2J6N2g1cDFuNFh6bkFT?=
 =?utf-8?B?aXVXSFYwcjJ3RmY5SG02MTZ1b0tmMjlqZG1OVkQzQnJrcDNpME9tWXBwK2I5?=
 =?utf-8?B?REtqSTdWclRxLzJSSm12enpUR2dtWW5YVjZBbDNJdndKdlk5M0tMS29qaW9h?=
 =?utf-8?B?NzB4cU1TVUsvRnpoUmV1bDFDTjJFMDU1ZllTQ3dZSWZBUUNyMlA0OXpsL1Qw?=
 =?utf-8?B?SXRVQldLR2toQ0FEQnFWWUlMMjBzZ2d0TWFKZ0VlMFZHL3MrWE5zUWovNzJp?=
 =?utf-8?B?TElwM3dKbWQ3OEs3OHZnN1doTkQ1b0xrOFNIRUZFdXpCdWNiM3ZnZmhidTEw?=
 =?utf-8?B?WjA4ZUgrSjZvM0dpaXV3MDREaXRndDhPK2VhVEpNTGdUTjlZNWNiR0N2dHlD?=
 =?utf-8?B?UWFIZlk4OTVST3lBOWJnZFA4N0xWUUVxWTkxVENlYS91NnBUT1NVZ2RYTDNR?=
 =?utf-8?B?eU1YWEFYVG5Sa3g3eTQwN0pmYTBaTmlWN3VwMW55QXh0L1d0a0NrVkNBK0Vr?=
 =?utf-8?B?UDVkMzljMGZFWHFMckU2RndyVTdzWkUzMXhLZlJ1a0krVlFhdnVnQXlFWXRj?=
 =?utf-8?B?SDdSMWlyWGppbFFPZEx3TlFkU2lBb1ptd3BNZnlvbmpKRTZYR256NzRlRmpr?=
 =?utf-8?B?b09hVGRicys4a09EQnVHSUxFQXRpdGc2S2lWSFFaY3JiN0lvNmhHOXVGZm11?=
 =?utf-8?B?d3FNckU5YjV2ODFaOFlMM1d0eTBncS9QTldKSzVXSkdVT3lQNzZocFQ2SThC?=
 =?utf-8?B?dW5tekprQ0pKeGpFeXBoV2Frd2NQaTcweW9yeDNnc3QzQ3lONnUzQ3JuZStt?=
 =?utf-8?B?c0ZSZGU4Q0RUL012OWpaOUZQdXNtdkRZdlNrbCs4VkR5NWxIRTJVN0VNUXVh?=
 =?utf-8?B?WDM2VTdCTjg1TWpQcS9mZ1pKNUVVOU9EOHhlam14UFZxVmtYb0J1cDdVSFBF?=
 =?utf-8?B?ckk1eGtOK05HOU9ZNGlQNkwveWwxMlpoTTN5WitjdndyekpISTh1VDNWVkJG?=
 =?utf-8?B?bHN1QWQwWUxUb0VkVWszeU9JNExnUnhNeU9qSnVlU09KQkM5b1laS2FmbW04?=
 =?utf-8?B?RCtDZUFMZ09YUHBNaklDZ2YrY2I2OHR0NnBYMGpWYXRYOGFLZFhPQXQ2cXg3?=
 =?utf-8?B?QnhBQ1RmYmpTcXR2VzRKTW9ma0xuK0E3Z3ZEbDkyM1dHOHZPNkgra2xpTG5i?=
 =?utf-8?B?MW4rVHZ1WkcwditqUnlxa0lqUVk3QVhGQzR4TEx0MHo5NXB6amZOc2g0UGtJ?=
 =?utf-8?B?T2hBWC80QU1VSE1OOThseFlmMXh5aWtKeSthSC9BdDdxMDVzTlpkenRYT3R5?=
 =?utf-8?B?ZjdDYU4rQlFsdk9wdkwyT0drcDNqNDBJMDRwTk1tTFZRV3lBL3YrZzAxVDJM?=
 =?utf-8?B?RWh4VmFjK3QvNkdhWDBCZjBJbENMYm9sc0tYTTAwZDFaNjVUeGRXSjJ3YlA5?=
 =?utf-8?Q?qiHw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVFJT3lja3NOTW9IR0pPU3VyalB0WVhBVnFTUGYvNEoxZTZBWkJod3NkV2I4?=
 =?utf-8?B?d2xXQ3luamtEY1o5Y2xxd0RQOElCWWZoTCtaWG9QMUdqNENnbnFSSjBIUlJO?=
 =?utf-8?B?dmd1dklDcWxobjFhM1FYT0V2WlQrNVBZUGJaRExld1dwNTh5cjY2SnBkL0tu?=
 =?utf-8?B?aVRmK3ViYnpGOG02d1JWeUZEWWVSTW55RmdtL0RvWXgrMTdKV1Z6OGhVL2ts?=
 =?utf-8?B?RmhiS2p4YlJ4VjF0WTIxbmlFWmx4K3gweENXbENzbkkrTWdnbkNvUjRUTVFB?=
 =?utf-8?B?QzZUWjNGeHkwQzQzaHpoQ3ZvWXRLbmxZZDJFNGt2VWI3bk5hZ3dsUnJ3a01w?=
 =?utf-8?B?V1RVNmgyN3I2bmUwNHZIejNuM0o5K1oyMHhJeTNRTklscm5zSlc0dlUzNGtK?=
 =?utf-8?B?dUtBbjFIZTMyMXdWTVFHTnJJanFIUnU0RzdvOWsyb3pkRWdESzRQdWl4ZzNo?=
 =?utf-8?B?ZmVTMlpoQzVubjlXQUdhKzZ3V2ZkaVl3ZnpPb1V1V3RyaXVSSU9nc3FMNkRt?=
 =?utf-8?B?MFhWUGlPR1l3N3YwRXRJcVVFZnhucys4djNjY0ZHYXlJU2tqUitEbVBGZGhh?=
 =?utf-8?B?L05ncEpKNm9pSENycng5SGhrUHA0UEsrd2pCb1NCdzV3SUEvSnUxdUV3YmhD?=
 =?utf-8?B?eHBvMW1LN3J1cGN6SjdaVTEvemlndzJFMTBwMVRBMHRQQ3R4Nkl6RVlGWlJl?=
 =?utf-8?B?a2lWU1d5bDMyWUJNd2JhczZqcklMa0hCSXYrc05pUFpLZUhaakE1ZnpFSTBa?=
 =?utf-8?B?a1hDSVZkQ2pTSEJibnk3eVd2WGFCRzEvR1lXNFc3Z0ZJYm5pRFNNNkpzSFZp?=
 =?utf-8?B?MGZiWC9ZZitiVE9idmdMQ3RUWlM3eTlhbUl2Nm1qZmZVSTY4bEJDUUFGMG53?=
 =?utf-8?B?dmVmUDVHQzVFMzJOSzBUZDZ3aWZKZjRtd1oxN08zRW1qQWNmbEk3dG5mMUV5?=
 =?utf-8?B?Q0pqT3U5WjU3aVZ0d3YxNVRYdE1KRDdSMElGbHN3R2ZhSC81SzdOQTdaM0hS?=
 =?utf-8?B?bytXbXh5OVdiT1dGQ3VQSmZma2lub1VpN2FSSS90NEc5K2tlRkdyUkpiSWJW?=
 =?utf-8?B?aWYwZ1hXQkFJSkd5Rm1La2I3bndqL0loeXNpYk8zc0l0ZzZ5SzJkdjdkUitj?=
 =?utf-8?B?ekFtb2xrcGZJM2paWXdGQSs1dWFWUjYwYi9ORHhXWDFsSHFPcnJGV1N3Z1lM?=
 =?utf-8?B?YU1PbWxmTVNWVlZvMVhmR1g4dE1kUktjK0JEY1QrR2ltTEV6dHIrWUNhSU44?=
 =?utf-8?B?SXBOMjVrNzhRV0EvSWtRYkNWOHI4Uy9ydDFkZUQ5WEJwWERVUjk2WGYwNkow?=
 =?utf-8?B?NU1HbTRvVjBha0hoQXh4QUJxWVVqU2Y4QU9IYVNmaWgvTythN1lmVThpamI1?=
 =?utf-8?B?OWJYWGRYMVhYQmk5ZG9UMmN5WS84M2g1NkwwdkpIQTlPZHZjM0FiQVBLaktB?=
 =?utf-8?B?cXBDZzcyai9XTWh6b1RNS0VFRnhRY3dXUHlSN1d3S1E0UzNZZCtxQktGUHY0?=
 =?utf-8?B?RlhUd2VzZlBkRzc5MTlldmVGZ2I2UkJjZ3JKektOOXJQN0swcHFkWnBpQ2tQ?=
 =?utf-8?B?M2VRdmFLK0dKRHFDR2JqYkl3WTZTbHlwOFE2UUxLakJBaXlpR0NMcklGZjYz?=
 =?utf-8?B?OXY4UlRNakQyK1c1UnpTVkRnK0h5U3NLU2xUUzRQWGN4cEl1WTJrVFhXSkVP?=
 =?utf-8?B?WjhreUFDNnA2MGI5eUMvMkVLOFhxdE9iNWtaNGRtcUUxYzA1cXNsalppOWMw?=
 =?utf-8?B?c0ZkQ05UdzZjbDNSTkgyTHpaVTVsMUJ4OEhJQ0JoS2g3V2IyS25wNFVSaWZG?=
 =?utf-8?B?TXZDeFlOdkw1VjBiVUdpOG1tUGtrMGJOK245Z09pa0xtZXMwZFQvcEFUaFdB?=
 =?utf-8?B?R1lWU09XUkRzazBieitLUm81UFZ1VWVMQkZ1U202OUhsNExhS1lsTnl2SmN1?=
 =?utf-8?B?ejI5WmZqZmszSlNNNjFudjhLN0I1VkpRRkxiTkRlVFo5dGJKeE1lOGQvaytw?=
 =?utf-8?B?QzE0K3d4SXNEMHY5M1I0RlV0dEpiMEdrdlZaOEM2ZWZKN2EyckcyTTNsT09t?=
 =?utf-8?B?WnBlc3F2ck1OMGpmNm5UL2poQWtPbC9BYmIreWtZa1ZDSlh4cXRsMDBNZHZi?=
 =?utf-8?B?N0h5cTRVaUZMeU9XcU1DS1V4c2ZkVTBwK3hIQmJ2SHpabC9hN1BEdTlNSCtO?=
 =?utf-8?B?cmU2QlVQdUxQWXY0aC9lK2lBSklldFpIMFdSaUt1cEFEbGRBcVBVeUV5NzFM?=
 =?utf-8?B?TU90RW8rUmJ0Vm56WDBMR0o4aGlrd0F5OVZ4bzQ5Sk1OUWRjMWxPQVQxMk9l?=
 =?utf-8?Q?DOIPgRBtQbrq4OsKg+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9806105-0d1f-49b9-0232-08de58969599
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:41:31.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJZIvUPYtl0CrEy1ODnuKltTsze1DU9SDzH6zgcSn1SvFcFT6Hah+H5cB+Lnd0U+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16087-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 2921F4FF54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20 Jan 2026, at 18:34, Jordan Niethe wrote:

> Hi,
>
> On 21/1/26 10:06, Zi Yan wrote:
>> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
>>
>>> Hi,
>>>
>>> On 21/1/26 09:53, Zi Yan wrote:
>>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>>>
>>>>> On 14/1/26 07:04, Zi Yan wrote:
>>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>>>
>>>>>>> Currently when creating these device private struct pages, the firs=
t
>>>>>>> step is to use request_free_mem_region() to get a range of physical
>>>>>>> address space large enough to represent the devices memory. This
>>>>>>> allocated physical address range is then remapped as device private
>>>>>>> memory using memremap_pages().
>>>>>>>
>>>>>>> Needing allocation of physical address space has some problems:
>>>>>>>
>>>>>>>      1) There may be insufficient physical address space to represe=
nt the
>>>>>>>         device memory. KASLR reducing the physical address space an=
d VM
>>>>>>>         configurations with limited physical address space increase=
 the
>>>>>>>         likelihood of hitting this especially as device memory incr=
eases. This
>>>>>>>         has been observed to prevent device private from being init=
ialized.
>>>>>>>
>>>>>>>      2) Attempting to add the device private pages to the linear ma=
p at
>>>>>>>         addresses beyond the actual physical memory causes issues o=
n
>>>>>>>         architectures like aarch64 meaning the feature does not wor=
k there.
>>>>>>>
>>>>>>> Instead of using the physical address space, introduce a device pri=
vate
>>>>>>> address space and allocate devices regions from there to represent =
the
>>>>>>> device private pages.
>>>>>>>
>>>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>>>> allocates a requested amount of device private address space and cr=
eates
>>>>>>> the necessary device private pages.
>>>>>>>
>>>>>>> To support this new interface, struct dev_pagemap needs some change=
s:
>>>>>>>
>>>>>>>      - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>>>      - Add a new dev_pagemap::pages array to store the device
>>>>>>>        private pages.
>>>>>>>
>>>>>>> When using memremap_device_private_pagemap(), rather then passing i=
n
>>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address spa=
ce to
>>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the devic=
e
>>>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>>>
>>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
>>>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>>>
>>>>>>> Represent this device private address space using a new
>>>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>>>>> private address to a struct dev_pagemap, where a specific device pr=
ivate
>>>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>>>
>>>>>>> Device private address space can be reclaimed and the assoicated de=
vice
>>>>>>> private pages freed using the corresponding new
>>>>>>> memunmap_device_private_pagemap() interface.
>>>>>>>
>>>>>>> Because the device private pages now live outside the physical addr=
ess
>>>>>>> space, they no longer have a normal PFN. This means that page_to_pf=
n(),
>>>>>>> et al. are no longer meaningful.
>>>>>>>
>>>>>>> Introduce helpers:
>>>>>>>
>>>>>>>      - device_private_page_to_offset()
>>>>>>>      - device_private_folio_to_offset()
>>>>>>>
>>>>>>> to take a given device private page / folio and return its offset w=
ithin
>>>>>>> the device private address space.
>>>>>>>
>>>>>>> Update the places where we previously converted a device private pa=
ge to
>>>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>>>> offset, instead of looking up its page within the pagemap use
>>>>>>> device_private_offset_to_page() instead.
>>>>>>>
>>>>>>> Update the existing users:
>>>>>>>
>>>>>>>     - lib/test_hmm.c
>>>>>>>     - ppc ultravisor
>>>>>>>     - drm/amd/amdkfd
>>>>>>>     - gpu/drm/xe
>>>>>>>     - gpu/drm/nouveau
>>>>>>>
>>>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>>>
>>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> NOTE: The updates to the existing drivers have only been compile te=
sted.
>>>>>>> I'll need some help in testing these drivers.
>>>>>>>
>>>>>>> v1:
>>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>>>> - Update existing users of memremap_pages():
>>>>>>>        - ppc ultravisor
>>>>>>>        - drm/amd/amdkfd
>>>>>>>        - gpu/drm/xe
>>>>>>>        - gpu/drm/nouveau
>>>>>>> - Update for HMM huge page support
>>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_=
DEVICE
>>>>>>>
>>>>>>> v2:
>>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_=
ARRAY(struct range, ranges);
>>>>>>> ---
>>>>>>>     Documentation/mm/hmm.rst                 |  11 +-
>>>>>>>     arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>>>     drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>>>     drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>>>     include/linux/hmm.h                      |   3 +
>>>>>>>     include/linux/leafops.h                  |  16 +-
>>>>>>>     include/linux/memremap.h                 |  64 +++++++-
>>>>>>>     include/linux/migrate.h                  |   6 +-
>>>>>>>     include/linux/mm.h                       |   2 +
>>>>>>>     include/linux/rmap.h                     |   5 +-
>>>>>>>     include/linux/swapops.h                  |  10 +-
>>>>>>>     lib/test_hmm.c                           |  69 ++++----
>>>>>>>     mm/debug.c                               |   9 +-
>>>>>>>     mm/memremap.c                            | 193 ++++++++++++++++=
++-----
>>>>>>>     mm/mm_init.c                             |   8 +-
>>>>>>>     mm/page_vma_mapped.c                     |  19 ++-
>>>>>>>     mm/rmap.c                                |  43 +++--
>>>>>>>     mm/util.c                                |   5 +-
>>>>>>>     19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>>>> --- a/include/linux/mm.h
>>>>>>> +++ b/include/linux/mm.h
>>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(m=
emdesc_flags_t mdf)
>>>>>>>      */
>>>>>>>     static inline unsigned long folio_pfn(const struct folio *folio=
)
>>>>>>>     {
>>>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>>>>
>>>>>> Please use VM_WARN_ON instead.
>>>>>
>>>>> ack.
>>>>>
>>>>>>
>>>>>>> +
>>>>>>>     	return page_to_pfn(&folio->page);
>>>>>>>     }
>>>>>>>
>>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>>>> --- a/include/linux/rmap.h
>>>>>>> +++ b/include/linux/rmap.h
>>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(u=
nsigned long pfn)
>>>>>>>     static inline unsigned long folio_page_vma_walk_pfn(const struc=
t folio *folio)
>>>>>>>     {
>>>>>>>     	if (folio_is_device_private(folio))
>>>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) =
|
>>>>>>>     		       PVMW_PFN_DEVICE_PRIVATE;
>>>>>>>
>>>>>>>     	return page_vma_walk_pfn(folio_pfn(folio));
>>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk=
_pfn(const struct folio *folio)
>>>>>>>
>>>>>>>     static inline struct page *page_vma_walk_pfn_to_page(unsigned l=
ong pvmw_pfn)
>>>>>>>     {
>>>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT)=
;
>>>>>>> +
>>>>>>>     	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>     }
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>>>> --- a/mm/page_vma_mapped.c
>>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk=
 *pvmw, pmd_t *pmdvalp,
>>>>>>>     static bool check_pte(struct page_vma_mapped_walk *pvmw, unsign=
ed long pte_nr)
>>>>>>>     {
>>>>>>>     	unsigned long pfn;
>>>>>>> +	bool device_private =3D false;
>>>>>>>     	pte_t ptent =3D ptep_get(pvmw->pte);
>>>>>>>
>>>>>>>     	if (pvmw->flags & PVMW_MIGRATION) {
>>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_wa=
lk *pvmw, unsigned long pte_nr)
>>>>>>>     		if (!softleaf_is_migration(entry))
>>>>>>>     			return false;
>>>>>>>
>>>>>>> +		if (softleaf_is_migration_device_private(entry))
>>>>>>> +			device_private =3D true;
>>>>>>> +
>>>>>>>     		pfn =3D softleaf_to_pfn(entry);
>>>>>>>     	} else if (pte_present(ptent)) {
>>>>>>>     		pfn =3D pte_pfn(ptent);
>>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_w=
alk *pvmw, unsigned long pte_nr)
>>>>>>>     			return false;
>>>>>>>
>>>>>>>     		pfn =3D softleaf_to_pfn(entry);
>>>>>>> +
>>>>>>> +		if (softleaf_is_device_private(entry))
>>>>>>> +			device_private =3D true;
>>>>>>>     	}
>>>>>>>
>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>> +		return false;
>>>>>>> +
>>>>>>>     	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>     		return false;
>>>>>>>     	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)=
)
>>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_w=
alk *pvmw, unsigned long pte_nr)
>>>>>>>     }
>>>>>>>
>>>>>>>     /* Returns true if the two ranges overlap.  Careful to not over=
flow. */
>>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_wa=
lk *pvmw)
>>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, stru=
ct page_vma_mapped_walk *pvmw)
>>>>>>>     {
>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>> +		return false;
>>>>>>> +
>>>>>>>     	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>     		return false;
>>>>>>>     	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mappe=
d_walk *pvmw)
>>>>>>>
>>>>>>>     				if (!softleaf_is_migration(entry) ||
>>>>>>>     				    !check_pmd(softleaf_to_pfn(entry),
>>>>>>> +					       softleaf_is_device_private(entry) ||
>>>>>>> +					       softleaf_is_migration_device_private(entry),
>>>>>>>     					       pvmw))
>>>>>>>     					return not_found(pvmw);
>>>>>>>     				return true;
>>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mappe=
d_walk *pvmw)
>>>>>>>     			if (likely(pmd_trans_huge(pmde))) {
>>>>>>>     				if (pvmw->flags & PVMW_MIGRATION)
>>>>>>>     					return not_found(pvmw);
>>>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>>>     					return not_found(pvmw);
>>>>>>>     				return true;
>>>>>>>     			}
>>>>>>
>>>>>> It seems to me that you can add a new flag like =E2=80=9Cbool is_dev=
ice_private=E2=80=9D to
>>>>>> indicate whether pfn is a device private index instead of pfn withou=
t
>>>>>> manipulating pvmw->pfn itself.
>>>>>
>>>>> We could do it like that, however my concern with using a new param w=
as that
>>>>> storing this info seperately might make it easier to misuse a device =
private
>>>>> index as a regular pfn.
>>>>>
>>>>> It seemed like it could be easy to overlook both when creating the pv=
mw and
>>>>> then when accessing the pfn.
>>>>
>>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw)=
 to
>>>> return the converted pfn instead of pvmw->pfn directly. You can add a =
comment
>>>> to ask people to use helper function and even mark pvmw->pfn /* do not=
 use
>>>> directly */.
>>>
>>> Yeah I agree that is a good idea.
>>>
>>>>
>>>> In addition, your patch manipulates pfn by left shifting it by 1. Are =
you sure
>>>> there is no weird arch having pfns with bit 63 being 1? Your change co=
uld
>>>> break it, right?
>>>
>>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (=
6), so I
>>> thought doing something similiar here should be safe.
>>
>> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is u=
sed
>> by almost every arch, so it has a broader impact.
>
> That is a good point.
>
> I see a few options:
>
> - On every arch we can assume SWP_PFN_BITS? I could add a sanity check th=
at we
>   have an extra bit on top of SWP_PFN_BITS within an unsigned long.

Yes, but if there is no extra bit, are you going to disable device private
pages?

> - We could define PVMW_PFN_SHIFT as 0 if !CONFIG_MIGRATION as the flag is=
 not
>   required.

Sure, or !CONFIG_DEVICE_MIGRATION

> - Instead of modifying pvmw->pfn we could use pvmw->flags but that has th=
e
>   issues of separating the offset type and offset.

It seems that I was not clear on my proposal. Here is the patch on top of
your patchset and it compiles.

Basically, pvmw->pfn stores either PFN or device private offset without
additional shift. Caller interprets pvmw->pfn based on
pvmw->flags & PVMW_DEVICE_PRIVATE. And you can ignore my helper function
of pvmw->pfn suggestion, since my patch below can use pvmw->pfn directly.

Let me know if my patch works. Thanks.

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index c1561a92864f..4423f0e886aa 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -921,6 +921,7 @@ struct page *make_device_exclusive(struct mm_struct *mm=
, unsigned long addr,
 #define PVMW_SYNC		(1 << 0)
 /* Look for migration entries rather than present PTEs */
 #define PVMW_MIGRATION		(1 << 1)
+#define PVMW_DEVICE_PRIVATE	(1 << 2)

 /* Result flags */

@@ -943,6 +944,13 @@ struct page_vma_mapped_walk {
 #define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
 #define PVMW_PFN_SHIFT		1

+static inline unsigned long page_vma_walk_flags(struct folio *folio, unsig=
ned long flags)
+{
+	if (folio_is_device_private(folio))
+		return flags | PVMW_DEVICE_PRIVATE;
+	return flags;
+}
+
 static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
 {
 	return (pfn << PVMW_PFN_SHIFT);
@@ -951,23 +959,16 @@ static inline unsigned long page_vma_walk_pfn(unsigne=
d long pfn)
 static inline unsigned long folio_page_vma_walk_pfn(const struct folio *fo=
lio)
 {
 	if (folio_is_device_private(folio))
-		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
-		       PVMW_PFN_DEVICE_PRIVATE;
-
-	return page_vma_walk_pfn(folio_pfn(folio));
-}
-
-static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pf=
n)
-{
-	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
-		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+		return device_private_folio_to_offset(folio);

-	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+	return (folio_pfn(folio));
 }

-static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_=
pfn)
+static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_map=
ped_walk *pvmw)
 {
-	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
+	if (pvmw->flags & PVMW_DEVICE_PRIVATE)
+		return page_folio(device_private_offset_to_page(pvmw->pfn));
+	return pfn_folio(pvmw->pfn);
 }

 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
@@ -977,7 +978,7 @@ static inline struct folio *page_vma_walk_pfn_to_folio(=
unsigned long pvmw_pfn)
 		.pgoff =3D folio_pgoff(_folio),				\
 		.vma =3D _vma,						\
 		.address =3D _address,					\
-		.flags =3D _flags,					\
+		.flags =3D page_vma_walk_flags(_folio, _flags),		\
 	}

 static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *=
pvmw)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 141fe5abd33f..e61a0e49a7c9 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -136,12 +136,12 @@ static bool check_pte(struct page_vma_mapped_walk *pv=
mw, unsigned long pte_nr)
 			device_private =3D true;
 	}

-	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+	if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))
 		return false;

-	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
+	if ((pfn + pte_nr - 1) < pvmw->pfn)
 		return false;
-	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
+	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
 		return false;
 	return true;
 }
@@ -149,12 +149,12 @@ static bool check_pte(struct page_vma_mapped_walk *pv=
mw, unsigned long pte_nr)
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
 static bool check_pmd(unsigned long pfn, bool device_private, struct page_=
vma_mapped_walk *pvmw)
 {
-	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
+	if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))
 		return false;

-	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
+	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
 		return false;
-	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
+	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
 		return false;
 	return true;
 }
@@ -369,7 +369,7 @@ unsigned long page_mapped_in_vma(const struct page *pag=
e,
 		.pfn =3D folio_page_vma_walk_pfn(folio),
 		.nr_pages =3D 1,
 		.vma =3D vma,
-		.flags =3D PVMW_SYNC,
+		.flags =3D page_vma_walk_flags(folio, PVMW_SYNC),
 	};

 	pvmw.address =3D vma_address(vma, page_pgoff(folio, page), 1);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index be5682d345b5..5d81939bf12a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk =
*pvmw)
 	pte_t *pte =3D pvmw->pte;
 	unsigned long addr =3D pvmw->address;
 	struct vm_area_struct *vma =3D pvmw->vma;
-	struct folio *folio =3D page_vma_walk_pfn_to_folio(pvmw->pfn);
+	struct folio *folio =3D page_vma_walk_pfn_to_folio(pvmw);
 	struct mem_cgroup *memcg =3D folio_memcg(folio);
 	struct pglist_data *pgdat =3D folio_pgdat(folio);
 	struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);





Best Regards,
Yan, Zi

