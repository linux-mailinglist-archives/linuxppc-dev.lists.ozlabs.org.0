Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6A93D883
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 20:46:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SPzIDdh0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVxXz4wCsz3dTP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 04:46:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SPzIDdh0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVxXF5FJNz3dJw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 04:45:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjSvRAUq/8PPA2CslvLuKUUpKfUPzHmdjyQm6EIjwCYqRzjhs5V17Rnn+Hrb8twSI6o91Rl6uYLkwlbHQOwjkWmV1lXWHskByn4cKwvAT+xT3JVL3QuuUfB3YWp/asflmDs2IaIe1OuTeFEu1ek0H8B/ZP6d0uDPiaGFbDn5rDiMwiucGgN5RBoQL3hZA6kWQvAooyvXC2oCq1l9JlrrdKOkQ7E/OI9NJedgfXoWLH8PjtpaPRdZiAGQggnTaSosOG9meDUarnQ0+U4QdZK1XoXAdd0OgejEiR4xNjSkxpB2vGPtFAmnZUkBwlBm93z7JVCvIAVfmLfUTtRdeB4pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9Azu0YU9Rv9RzatF4DxeJMq+5AvqzQvxgRTAjY1XOE=;
 b=wokuexyHBO4CCC02AXKieA0Nc3j0vmbjfjIqTX6rQ+N/DUBq0q2Q2EgGnlkwsyqL3edqftp4w1uwTbjAFWcH8RP66NPooU9tio7GDO+M60knDOI9B4cUXvJRgY95kiwERs1jq3PM3DSvU2PkAvdKT8N6uNwSxGjyqcFdBbpwKLB1A1UFA8Nma6MkSQDADs4TVDqfI6N3ZPlA+LbOpj4pmhm0YZfzOymBAAbNRrHL/PJ4ejR5C4q/AUEX2rxQHai5DAUHVoN81AxBYxNXnoEze5UFtWF9Jihz+VqQzNvYlCo2lPKRK9Gcbd+L3p0ywxL0GikQO8Ctk32xvrLzWWk0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9Azu0YU9Rv9RzatF4DxeJMq+5AvqzQvxgRTAjY1XOE=;
 b=SPzIDdh0gU0yHAIVV/W7l9aWSwqr0R9rxnWwCVmC+zPGmn+FR6cOvkpNSw/uoAYGQpFaD9mRQdCTN0wQnf8YFyQDkUdsb/qHALvG7sVUNWpFUQx+ziF/Z/i+lKbReKOlPQ7mK7q/fI4DZ6QtVFyCSmjtsa9Y2TeKsrefKsQgqkU=
