Return-Path: <linuxppc-dev+bounces-16116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOVoLMvCcWmdLwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 07:25:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA79C623D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 07:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxWJP0TTbz2ySb;
	Thu, 22 Jan 2026 17:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c005::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769063108;
	cv=pass; b=R8+lhQT3qAyenXLGFVW6m9tsNpzgS4FmJbbTQTKxLuoCXhA6UVdRHitUzHzf4F6yUk3+ZyCtYXb07l2MLLaEKW/iwndbhFy5tQXTHEXR+jOuWmw17wZAL0RKJwP2rP7YoD9TQyT1CbyICrTUipvxVcwyw5tXuROez7RK4IKFLlRv9/UGdYRNTU+Q/dPLkHrhD1Jsp/NrJcvDOh+RjtB8+xbRQs1RWFPfcmZamrmuPiZk7mjJ7ht1XW8UqC3ZljWsl2EyGchHCdNRCRvUzk6P+q9N7+wCwWhSBVELrxsVBsvxg7iZxCOB+VCwQVWiaH8I0/ypp8qeWdeof/BYDGmYiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769063108; c=relaxed/relaxed;
	bh=PW3rE2bnb6SBXTg9+tmjNgAxJtTGEh3/i/B1on6allA=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n1dLXplXxo9hKMyYhuDS0ZmC04H/h5AwX5wFYv4UhOgdllG/OV2564g5o/JG+fAwzikGc6f3aPP7Ff4fVFtGYopOPyXbybeaDadzT5KI/UQorOHaQoJ4aeu8Y9ZHSJTZ2zGL/Hf/eitckjGbZhLMWjoGgPjgC+aOX9v2Kc3RPpFy2jV5FvA8HGTorrVP0bPFr5mq3Z1W4FUVCWRhez2X90QiWuTA8RvwmeOWAJve0HUud633NMPKmCo3b/1a6oqoYA3qXviJPjXqF2L1xqJa2nzy8JslFATWDQ86FAs8uUFsSB3knHc107YOwTcDVNyZ2jCOlapBCw//veO8AQiRww==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MVAd7Rv7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MVAd7Rv7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c005::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxWJM1SHHz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:25:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGq5C2GTx6f4/LXnlBpyXktbEZXa3JZZ0s/Jyg4JCYk0oZrciIhjUWsZSYR4FgXwBnPGDy9ZFQ/yoUglfRSg44kOcvtS+Q3HbOeqVlGXQha4xpaGU9DUUT8QwB8A6nFKJI3jPj7dgQuAnVQ0WcJXUGPw+21oKUFPIwfUI/GOhl3q4YQZf3R9kF4iAHx3ojbNe5x5FP41LAZYV+bSvGYJa+mMvI425F/EET/XnXnLBixFgkgEU8QFFo00u9aEydGoXcfhtywtn7RJGd6Z1e+7YCzm+cpRFv0u35BfHIKI0mipipUSvIOFwffRiyztgBTK6ueN/vK8PiEwHUvEX7mfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PW3rE2bnb6SBXTg9+tmjNgAxJtTGEh3/i/B1on6allA=;
 b=FhxtVYf54B0I4gOptvfx4DzQpNIgVFgjSHMKpxHMaMLPKLLyF6X9FaCeqNEbZgIk4ySYDsKOEnE8xGlRrcTlm9+EEu54BKAcGfJxuGR/Sz0RTqB7ePw0sZ+WnC5WXhZCaFMBvs5Pbo3/xYcZTxq4zJhX00Gp2E5cYXVbnRA645oQj9DPne2xQ5oJHVkuxjtgNvLpIrRpmfkk/HKrCInaDsyL744liXztt0+YwHp6x1JCFdlKL3POnPu/jU77izcToFG5q3pBqYnSsnUCD3kWZoNLO8c4h0v9dEANCfDdvWiKUgEYginXrogStakOYvXGUcUgwYk9pHbZWBk74neOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PW3rE2bnb6SBXTg9+tmjNgAxJtTGEh3/i/B1on6allA=;
 b=MVAd7Rv7W1YrdbKjJDZ2oCexRLPbVPP3pC1EUU7jdz82Ff9ywUuZcj7thjtrhhxwJhtBxA3xCs0xGOk34ypq5sfXpWSUTd23xJb150bRH3QPWKJ8cs+LtZYbC16w307XpI74fpvTGR+XJhBhw74QzhVO3lBddeNMLvxT7xDaxRU33cWjZx8ennFCeOyBs0lWt9kIb7QdC1i+O54gvx0bXAxxwXpYzOgkgv4HjKwmcLkCM52sOul5rRRLDiInFsd23Ug0b3tHetwMYUaFoeK4HSLc9ZG0JdvC5L5gWTmpT4O4FERmk6sMtuMbdmNUaIuYhyVxG18ewI/cm70mMFqeKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 06:24:35 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 06:24:35 +0000
