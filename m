Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227893A885
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 23:09:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UeNxZcrZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT8sV17Cxz3ckp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 07:09:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UeNxZcrZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::622; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20622.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT8rp5dDZz3cZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 07:08:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhdJ2EY0HoLfD7rK9i7BJGgNTQqb4CY2OXtb+EMwySdzTwgNM90iHp0vOgEz4oLwXyOmcGuVJ/1utyrzHfuCp6e2MhI7XYoDDXTkqIKslkeQIWkAWRuTuS0r3ozzq/yz2FjhFDvSA4OFSRvSASPyoFwtqolDDhEp9yaolirbXRRVwKxbHAnJb0GkKetsA6KnNq58iKkxprKTJd6N9IiwF6i3IJdHA9nJyX1rLT0zdArYpo51OCgdQUiAsTTwd8MCAfy9Mj1xooqOARrUonRTpdomFRbw3syfk2TPfUfWXSy54niaejDEBTIOOQJ528YG9WlEVmv+SPrTWRN5DTZbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQmRepm8M3O+jUFZoGthTK5sXOQQY/jirnNr6L8i98g=;
 b=B/Fg1yPeGzXP7kWZexWoO7GAPti43AByY+K5phCsAc+4Jf6/AmeQJlYYcz21qChjM3cLVzt0YTBWbNfECsDSIKaGpzXovodbi3m4JF5xFm3PjsN1Gz0WBV/fwpV1cCcpQyCjHzhOo+SAiAgVZsg7pg9mw7qxe+y93u+wQBhRmxFAZoOXLta1gzHQePetxTLusPXVBpQTIDSnS7NCoTWb15467WwxsUmUswT4YlmSEyiFMsVSRM0sfEt4C1UeePyrw/0+8kCqjqyxru/RYqoc0W4NiCx/geQctec1VixUYaL38GckfMulZgUlI1ewIeFjQnegJ29hxKeW9VqwoPM/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQmRepm8M3O+jUFZoGthTK5sXOQQY/jirnNr6L8i98g=;
 b=UeNxZcrZuFQg05ygLeBo6hKMrwYfWOClvG2/BIHo3QQaXji9GMjfrzOJnOejYWYSQY+6HenJuDTjDlgjCWexNXC33QrjyqTg8jbbTr71/G20XpeSUi7cU64Lv2fB2XVeNgDclo7vqFAcRmMPEQ0b2mjTd02nQj3LGh9Mkh6guAM=
