Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44F93FD41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 20:20:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TiQ55A4X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXmqf0x7nz3cbC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 04:20:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TiQ55A4X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::628; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=lizhi.hou@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXmpw5yzYz3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 04:19:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x92+ig9NnRi6+CSVlL0IN7iyOhtUcpDi1u0YeH2uP6anUT8cwwHWnOHZfWmbYxRmMT3ufB6xWyoC0lk6a4iTzq5InXHC42iVsmgh+H6VrOeXDmzxCJk35M3ITBWeHajvcgJj/jX5aXpdANZrifQDXtI2K25JhYnK7NDwHe/E1DioPyOe73Chmie49z3fkhGeVDLxcuIgSpol4rEg/AxyBLFxwYi//MGiyiBKq7atszEswrA8vSc0ZbLFpbJObbwkLWfaAyq8ZEzR1VQXGtdV3wlT+v577+B8OyPIn4scx+eQSI29Pq01Km+OYAdcYjDiH+eU7zUUEhG+CBVCuJa1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDlIfwE8BsVW0wZ55q3xbfl/zAmQ8BQQHHEhA6iSgZg=;
 b=HaFNkAZ3ixPJS/Mk2mKZJWZN8Gn1Sv/2xYZJfijACRKtRSvrjdpQKTQNBOg5w3naZesYClsHWPAbHn1e/mjtFjAR6J8rKLsAvM+4HsUEdP773fyBw9z1nsfpI6QtJc0s66qS4A27q5jnNUbn27eYRgwMvqnKhh43AHSG8l4JiNYy6yrLiUCz8tvwsvTBJNGuwh4zutP9cs1JHhSFRkzOg8z5eYAf01EgWpmEs6q0j/ri2oXBW6hcrAS/MSK6ug+kvO1DABCSsMQeVXlYswYAjZqkt3ca5rtBcu82wVBzCjWzgh6/5CtnYWw/5YtUQ61ZMhKPfVAKR7B7QsrIl2dj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDlIfwE8BsVW0wZ55q3xbfl/zAmQ8BQQHHEhA6iSgZg=;
 b=TiQ55A4X1Z6GMYi+1rEDM/QoVfjYaQlRJs8Ork7O8gAjfcw9i1R9/sCwMxnYP+uYq8yey2viMe5HsiTbFMzhdPd4hYX1VMSgToWKHgIvnvKbPIC6pimgqqylrxfixH83T/Fc1Bepeu/yk2MPwIEQiuNwhXGlXLAtgr1zlaH4yVA=
