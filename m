Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D2931BFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 22:37:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GkMDkOz9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNDWx49pvz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 06:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GkMDkOz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::62d; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNDWF24hqz3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 06:36:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCrt6TzlDtKl4qUh/a4j+almd6wxuqPuuvwGZ/a91fP3fmRb+0Y1eb2Sqk1aOXZ6bEzf6RLhdLWAg/yaSfNAx8CeXChI6tZAfD39ZD508wnvXECugmBFlslMePF9MnyZ7EUczjYSCuWRLkJJ6//jCHhmoxoCH/luabAKy7h7G9Ob91BXMjM57vyLAaoq89flc8+/LUqQ61EAENVywMy4fpEniuSA3TD+Mr8OvBKpi7GvBOi9CU8UcPGauLpQRXnhk6OBDvZ6eLJmD1+zISio4zCEoo1dIiS8J26wGIR0DtmRcZYj/c/NYHUyOQRrnb/6aHq+RqcMHSjOeCymojzIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWkZuMf4xoXWDZBA/GXz3Wg+dT9Xg/5zg41R1HxBYnc=;
 b=YKkA/Lnb9nTnWeyy/8B/bg+1F+k2R9TqhMIhd/zArHq1KaCW+KBXbB7B2MpbD1C6ATXRSo4oAnwSd1JBBya87Vwa7yJ3y5qo3RzxzPZ68zn8UjgNOrvEz7DTS7ul0KaXtDiv4uuAxug5+bn2krO3V+Qo3BHfBFnrboBrw2WSTQ90fZLWIyLy9HiQnzoxn+TehiAzbS1SldvEcMMwF0ftvilGrU/fx1D8NoAwUgEKXTmCch67pUjeiXGZa6PyBESNU+Gv7si8m9RvYzSSNoN9DTOErS9wg9iA7mCMksTr4/O9GIK58fKR5cwxmUBIqh6a2wp5dJQeyAgUZcqUaB5SOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWkZuMf4xoXWDZBA/GXz3Wg+dT9Xg/5zg41R1HxBYnc=;
 b=GkMDkOz9TQfKHg+K2QVTktla6QW0crJ0VQnnyBuRyCx+y/bEMkKoF/oqEKLmM+0BgHV2SNFfj9gGO2jfpqDRXwkIxXdl0SeNGQYVMIE8fHIsDee7EmCGOcl5/vW4F3KDRMKWqQnQ5A6TSryixed2L19bf1HKbJ0PLMv1JndE5KU=
