Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF19F931C44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 22:53:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dRuP6B5K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNDv74tpyz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 06:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dRuP6B5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:240a::600; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNDtR6k3jz3cVm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 06:53:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5vNY6+x4LWIn83G/31T041mExcYicwXaVliAn2El70UAS6Hdsieg6qfwtcgCeNhwVgWDLipROE9qm3ugzIzp6eMxzSK4RRH3CDwvCUwW3REOXxMDxoxB+TFkHXnDhVt00YJNf07FpzEJCbej/tLEdSOclPOJXOCBVHIjiJJtEg0DuY3dmPgCll+QzJvdL7O3xt4x5wAY474G8QGEZPyzUgdWf9S9V2J9aPTx9J0oDusAht9sR78lwQorsVWoy8Z/csg1VCOWWF5pwgP8MGHG4OzYjAK1C7LPGPnyEHXdTzJgwjwJip+02+/0YGRbypHO98frIEbAYv0wg9N1lXKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAJZR9z6JdoPBYREPRDgPQAqP51s1OtADcF923iSvko=;
 b=oT5QufM2zPJAO6UJdAVMz6HkNE0A1Rw4Jvf8oUw+ZWI0nF8J3a8TpZlyzIHAVLiQRHq2RREhcttj/8Zx4kpiJtgR8hs99dK/KZXGVKwc96WrvgC3d/w0MQ0vOiObaDQNemg3dTFq3/P2PdMb9iJm1E+ovAkTke5o8f/2G9VdF3M3ea7c5iVcDWcyTeV7k7fJ7pw6ej2dH7NsH6q5vedcv7V1B+PwVrIeOhZbq9rLo0Z3Cw07x75zTXVwFT4HCEwdHfDNGX/3hvU7JB1JDrq7DkdZOaE5NqR32LJb0bj4ZO2qQZNiWSKgOsTKEe9NgiocVoU/5ur8UQ/gktSDOOp3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAJZR9z6JdoPBYREPRDgPQAqP51s1OtADcF923iSvko=;
 b=dRuP6B5KmI0tc4YprOyfB8RKD22Wz2SFg3X8CPpPgzsOqLe2pyCRZbnU78mNMD9yLrbakGAMk8tsL4HPQfGxcLJXA8x8LqN34oZy7l1RThTOt8uaOhayD7Kax2BlSUvIOwtxtzNGaVGXSxWHhQTjcm8lNf3hJNciHeR3TEcHUiI=
