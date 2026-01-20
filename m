Return-Path: <linuxppc-dev+bounces-16078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ICbIM0CcGmUUgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 23:33:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3D4D08A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 23:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwhtx1K7Cz2xrL;
	Wed, 21 Jan 2026 09:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768948425;
	cv=pass; b=BrgAWe2gnDZWg9rShdbbF1wGdvSqG7M+/5ZlTCOCqXkb+IJ7ZFwYx7UO+tTzdXY0HovgQDkHEmUaWpHmDCHk3NYyV9jz0xCyUcI32C+iFmATTZ+qMsA9sc2sQPEO24FhDLGwXfBQXjWLFc02oecqBkP9qhJddEVbVlHmX5SohxzfWzzBR8Ji1Efb+Ffq7YrWq1HU34Gx8EMTUDoY7Jm7B6b3ZAo6JdyigPoWV9uadSMPcsEz32Mtjy+qoEZwyeIU52PIGA8YTWzAGnaTgX3hjRjFXbrlYOVWXlb5L4oteQW73XaSkiSlKSjLncPf5tl0q+FaGYA5SmEbXGs2/8lSfg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768948425; c=relaxed/relaxed;
	bh=S+f2Mph0Q7ufI+tR+hk1pmXX/CxqZ1dJgQcyGG/XPyQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mT+A+P6jOyR+boi1M9Ax0Tl1t+5VkoLnzlYsqWS1uEF3R5k1hkntfG5gfDSTvhxv3e1V4TKteMgokHoJ4cNjPO7gY3LEgka67ye/Gy03HbGB11XATMtfTLexnfq/SJpeim4Cq+6OxJVd0Rc7JMWgEhAwCpev3XqFynGFrih9NRHdTxmfF9aIYUgyyzUFmEk/y+cQShTfnItLgJtluyDsS04YmN1y4WVIeRfELSUpyPm89CNC/mZprD3XMcb27PRaBmRfoK6o80MhoG+A/jQm5sFi+JOJDdkST28Ylqm/lqBhB6IoDE/HHKMVzi+cRInFnqFv9G0v9OQeOKY7M21spw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ORswT+D+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ORswT+D+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwhtv3F6Cz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 09:33:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4CJKZrBaENQ3b+vWhl5sDIkSZ6cQvlzItIziByAGzpPWVUdKxGj/2CeW6clwSMo+vvHQqqBIJ3pKqtv8y2qbzOOnKELvkNI0fIcWvYKnWSYzlP/4+LU4WMQiojsyNxgSkxdr5xCnt4Y4cwOvd5R3GFvfOTaUuQFzVUXdPus7jMvgTUwgAnZXoNpbK86shm+NVpxeAK2AR8BwlldGEJpmuPiMFr8H9P0ZEI0Oj1TxD5EBUbLMPQL2m7+WWZOYXAkEW8c+CI0CAC3WReAtdkVOWvU9M28ON+wzs1w61GDCvgpY+e4l0VCezvorlWBtg0NPRb+EbDRI14U74QukSIsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+f2Mph0Q7ufI+tR+hk1pmXX/CxqZ1dJgQcyGG/XPyQ=;
 b=eamhrtR2VwetVkR6Rw5148MwZmVHFiqcCjeVOmLVXt+85nXgZljcxgazzuZ7yPujhU2VQ56Hht1bZMGPZAqEmqIKsfyK1RsyABFRhukiSKNAicpfxKuxekXW5LmSH85ngVO4qVLVCXv3sG7QIACzlwBoc2nY5yPYu/zlmbGYIPjcaKvcYZBPCg2rktEAXvl5uENKUQbP4tHp8tuPXQCXH7qj1z1n5XTy/tn03tMQuC1KbsB68LQ+q1fq8E26pmSxBkMlZF16Ovjbuy/M/dQ4zniDvEGPCd3UwPyYZ1bNByscNNJzx8SOYoL/n4lVMw7ppIohJW6DZQv2D0iyVyP5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+f2Mph0Q7ufI+tR+hk1pmXX/CxqZ1dJgQcyGG/XPyQ=;
 b=ORswT+D+MhaVJvhhEPLqnLiZRXh679STy1ciWmuWpO6KOvsW9gmvi4P6q+vqaW+nyDizXWYuEz4fKh96fEmtIuoO1Mj4aivCxzNIsd1fjHM3bIXVhjPjT5XDPgLw0k3fIkvFLSLKjnQ/wRQXKv0cMfe1WUGpH4i3swCt4Oj814LZHyHMkj1kZRDNBypd4kffbtH7k77WcoyllVfBc+mSoAvZM0WQmFOQs/SHtIh891511HZXo3O9PYAez0nZdsmJjqrj6BHV7oF98ii66ZJF0+kvyfKq1PEoevO0uUbjKBS6RgnUeB/W4jzwSLx1E63lPAc1QWHPQxRnFStldjav8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 22:33:17 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 22:33:17 +0000
