Return-Path: <linuxppc-dev+bounces-14676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5161CAC08F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 05:48:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPqH65nvCz2yFB;
	Mon, 08 Dec 2025 15:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765169282;
	cv=pass; b=UxVLFXmdQj6MpwdUoZs4sH4T/qRGpgXPNY0m1TqlhlYvTPh04jR8qprbxSPS8gvbqZuW4wcAXPq+SI6820HcpEq9dl7JlLF9ZTO6qKuHxNFCxkfzSe8MXidKPY/L/1mcZrlAhqS2AFzZrNVkMwKcBgatHrtL2ncCgSMEvr7vj8lkBm7R9EmZJzzn/7Q7Lz/pxvJ1KrSVB0P6c59ZH6G4P4Hzbw1CcNCYemTTcStknJfePA9AYGZHT8jEDmb3l3dF/tZXByFKa2b7b6HipICTfpjG2+ypqBKqOcEX5g32ZoQzKDzqQIbYqKeHFotgs3ETC1lrlIYrd3b9RRByT1FJiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765169282; c=relaxed/relaxed;
	bh=1BvYVQ9rQL77evRhM1kLXPfRX0Ut0INmFpqeUoBFANU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d9rJG6TQvg8k+LquHPJXHW5BSh8u4Cv46JvYj/bhJOeg1ii1yF+PumPNcE2HmWKdAo9zIrCTK6Z/Tzh5/ZU/l8TeNBDtAVpaLmaLd25yZKRC/kfPFc0aEUpD1+1z2SBq8EY4+U3T9HhxlqRwPh0lDphi7EFvvIdXdcyIL6kGk/e7MIF/+3EQM6vjipjvM+LIjbXpu7QNsVCzbXu+kSHnYBBmoEPdimyK408QF4IHkeOBOKqfr2nZypFqluyZWM3/9bGTfws2m2nmRtpbSrCvay0pEX/5lZbQ7/jRkJhdUiSHZm4eoxcGGefxKmtzKQPvg1IzZt7yq2frgemBQjKREw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cbxtL/DD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cbxtL/DD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPqH34Gjhz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 15:47:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoMaFFGuKJlczUWZvXZyg/gNcekLZYvIdxsmAtgSXQjZpkC0/VosfHjWmZwG9HirhmpFK9cPSVQloHJ7r9gHE1u8WhpBsIGtdlBbQsDg7bPZWTd0rnwJCkSnYohkDskLTIX8+ARaWUOmVKrd5/d2NItWXvz4fzamYJEzsD8ecVCc4XkK9EGg7WKgEhkAUMQW4DhaJMXHkuMUkZ2MQbccxFgEN4QPKofxQwxh8GoGooMrr8TffPQWYKgMjzsUjYDtonzklPIMWZ1nmB0tnrjSD8VTpFX9epahWJPHJZNIORQ0VlmKvuOFL8tAby7DcekIMZRQe43YOwLal4h4U3vBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BvYVQ9rQL77evRhM1kLXPfRX0Ut0INmFpqeUoBFANU=;
 b=Z4vRMnUW1MpWH1qhk0goHcWkH5evPGn/ge4WYi+35YKqb+J3WJhiOgWKbLXyDEiyS9dfAylbpYafsknGnLzWplovvD2g8NWwN2GpZXmhuo4eeUv3QX0uC++x7dBNAidj7Rw+C0YSQridbesXJyA1MKpOEUpJmRsOtnYDJmEUmkDq6zh/Dus1rOuJWd9OV6Kr3UR6PDTmV3Ts0OuzSIdEiqEvaucTpSqaozojfeEnP+sU0Gn4cQreQaWZK1lJ9d7aXj0Bq1wBkPw12k72AYEb4ex6aIpT4eu7RM8kAmlMIg48nNdC2tC5OeiFgzu1wbl7ZJF/GZNRCRjG7/CcH65KaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BvYVQ9rQL77evRhM1kLXPfRX0Ut0INmFpqeUoBFANU=;
 b=cbxtL/DDM6VsCRM/SDAQb14fi4sNZ+cLPCaAcDnfpiFWe5oS2z/+Gx6LnM9qqe21x1LRmDaY+J8L0cOA2KtiXsz3kdkk2cCk4zKb90bEuJkZ31hKLU88mNQlI3+wYpM0Yvy6VtHSx9KJ0x77vtvqXjxBirIz0SdBeDTp7hxvhhI=
