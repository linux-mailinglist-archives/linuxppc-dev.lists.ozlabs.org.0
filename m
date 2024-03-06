Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8638734F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 11:53:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2c8uZed6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqTn2401kz3vpN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 21:53:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2c8uZed6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::601; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqT1538x0z3cRN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 21:18:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdZFAhU/s9wAzoSQMH3qgZx0ZdlgK6tfujoDTwPR1MrvKvqhCp+FihTJBxgpf/sPUkkNJkaBcH7Rf7OMKn+8NHQ3quSF3y+1GENf6vnr54AuCxiRyMRPVwGD16De2hiI+l+CY62993GX1CU2QiLTY/u3VX4+Hjke/MT/S+59VTd5t/Tsb2Ngz/D7+7R/w1d0om4hamRg6xdPzpb7kdih0tQo1cEW23qoAFmBt6Cu4AtZxV3t+Z5lgmrFSCaxIXXyBZcaNeptXXWIF9VFK3akL9uaSG2fvl80iOZihi8dUaFb1N28r8NGWlZLec2HpqKPkswYIsTCwdoIkPlBW2kKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=271HAeafWP9n7OZDlZqDB10ArtHBR7BySMK7MnftyN4=;
 b=DR2/GVm4EsuedIhSGDZH0SkducrmH/hrEDmArF1H3ekfMyts8jmgFA2/+ZXLUZ8xmrgcnumDnZ6CxnOtsS8THWJIerG2FQeUrdspNN9GE1V43rxYIgmsgfy/2cGWIaSwoEEWh+GuNrBvaeB+AWVLU5mrP1U+GlrEbT+5X8DaLsWEF6XPzWrO9y/Nv+AjdIh9DzdcbE0k2b5qhz49xomlIR0f2pMtcniNSoteIeFFI+VFc5fqVWMC8noHUkB9lS3304RXdMCiGGU97QE7RzQyTtHrfrHnkYz33XaR1jp9FCwThBmGfg0Fh8jrf/WIZabfO5WFvlFIpTKLsbcy/QJ3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=271HAeafWP9n7OZDlZqDB10ArtHBR7BySMK7MnftyN4=;
 b=2c8uZed6X40co24R5EwumD14bTnJtnslLSDpC+6Wu9eUWKXvDg2vTWSE4GT6tqP2XzrMrPBM5fGeXOCQKJED2l6sd3fatcqUQkxr/7WKIbhwJkSFu9yB6azocAwgeJmw00gKgnQPXcS6pQZqc4gB36LjDYgst+ehO5z/DjDPlUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2379.namprd12.prod.outlook.com (2603:10b6:907:9::24)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Wed, 6 Mar
 2024 10:18:23 +0000
