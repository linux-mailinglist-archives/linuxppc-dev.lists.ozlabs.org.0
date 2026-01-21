Return-Path: <linuxppc-dev+bounces-16095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGV+I3VQcGlvXQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 05:05:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8250C58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 05:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwrFF2z1jz2yFg;
	Wed, 21 Jan 2026 15:05:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768968305;
	cv=pass; b=JdkHwKotkA6MyG0yqx2jeQCku92cpVntNYl8y/XjTvGAQIldwB2JI3VxzS1HYk4nwMC13h78ngdwA8Q3VyC2QCPR48otnK36IZf4kMc+YmjYINz21A7S3tmKdXpwvVH0Nr5v1vzbnc35qZfvX2fmjuFtVviDXL2G5a9vARoSemij6wSI6ytfy6C1RhNinJVpWP5QK0Wh3XJm+hVN5uiCI5D0LFDVrLeV/f0uqGkrYr1w0j64kezK/1c85v+EjCL2MuiG0dZJzeIpamdCngQ2ZgPfHZwFZsdhQk2pRxAcsQUKTgXY/Q2KwBXZOHl69DYPLSpPuxxxuBvTwTEcuw/Jvg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768968305; c=relaxed/relaxed;
	bh=PBffttv8d1xwNnTMeL0YLVQ+HTF4g9W82VdaC3AZmLQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nz/sAgL0sWbChTdGw1mOxvISimW21cOQxHzfVSfnqev81rTu42x2lTBUqcm51KHyrK0USuKO39GIuM4EXff8eyjD7ChgJ6oLtf2RE6x7VoQKxcXVyOFBeKMe4R7Hv+IwgHncHTVqvij7k5tjbVyBVoOngNX4o65aJo/eK8o4WWslt8f7JDeLTCxgSd8Kt5umJBxw+AriFgCtivgN98QRNQqNdng1s3TjCe+W4+YF9DMxh5AVRMrGlP+V/Oq7t66WnywHtFRPLQQ93sO+KB3MKZfZaJmr6Lc7Jug2SZ1HlXw/Gm838lala1FHpSy5nCOaDBElFqjE17RGTgkOikDJcA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aKKJMQbc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aKKJMQbc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwrFD0FSrz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 15:05:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0r7+lZgfiCBa5aUN+kSou3upbRK4T+k3L9T5Zb2UYcTjvWdkXAVR2QBVWf0gpji/Mmb6SBJecyuMR3FTRdo5pWwnbC+wfTaM8mrNShz+7a7A3Z17s5OFliu0nB8WSLuDAwHUazoVFsSaDG/Z8KoSjQQnW7iFSh0K3BuR/dMjFYQc/yq5GPoXlKA0Nfubz6YcrW511lh6Z73xLYq0/lMm8r74PP3vELvb2snV+w5Dk81Td+EB/Ub2O0AGNIx5H+gko6/VgOyikbXYjCmXmbtz/ewOFfjV30HznW8FmlitLgUZ/X7IDNBs5xPpvS8Ds/9iheCKbwRiVTOR+NRIGwUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBffttv8d1xwNnTMeL0YLVQ+HTF4g9W82VdaC3AZmLQ=;
 b=wn+YUKKGBrI9XX5i65AeXjzu1gIic9naBA4xmp1ijwTflsjGD3Ds/0becqYNGKCMmyZMqXQ+JNBUpgGfRsMBOTJFlfeCRWYC5mamxCWZMkLC1zznyLmiYyzwoBYI3J3nu4+GEY684sz/plVzDYSw32ghFyumLpPkUhkfvBgbkQjEeM3TPtUUFA7rw2Rff9gPw5vtEymS+ofc2tF2OodeGAwNPKfJXHIiL7S56Qr5Dhi/Ly1ywvL+n1o+tSaPyiQwiD+3qukIwPO72N112XGkOIwMGnFHRd2faAjtxjff713aYtc2pF2D4pwD1icOt8eweyCZ/eIZTuzV3Yeqa+8Nog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBffttv8d1xwNnTMeL0YLVQ+HTF4g9W82VdaC3AZmLQ=;
 b=aKKJMQbcQXLiiDXRDT9bNBtnm9mLYUbIAOqRugci82Lz7/QeBTKTpuBjkquOei/0DQ9yMxhm9f7WXUoN2tQ0rYaUS55UMlvspRDqtaBasQtWdAxJ882N30/HaISxub/JT4roq95EU8zP7O2cmiMbr8BAesCI/rYR2zdLgotT9vyItvMz54cgPxXnl20dal35C6Zmw4cuYOFqaHgd42WwA2QYceNMPpIm+6Able13vIduHsKInzgPf0Lz6ESNd8VDOE5eY1u2manQBl7WrTy34HuQ/e5SpU3z1gbgDY4bSpp8ek8euiyEwdTirBJ0TYW5GOlTjK848nhl8aUUAEBxhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 04:04:40 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 04:04:39 +0000
