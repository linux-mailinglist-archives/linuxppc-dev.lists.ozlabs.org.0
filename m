Return-Path: <linuxppc-dev+bounces-16336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AtmBjRHeWlWwQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 00:16:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3399B5A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 00:16:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f11VL2qfCz2xqj;
	Wed, 28 Jan 2026 10:15:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769555754;
	cv=pass; b=HdgZeySdUyLeVraIQmXIgbFiTOanqAcbEx4AWx4x8XFKnj2Bx7p8Kp6Lj1dwuxuxqpgzjffgGcUqsuZ+f9LMRvFdHO6JngB1udSeTJy7on75Xi4JRkB2tWRcmPzvEze51O2p5uFSorSVyCrYglrytMEAVSn2NMpDX3hXTESdmZBWqRaYxg4l+59QXEFEhhwhjynas0FMAqHqhW4YrPjyjTUVtTUQ3+MPE0f7f2rkJv5nhJqp1AnD8AZaLrrDmy56q146F0QZCnoiZo+fakydynAS5EYTLE9nW2EhBmSDSo0VGCbzA1ys+vDAtd3Jx1K8cDuCNhuCqbDCMZOBqz93vQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769555754; c=relaxed/relaxed;
	bh=akXGz5njKEndCmDXrXJ3dVeNf/qcNEUEAuv9YWo2HiY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ps1u31Jg7yJmQe++gSknNStfuYQLwLAPgTuPkjLrlo3C9lOdFz9Je2qdLWvFzw7xhkSrao2IVzEwkzR61PqyPHSI3yEUBQX1tgFBUFi4k0D4BL2ID+IBCKURs82FOvXk9RDz6YezRv1NQvkbQs8bIIWBgEH6jODoay7KhDjVk8HltySb2vR9Rn8ZOul48MdMSrEuM69rLQtopUOKNVhbPG4AH9w8XGxLWU55L/sWwQhTjkyO501b7bpadV5HSLSHuvKIvD4ocL3oF8fEeIuwEh0IbK7GubuPVK8y8+erKlDQuNi1pkaiic7yWfrXzG7h8WKsfjDYUkB1VecDEVsPCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h+AZFnK8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h+AZFnK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f11VJ6Zhnz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 10:15:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUsz4Cz+4o8guX9XILdKFkuaRbNmKKhB6aLDZyNcbxPx1MDqHngyNf3KxY1g00bslEu7LTOXb1exJv9cLKqvgRWarSX27fQenYTcONdsLBwK25bIQxsmhaM2DwGKXeEmWMNsGeoqCwgo0a27/6oA8b87WXvp0gSzVXkPPirKIx3ZDQsLLpCMKWbFUETXmqwXDCQuih/kNh1zp58Hh7CftMoJ/mZDCq9aJFCKde6at3hD88WlJ6e4bKvZugrASOj3wCz+AWwqjq6fsNHcTRoxcS6OzdqGORvSU+70baBqMaG+8NRTnDhO5O0PkKoikS7GTZW5ZgwKE1WNWbmY48CkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akXGz5njKEndCmDXrXJ3dVeNf/qcNEUEAuv9YWo2HiY=;
 b=yY+3doURGtl6V1u3bymLCoHDaCeQn34zsXhIMUYRbFOWWIDwJsDoL2vjMBOYAYUgoWJ8j+RrINIi09smPCSHu+pahnNxewC1/i7BZ7aVPdTD/MvDJUNxe40XwYVEjy3hycFzohhmumN/lt0IKlMZ53Naq6Z2xjw2nVFuSzFQ9GsR2na0U/zlbCdMmKSun62hm+eAvIwtgh0lXbwb0OOC5Kq3HMhApcU5Suf/bCgHG6tflT/21G1sNFwZ26dp3njcsGqxIU12HqWQMlnSX7tatjvktD1yBKxEjA3Ltn5oTkZnFuX5xu61CWgm7kLsEwnItAfwCCXNmqrfZhuzbwKmBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akXGz5njKEndCmDXrXJ3dVeNf/qcNEUEAuv9YWo2HiY=;
 b=h+AZFnK8AxGPH5JGzwKeSgTmKZam8Zwf2A9JGdajEy5XTh8vSwPpo+Dx8SF2qw3A18YgQ2wlJZLrnjlJBpp6BX6JDet1aAktJ38aHje9TDAoXiKDyhu97GbfGsXsxxXTrVQqeqao5ueRUWAenxokTTkDLbjh90OpAlVOKU71XOhlwputYXfOgw8Yc+79K7mVyh8ka0/+RQfYmm/cQ4dRJL93ro4+YhZzL3sM+iXhFD4vOGZjoAU4VvE4rx4EWylmIkafQBv87Kk9Im+P6Y60I+Ii6idWvUvVsmyoTED1GiO/MyLST5IBRKHj6Ca+YEdJinCmBWHDqbTa7LlwSij4tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB7286.namprd12.prod.outlook.com (2603:10b6:303:22f::5)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 23:15:26 +0000
