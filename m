Return-Path: <linuxppc-dev+bounces-16247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M4vKYi3c2ncyAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 19:01:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B07950F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 19:01:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyQjW1VlZz2xdY;
	Sat, 24 Jan 2026 05:01:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769191295;
	cv=pass; b=UQ1Iq/lbYyFilx2juPoW68hc2ezCb2XdXwWffeoNgMXZdIu7Z81+AmSSQfCbZ5bk7PxkJlZ17gEc+y6nCdUuPWV07oPgNG4rdZccx65JADICXtyF/BqFdjuwiGRbzc8F6Q+CSoqvGvBLT5ZKeIw0M9bbor01ifHjXosXjcKzQFBe5TH/qh6qKexAfNR5P6sp3AfETnJvbaRwNJGbntbvcsRYVGtJj7ktL5raeDehKnCLrUjEuy01ZsWoopr5niuKuAxvNZ4Wy3LGwWUnhc2DG1FWwJm1ARm9WCCIhzZnY7lTJwRHcKeme2isQLfPD3fg7V8RViRrxtyx0XE8nEWS4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769191295; c=relaxed/relaxed;
	bh=pHZQu94wwBqQXz53UineyDsRSVIay85jB/0uNC9nlT8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aJXTd0LxjF5XRoGpPtZQiWP1ytvVOWHwB9/UsOROQqBL6xpe83D3pjBYNPdyDWxlGwP8Kfv4oxEe2MZYxkSUa2kGm7NmK+K+xF+a8QYWSrrIWfcV6Jp6dL2D9JW25+FOK5IUpRtpWXL/gH1DLEybnkVVtTS4lBDOH47aGyKe8npcButzFlxp8L8rzNHtHNO1utJZDJQs5jfWlKejxEz8SdohTGKlY/lLqRjW6yETUMZ72zP+4BsVTrGiUQXTDYcyYcf2UlscVvowsZeVVSF8ymcSA0SH5Uz0OkT/Z6teIzI0JDkDFQY8cAZSuFrHgfsPc0XCx3iyIsh3Fz9JHAzWtA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zMmfrX+l; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=brett.creeley@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zMmfrX+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=brett.creeley@amd.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyQjS3DpGz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 05:01:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHShlVqufP0EyEGzFvtCjsHsifxQLesLK3nRpFBUW3mi2HeGgC7vIIn9n52tliU/AnmXN31ZVDF4vnNYLZCyT4jwayKlun3GTHHy3M2sWcDGMtWSyQDLrFexOfQ4mS4+2sA+hzsZX8pkL/bcc54s7zvpNU/nmFRs8NZGk5BYRxCDsCWIwycOzLcYIzX4t+YQD1cFHMq5bVzSCKaFIDrLUvSkIweKIY21YEV5p7Q0IsYvpQ73Kszg4kJHef2bA5L3sBHhpCAQv34VGbdggqvNHMZmigdF8qgUkgnv+4L0XkXAdLUjHThZZ13t926R28IHreeZ6WLjxccd5CK1MASBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHZQu94wwBqQXz53UineyDsRSVIay85jB/0uNC9nlT8=;
 b=dkfb/j0g18tV89lWKB6uPv+M5FOmRicr0qTltVBLppoxNy14wnziBla+rVM4pPao7sby2pSLLv6Hlf0ojskJ9i/syUR6XAe5uuR/1NGwGoH2GOWtkYTeKA9R0Df/dNgPQOrYRXmzycsvgZ4t1vhfgJKdPTp0pYhiuK9xIgFc15CiwkUOFf5LTD6t2StTKX6vTP2y7WWgSaNkZCiE5XhsYHwePbuYUQ5ffD7diwnQB9oXomDpQzBAOVa6k5kXha3yfgSo91cnZ2yTYrPSUkV2vNCiz3x+wGUWZtF5wBbtclRnBIQxeTeeQ7IcaG9CDLfbIOx8MD0RVJJJp7QcmRiJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHZQu94wwBqQXz53UineyDsRSVIay85jB/0uNC9nlT8=;
 b=zMmfrX+lGpMidNCdsPURuIj248pHOSWQp504bW56Ht038xHEWNg6GVogXF4X6NBoXON1yO1feC5M6FZ4vOllJqLer/uQi5mioadB/Shz4MhNK7Mb+XmsbNy/qkziSBJyDo3qpUFi6V/XZvfYZQtq/vsVeIcjQzBFOYdl/YJYOnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 18:00:59 +0000
