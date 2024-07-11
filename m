Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C908B92F0F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 23:19:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jlIucUq8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKnfj43P7z3fV8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 07:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jlIucUq8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKnf06czsz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 07:18:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkOGhQ+46Siol0AP5zRlTt0mJC1Hw3lc4i7DtIqYehVHTh9420Vp/QfTCJ6TutxzGKHHKH+5necfTMWjcIU1tGzshxDago3QuTaGqv/+D12t7jinXG8qgGZPKyMEuiHXRP8PKKoYvr9dH2civyC2psvmcqylL0BtE9kKRNfgF3RoK8RydeAL0rVKJS2DJ7nO8/J4wjvo4Uhq/4mUPHDInWrfexqIi2r/L9s5qhh2Pth5ekyyMJrGo6Vq1R7Yga4BQvFSNV0TjSGQQaaSplVOpQISOUybbFcoF6tFdyH41RGYQpA3ZRnw39fELBJuwTdfGbUtGe6/ru6PzowcvdgN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hpq0uub9NDZuenEmT+WB+sXMDzWJo/23VOCXlLuzu4A=;
 b=N8rXZ0IRqkIePNOWwdxwb/J9ocE4YIJbfUHHDxNaclbE8ko3eMyzOuDmjYLUxZBenQDW60Zbxs3vx3VHllMbdokc2AQ+/DIx4w+YpX0VLDh+k98YWgHuqvKqPy9vgXSzQ3Oijx7o5WRGRF9JsW8UCqtIBqKo4xj006qfSJTSnbwD2XFTdANPoEF2cKL5jj73v723cNA7juF65K0qrVs7V3yGa39OgoIGXVdma/IkpNgOphQgSoPY238sJcDwbW5Mwg251upy51eu78RMS7x4GtUNRxlmgn1m5wAvgq/wrcukeCn/B/o5jykLYiG2AwpJmmn0/3ohqkMrBlnzyYCTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hpq0uub9NDZuenEmT+WB+sXMDzWJo/23VOCXlLuzu4A=;
 b=jlIucUq83Mio/K1e+th6BG4rdUoTRdwWQqL9L+mUNXvYEMHr8Lss1qa98O112YHJ7LBFWuGh0Hah6yVTrSiVUb3RV+DQSp0IWGP2l0h0npI66EIAo/BRyFQnvAdAA/PY/PA8FwIQvEEpBXsKkWC1162XUopNA7dxTlZXsQRbK7k=
