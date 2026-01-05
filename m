Return-Path: <linuxppc-dev+bounces-15204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C5CF1AE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 03:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkzVt3XNsz2yF1;
	Mon, 05 Jan 2026 13:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.67 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767581862;
	cv=pass; b=IW0/HlGNtFn+hv4U3BFJkXbr04m0Qv4mC6UlQUlg/VXCNpyN59EEdsGCV6dmmAYTJUFgkuoY5i5faqO8bZ7fzlKlyj1tugR/aidbHYvaDzd1Hssqn0Yp+wliQbgBP4paHa9wMY2X/aGPCJUSX57RWbv4R6/Fu9Ep5CO150Dn0rGBfdz/vdPRnvjSXmJUTlzm1x7f9ftRSFbPLLmHRhnIHCn3XWjXlc18E3nQo6uxTyhIKl7eH63kmOpePfpTgWgmZywtE+YxcOD1wPw46dEQivxYiZ6r87hSu+bjj93us6i4m6Efl3q1qH/OoVwHC21glIltHIOrw39Rj/NOHIpC1w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767581862; c=relaxed/relaxed;
	bh=Nyy48whnGjacWokjmDk6PQCzcsbUdfO8CvZVzfVDOk8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DrEEr3ey7xuZq3SCkgbwGLb2oLnJC4Gy8J/sqfuc/VEG6FhPq3y4kH9yLm4RwoFHF/xhNNfgfgrAt4DJjg/o1QHM18sHvYDeJ2D5FlF3wbA3mve+nhfU8jDSfsaFzfD/hOv5diHZa0lT29oMlUJS87CWcFY2XhkU3qEzJ+Z/pr9GkuRCH34TajTzFAvj6e2sO60c33sNc7H3PKrnzDV/U4TJrsTfLryi9HKZBIgaOwkRF6+BbRM3opIVJK+l2Hxad8TnVdCLXTMtGGWo52gS0osLHSu3EAA52rqSE4Tgqhs3CVpdlnHU/7EHkJkAYDcZEG9bh6E8f3PXdV13YYYSwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EOf23MSt; dkim-atps=neutral; spf=pass (client-ip=52.101.193.67; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EOf23MSt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.193.67; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010067.outbound.protection.outlook.com [52.101.193.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkzVq5zK0z2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 13:57:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wckCI63R6/9xVmC/6XGBT3dykx3MIgS1VjY/2Xv679lHfFZxeLXXL75iLlF7jU2nOgAfKlGnpnrRIpFdunCyA+PBH2CYBPVX+YI9JXYngDNrWRLXZWg7/Fy1JWAPGYX5GjOK/RDpXS55NaNVsoSct/PZTHwXnWuKDs9W2AIz1YH4fVVSjOLU7D8dgd2k9dWIuWdqB95/UZQZ9iTy+EyB6ShRwgoCA1qYyDc60i9ZDRqHUrg/lojo87e2MKSb4c7sT4HHaX0+tKxpHw60lrbrvbumPOmkihl2YiSk7bx4Ys+3kxb1AbuaoO1OCV2szR19Sc2xtypdQ7ZKilwrJ3/rJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nyy48whnGjacWokjmDk6PQCzcsbUdfO8CvZVzfVDOk8=;
 b=YKocyFCz4WUV/+kuCxjhBw0u76yO7iBwFq1eBEDl0DeabVqylz+e4cdY6pBsiOgXRoDLTs8sFuJV6kRkREBXFLkqcQOBhjZ5sL5zGvHsSxdJFr4ja1eZ/rPf9dErVd1cIzhE6eGvbJoM4WwURmy+KqKXh8AB7rJFgWPWJI37D5y/PokTibnovKx6qMbM+q0/Skr5XpVVbZ6u87h4Peq1kH/yzHZCLDV14t9xRuh4U95FiTUeertYBa97FRA8y+bb/PnBOkhZ7RVVQLGIklINNV7q1ZaHg+IhS27SV2y1eZ10/i+Y0kPPiRdjtN4r9q2BCxrZJSOHakwMWVhr8kBbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nyy48whnGjacWokjmDk6PQCzcsbUdfO8CvZVzfVDOk8=;
 b=EOf23MStmEnlNVl+QNVCsA6rFiPvW1OP5ZFqxW7XGOvWoAH59C+HyHlctAIuF1fHnLM3zYF5psZgTxD8zt4CCz426+8YLmi0sa4NVhDZPXa2qccSzs11ol9/Ok4cvsWOEiUgIcPTUVGXzM93HQIJIBpmR+fcDDCKisTG1l15e7ZPfD/30PrCAK3EGfGPrDm7PZ69VQxvNU2jQGyTOISBy/jmy1UaXKaGlfMZ5OvMMknUJLQWj7t0lGmZ8qtCpyowek2fxmZMPSRFbdOOif/1zZu1oC1o7vBVFztKif092w8Ua4hSSMXj0M+xAmerNRh0b6LDQUXb+fwuZX0efFLOKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 02:56:55 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 02:56:55 +0000
Message-ID: <ca992e0c-2299-47cb-8558-103db426d9b9@nvidia.com>
Date: Mon, 5 Jan 2026 13:56:47 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] mm: Add a new swap type for migration entries of
 device private pages
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-5-jniethe@nvidia.com>
 <knd4e43pwy3stoj5ydld4fl4kjzzjnsod5kpucnnhzgbs5hrmv@fxrcyzo7e72x>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <knd4e43pwy3stoj5ydld4fl4kjzzjnsod5kpucnnhzgbs5hrmv@fxrcyzo7e72x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c317940-facb-4e8e-4178-08de4c0615e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1gvV29CamJwaDBEbnBlVWtpRHUrcXo1U2c4K0RsUUQ0eWw4dER3N2VUbkpu?=
 =?utf-8?B?U2hEQUlVWkpqbzliR3pTZGltTkVJQm5MZHkxc2wyeDNpK29jY3ltTUF4Z1Fh?=
 =?utf-8?B?WERtV1UvSFphblROdWxudXFqSFhYL3Z2dEhGYVUrVUo0WXNiRlQ5YXJGRnZR?=
 =?utf-8?B?OEh5b2Y1WEwxc2QzbFJ4ZEpzVUx4N3RHem9JeTBZQmpRblgwZlY5WXpNaDRF?=
 =?utf-8?B?V2poUXFlK1hBd2ZBUW5TQjczOGZKNmtCOXNNUTRkYzhXLytvSXhCK1pXd0ZM?=
 =?utf-8?B?VkJjbkFoS012Y2g1Tm1TNjd2YThOQ2ozSjVpcmFRclBKKzRHUHdnL2dRN2tB?=
 =?utf-8?B?K0M5SitQc2F5VmVtdWJGdXdtdHhIay8zbG5FNENpQzU5QzdRTC85RG9VS1lE?=
 =?utf-8?B?anJiSnNBaVhBcXNlNndGc3dUalQzdFNiUHloNm9CbzhvVXRXc3VUNGFpVSs0?=
 =?utf-8?B?YWl5MXNzeUxuQ2EyRFJZVGFhVDV0bHFVQUNER0M0K1IrbS8ydEtsWFNJSUNN?=
 =?utf-8?B?TjkzeDVCU09Fek5MTlg4SGJEQmRLeUhKNTdneUN5YzJheEIrY0c2czM2OWtk?=
 =?utf-8?B?T0I4M01kZU9wdG9kLzJxRVV4MEYvaTlDNm1QWDV0UjJsQTdQaENaT0d3S2dZ?=
 =?utf-8?B?ZVg1eTBRNXVITDRYZ3hRUWRVN1N5WWRQT0ROYzVJZDJnbG13MzBCNDh1UThG?=
 =?utf-8?B?M0lxNXBNcjU1cnBOclpvcW5zdVg4Y3EyRVNtNTk5WXkvZTBsb1lmdnRCT1VF?=
 =?utf-8?B?SkFWRXZQSWo5ZFQwd3pQdEY3RXV0RVJGT21aZDhveE1wVkZ3eHZHcHdsNTA5?=
 =?utf-8?B?YjZ0M1dOQlhBazZaL1JQTGU5NWZtM1B6TWtQekhIM3p5NG8zYmJPaTFOWWwv?=
 =?utf-8?B?d25KVXZuaDAvQW9rRDdvcmJ1MEZaZkpxQjlJWXY4WTFzc0NlSUhxbFA1eWNk?=
 =?utf-8?B?YUJkWUM0UHZldlF1a1JNT205emZGNlpPME10R0V3SU1WZ3pTempOWTQweDlN?=
 =?utf-8?B?RGN6U1MwYUdnSk5OdW95UytwaGNPdmtHMXlobHBPQmlUaXRtYTNBbjZRcEtq?=
 =?utf-8?B?QnVsSDZhWVJpTzhOMEwwSGtIci9pKzdWdTBPUTRtN09BRGFtdVhTVzFLemRG?=
 =?utf-8?B?VlIxU04wS3pkVWtLUW9qTU1uZ05SbEVLakJXSjRodTNzSis3d2o2WXdaa2dM?=
 =?utf-8?B?S3ZKb3lHWDVEN0loeXowVTJXb2pxK1pEWFkwaXVFK1llYUNzdTAzVWtFRllG?=
 =?utf-8?B?T2cyOEo2U3NUcGpHZlZGV2JOWXBMR3F4SllsSXUwajFTVkpBaG93Y0xYbEhs?=
 =?utf-8?B?QXV4YUEvbW5jYzlsMnI4emROd3o3K0ZBYU0rODJRMDBOUW1lcXlBeURqKy9x?=
 =?utf-8?B?U2o5ZU9FSlR3blZUOU9vMnp5eHBDT0tBUkxwczhZNGwvbFBpVitoa0ZZcFBh?=
 =?utf-8?B?eDB3V0Vib1RUR0JTZ2xrYndnRythRTN2anF6Z2Z4T1BrcmtRT2YxaldEMHVK?=
 =?utf-8?B?ekZ6MmhVMVRLdEY0TzJuWWxCTHBHYzBxQnEvSjlhVEM3MkZXcnlhdzdsWERB?=
 =?utf-8?B?YjJFeGl0endSQXkvU09WaXc3azBwT1h4eFNsV2txUjA2bWI1Wjl0UWQ1NUZx?=
 =?utf-8?B?T3FtVzVIK1VGM1NzajJzSWRLOVQ1dG5hTFJPZjc2RmJNbjYxUDA1SmpQMXZ1?=
 =?utf-8?B?UXVJbzJucE9yZjR1eVVsNEFJQ2taUU5MM2NOYUE2ZktuK0E0Z0M2SUVMVVhO?=
 =?utf-8?B?Zjh0UkhMY0xEaTRrQXVaNktnWXE3WHRFeWVRVHNiZHhuN3pwQnpQL2V0SHdU?=
 =?utf-8?B?cFFlUTVRN24wUlVzbFdSN2dpZVlXMkRxU1g0Q1BRS2VYSE1WbGxvS0lJZHRZ?=
 =?utf-8?B?YkNERmd5RnV3TnoraHNnV01VWlpveThEOTRVa3V5KzZhQUErM096cXU3V3Y0?=
 =?utf-8?Q?jlW3MjsJFPm42Z4eaamf1j5gVbmHXG/v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2pjZDh1Ui84WFE1NmFnemVEVUNHVkR6U3d4QVJZTmp6VDFRbUx6NjlWUkJY?=
 =?utf-8?B?K1huK3picm9PTGhoVCtGQkZNZU1zUTlmL2tpYnpneWtndVo3MURNcXMzVkRR?=
 =?utf-8?B?aVV6NmltRml6NXdrSmlZd3pzL2tXZnRVVHpHaWJyT3Q2YzF4YTJBaWZIeDBP?=
 =?utf-8?B?RzY0TEc5ZDdZVUszZWg1elpNQThNcW0rRHhnY0dkSm1SSUJNeGxsaFY1djdZ?=
 =?utf-8?B?TFRySG5ra05uSmh3WldOTlhBMTVxMTNHSnZFYXo0S2dVc3M1c3VpQ3dIR2NW?=
 =?utf-8?B?Y2tZNDQvallRZkVTVGQrNG1pRHVnOXpWckVzd0hFRnlQbDZTR3lCZjZyaW9v?=
 =?utf-8?B?QkY5eFE2NE9zMjNKMmpxbVBKN3BQNEhDWEhDdllHaytBR1FGakU5NUIzUWto?=
 =?utf-8?B?QUdja0dXbFU0cXEvbjNmdUI3VUtzMVZVdk85YWNxRERDRXpja2Z0TGZwRUJM?=
 =?utf-8?B?Uzd5RjdiVDIvOTArRlBjNXRlQTlwY3RXUTcxZTBFR3F1MERDUzNjVGN6Qmk5?=
 =?utf-8?B?ZEVQVmZTWGVkbGl6OUQzK1RJbndWTzNDaklyUDQyWWpxZElEanpTMnhyS2py?=
 =?utf-8?B?am9EWFNqRkpRWGRqVE5COERpR2VPYmpFQVh0UHBNdmNNREdYdXYxTkRDbTZp?=
 =?utf-8?B?blYzTmtLTzQzMVNEdnpOR2hoTkNsTmxpZGZQMXNCZmhLK3YrRE1idk90ODIr?=
 =?utf-8?B?QlE1QmE5NWpMMTRud3hPUVRsWXlZNUJTS0hSVUlmb21yKzUveFNoeENrRWVT?=
 =?utf-8?B?YjlxS2hlbkpFeUZjNXdNY0JDL3Uxd1RJTUJGb0FCWEdmYWkrakZKd0dlbVRL?=
 =?utf-8?B?a25HS3pQWmRxbUN5eFVxb1J6anRYTHBYVlJSOXdQMi93VWMzc1ZKWjBIMGgy?=
 =?utf-8?B?MWRIWStyWkdlZmhtdWkrZDZaN2ZTeWh2MDhkS3BGWGdvTU1Zc0RqOU9JODBa?=
 =?utf-8?B?cHR5emZuSkw1b3I1TmhWY2FxUld4dllWQ2tIQkZFaWMvb1FPMEowRFVKdnBn?=
 =?utf-8?B?Ym1zVjNkanhJNXE1bzF6M0tYRk4zTTZHTnhrcDY1NDRrMGVTZ3BsT3pvVklT?=
 =?utf-8?B?bFYyd2VnYm9DbmxXU1dKL1ZQSGNoMjlPWWFCTkc0dVYrQ1VxTHdidlQyQWhy?=
 =?utf-8?B?NS9EaVNuNU5yM1hHQk1RSExOa1hUck5pajQ3ZDhOQ05wdDRpQVJJMU44cmZh?=
 =?utf-8?B?RThtbnJtV290UWRybnRsdzk3VXBsY0V4ME9vQlJNUHJIMHdXS3FwMmxHeFk1?=
 =?utf-8?B?Z2lsSDY4RVhYWjlxdkoxUnBUY1ZLYzMzWUJjR2wwSENLTytSUjRkWDgwMTJw?=
 =?utf-8?B?dm03VktPMGR6bll4cURDajF4K3RUTWVneUtKQkV5NlBLeTZLVDVCQ2Fzalp0?=
 =?utf-8?B?ajZGeERnWm1QclpYOWRUY2wwcGVENG5DcjMvZkN0YTAvVjFFWTZ4WXg3ZjA5?=
 =?utf-8?B?VFhxaGdGMVQvc2dUWDZJMjRzNFBrOENiYmhTT2VtQ05qQ3RkeWhsMEVRMDhv?=
 =?utf-8?B?R0pTcngxenNCekNYMEwrZ011VzNPQkxZL0NnSDZ0aU5mSDZuYXMvT0xpUnh2?=
 =?utf-8?B?VHdDTjR6cnpBTnV3M0pxSE9FdWF4eXE2cnBSaHRXRk9jbXFiaVNqcGl2UjN3?=
 =?utf-8?B?TlVTdWRXd09ubTNsemlzc1Y1Mk50TEt1dzFwNFh1eUN2MDFIUGp5QVRwYVVW?=
 =?utf-8?B?RFREckNMbEs0SzhsNC9MK2RLZE9pbDAyODh3KzE2N2F3eFZkTncwUGlzcjVK?=
 =?utf-8?B?Q1lzRjl0NjR0YnA0ZXlCZDN1YkpBUVZQOVE0bGlhOWFlNVByMUJ0UTZVYWlr?=
 =?utf-8?B?UmxDaWU3bVdaUkQvMGFycDV2dW93bnRET0NybG5oVEl1NDFIb0RhYkQyRy85?=
 =?utf-8?B?VC9QNkpaaUtvRW1pNkF5cU9IRXZUTHRJdlFzSGc1UXB0SGtmUmZoNGFlMHQ0?=
 =?utf-8?B?VlBtOE92Y2Q0UW03blNaL3U5VVV6eU8rc3JkdXR6Y2xHMDFOV0dxbURlQ25h?=
 =?utf-8?B?OS9KWmZlVVlxMWdvS0VqODl3YmgwRHVtN1VmY0ZEcGgxa3RCUDJzSnNWOGpV?=
 =?utf-8?B?Z29FejFvL2poQVlENDkyVXlVbmMyL1h4RWR3MTc1SXpCQTFUVjFsQk1Td2ty?=
 =?utf-8?B?QmF6ZlVHNWMrY3dzT1crc2ptNWwrenNEQldWUW5pN09CODdBR25rN29Td0dV?=
 =?utf-8?B?TFVCRGpLTURoYzJWby9rUDBCT0ZIT0x2c3dTSHVPZnlZcTF2MlpkTEdjTm9x?=
 =?utf-8?B?WENRNWc5cGIrcjhYZUd4NHFsNXBNQ2NzTGxBd3docnpmcTVzZlp1TXVtSmNi?=
 =?utf-8?B?NjBvdG5PK1ZKbFZHN0NIWkR2b1NVeXl3ZFBUbEtROUlXM0NQdG1NUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c317940-facb-4e8e-4178-08de4c0615e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 02:56:55.5423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvlrUiRsLYKEB86UKUV1WHtVjny10Mqal1AZmAK2+Oa6asobdXF2MML7Lu5GFVf3BvMhmX7nrzGc47k+QUaPCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 5/1/26 12:17, Alistair Popple wrote:
> On 2025-12-31 at 15:31 +1100, Jordan Niethe <jniethe@nvidia.com> wrote...
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have
>> pfns and must be handled separately.
>>
>> When migrating a device private page a migration entry is created for
>> that page - this includes the pfn for that page. Once device private
>> pages begin using device memory offsets instead of pfns we will need to
>> be able to determine which kind of value is in the entry so we can
>> associate it with the correct page.
>>
>> Introduce new swap types:
>>
>>    - SWP_MIGRATION_DEVICE_READ
>>    - SWP_MIGRATION_DEVICE_WRITE
>>    - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE
>>
>> These correspond to
>>
>>    - SWP_MIGRATION_READ
>>    - SWP_MIGRATION_WRITE
>>    - SWP_MIGRATION_READ_EXCLUSIVE
>>
>> except the swap entry contains a device private offset.
>>
>> The existing helpers such as is_writable_migration_entry() will still
>> return true for a SWP_MIGRATION_DEVICE_WRITE entry.
>>
>> Introduce new helpers such as
>> is_writable_device_migration_private_entry() to disambiguate between a
>> SWP_MIGRATION_WRITE and a SWP_MIGRATION_DEVICE_WRITE entry.
>>
>> Introduce corresponding softleaf types and helpers.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>> v1:
>>    - Update for softleaf infrastructure
>>    - Handle make_readable_migration_entry_from_page() and friends
>>    - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
>>    - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
>> ---
>>   include/linux/leafops.h | 70 +++++++++++++++++++++++++++++++++----
>>   include/linux/swap.h    |  8 ++++-
>>   include/linux/swapops.h | 76 +++++++++++++++++++++++++++++++++++++++++
>>   mm/huge_memory.c        | 21 +++++++++---
>>   mm/memory.c             | 10 ++++--
>>   mm/mprotect.c           | 21 +++++++++---
>>   mm/page_vma_mapped.c    |  3 +-
>>   7 files changed, 188 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
>> index cfafe7a5e7b1..a4a5c3ad647b 100644
>> --- a/include/linux/leafops.h
>> +++ b/include/linux/leafops.h
>> @@ -28,6 +28,9 @@ enum softleaf_type {
>>   	SOFTLEAF_DEVICE_PRIVATE_READ,
>>   	SOFTLEAF_DEVICE_PRIVATE_WRITE,
>>   	SOFTLEAF_DEVICE_EXCLUSIVE,
>> +	SOFTLEAF_MIGRATION_DEVICE_READ,
>> +	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
>> +	SOFTLEAF_MIGRATION_DEVICE_WRITE,
>>   	/* H/W posion types. */
>>   	SOFTLEAF_HWPOISON,
>>   	/* Marker types. */
>> @@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
>>   		return SOFTLEAF_DEVICE_PRIVATE_READ;
>>   	case SWP_DEVICE_EXCLUSIVE:
>>   		return SOFTLEAF_DEVICE_EXCLUSIVE;
>> +	case SWP_MIGRATION_DEVICE_READ:
>> +		return SOFTLEAF_MIGRATION_DEVICE_READ;
>> +	case SWP_MIGRATION_DEVICE_WRITE:
>> +		return SOFTLEAF_MIGRATION_DEVICE_WRITE;
>> +	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
>> +		return SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
>>   #endif
>>   #ifdef CONFIG_MEMORY_FAILURE
>>   	case SWP_HWPOISON:
>> @@ -190,16 +199,62 @@ static inline bool softleaf_is_swap(softleaf_t entry)
>>   	return softleaf_type(entry) == SOFTLEAF_SWAP;
>>   }
>>   
>> +/**
>> + * softleaf_is_migration_device_private() - Is this leaf entry a migration
>> + * device private entry?
>> + * @entry: Leaf entry.
>> + *
>> + * Returns: true if the leaf entry is a device private entry, otherwise false.
>> + */
>> +static inline bool softleaf_is_migration_device_private(softleaf_t entry)
>> +{
>> +	switch (softleaf_type(entry)) {
>> +	case SOFTLEAF_MIGRATION_DEVICE_READ:
>> +	case SOFTLEAF_MIGRATION_DEVICE_WRITE:
>> +	case SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +/**
>> + * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
>> + * device private migration entry?
>> + * @entry: Leaf entry.
>> + *
>> + * Returns: true if the leaf entry is a writable device private migration entry,
>> + * otherwise false.
>> + */
>> +static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
>> +{
>> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_WRITE;
>> +}
>> +
>> +/**
>> + * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
>> + * readable device private migration entry?
>> + * @entry: Leaf entry.
>> + *
>> + * Returns: true if the leaf entry is an exclusive readable device private
>> + * migration entry, otherwise false.
>> + */
>> +static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
>> +{
>> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE;
>> +}
>> +
>>   /**
>>    * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
>>    * @entry: Leaf entry.
>>    *
>> - * Returns: true if the leaf entry is a writable migration entry, otherwise
>> - * false.
>> + * Returns: true if the leaf entry is a writable migration entry or a writable
>> + * device private migration entry, otherwise false.
>>    */
>>   static inline bool softleaf_is_migration_write(softleaf_t entry)
>>   {
>> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
>> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
>> +	       softleaf_is_migration_device_private_write(entry);
>>   }
>>   
>>   /**
>> @@ -219,12 +274,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
>>    * readable migration entry?
>>    * @entry: Leaf entry.
>>    *
>> - * Returns: true if the leaf entry is an exclusive readable migration entry,
>> - * otherwise false.
>> + * Returns: true if the leaf entry is an exclusive readable migration entry or
>> + * exclusive readable device private migration entry, otherwise false.
>>    */
>>   static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
>>   {
>> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
>> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
>> +	       softleaf_is_migration_device_private_read_exclusive(entry);
>>   }
>>   
>>   /**
>> @@ -241,7 +297,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
>>   	case SOFTLEAF_MIGRATION_WRITE:
>>   		return true;
>>   	default:
>> -		return false;
>> +		return softleaf_is_migration_device_private(entry);
>>   	}
>>   }
> 
> See below for a bit more context but I'm not convinced we want to include device
> private entries in the definition for softleaf_is_migration(), etc. It seems
> to me like it would be better to make callers explicitly deal with the device
> private cases separately which most seem to do anyway.

That is not generally the case - the only instances where the device
private cases are dealt with separately are when we are creating new
entries.

The advantage to treating the device private migration leaf entry as a
specialization of the migration leaf entry is that because most callers
are not creating new entries, they do not need to be updated to
accommodate the new entry type.

As an example - take hmm_vma_handle_pte() -

                 if (softleaf_is_migration(entry)) {
                         pte_unmap(ptep);
                         hmm_vma_walk->last = addr;
                         migration_entry_wait(walk->mm, pmdp, addr);
                         return -EBUSY;
                 }

We'd need to update this to be

         if (softleaf_is_migration(entry) || 
softleaf_is_migration_device_private(entry))

There is no distinction between these cases so this is just noise.

That would be the case for the majority of the callers of
softleaf_is_migration(), softleaf_is_migration_read(),
softleaf_is_migration_read_exclusive(), softleaf_is_migration_write().

This specialization treatment is further convenient as it allows
make_readable_migration_entry_from_page() to create a device private
migration entry or a migration entry as required.

The code in change_pte_range() called out below as difficult to read 
would actually
be simplified by using the make_.*_migration_entry_from_page() helpers
as it would remove the conditional. The only extra consideration is
making sure the SWP_MIG_YOUNG_BIT and SWP_MIG_DIRTY_BIT bits were copied
to the new swap entry. 
  
  


> 
> We also need to be consistent in the definitions - softleaf_is_migration(),
> softleaf_is_migration_read_exclusive() and softleaf_is_migration_write()
> all return true when encountering a device private entry but
> softleaf_is_migration_read() does not.

Thanks - this is a mistake.

> 
>> diff --git a/include/linux/swap.h b/include/linux/swap.h
>> index 38ca3df68716..c15e3b3067cd 100644
>> --- a/include/linux/swap.h
>> +++ b/include/linux/swap.h
>> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
>>    *
>>    * When a page is mapped by the device for exclusive access we set the CPU page
>>    * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
>> + *
>> + * Because device private pages do not use regular PFNs, special migration
>> + * entries are also needed.
>>    */
>>   #ifdef CONFIG_DEVICE_PRIVATE
>> -#define SWP_DEVICE_NUM 3
>> +#define SWP_DEVICE_NUM 6
>>   #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>>   #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
>>   #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
>> +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
>> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
>> +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
>>   #else
>>   #define SWP_DEVICE_NUM 0
>>   #endif
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index 72aa636fdb48..2bd01f97b4f0 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -148,6 +148,43 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>>   	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
>>   }
>>   
>> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
>> +}
>> +
>> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
>> +}
>> +
>> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
>> +{
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ ||
>> +			swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE ||
>> +			swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
>> +}
>> +
>> +static inline bool is_readable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_READ);
>> +}
>> +
>> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return unlikely(swp_type(entry) == SWP_MIGRATION_DEVICE_WRITE);
>> +}
>> +
>> +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
>> +}
>> +
>> +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
>> +{
>> +	return swp_type(entry) == SWP_MIGRATION_DEVICE_READ_EXCLUSIVE;
>> +}
>> +
>>   #else /* CONFIG_DEVICE_PRIVATE */
>>   static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>>   {
>> @@ -164,6 +201,36 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>>   	return swp_entry(0, 0);
>>   }
>>   
>> +static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(0, 0);
>> +}
>> +
>> +static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(0, 0);
>> +}
>> +
>> +static inline bool is_device_private_migration_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool is_writable_device_migration_private_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
>> +{
>> +	return swp_entry(0, 0);
>> +}
>> +
>> +static inline bool is_readable_exclusive_device_private_migration_entry(swp_entry_t entry)
>> +{
>> +	return false;
>> +}
>> +
>>   #endif /* CONFIG_DEVICE_PRIVATE */
>>   
>>   #ifdef CONFIG_MIGRATION
>> @@ -175,6 +242,9 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
>>   
>>   static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page)
>>   {
>> +	if (is_device_private_page(page))
>> +		return make_readable_migration_device_private_entry(page_to_pfn(page));
>> +
>>   	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page));
>>   }
>>   
>> @@ -185,6 +255,9 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
>>   
>>   static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page)
>>   {
>> +	if (is_device_private_page(page))
>> +		return make_readable_exclusive_migration_device_private_entry(page_to_pfn(page));
>> +
>>   	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page));
>>   }
>>   
>> @@ -195,6 +268,9 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
>>   
>>   static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page)
>>   {
>> +	if (is_device_private_page(page))
>> +		return make_writable_migration_device_private_entry(page_to_pfn(page));
>> +
>>   	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page));
>>   }
>>   
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 08c68e2e3f06..bbfe5e87884a 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1800,7 +1800,11 @@ static void copy_huge_non_present_pmd(
>>   
>>   	if (softleaf_is_migration_write(entry) ||
>>   	    softleaf_is_migration_read_exclusive(entry)) {
>> -		entry = make_readable_migration_entry(swp_offset(entry));
>> +		if (softleaf_is_migration_device_private_write(entry) ||
>> +		    softleaf_is_migration_device_private_read_exclusive(entry))
>> +			entry = make_readable_migration_device_private_entry(swp_offset(entry));
>> +		else
>> +			entry = make_readable_migration_entry(swp_offset(entry));
>>   		pmd = swp_entry_to_pmd(entry);
>>   		if (pmd_swp_soft_dirty(*src_pmd))
>>   			pmd = pmd_swp_mksoft_dirty(pmd);
>> @@ -2523,10 +2527,17 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
>>   		 * A protection check is difficult so
>>   		 * just be safe and disable write
>>   		 */
>> -		if (folio_test_anon(folio))
>> -			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
>> -		else
>> -			entry = make_readable_migration_entry(swp_offset(entry));
>> +		if (folio_test_anon(folio)) {
>> +			if (folio_is_device_private(folio))
>> +				entry = make_readable_exclusive_migration_device_private_entry(swp_offset(entry));
>> +			else
>> +				entry = make_readable_exclusive_migration_entry(swp_offset(entry));
>> +		} else {
>> +			if (folio_is_device_private(folio))
>> +				entry = make_readable_migration_device_private_entry(swp_offset(entry));
> 
> Note that device private folios are always anon, so we should never hit this
> path. We have enough other warnings scattered around for creating device private
> entries for non-anon folios so I'd just remove the else clause entirely and
> leave a comment saying they must be anon.

Good idea.

> 
>> +			else
>> +				entry = make_readable_migration_entry(swp_offset(entry));
>> +		}
>>   		newpmd = swp_entry_to_pmd(entry);
>>   		if (pmd_swp_soft_dirty(*pmd))
>>   			newpmd = pmd_swp_mksoft_dirty(newpmd);
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 2a55edc48a65..8e5e305bc2dc 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -963,8 +963,14 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>   			 * to be set to read. A previously exclusive entry is
>>   			 * now shared.
>>   			 */
>> -			entry = make_readable_migration_entry(
>> -							swp_offset(entry));
>> +
>> +			if (softleaf_is_migration_device_private(entry))
>> +				entry = make_readable_migration_device_private_entry(
>> +								swp_offset(entry));
>> +			else
>> +				entry = make_readable_migration_entry(
>> +								swp_offset(entry));
>> +
>>   			pte = softleaf_to_pte(entry);
>>   			if (pte_swp_soft_dirty(orig_pte))
>>   				pte = pte_swp_mksoft_dirty(pte);
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 283889e4f1ce..61542a80074b 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -327,11 +327,22 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				 * A protection check is difficult so
>>   				 * just be safe and disable write
>>   				 */
>> -				if (folio_test_anon(folio))
>> -					entry = make_readable_exclusive_migration_entry(
>> -							     swp_offset(entry));
>> -				else
>> -					entry = make_readable_migration_entry(swp_offset(entry));
>> +				if (!is_writable_device_migration_private_entry(entry)) {
> 
> I had to read this code a few times to convince myself it was correct.
> I think it would be better to not make softleaf_is_migration_write()
> return true for a device private migration entry and to instead deal with
> writable device private entries one level up, same as how we deal with
> softleaf_is_device_private_write().

As mentioned above, as an alternative, I think the
make_.*_migration_entry_from_page() might make this easier to follow.

> 
>> +					if (folio_test_anon(folio))
>> +						entry = make_readable_exclusive_migration_entry(
>> +								swp_offset(entry));
>> +					else
>> +						entry = make_readable_migration_entry(
>> +								swp_offset(entry));
>> +				} else {
>> +					if (folio_test_anon(folio))
>> +						entry = make_readable_exclusive_migration_device_private_entry(
>> +								swp_offset(entry));
>> +					else
>> +						entry = make_readable_migration_device_private_entry(
>> +								swp_offset(entry));
> 
> Same comment as above for non-anon device private folios.

Ack.

Thanks,
Jordan.

> 
>> +				}
>> +
>>   				newpte = swp_entry_to_pte(entry);
>>   				if (pte_swp_soft_dirty(oldpte))
>>   					newpte = pte_swp_mksoft_dirty(newpte);
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index 7fddafed3ebb..b19820a51e95 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -255,7 +255,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>   
>>   				if (!softleaf_is_migration(entry) ||
>>   				    !check_pmd(softleaf_to_pfn(entry),
>> -					       softleaf_is_device_private(entry),
>> +					       softleaf_is_device_private(entry) ||
>> +					       softleaf_is_migration_device_private(entry),
>>   					       pvmw))
>>   					return not_found(pvmw);
>>   				return true;
>> -- 
>> 2.34.1
>>


