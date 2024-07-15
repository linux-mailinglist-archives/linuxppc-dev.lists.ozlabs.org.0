Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65950931867
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 18:21:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3At6vbjR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WN6rm2xXhz3cXK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 02:21:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3At6vbjR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::601; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WN6r32Pm7z30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 02:20:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=io2pRyaUZ1hHk99Pfz8Kd/froHqRtoN18wuD8wAiqX6gJes4ZZAmByr4pszGOqxbcNjYcSc+M/AX992BBNb/zRLxflNtrNgSGF63iCeK38RankAOGaN5H3eB6xYZMk2dBtS/DZ/Vn41AHHldG3OdZ0Oo+b8fuh9rG4sZlyHF6zdMjXgS/yS+cQ0+B1DPR+G7Z36iKuUf0xaCvNsUZhggHwXot4fZKSb40WH8uJIJtB6Z6h4N19daHkidxKi3pMiMeD2QpOa5sYOxtVzZ+HqntFx5WsU5nG19SQpD0BD+WB4StCLNRWO/r2XJpej6bRUVL2rh/bD7+QElgzF3WgkVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=053l8PAKCnnQpmN1qy0wYiYG5v3/QvExPVrZVhtEc8k=;
 b=ZAA7T8PtfoUZtVbwbgWXxgJ2OmUGuV/5r7S5eqn9xodmihX7KcHRCcAWCIeOw/AxZ0BgifsWLE4YqK6zkwqn06YzJRvKhiqCTARO7e6cV7K4n0p9tTMMUegX2IXP8bZhzQIPMdRMA3FC7lsbJOhxV1DLxCzfeB4F753AUxoMIjX4ufV9/x5ezLJSMLhrjmYsRuPGnLi3cHm0HKejyDpYMkrobfvRlZFNM2/KUKshcb4bSrnCfEtaRRwJ/o6FvMP6lwkmuIUp2Imj1i4rBhuvND8L/0WkgMzvAZrCaFoDujnXZWCQfjAMTy4DZrl8WQpeEYWasobwBFuqypkulH2yVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=053l8PAKCnnQpmN1qy0wYiYG5v3/QvExPVrZVhtEc8k=;
 b=3At6vbjRC146cQ7UsPe+wemPm0hj2WJx/K+Is+fa97kp/7vAc01w8d84mVSPM7KfpTueZPtcno4BHOuVZibIg6dRJ6N8GB+NhJ5YUbhlgJT7Woz1aOj5b3rROVv+MsM0v5hgnp3zDiI/rFFvGfhGu0HHPVyIOKWEdhoZWA29TzA=