Received: from BY5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:1e0::15)
 by MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 04:47:28 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::14) by BY5PR03CA0005.outlook.office365.com
 (2603:10b6:a03:1e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 04:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 04:47:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 7 Dec
 2025 22:47:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 7 Dec
 2025 20:47:26 -0800
Received: from [10.136.44.63] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 7 Dec 2025 20:47:21 -0800
Message-ID: <2f7877bd-afb4-45c1-a370-d22c2f2955f4@amd.com>
Date: Mon, 8 Dec 2025 10:17:20 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
CC: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <srikar@linux.ibm.com>, <gregkh@linuxfoundation.org>,
	<pbonzini@redhat.com>, <seanjc@google.com>, <vschneid@redhat.com>,
	<iii@linux.ibm.com>, <huschle@linux.ibm.com>, <rostedt@goodmis.org>,
	<dietmar.eggemann@arm.com>, <christophe.leroy@csgroup.eu>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e725a4f-db27-4b06-e2d0-08de3614e385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHVnRjl3Mis1aEhoazBnRHN2QTVkWVRpMmNXUjNqN1dFbDRTYnlnREtTQTEv?=
 =?utf-8?B?MW1ocFVzRzZOR2JmZVJmZHp4NzJ4anh5aldSQW9GTWI1VGJ0a1BJUTJBSkQv?=
 =?utf-8?B?anRGM000WGZFOGZaRmZkUTVRSDF3RU5GSmNGaTlwNXhUVDJkeXJwWkwwZmJz?=
 =?utf-8?B?U2NnT0VoUUtCVFlEUE1xUTZPdDRneWpnYmRtSERNbjU1eHJqcitOWXhHby80?=
 =?utf-8?B?L3JRRXRWRDdKQjVZc2F0MkRGUk0zaUxUb0xtRjliMTlabWlZWmVzdzZrWnNC?=
 =?utf-8?B?clNDZjdFMmtvUSthSURwOFNqcVB1LzRVbXZKUWlXTzFmVnN2b3V1a0dsdGFR?=
 =?utf-8?B?eEtzSUF2azhEZ1VhQWRGOHJvUFNna1RaOFRwQWxIWmJUdm1zOTBJV01nSkpp?=
 =?utf-8?B?U2FUNmEvYnhWekZpa3lhV1NZcmxXamkrL2Mwa1l4Snk1WUUxK3ZpUERUR01w?=
 =?utf-8?B?WjNSMWR1V2l6Vm5sNURRREdNdW9aL3pYVEJ6OEFOMDdUZ05ZZHFOMkkraG1v?=
 =?utf-8?B?R2dEaUROT0dCUmw5ZGpqeGI0MWFvOGFZSzZCV0dPV0cwTEJFNlpJcG14TWt4?=
 =?utf-8?B?Z1JMRUVVb04wc3QxbHltKzR5WGw2RU52VkNiL2MwNW1CeGRkMEVBNWJLWW9s?=
 =?utf-8?B?dUEwbE05QlE2QVdrVU9RbXA4OC9UNHB1Vm1CajJlTHBLdG4zd2FmSnlpOVZS?=
 =?utf-8?B?bFYwSnh2YXIyQjVmQkRLZndiY1VIVStpNmFNbk92OEhYK0ZNK3lLSzdTR0ZX?=
 =?utf-8?B?MGwzRzEwdGNHeUlnSEorV0xGVS9Ed0p5WDBsdWpSYm14QXhyYmYyRWIxTTBR?=
 =?utf-8?B?aHFuVi9OYXFvVWlmSFRiTGQ5dmcwQVZWMWNtSWZVUGUwYjZCQnRzTmlDWHhQ?=
 =?utf-8?B?TzZhR3JyR0s4WnhiZUx4ek9kNU9CbE5UNWtRWTNnYWduR0JZbWd6TmRxTGZM?=
 =?utf-8?B?dE9NY3EydW9nVTFBNjByMWVKVlVZTzVUVzRhcXQxWXNUdWlDSCtVcDJxbTVj?=
 =?utf-8?B?NTIrSmdJa2lJVnpiRUV5anNqdUlpTDlNdGkwM3E1SU9rQUtYTmt2cTBmYzZ0?=
 =?utf-8?B?TzlMbHJSUmhYei9XTFFKZjB4WDFaNHdVOVpHajR2WUF2alJwS1U3cjJ4STNo?=
 =?utf-8?B?RVVqVVFvTk5BVkJKcjltRFdzNDJJNWVldXhEVktmNnV2ejY2R3h6VC9MVjl2?=
 =?utf-8?B?RTl3S0kzOXZlSTVrNjRGOFZnQ0hMRUNkVG5Gd1Yra3FROHFKdkl0SGk4ZUo3?=
 =?utf-8?B?K2REYzI5Y280cHFRUk5aakhwZG96cFkxZ2NUVnRFYWlvYjc0S3ErRFNxekRv?=
 =?utf-8?B?eElWZmxQa3g1MUJMTTBzOFQ0YXNGTUR1eDBISXRFeWd5YlpJOFRYWmxQcjN6?=
 =?utf-8?B?cG1rSnlzQWxjTE81ZHNPRTRvQmN1b0NZUFJqTG01c20va09jb2s2bFRsSWZT?=
 =?utf-8?B?ZmdNL1Rzc0d5bVY3Wmx5MGVNc0IzTHZMMkFmR3RIakZpWE5hdGVzOG1NOG10?=
 =?utf-8?B?ZG95N0M0cUtzTjVuQ1psU0xEd01uLzVaSG04bnR1TDNWamhYbmVJSTNUbnlZ?=
 =?utf-8?B?djJOTnJ2WlovVmVnV29WTlo0bU5McVhqYklXTGhqY3hhU1pQck9XeW42Y3Nk?=
 =?utf-8?B?NmFJWWdBYlRidnJCK2EvOTB3NnRwZFdKVmdHWExYWWVnUENrUDRJc2FXdlpy?=
 =?utf-8?B?OEtuRWZkMUk5SlBqSXR0dytvSmVDWkYzTEN5MHlhcDlpcEI5OXVnNFhzL0Fz?=
 =?utf-8?B?RVc2SUtVUytnNGFCNHA0NXR0WExXRGlKaGtTRStEemsvQmVBK3hESVRoeUN4?=
 =?utf-8?B?ZE9zRUN2czFCNktZWmtDS21JbEl5TzIrOU5iN09nUXZiUnNNRW8vSEdZckk0?=
 =?utf-8?B?K1hORmlXbHlDZ3dLWmZLTkNjaU4vZmN6US9hbXlvZGdPRkZmK2xWY1h6ZW1j?=
 =?utf-8?B?QThLMlFob3p6ZXkxdTlxQUwrMUtqWFJaNXQzT1lHQXpiMitaNHlDODhwUllm?=
 =?utf-8?B?QzBPeW16eXhvYkRnY25aOHMwbGNpS2YzL1lKa3R6RG1yVVA4K0YwR0tNeW1v?=
 =?utf-8?B?WjcvZE1ybnA0VXpNcEhNQ1IxS2RWQ3JBR1pHNWl6NkZSRXd2QkkrVUxrWnI5?=
 =?utf-8?Q?Ptog=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 04:47:27.6298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e725a4f-db27-4b06-e2d0-08de3614e385
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/19/2025 6:14 PM, Shrikanth Hegde wrote:
> Detailed problem statement and some of the implementation choices were 
> discussed earlier[1].
> 
> [1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
> 
> This is likely the version which would be used for LPC2025 discussion on
> this topic. Feel free to provide your suggestion and hoping for a solution
> that works for different architectures and it's use cases.
> 
> All the existing alternatives such as cpu hotplug, creating isolated
> partitions etc break the user affinity. Since number of CPUs to use change
> depending on the steal time, it is not driven by User. Hence it would be
> wrong to break the affinity. This series allows if the task is pinned
> only paravirt CPUs, it will continue running there.

If maintaining task affinity is the only problem that cpusets don't
offer, attached below is a very naive prototype that seems to work in
my case without hitting any obvious splats so far.

Idea is to keep task affinity untouched, but remove the CPUs from
the sched domains.

That way, all the balancing, and wakeups will steer away from these
CPUs automatically but once the CPUs are put back, the balancing will
automatically move tasks back.

I tested this with a bunch of spinners and with partitions and both
seem to work as expected. For real world VM based testing, I pinned 2
6C/12C VMs to a 8C/16T LLC with 1:1 pinning - 2 virtual cores from
either VMs pin to same set of physical cores.

Running 8 groups of perf bench sched messaging on each VM at the same
time gives the following numbers for total runtime:

All CPUs available in the VM:      88.775s & 91.002s  (2 cores overlap)
Only 4 cores available in the VM:  67.365s & 73.015s  (No cores overlap)

Note: The unavailable mask didn't change in my runs. I've noticed a
bit of delay before the load balancer moves the tasks to the CPU
going from unavailable to available - your mileage may vary depending
on the frequency of mask updates.

Following is the diff on top of tip/master:

(Very raw PoC; Only fair tasks are considered for now to push away)

diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
index 2ddb256187b5..7c1cfdd7ffea 100644
--- a/include/linux/cpuset.h
+++ b/include/linux/cpuset.h
@@ -174,6 +174,10 @@ static inline void set_mems_allowed(nodemask_t nodemask)
 }
 
 extern bool cpuset_node_allowed(struct cgroup *cgroup, int nid);
+
+void sched_fair_notify_unavaialable_cpus(struct cpumask *unavailable_mask);
+const struct cpumask *cpuset_unavailable_mask(void);
+bool cpuset_cpu_unavailable(int cpu);
 #else /* !CONFIG_CPUSETS */
 
 static inline bool cpusets_enabled(void) { return false; }
diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
index 337608f408ce..170aba16141e 100644
--- a/kernel/cgroup/cpuset-internal.h
+++ b/kernel/cgroup/cpuset-internal.h
@@ -59,6 +59,7 @@ typedef enum {
 	FILE_EXCLUSIVE_CPULIST,
 	FILE_EFFECTIVE_XCPULIST,
 	FILE_ISOLATED_CPULIST,
+	FILE_UNAVAILABLE_CPULIST,
 	FILE_CPU_EXCLUSIVE,
 	FILE_MEM_EXCLUSIVE,
 	FILE_MEM_HARDWALL,
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 4aaad07b0bd1..22d38f2299c4 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -87,6 +87,19 @@ static cpumask_var_t	isolated_cpus;
 static cpumask_var_t	boot_hk_cpus;
 static bool		have_boot_isolcpus;
 
+/*
+ * CPUs that may be unavailable to run tasks as a result of physical
+ * constraints (vCPU being preempted, pCPU handling interrupt storm).
+ *
+ * Unlike isolated_cpus, the unavailable_cpus are simply excluded from
+ * HK_TYPE_DOMAIN but leave the tasks affinity untouched. These CPUs
+ * should be avoided unless the task has specifically asked to be run
+ * only on these CPUs.
+ */
+static cpumask_var_t	unavailable_cpus;
+static cpumask_var_t	available_tmp_mask;	/* For intermediate operations. */
+static bool 		cpu_turned_unavailable;
+
 /* List of remote partition root children */
 static struct list_head remote_children;
 
@@ -844,6 +857,7 @@ static int generate_sched_domains(cpumask_var_t **domains,
 		}
 		cpumask_and(doms[0], top_cpuset.effective_cpus,
 			    housekeeping_cpumask(HK_TYPE_DOMAIN));
+		cpumask_andnot(doms[0], doms[0], unavailable_cpus);
 
 		goto done;
 	}
@@ -960,11 +974,13 @@ static int generate_sched_domains(cpumask_var_t **domains,
 			 * The top cpuset may contain some boot time isolated
 			 * CPUs that need to be excluded from the sched domain.
 			 */
-			if (csa[i] == &top_cpuset)
+			if (csa[i] == &top_cpuset) {
 				cpumask_and(doms[i], csa[i]->effective_cpus,
 					    housekeeping_cpumask(HK_TYPE_DOMAIN));
-			else
-				cpumask_copy(doms[i], csa[i]->effective_cpus);
+				cpumask_andnot(doms[i], doms[i], unavailable_cpus);
+			 } else {
+				cpumask_andnot(doms[i], csa[i]->effective_cpus, unavailable_cpus);
+			 }
 			if (dattr)
 				dattr[i] = SD_ATTR_INIT;
 		}
@@ -985,6 +1001,7 @@ static int generate_sched_domains(cpumask_var_t **domains,
 				}
 				cpumask_or(dp, dp, csa[j]->effective_cpus);
 				cpumask_and(dp, dp, housekeeping_cpumask(HK_TYPE_DOMAIN));
+				cpumask_andnot(dp, dp, unavailable_cpus);
 				if (dattr)
 					update_domain_attr_tree(dattr + nslot, csa[j]);
 			}