Received: from MW4PR12MB7286.namprd12.prod.outlook.com
 ([fe80::8beb:2d90:7572:13a3]) by MW4PR12MB7286.namprd12.prod.outlook.com
 ([fe80::8beb:2d90:7572:13a3%5]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 23:15:26 +0000
Message-ID: <5baa551b-98f6-4846-8279-db844dd701b2@nvidia.com>
Date: Wed, 28 Jan 2026 10:15:19 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] drm/amdkfd: Use migrate pfns internally
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com, jhubbard@nvidia.com
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-3-jniethe@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260123062309.23090-3-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To MW4PR12MB7286.namprd12.prod.outlook.com
 (2603:10b6:303:22f::5)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB7286:EE_|SA1PR12MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: a41b1fd9-4a60-4395-3fdb-08de5df9f47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1ZxT1F1MXVCcUxGd1lIdHNSVW9VVXNtL1FwczRrL2dFM09oZ0hTV3p4UDRu?=
 =?utf-8?B?d0dXcGwwRjFXdllESXlPcTVVMWtyRUJWN1lWd0Y2OFdOeCtWazB5aU04M0Ji?=
 =?utf-8?B?QjBsVU5seGhqM1hweHpmd2JYRWZ6dkxaZ3RNUElkd3B0MWhZWml4aTBkS25F?=
 =?utf-8?B?QW11eFRiMkhlVzlqUEpsWk56NnN2dExCZ1VDNjVUamtlcjM0REQvTTAzUHNL?=
 =?utf-8?B?NmU3NWVpRGErY0tGVWM2Z0k1VTRvR0xUVHlUWE1XNVlRK0FmQ3BZekZqejZV?=
 =?utf-8?B?T0hqd01zV3BtVW5YbnpHbi94QzhlbzdWUGw5U0hZZXNXL01KWDg1WGdpWFhX?=
 =?utf-8?B?QTVzQW53SUd2TVVWVzlsNzR2QTNjcDhmSTVWUmw4WGp0ZjJOUFlJMy9SNm80?=
 =?utf-8?B?OWJEeXFibFY0NDJ6ajY5ck1QQnNhZHEzSzJ2YngydkhvWkk2WGl5Ump0TVBl?=
 =?utf-8?B?RGorVHZyTXJhbnJkNCs3c3pQSnVVcmtCc1VrVlZMZlJ4bkkxbG4ycXVKUkFM?=
 =?utf-8?B?S3JvYkhFZVE4dlpuVWlJaWVlaGUwZDVDYk5sSlBkMFpzZE4wd3BsOUNleGsv?=
 =?utf-8?B?VUdVNkhwTi9ibStQYkRFWDNKQWVJUzI2T3M0RkxreldmdHJENFRETmhwc2g1?=
 =?utf-8?B?WGhoNU5uanVKK3U2UDFrMWlGMWZEQzhVS2ZBMG9qYjBFREE2YUVtYlF4SmdL?=
 =?utf-8?B?eDB1eEcvZmhrNjM0VWw1ZktHMlBRdFU2aG5tN1BPc2JyT1dYUVczWm1sOS9S?=
 =?utf-8?B?WVR0eG5SdWlEbm9Ua2tOcno3Y2JzYlg2N2dRYTIwSkFKdUJPSEFWWThRbnl6?=
 =?utf-8?B?RlBjVE9KRzd3bWpnLzc3aXExU2tDRUJSd0Z3ZUFSQWI4RVJaYmxsUWZXZThC?=
 =?utf-8?B?Rnc1MERiblRUV1ZYdWFQeXJUdDFlOEdYQitVL3c5VllHaFdQRVFoOEwzMW40?=
 =?utf-8?B?Q2oxZGUxN2VkQ29tT3F3TGt1b1YxcjlyMnhmMTBwWkRhakJ2T005OVN3cWFM?=
 =?utf-8?B?aTVlQWU5aWpMQ0gyOXRIdWUxMFY3L3g3Q0ZUV29uVTJDSEQvd2d4dStQOEQ0?=
 =?utf-8?B?L1RnTzEyUTRtcDRhSDluN241MDUvWUk0U2xNdS9UUzVwOE1MWS9Veld1b1pX?=
 =?utf-8?B?ZXRDTkNldE1ML2ZmUkhFNHVtWXdrbWhMYm95MURFczZ4MW9jTGJLVk1zZXZv?=
 =?utf-8?B?bk1iVng3VEcxaUluSmhhZDNOUnRzeTB5WWc0YUZicUFuQVRTb0VZV2szdzYx?=
 =?utf-8?B?WjU3Uys0NmlZbm1SZkZLOXNtL1BWcjUyZ1A0OG40QllzREQyTUZoMFYvOFdF?=
 =?utf-8?B?d0dmRXpKaDRFRkt2Q0VjR1VON0R3NE5oVzhEcW4wRGExeFU5UVl0VGpLdkM4?=
 =?utf-8?B?WW01L0p6OUpzdGhYQzc2MnRUWFdlbkQ0ekg2bUdkM0pWZTM0bmlFdjhBVC9G?=
 =?utf-8?B?ckV4WHlBdmJoSGM3TG9kZHNNSmF5ajNZcmY0Y29HNW14SkZkaFVNSWRSSVdD?=
 =?utf-8?B?UU13eDVJYzY2QWFJVzF4d2ZNZFhDdVErSGQ5Z3d4ZE5ORUNuL0tqNTJCMTV4?=
 =?utf-8?B?ZjJCenFMeFlyR29MVTlsZVNONjZhRlNBb1gzZVFCQ3FtT0JCbHFNZjlrR0pk?=
 =?utf-8?B?MlZ0T2t1WU1pNlM0ckxiNUVTdll3dXNSaUV1cmhVSUN4b1FNbEowYjVMbjRh?=
 =?utf-8?B?Unp6eUNqWjl1RnpjZGtrbjU1Tlo2cWM0WlFraXJLZ3JjQ2Y2azAwalJhdGV6?=
 =?utf-8?B?N1BjSDQ2Z2lnbm9xQ0hVMXRBR2lob0ozSElrNUFVRklJems0cEhTNWlEb3Uy?=
 =?utf-8?B?bTA0YXBkamFNdHU1elRDVDZqNnJJc2dYUlNhQlRtM3l4ai93R0ZMOVA5WHBh?=
 =?utf-8?B?R1FRVHBPMUQ1alRaWFRpQVlnL2IyYXpJS0xheldlTTdRUXV5N0J3ZW0rOVhE?=
 =?utf-8?B?dVBJdjV0MlZiWlRRZHJoT2NTcDhMZWI3WDM0VEtqbG1pMlArcVFHekVuVW9l?=
 =?utf-8?B?Qk1odFlDWFI3dlJOajhLZnMwcGJmZkhObmZGVWtoems3TjhjbE9pTXBCcUlW?=
 =?utf-8?B?V0YzNDFVUHNHZE04VVFSTUVsR3V2eDRZR0NoVmFxTTdRMkQ2bVNTeXIzeWxs?=
 =?utf-8?Q?/SPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdmRlByQW9tWlIvZlN6cW9GbGNvK3AwbFdwNWxDVTM4YVQ3dXZVNDZwdnUv?=
 =?utf-8?B?NWdQcU1POEZZbkt2RGxRNzh6RFVrK2FhNFNoYmppWHdwNEZHR3h2MUpnTHM2?=
 =?utf-8?B?eXVSRi9ZOFl3Z2F2cVgyYVkwb1ppT2c4bTIwbk8xblBFNm40amIrSUVoWlpK?=
 =?utf-8?B?bFMwQks5cTE4bEdUcjNLLzJMaXdxSlk0QmkrLzFvNkV2NXNyaGhBMTFnbXZp?=
 =?utf-8?B?eHF0UmdHWXlPNTNDOVdnVkRVei9MUUVsbTJ2RmFFaVZ2b0l1Zmsyc0xFK0Rp?=
 =?utf-8?B?MzhWSDdwc1FoK2Z5Rlo4VTFWK3doUlVSZXMrQkFZK2ZFSTMvR1k0ci9EbDhy?=
 =?utf-8?B?WnpibnJKS2NtZkV0RlVodER6M2xNcmFKRVNpNVRoT2dBK08rS3NrM3pXa2Rm?=
 =?utf-8?B?TWF5MFowQndvSmVLRkdhOTJnQmk1V0YyUFQ4MmczTDY4SDJHOE5kc0VYVWVD?=
 =?utf-8?B?VWxvd2hML1BkSlBWRFM1bVF2N3NabzNRamtHZDlGbDI3MDZMTFA5S0JpTlNM?=
 =?utf-8?B?L2pYVXhIZmxkeTZ2K3Z3L3piVXFXRU9aQyt3Rk9Fb1pEZnBPc1U5MUlFTE8y?=
 =?utf-8?B?Y1BKNHVtTFNWbFk5TVNYTU4yUVZodVI3TWF2WmZpNW4yS1E1VGdlMXJJMzhS?=
 =?utf-8?B?NklCdGRqbk9DekNIWEM5RzBGQnpvQWRhZnB2Y0NvM0NIWk9PYU5qMTZ4djM2?=
 =?utf-8?B?MGFLWGxRS1NrQWdFOFd1NEJ4TXAzUFdjeGhHVFdDMENNbElrcDdpUktTYVFn?=
 =?utf-8?B?R0hyMWRPRUdpTUJ5YjNCeURHVHZsd1kyNFdaemdIc05SY0pNTm9Id0xROWdP?=
 =?utf-8?B?eEVkSzFYY1hqZkVJd3N2aFpTLzVtM0FmcUdlYnMzdnA3T2daMHMwbXJvUnFT?=
 =?utf-8?B?YTVFaFVpbFhuTkhIVE5mdDRCVHZQQXp0NXRmaUlmbVlPdXlyUS9KWDhUdmhl?=
 =?utf-8?B?N2dPUUQwQzFHM09ROUN0QktXUjN2MHJyamFReERGSmJpZXZkcktyNWFJSzB0?=
 =?utf-8?B?YkZXb29xcDRwbzl6SWdSYXQzSkN5bXFzZC9Ub3dzd3NhelF1KytqRll2Vk9X?=
 =?utf-8?B?MUN2TnNYUEtubnNvVkNsbExINkl3UjBzZ25KLytVT0c0NUxQMzdpaHd3anlu?=
 =?utf-8?B?aXlsR3kzaFU3UTAya3c3RlFvK0hrYmwzNUpiZHkwQWdMOTR1Y0MwU0NLNGFZ?=
 =?utf-8?B?dEVlbWZSOEozdGhzTy9Sd1d2RktSK2QzelB2eFNBTzdXc0VrVndSZnRZQ0sx?=
 =?utf-8?B?WFJRREduTlFUWURpUXd1bGFNUlNjVVFPVjhhbEJobWxWcFcwamhMdmZUcUN0?=
 =?utf-8?B?Y0FmQUhRaXppR1BHV05mNUFMM1J2Y1Z2Y21DdFZ0N2d6QS9ISzNaT0pHYWJY?=
 =?utf-8?B?OWxYUTdNczhKMmY2ejllYXdmL0NDbFZQb1FMVjBLNlNqQVNZNU9SeWNvRTM5?=
 =?utf-8?B?d28xQllBZ1cvS29PMFBUWHNCcFcxV21FbnNLSGlnYkVwOWdSWEhidEh4dVdy?=
 =?utf-8?B?WFl3a1NvQjBuRTQvdkU0Wlg3VHViQlp4K0Jwd1NFa2JSSkhsMFg3Yis0RjRx?=
 =?utf-8?B?SU1peUhJWWp1SXEwWllxa1RUT2lIcldGNHlwSWlTVlZDNms0TTYxRmlXYlNk?=
 =?utf-8?B?dzJjam8rNWRPYTlkYXVhNnlHMDNnS1NzTDVjanpIbytvanFlUWpvem9Ub1Fl?=
 =?utf-8?B?enAzMnNUZ1NkVWZDZUt5YzBEZlFmWEhLSUdFbWhFU1N6aHJBR0N2NXFUK3pz?=
 =?utf-8?B?RGplanhhTWZyWUUybEdVTHpsNGlML1N1QjdhVHhXWmRDc3lHK0lESHl4UlBo?=
 =?utf-8?B?N2kvYXN1S0swek1uVmFYNXpaY01YNlFFS2tVYnVHOEpmanQvaGYzQktjaXNZ?=
 =?utf-8?B?QkJaalVFenpBUml3L0RFdlphV1g5dnY5WEZTbHVoWVR6TFQ3cDhjcjFYay9Z?=
 =?utf-8?B?WHdseEVXb1NaZGJJLzUzTzRoRTlXby9WdFRWOWRxT0gwc0cxOGRWWU9BdTVm?=
 =?utf-8?B?Q0hxWnd1a2x0SWJHcFVsNHNNeGdnMGNSY1R1VU9zVDM2UkpuM25NYzNGdjh1?=
 =?utf-8?B?b2RNVEw4anBEckJpdmQvdzhTN0QwQlVZRDJhQisyRU83MHFWZzlFTDBMTnRv?=
 =?utf-8?B?LzRCYkNlSThpdlY4YUhJemtlZGpSOCt2eUM5YWZvL2I3UTFDUnp1WnYyMGFr?=
 =?utf-8?B?Y1JRNXhuQXA2L3FUK2Z1MlVNY2NqMm5hcVZMdWVmMGo0VWk0M0lISE9mWXcy?=
 =?utf-8?B?STM5ZUR1UDlDeTZucUcvd3FUUzVSRGw2Mmk0OGIyTkdHYVo4WEZJb1JNT0FB?=
 =?utf-8?B?UG43MDMxbkpzdFZLZHNaRWFDTHhIVXBQcnpiNTNXNVhLSWxwSGhkR1BYbjI4?=
 =?utf-8?Q?msGZkFIxsur7mlvi73J2se32ginM+gewEhjGO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41b1fd9-4a60-4395-3fdb-08de5df9f47c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:15:26.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZV/0JiEh7W/NIgPuBfSeh/wqU/Ny0K6PbaPQ4Y7KrrYwB3d+Xd50WDPsRAgCnd+FzaQMSj6GqsvawtBVq6TCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16336-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[balbirs@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,nvidia.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: DA3399B5A0
X-Rspamd-Action: no action

On 1/23/26 17:22, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have a
> pfn.
> 
> A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
> that contain a pfn vs an offset into device private memory.
> 
> Replace usages of pfns and page_to_pfn() with mpfns and
> migrate_pfn_to_page() to prepare for handling this distinction. This
> will assist in continuing to use the same code paths for both
> MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.
> 
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> ---
> v2:
>   - New to series
> v3:
>   - No change
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 1f03cf7342a5..3dd7a35d19f7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -210,17 +210,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
>  }
>  
>  unsigned long
> -svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
> +svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
>  {
> -	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
> +	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
>  }
>  
>  static void
> -svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> +svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
>  {
>  	struct page *page;
>  
> -	page = pfn_to_page(pfn);
> +	page = migrate_pfn_to_page(mpfn);
>  	svm_range_bo_ref(prange->svm_bo);
>  	page->zone_device_data = prange->svm_bo;
>  	zone_device_page_init(page, 0);
> @@ -231,7 +231,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
>  {
>  	struct page *page;
>  
> -	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
> +	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
>  	unlock_page(page);
>  	put_page(page);
>  }
> @@ -241,7 +241,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
>  {
>  	unsigned long addr;
>  
> -	addr = page_to_pfn(page) << PAGE_SHIFT;
> +	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
>  	return (addr - adev->kfd.pgmap.range.start);
>  }
>  
> @@ -307,9 +307,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
>  
>  		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
>  			dst[i] = cursor.start + (j << PAGE_SHIFT);
> -			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
> +			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
>  			svm_migrate_get_vram_page(prange, migrate->dst[i]);
> -			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
>  			mpages++;
>  		}
>  		spage = migrate_pfn_to_page(migrate->src[i]);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> index 2b7fd442d29c..a80b72abe1e0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> @@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>  			    uint32_t trigger, struct page *fault_page);
>  
>  unsigned long
> -svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
> +svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
>  
>  #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
>  

Looks good!
Acked-by: Balbir Singh <balbirs@nvidia.com>


