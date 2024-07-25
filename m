Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927093CB0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 01:07:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1Z9HHSzZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVRP60lvGz3d8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 09:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1Z9HHSzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2412::630; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20630.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVRNQ0Phbz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 09:06:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMIqt0csf7x/oOoN2P0Ilelwd6idR7pRJ/eZAyYLpX1PbRoReYMCTwk93aZnobzxYztxhFyKKV2TKknroMQYGSDi+cKjluo0BrIrhQeIghApp4dQCqk1s2JOK6SgljP9iwvdiIDIldkR23qsZe8Sya9/h4mfvPaq9pOKGjldBFZEZ+AgbX/ziMbLBuwWFdc5+iLLxGRzQ8I34vJkhYXnmZi2PoGaxcxesBNlnxksLLvSBe4/GoOBDBu60E8xZ9AjUjyVWZ5A1l1kECvNEGbQc2MjIyU8d6MXaFfMODSmYpOneQGGEjUmyc2bIJZN7A6NsDsO+/72uMPmboD+0txTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il4SB7s+ki6bVxrtqVpkk01eHs55F7Hj/R6PzEKnTKE=;
 b=pmwq/hJw7U3Zjgjri3zFk35ig1QQOls9H7QSIvogi94J/y3GzWZ55LOH6mGDC/B0G+fGqnE9W6wzFEqOi2ol02kvifuGhzWHvO87qKKKk5zvvgru8VzljwRvguocguo3kql20aTpUpfxj6Hi9ImhdmojRB5F/LMYerN3txt//hUkWMdy/jj9PvHF60iNPLPPkjq2YqQbrrurQVHneVjX3j0b6j7HytDJiajsrdTXdR7bufae0or4MsWQZKopVf7F7J3x1VVR0WNHPJiTzPgHKxmwjmjdbB+aO/yx/hgw+Qo5cFuZgyF6VBdcuTdAFtKiejTTAhHVvT9wfOufK6sDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il4SB7s+ki6bVxrtqVpkk01eHs55F7Hj/R6PzEKnTKE=;
 b=1Z9HHSzZq3JwtZQ+a01NlGL+iwVWoZBavOJ+G3ZfRsol9s6P5pS8tYZz+DiyJONOfq1S/muqI9ncexEmcH6PJolc6XWRbEZkTEv2aS0APyBGQIESc1qamyzYwC4aQqhAleblHYwD5RAejUmVFM+MoHqQqTpaT7/9IIGrfyd9XJI=