Received: from MW2PR12MB2379.namprd12.prod.outlook.com
 ([fe80::3150:d50f:7411:e6bb]) by MW2PR12MB2379.namprd12.prod.outlook.com
 ([fe80::3150:d50f:7411:e6bb%5]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 10:18:23 +0000
Message-ID: <bf7b4e37-51cf-50d6-dc8e-626f29b5bdd8@amd.com>
Date: Wed, 6 Mar 2024 15:48:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [RFC PATCH 00/14] Introducing TIF_NOTIFY_IPI flag
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
References: <20240220171457.703-1-kprateek.nayak@amd.com>
 <CAKfTPtBqPVQ5bo8HTZ=sPCUTYr48qtH61A8Z1dwCT434O7cSyQ@mail.gmail.com>
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CAKfTPtBqPVQ5bo8HTZ=sPCUTYr48qtH61A8Z1dwCT434O7cSyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::16) To MW2PR12MB2379.namprd12.prod.outlook.com
 (2603:10b6:907:9::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PR12MB2379:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 404a825b-adf7-4eaf-2334-08dc3dc6c0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JgNXHZzeqgyRXeP6T7vOLSRet2PVzH3+BMYJsAjRNrIhVZ4Ww5kMc0LnEvULhmwpxW0cG8HCAW58pXI0vnRfHXPzZlXL1PjghOf8vCXAcm44EiLi99vzUEbP5Frv+tNQAd0lVMClSGsuoRnlH/eTVjiNJ+YWJWDakjeZIxpyIXAbN2PaFPONYV8jRSvZsirs/S9w/bIDgpfjI9qWDPyraVOQtUFwGWk6SC48z5MEUvJ1kS9ox5FT/HIGRcjNEyX3pnPVEanIMA7l/xqqZJkqAYOglO2k8DkMJXWK2/lSZqI4ibcJchpGSVGcoVQcKiFulvLJhuyG9C4sDXaI5WtIaeBKCMuIod9QNz7sKjUXmHjq+Y3T8XVAwXbLMLeBF2e7H/C7pMnP0QJjFHKdZ23Ucwk9788kxEnpngjam8UZK0XSoNouG9sT33Kxhs6t+wDNNhlYd/cwjAafMDM2seU4xwtArw+z/7YlKpssMLJX+21de9WACozWIVPhnWCAuEs39II4BCrf4fuCLgL7p/HqLqFEHH0V5UkxWPNmo7lXOPd2KEuBTKU9gHEKJP1qIm7KDCaZv07eeWDJFnnpN7b4nlAf1/WfD+xkQqjRQzGxjGlDVfyI0jysX8iAJetpPQ7a
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB2379.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z3FBK1lmZHNCcDlqTFhha3ZjdHVSdzhaLzlqaE9seFJjdHNzeWZVK0RkTGwx?=
 =?utf-8?B?MkdQaFA3NVpXSkN1OGJOeVpwR09wYzNyQi9zRFVMNUtNVjdwTU50YzZrS1Nw?=
 =?utf-8?B?UlYzcytxTDR2QlpJc0hScFM3R0dHcW00c002am0zejF6bFBVWE5rWlZUR3VY?=
 =?utf-8?B?MlE0MHIvZTZ1TisybXR3cnZiV2xsRlcvWS9IN2gyaCtyc296cHMrUEM4c21F?=
 =?utf-8?B?OFpLdHpZVzlpcDlvTmRrUkhkN01ncmg0Nmh1NFQzdGVvUWhtd0NFYjBZS0Fw?=
 =?utf-8?B?SStyVHpMbXlNUjFyZDNrUmtvU3RWRXFSTk1ISlYvSHFqZVZuejBPK2N1anRW?=
 =?utf-8?B?eVA0d3dpaERLY2NyZWVERlppZTFEMElEQTBBSUtFb2dCSzBtV0J5dmgxZ05S?=
 =?utf-8?B?S2ZBaVFPSzhKTkJhRllRSjdzc2s2bDBrSGMyMkFILy9iZkRGeE1VWDRnU2RV?=
 =?utf-8?B?VEkrNm8velBPblFOV25XajFjUGsreXQxYWZ2b1Rza3RtK3E3SzNtSlM3Zks3?=
 =?utf-8?B?SjdFY3M1Z0lEL3pXbkxhOERtazV0TWcxYmhGVVl2aXE3YW81WlcybkhGNk95?=
 =?utf-8?B?YzVKUS8xK05UbHRnNDRxN2I2QzZTVWlmTkJmeEl1dnJZYmpMMmhVSWlQbHJk?=
 =?utf-8?B?dXB4RFdYQlZNRzdiWWFsdThBSWVteTFhYVB5L040RzcwZnNMTWo0YmJiR0FP?=
 =?utf-8?B?UHc2TlhhT3QzVUhHVVR6Rml4bnE2QWpBcjZINjdLeDhFdzA2TjNpVWV3RXJl?=
 =?utf-8?B?eE5jb0p3YXByTkpaL3NaenhhSG1EbDc5Q1JlZXN5S2crMDFUS1lEWmMwdmV0?=
 =?utf-8?B?Tjd0dGlFd3dxc0x4czdJU3NKSTA0Z3NKZmxwSncxeDBuYmhmcFEzRVU5eUZz?=
 =?utf-8?B?bHh3WmZDQ3FJd3RpMnE5TVh2Ri9rcVBpWStSUFQ5Ti93ajdSb2F0WjdEUWpi?=
 =?utf-8?B?M2NmQnRwekRzRXlaY2gwRWdtMEN5eXNIOVgrTDZxMVlSRlJqaERxbW40R3ov?=
 =?utf-8?B?QXFML2lMVVRTN3NoVk1RZFdYSTJDT3pXRlI3eG12djIvS3hXczh0L1JZcWor?=
 =?utf-8?B?Rm9zZ0dhcFlndHVyL3VEWU1VNHhScmZsRUFEL2JJSHZTN0ovREdVWkFKdE1i?=
 =?utf-8?B?WHd2Z29VQkFoVFJuNlVDS28wMXhadTBObkNqK1JUNnRFWDZxcHE4Wm1NU0Jh?=
 =?utf-8?B?aUh6dkdmUXpGR01neVp1SDFvVVQrZVBUbUdkZkxYS25PMVlheE1FekhIVENp?=
 =?utf-8?B?Mzk4RWF4bVA1aFNoQmNydVlQRTFmenRZMTMvbzRYVnRjWDd4QUlaTjlaRGtx?=
 =?utf-8?B?RUVGbG5ESHRYeVhTVkw0VE1GQ3RwUzFSaEYvQ3BCbTBmRVV0S3VwdXArcTdr?=
 =?utf-8?B?TGNxbU55dysvQmZ4ejZ3MEc0ZncvUmsyWnpNNnBFVWpKTDVSclh0WTBKYWdG?=
 =?utf-8?B?cEVITC81bFpyaW5MMkxsajdZRTJtSlExSHVURHhzTDdqLzluRW96NmNZaHVo?=
 =?utf-8?B?RzVDOUZFa3c2dlY4TFVTV3BOaEVpVUVTUDJySmcrTFhadTViZkxzVnZERGdM?=
 =?utf-8?B?ZWNxWElxNWVYd1NDbUpCV2tYUG14SWI0dG1VcGVmQmticDRDblhvZVVRK2RE?=
 =?utf-8?B?cWdqYnByeXVTYlBrTTJTQXRleTI4dnhEaHpUZSthbStzSWU0ckNYK0xYdVpv?=
 =?utf-8?B?dTAwRERodWpGZlY2UzNqWW1LejdpTVhyRFBCQ0FUQjJaUy9seUc5RCtrLzgw?=
 =?utf-8?B?bENaVCtOV285cGRFakkxVXR1NlRrWUVXZFlUbWdQaFZpbXNzTHk3VjNWcGMr?=
 =?utf-8?B?YjMwZmlBYkFSb0NuUmdxSVhFa1BJckJPWWNwR2w4cGREaHBzZFkzVFo5NENH?=
 =?utf-8?B?NDloSTkrR3BlbXpINzhyc0plR2hNOWg0bUVvdllQL1RlMUlSV3VXWlZobC9i?=
 =?utf-8?B?SERwNEI3dmVaaXErREFWL2tXcU9XZjJyYnhHNE9zN2FqbVlsamRmdUdzQktL?=
 =?utf-8?B?NUlsbll3bUNkY1JvSU4zcTBJRnVqRGV0RjZSTDJkQUFBWFZYM3I5TVVTaTBo?=
 =?utf-8?B?ZzVYeGtLTmVoZmUvcHNMdEJxQXA1MHVDcDlnUi9Qamg0N2NhYm5tbXBFcTZL?=
 =?utf-8?Q?GSYAXrRfmKXHExTDyYI5tZPko?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404a825b-adf7-4eaf-2334-08dc3dc6c0e3
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:18:23.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+MbiJnl6k0arshKYqL5YUo5amx69vThIYAgOi+z6rR54wa3qW1yFPzYt4Jch8A+HpehTn+GiXM8swO87ahncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146
X-Mailman-Approved-At: Wed, 06 Mar 2024 21:48:53 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tony Battersby <tonyb@cybernetics.com>, Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Brian Gerst <brgerst@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-csky@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-
 alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Vincent,

Thank you for taking a look at the series.

On 3/6/2024 3:29 PM, Vincent Guittot wrote:
> Hi Prateek,
> 
> Adding Julia who could be interested in this patchset. Your patchset
> should trigger idle load balance instead of newly idle load balance
> now when the polling is used. This was one reason for not migrating
> task in idle CPU

Thank you.

> 
> On Tue, 20 Feb 2024 at 18:15, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>>
>> Hello everyone,
>>
>> [..snip..]
>>
>>
>> Skipping newidle_balance()
>> ==========================
>>
>> In an earlier attempt to solve the challenge of the long IRQ disabled
>> section, newidle_balance() was skipped when a CPU waking up from idle
>> was found to have no runnable tasks, and was transitioning back to
>> idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
>> may be viable for CPUs that are idling with tick enabled, where the
>> newidle_balance() has the opportunity to pull tasks onto the idle CPU.
>>
>> Vincent [5] pointed out a case where the idle load kick will fail to
>> run on an idle CPU since the IPI handler launching the ILB will check
>> for need_resched(). In such cases, the idle CPU relies on
>> newidle_balance() to pull tasks towards itself.
> 
> Calling newidle_balance() instead of the normal idle load balance
> prevents the CPU to pull tasks from other groups

Thank you for the correction.

> 
>>
>> Using an alternate flag instead of NEED_RESCHED to indicate a pending
>> IPI was suggested as the correct approach to solve this problem on the
>> same thread.
>>
>>
>> Proposed solution: TIF_NOTIFY_IPI
>> =================================
>>
>> Instead of reusing TIF_NEED_RESCHED bit to pull an TIF_POLLING CPU out
>> of idle, TIF_NOTIFY_IPI is a newly introduced flag that
>> call_function_single_prep_ipi() sets on a target TIF_POLLING CPU to
>> indicate a pending IPI, which the idle CPU promises to process soon.
>>
>> On architectures that do not support the TIF_NOTIFY_IPI flag (this
>> series only adds support for x86 and ARM processors for now),
> 
> I'm surprised that you are mentioning ARM processors because they
> don't use TIF_POLLING.

Yup I just realised that after Linus Walleij pointed it out on the
thread.

> 
>> call_function_single_prep_ipi() will fallback to setting
>> TIF_NEED_RESCHED bit to pull the TIF_POLLING CPU out of idle.
>>
>> Since the pending IPI handlers are processed before the call to
>> schedule_idle() in do_idle(), schedule_idle() will only be called if the
>> IPI handler have woken / migrated a new task on the idle CPU and has set
>> TIF_NEED_RESCHED bit to indicate the same. This avoids running into the
>> long IRQ disabled section in schedule_idle() unnecessarily, and any
>> need_resched() check within a call function will accurately notify if a
>> task is waiting for CPU time on the CPU handling the IPI.
>>
>> Following is the crude visualization of how the situation changes with
>> the newly introduced TIF_NOTIFY_IPI flag:
>> --
>> CPU0                                                    CPU1
>> ====                                                    ====
>>                                                         do_idle() {
>>                                                                 __current_set_polling();
>>                                                                 ...
>>                                                                 monitor(addr);
>>                                                                 if (!need_resched_or_ipi())
>>                                                                         mwait() {
>>                                                                         /* Waiting */
>> smp_call_function_single(CPU1, func, wait = 1) {                                ...
>>         ...                                                                     ...
>>         set_nr_if_polling(CPU1) {                                               ...
>>                 /* Realizes CPU1 is polling */                                  ...
>>                 try_cmpxchg(addr,                                               ...
>>                             &val,                                               ...
>>                             val | _TIF_NOTIFY_IPI);                             ...
>>         } /* Does not send an IPI */                                            ...
>>         ...                                                             } /* mwait exit due to write at addr */
>>         csd_lock_wait() {                                       ...
>>         /* Waiting */                                           preempt_fold_need_resched(); /* fold if NEED_RESCHED */
>>                 ...                                             __current_clr_polling();
>>                 ...                                             flush_smp_call_function_queue() {
>>                 ...                                                     func(); /* Will set NEED_RESCHED if sched_ttwu_pending() */
>>         } /* End of wait */                                     }
>> }                                                               if (need_resched()) {
>>                                                                         schedule_idle();
>> smp_call_function_single(CPU1, func, wait = 1) {                }
>>         ...                                                     ... /* IRQs remain enabled */
>>         arch_send_call_function_single_ipi(CPU1); ----------->  /* Processes the IPI */
>> --
>>
>> Results
>> =======
>>
>> With the TIF_NOTIFY_IPI, the time taken to complete a fixed set of IPIs
>> using ipistorm improves drastically. Following are the numbers from the
>> same dual socket 3rd Generation EPYC system (2 x 64C/128T) (boost on,
>> C2 disabled) running ipistorm between CPU8 and CPU16:
>>
>> cmdline: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1
>>
>>   ==================================================================
>>   Test          : ipistorm (modified)
>>   Units         : Normalized runtime
>>   Interpretation: Lower is better
>>   Statistic     : AMean
>>   ==================================================================
>>   kernel:                               time [pct imp]
>>   tip:sched/core                        1.00 [0.00]
>>   tip:sched/core + revert               0.81 [19.36]
>>   tip:sched/core + TIF_NOTIFY_IPI       0.20 [80.99]
>>
>> Same experiment was repeated on an dual socket ARM server (2 x 64C)
>> which too saw a significant improvement in the ipistorm performance:
> 
> Could you share more details about this ARM server ? Could it be an Arm64 one ?
> I was not expecting any change for arm/arm64 which are not using TIF_POLLING

I looked at the lscpu output and it said It was an "aarch64" server with
model name "Neoverse-N1". Let me go back and test it once again just to
be sure I did not catch a one off behavior (Might be a while since I
have limited access to this machine) I'll also add a debug
WARN_ON_ONCE() to see if "TIF_NOTIF_IPI" is being set.

> 
> 
>>
>>   ==================================================================
>>   Test          : ipistorm (modified)
>>   Units         : Normalized runtime
>>   Interpretation: Lower is better
>>   Statistic     : AMean
>>   ==================================================================
>>   kernel:                               time [pct imp]
>>   tip:sched/core                        1.00 [0.00]
>>   tip:sched/core + TIF_NOTIFY_IPI       0.41 [59.29]
>>
>> netperf and tbench results with the patch match the results on tip on
>> the dual socket 3rd Generation AMD system (2 x 64C/128T). Additionally,
>> hackbench, stream, and schbench too were tested, with results from the
>> patched kernel matching that of the tip.
>>
>>
>> Future Work
>> ===========
>>
>> Evaluate impact of newidle_balance() when scheduler tick hits an idle
>> CPU. The call to newidle_balance() will be skipped with the
> 
> But it should call the normal idle load balance instead

Yup, but the frequency of normal idle balance will be lower than the
frequency at which a newidle balance is being triggered currently if
tick is not disabled right? Please correct me if I'm wrong. 

> 
>> TIF_NOTIFY_IPI solution similar to [2]. Counter argument for the case is
>> that if the idle state did not set the TIF_POLLING bit, the idle CPU
>> would not have called schedule_idle() unless the IPI handler set the
>> NEED_RESCHED bit.
>>
>>
>> Links
>> =====
>>
>> [1] https://github.com/antonblanchard/ipistorm
>> [2] https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/
>> [3] https://lore.kernel.org/lkml/b4f5ac150685456cf45a342e3bb1f28cdd557a53.camel@linux.intel.com/
>> [4] https://lore.kernel.org/lkml/20240123211756.GA221793@maniforge/
>> [5] https://lore.kernel.org/lkml/CAKfTPtC446Lo9CATPp7PExdkLhHQFoBuY-JMGC7agOHY4hs-Pw@mail.gmail.com/
>>
>> This series is based on tip:sched/core at tag "sched-core-2024-01-08".
>> [..snip..]
>>
 
--
Thanks and Regards,
Prateek