Received: from CH0PR08CA0010.namprd08.prod.outlook.com (2603:10b6:610:33::15)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 20:52:38 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::21) by CH0PR08CA0010.outlook.office365.com
 (2603:10b6:610:33::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 20:52:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 20:52:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 15:52:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 15:52:36 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 15:52:35 -0500
Message-ID: <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com>
Date: Mon, 15 Jul 2024 13:52:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Amit Machhiwal <amachhiw@linux.ibm.com>
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
 <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8cc9a5-a002-4c11-8277-08dca5100f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?aEVFdG1TVjlHNGoyakNmblY1MVRIOE9OdGhaWGd4aVVKOTFyU01xcm1mcWJi?=
 =?utf-8?B?SU1IenkxLzBpSS9jc3Fnc0hLczAwMTVFZ0V5MU12YXhDR3hjRGVCcDFJNVlh?=
 =?utf-8?B?VGRqeE56WnhZb3pRbTJmanBTWDFFRjQ2TXU1eFRXblIwM29XSndBR0ZwMUNy?=
 =?utf-8?B?RmJSNkdVRG4yb2dTcDdhZlloN2pKMklteDd1UVJ1UktTanh3aTV5cXBLKzc2?=
 =?utf-8?B?MXhNMCtjSFNkek5zTmJ3akp0TXVtNTRnbGdwNGVVUVBIOG95cnRQQllYZVA2?=
 =?utf-8?B?Nk5NeHlUV1JZNU9UdzFPNjVSSDZKUndPYU8wOHc0R1psM1VGMS9hamtBYjUr?=
 =?utf-8?B?MkRBUjNoVlh3ODVOeEdPakFNcjB3NWEreFY2ZFZPMWo0d0lRSWgzZ0I4bHpk?=
 =?utf-8?B?WkR1L2Z2Rk9jMW1sN09RUHlFNHdXbnBiUTNJUkkrQjBPL1o2Z3paV1AyRXFJ?=
 =?utf-8?B?d0lCVWkvVGF4WWdrM2hrQXhUU09XMFZWR3BhWm1ua1dQcHZqbjJzNXg2bG9F?=
 =?utf-8?B?eGxIUFJDaVhVaXh5MXErR3FPTkgzdSt6QmVaRUtIOEdmbGh0T0NFTGEvRHIr?=
 =?utf-8?B?Zys4Mk9xZUhTeHVrdkRNZDNaRmx4VWRsN08rajEwQnBSZndzWmpmcG8vV2Yw?=
 =?utf-8?B?OXpVbFBIazBxTTZOVEFPN1BVUFpjaDB5dWx1cjF0cG12L0tDODRvZ3RVb1RU?=
 =?utf-8?B?UnF3RU5Gais0R3Nwd0hXdElPa2J2bjBud2RnWlpYbFIySHd1TzVEWGsrOW56?=
 =?utf-8?B?Zy9VbXpndDdLYnYwVE5jejk4L3p3VUh3UGtXcHNaZ3Qza1lxNktMYjJqc3Z3?=
 =?utf-8?B?cHFNejN4NEY5ZlNqem5sRm5UdDNYM3JGM0VIRTg3a2FqYU9qSHNoUk0rS2Qv?=
 =?utf-8?B?SFY4TGQ3NGJaOWh4TjhVMkQ5WktGUDJQUW9YZ1lsM2FkZFlubUZ4TkwxenRn?=
 =?utf-8?B?SStSL2FLZENUQUVxVmhEcThTNGtjbVVYeCtYZFg5RjUzd2RBZ2MzckM5Ylpk?=
 =?utf-8?B?YkpHbDlLcEc4djdJQ29HZEVRN1luMFVkcXFKbS9LeDVmRzlDcVdQbitjcDVY?=
 =?utf-8?B?cmJ5djloSDhwMVVMelhqYkY4ZU5pNUkybnFtN2NXV2RmZUZXZThjb3NFOURw?=
 =?utf-8?B?SHdZTWdQWGpvRHFDMGR1ZlpoUnllL0c1b2w3WEZkSC91K2Z5OHJYSHFKMVQ5?=
 =?utf-8?B?bnl0OFpNSm91bndFVk9iNGFVaUc4TEdCeE14Wm9kRnQyTWcxM2ZXVmRZRk1P?=
 =?utf-8?B?bjdPRXJvVm5OVnU0bTRIN2lleFhXRWtINGtCTTlldGpCUmEzU0ZvNWVKYnJt?=
 =?utf-8?B?MkNENkJMSUxCYXBPcTRLWWxLUVBMMkFuems5SUNPaGhINnJMV25rVFRNNTdT?=
 =?utf-8?B?YUJpbDd2aHl3RDBYWW1LWWI5R1h2QW1LSE5JTmdpZEY3UGtkc2phWlNTTU1h?=
 =?utf-8?B?THBuZXlUUWxiVzlKcitNV2dqbEJWYkxiT1N3dkYwY29nbEdvVmdWbWt3TGF3?=
 =?utf-8?B?Tk9RWkpML2hrbVErQWlwekg5cno1bjk5MkJSSys3b0RBa3pKcjFkOHEzQWI3?=
 =?utf-8?B?OHBhNTV0NTBzbEZhc0hoZkxlSVludU1oZTJLR1NUYjBOWG5sZTB1V1RwVSs5?=
 =?utf-8?B?enJVaDdqU3RWcEVWMTJiNlIvK2JzVWViZDFiKy8xUlc3TUgwSFZabVliTlhS?=
 =?utf-8?B?cjIwamM2Rm45V2o4SGFIMlZZSGlBRUh5MFc1Q2ptKyt0Z0svYkx6ZWZBNlJH?=
 =?utf-8?B?Vk9ZajJrYTdIUTNqNmQ0c3duL3Iwd2p0TVdnaHU5TWtFSlFWZHZBejRpeStC?=
 =?utf-8?B?K1FiRHFicStPcEFWMWhmaFo4dGdCUmVlYlYyNW1tVjE2YlVhckNjYmdwY1JY?=
 =?utf-8?Q?She5uOD3BBE6m?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 20:52:37.7262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8cc9a5-a002-4c11-8277-08dca5100f8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
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
Cc: devicetree@vger.kernel.org, Saravana
 Kannan <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/15/24 11:55, Rob Herring wrote:
> On Mon, Jul 15, 2024 at 2:08 AM Amit Machhiwal <amachhiw@linux.ibm.com> wrote:
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
>> To fix this issue, the patch updates `of_changeset_create_node()` to
>> allocate a new node only when the device node doesn't exist and init it
>> in case it does already. Also, introduce `of_pci_free_node()` to be
>> called to only revert and destroy the changeset device node that was
>> created via a call to `of_changeset_create_node()`.
>>
>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>
>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>> ---
>> Changes since v1:
>>      * Included Lizhi's suggested changes on V1
>>      * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
>>        part a bit in `of_pci_make_dev_node`
>>          drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
>>            611 | void of_pci_free_node(struct device_node *np)
>>                |      ^~~~~~~~~~~~~~~~
>>          drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
>>          drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
>>            696 | out_destroy_cset:
>>                | ^~~~~~~~~~~~~~~~
>>      * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
>>
>>   drivers/of/dynamic.c  | 16 ++++++++++++----
>>   drivers/of/unittest.c |  2 +-
>>   drivers/pci/bus.c     |  3 +--
>>   drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>>   drivers/pci/pci.h     |  2 ++
>>   include/linux/of.h    |  1 +
>>   6 files changed, 43 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index dda6092e6d3a..9bba5e82a384 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
>>    * a given changeset.
>>    *
>>    * @ocs: Pointer to changeset
>> + * @np: Pointer to device node. If null, allocate a new node. If not, init an
>> + *     existing one.
>>    * @parent: Pointer to parent device node
>>    * @full_name: Node full name
>>    *
>>    * Return: Pointer to the created device node or NULL in case of an error.
>>    */
>>   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>> +                                            struct device_node *np,
>>                                               struct device_node *parent,
>>                                               const char *full_name)
>>   {
>> -       struct device_node *np;
>>          int ret;
>>
>> -       np = __of_node_dup(NULL, full_name);
>> -       if (!np)
>> -               return NULL;
>> +       if (!np) {
>> +               np = __of_node_dup(NULL, full_name);
>> +               if (!np)
>> +                       return NULL;
>> +       } else {
>> +               of_node_set_flag(np, OF_DYNAMIC);
>> +               of_node_set_flag(np, OF_DETACHED);
> Are we going to rename the function to
> of_changeset_create_or_maybe_modify_node()? No. The functions here are
> very clear in that they allocate new objects and don't reuse what's
> passed in.

Ok. How about keeping of_changeset_create_node unchanged.

Instead, call kzalloc(), of_node_init() and of_changeset_attach_node()

in of_pci_make_dev_node() directly.

A similar example is dlpar_parse_cc_node().


Does this sound better?


Thanks,

Lizhi

>
> Rob