Received: from PH7P220CA0055.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::8)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Thu, 25 Jul
 2024 23:06:37 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::e9) by PH7P220CA0055.outlook.office365.com
 (2603:10b6:510:32b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Thu, 25 Jul 2024 23:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 23:06:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 18:06:35 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 25 Jul 2024 18:06:34 -0500
Message-ID: <d20b78cd-ed34-3e5a-0176-c20ee5afd0db@amd.com>
Date: Thu, 25 Jul 2024 16:06:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm-ppc@vger.kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, Vaibhav Jain
	<vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Vaidyanathan Srinivasan
	<svaidy@linux.ibm.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, Lukas
 Wunner <lukas@wunner.de>
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
 <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
 <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com>
 <20240723162107.GA501469-robh@kernel.org>
 <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
 <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
 <ac3aeec4-70fc-cd9e-498c-acab0b218d9b@amd.com>
 <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: 775bbea0-ad0d-4fa7-0390-08dcacfe6f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?dUM2RmxxaHN5UFZHSWhvRmhIaGpScnV6NG10TTJyNzBxUXo1d21rb2NFYW83?=
 =?utf-8?B?LzNuS2Y3TW5WNk8rVk1RR3p2NHB0WnlxVmZZRldWUWNIM0NnS2ljbWs3czJm?=
 =?utf-8?B?RnJBb0I0VEhub24ycytKWS9YT2s2MUNYVUx0bmZ5dnBRRUduRGxQZzJJa0Jp?=
 =?utf-8?B?OVB3VkszMTlUMFQzTEQxS3FNeW5oMXE4amN3SFc4WUFndGJSbTd5a0ZNRC9i?=
 =?utf-8?B?UXFIRmxySHQ4d3o3cGFlWENoczhaMWJuL2xkWkxpcTlCbWhhZUtpWlJPU3Bs?=
 =?utf-8?B?N3lPZm0zejlIc0dqclpjQ0gzeHFtU3dpck1SazduT1VXZ1o1MGlTREtCVFpT?=
 =?utf-8?B?dnFabTdqNUVDL1VOUU0wNFdFc21ubTRuZ0xGaUhycnVXakkyQjBIdWs5cENq?=
 =?utf-8?B?aGY4OUZGNU9iOWhnYWhYS0ZteFFuMFVORmp4Ky9MU2s5eFdhR0Qxa1VDQUZI?=
 =?utf-8?B?TjU2ZTlnTGxsMkVpd0xGNW1od3ljME5qY3d6YTZwZ1ZxS2ZhcHZJazRRa0V2?=
 =?utf-8?B?OFdMZjBrNUl1V001djhNMHhGNXN4UUVabGJhTHJ5ZmRTK3lwc0pBZ2xMb01F?=
 =?utf-8?B?NTBaaHViQUFoNUxRRmJ2VXF4dUlhNTBOSW5OUy82UjhYZ1YyT29qUlNVQUJP?=
 =?utf-8?B?T3d3TzBVSTdjaVNLSWhLZTk3Z3VBTGZZOVFJNnRITS83OWpCeHhEWEhuMXdD?=
 =?utf-8?B?cVBWSjlxNTRaNWloVjhSUm1kMTlzU3VHRGZsWlZiQzFxVHA5TDk5Vk1ra0Rp?=
 =?utf-8?B?SzZTSFU0bkhkTnluVkpHU1VXYjRJVEtGWEY0NVVhTTArRnRhYmovQVFIeWxs?=
 =?utf-8?B?a0pyRFdibVRwcmhoTkF2d2p6anhySnBmQVZTZFJPNVJWbWV4UG9ZZ3h3bExT?=
 =?utf-8?B?RWhBMnJPenNSb05vV2wvL3V3NkRNb29TcnBtK0JKWDdITWh0ZzVCajFNNEdx?=
 =?utf-8?B?SjkxdkJ3bHhWeGhuOGdKdWNuNFVzbmFSVHZTTnFTY28rT2tKa3VOSk9SdjVK?=
 =?utf-8?B?Y21nZ2Fyc1prRkJReHJtNElYS1gyYlFSUHp2c29FeHh1OGxMTEJ5Q1ZhSUZY?=
 =?utf-8?B?UGVJdDVtV1hkMXQ1aEhMbE5ORUNBYmpYZjc0VFhXSGNpL3FIVSsrVDE1RTRN?=
 =?utf-8?B?ZWhFOG84SkZWTnZnc2J4RW1OczhEaDVCTHZ0aExqM2RrUHMrOG43ZGFOYjBl?=
 =?utf-8?B?SjJXUGJ5OHFaOW5MaUNYdXhRa25JN0NnY25xYmJ0bURXOGRhYmFCT20xMldH?=
 =?utf-8?B?NVFDYVozMXNFWmZJSnFYY2xCZkwyalVHNGZIQjJrUFM5czE4aHBTK0VxbVM5?=
 =?utf-8?B?b043alAzWUFhWDQxM3RneEkxVkpUMkEyb0xCUVVaZFRNQ20yL1VTT1FmYTBa?=
 =?utf-8?B?U3kxN3hxWGFBdzZqeHZ3aHR2TnZ4b3lpZDZLWXBqWGhjZ1hGRGZYdkhhUm9X?=
 =?utf-8?B?dndpbGhhUGFUMUYzUUtDREpDcFZGblRoZmxiQUkxQ0hSN3FHaWdwZXpqTTRX?=
 =?utf-8?B?OGx3OVFoT3RoOCtiVUpMWWpheVd3QjU0MHI4RFpkaVc4bmhFaU42VHFObWNy?=
 =?utf-8?B?S01BSXAwZFc2RkRxQ2c2MnhrNU85b1lMWE8rSmUyTU1ZYlJLMUJMS05BOG56?=
 =?utf-8?B?MmxKY0xhVzBHV25HZmdoZlA0K3hIc09iRzlBcU5GTU9WQTZJOUpUYUhpSVgy?=
 =?utf-8?B?QjVtWTZyeGpYSTBWWFB2SjA2VjZ2bk8rK05yWFRGSU1QT0p0SlpuRVJIWnRI?=
 =?utf-8?B?b0xrbUYwUXVlSGI1WXdNREZHVjBQNE1ESnRFbElqcjdSTlhZT0JXeVpuSHJR?=
 =?utf-8?B?cFIrR3VLWWdDbjV6c3JvamdWdnNkbEx1SzJBbTNWZ2U0NEVWcnBQYmphVE82?=
 =?utf-8?B?bkdNRlRyVUZ0bUpMWXZ0Tysra1FESXBkTUFwODRpZHVKRUE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 23:06:36.4381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775bbea0-ad0d-4fa7-0390-08dcacfe6f2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
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

Hi Amit,


I try to follow the option which add a OF flag. If Rob is ok with this, 
I would suggest to use it instead of V1 patch

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index dda6092e6d3a..a401ed0463d9 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -382,6 +382,11 @@ void of_node_release(struct kobject *kobj)
                                __func__, node);
         }

