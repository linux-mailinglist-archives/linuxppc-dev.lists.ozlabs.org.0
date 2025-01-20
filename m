Return-Path: <linuxppc-dev+bounces-5382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE532A166AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 07:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc0pc28hLz2yyC;
	Mon, 20 Jan 2025 17:31:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737354664;
	cv=pass; b=kLRs34ASDWIOWW5VLEDv7xbCvN/jsvlApKRFnbI9vd+uma5CALAQTB5QQq4I1d4yxNTbTe9w2qFokuLylD1dL53zldXbO5lu/iiASALHvsKWNeGLnoK7A1vQZj6M/1esQihh4b1cC9qydONrfVOOlvRiLJM+4pw+7T8/eVWnnPIq65iHwTDwif/d3YsO8jFGjAS2+tOlDayiQ5AZiRUzo+mLEqpLdDc3/k3x9PdXddEkLW2eiwVq/KlAh7Z7Z0HNid3z0OT+KniC4p6DYFznoZFmd4kXlX0Uvp5+xhjwjEL1JvMxdOCThpBgLP5vbTZ/q95SdezFTUAmtbS2OXBz4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737354664; c=relaxed/relaxed;
	bh=I1Vw+/0bfZcoFAwxk02fBnQ+4VoHwnqHo0UMGDR3MMs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=isgLqo11yUfq5pHv1tpqTfm60fXEe1VhAajV3ecRtnUHtPOcXaT9cWQ3gBjBuXNI+MM5zi0OINBDKUV8UWPaOqkZF9Pl5Yde9YFCnMVV1zVD7RT8u+7uei7TPyATQYzFYS8dEOjoh9yrtzN9oVdW2SV7PPefi7pfuo49y0HB1YycTrqcTY89jhbnqE015I9TQ/E4bG3/JLu8cB5al/kFOt2dcJbv7BrFctpOAL9elrgDg+vZQPY8aqQ5nMtzVYtc5uKQzCNmUH/qbQUFAZMVdnb0hcdAUMMh+vpafryU3CrPDfDB0qCKeC80KlNtf5hcaqh81pkPO05KC+oWmjjXrg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yDY9AzJp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::624; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yDY9AzJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::624; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc0pX2L41z2ywh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 17:30:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GP18N117S+wmehV9M6pZw4qs8oKcgIkRhChBa2dxSK7RSyfqzSrHZTXI3YGbvDPjfbUREYcu2zUk1x7poCdEbEpBfqT4Jl2MIGpOZrUsJTRZjqvBedT/KyxsmpUppv3MR0mNE9/AQ5b/CB71TPlNHUH0bz6YJcPqPVTJfUvf7b5L/zKd1ks924EZhDAQbOPNR22LQ6q9bzEfIGLsShipmJSXXfGsNJJc5j8pid/reHNsbYJeqM9pycrO/LhAe+2BRcz05hBHMswxgUclnq+quPUUZuExuNOwf330v04iJYqTUNrVS34pHzGwsvDS225uk5qbhC78GK7m8EfOjAu3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1Vw+/0bfZcoFAwxk02fBnQ+4VoHwnqHo0UMGDR3MMs=;
 b=blgOuiuNthLbh7PjDeLlyFU8DuZ1WMdAtXUKyOcRrOxRwpLvZRK9/IZkRVBVEzibmT/UPZ0HqOxD5TXU0XayT2p8uJk0wDEvHBPPz4+PcVInu1Kv13m4ZTBv/8McOLyJJtjX2Q/7UfeK5M2xY85Gmxc5tziUd+zpAJ/Oh45Fw10drbSrWE6W5pqSkRm10ZqPeVjCUC8g8AuaDSnlqH0mI/jOt0tS82c6oBAcu9OJ9wQ7bxdGc5U2vKFPXrHUXqHHoGT3myADVQS6KAYHKttLeesL+yyT9f45+7JGw/JyTDEffZpHzbeiDgJvvCAyK/U3OyiVOME3twLhhHROVg2QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1Vw+/0bfZcoFAwxk02fBnQ+4VoHwnqHo0UMGDR3MMs=;
 b=yDY9AzJpocrg2+kyJxqwlfaDQVzo+XWHrbBdidDWhDsq07igvZ4BgTZCVEx7f06xpDv3sAT8zh7ixXMFlWTShp1pQRa1CpQnLSViwYkbyZzvudFPTAQRJiUW2tVmpKCsSLnjQ+zruXq7z65Hb9QusotgR0hmEdfINDodzynbXwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 06:30:39 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39%5]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 06:30:39 +0000