Received: from MN2PR19CA0026.namprd19.prod.outlook.com (2603:10b6:208:178::39)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 18:45:05 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::36) by MN2PR19CA0026.outlook.office365.com
 (2603:10b6:208:178::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 18:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 18:45:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 26 Jul
 2024 13:45:04 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 26 Jul 2024 13:45:03 -0500
Message-ID: <0b1be7b7-e65b-8d8e-0659-388dec303039@amd.com>
Date: Fri, 26 Jul 2024 11:45:03 -0700
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
 <ac3aeec4-70fc-cd9e-498c-acab0b218d9b@amd.com>
 <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
 <d20b78cd-ed34-3e5a-0176-c20ee5afd0db@amd.com>
 <CAL_JsqJAuVexFAz6gWWuTtX1Go-FnHe6vJapv0znHBERSCtv+Q@mail.gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CAL_JsqJAuVexFAz6gWWuTtX1Go-FnHe6vJapv0znHBERSCtv+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ef26d3-52f8-478c-63a7-08dcada31091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?UkIvQmpQT2lQNzlLNkNJVVpveWtSTjNEYnBIaXVjWmRLVUhiUWpITzg2RDJp?=
 =?utf-8?B?Q2s3WTkwbGRudS9xK3dhV3l2UEs0OW1MOUdDREorMExHa0Q0ejNaaCt4dFZy?=
 =?utf-8?B?SmJuQjFOUG45SXUyV29qRWtna3A4MDcrZ0ZHTnRreTB6ekNCaURyWmJ0YnZy?=
 =?utf-8?B?UmJoc3J5UGZ1TXBmT0NwbVJWOERuWkl4ejlrZHFiODNSSjh5N0pkcnAxUFNl?=
 =?utf-8?B?NUFlejljcFJFdElST1BCNXJkN3ZMb0NnUzFPWlZEUEJSUXpTNERoREcyQWl0?=
 =?utf-8?B?Y1NLeUlCTm5FaUtvMlNiN3VOdjN6WTZFUFlIWENPSDl1NjBhOENhaEtnWGNB?=
 =?utf-8?B?Z2RIdWRsMjF1cjk1MWpxNFgySTV4OWIzaHlxV2xTL1ZVVFhvNGZORlRMQkZI?=
 =?utf-8?B?R3ZieFpaRG8rdG5sT29YQk54bVZpOHg5MDkrUzB5SGRrYk9pVitycVRuTVRr?=
 =?utf-8?B?UmRsbmE5L25DajZYNlZDS0RyOVhsc1ZONVQrTmtBSUpzWDh0OEczUURhU1Rm?=
 =?utf-8?B?aDNnRlFaNHlsN2ZIbHJlZDMybldrSk1tdk5ScUJDMk9RUk5aV3M1dWdmNmxC?=
 =?utf-8?B?MjZ4LzVnZkwweG1vbXUrbnVYakQxKzdrM00wYzhNU3FibE9JdXQvaUkycjhX?=
 =?utf-8?B?clR5azlJL0tMWHUvRFV1ck9FMHorRzNrSDJwVUx4L0FUSnczOVlOV3JXQ0x1?=
 =?utf-8?B?bDM3bnAybFFMZHJBQTl2dkx0M200N2c3aDdpYmJUSU92TjBKRmlZTkxLUSs3?=
 =?utf-8?B?NlNyd2tEMEZvT2Ztb2pxRTc3TzFXVnhRYjliaEk5UWxHd1Y2RDRrVmIrT0s2?=
 =?utf-8?B?UFdMcVQveXJYRytmL0pWQ3BrY0FPdEgxMmxNRzZoY29mYkY0bkk5MlRIVWJt?=
 =?utf-8?B?dllEMHpoRTRHclQ0THlJZFg3dmFweW5ocnd2T3k4Z1BpVno1VkxCNWRRK2d3?=
 =?utf-8?B?SEFwWHBaZHZOVjA1UmpJOEtuMFpXR1ZlS094djIvM3VERVJsTFRGd2NORDl2?=
 =?utf-8?B?Y1NoVnVBdzNwUUxGcVpyaS9XMHk4clFXYzJvOWtXMER6Q2FaTmZQUExxTDlS?=
 =?utf-8?B?Q2FEY1YveEg3MWkzNmhkQkErMVJqVmlEWkR2UUhBenZobWJBay9nQlZIbFh4?=
 =?utf-8?B?eFp2TEJ1TTZBc1N2MHU5b3ovTEl6b29DQUhpOVBtei9GcU1Fd2NUSk96dDJk?=
 =?utf-8?B?OGJwWVh0YjNjV0U1eXF5TDNhSXVLbGNFYVVEYkdDcU8vc1lrcmNEaStPRFk3?=
 =?utf-8?B?cUhlei9qNUwyRVpLdUtVc3lOTzQ5SGp2eUEyallXcTBiTVpvQVp0VVFwUHU4?=
 =?utf-8?B?aXRJVWVkckVRRFZ6N0w4SUtSMkE2dUhxbjhMYy9acm1DalRSSDlVZmtBVnVy?=
 =?utf-8?B?Wm1FZ1FFa1BXeGF1eE1KK1k2SDIrOWowWWdER0ora1hBUEJyUzN4azdwYXpC?=
 =?utf-8?B?dWpYTTNhZm9jRWRHYUkyVm1QaTBua1RrWkF4aWpoNVlDamhqQ0ltNkZGRGtS?=
 =?utf-8?B?K3FHK1ZjNXliRGExclFTTnlhMk1CTjFqSjMraHIrSXArSzdLMk9HM1BySk9w?=
 =?utf-8?B?NkJOeXdVQlkxaW02bU14UzlKNlF4UkxhcnAxQ1NOSE5DeW5VbmhCUWhmc1pZ?=
 =?utf-8?B?ZUY0ZmN1L0M1OUwxb3djY2hMYlV5ZHI3akh5WlBwRDU3c2NkY2dveXVzNTZu?=
 =?utf-8?B?SkM2dGkzbXo5MjZsa05YNm1FZlNIbmM5UTlKeFFRcEdFcEcwRlBXZ255T2h1?=
 =?utf-8?B?WEViMWxacHJHc3IzN3hQN0NRSnVTMnUzMnhNamFXeVV3UTNIY1pIWVZtTFVq?=
 =?utf-8?B?MEhnaEZ6S1FMNGFScU1qWDhoRXIvck1VZWdzY3ZTVVFrYkZWNEV2RERrMmg0?=
 =?utf-8?B?YkV2SjFETjJMdUE1TTNPZnluRFNMak0rblVzRlVxbUNrc1lzTGpGTENtdmE0?=
 =?utf-8?Q?KoEdZ61qaTS6vyl77i5vjULStD4RrfVQ?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 18:45:04.8224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ef26d3-52f8-478c-63a7-08dcada31091
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/26/24 10:52, Rob Herring wrote:
> On Thu, Jul 25, 2024 at 6:06 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>> Hi Amit,
>>
>>
>> I try to follow the option which add a OF flag. If Rob is ok with this,
>> I would suggest to use it instead of V1 patch
>>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index dda6092e6d3a..a401ed0463d9 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -382,6 +382,11 @@ void of_node_release(struct kobject *kobj)
>>                                  __func__, node);
>>           }
>>
>> +       if (of_node_check_flag(node, OF_CREATED_WITH_CSET)) {
>> +               of_changeset_revert(node->data);
>> +               of_changeset_destroy(node->data);
>> +       }
> What happens if multiple nodes are created in the changeset?
Ok. multiple nodes will not work.
>
>> +
>>           if (node->child)
>>                   pr_err("ERROR: %s() unexpected children for %pOF/%s\n",
>>                           __func__, node->parent, node->full_name);
>> @@ -507,6 +512,7 @@ struct device_node *of_changeset_create_node(struct
>> of_changeset *ocs,
>>           np = __of_node_dup(NULL, full_name);
>>           if (!np)
>>                   return NULL;
>> +       of_node_set_flag(np, OF_CREATED_WITH_CSET);
> This should be set where the data ptr is set.

Ok. It sounds the fix could be simplified to 3 lines change.


diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 51e3dd0ea5ab..0b3ba1e1b18c 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -613,7 +613,7 @@ void of_pci_remove_node(struct pci_dev *pdev)
         struct device_node *np;

         np = pci_device_to_OF_node(pdev);
-       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
+       if (!np || !of_node_check_flag(np, OF_CREATED_WITH_CSET))
                 return;
         pdev->dev.of_node = NULL;

@@ -672,6 +672,7 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
         if (ret)
                 goto out_free_node;

+       of_node_set_flag(np, OF_CREATED_WITH_CSET);
         np->data = cset;
         pdev->dev.of_node = np;
         kfree(name);
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


Lizhi

>
> Rob
