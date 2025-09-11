Return-Path: <linuxppc-dev+bounces-12040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A77B539F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 19:06:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN3r93C7jz2xnh;
	Fri, 12 Sep 2025 03:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2405::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757610409;
	cv=pass; b=J5VCwkw5GvKWTMMSCaAfvoaCHjFYovpJ97cZZ7CRk4AO65Kq36eg8UmXatfK6zJGxw89+UgVC6TfJFZlClT+pII6QkQbR6fguXeJ1dja5I3noLCbnV2z1+3UZGDUBCsM92WtNQJy36VRwaVIRcR+npcW4QnymAYFvG7MOsCjr4W8bvUKgKcS1XzH+BDNjXYlCUadm2ON8xVDn5XDvNH5+PItWiMmjz8lr8dyFa3Vbd7DNVZ4qiKXn+Fdxfl5wqNY6I9KLxPapbfaXU1ErgHnkYz2pumzfdgdag4sdzPEUXCadQvTKq2PhtTKpUCQuMs3tPnFozB6vT4s9UcZSRA8ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757610409; c=relaxed/relaxed;
	bh=bYz8rV2X8NoiRDnW0M1SWTleP3QX3BbT5bGMfwP0zV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G3fShkRxOYutQqUSZsFMfo4GVkoCQzmb8AcjfYZxSolxssbnwwph6G09L7ohaq8hdxv2T4XRkyNZkCExbRcmTPlHDuDFqOOt534EVjeEAZbEVyvC74SeRLMrNwtxKAwGHORqP+/lj6oclbKnbr4jIMzdazPfl1qYWb2gZ3aZd5NaLOhx5AY+ZIer7ZqdusarCJTlP4uFQaYvMn8GVz3gITA3xyUpTsp8vbMV7kxzg3qI08Evao6sl7vmBAmK1tQzdTEjaHPz23kHGPqEf1fqGgdKIC8eR6h5FwUTXu1PlvTFZjx28YVHcyEkjvedtKmLmFvmgUwh0YbyVuOASlsIVg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ni/1/8Fo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2405::629; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ni/1/8Fo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2405::629; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2405::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN3r775Tvz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 03:06:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+CH1+lqMIMDnorGhvZva7/Tj6xzJ+nVqBOhgKTi8BzCQ+0VFYlhXFtTr1l0AuaxhM+mbKr3O+t0V3D6xnIulmDJgwP4e/Lh7QNIBf7qHQAc+SV3Z2MNhdOqHS7vsfpKB9rQhozfYEbiSemQfVOIyt52K10ou3ylGUr/YlqWZCIv7aBkM5rkVjWnp+AVhaOgiDJA3dlUQa1p/kRO9NrPCE4TdMiixyhtNY+wIkQ9S+TLb1hlmiSqGj5iB1q2OgdcqifmhWgMi+wrav+qx/M493HSeHWgPBRJTUdGoJA01Rtmh8q3pKQr3Teg6/kH03bt70anADHrFvfV8cb/5h/aoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYz8rV2X8NoiRDnW0M1SWTleP3QX3BbT5bGMfwP0zV0=;
 b=iIAnA+y4jNPKMZwBbe6GZhjigVaV173i5NUkX6h51k2l+4fF6HvFyMjYU6SYSpXen4nQ4d/yTiX6glbe8BvLcSCEjrppjD2Lalv4Jd58Ca9lI42yGXkT/zZxYLTMV3LvaXYneAOteP72vpi3MFrTjHtl+KixkUQ+Fi0DoHDhvhm9LeQdxQkMD1WKWF+LukD0Bu+QfPy50rUoxgCbr9594Jf+k5rCUMB2WaL6Vww5hkhEGV5zXW/fDNYsGQSyq65g6m0xQTDBJS542wbrF07XGFvLOcHD/63NKITvbVwMJfq2sgCXFOzmSsBRPpC0kL69S6/7TYhE/LyuNmLh5gzyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYz8rV2X8NoiRDnW0M1SWTleP3QX3BbT5bGMfwP0zV0=;
 b=ni/1/8FoeqCROjVqarZ7tDOyh84eiwDQk2vrlht/BPhAHSz3IOCiEAVoqZ8EtlDUBCmshY/3iByJZXC6vXkEiKs1RBtR4D8KsYFFf0unIlv3n2CUaLR4J3t7uTyzbzZSiIsS0VCVQI2pnrSVWpIxgUHLG/49h4QlwB1lsaHa9nY=