+       if (of_node_check_flag(node, OF_CREATED_WITH_CSET)) {
+               of_changeset_revert(node->data);
+               of_changeset_destroy(node->data);
+       }
+
         if (node->child)
                 pr_err("ERROR: %s() unexpected children for %pOF/%s\n",
                         __func__, node->parent, node->full_name);
@@ -507,6 +512,7 @@ struct device_node *of_changeset_create_node(struct 
of_changeset *ocs,
         np = __of_node_dup(NULL, full_name);
         if (!np)
                 return NULL;
+       of_node_set_flag(np, OF_CREATED_WITH_CSET);
         np->parent = parent;

         ret = of_changeset_attach_node(ocs, np);
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 445ad13dab98..191ab771d9e8 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -895,8 +895,6 @@ static void __init of_unittest_changeset(void)
                  "'%pOF' not added\n", n22);
         of_node_put(np);

-       unittest(!of_changeset_revert(&chgset), "revert failed\n");
-
unittest(!of_find_node_by_path("/testcase-data/changeset/n2/n21"),
                  "'%pOF' still present after revert\n", n21);

@@ -908,8 +906,6 @@ static void __init of_unittest_changeset(void)
         if (!ret)
                 unittest(strcmp(propstr, "hello") == 0, "original value 
not in updated property after revert");

-       of_changeset_destroy(&chgset);
-
         of_node_put(n1);
         of_node_put(n2);
         of_node_put(n21);
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 51e3dd0ea5ab..836aaba752bb 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -613,12 +613,10 @@ void of_pci_remove_node(struct pci_dev *pdev)
         struct device_node *np;

         np = pci_device_to_OF_node(pdev);
-       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
+       if (!np || !of_node_check_flag(np, OF_CREATED_WITH_CSET))
                 return;
         pdev->dev.of_node = NULL;

-       of_changeset_revert(np->data);
-       of_changeset_destroy(np->data);
         of_node_put(np);
  }

diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..a46317f6626e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -153,6 +153,7 @@ extern struct device_node *of_stdout;
  #define OF_POPULATED_BUS       4 /* platform bus created for children */
  #define OF_OVERLAY             5 /* allocated for an overlay */
  #define OF_OVERLAY_FREE_CSET   6 /* in overlay cset being freed */
+#define OF_CREATED_WITH_CSET    7 /* created by of_changeset_create_node */

  #define OF_BAD_ADDR    ((u64)-1)

Thanks,

Lizhi