@@ -1418,6 +1435,17 @@ bool cpuset_cpu_is_isolated(int cpu)
 }
 EXPORT_SYMBOL_GPL(cpuset_cpu_is_isolated);
 
+/* Get the set of CPUs marked unavailable. */
+const struct cpumask *cpuset_unavailable_mask(void)
+{
+	return unavailable_cpus;
+}
+
+bool cpuset_cpu_unavailable(int cpu)
+{
+	return  cpumask_test_cpu(cpu, unavailable_cpus);
+}
+
 /**
  * rm_siblings_excl_cpus - Remove exclusive CPUs that are used by sibling cpusets
  * @parent: Parent cpuset containing all siblings
@@ -2612,6 +2640,53 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
 	return 0;
 }
 
+/**
+ * update_exclusive_cpumask - update the exclusive_cpus mask of a cpuset
+ * @cs: the cpuset to consider
+ * @trialcs: trial cpuset
+ * @buf: buffer of cpu numbers written to this cpuset
+ *
+ * The tasks' cpumask will be updated if cs is a valid partition root.
+ */
+static int update_unavailable_cpumask(const char *buf)
+{
+	cpumask_var_t tmp;
+	int retval;
+
+	if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
+		return -ENOMEM;
+
+	retval = cpulist_parse(buf, tmp);
+	if (retval < 0)
+		goto out;
+
+	/* Nothing to do if the CPUs didn't change */
+	if (cpumask_equal(tmp, unavailable_cpus))
+		goto out;
+
+	/* Save the CPUs that went unavailable to push task out. */
+	if (cpumask_andnot(available_tmp_mask, tmp, unavailable_cpus))
+		cpu_turned_unavailable = true;
+
+	cpumask_copy(unavailable_cpus, tmp);
+	cpuset_force_rebuild();
+out:
+	free_cpumask_var(tmp);
+	return retval;
+}
+
+static void cpuset_notify_unavailable_cpus(void)
+{
+	/*
+	 * Prevent being preempted by the stopper if the local CPU
+	 * turned unavailable.
+	 */
+	guard(preempt)();
+
+	sched_fair_notify_unavaialable_cpus(available_tmp_mask);
+	cpu_turned_unavailable = false;
+}
+
 /*
  * Migrate memory region from one set of nodes to another.  This is
  * performed asynchronously as it can be called from process migration path
@@ -3302,11 +3377,16 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
 				    char *buf, size_t nbytes, loff_t off)
 {
 	struct cpuset *cs = css_cs(of_css(of));
+	int file_type = of_cft(of)->private;
 	struct cpuset *trialcs;
 	int retval = -ENODEV;
 
-	/* root is read-only */
-	if (cs == &top_cpuset)
+	/* root is read-only; except for unavailable mask */
+	if (file_type != FILE_UNAVAILABLE_CPULIST && cs == &top_cpuset)
+		return -EACCES;
+
+	/* unavailable mask can be only set on root. */
+	if (file_type == FILE_UNAVAILABLE_CPULIST && cs != &top_cpuset)
 		return -EACCES;
 
 	buf = strstrip(buf);
