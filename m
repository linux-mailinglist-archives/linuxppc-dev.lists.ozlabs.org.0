Return-Path: <linuxppc-dev+bounces-16343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF67OviZeWkNxwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 06:09:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188649D27D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 06:09:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f19Kx5q6Lz30M6;
	Wed, 28 Jan 2026 16:09:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769576949;
	cv=pass; b=OwtR+1DASSmJ+71HAIf0+Xudz0YdCzal2Qq7Rk78Jd4OAPqq5jv6ZTdIqsactRNYDS07Zx9zIewOTj3dyLDbwjJrmn9xjPpYh8PEl8ul0BRc2E4Fwcdbbbk7dXgwNGTyP5jmHt9QdDgkLm90hjKrjfsCfZ2prq9HBSWLpbe9GxtnIgvw3Oqe0xQV//v61prxWnzn6qH68AwSnoGc1qiLEQ/b/RkoOkA9a+2TpKioBmxIF0ze0Ir4/wBq/QFzYqAE5WRJHa4DGJQq6a7h26wRHbDCFaXQzzVxKYBGDvQfq26zbOC1B0Rg2Ssh34rXklLXois2gxeNqzVxHvaiMB7wUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769576949; c=relaxed/relaxed;
	bh=8tXrEXGPotGXivAdOvTKL83UcAuZFwPMWGPlVI8N6p4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TzBrqxkdqhFbFX5AvKeiU6hr/tvo7hmVAJzyfcqryyPO2TH8//DfMNhmfhCwELnV0ZK5Bu4XAQMD7S7emqswXeOzzwZOmA8+3yacs/ctt5MJwv1z7xC/R4rGxAKTqguLAb2dkNMsHNQvHOgDszOIADt8Rcb47U4T+U6jwYFI2Nyh2WvUpdsWYMrNi/+H7NTKIV3hPpRwwyjU3rsNPJ31Jqwaw0Q+1l7rDSYkzSXy/HuqzBC+89rAOM89j0c43Wym8D3Cj64rumzVh5NDHdfH9n5bsGJ7oa1eeVpspP/klBVaRecbIkeKYJshWFPJyxD2If+SpAf8l9B0byLHT4G92A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynMvl2ND; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynMvl2ND;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f19Kx0p2Fz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 16:09:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNke7R7rlF7Mo3s0hRWehhWROialcS3E+MWw8pBe4PfBWPCedkhni2ayQ2w9AB2CsGVCPaT+NE27OdFwosU4prZLsepwwdw3ekIo3Mh+JlALxWvTxRRLUQrqOIDGtX/hu8KkXEZG7SBiSQjExohu+3tvTOT+IrD7Ph7YhXdfoi6RObBT5V+ZUBbp7e59VC+lrKB60VS0MbdKspIqao2HLEvzTZRQWdImZng9lQjbB1mxsexztZ+bC8UU9V3r1BRA6O3FZTTAjj9HP8YYVHw3I2ZW/Exq6TiAGsq9Tp0ISxkKu3g3rIIt5G5zolLFJLJehrYqgK2otZDfjyHdPdLktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tXrEXGPotGXivAdOvTKL83UcAuZFwPMWGPlVI8N6p4=;
 b=iXRNaIICNYrNo1G4WdKeGGLKKGsjOKxYNV3nwgxBVyBV1gcTSjJwEhLI0D8F+XPfcmDLkHKIpQ5deVAcb4pUQmPiXbAquxR+XXVh57eAc7EjnIVWIyTi0heQa6EtB8zqiGaZarC9sz/UOWQVI/TUKr5yz8qTY9T1rIXbDtqb8WVkuqpg4cHfI8SioSn6wGh3AvGgmOZCvn7KKnveQIOXJ9jNng2/Yx5w2OMrX3R7shox5kKP9TUDBCdup17n8Ffii2pRKs9TESe6NSz3OXsiHLdB5Fgzr2kpXihTQi4A0boKvF+S2WksByK4+gicOb02tNMO91lrretnyFmIrj8kAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tXrEXGPotGXivAdOvTKL83UcAuZFwPMWGPlVI8N6p4=;
 b=ynMvl2ND8e3W4qPNJVC8sS1e5/69pqQJwGL0ejpdIgXJS8VunRm/XIRdDrblRPj7lWBzGemr5NRxH/NjbUGDAaBQ0YETzA0ktpUc6COhwGA+UGi2C6huaqTgUTCFhteFoKyOCGYWHdvXUwDLcnmTmjxukJw14lXQVj4FHU3AoWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 05:08:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 05:08:46 +0000