Received: from PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::4eda:ca5:8634:5b27]) by PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::4eda:ca5:8634:5b27%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 18:00:59 +0000
Message-ID: <53f4dc0f-4d1d-47d4-80c6-84c3562a0310@amd.com>
Date: Fri, 23 Jan 2026 10:00:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
References: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
 <20260123-pci-msi-addr-mask-v3-1-9f9baa048524@iscas.ac.cn>
Content-Language: en-US
From: "Creeley, Brett" <bcreeley@amd.com>
In-Reply-To: <20260123-pci-msi-addr-mask-v3-1-9f9baa048524@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To PH0PR12MB7982.namprd12.prod.outlook.com
 (2603:10b6:510:28d::5)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB7982:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef3e18f-7f92-4bcc-9b01-08de5aa95d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXJ2aGtBZ0dOT3kzSDU2RTJ6aVVCelNyWm9scnZxZE8yWkQvZWRSK0tPVU5v?=
 =?utf-8?B?MkgwOGRhb0dhSVFaeXlHZ3orUjl1YkZHL0xTL1lzYVVoQ0QyUStrVXliZkQ3?=
 =?utf-8?B?d29lVldpTUd5a3hTZDZORHc1UVRSbVh3ODNWY05teW9McjlQaittWEZkN1Zm?=
 =?utf-8?B?ODBsK05zR2hxbUR3ZDcvSlQ3ODkwc1BFWEMwZlJBdFdyWThYQ0ViMnlkeDFY?=
 =?utf-8?B?MTVxMG5VMUNjdm9mREFySnpyN1FDVGI3Mm5ML3Fkd2dqbkVFWkdNNEhRYjBt?=
 =?utf-8?B?bWdGd1YrbmpCUVFlSDF0ODZIMjJEZWxrZ2FBbTc2UUs0YWpTZmJ0Z3lDelBL?=
 =?utf-8?B?ZWxiK2U2VFhZdnkvUFBtbDgvQ3V0aWpvU25wbngyaVlBRmlydVZFdGozSW5X?=
 =?utf-8?B?Nkk0dDZSTVVRRVRzRjhiSmdqSDZFc0x5TVhldk9CZCs1eEdhVGxpcGRYMm9R?=
 =?utf-8?B?NndGUkJ6K095a2dKdDlVU2MrMTFJNU5Zd0ZTcHFEWUhMYlRlL0JMemwwZXRk?=
 =?utf-8?B?WGxjcjQzV0Z0cjR1b1lPOGxkdnVzWjJMcFBoRHYwY3BJeFhnQXkrMk52RE5O?=
 =?utf-8?B?VExicjFBRzdzODNDWkpOUmp6amtYb0JXMUxjRWN5NHV1bzNzYWpZa1Y0QW1E?=
 =?utf-8?B?cW5zOVNvQ1lWemgzdVZDeDJ2bUlBM2Z5ZnNkSEJXWWtubjhXTXFDOVFuWVM2?=
 =?utf-8?B?TnZrTnFSVW9UdnJjT0dBRWxDT3ZBUDFsMzd1NGZvKzBCaW5oemYvZ2x1KzRX?=
 =?utf-8?B?UXdaWXg3c1VYK0lraWw4RzBoUXJmSFkvSUpma0hWSk5rOTNrMHQ1VkVsN3ph?=
 =?utf-8?B?N3pNVGQ1ZllySE1XRWJuVGFZdUw1TDUyV2pmQnptMWtXaE5LeFBHZUtOZmJ1?=
 =?utf-8?B?WWx0cjR4dzhYSlFDUktOMjI3MSswTVBWdFVFbFQ5N013ZkUxQmxaNlBnaDVI?=
 =?utf-8?B?WnBBcTVVU0wxOE9aWTdXcTJiazk1RVNkSlBPUDhBNUVEam9PK3BobkQzODFx?=
 =?utf-8?B?cUx1Q1VzNWIzUlRnV3NmTXp1UWRrOUVFWm44Y2JWcTk3bVgwV1JTVGtmV2tW?=
 =?utf-8?B?U1Q3YzVsZDROSlluRy9BYmo4Vk1lRjMySzh3WG9FTHNRNkgvQ0JvVnNqc2Rk?=
 =?utf-8?B?Zkorbjk2ZFA0QzNYVW1vQjBTeHpSOC9LM25NZE04WndieWxIV25EQ3UycWd2?=
 =?utf-8?B?YzhOaXVmeHJmUE9KWGJsZ3RjNklCNjZNakxNQyt3cXR1Q2pqbUtmaUR5VEtv?=
 =?utf-8?B?MDFrbDVTeE1IV3FzbVE1dWlPdmJVeTFFQ0Y5RHFpdUtQQXhlYjBRSlhGODRn?=
 =?utf-8?B?R0lPRW5tQm1kakYvUm5TNmhGeG1ZNVlnd3FkRkVkTmtES2greWRSNlRBZEFV?=
 =?utf-8?B?dUJwd3AwSm1EUjZFdk1peTZ2K1ZkaDExMlhmOWpNWVZ0Zld0czJKTGpGOXhQ?=
 =?utf-8?B?NWZHRE1DaVRsc21WbnBxMkpHak1ocTBUSXBTanFsZkpkQVI2c1Bya0ExVWFZ?=
 =?utf-8?B?d1h6eFhNUFF3L0JGcUxhdGJKNmUyTlVEL3djSmF3d043R2p0OG1aZWtSaHJC?=
 =?utf-8?B?OFF5ZkR3UFBwYURQV0VKQXVUd2JTMTNOekgrTlhIWFBnaGxGQ1ErYTJka3kw?=
 =?utf-8?B?blZ6d0NnS2JvaGNqaWdhNkkydSsyQXMxcFBYUGZRYlBud1lETTJFOHFPazY4?=
 =?utf-8?B?b3lUanFYY0FHYnNEZUkrM0MrK0V1MUg4clY0eUlmSXhHNHdEV2grbDZ3bERJ?=
 =?utf-8?B?QnpxbnVMTWZNMFpselRtL3lvL3lGVWxMYnB2SHZRNmhqVFJVNUVoQi9ZK2xW?=
 =?utf-8?B?MFlxdnM3Mk9oWlM0Ry9mR3BRalNSdG9wVFI1eTVaNU9KdnIrNkxrQUtnYUll?=
 =?utf-8?B?bTU2OFlya3dnN0tSMDZhKzB1RXJ1b2ZYSVJkMlRnaDNmblRGQVZxOWZJOUhW?=
 =?utf-8?B?czhtQWVwK3N0OGVPaWhOVlRNZFRLTTV1cWlqaWo2RmJmc0ZIMi9pTFB1ejBr?=
 =?utf-8?B?d2lxbWdpUk5lNmVuUVluekNxbUl4TStaT1B6L3VmcFlkZjJhVkIzVGFHTW1Z?=
 =?utf-8?B?aVZ5VXVQUlpTZmFyT1dxSVpIT2Q3SnYyR2NWQStjZWhscDlCWURaOWs5V1lR?=
 =?utf-8?B?S3IzdlBPQlExM1hxTDJxMkJsbGN4Q2ZNTFU2QzdVUEtySDFDYlR0SElja0hu?=
 =?utf-8?B?L2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7982.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWxwQ01xaGdCRnZ5QVlpbDkwM0pEVjAvamZXR0gzSnNQVDFsUVBSOUdaVzRt?=
 =?utf-8?B?ZWlBdEwwYjI3TGxuOGlYMGIzNXFmY2NlNXVXTENtSy8rNFVRVGt3RUFnKzNG?=
 =?utf-8?B?WEhMcGtGQkZ0QTV3MElMMzRGRDljZXdTcFBkTkZuMzl5OTllTTNURGMwaG9p?=
 =?utf-8?B?c1FsYXloSGMrYXI3blFVNWc2M00vKzM2b2kyN01xdkY0RHJ5WjNYU1hqVStI?=
 =?utf-8?B?MG1sVXVQTU1yeE9qZG9WRUp5c0lUSlUrTVYyVGlSMGxZMG1UODFaVURtWlY2?=
 =?utf-8?B?SkJpZnljczR3eVdabEV1M0Q1dysyL2ZGQlhMc3dCVGZ4NUdkeEQrYWpPKzNy?=
 =?utf-8?B?M3JjT2IrQjlLbWNUbCtURFdHbUN6ZzVodTBVaXBuTnRiRzhBb1BzaUp6dEFJ?=
 =?utf-8?B?S0hwd3JCNmIxeWZhODFoY3o0bVErWUh4TjA3L2xDL0xJWlNyRGMrRnFERHVi?=
 =?utf-8?B?TGF3SkJPOEdkaFZjNVk5aVFpaUdYaEtLZzM1MFZVOE1qNHVRNUx2WEtIOWdR?=
 =?utf-8?B?ZVJzYmEwd1J2eHdTR1A5dDBza09Sd0tHRWIzK05nOE9saytaVXBzMjY3RU55?=
 =?utf-8?B?djVBSHZqNHYwOHZaTmYzYjNwaXdSTnd1WW10b1Qwcm9hbkRESGRoaVloWFVT?=
 =?utf-8?B?UmtBZGd1NGZzenpqWHZSejlOVDBnR21BemNGb3F3Q1h3Q0kybW9XbUFlczVv?=
 =?utf-8?B?dDg1NC82d25zZW9jakt0Smt6Qmx2R2hJeXVRNVd5dExNMVg3VEtkTk9OeTVO?=
 =?utf-8?B?bXQ0cmhvZHZlbUFOMzhDbXgwUVU5clNQU09IOUpheEV0b0pEVk8zZVNqbGhx?=
 =?utf-8?B?SHhLOFpJakJQYzkyS0JHNGtaTGYzYXdkL1ZZYUlGZGg2OUh5b0xNeFJMOHFJ?=
 =?utf-8?B?MGJweTRPR2x5Z3Q1MDNidGZWQTEvd1VMRmdTZXg0UlZ6RnpVL3hNVTMrclBz?=
 =?utf-8?B?U3B5cElqekFTYkthUTF0MFV2OGt0cHppRUpqWkJjMi9GRjVRcXhzeHR1cXcr?=
 =?utf-8?B?cFpRVzRtbDQ1QXBsMU83YmY1MkJjTGdBVHVUbEJHa1FSYjZ2UDM0ODd4aVNq?=
 =?utf-8?B?eElJcjB2L3lkUGRSYldFWkVSSDZTOHIzMlJTRUQ4UzBNclR5VXgxNWhnYzk1?=
 =?utf-8?B?bUQ3ekxHTEo1dERMTEt6SWFXNmVPMFVqdi9DUDZKeDFCdWtkNW13Tlp0M1Br?=
 =?utf-8?B?b2xsVTZnaXU2TDkzaDB4S2NlTm84R3JaSno3cnZNalZleS9GbTlvMEdGWlYz?=
 =?utf-8?B?RVNQdWVlbXdUKzBzaGRpNzBxY3RiZTdpclRyOG5UMFA3YTRFeXV0dEhEOEpG?=
 =?utf-8?B?UFhpWUZSdzlqbG51aUhXb25jM0Q2eDc4SnJPNE1yRWRyVnA1dldvOG1lL1B2?=
 =?utf-8?B?WXp6OExUanAraTBsaTRjczEvYi9rMkczeUxEc25weTc3MzZVTllxZGtpWFRl?=
 =?utf-8?B?U1hsOVRaaUEwc29CejZOTEoySkh0VzV0RDIvL0FXVUxkajA3cEU1azNJTDFp?=
 =?utf-8?B?L0pLNjJ3MmpMdU5CcmJyay82Qkd0SHFoRWlFdlF6UTVyNW4ybVgvS0tKQ2JU?=
 =?utf-8?B?bEZ3Z01zUHdHZVM1a1lCd09NWHlyR1dScmhaZm1Xdm1UTEFDY0ZFeU01elFr?=
 =?utf-8?B?SEY0VnM1NklLSHEvakFrcVUrdGRHelI1VTJxNkJJOTBvdkVrMEc0bStaT3py?=
 =?utf-8?B?dUFhdjAwSTVuTm02K2tPTCszZHA5OWRab1hhUHhnMFpSU3BvSkN3ZTIxSEsv?=
 =?utf-8?B?ckNBdDA3ekhUVWVlUDdjZnF1ZzBpdzlKMkRhU2FrZStEWmhNTzduT3I5bnFR?=
 =?utf-8?B?ZXZtR0l0Zk5DZjdzdkhlTE5WQWNSSG50RUpZQXRITUZlQVRaV2s0djRUU0xj?=
 =?utf-8?B?UWRGa1FXL1k4czFmN2ZEUG5WMHJKV1lNVUtSZ25WNk9pNVA2ZlpsYlVrRk1l?=
 =?utf-8?B?cWQrZGNnZmRvUlZBMWNMQ2JvdFdVRloxbVI2NGNrUDhWYitsMy9GVHJqUXg2?=
 =?utf-8?B?enJLSk1IYUNCR0l0MlhwdElNTzhRSlgzWG5seEJIMjE5K29lcE5Ndm4zRE8z?=
 =?utf-8?B?ZkFwakpOWFlDVXFOeUN1QWtuMld5djYrSE5CUXNXMldHSEJXRGRkMDRxZ3J6?=
 =?utf-8?B?a3Y1clY0emFLVzhsOWZZSnFLbk9kdk5jY0RXRVNpSWhRNnRjdTAzakwrTlJi?=
 =?utf-8?B?L0F4dTVQeENPSlprNUpoUjVtOGRVZ2U1dDZMb0ZWR2o2Nm5XUEsyNVhqVjVU?=
 =?utf-8?B?QUd6eUtMeVJMSmw5L0JuMDVlZzJXRmlMS1hmRTF2K3FnYWlTMStnTlYrZ2g5?=
 =?utf-8?B?OG0rOXo4eDJkZW0vRWhoNm5haG4wNnRRUVdibTk0cG5uem5EdkFUZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef3e18f-7f92-4bcc-9b01-08de5aa95d14
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7982.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:00:59.2372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmvzPqL3uA1asqBnF15qFhTPIv7yTq6iM+8vBqxaWD3EpIAsFs6y97Rf+TQVcFwNq2NRBkKzDIwJxckqKYPuoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[bcreeley@amd.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:gaohan@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16247-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bcreeley@amd.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,iscas.ac.cn:email,amd.com:email,amd.com:dkim,amd.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A84B07950F
X-Rspamd-Action: no action



On 1/22/2026 10:07 PM, Vivian Wang wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> implement less than 64 address bits. This breaks on platforms where such
> a device is assigned an MSI address higher than what's reachable.
>
> Currently, we deal with this with a single no_64bit_msi flag, and
> (notably on powerpc) forces 32-bit MSI address for these devices.
> However, on some platforms the MSI doorbell address is above 32-bit but
> within device ability.
>
> As a first step to enabling MSI on those combinations of devices and
> platforms, conservatively generalize the single-bit flag no_64bit_msi
> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
> with msi_mask.)
>
> The translation is essentially:
>
> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
>
> Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) is
> used, no functional change is intended. Future patches that make use of
> intermediate values of msi_addr_mask will follow, allowing devices that
> cannot use full 64-bit addresses for MSI to work on platforms with MSI
> doorbell above 32-bit address space.
>
> Acked-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> v3: Add Acked-by, no code changes
>
> checkpatch complains about the comment include/linux/pci.h, which I have
> formatted similarly with other comments in the vicinity.
> ---
>   arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
>   arch/powerpc/platforms/pseries/msi.c                | 4 ++--
>   drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
>   drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
>   drivers/pci/msi/msi.c                               | 2 +-
>   drivers/pci/msi/pcidev_msi.c                        | 2 +-
>   drivers/pci/probe.c                                 | 7 +++++++
>   include/linux/pci.h                                 | 8 +++++++-
>   sound/hda/controllers/intel.c                       | 2 +-
>   9 files changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index b0c1d9d16fb5..1c78fdfb7b03 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
>                  return -ENXIO;
>
>          /* Force 32-bit MSI on some broken devices */
> -       if (dev->no_64bit_msi)
> +       if (dev->msi_addr_mask < DMA_BIT_MASK(64))
>                  is_64 = 0;
>
>          /* Assign XIVE to PE */
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a82aaa786e9e..7473c7ca1db0 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>           */
>   again:
>          if (type == PCI_CAP_ID_MSI) {
> -               if (pdev->no_64bit_msi) {
> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
>                          rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSI_FN, nvec);
>                          if (rc < 0) {
>                                  /*
> @@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>                  if (use_32bit_msi_hack && rc > 0)
>                          rtas_hack_32bit_msi_gen2(pdev);
>          } else {
> -               if (pdev->no_64bit_msi)
> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
>                          rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
>                  else
>                          rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index 9961251b44ba..d550554a6f3f 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>           */
>          if (rdev->family < CHIP_BONAIRE) {
>                  dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -               rdev->pdev->no_64bit_msi = 1;
> +               rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
>          }
>
>          /* force MSI on */
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> index 70d86c5f52fb..0671deae9a28 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> @@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>   #ifdef CONFIG_PPC64
>          /* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
> -       pdev->no_64bit_msi = 1;
> +       pdev->msi_addr_mask = DMA_BIT_MASK(32);
>   #endif

This seems like identical behavior compared to pre-patch, so LGTM.

For the ionic part: Reviewed-by: Brett Creeley <brett.creeley@amd.com>

Thanks,

Brett
>
>          err = ionic_setup_one(ionic);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 34d664139f48..48f5f03d1479 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -322,7 +322,7 @@ static int msi_verify_entries(struct pci_dev *dev)
>   {
>          struct msi_desc *entry;
>
> -       if (!dev->no_64bit_msi)
> +       if (dev->msi_addr_mask == DMA_BIT_MASK(64))
>                  return 0;
>
>          msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi.c
> index 5520aff53b56..0b0346813092 100644
> --- a/drivers/pci/msi/pcidev_msi.c
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
>          }
>
>          if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -               dev->no_64bit_msi = 1;
> +               dev->msi_addr_mask = DMA_BIT_MASK(32);
>   }
>
>   void pci_msix_init(struct pci_dev *dev)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 41183aed8f5d..a2bff57176a3 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2047,6 +2047,13 @@ int pci_setup_device(struct pci_dev *dev)
>           */
>          dev->dma_mask = 0xffffffff;
>
> +       /*
> +        * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
> +        * if MSI (rather than MSI-X) capability does not have
> +        * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> +        */
> +       dev->msi_addr_mask = DMA_BIT_MASK(64);
> +
>          dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
>                       dev->bus->number, PCI_SLOT(dev->devfn),
>                       PCI_FUNC(dev->devfn));
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..0fe32fef0331 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -377,6 +377,13 @@ struct pci_dev {
>                                             0xffffffff.  You only need to change
>                                             this if your device has broken DMA
>                                             or supports 64-bit transfers.  */
> +       u64             msi_addr_mask;  /* Mask of the bits of bus address for
> +                                          MSI that this device implements.
> +                                          Normally set based on device
> +                                          capabilities. You only need to
> +                                          change this if your device claims
> +                                          to support 64-bit MSI but implements
> +                                          fewer than 64 address bits. */
>
>          struct device_dma_parameters dma_parms;
>
> @@ -441,7 +448,6 @@ struct pci_dev {
>
>          unsigned int    is_busmaster:1;         /* Is busmaster */
>          unsigned int    no_msi:1;               /* May not use MSI */
> -       unsigned int    no_64bit_msi:1;         /* May only use 32-bit MSIs */
>          unsigned int    block_cfg_access:1;     /* Config space access blocked */
>          unsigned int    broken_parity_status:1; /* Generates false positive parity */
>          unsigned int    irq_reroute_variant:2;  /* Needs IRQ rerouting variant */
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 1e8e3d61291a..c9542ebdf7e2 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -1905,7 +1905,7 @@ static int azx_first_init(struct azx *chip)
>
>          if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
>                  dev_dbg(card->dev, "Disabling 64bit MSI\n");
> -               pci->no_64bit_msi = true;
> +               pci->msi_addr_mask = DMA_BIT_MASK(32);
>          }
>
>          pci_set_master(pci);
>
> --
> 2.52.0
>