Message-ID: <d4403303-81b5-4f7d-b7b1-1550c37d9e0f@amd.com>
Date: Mon, 20 Jan 2025 12:00:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/perf/tests: Update event_groups test to use
 instructions as one of the sibling event for hw type
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
 irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com,
 Tejas Manhas <Tejas.Manhas1@ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>
References: <20250110094620.94976-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <20250110094620.94976-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0208.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::16) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 85407465-94e9-4d4b-c486-08dd391bf4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlpLaUNmR2RoQTRsbi9HZ1V3WXMzK1pMdGQ2ZTA1Ukg3VXhWYXVnV1I3L0xi?=
 =?utf-8?B?TjRBcjRNVHhNQzJiV1JXTWFyRTBuZHIwQjhaWVNNTDVBQ01peDFUZkRZRTFy?=
 =?utf-8?B?TjBtSWw0bFdGTEJkSStLQ25NR1hZRXRqcFMwaHYySkE1K2hLOUlYWUdWbUFU?=
 =?utf-8?B?T2xTanM0cW9Ddzcwem8rai9VaFd2bGM1aVJzM2Vid3dZT2VQK1dXQitHRlhk?=
 =?utf-8?B?TXVDMVNxYmI0WXNtN1N1NFhPQlhKSmhrMExCNEdxb3FIR1NqUVUwMlJsNUcr?=
 =?utf-8?B?OWkwRGJCTm0wVjZGZXRBQWhSVXBoVThxTURJS2dLeEkxdmt6QzA4OWRHQjFi?=
 =?utf-8?B?aE56VGgzK1JMMk9PSUJuSm1uSzBhandyZUxhMXpic2VpbHEzQnpmaHZzS3JF?=
 =?utf-8?B?WjBXL3hONTVJR2xXbFJRcFcxRmcrV2hNV0pNZDdabjE4OU0zaWNFaWxBSW9M?=
 =?utf-8?B?S0x6ekhtdGVVa1FRQnJYYmEyKzlRdXZOZ2tTOWVBRCtDb2Y5QUZDdnAvd002?=
 =?utf-8?B?eW1DeFhuSlp3Z0liQXNFanB0b3Z6cUNxa0U4bzhOSytGZDZDTTFxU2Yxb3Qx?=
 =?utf-8?B?RnJEa3phL0hYY1ZDZU1rRUJ6eTZZaklQOGd4VVprYmo5aEZMOWFmMGRDSXM1?=
 =?utf-8?B?ZDFVVkxXOHBBWVZLblBFUnpvVTJVYmRWdW5kcHl1Zi8xMVpzRllSNDZEVHc5?=
 =?utf-8?B?N3QxZ1RrY2tlV3dZRHBoVXZMSzFaV2ZDUzVMV2k4UWhjNHRHVkZVcXBIYTNi?=
 =?utf-8?B?RGxIT3dYM1F6WThjVmYxL2M1ZElXcGx2YURpOXM1NjBqRlY4ZDlnV3liMXlM?=
 =?utf-8?B?UFFmUG5xM29PRTZIN2tUZGZnNUljRFRrMTY1ZmFmLzF6bW9vSy9pQk1CTEl4?=
 =?utf-8?B?TGUrUXdFNk9uV0dhWHh2U0lsQjFEVFJvWndOYUhZUkhXWFhqUXliUGIyTzZt?=
 =?utf-8?B?RlRnNnpkbEZPeFZ1U2p3V0dQempnVlJ3YVhob21aeHZtRWhLWW9XNDZRMDRp?=
 =?utf-8?B?VEZHUnVQZTVuVTVnYU1DUThhTHZhS3hGNy8zcGR3RkphS1JOWStMZ0x1bnJW?=
 =?utf-8?B?aXZleHlaeDJnMnNoais0WDBubVpiQWYwTUx1MFpzdUdkVXlqajU4a0N4V0Jj?=
 =?utf-8?B?Y2R2U2JDYkVaaEVIQk1zWGo5MklyaTh5aXJ5c1p3Rm5MenJPeklSYW1mMCs3?=
 =?utf-8?B?YmVjYmRxcEhzVHRvMUF0VmFoZkg0MHVDWU5jMkVleS9XRzdPS2N5YjVBNmhp?=
 =?utf-8?B?czJ1MHRnL3VYOFlKRGJUTmxlV2tiTkQzNTA1OGg2am5La1JqR1hNQWhDa2lC?=
 =?utf-8?B?cDFuY3JrampIRTgzYk5uU2loUHozQm5nOWdtQWRtaWpEUktGNys1aE45cVp2?=
 =?utf-8?B?dnFSZGRDRXN3WHpYK25pamZiOGk4M1hGaStRdCt4eFptbll4TmxrOWFIb0Z1?=
 =?utf-8?B?bDhiQWwvelB1NHhRK1J0RkhPSTRLSjRKb01vL3l1L3VoTkZLYTEyVHpWN3NX?=
 =?utf-8?B?YS83MXByb2JydE1TQ0gybCtZMEt0T0cvVDZmUVVrc0FVZERuaVcrNHNpUFZQ?=
 =?utf-8?B?blF0UVZBeVExWTdLa0VBVHcrUmtOWVRHTC9BQ2wzdGp4MzhTOVJIUEFoSnE0?=
 =?utf-8?B?UHFFNHdZc0t0UkhTeC80bEFReW5sZ0ZkOWRKVG5wa2I0U09ZOWJ2cjI4SXFj?=
 =?utf-8?B?VkY4R2hONVRjdllVWG9wekx0MFFBOHZieXFLd0diL1Q2S0FuYWZUTXhuMmpi?=
 =?utf-8?B?dU1uOHJ0QXpISVhSYnZmUDJ6RSs0WmhrbmdEYmtvdDNiK04zQ0IwcnJacXZy?=
 =?utf-8?B?bTJsd0MzeEg5QlVMSGV6MTV5ZGY4WEIyQThVN04rTzVuaytTZlBQRmNoUGhj?=
 =?utf-8?Q?loORP0JyLJunm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djhSVU04ZjNiMUFYVHpGUm15Z3NoZ2RtbnlvZTV5RW5uQzYrQjN2ZHpweDlN?=
 =?utf-8?B?MlVUL0FiUllnaUZIYnp3WXh0ZVk2N1JEOUNlQ2E1R0RZZGNYQUhPWU9wNFNQ?=
 =?utf-8?B?YzRNMGV4OHRWOE1uN3hsMk9wTXpkRHIvdTBPYjdzMzlLc2c2L3lsMUFqNmVV?=
 =?utf-8?B?QjBKUDRPQ1kwYTN5MGt5QWx0UUM2RjlQN25HRkxTRHBEQ2RiajBhdVNFMmxU?=
 =?utf-8?B?SC9EUmdMR3FTbDNadjdlak5NdEpQb0pDYUh6YlJ2eFFSWVVGeWpZMGxpcHlF?=
 =?utf-8?B?a0xTVk9xbUYwQy9NUThLdHAwVlA2eWxodm1TWk9BNHhxa1Uva3RtQTBGVW52?=
 =?utf-8?B?MHBzanNVbVJOSWZjY3hjVCtnT3U0U2tBcFRhWktwaW9IdWxHaUFtNXgvanlQ?=
 =?utf-8?B?S1BlTUFSZC92WEtOby9YOXU3d2duYTJYa3ZmVjBmNmpMM2tlajNtOGZlRkVB?=
 =?utf-8?B?UXFnaWdacmFPNUFJN1ZCNmwzNFk1UFpYVm1SU2hsNmFsL0cyYTFJME1TbC9J?=
 =?utf-8?B?NFhlMmNYYUUrR2JEZ0xVN1BkS0V0a2lOaERGeUVWcEpDRW1jMjgrcWh4RGdX?=
 =?utf-8?B?SzRqK1NUaXpJUXg1RkNOUjRleGp2NG5QWXg0NkxONTV4OGpnUUwwRE5CK3Ny?=
 =?utf-8?B?ZHRYWmlmMUlYS2RPZ0FoSDA0bElWcTZJTkhLS0VUaDR4bDdaWFZxN25RRDBS?=
 =?utf-8?B?S3ZLUG05UlJsWnRISFdKTWJBYVlVMzhRZmhqYWZ3ZDhlYXMwa3VuUkJ2ZkRt?=
 =?utf-8?B?aHI2OUdWM3NuWDRtZVppR0paOS9VeFhtUHhGVGo0blcyQjJtMEtCSUV3c0wz?=
 =?utf-8?B?V1piQlhwbHBWbFNaMlAxZjlrQUlpMXVGdERDQWtTY0dDOUZRcHZndTBsdFdP?=
 =?utf-8?B?bmd3WTNWSmZVV3g1OVdWNm5TYTJ4RktYN291REYzdSszK0xsMVFVclFOdW1H?=
 =?utf-8?B?b2k5SFBreWN4bm5va1pqTVU2THpvVGtyYTNJcEIxYnprYmpKSHdJRm1lZzE0?=
 =?utf-8?B?dlJ1Skl1WkEwODIwckNmaHZJUS85MG1VZmphaXRBdnptRWNZUHNZUVdQanBH?=
 =?utf-8?B?WUQ4M3l1RGRQK080YXFJaUJrbnkrU0pQL0FJd1hpM0hVcUEwYzlVTzBuUmNT?=
 =?utf-8?B?cHVNb2NoYXUvbFVsQWlDdjB0Qmx6TTRrclZ1YjFXV0xvRkNXYVgrZHlXQ2t6?=
 =?utf-8?B?OHhvZ1oyS0xSTHE0M1ZsOHBJZ2RYWWZnVGhaWURxVmU2dXJQbUE4ZlFsaER3?=
 =?utf-8?B?d25IL0tPNkFHOERhNUZCYVIxUTFPREd6YkxQM2o0WHkwTEdCUlhmbTk3RnZk?=
 =?utf-8?B?dDFGMW04bktnYXd5YjhObERxbWN6dnQ2OW9zSG9XR01vc2ZoWVFYa0tPVVFy?=
 =?utf-8?B?UzFyK3pCRHRsWFY1WmF4TFYxOE5tTjBkTGNKbkROMlphMHNNcTZ6QjZ0bjBF?=
 =?utf-8?B?dVNYTHg0WjBiREtSSnloQndUcFQ5aUVnSHl5SGVSbXZPYU03N01QdDJFdG9T?=
 =?utf-8?B?TkxsR2h3K3kxbGhscnNBbkZMR3kyMTZsTWwwVmt2L2s0bWNiczBaWWJGS2sz?=
 =?utf-8?B?RVlXSms0NGw4SUZaMWdvdVRBb093QllLYzcreUVqU1Y5eFpQWjFWd2NPbHJJ?=
 =?utf-8?B?MWY4UnI5ZzBVSjVqb2wxYnNWK0EvZmVTQzFSeUp1aFJVejI4aGNzUlRYYnZO?=
 =?utf-8?B?MXNPd0Q2dzdwN2lVSnpFTlZlTk5rbENYcll3eUMyVGR4dU04citrczZrbGRk?=
 =?utf-8?B?NGVSd1RJYThjMkszSktFRndDTUN5U0EyU3U5SWJHYURlVzg1Uk82S2ttZno3?=
 =?utf-8?B?NXJrbndHNTBvT1lxbWdLVUtDcDhWbE9peFNSMEYzQjlpRlJuMEVlRUpMTnV3?=
 =?utf-8?B?aHRKdndmQkRZSUJKNjVlME5EbzhpSWU4MDZISXJLSkViUnRCemYwdXZsV0Fv?=
 =?utf-8?B?SG9SZW5ERnZOVlVTNXEzdEhwYWxZdDk4dytQZjRwVldpYksxL090NWQ1eGVL?=
 =?utf-8?B?RU9OTlRzaitHa3NCYW1JTFVtOW1TdzYvZlF2TkhseEVrenNIcWhQNG5KWHI4?=
 =?utf-8?B?cHp1VzlqYTZqMHZFNFFuSnFrQVVwNU5ldXNJUE9POHFXNFlrOGRWb3J6R3Uv?=
 =?utf-8?Q?u0hfYdwLShhH0O9wv5/F31/yH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85407465-94e9-4d4b-c486-08dd391bf4a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 06:30:39.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6ermVfYnUPnqoCf+9D4aP02ilQvUazh64yYUEzqIoF9Wm0DYjW+VM4Ft+XYpVoHNbnWaspv02GXLSe9ZU2s8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Athira,