Message-ID: <20b283c6-d75d-400c-8955-851534b2f4f9@amd.com>
Date: Wed, 28 Jan 2026 00:08:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] drm/amdkfd: Use migrate pfns internally
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 jhubbard@nvidia.com
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-3-jniethe@nvidia.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20260123062309.23090-3-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c33199-73e9-4cac-54c4-08de5e2b50b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmh1TDRZQStDN1g4UFYzVUo0LzdBd0ZVMFR5K1Q5N013ODhxMHUrQndBRlNz?=
 =?utf-8?B?ZUpuOTFyN25RbXVabXIrNGtkUlVxakx3c2FNSWpmSExjN2JoK2E1RmZuK3Fh?=
 =?utf-8?B?NW9vclJ1Tlp4WGdqMDY3SWN3Qi9HaXNIVHJWbjdDTzhUeE5SbjZtSUZRTXZN?=
 =?utf-8?B?VW1zbXJISGxibmZZNzN3cWNZVU9PUUdHWTA4ZlU0NjllWEcrb0N4WnF6TnBK?=
 =?utf-8?B?SVhJbEhURjZHeHlidnkrVHAwVW9WWTh6Zi9xYXlPZS9nOTFqd0pPMUFpL2xH?=
 =?utf-8?B?VXNjbWlJbU1BckFaRTRTVnAxOGVRZytmUFpvSDZkcGxYOGlnTXcvSDFHR1hS?=
 =?utf-8?B?MnpwWGpVbkJ1YllzbGx3SEVUVDFuQTBTOFBaSi9jay9QUSs1Z2dLRFpLVkFa?=
 =?utf-8?B?aHo3UW9ReTI0UHdrZS8yakZST3UzMi91ay9DQmw0UmVKQ3AwQUxlT2dBVVFt?=
 =?utf-8?B?UmNoQ0ZSb3dkWUNpVlhtM2Zhd25rdTlSYjNKa2FzclQ4RkRWNWJ0UGVxeGd6?=
 =?utf-8?B?TmhkL3AwdTM4OE16N3RPaHd6VzJMZjlDdUJlUnRuOVBSVVJjellKZStaUnhE?=
 =?utf-8?B?UHpQK3BIQmNEVXJLNHJBTi9XbjI3L3BtM2R5VWxBMHlxNGlYTXZvNFVqU0x3?=
 =?utf-8?B?ZTNUNDBZK1hXN2lwMFlkeWNvdUtRTjRCd3J2TUZJR2ZZcUsrN2NCUGtndkQ0?=
 =?utf-8?B?cENlVjk2Y1QzbW5ZZVpiVWRKb2tmNlBVZFEyL3FxUWhDa3BCZkVJOHByNjNH?=
 =?utf-8?B?NWFMVy9DSzR4UEdROTF4eEtNQmhoM0FNT0V0SmFtR2cvVVVBYzZpRnA0NGRG?=
 =?utf-8?B?bm04ZjN0UVNkSEovZHp5dFVHWVdvbDNGN0drZ3BTT2NSTC85eFhBVTVrQzds?=
 =?utf-8?B?WnY2M29jL2N5R0Znd2xpSzZmdmNEODZ6VVgyU24ycS9JanVPMFBSa3lQbFdB?=
 =?utf-8?B?clAzZ25SSk9Vam1JMDJYbFU1MkxNNEhWWXVJcEZyNHRTckNkdDdITlFmN0dK?=
 =?utf-8?B?eGNyNEhERWZhRnVsQmxoeGhkRVVSSzdjSjZudWJldjg4SEhZRnRONnZPZVRO?=
 =?utf-8?B?QzlTcW9rd0tQeHdZdlM1bG93TTZPMWVhbnJFV1N4K0UvdXBqdEFpWUQ1dXFn?=
 =?utf-8?B?VnhWVWN6TmM2cWxhL2xnNjJ5MnQvMW9HeU12dStxNWJ5K3lxdWloVmVRV3JG?=
 =?utf-8?B?MnNEb1d3blpTNzk2SllLTFlvVDVmcWlIZWo0SHU1bWFZdm1RU2V3bEd0blhP?=
 =?utf-8?B?cG9uTThwbWlOMTF3cGhXcU1sTUxUZXRqZXFhbXRBLy9XRGFZT2NBb05NQksr?=
 =?utf-8?B?RUxiVXZGSWdYdVJVb1hyUlUzVjZKMW00WGVxVWNkeDVWem9NZVRDTHBvYlRS?=
 =?utf-8?B?bHBHLzRQR2RzQ0RGYmxEZ1lLNWhYV2lpRmsrUTU4TWYyOGpCd2VSQmFQOC94?=
 =?utf-8?B?Vm8rWld5amcxNU01QXA2QXUwbW5JZXkyYk1DWU1OaWwvQUlabm5uTndVYk1I?=
 =?utf-8?B?SEgvb2ZKb0drV2RWTmtjMnRHc0YyQkdBQytDNldTZTVOaHd0R3RTZzdscEVI?=
 =?utf-8?B?YW4vM2ZrMmF4bWw4enZrVi84clIxQVEvYVZOLzF6N3NuK1o5WmhaenhGZnRU?=
 =?utf-8?B?dWM1eEtzUHZRRG5oMkliZDl2aVk3UFRkUy84Q0t5WnVKeENXaWxFME5aOVpO?=
 =?utf-8?B?L1VqOWNrSTk3RnJyYzlqSWp3aUZEKzlBNFFPRUhlVndkY1ZTL1prQWtrNXdE?=
 =?utf-8?B?eDJhWlNwK2c1WGUrQzFSUmZrWURTWlNyTUNGa21oRFFGSnZDelNFMWN0d21z?=
 =?utf-8?B?Z3h3eHE1QzdNWnhxZDUwdnZUZ1RwUEc0UEZTd2FpYnpoaVFIZS9jUlV5dmZu?=
 =?utf-8?B?R2ptVExDclB6cmFMZ0QzTDdJNUxpdm95NytXby9uKys4VDJaem9tWDRIYzBH?=
 =?utf-8?B?Q1Nid0dvVElrdDZCY1JKSkc4WTdHSUtnbkYwQzA5blRDUjdQWExxbGJsWEQz?=
 =?utf-8?B?RmRaeloxRUhkWTRSbHpTNEFmOHpXZGlJeS91NWdpN05IRmZaZ253U0tpTjZG?=
 =?utf-8?B?ZFI3V0M2a05FK2RDK2M5SkZhRFkra0J2UkJoS0F1MVhDZlpRaVVCblRtOWNO?=
 =?utf-8?Q?07gI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG51OU9XT0xaR1ZOdHk5N2g1MnpEL1F4YmJyNlFHNW5iWTNMZzVTQkxuOGp5?=
 =?utf-8?B?UmlkdkMwMjRvWlo1ZEE3S2NMZVVlZ3dIKzNnVjZyaFg1UVJ2RlhLQmJhMWxz?=
 =?utf-8?B?b2Q5SW83YlZmblltZG93WFY4NkZlRWRZNEIyMGRHWmVyTGg1MVAxVFkxbm9h?=
 =?utf-8?B?YUNLY0VHVmx1d2N5RXBNMkJDbE1XUkxrd2xWUGNJdmh5RFFsbXNpcVJIN0Q3?=
 =?utf-8?B?eG9NYW5IQ1VCaDFNSGZpVGpucERteS9pZy8wbUluVW9WVjF5dWtpdG8rQzVk?=
 =?utf-8?B?R0dneGJNR0I0Y2VVWmRCSm9zTHpmcGNadXg0TXhsRy9rZkRWYWJzRVN0dnU2?=
 =?utf-8?B?UDQydmZLMnhxQU5kaTk0RVJOOTRTdUg5ampZOTRGVmp5TWY0ZW1jMzQ0dTZ3?=
 =?utf-8?B?NU10aFdrSGZNc1BYdnBwWDRSMDJWVXlKL3RYQnFpRzNRRDNpV3BmRkI1QW9G?=
 =?utf-8?B?MjRJenpCdzQ3N3lLMlhLN1UwYnhkTHdGUGRMV3V3ZWF4SlVuTFJkWkpmTGlu?=
 =?utf-8?B?bUs4TzdQclVpOWxSKzhrVzJKQ2ZWK1c4L2tyN3UzeTlTaVpxNERLMUdQeXR2?=
 =?utf-8?B?cDVrMlM3MVZldkpQcjlEbE5VRjM4d2lPR0M1US84MmlZYlVpc0tLNlVkUEdm?=
 =?utf-8?B?QmZjMVFpcTNxUi9KSHRLUFFhMkVCaW1aS0lVNkVlcjhBbGZqVTMvOVFzL1g5?=
 =?utf-8?B?MGV1cVdkOCszaVRWUDFaRXBsVFZwenRXdTduWEwxMW42Q3FXaDdzODRMVmFJ?=
 =?utf-8?B?NDd1aG5BckVLa252NkVsbmZRaDBPd1JRQTIvVXkyVmJOMUN1NjErMkhnSVJY?=
 =?utf-8?B?TGlMY2FWVWRFUE9OYWdRNjZOQ0diVXlMK25BMnZLT21yMHFDa2l4VURlSkYr?=
 =?utf-8?B?WndtSWJPSDY1TDZaeExNUXA1YmVua2h1UzhSYmVxTzBGbDN2WDAxSks0TWMw?=
 =?utf-8?B?ZXF2dUNoc25hTmN4Y01QbVlaMGZuNUtXaU1ENGV6RnM1OEgzZnpjRmgveGFM?=
 =?utf-8?B?ZjB1ODFrMURVMEN3U3Y3MFZUc1lybjBZYUozbVZ4a1VSandnUjNQSUtPenlx?=
 =?utf-8?B?TmlZYWwxdWdDWnpPVmQzQldQRHVWYVJuSi9ybGtIS2NaZitBUXgrWHZvdER3?=
 =?utf-8?B?ZjkzVXdwWkMvbjV2dmFwKzFqRW9aR3ZqMlNRc1YvZ3FhZW8zb0xhenFNZ0ht?=
 =?utf-8?B?OStHeFBxUlJNVDFRejI0SmFzbzVnTDJJYnBwbVl2ZWsyRWZrSG9hOExyZC91?=
 =?utf-8?B?QmNXS0NpNnRDTWN3Ny95ald2K3l4Q2s2UlUxTVlUVkorK1UyZlZRWUt6TUV3?=
 =?utf-8?B?eE9lWGJuUW00c3Q0eTdSUnFhRDdZZm1UajNZSzJ6SWNmMXVqUGh6aHlKY1dy?=
 =?utf-8?B?WVNJMWg0VHVtaEtOOFJoa292MWlsYURycXVHYlQ3SXVXclVRdUlBcjc3T0Nh?=
 =?utf-8?B?MEhKZ1BpTFdsdndsRGlob0x5UzYrdGF4a3FxRFk3MnNtMXg3NGhoWWFzd1ZR?=
 =?utf-8?B?eW0xT29kZVdxR3lJYTkyVUF1OGl4cVp0c210NzZXcjhkV3lQNCs1TXFrc0pC?=
 =?utf-8?B?UUtYdmtJa21GYUNUdU84WGVoRnFpaStHaGZSekY2ZCtBRzJmUVlvRW1OeWJu?=
 =?utf-8?B?SjhzaGVnb2JkTnVMZzc4UFFPRTZVNDZoUlZuWVhSUDcza216aE1tRTRUNGRv?=
 =?utf-8?B?SVFuMGxIQXBuSWtIQzRqZWdIb2MxdGtxOSs1c3pQWWM4ajVhUDNnY1c4R21o?=
 =?utf-8?B?bzZsWU0zMTlHbWUvbUlGcGZyb1VwSXZSalF0ZHZrVW00dlZVeDdCZDM4elVv?=
 =?utf-8?B?aTJDNUhaaUVVWlNJVWozYU1BWnNJQkt6OXRzdWdZSWU1YW5YRUMxcHJIWXhI?=
 =?utf-8?B?YVV1clJPV3dycUpLemI5ZDE3RUtmQXlKdS8xbkdLYUZHT3k1WU5qSnVGaGM5?=
 =?utf-8?B?YnJ1SWF1dkhTWVBNYUtHdzU2L3JNdXJMazJ6N2hIWjAra3Y3bWY1SzR1NU8v?=
 =?utf-8?B?VnZ5Z29RMHMxTVNFUEpEdGRWZ1lFL09VdFgxcnY1aHl6eXJXRUliVzZZd0hj?=
 =?utf-8?B?bWdLcjRRYjIwWlgrbXRBZjNOODhoL050dlBhem5adlZvZHpmVDZQVzhIZGdE?=
 =?utf-8?B?dkFaWU9Rd1h3NWhOTTFkdUF4eitvb3RBajkxTlV3bDZ5Q3BtN05aVGsyR3Ru?=
 =?utf-8?B?dW93NFppcUdtZjZXeTZiNHlEMjRieHlIa0xNYlNLcnJSSHlwSUQwS2ZST1Ny?=
 =?utf-8?B?QWZGRGtvYVRJWWZ0bkdIcDR6ZFVpRElWbmltSGN2ZnFyWmJIUy96ekZBNjVn?=
 =?utf-8?B?bUdWTHRLNnV0cDB3cmFjQW9Na1dQSjRXclZmOXpTdDB0Y1dxMlRpdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c33199-73e9-4cac-54c4-08de5e2b50b8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 05:08:46.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt+iXecCZ+F75fasxZ9xBS9QyAH5P7+/7IgN10cksKB+SqVvd35doUeNEexFLkkLhQg9wXMkHgzs3eTeKhKZ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16343-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[felix.kuehling@amd.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felix.kuehling@amd.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 188649D27D
X-Rspamd-Action: no action

On 2026-01-23 01:22, Jordan Niethe wrote:
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

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
> v2:
>    - New to series
> v3:
>    - No change
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>   2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 1f03cf7342a5..3dd7a35d19f7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -210,17 +210,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
>   }
>   
>   unsigned long
> -svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
> +svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
>   {
> -	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
> +	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
>   }
>   
>   static void
> -svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> +svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
>   {
>   	struct page *page;
>   
> -	page = pfn_to_page(pfn);
> +	page = migrate_pfn_to_page(mpfn);
>   	svm_range_bo_ref(prange->svm_bo);
>   	page->zone_device_data = prange->svm_bo;
>   	zone_device_page_init(page, 0);
> @@ -231,7 +231,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
>   {
>   	struct page *page;
>   
> -	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
> +	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
>   	unlock_page(page);
>   	put_page(page);
>   }
> @@ -241,7 +241,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
>   {
>   	unsigned long addr;
>   
> -	addr = page_to_pfn(page) << PAGE_SHIFT;
> +	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
>   	return (addr - adev->kfd.pgmap.range.start);
>   }
>   
> @@ -307,9 +307,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
>   
>   		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
>   			dst[i] = cursor.start + (j << PAGE_SHIFT);
> -			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
> +			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
>   			svm_migrate_get_vram_page(prange, migrate->dst[i]);
> -			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
>   			mpages++;
>   		}
>   		spage = migrate_pfn_to_page(migrate->src[i]);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> index 2b7fd442d29c..a80b72abe1e0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> @@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>   			    uint32_t trigger, struct page *fault_page);
>   
>   unsigned long
> -svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
> +svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
>   
>   #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
>   

