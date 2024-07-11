Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1FC92DF36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 06:54:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IROdWuWB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKMpl0VSwz3fpc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 14:54:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IROdWuWB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKMgl60VPz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 14:48:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMzBALJ8EgyfBzeCNFCTpE4ZL/qWWHzxVk922Zr8XD67Gb4VHW2KHowUerWbHkaf7csGcNrbxBJhSdAndWCRkMvcUqr+Uz0ae2P2EDKRpiorMMZBizsJzqxj5OWjwLRIrWWoczCmHBXUCb4h5x/CR6JwqGT+gXt6GqnbF+CFMiFOUxp4tDiMYR0FahddKPJUABhiwIfpVGaWHMZxq7NMXXYG0COM45xQyGtPBqCdrr3Mm6/JIHfX71N3n2tXxeoC87jX8E/XnhRvncipebfZV9f3vJnLgdoj4QhXafI8oqmc0tRvvcBMLX55A3zXaZ4+jG3DAiv+8WcdV1kqGOMLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1ZvZ+Hh3F56VdzRJmDx+KYBycyW3w457UABfYAQBdA=;
 b=gjKn6LwzTLYR3G4r9cpPuFbj/6Gzn+468VaBy7Z0yf6a2CnK46Mf0PnLw8IRM584KvT6Yw6MBQcxOcFnn4qLjdFZrj2rAtcyGF2kyPhxzI9hSc1KqVayKojrXB6DJriLBUkCqDiSfgz0mjrVhxgM4Eo7L1Y8zVj6JoWApG0LHbaJCRijJpEG3LJP9gVjfhAr8G2MEJLN2hgrVSkDWVgFCmtKbInem86tZ82UHf48LdqqJNVSKAAnXuguJoP7/X1XjvcMnTlG+RNFP9hHXWUmVLQdZem8S0R+rHJ8Vghfz+Rv5uhJdbAvuLrnZND8LQStecxhm7Wl/pES3VQPrv3fyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1ZvZ+Hh3F56VdzRJmDx+KYBycyW3w457UABfYAQBdA=;
 b=IROdWuWBhaiO38BVdF4D9jM8rF0cDSYKwXoJ2SufpCtwvtz9Aeh9AbgI5lz5/7bGVT414hjzhbsUCNAOvtVQiPkOpmR2lbpN0BFRxqUIldrxq62iP1/tGI+3pLyArcisGkOVHb0JXuDPwQxR1RkGuYiAqrEJFnFUbgggxcZgOrE=