Message-ID: <428a2aa3-d5b6-4a48-8cc3-34b3a0ccb350@nvidia.com>
Date: Thu, 22 Jan 2026 17:24:26 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
From: Jordan Niethe <jniethe@nvidia.com>
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
 <254bd66c-4c0f-44f4-a4a1-87dc44bc5e30@nvidia.com>
Content-Language: en-US
In-Reply-To: <254bd66c-4c0f-44f4-a4a1-87dc44bc5e30@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 481a356d-04a8-4ecb-45ba-08de597ee95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkRNUWpKWHRIY2VINW0rbWZYRVpNVzdQNGdrdXN6Zng2SCs2SlpTSUFpUDlS?=
 =?utf-8?B?UjJyNmpvV21EK3hnR3pxRitUM1ZqMzFtVmpPMVZtMURpWkdRRVNxMEtEVDZV?=
 =?utf-8?B?S1AyRldQcVhjZ3FCVG9uY3ZUWUZJdThBM3hFWjJnWnkrQzAxeTNKWFpFWVV5?=
 =?utf-8?B?M00rK0JiRDBQRDVlVkZwOFVOTkduZVl5SFY0RTFJc0lHZzV5dXQ5ZVVHcTIr?=
 =?utf-8?B?elljRDJ4L2FScUoyL0FmRGF4VXNNT0FrUXNqNWhSNDNLQzBKRGlWNmxBNzIv?=
 =?utf-8?B?eDg3ZlFYSG9MbWM4dUxobDRVN2kyNUhDcDdBWDNWbGtUeEcrMSsxTzBVa2NF?=
 =?utf-8?B?c0VNdnh6TFIycXViNzNYOXdVL0V5ZEp5bXhHU0FsOTRXblNkNWpSazJNVFA3?=
 =?utf-8?B?MXphS0Z5b3V4QWhvZkt4a2ZzNW9PbTU3TjA1aXNnNDBnWHlKYVdTdng1Y1k1?=
 =?utf-8?B?T1MwWmFBMjIxNWYwcXhQamdsMTJDVytrWGN1djQ3M211WmN2UUFiSjVKVHBk?=
 =?utf-8?B?ay9QZStTY0ZKditDZ1AwTm9PdlBTVHRKdTZaNyttM3BidWxDR3NYam03TE94?=
 =?utf-8?B?NXNkSk1JWHYwYXNVcDU5MVRBV1ZFejJNeS9KWDZmbGlDUC9kM0RMYW5HTnhW?=
 =?utf-8?B?bzJEYXpWbXIwTjg1WGxmMU84NDM4RGQxZTVQU2g4cm1USFozRG1Cc2FpOGUx?=
 =?utf-8?B?cmc5ajhEQUxXVW5UQ2d6dU1ra2pqRTZuV3IvMWV5YktTLzR2S0ZiNlNFbXNZ?=
 =?utf-8?B?RENhc08yd3ZvOHhXQ3hoaVE1UERlUWh0dTRkYXZRZll6SGZXRXQ3WlBiNDdx?=
 =?utf-8?B?L3hKUFBGeXBVNGVaS0JTOVA0aUdKd3Y1WWNhajhINVhRWDdUbDBmZmRBK2FW?=
 =?utf-8?B?Z3NqeGtsYWFZNWVPcC9URzNrbXdYbDNuR28raUI5eEk1ZzV4L1FzdTRXdU1q?=
 =?utf-8?B?TmFyTXZQVWZDbkw3OVd1Q0tEdElGUGtXMTJmZGRoMVZqcDVZdDY0MG1ENm4r?=
 =?utf-8?B?WENkNVVqYUQrVER3cHpaMEQwNHFjVS9ZaDg2Q25iK1BUeWFsaUhseHV1K1A3?=
 =?utf-8?B?aEVZNDRkY1gxelk5K05GcUJiS1piMVVlL21KWVlsSTNBVlVCRXBSajNXSnBz?=
 =?utf-8?B?YVhEcElKV3RRM2pWOEYvb1ZBT1Y2WWpMTG1XanozT1JqdmkrSCs1aEtTcU10?=
 =?utf-8?B?bVN0VmF5b04rZ2NVVi9KUHdmbTAxeFhQaWJaRDd3OTBPcTNaMDJ5dy83TTc0?=
 =?utf-8?B?am9EQTdsVHFBZjB4TThhNkg0NHhRVGhiazhHd0F6akQzb1VlbTh3bU5qMXUy?=
 =?utf-8?B?LzhxRU1uQk1nMFR6c0VqT29UN1R6cW5ZTi9qUXJ4VE5MdWZoN0NudkFzUDNq?=
 =?utf-8?B?R0pNSHo4K0kzbFJlZkczcnM2Q2t0M2NTTGowMWUyRUUxWDJWZ3VwTlpHOWky?=
 =?utf-8?B?eFd1YldPN0RpRTNydGhNbmlDZGVGaHB1bmE5VWt2bWJScWJqdllVQ29sSGI0?=
 =?utf-8?B?UEV6V0NJQ3h0NGdDLzFqWnJ0SnF0Y3F0L0FNUGYxckFsbllEUXZ4ejVzeW9Q?=
 =?utf-8?B?N1BkN3RkMk5FcjVYdkYyd3RweXhDU2FaMWdqYjVNczZSb0ltTlJTYjZ4TkEr?=
 =?utf-8?B?b1RkY3N5Q0NYeXJ0SmM5aUxjeWNVQnA5VWRvMUVhZUJ5TUIyb2ZnZzVlZUl5?=
 =?utf-8?B?VDhpNGdZdmxodWE0VGJUU1dnT1JBcVR5bzB3NnJnbG1KWEhGWXhWZm9tbkxl?=
 =?utf-8?B?ODZhTmFsVSs3T0RIWDkyQ2lyWlBHYmMxK0c0dkoxRkErUU4ybVlEUjlHNHZs?=
 =?utf-8?B?QzhVWDg0RHNCbkhzV2ZjV0JpM3lVMEIzWFZKRGhkL214VXY0UzFYcXRrVG1h?=
 =?utf-8?B?S2MrVDRWMFZramFMa3FzMGpSb1BydVc0N2o0V0hZQ2trdlhLUTNpUnpQcGp1?=
 =?utf-8?B?YkpTS0tzbFhESi9UcG9RMjJPVytUSmZHSllJWVNUTndOOUtNakxBU3FXSzJm?=
 =?utf-8?B?c09WVENmWE41UUZ1aSt3K2VyRjBCSnRqVlEzOFhqMzNNbEQxUHZtUExXY0ow?=
 =?utf-8?B?NzFpMzVJVSsydjdGZGRWclhueUhmdkEvSUpaTExYVFp6M1h1dnhhOGJibU9K?=
 =?utf-8?Q?stJg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS84TlNyaVFob0N5Sjd1bHFCNldRd0Jrbllkd1VONW9qM2h3eGR2Sy9NVVF0?=
 =?utf-8?B?TkZNZGVxSWM5bW1SdVNsR0c4VUNYS2lKZm8rL3NSalNMWTNOemJMSjFzMjJJ?=
 =?utf-8?B?NnNBeWxJeE0zc3QvVEZJNlVNUHVKcDdiYmthUjVFYVJzK1dFbnVCRzVRdmxT?=
 =?utf-8?B?T2l4UWQrQmpXTk9uRWJjTWhtbG8yK3V1dkFpaU5ZWFhEWWhuMkxiV29xZmR1?=
 =?utf-8?B?VmVOUWp1ODI1Y2JnT2dGUUw2Q2ZzMngwVjRDbWhEdmdCTElBTHcwVTdOTU9H?=
 =?utf-8?B?OGsxM3BJazhGd09QUERVemZ3YzF0K0VVYThMbUN3MENUWFpVdW9kMnBnN2hs?=
 =?utf-8?B?STlMSjBWcEg4NktzcTd0b0xVQXNmRnVjRUxSUGx4bUYxektzV1VER0NzYll4?=
 =?utf-8?B?YllUa0RrVXpMR3JrYmw1SmlLdnVZOVRDdDZ2RTkra3FYdkpaOXBaSkpRU3Fj?=
 =?utf-8?B?QUk2K2dpZmZhOWthcHZScXVPRytKejM0T0w1SktldnE2R0IyQnV2YjlzR1BM?=
 =?utf-8?B?V25RTlBmRk9sMXRFVWFTWUxiSlIwdjJyL0dtSkFHTzVLZHVNRWVqbHhnU09q?=
 =?utf-8?B?eWx2NjNXTlljc1pSQjJvbWw0ZUU1aWpOaFA4dzVYblkxa3VtUWpsY0svVmRq?=
 =?utf-8?B?aWowaG5yL29oSVpDNzd5aW44ZzUzNDR2aVRIdEowUWpOSEEwNlo1d3hWRk0v?=
 =?utf-8?B?MmhmamtNRzF3V1RZc3IyM0VKWXhxRksyNG8yM0M0SHhXdkx3WHUvaE0yNE1E?=
 =?utf-8?B?LzBOWjV0TWNSTWxVQkZwVE1XMkVzUXlCM1p1Sk9jdlhRMm1HWGthTFVDWVVC?=
 =?utf-8?B?ckREaG11WWFhSXVLYy9XNHVYNWdPMFdtQUxxWDExZ0JycTdpelg3NmJOZnFM?=
 =?utf-8?B?MXo0bldxZmFBSm5jaDdhc2dhR3Jncy9xOW5VOHlqMXkzTGlwTVBIZXM2cGs1?=
 =?utf-8?B?VktmanNHWS9McExmQTNLdEYwZUhJNFRzSm1odm8yd1Rwb3JNQkhHTjhrYkha?=
 =?utf-8?B?TTA1TXRLYklBblNvN2lDQWdiTm1mZ3lFbThLeU5TK2Y2dXowNTNWdHdkOFZK?=
 =?utf-8?B?OWM4eUY5QkZxVFQ1SGI1c2VGZURJVVNBS3AvZUordmhqZWt3dlFCV3h4RENW?=
 =?utf-8?B?UGh1VXlzL01lc1ErUGdsS05DSENhd3VEODhaakZIKzlrSVVRNmpTeUZXZU1Z?=
 =?utf-8?B?Vm5LTFcwbVNaM2ZQSnhqQ0tYMXFWdnM4NExPUktYVVZicCtZcEpaWnczOHhQ?=
 =?utf-8?B?QjB0bmNIYjRnTldXbGpmNGpWalVYcHdQcDVvdXYvL2xBZVp4ZnhxZndpWmtQ?=
 =?utf-8?B?UU1MUG1jNGNRWU9QWldnd1lBWnUrVmdoS3NiVXRyclNoWDJYOWpSZ21tMGNW?=
 =?utf-8?B?a1IwYnZQY3dTaERuWmE2c2xrcS9GSGx6dUgzRkc1dmNKRlBuWlpMWHBSdlZu?=
 =?utf-8?B?N25DMXVCUGtxbGN6SEdSMmxuL1FMaTFHNkNIejY1bzBTbXE4SCtCa2UxZjJz?=
 =?utf-8?B?Y1h1SElPc09zZDhsV21ReHhHZW0vcGlzalAxWmVqR0pLSUI3T0tTajB2SVNE?=
 =?utf-8?B?ZkhiemI4dHUyL1dOc0g2R3NZREVjc0FOd3V0N2dmU1dKa2xIOEJNOUdYRE1k?=
 =?utf-8?B?N1FmQ0UzeU9YTFNIYlJoZGVYcTVkYUZCazFOaEJuR3ZKNFo2TklUZ3lZcm8r?=
 =?utf-8?B?SCt1ckwxQ2gzcy9UU3EwUDkxbVRDcFpyeEV3Nlk4M3N4ZTZ0dXpDYmtuWXhV?=
 =?utf-8?B?Qmh4RElvTkw5c0FSbWxyR1N3T1ZXcXk1VytlS05oSnh1Q2I4ZnVoMVROQUFh?=
 =?utf-8?B?OTFNNXRKMEFDMVZlYTUwSW1VbTJMWWZLN3B4ZXZsUHhKRU1ZempYOW1WUGpP?=
 =?utf-8?B?aWJaZk5kbURGZzNxb2o0VFhGeTVhRU4yQW1Gcm9pN1R1c1ZFLzRpZUZWUGVD?=
 =?utf-8?B?MW9IM3hSTHVacGYxSzJBbk5IalpIOXhUaGNyVG50dUNQL2RoM2oxdE1OSkty?=
 =?utf-8?B?Z3ludkxzWEcyUWJrMWFDWVZpb3dMOThHeTVrd0hJQkNjNjh4OXhZeFlleit3?=
 =?utf-8?B?R0FEeFVoWjFqT0w5Zm9qaCtmSHFOeHFQd3dNZ0VuMmhmd2t2UDRDazEyVEZK?=
 =?utf-8?B?RjF5eEpybVZnYVJISTNsd21MeGRyMGJ6T2pUblVKTml4QWNobEhnYzM3WVpk?=
 =?utf-8?B?WDFpYnpnVGx5MVlobEl5YU1YZUxRdzh1cVVYL1dKRStzSDZJUksxUnNQWXho?=
 =?utf-8?B?REVzbkw5Y0JyZlhBNEx1QzZLdXR1MHBBZUwrMkZ1a25BcTJJd2NTL3Nud3o5?=
 =?utf-8?B?Rkd6TWZEK1lydmNpRWgxZHQvQ2tnWEVkczJ1Nm5oa3QydFZlZVlYdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481a356d-04a8-4ecb-45ba-08de597ee95a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 06:24:35.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1dXjxqjdRmaTwByJid/lOE+tM6rQ6YWCBXkBbR1nYjGmwJyqSnLb9bKowWUgK5ttgu59/jdjxsaVi2PxHNM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16116-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BA79C623D0