Received: from CH0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:610:119::34)
 by DM4PR12MB7768.namprd12.prod.outlook.com (2603:10b6:8:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 20:36:00 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::24) by CH0PR03CA0374.outlook.office365.com
 (2603:10b6:610:119::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 20:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 20:36:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 15:35:59 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 15:35:58 -0500
Message-ID: <f70e8e07-93e0-09bd-1d90-ee5458fb09f3@amd.com>
Date: Mon, 15 Jul 2024 13:35:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20240715172351.GA434759@bhelgaas>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20240715172351.GA434759@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|DM4PR12MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8d4ffe-8776-4c96-b697-08dca50dbcd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|7416014|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?ZWNETlo2ZDdiZXZEWWRjUkdTWC9kL0hBK0UvcHlrM2pEZkRVVXdSZGV0QVRH?=
 =?utf-8?B?M05zVTI0Tnpjb0RYRUJvSktDdjFSRUp2dW1tMWxLQTFNQ0dvT0xCOXRmcDU3?=
 =?utf-8?B?a2xzd2pRb1NtUzdieVlsMy81T094bWVNd3BTRnRmbFdoS3ZXd0hrK3IxTkhr?=
 =?utf-8?B?V3ZBbTJtb1UvWldZT2RsVm5zTHhFTU1HczRxOTAzU09BTjlJNTZpL3c5ZVZw?=
 =?utf-8?B?OWFHWkx1bUorM0kyOGhTNGEraDhIWTkrNWkrVkh3ZjdvSllhdVJuaFprSDA2?=
 =?utf-8?B?UDlIUFBZeEg5eUt6eWxZcFdGNnpQTU1IakgwOU13T01sQlhKek5TbWJTRjlE?=
 =?utf-8?B?OTlWMHIvLzJOZzdid2x3NWUrYTR0UFMxcjNFK3IwMXRqNE9TZUorOWJwQzNO?=
 =?utf-8?B?U2REZkdGL0RuU1VLT2dPMXBLVjFiNnJZTDcyYlBGVFlyeUZ0ak53dGFmcnZP?=
 =?utf-8?B?TXp4aDdoZkI1bWFmSW85bUUrOS9yQU5NdmlJMC92TUVGSWV1TDd6RmVzZkxT?=
 =?utf-8?B?ZmlmRmU3QzJNSEd2OVYwUUxCdWQrYnl0Nko2SWhlZmVIV2dTUWlGRldKSlhS?=
 =?utf-8?B?TmNWUXExU1FHOWhhbDF0bmlpUUt5NWZVdFRYeGhxUURkOXJQRkNGNWxxRzhF?=
 =?utf-8?B?MjhYd3hyMDlMdlhBSW91OUM3TndVSVErU2xZcHJVSmI1T1ZFMjNXTnBVVnJG?=
 =?utf-8?B?TVk4ckNOcDROaTV6eHhBNTVsTnZtSm5ydXdTVGl0eFpneUdKbHErSWIxWkEw?=
 =?utf-8?B?YWlpOFJXbS9iVVllV2RQYXh6UXBOWDMrQ1NkNVQ2WlN0TUJkbWJzRkwyZG01?=
 =?utf-8?B?a3BJbUhxY3JLaktqUGNjRjNVRnlRdHBTdE1DWjNRRGZiTDZFMi9VK2VCZ290?=
 =?utf-8?B?NzREcGNWSDlVTmdPT3MzRFhVaG5GK2RKRHJ6Y3gxUVFLWVA5WkxxSTd5NFpm?=
 =?utf-8?B?dk51KzZPRHM5dG5YdHJHNnBTUi9WSlJqdExUTGFwbStTK0J6UzE5MzJPNkM2?=
 =?utf-8?B?eDBsK212c1BUOUtxT2NaZnIzWlFWeDhmeCtrQ1F1ZHd6RVlCMjdGbTBIUjlx?=
 =?utf-8?B?bllaczhodHVSNjNHZERDLzhTUGpja0NWcnI5T2d2M3VoOWpTZUt0OU1oaWdk?=
 =?utf-8?B?V0RrOGVZa2I1YkIxdDFnNFlxZFVFTlVMdCtlenh2Y2dVMjB5bElOUmVqVkZX?=
 =?utf-8?B?V2xPUUFmMFlFUWVORzJMcHBja3N3VEljMFc1cU1LeXR4R0hUNVFXeFE3b1l2?=
 =?utf-8?B?WjkvS0Q0SXZaNUpqcUN0SjQ3RCt5UStkQ3NRSWl4ajlQTlRxNjlrdklLaFpM?=
 =?utf-8?B?L1o1a1hWa09OWGIycXNhQVdhc0hLSk1tMTBqK2J6RFRIYW53aDIyRTcvN1Nh?=
 =?utf-8?B?QUY1SWhSUGtWWVgzbmtDaHpzS0JaK0pJbDNjdzF0TmZVVjVHeU0rMkZmRDhk?=
 =?utf-8?B?MkI1akUxSHNPLzhBRWZPV2lzY0dsM3ZIVXhXbUhYUW9oSnYzRXUrWnVXakpO?=
 =?utf-8?B?YnJNQ1FIc1JUL21yTWw1RUo4OTlmQnhmVkk5d1FHZlZxOElqNmpIVXZMMXpm?=
 =?utf-8?B?MGEreCtJSEtzdENlMU1lOUh0Y0wxUnMrcWpvV2hxcHpSNy9obUprdkUzcmo0?=
 =?utf-8?B?dTJMYnByekxjUjFwZkh6dnhmZ0NrbTVmZHZQdjZncEFydkx0TzN1NS9FTjU1?=
 =?utf-8?B?emdPVWN0SnhtT1R5N3E1dFNCQ3NVck5pYzNaNXY1L2xaazhWajlWNDI3SHJL?=
 =?utf-8?B?V3hiVWRVbi9zeWNKS2k3SXhkb1h3R1RLc05pUUlKVFpFNEZzRGxWZkJlZlpz?=
 =?utf-8?B?NlZ3cHRyeHJQZnV5eXdpZ1YyRmJPZm15YXAxMHgxRzRnUXZZT1Z1NXltcUsy?=
 =?utf-8?B?RUtleDJ3SjNSS0RleWxZNlk2eUJmbTBrQUNJU29YVmplQlE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 20:36:00.0070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d4ffe-8776-4c96-b697-08dca50dbcd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7768
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/15/24 10:23, Bjorn Helgaas wrote:
> On Mon, Jul 15, 2024 at 09:20:01AM -0700, Lizhi Hou wrote:
>> On 7/15/24 01:07, Amit Machhiwal wrote:
>>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>>> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>>> a pseries KVM guest:
>>>
>>>    RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>>>    Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>>>    BUG: Unable to handle kernel data access on read at 0x10ec00000048
>>>    Faulting instruction address: 0xc0000000012d8728
>>>    Oops: Kernel access of bad area, sig: 11 [#1]
>>>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>> <snip>
>>>    NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>>>    LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>>>    Call Trace:
>>>    [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>>>    [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>>>    [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>>>    [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>>>    [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>>>    [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>>>    [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>>>    [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>>>    [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>>>    [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>>>    [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>>>    [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>> <snip>
>>>
>>> A git bisect pointed this regression to be introduced via [1] that added
>>> a mechanism to create device tree nodes for parent PCI bridges when a
>>> PCI device is hot-plugged.
>>>
>>> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
>>> device-tree node associated with the pci_dev that was earlier
>>> hot-plugged and was attached under a pci-bridge. The PCI dev header
>>> `dev->hdr_type` being 0, results a conditional check done with
>>> `pci_is_bridge()` into false. Consequently, a call to
>>> `of_pci_make_dev_node()` to create a device node is never made. When at
>>> a later point in time, in the device node removal path, a memcpy is
>>> attempted in `__of_changeset_entry_invert()`; since the device node was
>>> never created, results in an Oops due to kernel read access to a bad
>>> address.
>>>
>>> To fix this issue, the patch updates `of_changeset_create_node()` to
>>> allocate a new node only when the device node doesn't exist and init it
>>> in case it does already. Also, introduce `of_pci_free_node()` to be
>>> called to only revert and destroy the changeset device node that was
>>> created via a call to `of_changeset_create_node()`.
>>>
>>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>>
>>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>>> ---
>>> Changes since v1:
>>>       * Included Lizhi's suggested changes on V1
>>>       * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
>>>         part a bit in `of_pci_make_dev_node`
>>> 	drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
>>> 	  611 | void of_pci_free_node(struct device_node *np)
>>> 	      |      ^~~~~~~~~~~~~~~~
>>> 	drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
>>> 	drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
>>> 	  696 | out_destroy_cset:
>>> 	      | ^~~~~~~~~~~~~~~~
>>>       * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
>>>
>>>    drivers/of/dynamic.c  | 16 ++++++++++++----
>>>    drivers/of/unittest.c |  2 +-
>>>    drivers/pci/bus.c     |  3 +--
>>>    drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>>>    drivers/pci/pci.h     |  2 ++
>>>    include/linux/of.h    |  1 +
>>>    6 files changed, 43 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>> index dda6092e6d3a..9bba5e82a384 100644
>>> --- a/drivers/of/dynamic.c
>>> +++ b/drivers/of/dynamic.c
>>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
>>>     * a given changeset.
>>>     *
>>>     * @ocs: Pointer to changeset
>>> + * @np: Pointer to device node. If null, allocate a new node. If not, init an
>>> + *	existing one.
>>>     * @parent: Pointer to parent device node
>>>     * @full_name: Node full name
>>>     *
>>>     * Return: Pointer to the created device node or NULL in case of an error.
>>>     */
>>>    struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>>> +					     struct device_node *np,
>>>    					     struct device_node *parent,
>>>    					     const char *full_name)
>>>    {
>>> -	struct device_node *np;
>>>    	int ret;
>>> -	np = __of_node_dup(NULL, full_name);
>>> -	if (!np)
>>> -		return NULL;
>>> +	if (!np) {
>>> +		np = __of_node_dup(NULL, full_name);
>>> +		if (!np)
>>> +			return NULL;
>>> +	} else {
>>> +		of_node_set_flag(np, OF_DYNAMIC);
>>> +		of_node_set_flag(np, OF_DETACHED);
>>> +	}
>>> +
>>>    	np->parent = parent;
>>>    	ret = of_changeset_attach_node(ocs, np);
>>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>>> index 445ad13dab98..b1bcc9ed40a6 100644
>>> --- a/drivers/of/unittest.c
>>> +++ b/drivers/of/unittest.c
>>> @@ -871,7 +871,7 @@ static void __init of_unittest_changeset(void)
>>>    	unittest(!of_changeset_add_property(&chgset, parent, ppadd), "fail add prop prop-add\n");
>>>    	unittest(!of_changeset_update_property(&chgset, parent, ppupdate), "fail update prop\n");
>>>    	unittest(!of_changeset_remove_property(&chgset, parent, ppremove), "fail remove prop\n");
>>> -	n22 = of_changeset_create_node(&chgset, n2, "n22");
>>> +	n22 = of_changeset_create_node(&chgset, NULL,  n2, "n22");
>>>    	unittest(n22, "fail create n22\n");
>>>    	unittest(!of_changeset_add_prop_string(&chgset, n22, "prop-str", "abcd"),
>>>    		 "fail add prop prop-str");
>>> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
>>> index 826b5016a101..d7ca20cb146a 100644
>>> --- a/drivers/pci/bus.c
>>> +++ b/drivers/pci/bus.c
>>> @@ -342,8 +342,7 @@ void pci_bus_add_device(struct pci_dev *dev)
>>>    	 */
>>>    	pcibios_bus_add_device(dev);
>>>    	pci_fixup_device(pci_fixup_final, dev);
>>> -	if (pci_is_bridge(dev))
>>> -		of_pci_make_dev_node(dev);
>>> +	of_pci_make_dev_node(dev);
>> Please undo this change. It should only create the device node for bridges
>> and the pci endpoints listed in quirks for now.
> IIUC, you want Amit to post a v3 of this patch that omits this
> specific pci_bus_add_device() change?

Yes.

Lizhi

>
>>>    	pci_create_sysfs_dev_files(dev);
>>>    	pci_proc_attach_device(dev);
>>>    	pci_bridge_d3_update(dev);
>>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>>> index 51e3dd0ea5ab..883bf15211a5 100644
>>> --- a/drivers/pci/of.c
>>> +++ b/drivers/pci/of.c
>>> @@ -608,18 +608,28 @@ int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge)
>>>    #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>>> +void of_pci_free_node(struct device_node *np)
>>> +{
>>> +	struct of_changeset *cset;
>>> +
>>> +	cset = (struct of_changeset *)(np + 1);
>>> +
>>> +	np->data = NULL;
>>> +	of_changeset_revert(cset);
>>> +	of_changeset_destroy(cset);
>>> +	of_node_put(np);
>>> +}
>>> +
>>>    void of_pci_remove_node(struct pci_dev *pdev)
>>>    {
>>>    	struct device_node *np;
>>>    	np = pci_device_to_OF_node(pdev);
>>> -	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
>>> +	if (!np || np->data != of_pci_free_node)
>>>    		return;
>>>    	pdev->dev.of_node = NULL;
>>> -	of_changeset_revert(np->data);
>>> -	of_changeset_destroy(np->data);
>>> -	of_node_put(np);
>>> +	of_pci_free_node(np);
>>>    }
>>>    void of_pci_make_dev_node(struct pci_dev *pdev)
>>> @@ -655,14 +665,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>>>    	if (!name)
>>>    		return;
>>> -	cset = kmalloc(sizeof(*cset), GFP_KERNEL);
>>> -	if (!cset)
>>> +	np = kzalloc(sizeof(*np) + sizeof(*cset), GFP_KERNEL);
>>> +	if (!np)
>>>    		goto out_free_name;
>>> +	np->full_name = name;
>>> +	of_node_init(np);
>>> +
>>> +	cset = (struct of_changeset *)(np + 1);
>>>    	of_changeset_init(cset);
>>> -	np = of_changeset_create_node(cset, ppnode, name);
>>> +	np = of_changeset_create_node(cset, np, ppnode, NULL);
>>>    	if (!np)
>>> -		goto out_destroy_cset;
>>> +		goto out_free_node;
>>>    	ret = of_pci_add_properties(pdev, cset, np);
>>>    	if (ret)
>>> @@ -670,19 +684,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>>>    	ret = of_changeset_apply(cset);
>>>    	if (ret)
>>> -		goto out_free_node;
>>> +		goto out_destroy_cset;
>>> -	np->data = cset;
>>> +	np->data = of_pci_free_node;
>>>    	pdev->dev.of_node = np;
>>> -	kfree(name);
>>>    	return;
>>> -out_free_node:
>>> -	of_node_put(np);
>>>    out_destroy_cset:
>>>    	of_changeset_destroy(cset);
>>>    	kfree(cset);
>>> +out_free_node:
>>> +	of_node_put(np);
>>>    out_free_name:
>>>    	kfree(name);
>>>    }
>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>> index fd44565c4756..7b1a455306b8 100644
>>> --- a/drivers/pci/pci.h
>>> +++ b/drivers/pci/pci.h
>>> @@ -702,11 +702,13 @@ struct of_changeset;
>>>    #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>>>    void of_pci_make_dev_node(struct pci_dev *pdev);
>>> +void of_pci_free_node(struct device_node *np);
>>>    void of_pci_remove_node(struct pci_dev *pdev);
>>>    int of_pci_add_properties(struct pci_dev *pdev, struct of_changeset *ocs,
>>>    			  struct device_node *np);
>>>    #else
>>>    static inline void of_pci_make_dev_node(struct pci_dev *pdev) { }
>>> +static inline void of_pci_free_node(struct device_node *np) { }
>>>    static inline void of_pci_remove_node(struct pci_dev *pdev) { }
>>>    #endif
>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>> index a0bedd038a05..f774459d0d84 100644
>>> --- a/include/linux/of.h
>>> +++ b/include/linux/of.h
>>> @@ -1631,6 +1631,7 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>>>    }
>>>    struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>>> +					     struct device_node *np,
>>>    					     struct device_node *parent,
>>>    					     const char *full_name);
>>>    int of_changeset_add_prop_string(struct of_changeset *ocs,
>>>
>>> base-commit: 43db1e03c086ed20cc75808d3f45e780ec4ca26e