Received: from MW4PR04CA0191.namprd04.prod.outlook.com (2603:10b6:303:86::16)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 17:06:27 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::44) by MW4PR04CA0191.outlook.office365.com
 (2603:10b6:303:86::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 17:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 17:06:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 11 Sep
 2025 10:06:25 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Sep
 2025 12:06:25 -0500
Received: from [172.31.178.191] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Sep 2025 10:06:19 -0700
Message-ID: <5493a681-4438-4854-9cf4-c1e71ad2dbed@amd.com>
Date: Thu, 11 Sep 2025 22:36:18 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 07/10] sched/core: Push current task from paravirt
 CPU
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: <vschneid@redhat.com>, <iii@linux.ibm.com>, <huschle@linux.ibm.com>,
	<rostedt@goodmis.org>, <dietmar.eggemann@arm.com>, <vineeth@bitbyteword.org>,
	<jgross@suse.com>, <pbonzini@redhat.com>, <seanjc@google.com>,
	<mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <gregkh@linuxfoundation.org>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-8-sshegde@linux.ibm.com>
 <7227822a-0b4a-47cc-af7f-190f6d3b3e07@amd.com>
 <1617b0fb-273a-4d86-8247-c67968c07b3b@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <1617b0fb-273a-4d86-8247-c67968c07b3b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 92184cae-d401-46c6-6495-08ddf1558b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVB6bEhlYkkvMGN4TUliMXFnSUhlL0wyU3ZYdTRhTkJPSlhJSEl3TmxUb1Yy?=
 =?utf-8?B?QitScVNHb09lakZpa2RBakU5RDZpR2pFT2svMThmNGVmOXRsWWFWRmc1VnBy?=
 =?utf-8?B?aCtEdmFQbUdmcFhaeEFrY05pNWg5cUlnVmxWL25ZZlNZY2ZmSmQ4ZnE3NGZN?=
 =?utf-8?B?cHl1RFVsSk9ENFQyT1N2MmxabTg4ZHRQdEk2VVNVR2JmeW1vOHVrTTdOcnZr?=
 =?utf-8?B?Sit3aFk2cENLRDBNNHVMNWFnTXNwcFRxNHEyQ2xFMjRPc2JobU9YampHckVE?=
 =?utf-8?B?ZXdxbFF6QzlTSG5MdFZWcHJVN0Mva0lWa2plcDZ3Ty9LOVZWSVUwZmVxbENx?=
 =?utf-8?B?SElOY1d3WW81TU1mRnlhbVdyWVpjT3R1RjBKOUc3a0liamhtU2lNMUlwVnVh?=
 =?utf-8?B?T1NRSmtlQTRjUUFqZmhaT2ZiNGhjQzhacHJkYTk2anF3NG0vTFZNVC9hK3Jm?=
 =?utf-8?B?SVZzOW5hWi9Uak5hSSt5Y0EzK0w0ZW9kNnkwMzNyTmRpR0hpMUVXVUZ0TlNU?=
 =?utf-8?B?S1RuYWhKbDdvQWxOcVJOaldiQzEzV1pkMHBySG9iUU1Tb1VqLzhSRDFkbWlK?=
 =?utf-8?B?QkNpL2xZS2ZpUzA2UjQwRVhUVzd6ckpPU1RwMXRmMkhqdGE0d2NYWVdieXRK?=
 =?utf-8?B?WUFlYUNKWjhBVCtCT3BhNk81Y0FjS3FjbU5aR2NncWNkUFJrVno4Q0dhdHgw?=
 =?utf-8?B?VlFRRmZkVEtxNjR6c2NyRUtxYm93ZnZPVmM0eDMzWkt0ZE1Va1NpVmFtQXFO?=
 =?utf-8?B?TUZGQmtNY2RGQjFQL1pxdm1KZTJuenpPOWJZU01LVHBGbEdieWtnUks2VHMz?=
 =?utf-8?B?cS8vWnJDUjhreE1EMTkrdGtYTG9OTmNpTURWZnhGM0x2NTRYK0FtTy82WUhT?=
 =?utf-8?B?SlJsZnF3Z3BPdW1lcjdrbXFkQkY0bjNCLytIS3JLMDJDWllQL1BqNWZiZm1w?=
 =?utf-8?B?L0VDQnhWYUtwZVFiTDBMSFR3SmEwR2Z5b0p0RmNTcGRyRUNwVVpDR3V6aXd2?=
 =?utf-8?B?S1IwMlVEcTVsWlVGVUhsQlRwUE53QWJrenFpOWdBNjdYbTE5VG9Va2pjV2ZS?=
 =?utf-8?B?RTd0cVlIUHF0aHBZcDY3VVBicUtQbHhoTS8xSkZXeDFzVVBsQWYxaVdCY1dk?=
 =?utf-8?B?dnJFSGQwa2ZteDZVSEVVWW1Tais1NGl3ZHY4NkVxRldGcGhsV1pvMlFoRys2?=
 =?utf-8?B?My9mQ0QwVWZhaWF2VFhBWm9xNys5RUpjUlRRdkRtNjFrRU1XMU5nZmRNTUxE?=
 =?utf-8?B?bkZoUFhJRm9IOGZtNXV1aE9mMWthZHpPZW85Z0xhREpsMmNQSEZycEtPdkZw?=
 =?utf-8?B?NHFpR21XQTBmdlNFV2h3UExmbUhrRlMvREZranBUcFltWkdud2V1bXo0M2N5?=
 =?utf-8?B?ZXRxRC82RmwwOVBuL3hKRDZZRk85MzNNZzNvKzBONGxxZVVVZTNKNUVFMXJp?=
 =?utf-8?B?RHdXM3lZVGYxL0pxdDlBaHpzTmxIQ05meU1wY2ZxNGVDcGZCVDhlZkg3ekhE?=
 =?utf-8?B?bU9rQTVTakdJazkwK21STTVaUVRsL2FzbmdxVHVnYlVOTW9id3Z6TUxVWEor?=
 =?utf-8?B?c3VYWVd6MjcrTHN6SkJwTFVQRmU1OHcwQmtxYnROdVlwRlNXWDk1Mk5BYUZG?=
 =?utf-8?B?QlJSb2I4M3Qvb2ovOUZnaVhSL2VsT0lHMGd1YlMzWHZyM1lMS0ZWdTBSVUQv?=
 =?utf-8?B?QnJDdmNXY2xvMnRYc3BmWVl3K3hlbGdnd3VlUXJzM0pRWnk2Um40NFlLZWp5?=
 =?utf-8?B?WVdKaDNFOCsvMDFPS2o3dWJ1UlNGVWtNL3lrdTBZbW9kZXdkRUpXbmZHOGxO?=
 =?utf-8?B?Smo4NzB5L05xS1c4bUE0YkxzbEhJaTVvd253V1F5cnZzR0sxVUtMMy9KTkxC?=
 =?utf-8?B?TWJ1R200Qml3QzF6Nzl5d0Z4TEFIUXJUekRGaE9oZkpKYlpGTlAvMStIUVA4?=
 =?utf-8?B?MThRYmlHb3ZKbWgyQU41N01hOGxLYnVGTFlTd0lvSG9ySUlyOWV3elhLRUdX?=
 =?utf-8?B?dTd1M240eDFpN252SXlCb2cyNG1XUXpuR0FSQlgyVTAyUUdTL25VcUtnblZ6?=
 =?utf-8?Q?8kJTHc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 17:06:26.5683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92184cae-d401-46c6-6495-08ddf1558b3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 9/11/2025 10:22 PM, Shrikanth Hegde wrote:
>>> +    if (is_cpu_paravirt(cpu))
>>> +        push_current_from_paravirt_cpu(rq);
>>
>> Does this mean paravirt CPU is capable of handling an interrupt but may
>> not be continuously available to run a task?
> 
> When i run hackbench which involves fair bit of IRQ stuff, it moves out.
> 
> For example,
> 
> echo 600-710 > /sys/devices/system/cpu/paravirt
> 
> 11:31:54 AM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
> 11:31:57 AM  598    2.04    0.00   77.55    0.00   18.37    0.00    1.02    0.00    0.00    1.02
> 11:31:57 AM  599    1.01    0.00   79.80    0.00   17.17    0.00    1.01    0.00    0.00    1.01
> 11:31:57 AM  600    0.00    0.00    0.00    0.00    0.00    0.00    0.99    0.00    0.00   99.01
> 11:31:57 AM  601    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
> 11:31:57 AM  602    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
> 
> 
> There could some workloads which doesn't move irq's out, for which needs irqbalance change.
> Looking into it.
> 
>  Or is the VMM expected to set
>> the CPU on the paravirt mask and give the vCPU sufficient time to move the
>> task before yanking it away from the pCPU?
>>
> 
> If the vCPU is running something, it is going to run at some point on pCPU.
> hypervisor will give the cycles to this vCPU by preempting some other vCPU.
> 
> It is that using this infra, there is should be nothing on that paravirt vCPU.
> That way collectively VMM gets only limited request for pCPU which it can satify
> without vCPU preemption.

Ack! Just wanted to understand the usage.

P.S. I remember discussions during last LPC where we could communicate
this unavailability via CPU capacity. Was that problematic for some
reason? Sorry if I didn't follow this discussion earlier.

[..snip..]
>>> +    local_irq_save(flags);
>>> +    preempt_disable();
>>
>> Disabling IRQs implies preemption is disabled.
>>
> 
> Most of the places stop_one_cpu_nowait called with preemption & irq disabled.
> stopper runs at the next possible opportunity.

But is there any reason to do both local_irq_save() and
preempt_disable()? include/linux/preempt.h defines preemptible() as:

    #define preemptible()   (preempt_count() == 0 && !irqs_disabled())

so disabling IRQs should be sufficient right or am I missing something?

> 
> stop_one_cpu_nowait
>  ->queues the task into stopper list
>     -> wake_up_process(stopper)
>        -> set need_resched
>          -> stopper runs as early as possible.
>         
-- 
Thanks and Regards,
Prateek