@@ -3330,6 +3410,9 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
 	case FILE_MEMLIST:
 		retval = update_nodemask(cs, trialcs, buf);
 		break;
+	case FILE_UNAVAILABLE_CPULIST:
+		retval = update_unavailable_cpumask(buf);
+		break;
 	default:
 		retval = -EINVAL;
 		break;
@@ -3338,6 +3421,8 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
 	free_cpuset(trialcs);
 	if (force_sd_rebuild)
 		rebuild_sched_domains_locked();
+	if (cpu_turned_unavailable)
+		cpuset_notify_unavailable_cpus();
 out_unlock:
 	cpuset_full_unlock();
 	if (of_cft(of)->private == FILE_MEMLIST)
@@ -3386,6 +3471,9 @@ int cpuset_common_seq_show(struct seq_file *sf, void *v)
 	case FILE_ISOLATED_CPULIST:
 		seq_printf(sf, "%*pbl\n", cpumask_pr_args(isolated_cpus));
 		break;
+	case FILE_UNAVAILABLE_CPULIST:
+		seq_printf(sf, "%*pbl\n", cpumask_pr_args(unavailable_cpus));
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -3524,6 +3612,15 @@ static struct cftype dfl_files[] = {
 		.flags = CFTYPE_ONLY_ON_ROOT,
 	},
 