Received: from SA9PR10CA0017.namprd10.prod.outlook.com (2603:10b6:806:a7::22)
 by SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 21:18:22 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:a7:cafe::67) by SA9PR10CA0017.outlook.office365.com
 (2603:10b6:806:a7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 21:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 21:18:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 16:18:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 16:18:22 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 11 Jul 2024 16:18:21 -0500
Message-ID: <f1c2125e-c87e-d816-c92b-db814f501134@amd.com>
Date: Thu, 11 Jul 2024 14:18:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM
 guest
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-ppc@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
	<robh@kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>, Nicholas Piggin
	<npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Vaidyanathan
 Srinivasan" <svaidy@linux.ibm.com>, Kowshik Jois B S
	<kowsjois@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>
References: <20240705192034.GA73447@bhelgaas>
 <2359de90-1712-903e-c3c9-1f1f694718db@amd.com>
 <k5h7tto6kdwcgtxoeglqncojjwact6xxqnin4inffol74jdows@fj5ujezqwb24>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <k5h7tto6kdwcgtxoeglqncojjwact6xxqnin4inffol74jdows@fj5ujezqwb24>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SN7PR12MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a4e6dc-42fe-4a48-ecd2-08dca1eefead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?eUtZdzFIVGZ1amFrT1ZGZlJEbGtkM0lHQUcydGwwM1BQcGtOVldiaGlCTm1D?=
 =?utf-8?B?clRnQWx0Z0g5dnRNQXVIMUJwMXNMd1crM2M1dnRTengxNTFGVVJzd1U2ZGk1?=
 =?utf-8?B?UndDS1V4V2FZQTdnQW1PNHEwdWUvNWRTNythZEFoenpvZ3VKTFJkeXZsSU0v?=
 =?utf-8?B?ZTV1L2VYeW15Q201UGN6MHFtSnVJbHZYY1hCRmdielR2YmUzcXo1bHB6b2E2?=
 =?utf-8?B?U1lOQjAwdWRTVmVWVHo0SG5xeWQ2R09RMVM5bjR5TTZ5U1dNVFpNZERlcitj?=
 =?utf-8?B?VUlEQkNMbzBlQWUzczU1UzJ5U1BWT0RWMmRGTGpqM0JrM0NjQjBjZDc0eEIx?=
 =?utf-8?B?dmhsVHB1VHZiVDJNOFZHMTMvaVhsSzNESUFYVjlOMVBOcFd2bVJWTEllTVZI?=
 =?utf-8?B?RXBGSzJsRXZiSll3Rm4zdzgrWnptNlltalUraHQ0ZjdTNXBmODNpcHVUbVND?=
 =?utf-8?B?dGpTTHpVZWRhNGlseVh3RjBkUExtNW9RVVUvZnh6OG83NlpCOE91TXpFT1F5?=
 =?utf-8?B?NUlvMkdZNnZvMSs3ZnpUV2FQcTc2WHh5WWVJSnk1WW9HSUhHY3I0SEU3bkNM?=
 =?utf-8?B?bnN2UnBMY2tIUm1HRlc1R1JNVHNDZ0ttaEx4RnkrU1JkM2dOSGQ4OGJhd05U?=
 =?utf-8?B?K3QxK2VteUVsTE01RkJXd2R0K1BLTFpkalVUQWlwbFV6Um9JSThUWktSOE00?=
 =?utf-8?B?UXAvNnBJdGRYaDgzR0tSVXk5Q2oxRnJNbTYzaFQ4RlVDalk1aFBKbTdWY29R?=
 =?utf-8?B?czQ2c09xQmVVRHgvQ0JEbXQrRzEra0paM1VzaEM1V21oNkR3RjlYNTFzSDYv?=
 =?utf-8?B?OUVlNnl4Q2tzRERDOFVYZHRDZWxvMi9WMnByUHhYL204dmI0WnU4YzRkaHpp?=
 =?utf-8?B?WGhWdDNEd1gxU2RENWRuS0k4d0I2VXFmU3JxcFhDMGtVZDQ5QmhIVXUweTd1?=
 =?utf-8?B?a0M0RkFURE0vbFlBNGU0S0xRclpnTklmVS9OZ1pwUWhCM1JPMUFyRUdYcEMv?=
 =?utf-8?B?N1ZNczlCWjNzcHliZm5MM0FDdHZlTGNCeFl2MjluTmJXNFJwdHRlc1NIbXNQ?=
 =?utf-8?B?bjgwS2tUdjdhSEZ4UzVuM3NGb29nWGY1UUN1Z0tYczlGZE5ueCtRT2pHeWgw?=
 =?utf-8?B?NlBLRWF1ZWRGQWNFQ2prY3VsRTVONis3Tk11OG9nZTBScDloc2RjaWhsaUlF?=
 =?utf-8?B?b29nTVh6MTZTbitqU2xwOFpkN3p1L2VNdGE3K0gwRitXa0ZrTjNHbXEzVVRN?=
 =?utf-8?B?YmV0dWRaWUE1UVc2bTNOUDZHZXFsYXR1MmQ1WE1Hb1BkeXNubmRoZFBnd0Nu?=
 =?utf-8?B?VEVUTFdtcWFNSUJYdGV0VkcvV1FnU3ZNT2pLbGJGYU9mcVl2SFJLMDdrTWVY?=
 =?utf-8?B?TnBwR0tvY2pQZjBqeTFmd1IyT2dYcCtlQ1JhdW94ZTB4TG8wUVNINGZsSXUz?=
 =?utf-8?B?aDVpbVcwMmRXNWJYTXNOZDlCa3lzMS85SjEvQm9ZUXFxL01FN3VFdFFOOFpr?=
 =?utf-8?B?M2JmSm1JcnQzWWxYdC92b052WHhINTh5MkJEZ3RuZ29NV2V5VmQ2aUd3eEFK?=
 =?utf-8?B?TFBmSXo3akhtV0JnbnhOcERwN2E3OW9NS3k5cEMrcmxXMWNDRFp1RmZMMGIz?=
 =?utf-8?B?MVlKZ1B1K2hKQlRGZ0JnTkJwWDVVNG9FZzlhVkszZXVZV1BvaFZyVm9WZEht?=
 =?utf-8?B?aTFPeEhEN2d1VWZweHAyaHRLdGhETlZKTEVxVmVleHZlV2tmU240SWJLQ2oy?=
 =?utf-8?B?bit1K3RSeXcwSDY0c1kzcEdSYmgwVkN3eEVxM1c3aEtJUHFhTE5LWXlkaW1G?=
 =?utf-8?B?TWxTenVRK3VncCtuSzdBTlhRT0xNR1daK0tLTGFPeEtSMmNGQ1M5di8vMnE1?=
 =?utf-8?B?Y3o4TmxqalE1dHZVaVA0SFBoaDd6M1o3dHArZ1JJL0tyaUN3enNlY3NHdXg1?=
 =?utf-8?B?RXl3T1JMOWFjQnQxYjNlZWlrRGNKSy9BYWsrNzlXdlFyREJ4MlQxb1VMdExp?=
 =?utf-8?B?Y3NhM2ZFQ1F3PT0=?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 21:18:22.6086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a4e6dc-42fe-4a48-ecd2-08dca1eefead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/11/24 11:48, Amit Machhiwal wrote:
> On 2024/07/10 09:48 PM, Lizhi Hou wrote:
>> On 7/5/24 12:20, Bjorn Helgaas wrote:
>>> [+cc Lukas, FYI]
>>>
>>> On Wed, Jul 03, 2024 at 07:46:34PM +0530, Amit Machhiwal wrote:
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
>>>> To fix this issue the patch updates `pci_stop_dev()` to ensure that a
>>>> call to `of_pci_remove_node()` is only made for pci-bridge devices.
>>>>
>>>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>>>
>>>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>>> Tested-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>>> Thanks for the patch and testing!  Would like a reviewed-by from
>>> Lizhi.
>> of_pci_make_dev_node() will create of nodes for some endpoint devices (not a
>> bridge) as well. And actually this is the main purpose.
>>
>> Maybe the patch as below would resolve the Oops?
> Thanks for the patch, Lizhi! I tried out this patch and don't see the issue with
> the same. The hot-plug and hot-unplug of PCI device seem to work fine as
> expected.

Cool! Thanks for trying it. Will you re-spin the patch or you would like 
me to create a patch?

Lizhi

>
> ~ Amit
>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index dda6092e6d3a..3c693b091ecf 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct
>> device_node *np,
>>    * a given changeset.
>>    *
>>    * @ocs: Pointer to changeset
>> + * @np: Pointer to device node. If it is not null, init it directly instead
>> of
>> + *      allocate a new node.
>>    * @parent: Pointer to parent device node
>>    * @full_name: Node full name
>>    *
>>    * Return: Pointer to the created device node or NULL in case of an error.
>>    */
>>   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>> +                                            struct device_node *np,
>>                                               struct device_node *parent,
>>                                               const char *full_name)
>>   {
>> -       struct device_node *np;
>>          int ret;
>>
>> -       np = __of_node_dup(NULL, full_name);
>> -       if (!np)
>> -               return NULL;
>> +       if (!np) {
>> +               np = __of_node_dup(NULL, full_name);
>> +               if (!np)
>> +                       return NULL;
>> +       } else {
>> +               of_node_set_flag(np, OF_DYNAMIC);
>> +               of_node_set_flag(np, OF_DETACHED);
>> +       }
>> +
>>          np->parent = parent;
>>
>>          ret = of_changeset_attach_node(ocs, np);
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index 445ad13dab98..087de26852cc 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
>> @@ -871,7 +871,7 @@ static void __init of_unittest_changeset(void)
>>          unittest(!of_changeset_add_property(&chgset, parent, ppadd), "fail
>> add prop prop-add\n");
>>          unittest(!of_changeset_update_property(&chgset, parent, ppupdate),
>> "fail update prop\n");
>>          unittest(!of_changeset_remove_property(&chgset, parent, ppremove),
>> "fail remove prop\n");
>> -       n22 = of_changeset_create_node(&chgset, n2, "n22");
>> +       n22 = of_changeset_create_node(&chgset, NULL, n2, "n22");
>>          unittest(n22, "fail create n22\n");
>>          unittest(!of_changeset_add_prop_string(&chgset, n22, "prop-str",
>> "abcd"),
>>                   "fail add prop prop-str");
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 51e3dd0ea5ab..92c079b2e570 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -608,18 +608,28 @@ int devm_of_pci_bridge_init(struct device *dev, struct
>> pci_host_bridge *bridge)
>>
>>   #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>>
>> +void of_pci_free_node(struct device_node *np)
>> +{
>> +       struct of_changeset *cset;
>> +
>> +       cset = (struct of_changeset *)(np + 1);
>> +
>> +       np->data = NULL;
>> +       of_changeset_revert(cset);
>> +       of_changeset_destroy(cset);
>> +       of_node_put(np);
>> +}
>> +
>>   void of_pci_remove_node(struct pci_dev *pdev)
>>   {
>>          struct device_node *np;
>>
>>          np = pci_device_to_OF_node(pdev);
>> -       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
>> +       if (!np || np->data != of_pci_free_node)
>>                  return;
>>          pdev->dev.of_node = NULL;
>>
>> -       of_changeset_revert(np->data);
>> -       of_changeset_destroy(np->data);
>> -       of_node_put(np);
>> +       of_pci_free_node(np);
>>   }
>>
>>   void of_pci_make_dev_node(struct pci_dev *pdev)
>> @@ -655,14 +665,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>>          if (!name)
>>                  return;
>>
>> -       cset = kmalloc(sizeof(*cset), GFP_KERNEL);
>> -       if (!cset)
>> +       np = kzalloc(sizeof(*np) + sizeof(*cset), GFP_KERNEL);
>> +       if (!np)
>>                  goto out_free_name;
>> +       np->full_name = name;
>> +       of_node_init(np);
>> +
>> +       cset = (struct of_changeset *)(np + 1);
>>          of_changeset_init(cset);
>>
>> -       np = of_changeset_create_node(cset, ppnode, name);
>> +       np = of_changeset_create_node(cset, np, ppnode, NULL);
>>          if (!np)
>> -               goto out_destroy_cset;
>> +               goto out_free_node;
>>
>>          ret = of_pci_add_properties(pdev, cset, np);
>>          if (ret)
>> @@ -672,9 +686,8 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>>          if (ret)
>>                  goto out_free_node;
>>
>> -       np->data = cset;
>> +       np->data = of_pci_free_node;
>>          pdev->dev.of_node = np;
>> -       kfree(name);
>>
>>          return;
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index a0bedd038a05..f774459d0d84 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1631,6 +1631,7 @@ static inline int of_changeset_update_property(struct
>> of_changeset *ocs,
>>   }
>>
>>   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>> +                                            struct device_node *np,
>>                                               struct device_node *parent,
>>                                               const char *full_name);
>>   int of_changeset_add_prop_string(struct of_changeset *ocs,
>>
>> Thanks,
>>
>> Lizhi
>>
>>>> ---
>>>>    drivers/pci/remove.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
>>>> index d749ea8250d6..4e51c64af416 100644
>>>> --- a/drivers/pci/remove.c
>>>> +++ b/drivers/pci/remove.c
>>>> @@ -22,7 +22,8 @@ static void pci_stop_dev(struct pci_dev *dev)
>>>>    		device_release_driver(&dev->dev);
>>>>    		pci_proc_detach_device(dev);
>>>>    		pci_remove_sysfs_dev_files(dev);
>>>> -		of_pci_remove_node(dev);
>>>> +		if (pci_is_bridge(dev))
>>>> +			of_pci_remove_node(dev);
>>> IIUC, this basically undoes the work that was done by
>>> of_pci_make_dev_node().
>>>
>>> The call of of_pci_make_dev_node() from pci_bus_add_device() was added
>>> by 407d1a51921e and is conditional on pci_is_bridge(), so it makes
>>> sense to me that the remove needs a similar condition.
>>>
>>>>    		pci_dev_assign_added(dev, false);
>>>>    	}
>>>>
>>>> base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e
>>>> -- 
>>>> 2.45.2
>>>>
