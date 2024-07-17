Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0D934251
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 20:32:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xCoCiib+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPPfr66Bcz3cVf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 04:32:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xCoCiib+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::60c; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=stewart.hildebrand@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPPf82qD7z30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 04:31:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCYvhyHNXWegWnC+BAX67tQpNUdd6IGDXmAOrtEjnAaMFg9JZjXJGwSOdBq/VTwzGEoz7GxfwfzYKSrGU7te88vgjZqMZFJweuUL4fPkEFmYUIAUL58JZbqjea2Rs0+0YqAervkm4eIExXYBDoac0nURB8lxqJbU6K0YLDkgta3hegD8OrsQkjA3ptL0YL9e2c14unTNRgqsWM+nn+HEX7ywbokWQxCa8Z3cymnJGmzBT4U9kgW637Ht2Z8m4QT3UUck2+1R2Rf5GLWLWToeO0cjvx0zv6IY/6dvh00RlNR10Jcekx8uykoAy4aN9bw2whp77XtUkAVvc7oFO7Gxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcfO2xuFYCs0wfQFuRFOUWckimVN6WEgeqLXYCgLYBw=;
 b=lEBOEbmcJtkzyDE5HHTvK+YijzJSDHLhfl4iNs6dDzIBqzLc1OBwKYvkccMdYfoSAjAKnStY/ez3Fi/cukbpHaGuJ82W8n0bgwt8zFv+cgciWD3qta81JArwu7IfLCzLpyc5ujltXMF7UlhoT3WjO1/u0pEw2M3aFpzeWM+i7IgjtqgG5d4kHDiFMkahC3YR36JCC1Kzuu/AFLhzjFW1fmJZdOkdc17Zyjs71GQ7Csc9KREBvSXAcPnIuiSwrd9PI6WUjy3H6ab8IyJF5p3ebm9l0YXeBN0YWkHVqcDhmfrraITem8bZFaZctGSPVUIAtlDdZEO+6AttfN1tXdE8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=aculab.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcfO2xuFYCs0wfQFuRFOUWckimVN6WEgeqLXYCgLYBw=;
 b=xCoCiib+QeXb76ueCRL0awNx7Yx4lyVc5Wtn/hxsyxnccyFfiRlub3TSMWek4xYQZBNDW2hCEhY4j9OVq+uvMOzRqd+s/z2x6kLtmm+XjgjY34ztFiL6vR2pvkGaHjmZjcrHQaRdw8AVI1ShEi0v38nulEWj2xnLae6e8h8npzk=
Received: from PH7PR02CA0006.namprd02.prod.outlook.com (2603:10b6:510:33d::17)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 18:31:01 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::d2) by PH7PR02CA0006.outlook.office365.com
 (2603:10b6:510:33d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Wed, 17 Jul 2024 18:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 17 Jul 2024 18:31:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 13:30:59 -0500
Received: from [172.25.198.154] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 13:30:58 -0500
Message-ID: <a4e2fdae-0db3-46de-b95d-bf6ef7b61b33@amd.com>
Date: Wed, 17 Jul 2024 14:30:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] PCI: Align small (<4k) BARs
To: David Laight <David.Laight@ACULAB.COM>, Bjorn Helgaas
	<bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, Arnd
 Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, Yongji Xie
	<elohimes@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