Received: from SJ0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:a03:39c::32)
 by DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 21:08:16 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::2b) by SJ0PR03CA0357.outlook.office365.com
 (2603:10b6:a03:39c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Tue, 23 Jul 2024 21:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 21:08:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 16:08:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 16:08:13 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 16:08:12 -0500
Message-ID: <ac3aeec4-70fc-cd9e-498c-acab0b218d9b@amd.com>
Date: Tue, 23 Jul 2024 14:08:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
 <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
 <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com>
 <20240723162107.GA501469-robh@kernel.org>
 <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
 <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS0PR12MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceab90d-5aba-4a33-ba08-08dcab5b91f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?a003ZW1lWlZVaG1QV1NNb1hRR2ZyZmpOeS9LNHA3UE5BcERFQU1adlpBbnhv?=
 =?utf-8?B?QzBFY3E1Z0t4bnBSUEgxdUpXb216TVIrVmc3a1FOdjNsTnBMTjBMNm9nYUxm?=
 =?utf-8?B?cDVteVhoUDJrRUdhaDJWQ3NxQUx3RGIyRzZzSWdYNFRZWS9ySncxbndoMHM4?=
 =?utf-8?B?VmN4Znl4VGdHcWxxeENaSTlOU1lDTjEvc3FqWjdLT2NWbjU1WXVxb0VPL0x0?=
 =?utf-8?B?czZSYUs1TFNjNW5oUnRPT1dsY0x1VEp6OGlaY2tQUWZhd05pSXVZbjVYZXc5?=
 =?utf-8?B?UkJKeHRFaXNhRWFLRkJnTWdnNlppc1FUc1JZRlNVaURzMzZobUpHYjNucnh4?=
 =?utf-8?B?aE45YXpHT1FvcVRiVTlJVEFLa1pYN0RUZC9tOXluTWZTQVRxVnRXMmhZVWZR?=
 =?utf-8?B?UytjbG9tWHdwYmRsM2RuWnMwT0xqRWpkeXVvVnJTYXlRWWhXZ05lZ2Q1YjJD?=
 =?utf-8?B?dkJiSzRNb2xBSk5kQm82NXJjbW04NzhOazlwNVJyZ29sWHFLNmhDelJvalV4?=
 =?utf-8?B?dHE4MS9WcVNhVVE2ZUQxTlNDcWdpTGdZeGxtbjM5Z2lpRWlTQmp4T3MydC9k?=
 =?utf-8?B?SHpVeVViWEFsYnhSVXpQR3BJdjBZby9jTnQ4L0hsQ2dsWGNQeE16Z2d5V1Rv?=
 =?utf-8?B?K3kzL2pRNGRxMzVqdXY0RHRueGYyejZxcTEzZ3NtSWVveUV1WHY0STRteEN1?=
 =?utf-8?B?OWV1S0JERlMyUmZwNTNFYmRQWURsa0VQR2F4a0M5dG5oNGl1RTVUM1dGMUZt?=
 =?utf-8?B?NzBHOXl5cy9LVWFNNTQ0UCtWZUFWM3pqRk5wZEtSWHZRVW1oVnBBaHdIT1d6?=
 =?utf-8?B?aVFacHpzVjZEMTNPNy84VkhFN0FyUW9FVHlWcjRIMUt1UWtqWkFUY1krUng2?=
 =?utf-8?B?K3V3VnJHWDRGakhnZkU3cHdCTmU3WUNkL0Y0QVgvOTFaeUpsNTRoVHBqN1BW?=
 =?utf-8?B?aWVwdWl2czl6UThhS3RHZFR6SE56M2VkQjU0eTk1dkNNalJCRmNyZHc2eGNV?=
 =?utf-8?B?SE85aGxxeDIyeGc4UU9IclgzL1dBSWtnN3p4cDEvekdWNjVNUGJKRnRwMFVP?=
 =?utf-8?B?cVl0K3MxOHFKR0lOd3lwYVVxVlBQMEVmYnZwdktzNUtFWGFIZ1ExaCt5TENu?=
 =?utf-8?B?cXJVNlpBb1VvZG5MUmJmOTVjZ0JOWWFKMzd1VjBsNDl1R1F1eWNGMGQrQWox?=
 =?utf-8?B?Rm5HNi8rY1VuV29IYi9pbXk4dDRSbFJYUHNvUVpDL1ZYSGwyMWIySWoxRndl?=
 =?utf-8?B?NWdlVWJuOVpubXRtSXNXSGdnVW9RKzhXdExYNStJTnZrOWR0THhBS0wxeURE?=
 =?utf-8?B?REdVRTRvUlZ6S3c3SHZHN1RZdHdzUTVDbmt6c01MczZCQ01aNUtpRkVhYWtz?=
 =?utf-8?B?ekR3cHphUlVTV3kxeHVzcU1LeXBEaUFIL3N2UEtjMExNb2loOUo5SzRMY1pl?=
 =?utf-8?B?SlBod2taMVZjR1dQNEc0WHVLOTI0cGgvWkhMUE15MEtlTU9QVnlpbmhQUEN5?=
 =?utf-8?B?V1lVOEVZTENWalJmd1ZyWklHRkdESVZjdExQamZoczZXeU93czNESXJuVnY5?=
 =?utf-8?B?WjgvYlpIYWxGMFlBdHBmTHNFK25yS0llakUzbHU4bFlVTzlOYVBUc2tyRWVP?=
 =?utf-8?B?VVdSQXJWdkJITU5WTVowNEdvamRqTGVjcGNSR1Exbkt6VkxUNlk3QnpTUUtD?=
 =?utf-8?B?Ymd6alMwckkzc1FhWlloMG9NQ3Z6MFg1TkFrNjFRaFhIMU4zRzJsVy9uSC9r?=
 =?utf-8?B?TmxBZmg5Qk5nNFBNUjZ2M0NoMzJ3YjZ6eTRlUXZUU2hPK2txWHpzeWdDeEFl?=
 =?utf-8?B?YmlMa2w1N2Z5OUc2aDlVU3ZWQXNlbGRDa0NSVlBtN2FtWUR2WHAzOVN0VFhp?=
 =?utf-8?B?VzJWSW0rN29wU0hvMEhmMUNJN1J6alFCRWFnZlhySjcrbFE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 21:08:15.5307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceab90d-5aba-4a33-ba08-08dcab5b91f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Lukas
 Wunner <lukas@wunner.de>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/23/24 12:54, Rob Herring wrote:
> On Tue, Jul 23, 2024 at 12:21 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>
>> On 7/23/24 09:21, Rob Herring wrote:
>>> On Mon, Jul 15, 2024 at 01:52:30PM -0700, Lizhi Hou wrote:
>>>> On 7/15/24 11:55, Rob Herring wrote:
>>>>> On Mon, Jul 15, 2024 at 2:08 AM Amit Machhiwal <amachhiw@linux.ibm.com> wrote:
>>>>>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>>>>>> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>>>>>> a pseries KVM guest:
>>>>>>
>>>>>>     RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>>>>>>     Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>>>>>>     BUG: Unable to handle kernel data access on read at 0x10ec00000048
>>>>>>     Faulting instruction address: 0xc0000000012d8728
>>>>>>     Oops: Kernel access of bad area, sig: 11 [#1]
>>>>>>     LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>>>>> <snip>
>>>>>>     NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>>>>>>     LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>>>>>>     Call Trace:
>>>>>>     [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>>>>>>     [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>>>>>>     [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>>>>>>     [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>>>>>>     [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>>>>>>     [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>>>>>>     [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>>>>>>     [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>>>>>>     [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>>>>>>     [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>>>>>>     [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>>>>>>     [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>>>>> <snip>
>>>>>>
>>>>>> A git bisect pointed this regression to be introduced via [1] that added
>>>>>> a mechanism to create device tree nodes for parent PCI bridges when a
>>>>>> PCI device is hot-plugged.
>>>>>>
>>>>>> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
>>>>>> device-tree node associated with the pci_dev that was earlier
>>>>>> hot-plugged and was attached under a pci-bridge. The PCI dev header
>>>>>> `dev->hdr_type` being 0, results a conditional check done with
>>>>>> `pci_is_bridge()` into false. Consequently, a call to
>>>>>> `of_pci_make_dev_node()` to create a device node is never made. When at
>>>>>> a later point in time, in the device node removal path, a memcpy is
>>>>>> attempted in `__of_changeset_entry_invert()`; since the device node was
>>>>>> never created, results in an Oops due to kernel read access to a bad
>>>>>> address.
>>>>>>
>>>>>> To fix this issue, the patch updates `of_changeset_create_node()` to
>>>>>> allocate a new node only when the device node doesn't exist and init it
>>>>>> in case it does already. Also, introduce `of_pci_free_node()` to be
>>>>>> called to only revert and destroy the changeset device node that was
>>>>>> created via a call to `of_changeset_create_node()`.
>>>>>>
>>>>>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>>>>>
>>>>>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>>>>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>>>>>> ---
>>>>>> Changes since v1:
>>>>>>        * Included Lizhi's suggested changes on V1
>>>>>>        * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
>>>>>>          part a bit in `of_pci_make_dev_node`
>>>>>>            drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
>>>>>>              611 | void of_pci_free_node(struct device_node *np)
>>>>>>                  |      ^~~~~~~~~~~~~~~~
>>>>>>            drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
>>>>>>            drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
>>>>>>              696 | out_destroy_cset:
>>>>>>                  | ^~~~~~~~~~~~~~~~
>>>>>>        * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
>>>>>>
>>>>>>     drivers/of/dynamic.c  | 16 ++++++++++++----
>>>>>>     drivers/of/unittest.c |  2 +-
>>>>>>     drivers/pci/bus.c     |  3 +--
>>>>>>     drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>>>>>>     drivers/pci/pci.h     |  2 ++
>>>>>>     include/linux/of.h    |  1 +
>>>>>>     6 files changed, 43 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>>>>> index dda6092e6d3a..9bba5e82a384 100644
>>>>>> --- a/drivers/of/dynamic.c
>>>>>> +++ b/drivers/of/dynamic.c
>>>>>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
>>>>>>      * a given changeset.
>>>>>>      *
>>>>>>      * @ocs: Pointer to changeset
>>>>>> + * @np: Pointer to device node. If null, allocate a new node. If not, init an
>>>>>> + *     existing one.
>>>>>>      * @parent: Pointer to parent device node
>>>>>>      * @full_name: Node full name
>>>>>>      *
>>>>>>      * Return: Pointer to the created device node or NULL in case of an error.
>>>>>>      */
>>>>>>     struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>>>>>> +                                            struct device_node *np,
>>>>>>                                                 struct device_node *parent,
>>>>>>                                                 const char *full_name)
>>>>>>     {
>>>>>> -       struct device_node *np;
>>>>>>            int ret;
>>>>>>
>>>>>> -       np = __of_node_dup(NULL, full_name);
>>>>>> -       if (!np)
>>>>>> -               return NULL;
>>>>>> +       if (!np) {
>>>>>> +               np = __of_node_dup(NULL, full_name);
>>>>>> +               if (!np)
>>>>>> +                       return NULL;
>>>>>> +       } else {
>>>>>> +               of_node_set_flag(np, OF_DYNAMIC);
>>>>>> +               of_node_set_flag(np, OF_DETACHED);
>>>>> Are we going to rename the function to
>>>>> of_changeset_create_or_maybe_modify_node()? No. The functions here are
>>>>> very clear in that they allocate new objects and don't reuse what's
>>>>> passed in.
>>>> Ok. How about keeping of_changeset_create_node unchanged.
>>>>
>>>> Instead, call kzalloc(), of_node_init() and of_changeset_attach_node()
>>>>
>>>> in of_pci_make_dev_node() directly.
>>>>
>>>> A similar example is dlpar_parse_cc_node().
>>>>
>>>>
>>>> Does this sound better?
>>> No, because really that code should be re-written using of_changeset
>>> API.
>>>
>>> My suggestion is add a data pointer to struct of_changeset and then set
>>> that to something to know the data ptr is a changeset and is your
>>> changeset.
>> I do not fully understand the point. I think the issue is that we do not
>> know if a given of_node is created by of_pci_make_dev_node(), correct?
> Yes.
>
>> of_node->data can point to anything. And we do not know if it points a
>> cset or not.
> Right. But instead of checking "of_node->data == of_pci_free_node",
> you would just be checking "*(of_node->data) == of_pci_free_node"

if of_node->data is a char* pointer, it would be panic. So I used 
of_node->data == of_pci_free_node.

> (omitting a NULL check and cast for simplicity). I suppose in theory
> that could have a false match, but that could happen in this patch
> already.

I think if any other kernel code  put of_pci_free_node to of_node->data, 
it can be fixed over there.

>
>> Do you mean to add a flag (e.g. OF_PCI_DYNAMIC) to
>> indicate of_node->data points to cset?
> That would be another option, but OF_PCI_DYNAMIC would not be a good
> name because that would be a flag bit for every single caller needing
> similar functionality. Name it just what it indicates: of_node->data
> points to cset
>
> If we have that flag, then possibly the DT core can handle more
> clean-up itself like calling detach and freeing the changeset.
> Ideally, the flags should be internal to the DT code.

Sure. If you prefer this option, I will propose another fix.


Thanks,

Lizhi

>
> Rob