+	{
+		.name = "cpus.unavailable",
+		.seq_show = cpuset_common_seq_show,
+		.write = cpuset_write_resmask,
+		.max_write_len = (100U + 6 * NR_CPUS),
+		.private = FILE_UNAVAILABLE_CPULIST,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
+
 	{ }	/* terminate */
 };
 
@@ -3814,6 +3911,8 @@ int __init cpuset_init(void)
 	BUG_ON(!alloc_cpumask_var(&top_cpuset.exclusive_cpus, GFP_KERNEL));
 	BUG_ON(!zalloc_cpumask_var(&subpartitions_cpus, GFP_KERNEL));
 	BUG_ON(!zalloc_cpumask_var(&isolated_cpus, GFP_KERNEL));
+	BUG_ON(!zalloc_cpumask_var(&unavailable_cpus, GFP_KERNEL));
+	BUG_ON(!zalloc_cpumask_var(&available_tmp_mask, GFP_KERNEL));
 
 	cpumask_setall(top_cpuset.cpus_allowed);
 	nodes_setall(top_cpuset.mems_allowed);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ee7dfbf01792..13d0d9587aca 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2396,7 +2396,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 
 	/* Non kernel threads are not allowed during either online or offline. */
 	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+		return (cpu_active(cpu) && !cpuset_cpu_unavailable(cpu));
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -3451,6 +3451,26 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
 			goto out;
 		}
 