Message-ID: <254bd66c-4c0f-44f4-a4a1-87dc44bc5e30@nvidia.com>
Date: Wed, 21 Jan 2026 15:04:29 +1100
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
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
 <649cc20c-161c-4343-8263-3712a4f6dccb@nvidia.com>
 <C2A9F124-9EA8-4916-AB86-659BD280390D@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <C2A9F124-9EA8-4916-AB86-659BD280390D@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad84f64-8b45-48d8-bd49-08de58a23278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEJnaXlROXVSRzJuVXFPRU1hMmYvL1RPRnY0TXR6cDNhTmwybkZaa2xKMDNG?=
 =?utf-8?B?T1FLc3dVUWdLRzNVa08wQ2UwOUdBYjVnS0NHNGZOcnpDeUVidmZTRUhxd3VI?=
 =?utf-8?B?NGgvSHhoTWUzWWNZYmRyTjlrQUhJelU0NVB2dUFsdFlUelpRdXFzRzMyMWZK?=
 =?utf-8?B?dnFvUHgyVDQyQngyRjkwRXpaMHQrRGI3NUl2NTQ1cGJ6MjA4ZWYwS0lyWGUy?=
 =?utf-8?B?OWptcmpjQjNoOFFockJYaXhaSGtKTGI5aWFUUDlaRGMxS0Vic0Flak0rZ3cr?=
 =?utf-8?B?MEhXbE0rVnV0eWNJMWh6NDV6MEFySU53RVFrRDJ3MzFoaGVKdExvTjFYSU1I?=
 =?utf-8?B?d1lXbmN0cTl2WjVEWU02NGNEdnVyU2UzdmlOak5vem1RMW9ad0xrMkJDK2Rw?=
 =?utf-8?B?QnprOGRwS2xvUHNTOHVpVFp1K0F1N0J6cEVzNjJxcFFtUUFkWVVPYjhoRnE5?=
 =?utf-8?B?RFlhWFlOSEF2dU1EaWhCYlhwMzlsRTY0Q1FOT1VFZStxejh6d0x4U0ZLY2JQ?=
 =?utf-8?B?bnZ6cHA5QTNDdGdTUEtoRVUyRlNZcWtVcHhvaEhBOHMveDVQSXE0STJIbFFC?=
 =?utf-8?B?aGRJclcvYUU0WFdqa2pGZ1VVajRsdGs4cmVmTExjcWJqei9iL1JJM2Zoalpl?=
 =?utf-8?B?cFZlQURuZmVUSHhVbEJIOXdBWHYrSzFucE80ZllJN09rOC9TR1NVU1dRWWZZ?=
 =?utf-8?B?cFZWR2VnQWJoL2toRFZiN0hJd1ZxTUJlazNub0Y2YzJCY0UyV0FYTVFPWlhx?=
 =?utf-8?B?c0N1Yit1QUxjdk02VzFkMlpCTkxOYlMxd1hoQUVqbktIbk9wZGQwTTBFSzdP?=
 =?utf-8?B?Sk9sQXBXYWcySnNuQUN4Mm43RGY0UGx1RW5ORHNBMGxXaWRUU24xNUJ5eldM?=
 =?utf-8?B?MWVEVkx4dVJrY1ZwdWJseTZiRTZXY1hhTWhTNUpkWWtJQTBUbUl3bGVmTUJG?=
 =?utf-8?B?bkozQXl2MUdldFVTdCs2K3JwbHhzNmZvM3ZIclZ4ZGhQdnU1dGxZQ0ZFdnk3?=
 =?utf-8?B?dndYUWdpOHU3dTVMMk9sSzRRdGpDU3NpK0ViYjJMbDd2aTBOZE9SdHRTOGYx?=
 =?utf-8?B?T0h3RDVMQkZhSXUwV2lRZnE3S1Y5Uk5mSXJXRTlWZ2R2SGhIMW16UEhqeUZj?=
 =?utf-8?B?amVXWHBaWjVYV0p1cXhHcjBuUkp0VkxSV1NZd1M3NFEvckJORWxxa05NeVdr?=
 =?utf-8?B?OVR5RklCZlJMUHBPdDdkK0c5cTZtb2NUV2tUbjA3anhCNEZOWjFPa2t4S3Rz?=
 =?utf-8?B?LytBTVFpL29iQ1VsSlNXQU9KZG8wbnRnK1pKRTkwV3NETXlmLzArMFpsTG85?=
 =?utf-8?B?Vk8rMHVXOUNnN1lFUHRCRmRuaGpsS2kxZWFrN1FJQmI0ZHJYVGxoL3FRWG5S?=
 =?utf-8?B?Tm5jV1MvSFBBY0F3ZlRmM0duVHhjZjBCR2JrUWYydmM4RURVS3FEL1Zubnd1?=
 =?utf-8?B?cDk2aWFEKzZhbWpBcVd4S2o3TDY0YUIxNFlKN24yM0pTZGNBTVczRVhKVlVw?=
 =?utf-8?B?R2dhaXBqSFFUazVoSE1DdERibEZvYWNvL1Q3dnpXY1RnMVBycVE0blRRbFdN?=
 =?utf-8?B?czhaTGs0OHNFSjg0YksyYmFzM0xPMThhZ1ZIQ2UzODMzWWVLSWVJRUI0d0NO?=
 =?utf-8?B?Z2taQlFwSFhxcHYyY0xEU3FXRmpxemJGNVdtN1dLSGt5Rk1pN3Qzb3FTa0sr?=
 =?utf-8?B?b29VNWJtZEVvVWJ0OXA0RUZNdDNKN1pWTmtzTnE3MW9jY3pRQVlPN0dCNlo4?=
 =?utf-8?B?a0I4T3VoTk5NcGdPQUhNeVc3cVNlM0h3ZGxzWHBrdVp4TkdBVnFpVDQ2dHNC?=
 =?utf-8?B?ZG82NGlqTjJqZG5qd1pLcGpiY3Aza1RNQzdabHBSV1dyNUozZXlPN0pXek5y?=
 =?utf-8?B?WUhOcnpTM1dCeDg4cyt5c01VeWdIdlRRelBhQnZtSUFUaXVNVTlYbEZSa2d0?=
 =?utf-8?B?RHBmekhoRmdMK25VbFJSUkZOa2ZSdEZWL0djRGRSaEZORlJyUUhRdzMwalZR?=
 =?utf-8?B?Y2tYZnFIc1BYS04wNGY4SlN5Wk1qVE9nb29ybitwZWdmeEtlV0VvOWxqdXdz?=
 =?utf-8?B?clREUVF4MFJ0MUhrOE94dXN2NnFQbmZ5TnY2cGJ3ZTJTcitUaVgvaFBoZ1VI?=
 =?utf-8?Q?yJJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXVnMWJkMlpHaG8wa0RjTmpPNEdHOHg1aW9XVDBhMzliZWhsdnFMNFdya21E?=
 =?utf-8?B?THdzRGN0K3lsdFFSazl6YTlBWWJ4MXF2cG5zZkhUT2FNUmJhQlZhWHpKZmN3?=
 =?utf-8?B?ZUhtajJSeDN3NVU1V0Foa2Q1OFIwYk1jSzNLT2tCR09pSFVNWTNXc09VVGdC?=
 =?utf-8?B?SUhCenVMcHprakRaV1d3aVJpamQ4djNXb3ZHZ01ha0toaVQvZU13WFkzeng0?=
 =?utf-8?B?SE1MRUFKVW50aS9UT1VNTWFVN1BUYlhCUXhFSGtOZmRQTFBUcmZEMUtaZUU4?=
 =?utf-8?B?QlYxdDkzakxPTjB4SXROVkpiMzZhU01xUDlXNmF1NFRHZTFEcmtoSVg1MVBN?=
 =?utf-8?B?S3IxUlg5cGN4N0dyVEl2eHZBRXJjRG9XYjJKZGNjUHZyZjloaVRpUzB1L0k2?=
 =?utf-8?B?T2E3djE5dXYrV1IvdWNsVkdjTVI5ZlhWTXNOa1hNNzY0SjlLcXBGUVZ6Uk9Z?=
 =?utf-8?B?aTc1a1YzY3ZielE4ZGY3Q1JMZmlkdENVd2xWLzJlTS9KNXFVNWdWblIzNGlO?=
 =?utf-8?B?eFNHbTVtajFQS3pyYW96NWlZOXFEcmF4YXRaWlpQRHVzVjhLNTJaenM3RVIr?=
 =?utf-8?B?NFZ4Z042cUVvMjFsV0xBeStNM3B3dC9ydDRBd000Mm5BSEltMWM0eVNkcTQz?=
 =?utf-8?B?d1M0dTVFVTVmWkJmd3ViUVRQZmozcWdkYkhibDQraWJsODhFYWcwOUxvdWVQ?=
 =?utf-8?B?OWRHM2xseHphNzZrVDg2R0h4bWZGR3FidThoMnFqWkpjWThIeWNmZFB1dzND?=
 =?utf-8?B?YmIvRTVSM3ZsWW93bmtZQXlieUNNcUl5ZjlyWlQ1MzlQaEszSEtrekxPOE5y?=
 =?utf-8?B?T2xhM2JYYis3RkZtRklDTVVRY3FtQXJVcXRjVUpCbXlRM09sa3ZPTmNwSzBP?=
 =?utf-8?B?bXdhLzUyVGRYenB0Z3lCQmxQWnVEYzVFQkV3ZmFia2JGODZ5dFBhM3B0QzBT?=
 =?utf-8?B?WWp6V2xaMmVkdFAvSkcrRU80VnNPN20rRlRTSVBIRFVQTlQraWRpL2dHUVpV?=
 =?utf-8?B?cDZaWjZ4eW5OVnUyWk1oeWZaZmFVUTNTUTVpNVpLakFWOXNiK0JNTTZseFhX?=
 =?utf-8?B?WndISmlZSEcyU3FJaVBtQWNOWE96VG9mWkFyVW95cDVpenMrTjVZRGc4dUdZ?=
 =?utf-8?B?T0tBSXBwQ0g3QXJoVVcxcDJSWXVocm5QUEVjN0dYakQ0R3FnYkNsRlNPNnlm?=
 =?utf-8?B?SVlqdUhCbVhTTGR4MUFxVDZmMGMwcWljOVlLNGsvSnRwaEY0VGhtc0JMRnIw?=
 =?utf-8?B?MVBLcXl4RnU4RUlwZXFWNEN6Sit4VElLcWxlWHpBd1lwdTVCUmNiUkpNM09p?=
 =?utf-8?B?NVVKVnorU3I4cW5ZOG1kcXB4Q3hsclp6T2VMaFgzV2Jxc1VzcjBtdDloR3p5?=
 =?utf-8?B?RlBPWHRkT1JrczdJYjJVL3VKcSswL0FZMldBT0ZjRWtEaVZTaDZaazlMMkow?=
 =?utf-8?B?eWVRZ0thV29QRjU1dTlLL3RaS0lYeTJxckV6TnBmOVlYa08ydmlCZTE4clRj?=
 =?utf-8?B?R3pGWkh4RlZyNlZOY1EvZWVCbDdZcGRJdnNDM24yZzhXV1M5OEpHajkrMHdt?=
 =?utf-8?B?R3JER0F4Z1V0UWR2VTBreTdyeGw0VVhtYlJUTytKTFlxb0poaEFyTDY1cmFM?=
 =?utf-8?B?UmFGcCtTRGtRekM5bmlSemxpanZNcGZnSHlWSmE3K2xrM1ZEdHE3STdRdFQ2?=
 =?utf-8?B?NFV3bDRUNjd1eWxDYU1GMzMwcTB5d05vOUc2RjNCbW5ZeFdHRGM1N2grdm5Y?=
 =?utf-8?B?SDhuVHQ1ejg1TlE4S2ZYZ1dBWldBZ3VQcmlXNlJ5bThhWkhpRFhyYS9uWk1Q?=
 =?utf-8?B?aGIwOU1EVnV4VE1sVjJabjJHRm1BTXB2aHpRZE80U3o5cWQ3aExHYkdHeHYw?=
 =?utf-8?B?UDZFNXBGMDNVWlc5anplTXIyWDlFaGZOanA0NGk5N3NWeDBoTU9FVFZ1c3lD?=
 =?utf-8?B?ZkhOKzJpTTVsYnpqL3ZjS0dTMEVJU3A3ODJ2dU9lbEtxWUtPazVQOUdUZ2dw?=
 =?utf-8?B?OVlHRDlXUTdndGwvSjU2NTVvUysyaVVmWkk4VUtzdkhjNHAwcFdQTlRZZ01n?=
 =?utf-8?B?TGhWL2V2N2x4Y0lrdzhQaEU4V2IyQ01lVkF6cEtGd0lua0R5OTZaV2FDMTFX?=
 =?utf-8?B?aGxheXNDZGVFMGxTSEpPUmhNSmcrNHAwTDcySjRVdWhxNkVlS2FwVGRWd1h5?=
 =?utf-8?B?d01XMUVZZkNHWktUc3lEcDQrek53TENFZkt0MElIMTFXWVdic2IyczJ6OTRF?=
 =?utf-8?B?bFJEOE5YSk5hcUV4ajlYVnUyeUd3RkxLWlVSMm9ORUZ6QzhjaU9uR0kranRk?=
 =?utf-8?B?WGVzZXVRcWwydkxMNDBDSTRmdUhHZ0dVMThrdDlsOUh4R2xDYmVMZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad84f64-8b45-48d8-bd49-08de58a23278
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 04:04:39.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6v14zjODi/WB+OX2MmQfd6DTbvgvl6zvfqU4Ov2WLcyevmnCsjNEjmzRx80YbBNoZYqz6zZkllpViTaAgFPFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
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
	TAGGED_FROM(0.00)[bounces-16095-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 59D8250C58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/1/26 13:41, Zi Yan wrote:
> On 20 Jan 2026, at 18:34, Jordan Niethe wrote:
> 
>> Hi,
>>
>> On 21/1/26 10:06, Zi Yan wrote:
>>> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
>>>
>>>> Hi,
>>>>
>>>> On 21/1/26 09:53, Zi Yan wrote:
>>>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>>>>
>>>>>> On 14/1/26 07:04, Zi Yan wrote:
>>>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>>>>
>>>>>>>> Currently when creating these device private struct pages, the first
>>>>>>>> step is to use request_free_mem_region() to get a range of physical
>>>>>>>> address space large enough to represent the devices memory. This
>>>>>>>> allocated physical address range is then remapped as device private
>>>>>>>> memory using memremap_pages().
>>>>>>>>
>>>>>>>> Needing allocation of physical address space has some problems:
>>>>>>>>
>>>>>>>>       1) There may be insufficient physical address space to represent the
>>>>>>>>          device memory. KASLR reducing the physical address space and VM
>>>>>>>>          configurations with limited physical address space increase the
>>>>>>>>          likelihood of hitting this especially as device memory increases. This
>>>>>>>>          has been observed to prevent device private from being initialized.
>>>>>>>>
>>>>>>>>       2) Attempting to add the device private pages to the linear map at
>>>>>>>>          addresses beyond the actual physical memory causes issues on
>>>>>>>>          architectures like aarch64 meaning the feature does not work there.
>>>>>>>>
>>>>>>>> Instead of using the physical address space, introduce a device private
>>>>>>>> address space and allocate devices regions from there to represent the
>>>>>>>> device private pages.
>>>>>>>>
>>>>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>>>>> allocates a requested amount of device private address space and creates
>>>>>>>> the necessary device private pages.
>>>>>>>>
>>>>>>>> To support this new interface, struct dev_pagemap needs some changes:
>>>>>>>>
>>>>>>>>       - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>>>>       - Add a new dev_pagemap::pages array to store the device
>>>>>>>>         private pages.
>>>>>>>>
>>>>>>>> When using memremap_device_private_pagemap(), rather then passing in
>>>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
>>>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>>>>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>>>>
>>>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
>>>>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>>>>
>>>>>>>> Represent this device private address space using a new
>>>>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>>>>>> private address to a struct dev_pagemap, where a specific device private
>>>>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>>>>
>>>>>>>> Device private address space can be reclaimed and the assoicated device
>>>>>>>> private pages freed using the corresponding new
>>>>>>>> memunmap_device_private_pagemap() interface.
>>>>>>>>
>>>>>>>> Because the device private pages now live outside the physical address
>>>>>>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>>>>>>>> et al. are no longer meaningful.
>>>>>>>>
>>>>>>>> Introduce helpers:
>>>>>>>>
>>>>>>>>       - device_private_page_to_offset()
>>>>>>>>       - device_private_folio_to_offset()
>>>>>>>>
>>>>>>>> to take a given device private page / folio and return its offset within
>>>>>>>> the device private address space.
>>>>>>>>
>>>>>>>> Update the places where we previously converted a device private page to
>>>>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>>>>> offset, instead of looking up its page within the pagemap use
>>>>>>>> device_private_offset_to_page() instead.
>>>>>>>>
>>>>>>>> Update the existing users:
>>>>>>>>
>>>>>>>>      - lib/test_hmm.c
>>>>>>>>      - ppc ultravisor
>>>>>>>>      - drm/amd/amdkfd
>>>>>>>>      - gpu/drm/xe
>>>>>>>>      - gpu/drm/nouveau
>>>>>>>>
>>>>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>>>>
>>>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> NOTE: The updates to the existing drivers have only been compile tested.
>>>>>>>> I'll need some help in testing these drivers.
>>>>>>>>
>>>>>>>> v1:
>>>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>>>>> - Update existing users of memremap_pages():
>>>>>>>>         - ppc ultravisor
>>>>>>>>         - drm/amd/amdkfd
>>>>>>>>         - gpu/drm/xe
>>>>>>>>         - gpu/drm/nouveau
>>>>>>>> - Update for HMM huge page support
>>>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
>>>>>>>> ---
>>>>>>>>      Documentation/mm/hmm.rst                 |  11 +-
>>>>>>>>      arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>>>>      drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>>>>      drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>>>>      include/linux/hmm.h                      |   3 +
>>>>>>>>      include/linux/leafops.h                  |  16 +-
>>>>>>>>      include/linux/memremap.h                 |  64 +++++++-
>>>>>>>>      include/linux/migrate.h                  |   6 +-
>>>>>>>>      include/linux/mm.h                       |   2 +
>>>>>>>>      include/linux/rmap.h                     |   5 +-
>>>>>>>>      include/linux/swapops.h                  |  10 +-
>>>>>>>>      lib/test_hmm.c                           |  69 ++++----
>>>>>>>>      mm/debug.c                               |   9 +-
>>>>>>>>      mm/memremap.c                            | 193 ++++++++++++++++++-----
>>>>>>>>      mm/mm_init.c                             |   8 +-
>>>>>>>>      mm/page_vma_mapped.c                     |  19 ++-
>>>>>>>>      mm/rmap.c                                |  43 +++--
>>>>>>>>      mm/util.c                                |   5 +-
>>>>>>>>      19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>>>>
>>>>>>> <snip>
>>>>>>>
>>>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>>>>> --- a/include/linux/mm.h
>>>>>>>> +++ b/include/linux/mm.h
>>>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
>>>>>>>>       */
>>>>>>>>      static inline unsigned long folio_pfn(const struct folio *folio)
>>>>>>>>      {
>>>>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>>>>>
>>>>>>> Please use VM_WARN_ON instead.
>>>>>>
>>>>>> ack.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>>      	return page_to_pfn(&folio->page);
>>>>>>>>      }
>>>>>>>>
>>>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>>>>> --- a/include/linux/rmap.h
>>>>>>>> +++ b/include/linux/rmap.h
>>>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>>>>>>>      static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>>>>>      {
>>>>>>>>      	if (folio_is_device_private(folio))
>>>>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>>>>>>>      		       PVMW_PFN_DEVICE_PRIVATE;
>>>>>>>>
>>>>>>>>      	return page_vma_walk_pfn(folio_pfn(folio));
>>>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>>>>>
>>>>>>>>      static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>>>>>>>>      {
>>>>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>> +
>>>>>>>>      	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>>      }
>>>>>>>
>>>>>>> <snip>
>>>>>>>
>>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>>>>> --- a/mm/page_vma_mapped.c
>>>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>>>>>>>      static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>      {
>>>>>>>>      	unsigned long pfn;
>>>>>>>> +	bool device_private = false;
>>>>>>>>      	pte_t ptent = ptep_get(pvmw->pte);
>>>>>>>>
>>>>>>>>      	if (pvmw->flags & PVMW_MIGRATION) {
>>>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>      		if (!softleaf_is_migration(entry))
>>>>>>>>      			return false;
>>>>>>>>
>>>>>>>> +		if (softleaf_is_migration_device_private(entry))
>>>>>>>> +			device_private = true;
>>>>>>>> +
>>>>>>>>      		pfn = softleaf_to_pfn(entry);
>>>>>>>>      	} else if (pte_present(ptent)) {
>>>>>>>>      		pfn = pte_pfn(ptent);
>>>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>      			return false;
>>>>>>>>
>>>>>>>>      		pfn = softleaf_to_pfn(entry);
>>>>>>>> +
>>>>>>>> +		if (softleaf_is_device_private(entry))
>>>>>>>> +			device_private = true;
>>>>>>>>      	}
>>>>>>>>
>>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>>      	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>>      		return false;
>>>>>>>>      	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>      }
>>>>>>>>
>>>>>>>>      /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>>>>>>>      {
>>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>>      	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>>      		return false;
>>>>>>>>      	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>>>>>
>>>>>>>>      				if (!softleaf_is_migration(entry) ||
>>>>>>>>      				    !check_pmd(softleaf_to_pfn(entry),
>>>>>>>> +					       softleaf_is_device_private(entry) ||
>>>>>>>> +					       softleaf_is_migration_device_private(entry),
>>>>>>>>      					       pvmw))
>>>>>>>>      					return not_found(pvmw);
>>>>>>>>      				return true;
>>>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>>>>>      			if (likely(pmd_trans_huge(pmde))) {
>>>>>>>>      				if (pvmw->flags & PVMW_MIGRATION)
>>>>>>>>      					return not_found(pvmw);
>>>>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>>>>      					return not_found(pvmw);
>>>>>>>>      				return true;
>>>>>>>>      			}
>>>>>>>
>>>>>>> It seems to me that you can add a new flag like “bool is_device_private” to
>>>>>>> indicate whether pfn is a device private index instead of pfn without
>>>>>>> manipulating pvmw->pfn itself.
>>>>>>
>>>>>> We could do it like that, however my concern with using a new param was that
>>>>>> storing this info seperately might make it easier to misuse a device private
>>>>>> index as a regular pfn.
>>>>>>
>>>>>> It seemed like it could be easy to overlook both when creating the pvmw and
>>>>>> then when accessing the pfn.
>>>>>
>>>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
>>>>> return the converted pfn instead of pvmw->pfn directly. You can add a comment
>>>>> to ask people to use helper function and even mark pvmw->pfn /* do not use
>>>>> directly */.
>>>>
>>>> Yeah I agree that is a good idea.
>>>>
>>>>>
>>>>> In addition, your patch manipulates pfn by left shifting it by 1. Are you sure
>>>>> there is no weird arch having pfns with bit 63 being 1? Your change could
>>>>> break it, right?
>>>>
>>>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6), so I
>>>> thought doing something similiar here should be safe.
>>>
>>> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is used
>>> by almost every arch, so it has a broader impact.
>>
>> That is a good point.
>>
>> I see a few options:
>>
>> - On every arch we can assume SWP_PFN_BITS? I could add a sanity check that we
>>    have an extra bit on top of SWP_PFN_BITS within an unsigned long.
> 
> Yes, but if there is no extra bit, are you going to disable device private
> pages?

In this case, migrate PFNs would also be broken (due to MIGRATE_PFN_SHIFT) so we'd have to.

> 
>> - We could define PVMW_PFN_SHIFT as 0 if !CONFIG_MIGRATION as the flag is not
>>    required.
> 
> Sure, or !CONFIG_DEVICE_MIGRATION
> 
>> - Instead of modifying pvmw->pfn we could use pvmw->flags but that has the
>>    issues of separating the offset type and offset.
> 
> It seems that I was not clear on my proposal. Here is the patch on top of
> your patchset and it compiles.

Oh I'd interpreted “bool is_device_private” as adding a new field to pvmw.

> 
> Basically, pvmw->pfn stores either PFN or device private offset without
> additional shift. Caller interprets pvmw->pfn based on
> pvmw->flags & PVMW_DEVICE_PRIVATE. And you can ignore my helper function
> of pvmw->pfn suggestion, since my patch below can use pvmw->pfn directly.

Thanks, looks reasonable. I'll try it.

Thanks,
Jordan.

> 
> Let me know if my patch works. Thanks.
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index c1561a92864f..4423f0e886aa 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -921,6 +921,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>   #define PVMW_SYNC		(1 << 0)
>   /* Look for migration entries rather than present PTEs */
>   #define PVMW_MIGRATION		(1 << 1)
> +#define PVMW_DEVICE_PRIVATE	(1 << 2)
> 
>   /* Result flags */
> 
> @@ -943,6 +944,13 @@ struct page_vma_mapped_walk {
>   #define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
>   #define PVMW_PFN_SHIFT		1
> 
> +static inline unsigned long page_vma_walk_flags(struct folio *folio, unsigned long flags)
> +{
> +	if (folio_is_device_private(folio))
> +		return flags | PVMW_DEVICE_PRIVATE;
> +	return flags;
> +}
> +
>   static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>   {
>   	return (pfn << PVMW_PFN_SHIFT);
> @@ -951,23 +959,16 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>   static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>   {
>   	if (folio_is_device_private(folio))
> -		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
> -		       PVMW_PFN_DEVICE_PRIVATE;
> -
> -	return page_vma_walk_pfn(folio_pfn(folio));
> -}
> -
> -static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
> -{
> -	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
> -		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> +		return device_private_folio_to_offset(folio);
> 
> -	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
> +	return (folio_pfn(folio));
>   }
> 
> -static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
> +static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_mapped_walk *pvmw)
>   {
> -	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
> +	if (pvmw->flags & PVMW_DEVICE_PRIVATE)
> +		return page_folio(device_private_offset_to_page(pvmw->pfn));
> +	return pfn_folio(pvmw->pfn);
>   }
> 
>   #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
> @@ -977,7 +978,7 @@ static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
>   		.pgoff = folio_pgoff(_folio),				\
>   		.vma = _vma,						\
>   		.address = _address,					\
> -		.flags = _flags,					\
> +		.flags = page_vma_walk_flags(_folio, _flags),		\
>   	}
> 
>   static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 141fe5abd33f..e61a0e49a7c9 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -136,12 +136,12 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>   			device_private = true;
>   	}
> 
> -	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> +	if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))
>   		return false;
> 
> -	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> +	if ((pfn + pte_nr - 1) < pvmw->pfn)
>   		return false;
> -	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
> +	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
>   		return false;
>   	return true;
>   }
> @@ -149,12 +149,12 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>   /* Returns true if the two ranges overlap.  Careful to not overflow. */
>   static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>   {
> -	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
> +	if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))
>   		return false;
> 
> -	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
> +	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
>   		return false;
> -	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
> +	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
>   		return false;
>   	return true;
>   }
> @@ -369,7 +369,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
>   		.pfn = folio_page_vma_walk_pfn(folio),
>   		.nr_pages = 1,
>   		.vma = vma,
> -		.flags = PVMW_SYNC,
> +		.flags = page_vma_walk_flags(folio, PVMW_SYNC),
>   	};
> 
>   	pvmw.address = vma_address(vma, page_pgoff(folio, page), 1);
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index be5682d345b5..5d81939bf12a 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   	pte_t *pte = pvmw->pte;
>   	unsigned long addr = pvmw->address;
>   	struct vm_area_struct *vma = pvmw->vma;
> -	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
> +	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw);
>   	struct mem_cgroup *memcg = folio_memcg(folio);
>   	struct pglist_data *pgdat = folio_pgdat(folio);
>   	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
> 
> 
> 
> 
> 
> Best Regards,
> Yan, Zi