X-Rspamd-Action: no action

Hi,

On 21/1/26 15:04, Jordan Niethe wrote:
> On 21/1/26 13:41, Zi Yan wrote:
>> On 20 Jan 2026, at 18:34, Jordan Niethe wrote:
>>
>>> Hi,
>>>
>>> On 21/1/26 10:06, Zi Yan wrote:
>>>> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 21/1/26 09:53, Zi Yan wrote:
>>>>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>>>>>
>>>>>>> On 14/1/26 07:04, Zi Yan wrote:
>>>>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>>>>>
>>>>>>>>> Currently when creating these device private struct pages, the first
>>>>>>>>> step is to use request_free_mem_region() to get a range of physical
>>>>>>>>> address space large enough to represent the devices memory. This
>>>>>>>>> allocated physical address range is then remapped as device private
>>>>>>>>> memory using memremap_pages().
>>>>>>>>>
>>>>>>>>> Needing allocation of physical address space has some problems:
>>>>>>>>>
>>>>>>>>>       1) There may be insufficient physical address space to represent the
>>>>>>>>>          device memory. KASLR reducing the physical address space and VM
>>>>>>>>>          configurations with limited physical address space increase the
>>>>>>>>>          likelihood of hitting this especially as device memory increases. This
>>>>>>>>>          has been observed to prevent device private from being initialized.
>>>>>>>>>
>>>>>>>>>       2) Attempting to add the device private pages to the linear map at
>>>>>>>>>          addresses beyond the actual physical memory causes issues on
>>>>>>>>>          architectures like aarch64 meaning the feature does not work there.
>>>>>>>>>
>>>>>>>>> Instead of using the physical address space, introduce a device private
>>>>>>>>> address space and allocate devices regions from there to represent the
>>>>>>>>> device private pages.
>>>>>>>>>
>>>>>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>>>>>> allocates a requested amount of device private address space and creates
>>>>>>>>> the necessary device private pages.
>>>>>>>>>
>>>>>>>>> To support this new interface, struct dev_pagemap needs some changes:
>>>>>>>>>
>>>>>>>>>       - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>>>>>       - Add a new dev_pagemap::pages array to store the device
>>>>>>>>>         private pages.
>>>>>>>>>
>>>>>>>>> When using memremap_device_private_pagemap(), rather then passing in
>>>>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
>>>>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>>>>>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>>>>>
>>>>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
>>>>>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>>>>>
>>>>>>>>> Represent this device private address space using a new
>>>>>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>>>>>>> private address to a struct dev_pagemap, where a specific device private
>>>>>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>>>>>
>>>>>>>>> Device private address space can be reclaimed and the assoicated device
>>>>>>>>> private pages freed using the corresponding new
>>>>>>>>> memunmap_device_private_pagemap() interface.
>>>>>>>>>
>>>>>>>>> Because the device private pages now live outside the physical address
>>>>>>>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>>>>>>>>> et al. are no longer meaningful.
>>>>>>>>>
>>>>>>>>> Introduce helpers:
>>>>>>>>>
>>>>>>>>>       - device_private_page_to_offset()
>>>>>>>>>       - device_private_folio_to_offset()
>>>>>>>>>
>>>>>>>>> to take a given device private page / folio and return its offset within
>>>>>>>>> the device private address space.
>>>>>>>>>
>>>>>>>>> Update the places where we previously converted a device private page to
>>>>>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>>>>>> offset, instead of looking up its page within the pagemap use
>>>>>>>>> device_private_offset_to_page() instead.
>>>>>>>>>
>>>>>>>>> Update the existing users:
>>>>>>>>>
>>>>>>>>>      - lib/test_hmm.c
>>>>>>>>>      - ppc ultravisor
>>>>>>>>>      - drm/amd/amdkfd
>>>>>>>>>      - gpu/drm/xe
>>>>>>>>>      - gpu/drm/nouveau
>>>>>>>>>
>>>>>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> NOTE: The updates to the existing drivers have only been compile tested.
>>>>>>>>> I'll need some help in testing these drivers.
>>>>>>>>>
>>>>>>>>> v1:
>>>>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>>>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>>>>>> - Update existing users of memremap_pages():
>>>>>>>>>         - ppc ultravisor
>>>>>>>>>         - drm/amd/amdkfd
>>>>>>>>>         - gpu/drm/xe
>>>>>>>>>         - gpu/drm/nouveau
>>>>>>>>> - Update for HMM huge page support
>>>>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
>>>>>>>>> ---
>>>>>>>>>      Documentation/mm/hmm.rst                 |  11 +-
>>>>>>>>>      arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>>>>>      drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>>>>>      drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>>>>>      include/linux/hmm.h                      |   3 +
>>>>>>>>>      include/linux/leafops.h                  |  16 +-
>>>>>>>>>      include/linux/memremap.h                 |  64 +++++++-
>>>>>>>>>      include/linux/migrate.h                  |   6 +-
>>>>>>>>>      include/linux/mm.h                       |   2 +
>>>>>>>>>      include/linux/rmap.h                     |   5 +-
>>>>>>>>>      include/linux/swapops.h                  |  10 +-
>>>>>>>>>      lib/test_hmm.c                           |  69 ++++----
>>>>>>>>>      mm/debug.c                               |   9 +-
>>>>>>>>>      mm/memremap.c                            | 193 ++++++++++++++++++-----
>>>>>>>>>      mm/mm_init.c                             |   8 +-
>>>>>>>>>      mm/page_vma_mapped.c                     |  19 ++-
>>>>>>>>>      mm/rmap.c                                |  43 +++--
>>>>>>>>>      mm/util.c                                |   5 +-
>>>>>>>>>      19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>>>>>
>>>>>>>> <snip>
>>>>>>>>
>>>>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>>>>>> --- a/include/linux/mm.h
>>>>>>>>> +++ b/include/linux/mm.h
>>>>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
>>>>>>>>>       */
>>>>>>>>>      static inline unsigned long folio_pfn(const struct folio *folio)
>>>>>>>>>      {
>>>>>>>>> +    VM_BUG_ON(folio_is_device_private(folio));
>>>>>>>>
>>>>>>>> Please use VM_WARN_ON instead.
>>>>>>>
>>>>>>> ack.
>>>>>>>
>>>>>>>>
>>>>>>>>> +
>>>>>>>>>          return page_to_pfn(&folio->page);
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>>>>>> --- a/include/linux/rmap.h
>>>>>>>>> +++ b/include/linux/rmap.h
>>>>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>>>>>>>>      static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>>>>>>      {
>>>>>>>>>          if (folio_is_device_private(folio))
>>>>>>>>> -        return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>>>>>> +        return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>>>>>>>>                     PVMW_PFN_DEVICE_PRIVATE;
>>>>>>>>>
>>>>>>>>>          return page_vma_walk_pfn(folio_pfn(folio));
>>>>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>>>>>>
>>>>>>>>>      static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>>>>>>>>>      {
>>>>>>>>> +    if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>>>>>> +        return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>>> +
>>>>>>>>>          return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>>>      }
>>>>>>>>
>>>>>>>> <snip>
>>>>>>>>
>>>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>>>>>> --- a/mm/page_vma_mapped.c
>>>>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>>>>>>>>      static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>>      {
>>>>>>>>>          unsigned long pfn;
>>>>>>>>> +    bool device_private = false;
>>>>>>>>>          pte_t ptent = ptep_get(pvmw->pte);
>>>>>>>>>
>>>>>>>>>          if (pvmw->flags & PVMW_MIGRATION) {
>>>>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>>              if (!softleaf_is_migration(entry))
>>>>>>>>>                  return false;
>>>>>>>>>
>>>>>>>>> +        if (softleaf_is_migration_device_private(entry))
>>>>>>>>> +            device_private = true;
>>>>>>>>> +
>>>>>>>>>              pfn = softleaf_to_pfn(entry);
>>>>>>>>>          } else if (pte_present(ptent)) {
>>>>>>>>>              pfn = pte_pfn(ptent);
>>>>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>>                  return false;
>>>>>>>>>
>>>>>>>>>              pfn = softleaf_to_pfn(entry);
>>>>>>>>> +
>>>>>>>>> +        if (softleaf_is_device_private(entry))
>>>>>>>>> +            device_private = true;
>>>>>>>>>          }
>>>>>>>>>
>>>>>>>>> +    if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>>>> +        return false;
>>>>>>>>> +
>>>>>>>>>          if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>>>              return false;
>>>>>>>>>          if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>>>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>>      /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>>>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>>>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>>>>>>>>      {
>>>>>>>>> +    if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>>>> +        return false;
>>>>>>>>> +
>>>>>>>>>          if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>>>              return false;
>>>>>>>>>          if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>>>>>>
>>>>>>>>>                      if (!softleaf_is_migration(entry) ||
>>>>>>>>>                          !check_pmd(softleaf_to_pfn(entry),
>>>>>>>>> +                           softleaf_is_device_private(entry) ||
>>>>>>>>> +                           softleaf_is_migration_device_private(entry),
>>>>>>>>>                                 pvmw))
>>>>>>>>>                          return not_found(pvmw);
>>>>>>>>>                      return true;
>>>>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>>>>>>                  if (likely(pmd_trans_huge(pmde))) {
>>>>>>>>>                      if (pvmw->flags & PVMW_MIGRATION)
>>>>>>>>>                          return not_found(pvmw);
>>>>>>>>> -                if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>>>>>> +                if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>>>>>                          return not_found(pvmw);
>>>>>>>>>                      return true;
>>>>>>>>>                  }
>>>>>>>>
>>>>>>>> It seems to me that you can add a new flag like “bool is_device_private” to
>>>>>>>> indicate whether pfn is a device private index instead of pfn without
>>>>>>>> manipulating pvmw->pfn itself.
>>>>>>>
>>>>>>> We could do it like that, however my concern with using a new param was that
>>>>>>> storing this info seperately might make it easier to misuse a device private
>>>>>>> index as a regular pfn.
>>>>>>>
>>>>>>> It seemed like it could be easy to overlook both when creating the pvmw and
>>>>>>> then when accessing the pfn.
>>>>>>
>>>>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
>>>>>> return the converted pfn instead of pvmw->pfn directly. You can add a comment
>>>>>> to ask people to use helper function and even mark pvmw->pfn /* do not use
>>>>>> directly */.
>>>>>
>>>>> Yeah I agree that is a good idea.
>>>>>
>>>>>>
>>>>>> In addition, your patch manipulates pfn by left shifting it by 1. Are you sure
>>>>>> there is no weird arch having pfns with bit 63 being 1? Your change could
>>>>>> break it, right?
>>>>>
>>>>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6), so I
>>>>> thought doing something similiar here should be safe.
>>>>
>>>> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is used
>>>> by almost every arch, so it has a broader impact.
>>>
>>> That is a good point.
>>>
>>> I see a few options:
>>>
>>> - On every arch we can assume SWP_PFN_BITS? I could add a sanity check that we
>>>    have an extra bit on top of SWP_PFN_BITS within an unsigned long.
>>
>> Yes, but if there is no extra bit, are you going to disable device private
>> pages?
> 
> In this case, migrate PFNs would also be broken (due to MIGRATE_PFN_SHIFT) so we'd have to.
> 
>>
>>> - We could define PVMW_PFN_SHIFT as 0 if !CONFIG_MIGRATION as the flag is not
>>>    required.
>>
>> Sure, or !CONFIG_DEVICE_MIGRATION
>>
>>> - Instead of modifying pvmw->pfn we could use pvmw->flags but that has the
>>>    issues of separating the offset type and offset.
>>
>> It seems that I was not clear on my proposal. Here is the patch on top of
>> your patchset and it compiles.
> 
> Oh I'd interpreted “bool is_device_private” as adding a new field to pvmw.
> 
>>
>> Basically, pvmw->pfn stores either PFN or device private offset without
>> additional shift. Caller interprets pvmw->pfn based on
>> pvmw->flags & PVMW_DEVICE_PRIVATE. And you can ignore my helper function
>> of pvmw->pfn suggestion, since my patch below can use pvmw->pfn directly.
> 
> Thanks, looks reasonable. I'll try it.
> 
> Thanks,
> Jordan.
> 
>>
>> Let me know if my patch works. Thanks.

We need to be careful now to ensure the PVMW_DEVICE_PRIVATE flag doesn't get
overwritten:


--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1871,7 +1871,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
          * if page table locking is skipped: use TTU_SYNC to wait for that.
          */
         if (flags & TTU_SYNC)
-               pvmw.flags = PVMW_SYNC;
+               pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
  
         /*
          * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -2304,7 +2304,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
          * if page table locking is skipped: use TTU_SYNC to wait for that.
          */
         if (flags & TTU_SYNC)
-               pvmw.flags = PVMW_SYNC;
+               pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
  
         /*
          * For THP, we have to assume the worse case ie pmd for invalidation.

Other than that tests ok.

Thanks,
Jordan.
>>
>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>> index c1561a92864f..4423f0e886aa 100644
>> --- a/include/linux/rmap.h
>> +++ b/include/linux/rmap.h
>> @@ -921,6 +921,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>>   #define PVMW_SYNC        (1 << 0)
>>   /* Look for migration entries rather than present PTEs */
>>   #define PVMW_MIGRATION        (1 << 1)
>> +#define PVMW_DEVICE_PRIVATE    (1 << 2)
>>
>>   /* Result flags */
>>
>> @@ -943,6 +944,13 @@ struct page_vma_mapped_walk {
>>   #define PVMW_PFN_DEVICE_PRIVATE    (1UL << 0)
>>   #define PVMW_PFN_SHIFT        1
>>
>> +static inline unsigned long page_vma_walk_flags(struct folio *folio, unsigned long flags)
>> +{
>> +    if (folio_is_device_private(folio))
>> +        return flags | PVMW_DEVICE_PRIVATE;
>> +    return flags;
>> +}
>> +
>>   static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>   {
>>       return (pfn << PVMW_PFN_SHIFT);
>> @@ -951,23 +959,16 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>   static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>   {
>>       if (folio_is_device_private(folio))
>> -        return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>> -               PVMW_PFN_DEVICE_PRIVATE;
>> -
>> -    return page_vma_walk_pfn(folio_pfn(folio));
>> -}
>> -
>> -static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>> -{
>> -    if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>> -        return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>> +        return device_private_folio_to_offset(folio);
>>
>> -    return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>> +    return (folio_pfn(folio));
>>   }
>>
>> -static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
>> +static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_mapped_walk *pvmw)
>>   {
>> -    return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
>> +    if (pvmw->flags & PVMW_DEVICE_PRIVATE)
>> +        return page_folio(device_private_offset_to_page(pvmw->pfn));
>> +    return pfn_folio(pvmw->pfn);
>>   }
>>
>>   #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)    \
>> @@ -977,7 +978,7 @@ static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
>>           .pgoff = folio_pgoff(_folio),                \
>>           .vma = _vma,                        \
>>           .address = _address,                    \
>> -        .flags = _flags,                    \
>> +        .flags = page_vma_walk_flags(_folio, _flags),        \
>>       }
>>
>>   static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index 141fe5abd33f..e61a0e49a7c9 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -136,12 +136,12 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>               device_private = true;
>>       }
>>
>> -    if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>> +    if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))
>>           return false;
>>
>> -    if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>> +    if ((pfn + pte_nr - 1) < pvmw->pfn)
>>           return false;
>> -    if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>> +    if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
>>           return false;
>>       return true;
>>   }
>> @@ -149,12 +149,12 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>   /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>   static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>   {
>> -    if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>> +    if ((device_private) ^ !!(pvmw->flags & PVMW_DEVICE_PRIVATE))
>>           return false;
>>
>> -    if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>> +    if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
>>           return false;
>> -    if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>> +    if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
>>           return false;
>>       return true;
>>   }
>> @@ -369,7 +369,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
>>           .pfn = folio_page_vma_walk_pfn(folio),
>>           .nr_pages = 1,
>>           .vma = vma,
>> -        .flags = PVMW_SYNC,
>> +        .flags = page_vma_walk_flags(folio, PVMW_SYNC),
>>       };
>>
>>       pvmw.address = vma_address(vma, page_pgoff(folio, page), 1);
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index be5682d345b5..5d81939bf12a 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>>       pte_t *pte = pvmw->pte;
>>       unsigned long addr = pvmw->address;
>>       struct vm_area_struct *vma = pvmw->vma;
>> -    struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
>> +    struct folio *folio = page_vma_walk_pfn_to_folio(pvmw);
>>       struct mem_cgroup *memcg = folio_memcg(folio);
>>       struct pglist_data *pgdat = folio_pgdat(folio);
>>       struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
>>
>>
>>
>>
>>
>> Best Regards,
>> Yan, Zi
> 