Received: from SJ0PR05CA0114.namprd05.prod.outlook.com (2603:10b6:a03:334::29)
 by PH7PR12MB9176.namprd12.prod.outlook.com (2603:10b6:510:2e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 16:20:09 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::4a) by SJ0PR05CA0114.outlook.office365.com
 (2603:10b6:a03:334::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13 via Frontend
 Transport; Mon, 15 Jul 2024 16:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 16:20:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 11:20:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 11:20:07 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 11:20:06 -0500
Message-ID: <87d645e3-69ac-170d-bdc2-26bc3c03b890@amd.com>
Date: Mon, 15 Jul 2024 09:20:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Content-Language: en-US
To: Amit Machhiwal <amachhiw@linux.ibm.com>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|PH7PR12MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b703277-ff3e-4bb9-c01c-08dca4e9fef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?blQweDZuUE5SaWlEV2hkZzR2bkVUV2ovY0QzV203b0p3N3AxT2JkeGdNc3lr?=
 =?utf-8?B?TUJSOGdlWXRYdGZPNnJTdVNmbjhKQ1FIeTBLamlKNlBhY2xUaTM1SnlwWGpZ?=
 =?utf-8?B?Yy81dFVhczU2dVpKaTNwbHZJQzNOcVdYdmpjRWREU2dNblNqM2IzRGtPN2RK?=
 =?utf-8?B?dnRvaHlwekRuYWxDOTFacEkrZTN0ZEhJVFBwdW5TZm9HWUQ5N0p2WE1jSSt5?=
 =?utf-8?B?WHZWOVpsVFc5d1pIOWM5VkRNU1RQUlR4RFdIaThGUWJhcWxsQk1qM3haL0ZL?=
 =?utf-8?B?amhzRHFnbHlHektRczdWV1lGSFcrZUVhdGVCakJRREx0RWRXWml5QkJ4bFVJ?=
 =?utf-8?B?NGpYMm13WnA4UnJrT0ViMlUzTUdxL3hleGo0clVPR05qOVp4M0IvVlppTm9U?=
 =?utf-8?B?V3ZPblFmSkM5MWNXTzYvcUJWQnQ0NmN6S3dJMkVjTjR1TGxSYXlLWXV5ZEJW?=
 =?utf-8?B?V0dncUhHNUl5dFc2M3JTdlNoWWwva0pMdGNWRVpPVjJMb3c2amZYZkY3SXEz?=
 =?utf-8?B?UzlwV1pPTk14d1FJYlZKWkw4QmZPR1g4V0c3TE1JL0hGTkJXZ29Db0J4UGVO?=
 =?utf-8?B?M0hLV3p1aDM2bFdHemVpM2VSQUNSNkl0SzBxSkxqNmZ1UEpwVm10Z2tsemxT?=
 =?utf-8?B?bHdUdzNFRE9MT2VxZk1sYmtXT1puUFVZTmdYWUc2ekloQzM2YWRnVVhiZjZu?=
 =?utf-8?B?NnJ6Uys3VnRac25OdFc4SDVDSlF1WmxaM25xK2VzN2Q5THFrOEsvc2VpVlZQ?=
 =?utf-8?B?T1JKU3BhL0Ivb3E1eWU0eitiTzBsSW9hWE9jRnJmeVhaWWE2QVNxN2ZhM2Jn?=
 =?utf-8?B?aUgwaVZ6K0xsWkxZZ1VrQzQvSWp2Wjc5UGprNFlEWFFCSnlpTm5nc3pvNG1U?=
 =?utf-8?B?OTltc3EvZm4yV1lmdFpWQlhjbWoyOUc0SHh2Zzl0QWswSjBJQmNTOU10enJ2?=
 =?utf-8?B?cXRrY1l6VjNKVlp0dEZZVXZ0Yi9HbnBsUnlEZXRxWjdHSndtaGJrNjhFZlpq?=
 =?utf-8?B?QzN2NXNMZzgyWWNvaS9BWUFCdjhmNGVtZkdQZzk2MFFUM2xlMnpla2JLVElZ?=
 =?utf-8?B?a2N2d1V2eHlqK0MwVkRHQ2ZEQmQ1bXZFWjgyZ1U4dUdWbVkrc04vM01rS0M5?=
 =?utf-8?B?VHN1K1NTb2lxNUFVRHVLQXdBSzVseGVxWVpoTUlJUDFjcDFuZHdaR25PNHVo?=
 =?utf-8?B?ZlgrclhNbXhHVjUrekdIYjFYODU3Qm54aEljK0pITE0rMFBUUVlVUWlEeXg0?=
 =?utf-8?B?dkNUV3pvakRqeGRKc2xVanJUT0lGc2lUNUpYY2FNdkxwd3dzTGdPWE1ZTWtw?=
 =?utf-8?B?OVdWckFzZEwybkVVWnB5d3VBMmtTcnRaYUdBVkduazdJRVlxNk9GZlJ0QUt1?=
 =?utf-8?B?NVBORkE5cFlFelVncFYvMEpTOWwvUFh3emJQWFpYN0ZEZDRpUjNHcnpEUzFZ?=
 =?utf-8?B?WEs2d3J1RlI1TFR0b25iZlMvSXgrNVArL3dvY0hWWm84R0JhQ1o5Rk02eVBK?=
 =?utf-8?B?WEw2Q1lTUCtPYnkrb3NRdEtxUHQ0bVN1Wnpoa3U1MVEzU2JaRVVvaVIrc2Fi?=
 =?utf-8?B?TzdVSEk4c0dIY0hOT0FBdHVnRjk1cFhDNVlwZHoxbGNCcWVNcFhqdXR2L2RK?=
 =?utf-8?B?bE53M1ZiVXRBcXNuTXA2ellqa3dJdHJmbk1UWi9KbitFbFl2S1dVVU83c0xo?=
 =?utf-8?B?ZW5pTXk5QUhhUFZscDlzR012eUJXUTA4RWxFWWYxc0J1VHN2QklhVmoyYW8y?=
 =?utf-8?B?eCtzeldmaEcyTnhySlBwclU2U3IxY1NTZmczUm52WDlSNlQ5MVZsQTdNdEJ4?=
 =?utf-8?B?MXl3elV1OHoxR0FuMDE4TkJLOEdSUjBvK0dlMWp5RGVnMS9iVGs3NzNHUlFu?=
 =?utf-8?B?WndIa1hnVkxlTUFxOUhnQ21VMU5lcU13N2FhWWtvTXd2RGc9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 16:20:08.9474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b703277-ff3e-4bb9-c01c-08dca4e9fef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9176
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
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, kvm-ppc@vger.kernel.org, Vaidyanathan
 Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/15/24 01:07, Amit Machhiwal wrote:
> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> of a PCI device attached to a PCI-bridge causes following kernel Oops on
> a pseries KVM guest:
>
>   RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>   Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>   BUG: Unable to handle kernel data access on read at 0x10ec00000048
>   Faulting instruction address: 0xc0000000012d8728
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> <snip>
>   NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>   LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>   Call Trace:
>   [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>   [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>   [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>   [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>   [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>   [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>   [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>   [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>   [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>   [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>   [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>   [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> <snip>
>
> A git bisect pointed this regression to be introduced via [1] that added
> a mechanism to create device tree nodes for parent PCI bridges when a
> PCI device is hot-plugged.
>
> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
> device-tree node associated with the pci_dev that was earlier
> hot-plugged and was attached under a pci-bridge. The PCI dev header
> `dev->hdr_type` being 0, results a conditional check done with
> `pci_is_bridge()` into false. Consequently, a call to
> `of_pci_make_dev_node()` to create a device node is never made. When at
> a later point in time, in the device node removal path, a memcpy is
> attempted in `__of_changeset_entry_invert()`; since the device node was
> never created, results in an Oops due to kernel read access to a bad
> address.
>
> To fix this issue, the patch updates `of_changeset_create_node()` to
> allocate a new node only when the device node doesn't exist and init it
> in case it does already. Also, introduce `of_pci_free_node()` to be
> called to only revert and destroy the changeset device node that was
> created via a call to `of_changeset_create_node()`.
>
> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
> Changes since v1:
>      * Included Lizhi's suggested changes on V1
>      * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
>        part a bit in `of_pci_make_dev_node`
> 	drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
> 	  611 | void of_pci_free_node(struct device_node *np)
> 	      |      ^~~~~~~~~~~~~~~~
> 	drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
> 	drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
> 	  696 | out_destroy_cset:
> 	      | ^~~~~~~~~~~~~~~~
>      * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
>
>   drivers/of/dynamic.c  | 16 ++++++++++++----
>   drivers/of/unittest.c |  2 +-
>   drivers/pci/bus.c     |  3 +--
>   drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>   drivers/pci/pci.h     |  2 ++
>   include/linux/of.h    |  1 +
>   6 files changed, 43 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index dda6092e6d3a..9bba5e82a384 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
>    * a given changeset.
>    *
>    * @ocs: Pointer to changeset
> + * @np: Pointer to device node. If null, allocate a new node. If not, init an
> + *	existing one.
>    * @parent: Pointer to parent device node
>    * @full_name: Node full name
>    *
>    * Return: Pointer to the created device node or NULL in case of an error.
>    */
>   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
> +					     struct device_node *np,
>   					     struct device_node *parent,
>   					     const char *full_name)
>   {
> -	struct device_node *np;
>   	int ret;
>   
> -	np = __of_node_dup(NULL, full_name);
> -	if (!np)
> -		return NULL;
> +	if (!np) {
> +		np = __of_node_dup(NULL, full_name);
> +		if (!np)
> +			return NULL;
> +	} else {
> +		of_node_set_flag(np, OF_DYNAMIC);
> +		of_node_set_flag(np, OF_DETACHED);
> +	}
> +
>   	np->parent = parent;
>   
>   	ret = of_changeset_attach_node(ocs, np);
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 445ad13dab98..b1bcc9ed40a6 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -871,7 +871,7 @@ static void __init of_unittest_changeset(void)
>   	unittest(!of_changeset_add_property(&chgset, parent, ppadd), "fail add prop prop-add\n");
>   	unittest(!of_changeset_update_property(&chgset, parent, ppupdate), "fail update prop\n");
>   	unittest(!of_changeset_remove_property(&chgset, parent, ppremove), "fail remove prop\n");
> -	n22 = of_changeset_create_node(&chgset, n2, "n22");
> +	n22 = of_changeset_create_node(&chgset, NULL,  n2, "n22");
>   	unittest(n22, "fail create n22\n");
>   	unittest(!of_changeset_add_prop_string(&chgset, n22, "prop-str", "abcd"),
>   		 "fail add prop prop-str");
> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> index 826b5016a101..d7ca20cb146a 100644
> --- a/drivers/pci/bus.c
> +++ b/drivers/pci/bus.c
> @@ -342,8 +342,7 @@ void pci_bus_add_device(struct pci_dev *dev)
>   	 */
>   	pcibios_bus_add_device(dev);
>   	pci_fixup_device(pci_fixup_final, dev);
> -	if (pci_is_bridge(dev))
> -		of_pci_make_dev_node(dev);
> +	of_pci_make_dev_node(dev);

Please undo this change. It should only create the device node for 
bridges and the pci endpoints listed in quirks for now.


Thanks,

Lizhi

>   	pci_create_sysfs_dev_files(dev);
>   	pci_proc_attach_device(dev);
>   	pci_bridge_d3_update(dev);
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 51e3dd0ea5ab..883bf15211a5 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -608,18 +608,28 @@ int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge)
>   
>   #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>   
> +void of_pci_free_node(struct device_node *np)
> +{
> +	struct of_changeset *cset;
> +
> +	cset = (struct of_changeset *)(np + 1);
> +
> +	np->data = NULL;
> +	of_changeset_revert(cset);
> +	of_changeset_destroy(cset);
> +	of_node_put(np);
> +}
> +
>   void of_pci_remove_node(struct pci_dev *pdev)
>   {
>   	struct device_node *np;
>   
>   	np = pci_device_to_OF_node(pdev);
> -	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
> +	if (!np || np->data != of_pci_free_node)
>   		return;
>   	pdev->dev.of_node = NULL;
>   
> -	of_changeset_revert(np->data);
> -	of_changeset_destroy(np->data);
> -	of_node_put(np);
> +	of_pci_free_node(np);
>   }
>   
>   void of_pci_make_dev_node(struct pci_dev *pdev)
> @@ -655,14 +665,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>   	if (!name)
>   		return;
>   
> -	cset = kmalloc(sizeof(*cset), GFP_KERNEL);
> -	if (!cset)
> +	np = kzalloc(sizeof(*np) + sizeof(*cset), GFP_KERNEL);
> +	if (!np)
>   		goto out_free_name;
> +	np->full_name = name;
> +	of_node_init(np);
> +
> +	cset = (struct of_changeset *)(np + 1);
>   	of_changeset_init(cset);
>   
> -	np = of_changeset_create_node(cset, ppnode, name);
> +	np = of_changeset_create_node(cset, np, ppnode, NULL);
>   	if (!np)
> -		goto out_destroy_cset;
> +		goto out_free_node;
>   
>   	ret = of_pci_add_properties(pdev, cset, np);
>   	if (ret)
> @@ -670,19 +684,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>   
>   	ret = of_changeset_apply(cset);
>   	if (ret)
> -		goto out_free_node;
> +		goto out_destroy_cset;
>   
> -	np->data = cset;
> +	np->data = of_pci_free_node;
>   	pdev->dev.of_node = np;
> -	kfree(name);
>   
>   	return;
>   
> -out_free_node:
> -	of_node_put(np);
>   out_destroy_cset:
>   	of_changeset_destroy(cset);
>   	kfree(cset);
> +out_free_node:
> +	of_node_put(np);
>   out_free_name:
>   	kfree(name);
>   }
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index fd44565c4756..7b1a455306b8 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -702,11 +702,13 @@ struct of_changeset;
>   
>   #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>   void of_pci_make_dev_node(struct pci_dev *pdev);
> +void of_pci_free_node(struct device_node *np);
>   void of_pci_remove_node(struct pci_dev *pdev);
>   int of_pci_add_properties(struct pci_dev *pdev, struct of_changeset *ocs,
>   			  struct device_node *np);
>   #else
>   static inline void of_pci_make_dev_node(struct pci_dev *pdev) { }
> +static inline void of_pci_free_node(struct device_node *np) { }
>   static inline void of_pci_remove_node(struct pci_dev *pdev) { }
>   #endif
>   
> diff --git a/include/linux/of.h b/include/linux/of.h
> index a0bedd038a05..f774459d0d84 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1631,6 +1631,7 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>   }
>   
>   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
> +					     struct device_node *np,
>   					     struct device_node *parent,
>   					     const char *full_name);
>   int of_changeset_add_prop_string(struct of_changeset *ocs,
>
> base-commit: 43db1e03c086ed20cc75808d3f45e780ec4ca26e