Message-ID: <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
Date: Wed, 21 Jan 2026 09:33:07 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:180::14) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CY8PR12MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eed00e2-a952-4f19-bc5f-08de5873e802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmNWazE3V3Y2V0FTTHE1NndMbytWTmg4d01mUFJGVWhjTGNWQ0t5YzRZUEFr?=
 =?utf-8?B?dGc4V2NCUDdOaFFWN1BBSWZScWtNb2xIWE44TGI1WlpUMnFiUnRLeXRaMHUw?=
 =?utf-8?B?cDFpOHJsUldBV0lqbUNPaVhKY3FsYTRTZWw1U1RHSHVvbVN1SGozUUFidnBV?=
 =?utf-8?B?ZUNWK2xyN1NwbnJHWUJOZTY1VjZNT2x1b0VoRmlTdnRad3B1MWRESENtOGRs?=
 =?utf-8?B?SlpwMTFDbE5tcUt1c1hQRTNYeWoxN2lwMllPbVI4azZMQXBhdGd1dXlONElE?=
 =?utf-8?B?dm80bDY0RlRBTDdPejI5QnJKd2ZqQ0VFWE11V3lkVnB1V29qS1AreDRRVi9v?=
 =?utf-8?B?RGxpdnlrbHowVTk0eWlHbWdsMzQvYVkrOEhUbmpOclBFcDd1RXQ5TE5ZK3k5?=
 =?utf-8?B?aHB3SVdtZ2E5SlZzTWdMdkFNSUcrMXo2b3lXSXBIbEt1ZU5TblRhU1pEek1h?=
 =?utf-8?B?WTM0N3hZaEcwRnNzOFk1bDNFMWIvQlVJc2pINTBJUWtsSVJNSUhJZzNqYUZ6?=
 =?utf-8?B?TlJoQWU3T2VienhXQWJIU2FHNzBYc1lDWTIxNFlOcHZSWUVxMnRTeUQydk9n?=
 =?utf-8?B?S0dBalZyREMwNEdzZ0tjeXp4VmRlV1NzMU5wU0YzQnVsUmRvZ0RYYkdLWEhr?=
 =?utf-8?B?RHFtNFVubEN6dzUrenpFWWV0YUY0UlF1cWVhd3A4TVpwUlR1V1dSbGx5V0Ev?=
 =?utf-8?B?eGMrTHNVTEF0c09FZjRqWnhoYUxTb01yNEJzTkpZQ2gydjlicUY3NWxUZ1pM?=
 =?utf-8?B?R0J1WFVDY3BiSmpIY2NTSWpLMVM2RmhacVc1QWVtdzcxbTNvakd5OFliQzBo?=
 =?utf-8?B?M2hydW9Pb09BdXJhejAzdC9xeFlkOVlmY0hNcXZEdzNubmFub0Zla2s3TEd6?=
 =?utf-8?B?VUJ2Z2hBalVDMXFnc3k5amtMVFBSN2U2V1IrYmVlR2svMEs2ajV6QjNvNnJv?=
 =?utf-8?B?ZjNIVkJTeFRlLzJ4NjFKWUduWnN3cUhmV0hoanhKRGpnK1lUNC9WWG5RNFN2?=
 =?utf-8?B?SFVlazhKK0tSSFY5MjVQc0toYVd3TktrQVRNb0owNXFpMHY3ZWdqUnNIL1Nm?=
 =?utf-8?B?Q25lNnFKT3lOaHdPT1VEanNJd3pqbDFSMTFJc01NbDVsM1hFdmZNNzRHUDRX?=
 =?utf-8?B?OHMzNWtDSjFUdVhLUU42eFg3bzQ1VUVURlV0YnhnVkd5Z244eDRwOGpIaWpK?=
 =?utf-8?B?WUZoczNnQjdMZTE4UHc2a3cyTDNMejJRaUFWSkFNQ2Q3UmkyS3o2R0NMVkJB?=
 =?utf-8?B?QmJrajRSRWF1dXFlTnA1cG1OcnBVcVgxZlN6N0dMdzBPSEJyU0krdGNZTGcz?=
 =?utf-8?B?UWw1VklILzBRK1RCVk1wU0hHSVdCYy9IelBXUEkwV2ZMc1J0L1FFSzQ5eXV6?=
 =?utf-8?B?V2F0RnVIWU1VYzNWaWRFQlJKVnNVQnVhWkc1eWpocHFKemNERXlXWFFPeUs1?=
 =?utf-8?B?NXlqRXFJZFJUN2dZZVFScjF1NW1rc2dFVHBUVGpHQmYwU1l3NEFBZHl6TFNF?=
 =?utf-8?B?Si96V2s4S2x2eGxjMDNVR3ZJRUVmTmtjU2ZFbXB3QnN1Y1JCZkhxbkN6M2VJ?=
 =?utf-8?B?c1Y5ZnFMWklXQ0tSdkR5VmFReDJaUHRNTTl0Ynk4NVZiUFc3MEJPOGJkRkZS?=
 =?utf-8?B?ZVFYNzZJOS9vdkF5TjZjZWZHMm5HUkhWQlpjd0lybXMwOFJiTlRHcGowY2hh?=
 =?utf-8?B?ZWYxUHNTNzhSTUVqRjY5NXgxMkV5N3k0NWlwU0dZazhJWDgzd0hsYUdxK3p2?=
 =?utf-8?B?eFRQNlEvOFFpa0dHelpUVnFsRm5YMVNucmVoV2poZG9wQUhkVWZUUkx4b3I4?=
 =?utf-8?B?WGc2Y0NEdStNSXdjTHdSdG1ZdWM1VWpsbzA4VXhnT1R0SVk5eGN4bHRqbzJI?=
 =?utf-8?B?Ly9LSjFhSStKZmZkZU0rekZTSUJZc3NzKzNMUnhERmNGTFhWUGhERGtGdHU1?=
 =?utf-8?B?TUNmRmhsNmlTVUZmRjc2cHcxRzJrQkE1NkRJQ0NSTE4raks0cUZFYUJmNlFY?=
 =?utf-8?B?UkZBR2ZuYTBHaDhkam1hMCs3ZkhqNjVDMjdkUGJPY05xWDJRSkVscWVmY2dt?=
 =?utf-8?B?MDNRNkp3WjgzY1NITndOSW84VmxNRlBKZFRlWk41MExsU3JuTmVvK3NyR01m?=
 =?utf-8?Q?qSqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3E2c3gxYWE3aEliZEtaMHlOZmlqSnhYT0c4VTVHTS9vbU9RWldiWitoZXlI?=
 =?utf-8?B?MlZURVpoVHNYczN4ZDY2YmxZL0RJc0l0SEJvQTFwNVpSUmJmS0tHSzJmZTA3?=
 =?utf-8?B?bXpPTDE4cEFocUYyazlCN0tlNk5TaFpZa01OdW9iZDJXT2VSSmNoZG5nb2NV?=
 =?utf-8?B?Y3NHZVlZMWU4TXBibmpjZU5XRVFxbzdnYTU5cDRjaGRhYy9RZjhLZFNjWGpH?=
 =?utf-8?B?dzlKNWxaUmUzZC9xYWttRjB0Y01yeUU0dEtJejNwa0Q5L1JIaVU2SExocjRP?=
 =?utf-8?B?MjZuTEJSWnRUckpzL0RvZFVIcHFKdHNlcXZnZUdHWFRkbThvNUl6MmFEcFhB?=
 =?utf-8?B?czZyRytpRFBkUWVnVWVOb3VlK3ZXTjVkd1hUNUcyY25VaUh6aU1TeENaNzN1?=
 =?utf-8?B?TllpTFd2ckRJT0Y2VVR1ajJ6OW1ELzdtaXpOYXZVM3JXbExZN2FhM211QWJH?=
 =?utf-8?B?eXIrdXpxR1hscFk3cGg2N1lEb2ZraSsvcUVadnBsRUVGM0VQZmJHYWF0OFpr?=
 =?utf-8?B?a1VObWdCNzhmMEhFVGZ5SUE0cHowUUVJdjBxbHVwZVd0REF0RTV5dmRkVDU1?=
 =?utf-8?B?Rk1DQWs3TEFqVi9JWG4vdEw3amZlQWZKajIxcDZ0c1VOMGRHdWNBRkZ6MGVj?=
 =?utf-8?B?TFFvSFlBM0xEbFpMa3M1MlpnU0NadTlLSDB3SFJBdXcwdUdiSi9qb3BRdHVl?=
 =?utf-8?B?ckQySEthRCtMcVU2eGlhU04vOVJ6Q3pIRG1kMUt5QWp3VEp0WGhUT1V2ZGdv?=
 =?utf-8?B?RlV0Nmo0QVZMUTU0S3IxR1NqQ2lqVDZvOVhyQ0pCTjR3cW5Ib2N3SnNHVmFm?=
 =?utf-8?B?UExBZnRvMllmSVFXZ0kwNDQxWmdNekFzTzlDZnN5cmF6NGhab3FyNEZtUmJ5?=
 =?utf-8?B?K09zREszS3plY2R3Um42M245R3ZNeWNUdENROUpad2MrcGpmWFhUOXNFdXdz?=
 =?utf-8?B?NXpPa242SXlXRWI1K1UzVkRzemtzOFQ0aURDei9nalkzLy9wd0ttTkF1MUgy?=
 =?utf-8?B?UCtFMzVEc2dBZ2dTaThkaVpWRDFZQ2FMd3k4RWpBbmtmaU9Gc2xXSFhoRzNR?=
 =?utf-8?B?RGxaMytaeng4amgxVCsydENWd3c3SXlEU2c3a1lpWlB1NnRrUEoySE0wc0lD?=
 =?utf-8?B?cEduaGtaTnFxaUNIend0OFNoUXBRMDZEaGVrL2Z5a2s2UHY3b2pWQkpZOHBs?=
 =?utf-8?B?VUM5NXFwa1lXMVJTWTB0Q21rZE5kei9ldWFGT0g3bVpMc1FLZGZqNnFiZWVB?=
 =?utf-8?B?czhaU3FzQ3Rtd1YrZ1hHdmwxY2JVdm4rZHViV1ZHRisvQ2Vrb3VJei9OYmt0?=
 =?utf-8?B?KzlaNjM5TU1kNTN1TlRabWt1VTdzYjBxYkRxR2grcDR6L0xnOHg2a21OSmtU?=
 =?utf-8?B?TWovMGw2Z0d6SEFTRVhFNUtvZEhZY1NsMVowUXhDaUJhNDdaSGVvR2g2QUxh?=
 =?utf-8?B?b2hBbDU0cWcxRW5oVTVOTjhFRndoYlU5NDVHL09qZmo5cWpDNzRXWHJrWjFE?=
 =?utf-8?B?NmdHMURWY3I3Mi9hRFBNU2o2b3BDNy9KWnA0cmdTNGVYT00vWFZuRWYvVU1I?=
 =?utf-8?B?VG1DQ2hUU0xjNnAyWUhxR25nWEN0ME1BTXlweDF6WXlvK1RYcjNhNGNuVTRS?=
 =?utf-8?B?S0FSeWRwZ3hYNGhWUGd4NFp5V1hWOGFSMXlBTFhKNXpEaWdYYSt6ckNXRDIy?=
 =?utf-8?B?VWFpYmIyTnl4YWZBSXZnai96TnUyREpacG9EYmlaSzZLbm9oZGc2Z3M1V00y?=
 =?utf-8?B?OGtzOWtNdE4rc1R4cytRM2ZGN0tEalhxanlTNWdmNFgyWmRkUnBYdlorMUJD?=
 =?utf-8?B?MWhwRVhRYlBGUUNlVnlVOExFcE1xNHlDeHVGWXVHWkdGY2tuZmxOTmo2VGNi?=
 =?utf-8?B?MC81UVU3aTNNQUNlMnRMZ2Jib3VOR2pCUDEyVzBxRENTSzlKS2Fnb2hBUldX?=
 =?utf-8?B?clJNL3lBb01kN0tvVDdmSlY5dTlkSlVKbFFJVjdEYURqSHRWaFJFOTUrTU9L?=
 =?utf-8?B?Y0czN3dwbXI5ZWh3a2d6RTRpM2tla0dJL09HaXY5enU0bUVPNE1WQzZxQU1p?=
 =?utf-8?B?dmkvZlBETmVQdWNDdEdMdnRwejdSWjZOakNoVlRKeFRyeXZ5aU01TzB3NXlp?=
 =?utf-8?B?MkF6YTNiV0lDaW1iRVZZMjVMMEtHSzVYRkRlSUYyMGpZaDFMb0ZGeFp0S0I0?=
 =?utf-8?B?QklPenMza0V6TmtxZ2UrZlhYK0JqRGZPN0t0dWt5ZEtGbXJuTlp4SnIwRENX?=
 =?utf-8?B?UCtyV0UzVngrbC9Lelc3NTJaOENjbnNIeS9hdVBMYjhFbnFWV3JYeVhQQVRJ?=
 =?utf-8?B?Q0pCSnN6SU85dExHRFZBWmc3d0dmVFl0RnBUZGVJWHIrNXpSYjdFQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eed00e2-a952-4f19-bc5f-08de5873e802
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:33:17.2441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTNAMznJDrafVBxebFBD2AGZOuQ6/CPKiOl3oSzwXgOWLKrr/OUa8yu63QCTNrmfBF1EApUMMs4cwCMKaAlhAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8300
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
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16078-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: DCB3D4D08A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/1/26 07:04, Zi Yan wrote:
> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
> 
>> Currently when creating these device private struct pages, the first
>> step is to use request_free_mem_region() to get a range of physical
>> address space large enough to represent the devices memory. This
>> allocated physical address range is then remapped as device private
>> memory using memremap_pages().
>>
>> Needing allocation of physical address space has some problems:
>>
>>    1) There may be insufficient physical address space to represent the
>>       device memory. KASLR reducing the physical address space and VM
>>       configurations with limited physical address space increase the
>>       likelihood of hitting this especially as device memory increases. This
>>       has been observed to prevent device private from being initialized.
>>
>>    2) Attempting to add the device private pages to the linear map at
>>       addresses beyond the actual physical memory causes issues on
>>       architectures like aarch64 meaning the feature does not work there.
>>
>> Instead of using the physical address space, introduce a device private
>> address space and allocate devices regions from there to represent the
>> device private pages.
>>
>> Introduce a new interface memremap_device_private_pagemap() that
>> allocates a requested amount of device private address space and creates
>> the necessary device private pages.
>>
>> To support this new interface, struct dev_pagemap needs some changes:
>>
>>    - Add a new dev_pagemap::nr_pages field as an input parameter.
>>    - Add a new dev_pagemap::pages array to store the device
>>      private pages.
>>
>> When using memremap_device_private_pagemap(), rather then passing in
>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>> private range that is reserved is returned in dev_pagemap::range.
>>
>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
>> MEMORY_DEVICE_PRIVATE.
>>
>> Represent this device private address space using a new
>> device_private_pgmap_tree maple tree. This tree maps a given device
>> private address to a struct dev_pagemap, where a specific device private
>> page may then be looked up in that dev_pagemap::pages array.
>>
>> Device private address space can be reclaimed and the assoicated device
>> private pages freed using the corresponding new
>> memunmap_device_private_pagemap() interface.
>>
>> Because the device private pages now live outside the physical address
>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>> et al. are no longer meaningful.
>>
>> Introduce helpers:
>>
>>    - device_private_page_to_offset()
>>    - device_private_folio_to_offset()
>>
>> to take a given device private page / folio and return its offset within
>> the device private address space.
>>
>> Update the places where we previously converted a device private page to
>> a PFN to use these new helpers. When we encounter a device private
>> offset, instead of looking up its page within the pagemap use
>> device_private_offset_to_page() instead.
>>
>> Update the existing users:
>>
>>   - lib/test_hmm.c
>>   - ppc ultravisor
>>   - drm/amd/amdkfd
>>   - gpu/drm/xe
>>   - gpu/drm/nouveau
>>
>> to use the new memremap_device_private_pagemap() interface.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>>
>> NOTE: The updates to the existing drivers have only been compile tested.
>> I'll need some help in testing these drivers.
>>
>> v1:
>> - Include NUMA node paramater for memremap_device_private_pagemap()
>> - Add devm_memremap_device_private_pagemap() and friends
>> - Update existing users of memremap_pages():
>>      - ppc ultravisor
>>      - drm/amd/amdkfd
>>      - gpu/drm/xe
>>      - gpu/drm/nouveau
>> - Update for HMM huge page support
>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>>
>> v2:
>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
>> ---
>>   Documentation/mm/hmm.rst                 |  11 +-
>>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>   drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>   include/linux/hmm.h                      |   3 +
>>   include/linux/leafops.h                  |  16 +-
>>   include/linux/memremap.h                 |  64 +++++++-
>>   include/linux/migrate.h                  |   6 +-
>>   include/linux/mm.h                       |   2 +
>>   include/linux/rmap.h                     |   5 +-
>>   include/linux/swapops.h                  |  10 +-
>>   lib/test_hmm.c                           |  69 ++++----
>>   mm/debug.c                               |   9 +-
>>   mm/memremap.c                            | 193 ++++++++++++++++++-----
>>   mm/mm_init.c                             |   8 +-
>>   mm/page_vma_mapped.c                     |  19 ++-
>>   mm/rmap.c                                |  43 +++--
>>   mm/util.c                                |   5 +-
>>   19 files changed, 391 insertions(+), 199 deletions(-)
>>
> <snip>
> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index e65329e1969f..b36599ab41ba 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
>>    */
>>   static inline unsigned long folio_pfn(const struct folio *folio)
>>   {
>> +	VM_BUG_ON(folio_is_device_private(folio));
> 
> Please use VM_WARN_ON instead.

ack.

> 
>> +
>>   	return page_to_pfn(&folio->page);
>>   }
>>
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index 57c63b6a8f65..c1561a92864f 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>   static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>   {
>>   	if (folio_is_device_private(folio))
>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>   		       PVMW_PFN_DEVICE_PRIVATE;
>>
>>   	return page_vma_walk_pfn(folio_pfn(folio));
>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>
>>   static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>>   {
>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>> +
>>   	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>   }
> 
> <snip>
> 
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index 96c525785d78..141fe5abd33f 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>   static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   {
>>   	unsigned long pfn;
>> +	bool device_private = false;
>>   	pte_t ptent = ptep_get(pvmw->pte);
>>
>>   	if (pvmw->flags & PVMW_MIGRATION) {
>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   		if (!softleaf_is_migration(entry))
>>   			return false;
>>
>> +		if (softleaf_is_migration_device_private(entry))
>> +			device_private = true;
>> +
>>   		pfn = softleaf_to_pfn(entry);
>>   	} else if (pte_present(ptent)) {
>>   		pfn = pte_pfn(ptent);
>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   			return false;
>>
>>   		pfn = softleaf_to_pfn(entry);
>> +
>> +		if (softleaf_is_device_private(entry))
>> +			device_private = true;
>>   	}
>>
>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>> +		return false;
>> +
>>   	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>   		return false;
>>   	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   }
>>
>>   /* Returns true if the two ranges overlap.  Careful to not overflow. */
>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>   {
>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>> +		return false;
>> +
>>   	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>   		return false;
>>   	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>
>>   				if (!softleaf_is_migration(entry) ||
>>   				    !check_pmd(softleaf_to_pfn(entry),
>> +					       softleaf_is_device_private(entry) ||
>> +					       softleaf_is_migration_device_private(entry),
>>   					       pvmw))
>>   					return not_found(pvmw);
>>   				return true;
>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>   			if (likely(pmd_trans_huge(pmde))) {
>>   				if (pvmw->flags & PVMW_MIGRATION)
>>   					return not_found(pvmw);
>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>   					return not_found(pvmw);
>>   				return true;
>>   			}
> 
> It seems to me that you can add a new flag like “bool is_device_private” to
> indicate whether pfn is a device private index instead of pfn without
> manipulating pvmw->pfn itself.

We could do it like that, however my concern with using a new param was that
storing this info seperately might make it easier to misuse a device private
index as a regular pfn.

It seemed like it could be easy to overlook both when creating the pvmw and
then when accessing the pfn.


Thanks,
Jordan.

> 
> Best Regards,
> Yan, Zi