On 7/25/24 10:45, Amit Machhiwal wrote:
> Hi Lizhi, Rob,
>
> Sorry for responding late. I got busy with some other things.
>
> On 2024/07/23 02:08 PM, Lizhi Hou wrote:
>> On 7/23/24 12:54, Rob Herring wrote:
>>> On Tue, Jul 23, 2024 at 12:21 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>>> On 7/23/24 09:21, Rob Herring wrote:
>>>>> On Mon, Jul 15, 2024 at 01:52:30PM -0700, Lizhi Hou wrote:
>>>>>> On 7/15/24 11:55, Rob Herring wrote:
>>>>>>> On Mon, Jul 15, 2024 at 2:08 AM Amit Machhiwal <amachhiw@linux.ibm.com> wrote:
>>>>>>>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
>>>>>>>> of a PCI device attached to a PCI-bridge causes following kernel Oops on
>>>>>>>> a pseries KVM guest:
>>>>>>>>
>>>>>>>>      RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>>>>>>>>      Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>>>>>>>>      BUG: Unable to handle kernel data access on read at 0x10ec00000048
>>>>>>>>      Faulting instruction address: 0xc0000000012d8728
>>>>>>>>      Oops: Kernel access of bad area, sig: 11 [#1]
>>>>>>>>      LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>>>>>>> <snip>
>>>>>>>>      NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>>>>>>>>      LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>>>>>>>>      Call Trace:
>>>>>>>>      [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>>>>>>>>      [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>>>>>>>>      [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>>>>>>>>      [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>>>>>>>>      [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>>>>>>>>      [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>>>>>>>>      [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>>>>>>>>      [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>>>>>>>>      [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>>>>>>>>      [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>>>>>>>>      [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>>>>>>>>      [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>>>>>>> <snip>
>>>>>>>>
>>>>>>>> A git bisect pointed this regression to be introduced via [1] that added
>>>>>>>> a mechanism to create device tree nodes for parent PCI bridges when a
>>>>>>>> PCI device is hot-plugged.
>>>>>>>>
>>>>>>>> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
>>>>>>>> device-tree node associated with the pci_dev that was earlier
>>>>>>>> hot-plugged and was attached under a pci-bridge. The PCI dev header
>>>>>>>> `dev->hdr_type` being 0, results a conditional check done with
>>>>>>>> `pci_is_bridge()` into false. Consequently, a call to
>>>>>>>> `of_pci_make_dev_node()` to create a device node is never made. When at
>>>>>>>> a later point in time, in the device node removal path, a memcpy is
>>>>>>>> attempted in `__of_changeset_entry_invert()`; since the device node was
>>>>>>>> never created, results in an Oops due to kernel read access to a bad
>>>>>>>> address.
>>>>>>>>
>>>>>>>> To fix this issue, the patch updates `of_changeset_create_node()` to
>>>>>>>> allocate a new node only when the device node doesn't exist and init it
>>>>>>>> in case it does already. Also, introduce `of_pci_free_node()` to be
>>>>>>>> called to only revert and destroy the changeset device node that was
>>>>>>>> created via a call to `of_changeset_create_node()`.
>>>>>>>>
>>>>>>>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>>>>>>>>
>>>>>>>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>>>>>>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>>>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
>>>>>>>> ---
>>>>>>>> Changes since v1:
>>>>>>>>         * Included Lizhi's suggested changes on V1
>>>>>>>>         * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
>>>>>>>>           part a bit in `of_pci_make_dev_node`
>>>>>>>>             drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
>>>>>>>>               611 | void of_pci_free_node(struct device_node *np)
>>>>>>>>                   |      ^~~~~~~~~~~~~~~~
>>>>>>>>             drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
>>>>>>>>             drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
>>>>>>>>               696 | out_destroy_cset:
>>>>>>>>                   | ^~~~~~~~~~~~~~~~
>>>>>>>>         * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
>>>>>>>>
>>>>>>>>      drivers/of/dynamic.c  | 16 ++++++++++++----
>>>>>>>>      drivers/of/unittest.c |  2 +-
>>>>>>>>      drivers/pci/bus.c     |  3 +--
>>>>>>>>      drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>>>>>>>>      drivers/pci/pci.h     |  2 ++
>>>>>>>>      include/linux/of.h    |  1 +
>>>>>>>>      6 files changed, 43 insertions(+), 20 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>>>>>>> index dda6092e6d3a..9bba5e82a384 100644
>>>>>>>> --- a/drivers/of/dynamic.c
>>>>>>>> +++ b/drivers/of/dynamic.c
>>>>>>>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
>>>>>>>>       * a given changeset.
>>>>>>>>       *
>>>>>>>>       * @ocs: Pointer to changeset
>>>>>>>> + * @np: Pointer to device node. If null, allocate a new node. If not, init an
>>>>>>>> + *     existing one.
>>>>>>>>       * @parent: Pointer to parent device node
>>>>>>>>       * @full_name: Node full name
>>>>>>>>       *
>>>>>>>>       * Return: Pointer to the created device node or NULL in case of an error.
>>>>>>>>       */
>>>>>>>>      struct device_node *of_changeset_create_node(struct of_changeset *ocs,
>>>>>>>> +                                            struct device_node *np,
>>>>>>>>                                                  struct device_node *parent,
>>>>>>>>                                                  const char *full_name)
>>>>>>>>      {
>>>>>>>> -       struct device_node *np;
>>>>>>>>             int ret;
>>>>>>>>
>>>>>>>> -       np = __of_node_dup(NULL, full_name);
>>>>>>>> -       if (!np)
>>>>>>>> -               return NULL;
>>>>>>>> +       if (!np) {
>>>>>>>> +               np = __of_node_dup(NULL, full_name);
>>>>>>>> +               if (!np)
>>>>>>>> +                       return NULL;
>>>>>>>> +       } else {
>>>>>>>> +               of_node_set_flag(np, OF_DYNAMIC);
>>>>>>>> +               of_node_set_flag(np, OF_DETACHED);
>>>>>>> Are we going to rename the function to
>>>>>>> of_changeset_create_or_maybe_modify_node()? No. The functions here are
>>>>>>> very clear in that they allocate new objects and don't reuse what's
>>>>>>> passed in.
>>>>>> Ok. How about keeping of_changeset_create_node unchanged.
>>>>>>
>>>>>> Instead, call kzalloc(), of_node_init() and of_changeset_attach_node()
>>>>>>
>>>>>> in of_pci_make_dev_node() directly.
>>>>>>
>>>>>> A similar example is dlpar_parse_cc_node().
>>>>>>
>>>>>>
>>>>>> Does this sound better?
>>>>> No, because really that code should be re-written using of_changeset
>>>>> API.
>>>>>
>>>>> My suggestion is add a data pointer to struct of_changeset and then set
>>>>> that to something to know the data ptr is a changeset and is your
>>>>> changeset.
>>>> I do not fully understand the point. I think the issue is that we do not
>>>> know if a given of_node is created by of_pci_make_dev_node(), correct?
>>> Yes.
>>>
>>>> of_node->data can point to anything. And we do not know if it points a
>>>> cset or not.
>>> Right. But instead of checking "of_node->data == of_pci_free_node",
>>> you would just be checking "*(of_node->data) == of_pci_free_node"
>> if of_node->data is a char* pointer, it would be panic. So I used
>> of_node->data == of_pci_free_node.
>>
>>> (omitting a NULL check and cast for simplicity). I suppose in theory
>>> that could have a false match, but that could happen in this patch
>>> already.
>> I think if any other kernel code  put of_pci_free_node to of_node->data, it
>> can be fixed over there.
>>
>>>> Do you mean to add a flag (e.g. OF_PCI_DYNAMIC) to
>>>> indicate of_node->data points to cset?
>>> That would be another option, but OF_PCI_DYNAMIC would not be a good
>>> name because that would be a flag bit for every single caller needing
>>> similar functionality. Name it just what it indicates: of_node->data
>>> points to cset
>>>
>>> If we have that flag, then possibly the DT core can handle more
>>> clean-up itself like calling detach and freeing the changeset.
>>> Ideally, the flags should be internal to the DT code.
>> Sure. If you prefer this option, I will propose another fix.
>>
> The crash in question is a critical issue that we would want to have a fix for
> soon. And while this is still being figured out, is it okay to go with the fix I
> proposed in the V1 of this patch?
>
> Thanks,
> Amit
>
>> Thanks,
>>
>> Lizhi
>>
>>> Rob