Received: from PH0P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::17)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 04:48:29 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::cd) by PH0P220CA0028.outlook.office365.com
 (2603:10b6:510:d3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38 via Frontend
 Transport; Thu, 11 Jul 2024 04:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 04:48:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 23:48:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 23:48:27 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 23:48:26 -0500
Message-ID: <2359de90-1712-903e-c3c9-1f1f694718db@amd.com>
Date: Wed, 10 Jul 2024 21:48:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM
 guest
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Amit Machhiwal
	<amachhiw@linux.ibm.com>
References: <20240705192034.GA73447@bhelgaas>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20240705192034.GA73447@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b06e7b6-b0e6-41a3-c3ba-08dca164b566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?T01YZGtOeFI3ZkNiZWZ6cTkxM3I5alA1WWx4ZTVWVEdBMkY3MVVDc2Rtc0Q1?=
 =?utf-8?B?Q1R3dnRvVHh0RFZBQThQdnhzZjZFM0FYOXE1QTRTY09JTkR6U0twcnB3OXZ4?=
 =?utf-8?B?ZUM1YnV1TTY1WU96NzhBRXArRDBsamhSVTJtVkNaTGpRVHF5M2o0RDczSWZp?=
 =?utf-8?B?eFQ1WklRc2ZJR0ZUbCtaNDFwb0swSldiM2ZPUUtFUVlzbHpCM3p1SUtkbkx0?=
 =?utf-8?B?bXlwMHkwSmQyMjgrY3BlV1JOTkpDc2dlQkZoY3hpYUNjZml3UlJhcW4zemI4?=
 =?utf-8?B?ZWlEL215ZzRoMTBrQ0pRcHlsbVczRDdlVHd3TzExQUpxaXF4R0hjTFgxQmx5?=
 =?utf-8?B?MVZTbDl1QlJzK1l4Ky92ZVA1eWNhSlc2ZllBUFdLVWpmb1JuV3hYSWUwRTU2?=
 =?utf-8?B?L1hEeWxRUUppUkVQYVBUY2djay9GV2NDLzhoYlhHUG8xQ1NTQ0xmSmZIaWlh?=
 =?utf-8?B?WDhERnk5WWJNQXdoY3I5T0s5N0t5aTFXYjJDcFBjN2hHWUxQSjd5SHZFV0xq?=
 =?utf-8?B?MVJVZ0NKdmRuMkFoNFpsaitLNHVUaWw2VlV1amFOMXgyVWdaaG40cStUNFlX?=
 =?utf-8?B?c0t5NWFpSFBFSTl5bmFRaHBnSWFIY2krVUkxeFYycm43anNOeUxyRWtsVDVZ?=
 =?utf-8?B?Zlo0MHA1VWsxV3MxWHgyM0p6akdUQnpPRGJpYWg5OFNhbnBsU0FnWlprd3RH?=
 =?utf-8?B?am5STWhtaU9wem1XTFRxV2xYYzV2cCtlZHRXNlZHa2R0SFZwNDBoejhCVk5I?=
 =?utf-8?B?LzBCWFdtOFpnMkY2aG1PQmVoZmtyMmpvdE9rTlVRelA3eWJMcGM5ZHNLd05i?=
 =?utf-8?B?UGRObHRUUWxQZGJOczZlMEpud2pIMnNHb0dMcnpqZFhRR1FUZmVFdE43NDhO?=
 =?utf-8?B?Nm05SjRYaG8xUzlNYVFEWXhMbU51R0dNc1JNQnVRbGNKZGRTV2VmRXdINGxV?=
 =?utf-8?B?Z2NlTzFhb3QydWR3YVBLS2VpK3J2Ujk3N1BGWGVsRVcrdVNTRURHQVg3aTIy?=
 =?utf-8?B?N05MSXJqakt5SVFza1RRWWRoL0xzRjFlZ2l3RU43cUM3cEptUlB5ZFU5Qk0x?=
 =?utf-8?B?TmNPV2lCY3J6Sm9GNG56S041dXI1RDcrTGUxeFFGVEY1dEk1d1RoNFlyUEMx?=
 =?utf-8?B?ZXFRM0dydkFIUVh3b09xc2tuLzNQdmxuMlI0Rmw1WTZXOWNBQlNHYnhhWE5y?=
 =?utf-8?B?YzNKOFNvNFkwME85RDFyRnNxVGxuZWRsN3VlenN4OUZVRkNFSUNXalg1eVNs?=
 =?utf-8?B?d0JJTy9ISUNGclhrYkZlZytpZEtldEFmTHhaYzVlUFBJOEI0Q3hEQmNHUDNz?=
 =?utf-8?B?RVJwdGYvQWhpclBwQzFSQzdGd2pydVZEUWxKMlgxZFVYN1hBWGlnRGJUQnBI?=
 =?utf-8?B?RjkxUWJncmdDZFc3bDZFWDF6VFdUTVFVMUJRZ2J4VEFwNHdPYWpjNW0wdlc0?=
 =?utf-8?B?KzI5ZXpNVVdMZ2U2emNKelcwYjN6V1Nzc1dyQ3NsL0hOMkN5WkpQZzVrbnhl?=
 =?utf-8?B?TitXVVNxeUdBc2E2L2FjQkd0K21FZGluZWJvWGRJU3FDSG50RTZFdVRIOWxX?=
 =?utf-8?B?NGdVQm92ZzcrY0V5UGNoNFZJOU80aDB2K3pET2NSMlZ0VnhhTy9zN0VlMjlE?=
 =?utf-8?B?SmMxaWMwcXZ2V0NYNW8zaTRmSkdPQnphbW1Pa3NzSjFtdXAyTHZVV0xRM2FV?=
 =?utf-8?B?QUprcVdsVlBRTW0rMmdSZXdZaldRNjZ5bC82Mk9wMlNZWkJSUVB4S2VjMG1m?=
 =?utf-8?B?bk0yNEpBckR2Q01BdldpYlpNZFN1VlpYOWd4TjZiMGVJcEdYUE5UR1dacXZy?=
 =?utf-8?B?OXY4TU5aN3hadzYxVitlVTNCdUR6Q1g2VkJCUTN0TFU3bXRMZUxOejQ5eUpP?=
 =?utf-8?B?VWlxSG9kSzVKVWRscmZ5VUs3M25SaWRvbG9oQkx5YXorY3hFQmpTSEJVRGdu?=
 =?utf-8?Q?omJ2M9AOTuPtdHEdjNkChtPXHae4g9Q1?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 04:48:29.0417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b06e7b6-b0e6-41a3-c3ba-08dca164b566
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290
X-Mailman-Approved-At: Thu, 11 Jul 2024 14:53:39 +1000
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
Cc: Rob Herring <robh@kernel.org>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas
 Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/5/24 12:20, Bjorn Helgaas wrote:
> [+cc Lukas, FYI]
>
> On Wed, Jul 03, 2024 at 07:46:34PM +0530, Amit Machhiwal wrote:
>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>> a pseries KVM guest:
>>
>>   RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>>   Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>>   BUG: Unable to handle kernel data access on read at 0x10ec00000048
>>   Faulting instruction address: 0xc0000000012d8728
>>   Oops: Kernel access of bad area, sig: 11 [#1]
>>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>> <snip>
>>   NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>>   LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>>   Call Trace:
>>   [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>>   [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>>   [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>>   [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>>   [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>>   [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>>   [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>>   [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>>   [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>>   [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>>   [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>>   [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>> <snip>
>>
>> A git bisect pointed this regression to be introduced via [1] that added
>> a mechanism to create device tree nodes for parent PCI bridges when a
>> PCI device is hot-plugged.
>>
>> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
>> device-tree node associated with the pci_dev that was earlier
>> hot-plugged and was attached under a pci-bridge. The PCI dev header
>> `dev->hdr_type` being 0, results a conditional check done with
>> `pci_is_bridge()` into false. Consequently, a call to
>> `of_pci_make_dev_node()` to create a device node is never made. When at
>> a later point in time, in the device node removal path, a memcpy is
>> attempted in `__of_changeset_entry_invert()`; since the device node was
>> never created, results in an Oops due to kernel read access to a bad
>> address.
>>
>> To fix this issue the patch updates `pci_stop_dev()` to ensure that a
>> call to `of_pci_remove_node()` is only made for pci-bridge devices.
>>
>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>
>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>> Tested-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> Thanks for the patch and testing!  Would like a reviewed-by from
> Lizhi.

of_pci_make_dev_node() will create of nodes for some endpoint devices 
(not a bridge) as well. And actually this is the main purpose.

Maybe the patch as below would resolve the Oops?

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index dda6092e6d3a..3c693b091ecf 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct 
device_node *np,
   * a given changeset.
   *
   * @ocs: Pointer to changeset
+ * @np: Pointer to device node. If it is not null, init it directly 
instead of
+ *      allocate a new node.
   * @parent: Pointer to parent device node
   * @full_name: Node full name
   *
   * Return: Pointer to the created device node or NULL in case of an error.
   */
  struct device_node *of_changeset_create_node(struct of_changeset *ocs,
+                                            struct device_node *np,
                                              struct device_node *parent,
                                              const char *full_name)
  {
-       struct device_node *np;
         int ret;

-       np = __of_node_dup(NULL, full_name);
-       if (!np)
-               return NULL;
+       if (!np) {
+               np = __of_node_dup(NULL, full_name);
+               if (!np)
+                       return NULL;
+       } else {
+               of_node_set_flag(np, OF_DYNAMIC);
+               of_node_set_flag(np, OF_DETACHED);
+       }
+
         np->parent = parent;

         ret = of_changeset_attach_node(ocs, np);
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 445ad13dab98..087de26852cc 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -871,7 +871,7 @@ static void __init of_unittest_changeset(void)
         unittest(!of_changeset_add_property(&chgset, parent, ppadd), 
"fail add prop prop-add\n");
         unittest(!of_changeset_update_property(&chgset, parent, 
ppupdate), "fail update prop\n");
         unittest(!of_changeset_remove_property(&chgset, parent, 
ppremove), "fail remove prop\n");
-       n22 = of_changeset_create_node(&chgset, n2, "n22");
+       n22 = of_changeset_create_node(&chgset, NULL, n2, "n22");
         unittest(n22, "fail create n22\n");
         unittest(!of_changeset_add_prop_string(&chgset, n22, 
"prop-str", "abcd"),
                  "fail add prop prop-str");
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 51e3dd0ea5ab..92c079b2e570 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -608,18 +608,28 @@ int devm_of_pci_bridge_init(struct device *dev, 
struct pci_host_bridge *bridge)

  #ifdef CONFIG_PCI_DYNAMIC_OF_NODES

+void of_pci_free_node(struct device_node *np)
+{
+       struct of_changeset *cset;
+
+       cset = (struct of_changeset *)(np + 1);
+
+       np->data = NULL;
+       of_changeset_revert(cset);
+       of_changeset_destroy(cset);
+       of_node_put(np);
+}
+
  void of_pci_remove_node(struct pci_dev *pdev)
  {
         struct device_node *np;

         np = pci_device_to_OF_node(pdev);
-       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
+       if (!np || np->data != of_pci_free_node)
                 return;
         pdev->dev.of_node = NULL;

-       of_changeset_revert(np->data);
-       of_changeset_destroy(np->data);
-       of_node_put(np);
+       of_pci_free_node(np);
  }

  void of_pci_make_dev_node(struct pci_dev *pdev)
@@ -655,14 +665,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
         if (!name)
                 return;

-       cset = kmalloc(sizeof(*cset), GFP_KERNEL);
-       if (!cset)
+       np = kzalloc(sizeof(*np) + sizeof(*cset), GFP_KERNEL);
+       if (!np)
                 goto out_free_name;
+       np->full_name = name;
+       of_node_init(np);
+
+       cset = (struct of_changeset *)(np + 1);
         of_changeset_init(cset);

-       np = of_changeset_create_node(cset, ppnode, name);
+       np = of_changeset_create_node(cset, np, ppnode, NULL);
         if (!np)
-               goto out_destroy_cset;
+               goto out_free_node;

         ret = of_pci_add_properties(pdev, cset, np);
         if (ret)
@@ -672,9 +686,8 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
         if (ret)
                 goto out_free_node;

-       np->data = cset;
+       np->data = of_pci_free_node;
         pdev->dev.of_node = np;
-       kfree(name);

         return;

diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..f774459d0d84 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1631,6 +1631,7 @@ static inline int 
of_changeset_update_property(struct of_changeset *ocs,
  }

  struct device_node *of_changeset_create_node(struct of_changeset *ocs,
+                                            struct device_node *np,
                                              struct device_node *parent,
                                              const char *full_name);
  int of_changeset_add_prop_string(struct of_changeset *ocs,

Thanks,

Lizhi

>
>> ---
>>   drivers/pci/remove.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
>> index d749ea8250d6..4e51c64af416 100644
>> --- a/drivers/pci/remove.c
>> +++ b/drivers/pci/remove.c
>> @@ -22,7 +22,8 @@ static void pci_stop_dev(struct pci_dev *dev)
>>   		device_release_driver(&dev->dev);
>>   		pci_proc_detach_device(dev);
>>   		pci_remove_sysfs_dev_files(dev);
>> -		of_pci_remove_node(dev);
>> +		if (pci_is_bridge(dev))
>> +			of_pci_remove_node(dev);
> IIUC, this basically undoes the work that was done by
> of_pci_make_dev_node().
>
> The call of of_pci_make_dev_node() from pci_bus_add_device() was added
> by 407d1a51921e and is conditional on pci_is_bridge(), so it makes
> sense to me that the remove needs a similar condition.
>
>>   		pci_dev_assign_added(dev, false);
>>   	}
>>
>> base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e
>> -- 
>> 2.45.2
>>
