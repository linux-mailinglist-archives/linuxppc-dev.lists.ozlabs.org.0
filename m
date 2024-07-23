Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6493A579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 20:22:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D+EMST08;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT59640TSz3cyb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 04:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D+EMST08;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2412::611; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT58L0vw1z3bsR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 04:21:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8GYGID3vF4ntTeHGXOz2D568iJ3rKxqirF2B0gimJlcd9gGVvau8EAc9XfLtb6AgYL+Ze5fK/CgjyF1rS2NWFVxe+RbnDzbrLKlz7g+uVfWQkWL8BxsM//kAU0CkAKK70tefWA5SUcgqhYYTbiI3KmyhG1omiFhJve2oMhyz540baot366bkHaTJH1t6sciZb3ENE8c1X7raddUEZC8Uszmf89fBNOke3cHlHb6gmd7V4TNZXmZxspbEL1VjP17aCyyUJzK5kMKt+CtD/o355jKGI6syt142djScw7KN5SMkTG/gM2LUgZJqyklxFBuhergBUtTBzb0ZqH9Dwp3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ+WRIwCzwLTCmsYetl2Ees2baVZl0Z2KGJCpT2KcoI=;
 b=IB21Yek8HpaYI7AcDXKwGseCctTJ+lS1tLRJ8eflqExhC/APT491TOqPACTcA38vhX6eXdk1qtTEpZ5LNsJ+cu93sntcKe1hLvkn+pqVeVFJtVPO/CWOM/9gWnOSALNwlq0kRTPHG9C3ImDWi1HdB7H6luQ856SDXt773J98iUfJ4cz1hX+vYQzz6ROS2YUw8asaX4X6+yZJK/SF5dwZr1vd3YMi7SY8i+qQmt6OTG4NKrRXph8qr5fHoJW5TbfNnIXrsh0KVm3AlVjoApCIKywbJVRyBK19g4cZAAyMVckSPuSRlTWIVFgctwrGIBcIfdCZgziXTF7cxcXtnOXQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ+WRIwCzwLTCmsYetl2Ees2baVZl0Z2KGJCpT2KcoI=;
 b=D+EMST08KF6pA7W0w6QUQb8uD7KfOb1cvG3B6dbo59KGNgd0lNZiuu0i+ryAYv/KGESCeiIKShema3v2VPy90phmAmEqBjwClJlLItnIok4CA/s9K2eFoT9r9sr2GhcjmsbJyVA/AKpq1v29tlvtBiCC8c8FHDpstZo2F5LqoqU=