Received: from SJ0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:33a::24)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 18:19:06 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::91) by SJ0PR03CA0019.outlook.office365.com
 (2603:10b6:a03:33a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 18:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 18:19:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 13:19:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 13:19:05 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 13:19:04 -0500
Message-ID: <8dade04c-609b-f69d-0809-4aa8fecd9b87@amd.com>
Date: Mon, 29 Jul 2024 11:19:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kvm-ppc@vger.kernel.org>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>,
	Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
	<linuxppc-dev@lists.ozlabs.org>
References: <20240723162107.GA501469-robh@kernel.org>
 <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
 <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
 <ac3aeec4-70fc-cd9e-498c-acab0b218d9b@amd.com>
 <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
 <d20b78cd-ed34-3e5a-0176-c20ee5afd0db@amd.com>
 <CAL_JsqJAuVexFAz6gWWuTtX1Go-FnHe6vJapv0znHBERSCtv+Q@mail.gmail.com>
 <0b1be7b7-e65b-8d8e-0659-388dec303039@amd.com>
 <6mjt477ltxhr4sudizyzbspkqb7yspxvnoiblzeiwxw5kwwsmq@bchicp4bmtzq>
 <af45d85c-2145-cbce-b91b-2aa70a9dcd0f@amd.com>
 <vctizrpvsuy4ebrvmub756sxs2bridn6gkav55ehlz5gjlc44b@jyzymbydkut2>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <vctizrpvsuy4ebrvmub756sxs2bridn6gkav55ehlz5gjlc44b@jyzymbydkut2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e81fcc-8500-48e5-06a3-08dcaffaeebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?S05hRXkycEhmT0haR0MxeUtqR0Z4TkpRdnNXZ1VzTVpNemJ5Y3k4dnZFdktB?=
 =?utf-8?B?K0M0dFBSVjdOaktQZWk1Q1BvWXplc0hEQUdLZ1FRa2NUOTgwT1hJNXZmdTdK?=
 =?utf-8?B?K0NTZDBXcUZyak12cHZpK0NwRlR1MGM0RGIxczdhSXdMRE5KRENNS2hrWnhT?=
 =?utf-8?B?bERvN3hyNmZDa0RrYnFXdFl6OG9EK3dua2JOeWtRZDQ4MTRWN0pTU0t4ZHVm?=
 =?utf-8?B?Z0w2eTdESGJVS09NOE9KNnUvU1JkbC9jQjZpMU9wK1l1NzV4SWhvMlBaNDBl?=
 =?utf-8?B?Zld1dGwxaU0zUXIwSVYwQWZnaFlsMXFBWTJNemhMNlMyTGdqZnJxQzQrMmxa?=
 =?utf-8?B?VGlmSnFjK09uYWhrbE9CaXRkOGpKaWhmTDdneG9BNkhYM2VneTdpZ0xXamQ3?=
 =?utf-8?B?U1ZxUHRoSmtiUVVseWNSb3F1K2ZNYmk4Wm9xdmNnNHdRR0xDOXBGbmFKc0l3?=
 =?utf-8?B?MExQVTJHZ05HTTBTdGNOM0hXcjN3cVhRRnlZWlpTdnM0NTZQZzlwR3VnL1JL?=
 =?utf-8?B?WWI5cTVva3kyOUpkc2Q1MTJQZ0ZzUmE3WUlWY0JFV1IyeHR3ZEdBQ0ltL1Iy?=
 =?utf-8?B?ekVVQUhSOHFaRjNlRFo0ZndZOWFuT2tTMVhtVzNPOTZjTEVpUjhiYWFqU1Ar?=
 =?utf-8?B?Vm56NFhUODAzQzAzQSsyQ04wbWtiVzNiUUN0UnhiU1FYNnBKMkFmVGYxNWti?=
 =?utf-8?B?NTYxWmR3MVhmRXNqOGFqUHJZYzlNMVFkTXZ5OXU2UUFuOVFGUHJ0TXpFTStD?=
 =?utf-8?B?NFY2OXFTbFVFTmtNdnFwRHptY0hyMm5jME1BUEwyd3g2UlR6SmNab0pKTnRz?=
 =?utf-8?B?enE1YURGeG84ckFDOUhXWjVqSjVKU0FISlNvSENZVmZrNnUxbXVWNllxU29u?=
 =?utf-8?B?bzNCeTRMZlZIeXcvNE4vT2V4WkNTcGZ6S1EybUxKMTVsWHFwdW44bE1Ycllw?=
 =?utf-8?B?cWVWNjdLU0lVSU1oNHYwejN5YjZqRHFGZWVnZVN0U2NwaG5NZHZ0ajVVZVhl?=
 =?utf-8?B?T3hTZWpteTFNQXQyeEo2R0dYVURxaVh5U3BidDA1NEJ0RmQyQkxTRkNXcXgv?=
 =?utf-8?B?VXFxaFJUS0N4VnpmeVZOU0daU0xicTg5Z09Yd1oxeHR0VDRYZERHdHNPN1RM?=
 =?utf-8?B?aDV2UE1YRk5pQzRtWFg3cDQvZzFUTlNwMUxZN1VNeDdHbG5Nbm5EOGo1c2ty?=
 =?utf-8?B?RWJLNzNtYkxzZDVQL1lTcFQ4MFNrR3VEaHdOalhlVFRuUCswdEY3aCtjMjFz?=
 =?utf-8?B?Nnl5S3ZjY1dxVmljT0g2VHdOR2VOQTNUa3BXcHRpUjBrcUlZK1JiSnkrQUF5?=
 =?utf-8?B?OFpHWHN6N283UXAyYURUU3B1N2JCSkZoUGt5MVJrd21wTkF6L3hJSG9tY1RU?=
 =?utf-8?B?UXNJSE95L3BPZ3FZaysxWlE4U1U2MnZQMTU5U05OL0UxVEFJR21FbWtBakRI?=
 =?utf-8?B?eG5HMmdGbWEyY0FxZy9JaXFnSktHMnhqTmhoWTR3MjBaL1ZBNmRTZnVGTWZD?=
 =?utf-8?B?bzU4Q2h1Rmh4cDFPZ1ZPaTN4ZGJZcVArUElnR1B2Q3NoQVJqelg0ZUpDNzNp?=
 =?utf-8?B?dU92UGNvcDVVUTVxTE1pZGFwNTVwanFzV1JtM25UYURBUlR0akQweUZBYlRT?=
 =?utf-8?B?d2ovWmJQMmtST0NOWVlOYitCV1dmYWpOMnM2MVVYeW1Ic3JpTmlZN2dpVFA0?=
 =?utf-8?B?R2lsOE14MGtWYjI1WGdHOFJNTzhMVHJWS01FQytrTm90OE50YTBYTFpMU2xF?=
 =?utf-8?B?eGdhMmhLeWdjbDg3WlB3WEVibEx3MXYwY1VDdlR1SnVhK1E0SkVaM2x1Vng0?=
 =?utf-8?B?a1FIdk9FOUF2eWtPblU0OGFDTUZrZWQ0L01rR2lFNnQ5NkEvM2xNZzJBaDRv?=
 =?utf-8?B?dkJXeTJnamNQWnFsd2Q2Wnl2Sm9jVVNLWGIvS2J6a1RhVGt5Umtxbkk3L0ky?=
 =?utf-8?B?bmE2blFweTVlVVpNWXJPL3R1bFVUSTc1VTI5M3BoN0htczZremVtTDk3SmJr?=
 =?utf-8?B?eTdXYUlyZGZBPT0=?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 18:19:06.0346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e81fcc-8500-48e5-06a3-08dcaffaeebc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
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


On 7/29/24 09:55, Amit Machhiwal wrote:
> Hi Lizhi,
>
> On 2024/07/29 09:47 AM, Lizhi Hou wrote:
>> Hi Amit
>>
>> On 7/29/24 04:13, Amit Machhiwal wrote:
>>> Hi Lizhi,
>>>
>>> On 2024/07/26 11:45 AM, Lizhi Hou wrote:
>>>> On 7/26/24 10:52, Rob Herring wrote:
>>>>> On Thu, Jul 25, 2024 at 6:06 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
>>>>>> Hi Amit,
>>>>>>
>>>>>>
>>>>>> I try to follow the option which add a OF flag. If Rob is ok with this,
>>>>>> I would suggest to use it instead of V1 patch
>>>>>>
>>>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>>>>> index dda6092e6d3a..a401ed0463d9 100644
>>>>>> --- a/drivers/of/dynamic.c
>>>>>> +++ b/drivers/of/dynamic.c
>>>>>> @@ -382,6 +382,11 @@ void of_node_release(struct kobject *kobj)
>>>>>>                                    __func__, node);
>>>>>>             }
>>>>>>
>>>>>> +       if (of_node_check_flag(node, OF_CREATED_WITH_CSET)) {
>>>>>> +               of_changeset_revert(node->data);
>>>>>> +               of_changeset_destroy(node->data);
>>>>>> +       }
>>>>> What happens if multiple nodes are created in the changeset?
>>>> Ok. multiple nodes will not work.
>>>>>> +
>>>>>>             if (node->child)
>>>>>>                     pr_err("ERROR: %s() unexpected children for %pOF/%s\n",
>>>>>>                             __func__, node->parent, node->full_name);
>>>>>> @@ -507,6 +512,7 @@ struct device_node *of_changeset_create_node(struct
>>>>>> of_changeset *ocs,
>>>>>>             np = __of_node_dup(NULL, full_name);
>>>>>>             if (!np)
>>>>>>                     return NULL;
>>>>>> +       of_node_set_flag(np, OF_CREATED_WITH_CSET);
>>>>> This should be set where the data ptr is set.
>>>> Ok. It sounds the fix could be simplified to 3 lines change.
>>> Thanks for the patch. The hot-plug and hot-unplug of PCI device seem to work
>>> fine as expected. I see this patch would attempt to remove only the nodes which
>>> were created in `of_pci_make_dev_node()` with the help of the newly introduced
>>> flag, which looks good to me.
>>>
>>> Also, since a call to `of_pci_make_dev_node()` from `pci_bus_add_device()`, that
>>> creates devices nodes only for bridge devices, is conditional on
>>> `pci_is_bridge()`, it only makes sense to retain the logical symmetry and call
>>> `of_pci_remove_node()` conditionally on `pci_is_bridge()` as well in
>>> `pci_stop_dev()`. Hence, I would like to propose the below change along with the
>>> above patch:
>>>
>>> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
>>> index 910387e5bdbf..c6394bf562cd 100644
>>> --- a/drivers/pci/remove.c
>>> +++ b/drivers/pci/remove.c
>>> @@ -23,7 +23,8 @@ static void pci_stop_dev(struct pci_dev *dev)
>>>                   device_release_driver(&dev->dev);
>>>                   pci_proc_detach_device(dev);
>>>                   pci_remove_sysfs_dev_files(dev);
>>> -               of_pci_remove_node(dev);
>>> +               if (pci_is_bridge(dev))
>>> +                       of_pci_remove_node(dev);
>>>                   pci_dev_assign_added(dev, false);
>>>           }
>>>
>>> Please let me know of your thoughts on this and based on that I can spin the v3
>>> of this patch.
>> As I mentioned, there are endpoints in pci quirks (pci/quirks.c) will also
>> create nodes by of_pci_make_dev_node(). So please remove above two lines.
> Sorry if I'm misinterpreting something here but as I mentioned,
> `of_pci_make_dev_node()` is called only for bridge devices with check performed
> via `pci_is_bridge()`, could you please elaborate more on why the same check
> can't be put while removing the node via `of_pci_remove_node()`?