+		/*
+		 * Only user threads can be forced out of
+		 * unavaialable CPUs.
+		 */
+		if (p->flags & PF_KTHREAD)
+			goto rude;
+
+		/* Any unavailable CPUs that can run the task? */
+		for_each_cpu(dest_cpu, cpuset_unavailable_mask()) {
+			if (!task_allowed_on_cpu(p, dest_cpu))
+				continue;
+
+			/* Can we hoist this up to goto rude? */
+			if (is_migration_disabled(p))
+				continue;
+
+			if (cpu_active(dest_cpu))
+				goto out;
+		}
+rude:
 		/* No more Mr. Nice Guy. */
 		switch (state) {
 		case cpuset:
@@ -3766,7 +3786,7 @@ bool call_function_single_prep_ipi(int cpu)
  * via sched_ttwu_wakeup() for activation so the wakee incurs the cost
  * of the wakeup instead of the waker.
  */
-static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
+void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 {
 	struct rq *rq = cpu_rq(cpu);
 
@@ -5365,7 +5385,9 @@ void sched_exec(void)
 	int dest_cpu;
 
 	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
-		dest_cpu = p->sched_class->select_task_rq(p, task_cpu(p), WF_EXEC);
+		int wake_flags = WF_EXEC;
+
+		dest_cpu = select_task_rq(p, task_cpu(p), &wake_flags);
 		if (dest_cpu == smp_processor_id())
 			return;
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da46c3164537..e502cccdae64 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12094,6 +12094,61 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	return ld_moved;
 }
 
+static int unavailable_balance_cpu_stop(void *data)
+{
+	struct task_struct *p, *tmp;
+	struct rq *rq = data;
+	int this_cpu = cpu_of(rq);
+
+	guard(rq_lock_irq)(rq);
+
+	list_for_each_entry_safe(p, tmp, &rq->cfs_tasks, se.group_node) {
+		int target_cpu;
+
+		/*
+		 * Bail out if a concurrent change to unavailable_mask turned
+		 * this CPU available.
+		 */
+		rq->unavailable_balance = cpumask_test_cpu(this_cpu, cpuset_unavailable_mask());
+		if (!rq->unavailable_balance)
+			break;
+
+		/* XXX: Does not deal with migration disabled tasks. */
+		target_cpu = cpumask_first_andnot(p->cpus_ptr, cpuset_unavailable_mask());
+		if ((unsigned int)target_cpu < nr_cpumask_bits) {
+			deactivate_task(rq, p, 0);
+			set_task_cpu(p, target_cpu);
+
+			/*
+			 * Switch to move_queued_task() later.
+			 * For PoC send an IPI and be done with it.
+			 */
+			__ttwu_queue_wakelist(p, target_cpu, 0);
+		}
+	}
+
+	rq->unavailable_balance = 0;
+
+	return 0;
+}
+
+void sched_fair_notify_unavaialable_cpus(struct cpumask *unavailable_mask)
+{
+	int cpu, this_cpu = smp_processor_id();
+
+	for_each_cpu_wrap(cpu, unavailable_mask, this_cpu + 1) {
+		struct rq *rq = cpu_rq(cpu);
+
+		/* Balance in progress. Tasks will be pushed out. */
+		if (rq->unavailable_balance)
+			return;
+
+		stop_one_cpu_nowait(cpu, unavailable_balance_cpu_stop,
+				    rq, &rq->unavailable_balance_work);
+		rq->unavailable_balance = 1;
+	}
+}
+
 static inline unsigned long
 get_sd_balance_interval(struct sched_domain *sd, int cpu_busy)
 {
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index cb80666addec..c21ffb128734 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1221,6 +1221,10 @@ struct rq {
 	int			push_cpu;
 	struct cpu_stop_work	active_balance_work;
 
+	/* For pushing out taks from unavailable CPUs. */
+	struct cpu_stop_work	unavailable_balance_work;
+	int			unavailable_balance;
+
 	/* CPU of this runqueue: */
 	int			cpu;
 	int			online;
@@ -2413,6 +2417,8 @@ extern const u32		sched_prio_to_wmult[40];
 
 #define RETRY_TASK		((void *)-1UL)
 
+void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
+
 struct affinity_context {
 	const struct cpumask	*new_mask;
 	struct cpumask		*user_mask;

base-commit: 5e8f8a25efb277ac6f61f553f0c533ff1402bd7c
-- 
Thanks and Regards,
Prateek