References: <20240716193246.1909697-1-stewart.hildebrand@amd.com>
 <0da056616de54589bc1d4b95dcdf5d3d@AcuMS.aculab.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0da056616de54589bc1d4b95dcdf5d3d@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: fa204659-be3a-4d4d-4908-08dca68e9bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?UXBGdlh4ZWRoSWNFbjJZc0NaN09ZcFdCQlJzUWN3RmlWcXBId0NJTkJiM1Nm?=
 =?utf-8?B?Mitra2VMdTIyZmNSTFIyN0IvWXpobzkva0VUdlVnZmtFY29WcTJ2NTdjSXRw?=
 =?utf-8?B?c0ZVSXVoTUlIZFQyZHNQc3liWi9sanhGOGJVeU1hcnFCZXlVaklPWm9OTjJU?=
 =?utf-8?B?dUFvSzR4andxTWVJTlhBc0xjdzdhcVRhRThoSFM0b0xiRlVkanRPdmRvWjBV?=
 =?utf-8?B?NE9DN0ZkRWRWVnVBWlVsUmo4L3JkYjFRYlJFbzgzVk1ENjFKQlNZSStock9E?=
 =?utf-8?B?MzUvbnExak1NRkk0M2Mvb1E0WlZCdFJmRUdPTVJiSDJKcnZyczZWeEx0dW1I?=
 =?utf-8?B?Mld5c29mU0FZVWlyNy9WSmh0Z2c2RFFGOGdaZ2JSWWs3WW1xVDNSODJOcVZu?=
 =?utf-8?B?UkdnK3BtelNBR1JXVUxtSTVBeUdQTlhoM2RvbmJBUExqTnpyT09hTVFERU0x?=
 =?utf-8?B?N2JJaUhaSGZ1UGlhUFhZTnJjVkZkN1lzMVlpOFVEb2QwMGRGTXgxbnlMNnM2?=
 =?utf-8?B?dXhyaTlhcFprWTN6NmxsZ3d1R29td0xkWWhxaFhsWHZqaXlnTEZUOVBTR0Ur?=
 =?utf-8?B?cExPYjExOWkreUNxbTBmeFU2WFpHM3VlUFJlRTQvUlhLeUM3am9PdlFNaDZM?=
 =?utf-8?B?R21XR3orZ1NRWFVHbXJxZ1hsQ3FCSTI1VjB5V2w5amtHRnIvaEFuZDY2OUFt?=
 =?utf-8?B?OWh1SWkxOXJZYzAxeFViclJIRUxVeTZQM3JaYlZtQ2JsTU5ZcmVzM0szdncr?=
 =?utf-8?B?VUlZbGV2bDVFK3huM3huejNmeFNNUmRBQnZTbkRhQVpoWmo0eG8wTFRmcFpi?=
 =?utf-8?B?a2JZaGVqTEtpQ3AyVG9QdEZoTTZCRkxDeUVham12UlZNcVdjR25IbzVYWEVL?=
 =?utf-8?B?T3BPUDFxcXQvaVhoV2pqcjFxMzczdWY2U3hTMHZ5dU54c3RWdkU5RnRwWkpM?=
 =?utf-8?B?ekdPRzJ1bEJyRFJwekRjOHpHeGo0aFkwL1FENE1jakpiVkRTRTFxZ0ZPcEpw?=
 =?utf-8?B?WUNnaWluYVlUQnRGeFA3ZUJERVBHSVA1YXZLRW1UQ2I3V3JFdXJVUkh3bUN5?=
 =?utf-8?B?VlAyOThKVS9NWXovQmVYM1JEN0xsdnNLaFpLUllxVTN1VWtLTmZmdFNjT0lP?=
 =?utf-8?B?N2I2L1ViTG8wWktyVjIzYnFJVVVvZ211QTBCVFdib0JHSVNPZVZLWCtCTWxC?=
 =?utf-8?B?Yk9neWhFdjFKL2g4M1lPVmpCdkZGc1VLQUx3Zm9qVVBuNTFqUFhOU3VjSXly?=
 =?utf-8?B?K2dKT3VvT2YrSGZLSkU2UThPck9DdkdabnZsbW4wOHBYMkFMOXJCYzRGbXF2?=
 =?utf-8?B?ZUVaUDFIOVNmVUVXWk9Wc24ySElzRXpJVnpYa3hySmF5WUtVS1RPajlEMnNF?=
 =?utf-8?B?L0RWLzZheFp3SnY4TE9KMTB6dENEOWc1YnFPaU9lS0loSGgxMGFQQjNwOTkz?=
 =?utf-8?B?d0owNVNBMEgvN0xSOGRZNmp3UVBpMmg2WHFwUE5XY2NvZi91eDhIcUpwQktL?=
 =?utf-8?B?RXN2KzIvMXUycTdySXRlckR4dlFaWm1Ob2tRdmMxOTF5eC84VnVYQjBlSSt1?=
 =?utf-8?B?TjBPTTZDL3JnUTYvS0d2RFNOT0EyM0FrbWNxa3FDRDZNTGtHQ1dOeDJnVnVI?=
 =?utf-8?B?VlFXSnlaTEVwdWtFSTJYNEZ2YVVWa0pPb1Zhd29LRE1mQVo1bmtPdFZLRldS?=
 =?utf-8?B?R1N1UWtMWTJZQUNxalRvZDNDcnY5bTZlUFFlZmdDcFRWTEZ3bm8vVWpxZDZS?=
 =?utf-8?B?UUp2YkVxcXZ3RCszM3o3eWJMSzIxdzdUSU02MklxSGxPSi9zWGtQOGo3c2Ur?=
 =?utf-8?B?ZjdnNjJUWE0venp2OStBTmZaRWplRWlQYkZDa3F2S0ttbFlOTkJraFc0RzBT?=
 =?utf-8?B?NGx5ZkoxQjFmbTVKdnllNHV1M2hFbWI0SldJT3p6Q1RtdGc9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 18:31:00.7089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa204659-be3a-4d4d-4908-08dca68e9bbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/17/24 09:15, David Laight wrote:
> From: Stewart Hildebrand
>> Sent: 16 July 2024 20:33
>>
>> This series sets the default minimum resource alignment to 4k for memory
>> BARs. In preparation, it makes an optimization and addresses some corner
>> cases observed when reallocating BARs. I consider the prepapatory
>> patches to be prerequisites to changing the default BAR alignment.
> 
> Should the BARs be page aligned on systems with large pages?
> At least as an option for hypervisor pass-through and any than can be mmap()ed
> into userspace.

It is sort of an option already using the pci=resource_alignment=
option, but you'd need to spell out every device and manually set the
alignment value, and you'd still end up with fake BAR sizes. I had
actually prepared locally a patch to make this less painful to do and
preserve the BAR size (introduce "pci=resource_alignment=all" option),
but I'd like Bjorn's opinion before sending since there has been some
previous reluctance to making changes to the pci=resource_alignment=
option [2].

[2] https://lore.kernel.org/linux-pci/20160929115422.GA31048@localhost/

Anyway, 4k is more defensible because that is what the PCIe 6.1 spec
calls out, and that is better than the current situation of no default
minimum alignment.

I feel PAGE_SIZE is also justified, and that is why the actual patch now
says max(SZ_4K, PAGE_SIZE) as you pointed out elsewhere. This is a
change from v1 that simply had 4k (sorry, I forgot to update the cover
letter). PowerNV has been using PAGE_SIZE since commits 0a701aa63784 and
382746376993, I think with 64k page size. I don't have a strong opinion
whether the common default should be max(SZ_4K, PAGE_SIZE) or simply
SZ_4K.

> Does any hardware actually have 'silly numbers' of small memory BARs?
> 
> I have a vague memory of some ethernet controllers having lots of (?)
> virtual devices that might have separate registers than can be mapped
> out to a hypervisor.
> Expanding those to a large page might be problematic - but needed for security.

This series does not change alignment of SRIOV / VF BARs. See commits
62d9a78f32d9, ea629d873f3e, and PCIe 6.1 spec section 9.2.1.1.1.

> For more normal hardware just ensuring that two separate targets don't share
> a page while allowing (eg) two 1k BAR to reside in the same 64k page would
> give some security.

Allow me to understand this better, with an example:

PCI Device A
    BAR 1 (1k)
    BAR 2 (1k)

PCI Device B
    BAR 1 (1k)
    BAR 2 (1k)

We align all BARs to 4k. Additionally, are you saying it would be ok to
let both device A BARs to reside in the same 64k page, while device B
BARs would need to reside in a separate 64k page? I.e. having two levels
of alignment: PAGE_SIZE on a per-device basis, and 4k on a per-BAR
basis?

If I understand you correctly, there's currently no logic in the PCI
subsystem to easily support this, so that is a rather large ask. I'm
also not sure that it's necessary.

> Aligning a small MSIX BAR is unlikely to have any effect on the address
> space utilisation (for PCIe) since the bridge will assign a power of two
> sized block - with a big pad (useful for generating pcie errors!)
> 
> 	David

