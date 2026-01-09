Return-Path: <linuxppc-dev+bounces-15441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B78D0695D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 01:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnMQS4Dk9z2yFg;
	Fri, 09 Jan 2026 11:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.200.59 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767916928;
	cv=pass; b=NLVM0mJRL6alSWipWOBt0EQQjavaAP42tjzuH96v4hEnr3C10gV8Rjh/+LlnY939o+ThGdmeO36eBhX1KdKTL2zogY23frqy3OL0dNwZGUnrD1C7djch5MP1vpK9/M/v4kIdMmG7u4ZNQjOeEaVSBzbwKdEC6Lwrmq8kRgc1GQFFib55SHNTcMNwieqfoxB21T7fm4qJ8QiR9/q/4htUlwHPHNO4u4u+cYRwAGT/iFYUSXU0raAWsTawMLP9TLYH9UcxM1wShPfbunc7MidctsjOrtqBcW0yFFPpnHcuvYeGq2Fo/luqSM842WEq49C6ArMznh8HzHVy5hz1zgaQ9g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767916928; c=relaxed/relaxed;
	bh=GkJXu03MJxVbuy7YLcS2KiCyGPqrSwEE5Yx0XEdHM6w=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZMscTLJ04rFBv3BxhkuD+E6DfG1Louhoa5RTMZ9kf+tkPTAFQiTv/RAIavV8M8eEmlyNFb4lMmNAXZmp7JVt4H1O+dHZiRHPXzbJbenIdgq2k+NLsYOE6Lizvt0Gq6ND17f95SCNE3LoOIRaflD3kcCTjkoDWRUzirvsi+dvFymnI632GDeWeBFFtpqqyK1Ddf4C9kVtVXvxKvTcMb9VeZJ+oH8nViKMB7Ztc6k0mPuGRKilGBmGMUCudzXyoJmG93uvznFXpa/Tg70KV7sa6Cw+T2JJCdZAGfUl8g4nSoj/U/BlFB4rXXrcHUXNWwZftknZsOAoUPkUJaaA0axzFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p/5eIJbc; dkim-atps=neutral; spf=pass (client-ip=40.107.200.59; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p/5eIJbc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.200.59; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnMQR2vCQz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 11:02:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5PHlpNSzpf3WO/5MbdX4RCyGMTIyuWVR6C2hwsl6ADPCksAwPx04l+A7lHRAXLVsYDxWAx5/GZAMXlQnMoZtfc74QFw3vSSlTUhxTwHHkebhaxGPVeGc9m49BIFoqdmcq12mJD102yaN+ganIGDrqUs5mPQ7vH9QPEYuSLYN/l1cnTyJmpSNE4PDKXnyt/uxUrMAwfT1Rt9AbfTi6Ghf3ysJ8QJ7DcIFSt+saCCU62FNHmWndEjQS1KL4OAf9tkcWEeOAsG9wK7WyhepFqsNWayqdtqjqBQR0/SuxwEiXc1BwgdHWcQZS93CPWw4+PpOST5pUIyoTsbet+9n+825A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkJXu03MJxVbuy7YLcS2KiCyGPqrSwEE5Yx0XEdHM6w=;
 b=aIqO5bUXIm4Sx6fKqJqSul4wEhi5FWPteixkGTV8c8xKFBzmwdWcHmkfuNLu3TooXavBpfjsgsWOn/2YHP7+7Q0Anq5s+2wPb+B3ITg0AmHDFNC+6j0q3XI0Y6siRuYvNNDBqKV2n8OWWIFMy/TUEriVaZAmAX/egFkUqx2wwmsBlDHmn2AE62zrvd1Txg9/aIHXiBg/wQLxCiWoVZ/5/3y4H5zy8CkJx87igSVfW+i22QQNU45viY/DPB5a4jt68OiscZm5bu7SwjY4VfKdyXz//nM/05kwoaazfcj7eNqtoBPyvfdMJ4hfFGWZ7+x+AbUaMPX673osLzaW241dOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkJXu03MJxVbuy7YLcS2KiCyGPqrSwEE5Yx0XEdHM6w=;
 b=p/5eIJbcTg2eaiDqPMFY0/cP7wwFGyR93OKIcS3T7iRfLHwHEqiuQMv1bq6T6AKtgpmuNI70aahaH2yIR4D0U6B2rEHMR1f2SMNsgw2vT/XXm560goazUIhHOG8Y5EkHQK1kDTxOcA6VUW+pT1+ByimYeBONX5xX/DgsqvnDsm6V+YFRWMvsxXfsuNxTKE5nfdtJARMFIKTMx6H2dEdrl69HNXEbfxp0s/3UkzQKd/06H/ZsEh1pmKVu5gP1ERFG2qrgObrFi4zndWZ4nJ15X+IkEJTQQuvM3XB0ekNy4BVqYNy+4xzvvr2I/iAfsO+OoQ1SIXumzktpNg68c5QSTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 00:01:24 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 00:01:23 +0000
Message-ID: <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
Date: Fri, 9 Jan 2026 11:01:13 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
From: Jordan Niethe <jniethe@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
 <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
Content-Language: en-US
In-Reply-To: <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0011.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::20) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 74adfc7e-e766-4fed-5751-08de4f1239c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHRnL2loSjdzK2NYeTBiTTgvWW9LVE5MQ0dkbnlUM2RZZjc1YkJWU20wMm1I?=
 =?utf-8?B?K2N1UmlVK0JjSFk2bGwvcnA2OUVFM2FLZEFVaGdOeUlxZThlY1Q5ZlJuQ1cx?=
 =?utf-8?B?cjJrYmxHUWREbzcxTEhmVGhLODFtaEdySXRxOHcrdlQ1QTF3MWgrN2NzWmtn?=
 =?utf-8?B?dnRoT3E5bUFkWWlaWC93MENmUHdPNEhFeXh6d3Zud0pwUDAyNzRSK2tFTkxR?=
 =?utf-8?B?dUd6RklFV3Nia0l3MXUwMWtTeEh2SFRNUVprNWV3M0Z5ckR4cHYxNmZPMlNX?=
 =?utf-8?B?a2JUN3J2QXRHdWxjRGhVa21FcW5KSXRhVnYzL2dhdjhIMk50YWt0d0VtRHNH?=
 =?utf-8?B?NWN2bWIwa3JBSXJ3UGdtYmRPMCtGeXVKRjUwZVA3Qm96cmhjaGpaVnJVSWps?=
 =?utf-8?B?TUVQcGc2NSsydk9VOVpIUTFKano0YktSUnJ5SUhSM1hYTmZaTW9EN0dMa29H?=
 =?utf-8?B?UnAzOWcvMnpCYlY0a2NDWTVCV2JjR0dRRjdJVjA5alpqLzVpWXE1bDhLNWU0?=
 =?utf-8?B?OGIwK0pwQ1B1MEZLUmduampSUEF5ZlhlYjUxdnF3K2VBTnFoUkpQbVN6UFpJ?=
 =?utf-8?B?a3RxYU9SOStOS1ZnRTFrUDRYT3pYVE1Ea09PVngvcEJ0V3R1SnpKTnB1UTF3?=
 =?utf-8?B?dHQ2SkhIWWVaTlBIbll4SWpHNkllWXhEMWVNa3FjVWd6ZTBuMm1ka3RBMGgr?=
 =?utf-8?B?QVVNeTZJNjNYY2puRUZsOWQ2M0FZeHpRaWpUMGRUUlB5eitudjZXb0pwbFZn?=
 =?utf-8?B?UnA2RHZSRmNKN3Z1S3ZBeFNVYjQ3Uk45bmt3YVRnYzEyMzlPcHlLeGRJcEQ1?=
 =?utf-8?B?WFd2V0V4d0dsaHFDUSsrTENpL1VKSEhmN0pSaGp4Z00yY1NxL0c0UUI5SjBo?=
 =?utf-8?B?WXdNZEIyUXp2RllTZFo0MzVmZGZyYnNiY0NSNkdtVVhzNWRnOWc4TW83RjFN?=
 =?utf-8?B?bEsvS0lZaG12bzhzd2xjV0NhMi8vWmhwZ0t4dW00R1RtTUdTN0JaOHFoQ0Nw?=
 =?utf-8?B?d094dGZYd3B2TWVWV3UyeGIxcmx4WU8yTVFaei9vVUZFc0xQV3haY01DV0lX?=
 =?utf-8?B?UjBnbUloSGtaWlVxVDR5RVdxQ3pHV01mRldPT3M0NkxyODl5VXlxTGp3R2Qw?=
 =?utf-8?B?cTFQUHdpOTdsZEJZQUpObmVCaEVaWGZVRFpISUR4Tnd0L1dneHNYSDNxaGpZ?=
 =?utf-8?B?WENtb1hRVDVBZy9pUHk0RFlyZUdNS21ZRzFuUTNIRkQ1bjIrQVNFamZQTDlv?=
 =?utf-8?B?RUtBQkY3SENXbDNYdW9XMWFHSEMvcUYwbXBNN0N6b3dhUmpybkovejJjdU5O?=
 =?utf-8?B?TmtMYjJKdUNhaXpGZzhaNGZ6RGtxaFFCeGVtVTUvcFNTQzRsekxCOTNPalFt?=
 =?utf-8?B?R2JsTTNMdy9PajhLQTZuOXM5SGdKZW1XTGNJd0dDck4vUndrSFVPc3ZYMnpp?=
 =?utf-8?B?UENLc0d0a1hTeENvc0pHaXhJV3VBaDMrQVI5dWdNdXpZdXN3VUM0ZHdPaGxy?=
 =?utf-8?B?dlJsUGhXcGkrOW5SYi9rY3VraGFkSzBMdU1iRVNEd1J5ZjY5YkllYlFDOWI2?=
 =?utf-8?B?YnJrbEplb1R3V3l5M0dsbE5mMFZuRGdCVFc0Y0RMbDFtZ0ZyMkY0cDB0bHhm?=
 =?utf-8?B?WndWZjEyVlRRK29JcVpJeVhqZTcwTnluQ3ZET3B3bklWbGJwNGxGTnYreGVO?=
 =?utf-8?B?Y3c5WTdyTmJxTzhJTjdDWWptQ1lQWk9lbzZRVzVVcmVSSFI2eW1taWNjcVZP?=
 =?utf-8?B?R3A1N09oNkZTK1JlYmlYMjNMMkcxeS93WGZxbHBNcy9jS2hqbFlKaExuTU9z?=
 =?utf-8?B?UWI2Yk9FQk5EZzZxdzl1d0FhanZEZ2dCaFdJb1NoUEFEQlF5WFBtZEVyekhG?=
 =?utf-8?B?S2ZvUlAveDYxMkYwcmhHVDg1ZUpkS0FLNXNPUktPdFMrWFQxck5pNm1lODAx?=
 =?utf-8?Q?HuL4PTS08WqB7xIaccJJ4KmpEhwXvh7p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVErdnhiVmVtZmhYcjd6eHJLNEZWOVRSamJiWEJ5Mk1nY1N4Q1M2ckRnN0dz?=
 =?utf-8?B?QWV5RDFHUWFFMXczU3BSblVMYU5ZR1JiYzJKeHFuRStaNHFtWXhLayszTkc1?=
 =?utf-8?B?emJiYncrblJwMC9iNDNHaVI2bXZIQ09pVXYyTHgxanE3YVN6bHQ5dC9wdndX?=
 =?utf-8?B?TWhHeWxkVThEVDBmSHZha1JQZmZzakZLRlkvTk9mV1VjbzVQV2p6SFhzYkFK?=
 =?utf-8?B?eWlhUkNja0VIUXh0amRlajhUbWM0QUlwRVZRVGhYRENUTnRxQ25Ec2YzeUlB?=
 =?utf-8?B?QkovSWRXSzR2TVFEeXlkMkFvVDVtNVNDNFVJTDVTK3FMMjk0WGRBQUNtRnR3?=
 =?utf-8?B?VU5KK0ZrMVUrWUFobnl1KzQ3c21ZOTdTeVdHb2dOOGsxZU9BbXVUMTR0MlRO?=
 =?utf-8?B?ZnN5eiswREE0SU8xQ0dkdzlDQzNkc004bUZOOWwzS2t1VkFtSXhFTjluS2pD?=
 =?utf-8?B?TW9PejRrWmNEWkpia0F6TzR5UmRBbCtWR2FUeVdVWjVDbkZsWkFQOVh2b1pG?=
 =?utf-8?B?ckkwRmhrWS9MTWk5ZVUydXhYTlZIV0VKZlEzK25Zd3YvWjhjTGVYRWNFQ1U2?=
 =?utf-8?B?azRJNCtKQ2JXL2haSFRSempvaHU3WGErQkozSG16TWNMdm4vRlRpWnZSZDNh?=
 =?utf-8?B?ZW5lS0YwRlRqYmZVS1VOeHMxdERZTERRQm9va1VIYm9SaVU0MG1nNWpaaUJN?=
 =?utf-8?B?ekYraTlENU9UdStHZ3VMY09oWnVxcCtucWYxZnZ5TWo3UWZWTEYyUGttbVdv?=
 =?utf-8?B?cllMcTlxM0pvdm1Zc25ENndZVHdWZFlsNFVscG9TbXlzb2l5Vy9mQU1LRGd1?=
 =?utf-8?B?LzM1bnREdlFJMnJucHF3VHVNTWsxMlc0dUZVc0psUmpLVjVxYTZmakM2REtp?=
 =?utf-8?B?ejF4cU1xMWVXMThUOTJ6NHBBR253aGhKVGVwbDlmQmd6cTlJWHJ2R0pPbkNH?=
 =?utf-8?B?ODBlMWVlOWd5WFNzeXI5RUt6aTl5dzh2bHJCaWRiR21RSWpSS0g0YmN3U25l?=
 =?utf-8?B?MzB6S0g2ZFFWcVd5VEhlY28ycGdkY1BqMkl6eHJEVmN0N2puck16SlZMWWdJ?=
 =?utf-8?B?TUw2QUJHUmlObjJFVmdHdTRHM3pnV09DTDNNT0lOTG53akx4L0dPbjQ0N1N0?=
 =?utf-8?B?VXUwTWluNjRIYlZNSVErUWxvRmZJdnN6SExEdmRhbUhBbUhYNytXZkxDMEln?=
 =?utf-8?B?c3JMOVN3MlY4NVFGTzd2V0R3RHdSZVBsWDQ1Z1c4WXliL0Jhb1MxeDZYdmxH?=
 =?utf-8?B?b0xub2lJRndoTjVTSFpoS2ZHdW5iTk82OGM1aEJXRTZlYjBzNUhENWNNL2Rq?=
 =?utf-8?B?V3lBQlhYTWdtMjIzTDZtejYwdU5SWFNrQTVJZzNhRTFWV0xabldqOHBobXF6?=
 =?utf-8?B?ZWNwUXVsOEVhdUhlVzRkdEtHMFMxdGNPMkNOU2M5eTNMdFJ3dFBjMUhhN2lD?=
 =?utf-8?B?VjhDMzVEQ21nVFI2ajlYbVFuOGpodmpYeUdIemxWNDNVcWVRdDIzV1c0NWd2?=
 =?utf-8?B?TGV3L0dSVGNINGFvNlpRTkRXT1FvL2RXYk05dTBicEVWWDdKcFhLZHFzaDhE?=
 =?utf-8?B?UkxwUEdrSlZzQk16VjAzbEViRXB4by9YTWgxeWpydzI4TnBZYmpWcVMvV0g0?=
 =?utf-8?B?NWhOQS9ORjUxV0daOTdDc3NzRGVYZDRlbTl3UUlZZTBnbVVRMEo5S054MGI2?=
 =?utf-8?B?b3Uwc3hKSFR5Wng2K2wwSlJYTVluUVErVHM4SWtwaUxSNEhoTFhOWDRRODRD?=
 =?utf-8?B?eWlSK2NzdUdneHZVUVlrcGlSbzRaQWNmaU1ObEx2UUc0RGZwdkRrL1N1bkRP?=
 =?utf-8?B?NjBXbDFhSkVIN2wyUVVmalIxRStaeWNRbGVFTGY0Y1gwM2RBL1FMQXNUUkpQ?=
 =?utf-8?B?MmE4eW81UjRCSWVqY2xvS2xlbExnN0FvczlqNmpWeFVGblpEZWowZUtZVENl?=
 =?utf-8?B?NWt4YXJ0VjJBdFc4RCs3WGg5UExQZnFETktBTHVqS2RSWng4c1R4VnJtRnZD?=
 =?utf-8?B?dm5pT09WVnhNT3JSbkZ3dFRuWVc0Wnh0NmZpcUJtbzdtTk9Sb002TUlFK0tI?=
 =?utf-8?B?NURWVi8zWU0rL1hBTld6N3ZlT1VDY2pNZXpKZk5SRUtqVksrWjNNd3IrVnVi?=
 =?utf-8?B?b0JrQ2NLdUh5QkY4YWlodjR5bmpZUlg5ZXpHQXdYcDhZSmJEVG05VVA3a05K?=
 =?utf-8?B?Z3FSMGd4QzRaVExUSVZCejFQc3pIbURlbm9MTlQyTi8zUGlkemg2V0Z2Wkli?=
 =?utf-8?B?bllkWE9IMWhpbXhhWjY3TjFuaXNwSjkzWHh1MHp4YWRJbjNvaGd6dW11S0tC?=
 =?utf-8?B?bFptSm5ONzBGMXZXN3NWWCs0VXNyWlJTL3JVMm9wMDMxNjV4ZUhJZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74adfc7e-e766-4fed-5751-08de4f1239c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 00:01:23.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEjSr86M0AoaEzGgt5YZaYWi5FQZruUTddHVW/A83pki3vm99b6IHzirHUZbh2cXE+0+i1BKTQYWWTOQqrflvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 8/1/26 16:42, Jordan Niethe wrote:
> Hi,
> 
> On 8/1/26 13:25, Jordan Niethe wrote:
>> Hi,
>>
>> On 8/1/26 05:36, Matthew Brost wrote:
>>>
>>> Thanks for the series. For some reason Intel's CI couldn't apply this
>>> series to drm-tip to get results [1]. I'll manually apply this and 
>>> run all
>>> our SVM tests and get back you on results + review the changes here. For
>>> future reference if you want to use our CI system, the series must apply
>>> to drm-tip, feel free to rebase this series and just send to intel-xe
>>> list if you want CI 
>>
>> Thanks, I'll rebase on drm-tip and send to the intel-xe list.
> 
> For reference the rebase on drm-tip on the intel-xe list:
> 
> https://patchwork.freedesktop.org/series/159738/
> 
> Will watch the CI results.

The series causes some failures in the intel-xe tests:
https://patchwork.freedesktop.org/series/159738/#rev4

Working through the failures now.

Thanks,
Jordan.

> 
> Thanks,
> Jordan.
> 
>>
>> Jordan.
>>
>>>
>>> I was also wondering if Nvidia could help review one our core MM patches
>>> [2] which is gating enabling 2M device pages too?
>>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/series/159738/
>>> [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
>>
>>
> 