Received: from MW4PR03CA0042.namprd03.prod.outlook.com (2603:10b6:303:8e::17)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Tue, 23 Jul
 2024 18:21:26 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:8e:cafe::58) by MW4PR03CA0042.outlook.office365.com
 (2603:10b6:303:8e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Tue, 23 Jul 2024 18:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 18:21:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 13:21:25 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 13:21:24 -0500
Message-ID: <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
Date: Tue, 23 Jul 2024 11:21:24 -0700
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
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20240723162107.GA501469-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 24de94cd-bb2d-4a91-e016-08dcab4443ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?c0dlWWZUQkV0U3VRK0JYUlQ2QVV5b2o4YzF0VTBlaVVxNHZTbFczQmYxRzFv?=
 =?utf-8?B?VlFHQU1FaXhnL3RuMmVHS282d1BodWp5L05kaTd2b3lZQ2hjODFsUjNBblM0?=
 =?utf-8?B?Uk1FU054a2Z3Z0RLbWxFa2MwT0Y5MTdmMXg5ckpDYVpSTE5DUGh1WmVYaDNM?=
 =?utf-8?B?NFgyMHdvU1F0d3NDZmFpd2luTUNJdG8vNUpxMmpMbmZzUjdDcUkzSnkxeUtX?=
 =?utf-8?B?bS8rMUJXa3BLMGhQU1NoU1dnL1p1R25OQ05pVWNpdXVUUWxZelF3NCsrbmhV?=
 =?utf-8?B?VEZFWW1KWTFIR1NTZXRCenZBZEVDaG1sekFCUUhxeTFoZTBvTm5wYy9wS1Z5?=
 =?utf-8?B?REovV0haU20vOWVDL2FVSnQ2c0lCbFdzOVZBZVA3NFB4ZmJEZ1NHckJKaml0?=
 =?utf-8?B?M01haU5vU2JHT1YrdHZiZXFCZFVxUWRiZ1NsV2p0UUpTME5xdjl2akN6SHov?=
 =?utf-8?B?QXRXdEdwSUhBUVpJemJDeENRN1hGa1BDWmliUkVobVBHdGxydTJtSlpnTkZW?=
 =?utf-8?B?WkVMcUduQ3ovVVpmQjZxdnZJYWRXSHp6ZUlqMUxtSGF6NnBkVDNaVEJ4L0hI?=
 =?utf-8?B?THNMZ2gzVFFUVi9Cd0I4R1d0TXIzOHR4NWVGMkNLRHVVTzFvYmVTSkVXT094?=
 =?utf-8?B?eWRxM2pMVVRZZm8vem5DMFAwWmp3UFNFTTBXMnlrVVRFQkdUVnZSUFJsbXp1?=
 =?utf-8?B?T1FObVJkTmllU2QzYTBpN25wSFpUeWdVdjQrZXcvcWJONnVsanVvWHJaa1lu?=
 =?utf-8?B?cVRINkw2cXN6TFd0MjM2WWlhdXBlNmY1VXdOTVl0ZTJKL2NDZDdsVVNPT25a?=
 =?utf-8?B?TzZhZXFTdjBQWVhNOW9WTmVUT3NsUk5vVVlCZ01QTEVUR1d1c05uZlNlOUlH?=
 =?utf-8?B?WHJ3WU9XSzMzY1ZudWJhaUNsYTVrQnV1c0dtSTlXWlBqU0w5YThSVkt5dFdF?=
 =?utf-8?B?alUxeitYNGNvS1pZUm1Db2hDS0g2R0J2SDQ1bk1nQlVvNUpmVjlqTEoreG41?=
 =?utf-8?B?VnVRZ09Uanp1VUMxbDZQSXhyTGVuWENpRlBBanZES3JVeC9WMFcwSmtjenN6?=
 =?utf-8?B?ZWlXanBnSVNyUlRiSm9mYVcwWVFzTUlqZi9Bbk5WTCtPc0tBR2NCaVZENGJS?=
 =?utf-8?B?clJ0d3A1emZRUDFBQmlCMHJRTkFwS2xETDBHc0owUi9mV1daYVBVT1ZXY0gr?=
 =?utf-8?B?by9hSzFwV0k4cTc3TEx1ZWw4bW9NTlMyOStnNDFIMmF0aHBDd3BydGNMUWh0?=
 =?utf-8?B?RGR2bG1tcGtzQ0JQMlV4MTZpMkt4MHJoUWt4M1JSV0s1UVB6Q3lTeEo5U3Ji?=
 =?utf-8?B?dWxtZW8weGhyWU1KWjcwaGFkQ3MzdkxFczZtRjZqZm9xVUkzRkZTYXJsU2NL?=
 =?utf-8?B?bm1ZYnBxZHppbkMwUTVrZk1WMWk1S3NLTVEvOVIwOWlldmFIbGhXMXJFWXN4?=
 =?utf-8?B?RzYwdXZYd3g2aHpHZXFUVVZZVXN3a2FGbDZndjhJYzhPZkJOK25pZHByQjZ0?=
 =?utf-8?B?ZnBTRFhjb2xXTDV2Y29CSGVFRHJJZ1FVdC9ZcVZtMnRCdzArOThGZ1BpZlVa?=
 =?utf-8?B?NDF3aXdxSk05VFV5ODYycnliN3ZqcWhkWlVNWUdCbjE0cCtWT1ZkVXNwSTFo?=
 =?utf-8?B?bzN5cll2TEFaUFh6U29GMVdpSldhRERTaWVET1YrTUNwMXZLRm5tWEVxZ2Na?=
 =?utf-8?B?bHV0TWZsd05LVEkwekI2WFZZaGRhTHVGbk41bDBpMkJRa3FoemtoMEU5RGVX?=
 =?utf-8?B?VGxYTUE0ZytHZ1ZzVHk3Z0hzeXJlcXZBR0FDc1p1YWlDazhjSGFRaXp6VGs5?=
 =?utf-8?B?MlJaUVpKRUdUSDdYeGVTM3NFT1N1T2ZVRmpLMTA0Y0FER3EyQXc3bzlubTlq?=
 =?utf-8?B?aGR0aFl1TTZpVnU0R1RFZEltNzVEQ2k1YzZNRnY5WFcxNlE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:21:26.3968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24de94cd-bb2d-4a91-e016-08dcab4443ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Lukas Wunner <lukas@wunner.de>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/23/24 09:21, Rob Herring wrote:
> On Mon, Jul 15, 2024 at 01:52:30PM -0700, Lizhi Hou wrote:
>> On 7/15/24 11:55, Rob Herring wrote:
>>> On Mon, Jul 15, 2024 at 2:08 AM Amit Machhiwal <amachhiw@linux.ibm.com> wrote:
>>>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>>>> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>>>> a pseries KVM guest:
>>>>
>>>>    RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>>>>    Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>>>>    BUG: Unable to handle kernel data access on read at 0x10ec00000048
>>>>    Faulting instruction address: 0xc0000000012d8728
>>>>    Oops: Kernel access of bad area, sig: 11 [#1]
>>>>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>>> <snip>
>>>>    NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>>>>    LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>>>>    Call Trace:
>>>>    [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>>>>    [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>>>>    [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>>>>    [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>>>>    [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>>>>    [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>>>>    [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>>>>    [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>>>>    [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>>>>    [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>>>>    [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>>>>    [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>>> <snip>
>>>>
>>>> A git bisect pointed this regression to be introduced via [1] that added
>>>> a mechanism to create device tree nodes for parent PCI bridges when a
>>>> PCI device is hot-plugged.
>>>>
>>>> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
>>>> device-tree node associated with the pci_dev that was earlier
>>>> hot-plugged and was attached under a pci-bridge. The PCI dev header
>>>> `dev->hdr_type` being 0, results a conditional check done with
>>>> `pci_is_bridge()` into false. Consequently, a call to
>>>> `of_pci_make_dev_node()` to create a device node is never made. When at
>>>> a later point in time, in the device node removal path, a memcpy is
>>>> attempted in `__of_changeset_entry_invert()`; since the device node was
>>>> never created, results in an Oops due to kernel read access to a bad
>>>> address.
>>>>
>>>> To fix this issue, the patch updates `of_changeset_create_node()` to
>>>> allocate a new node only when the device node doesn't exist and init it
>>>> in case it does already. Also, introduce `of_pci_free_node()` to be
>>>> called to only revert and destroy the changeset device node that was
>>>> created via a call to `of_changeset_create_node()`.
>>>>
>>>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>>>
>>>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>>>> ---
>>>> Changes since v1:
>>>>       * Included Lizhi's suggested changes on V1
>>>>       * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
>>>>         part a bit in `of_pci_make_dev_node`
>>>>           drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
>>>>             611 | void of_pci_free_node(struct device_node *np)
>>>>                 |      ^~~~~~~~~~~~~~~~
>>>>           drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
>>>>           drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
>>>>             696 | out_destroy_cset:
>>>>                 | ^~~~~~~~~~~~~~~~
>>>>       * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
>>>>
>>>>    drivers/of/dynamic.c  | 16 ++++++++++++----
>>>>    drivers/of/unittest.c |  2 +-
>>>>    drivers/pci/bus.c     |  3 +--
>>>>    drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>>>>    drivers/pci/pci.h     |  2 ++
>>>>    include/linux/of.h    |  1 +
>>>>    6 files changed, 43 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>>> index dda6092e6d3a..9bba5e82a384 100644
>>>> --- a/drivers/of/dynamic.c
>>>> +++ b/drivers/of/dynamic.c
>>>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
>>>>     * a given changeset.
>>>>     *
>>>>     * @ocs: Pointer to changeset
>>>> + * @np: Pointer to device node. If null, allocate a new node. If not, init an
>>>> + *     existing one.
>>>>     * @parent: Pointer to parent device node
>>>>     * @full_name: Node full name
>>>>     *
>>>>     * Return: Pointer to the created device node or NULL in case of an error.
>>>>     */
>>>>    struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>>>> +                                            struct device_node *np,
>>>>                                                struct device_node *parent,
>>>>                                                const char *full_name)
>>>>    {
>>>> -       struct device_node *np;
>>>>           int ret;
>>>>
>>>> -       np = __of_node_dup(NULL, full_name);
>>>> -       if (!np)
>>>> -               return NULL;
>>>> +       if (!np) {
>>>> +               np = __of_node_dup(NULL, full_name);
>>>> +               if (!np)
>>>> +                       return NULL;
>>>> +       } else {
>>>> +               of_node_set_flag(np, OF_DYNAMIC);
>>>> +               of_node_set_flag(np, OF_DETACHED);
>>> Are we going to rename the function to
>>> of_changeset_create_or_maybe_modify_node()? No. The functions here are
>>> very clear in that they allocate new objects and don't reuse what's
>>> passed in.
>> Ok. How about keeping of_changeset_create_node unchanged.
>>
>> Instead, call kzalloc(), of_node_init() and of_changeset_attach_node()
>>
>> in of_pci_make_dev_node() directly.
>>
>> A similar example is dlpar_parse_cc_node().
>>
>>
>> Does this sound better?
> No, because really that code should be re-written using of_changeset
> API.
>
> My suggestion is add a data pointer to struct of_changeset and then set
> that to something to know the data ptr is a changeset and is your
> changeset.

I do not fully understand the point. I think the issue is that we do not 
know if a given of_node is created by of_pci_make_dev_node(), correct?

of_node->data can point to anything. And we do not know if it points a 
cset or not.  Do you mean to add a flag (e.g. OF_PCI_DYNAMIC) to 
indicate of_node->data points to cset?

I probably misunderstood. Could you explain more?


Thanks,

Lizhi

>
> Rob