On 10-Jan-25 3:16 PM, Athira Rajeev wrote:
> In some of the powerpc platforms, event group testcase fails as below:
> 
>    # perf test -v 'Event groups'
>    69: Event groups                                                    :
>    --- start ---
>    test child forked, pid 9765
>    Using CPUID 0x00820200
>    Using hv_24x7 for uncore pmu event
>    0x0 0x0, 0x0 0x0, 0x0 0x0: Fail
>    0x0 0x0, 0x0 0x0, 0x1 0x3: Pass
> 
> The testcase creates various combinations of hw, sw and uncore
> PMU events and verify group creation succeeds or fails as expected.
> This tests one of the limitation in perf where it doesn't allow
> creating a group of events from different hw PMUs.
> 
> The testcase starts a leader event and opens two sibling events.
> The combination the fails is three hardware events in a group.
> "0x0 0x0, 0x0 0x0, 0x0 0x0: Fail"
> 
> Type zero and config zero which translates to PERF_TYPE_HARDWARE
> and PERF_COUNT_HW_CPU_CYCLE. There is event constraint in powerpc
> that events using same counter cannot be programmed in a group.
> Here there is one alternative event for cycles, hence one leader
> and only one sibling event can go in as a group.

For power9, cycles seems to map to PM_CYC event:

   GENERIC_EVENT_ATTR(cpu-cycles,                  PM_CYC);

However, I don't see PM_CYC in power9_event_alternatives[]. Is PM_RUN_CYC
and PM_CYC are same?

Thanks,
Ravi