For devices added in quirks, of_pci_make_dev_node() will be called 
through pci_fixup_device().


Lizhi

>
> Thanks,
> Amit
>
>> Thanks,
>>
>> Lizhi
>>
>>> In addition to this, can this patch be taken as part of 6.11 as a bug fix?
>>>
>>> Thanks,
>>> Amit
>>>
>>>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>>>> index 51e3dd0ea5ab..0b3ba1e1b18c 100644
>>>> --- a/drivers/pci/of.c
>>>> +++ b/drivers/pci/of.c
>>>> @@ -613,7 +613,7 @@ void of_pci_remove_node(struct pci_dev *pdev)
>>>>           struct device_node *np;
>>>>
>>>>           np = pci_device_to_OF_node(pdev);
>>>> -       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
>>>> +       if (!np || !of_node_check_flag(np, OF_CREATED_WITH_CSET))
>>>>                   return;
>>>>           pdev->dev.of_node = NULL;
>>>>
>>>> @@ -672,6 +672,7 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>>>>           if (ret)
>>>>                   goto out_free_node;
>>>>
>>>> +       of_node_set_flag(np, OF_CREATED_WITH_CSET);
>>>>           np->data = cset;
>>>>           pdev->dev.of_node = np;
>>>>           kfree(name);
>>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>>> index a0bedd038a05..a46317f6626e 100644
>>>> --- a/include/linux/of.h
>>>> +++ b/include/linux/of.h
>>>> @@ -153,6 +153,7 @@ extern struct device_node *of_stdout;
>>>>    #define OF_POPULATED_BUS       4 /* platform bus created for children */
>>>>    #define OF_OVERLAY             5 /* allocated for an overlay */
>>>>    #define OF_OVERLAY_FREE_CSET   6 /* in overlay cset being freed */
>>>> +#define OF_CREATED_WITH_CSET    7 /* created by of_changeset_create_node */
>>>>
>>>>    #define OF_BAD_ADDR    ((u64)-1)
>>>>
>>>>
>>>> Lizhi
>>>>
>>>>> Rob
