Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA03600AE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 11:35:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrX0h2tDsz3dw3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 20:35:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lZk5wcN2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.93.81; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lZk5wcN2;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrWzJ75bMz3dqs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 20:34:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAgnlszN5bKhiZ8P6JU3QNFZQX5c0i0qOfnEnxgpw4YdAgErGwc970kqZYUNFQs7NAs64JQkFq5hu5xWO33FafGOmpl3ZlYNaqcgjDz6mmLKeky2o67YnXcnt6AhR69urAieIlCLHGxsfqn0kRNXpObm9h++ZCHZnz00p3dOSSGjaemrD8go6Xop0YTzhZ+dDj4zqXAD8aZ5gCvknwMHN82n8ILOINMCSt9gknk1EiswO9hB3V4cAhUaxe+26n1tafbmy+sh/QQRZBVawvrgXwFJsjXF0pghRm/3Y1zYW1nPAiPaIcyTMqBNybnxHoRrDkm9ttiB6q2V6C3VcXtbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3slT9n4TJMosgL2QDibjz7yhbX19zkvAS5TjtlhnEA=;
 b=DKNSGMrwxkuH/3Zw2tw3ZvyO+mFgIPUpdcY03gY0IdgjJHQqoA3wn6Jm635M4Ub5zWx8cS6cQDaOjyLYYbS5Nf58X6vxO02fH99zOAciq1pVTCktucpAYFkBv3ereaGfBs11F1/nMojcRDj/ClCQOAHBFfK+qeG6YM0vbuGVR48JcJtLd9QLsSo18yrGwzQMW7cQBDvvBBB0cWSlLWJsmkjIE/ojX4TNDfRDzXgiPED8GYKonQDB1l8xd5kjx5KXZpqxpP///LG6n+pCgFiD+7R5PMTzh01xdIj41VMJKTlWTclGhEAXcIy/vB3fixEIlonGGINtcGtT0mnHwH1CYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3slT9n4TJMosgL2QDibjz7yhbX19zkvAS5TjtlhnEA=;
 b=lZk5wcN290tTLdsvyDRf6FJUs1l2D2kYGdhPfqVIQBN04aR8rEjBzqPd8N20gkYLGNIKUWfn99eiUsiZbnc5LUR/Fx9kcnyJHWG7Plc5u8oHs6teAtpTvr85YdnkM31S41toSVNIw6mRFAhLm/AQ3yPe6+EqQsMcsb9r+F8N4zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:33:58 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::fa1e:a29e:2f2c:43d1]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::fa1e:a29e:2f2c:43d1%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 09:33:58 +0000
Message-ID: <3945912b-580b-d1bc-35f8-9debdffe9b15@amd.com>
Date: Mon, 17 Oct 2022 15:03:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20221008062424.313-1-ravi.bangoria@amd.com>
 <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
 <ba47d079-6d97-0412-69a0-fa15999b5024@amd.com>
 <Y0V3kOWInrvCvVtk@hirez.programming.kicks-ass.net>
 <Y0WsRItHmfI5uaq3@hirez.programming.kicks-ass.net>
 <174fb540-ec18-eeca-191d-c02e1f1005d2@amd.com>
 <Y0awHa8oS5yal5M9@hirez.programming.kicks-ass.net>
 <Y0cn1xazYpNmqhRo@hirez.programming.kicks-ass.net>
 <99caec5f-dcdf-70c6-8909-11552ce42a20@amd.com>
 <Y0fvpQEEl/tK6mJ5@hirez.programming.kicks-ass.net>
 <0df72f8e-1c17-2140-c841-5a75fb43db14@amd.com>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <0df72f8e-1c17-2140-c841-5a75fb43db14@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::7) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5a9fa4-4d3a-4216-b185-08dab022b72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YOm+Rao2MjGPzP8u4zaBX8vVTD52mbVCe/P1xwsHzL5cyFxB6xiKJe9+kHNxKPG7RaHXmMom+Z2xsfbYZuoz6DEXYDTKWoYOjbydMrnWyyYSWVTmbMG+BPUzMPcXiQcv690/lh6/Hm7RFr8iAkTcMaHfaOjv+IcRPtDbgaw4tzY696RPSrX9b5KcUj4K40ysRxVdvRufnFomIziAIjJ+ouFw9+KUwwoVIBBennHOUBHSHDcprDD7WHDmArtlZYk9a+bFP7/tr0U8nwWJzjBdbgScjF0xzF8iIu7lhV98+L4W7vWC5umyPyLur66vyJTtu0XyxmO0FRSklW4S7pqiZLewbXAoXtcLC8tcNFA4SKyQOrQ+SFAxchKyfv2VaN+Y8X20WLlW7uR78ewHpESxKZ5+G5e4UjqFFHrVpMVhoLbzoOh+wXTMdDtRNepuekTaszrCEMe0A4VjTSHJDO38sPHTDvgQz8h4NKLYKTnvPhaaWekFZE/IqVzqDT2keHRstEOsoiuKU6biMSC9eNCvdpWZ8WVUDPeUTKBzrIkGp+HT8MQ3dXOqUpQGvsU6HaifdfwGD6iqlJcbuuJ0/QrutL/XKIYZq9EqgulC4vM9PFZ+Kwy1fOCvrr4aSUcWDvI78XdkmY+h06A6k7Zo0XH3XDvaYRwOQzV6N87q30Os5UHtMrS4QqTUPRR7NYER9W+hosvPd2ULw9NELfp7rF1ZCNSYwII129aq5HniZ/SBDdVeQKWKqE+xS5/+0zBlZ5jhXRZBUljGW7XIO2IUAjjw0iOjyG6JwWXhe3JrRiEHTibkX/h3nfP0M+Lgj7nvZDX5RthqMNKY1UGGnfLBJ1r4hbu9tBr5iJdjiOmLo3E2RGD40e/I4BS3hbh8eT2P7MVC
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(41300700001)(26005)(6666004)(6512007)(2616005)(186003)(478600001)(44832011)(4744005)(2906002)(6506007)(36756003)(7416002)(53546011)(5660300002)(8936002)(31696002)(86362001)(38100700002)(316002)(6916009)(966005)(6486002)(8676002)(4326008)(66476007)(66946007)(66556008)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Y1ZDUUdlRGJ3L2F3a2kxMkhraG8yV2doV1VmcWlacy9ETGhLVnNnLzVUZ1N0?=
 =?utf-8?B?d05mV2RSak91V1dndUU2R3pIM09SY29WUk1YMDkrc1pHZmxZSFA0Y1VJWmhJ?=
 =?utf-8?B?YnBaOHBUZ214UXZxUHdJdVY4S2lZSUxRSnVLbU4vOHJQK3g0eGFEd2ZOelEw?=
 =?utf-8?B?S0tNUERQZm84UHJFTEQyWU9zR3g1RjVnbFRQM055aksyQ0hNbXIxNDg4a3VR?=
 =?utf-8?B?QTBxblUrc1kyTXNtb0xiVzBlZUZkVmhMdnI4M3dYMzRpZGF1WnZlZS9yK3pW?=
 =?utf-8?B?Z2JHTTQwd1NTSXFybUwwQ295eXJ2WlI5ZVd4VUt5ZG53QTFhKzdyNEI2L1BR?=
 =?utf-8?B?d2JWd0JKNzBObzFmODlSVXNxTVRpOUszOWhnM0VnRDFiK3h1ZERJaGJ6aE91?=
 =?utf-8?B?Y1FqN01rZk9uV2NNR0YxbEhMTTFDRGg3eFVSMFd5SWZ2dGpuNnlIL254UnRL?=
 =?utf-8?B?U2JQRzJ5ZTFjbDcrNHBBTEZPcDVaazdFOHNUVW5RTHQyd2tET3hBYUgxclF2?=
 =?utf-8?B?RkI1dWZjQWR6VzlpeHJETnNjc2FaTGk1ejcvQ2RsRi9pOWhyeTFXZkxSa2h3?=
 =?utf-8?B?MSt0U2FZWW55R3BSRDRSVEp5UVYzWlJDbGRFRzhoekNmVXFQQmlTbjJxUEVB?=
 =?utf-8?B?czZCaCtHUmtQYi96VWhwd2l5NnEwcWcvMFZET3FFbitST2hWNUJtSkJqd2Q1?=
 =?utf-8?B?dUVXbVpGbUlzSktDRTJZaUJjRkJ2NXlQTWdrWGJDdHBrZ05pRHJScGtRd2Fz?=
 =?utf-8?B?THdnLzJ3UXNkMlBSYm5TVzMwcXUzOGphYXJBWkFEWTFzS2V4dXFGS0V4R0I0?=
 =?utf-8?B?Mm1FTFBDOFNBSkVrWmZnRWZZdmhzeERFQjhMSWhzOXVyVGczU2svd2syWm03?=
 =?utf-8?B?YWo3OGNndFN2K3dhZ2JuTCtaNXMyVHpySXBaZ2xwUXVKaUhSa2NVSnUybVd3?=
 =?utf-8?B?MmRaZmpqeG9hNm9idEY3OGxkaU1mdXZFbHBMKzlNY1liVXlRN0Q3c0xkWFBk?=
 =?utf-8?B?WG9FRmg3RVJDT0RvWWl4UGNicHdkQlI0Mlp1aWtPRGhGblpwL1daVjMwQnll?=
 =?utf-8?B?OWhheHhKN2ZJK2hDdXd2M05mUlh1SzJjYXdwTnE4S3E2UGNSV0xxTTRxcDI4?=
 =?utf-8?B?V2V1Y2M0WklUa0dIcU9wNExFenV2SDE3Sit2c1R2VXFOUzVuNEhjVm13bEs0?=
 =?utf-8?B?d3hZMGRnQzhHWTlHQno4YkI3Q0lxTmxkUHArcksxaEV0QzQ1ZWxsKzJUa0Rx?=
 =?utf-8?B?K2hGSmpJOHkrcjZjOXdLVFVBZUdIYlFkNFdWYWNpeHZzbjZ2ZzJaRVZLOEdx?=
 =?utf-8?B?V0NJaTVmQjl5ZHhvQjE2cXV3V2VmdCtTTGRlekN2bVJMblpvSTl1NERIMk1W?=
 =?utf-8?B?UlRjb2lYOWt2Q3QxYVVoV2V0K0F0eHJKR2VvWGVCTnZxV294VHl1QmZqWWpE?=
 =?utf-8?B?VUFLcVkyR0RrVGVGd1laMGE4MUV6ZFMvM0VJejBOaUNKemUvcWhPVitHOTRi?=
 =?utf-8?B?RDhjcUU3b2V3SzNDTDNkbU1DVzRoTkdKc1hReWk5ZVQ0dUxDMjUzK1ZqWEdT?=
 =?utf-8?B?ZlVHT1ZhNjdjd090bWFHUTc5RGorTVNIczg4U2ZwTWMzblhHZlc0V2VLcWZz?=
 =?utf-8?B?dmFYTStTdXJIM2ZmQVlDVmdjVUpMd1JENllNNkREeExTZU03cEF2c2Y0VWg1?=
 =?utf-8?B?eFN2c2RIWSs2SHluNXFsTTdoVmszYWR1UlhSQXFISjRZNTZjTE9mRm1XOXk3?=
 =?utf-8?B?dkVhUXUreU1tenl2WjJmSkZsSVdYSU1iRk5RMkxlSE9WWWJlbVl0OEY3L0Zh?=
 =?utf-8?B?SWRuTnZLeHpJMTl1RkczZGZNbUd4eEFRdW5LdEwxODk5Z1FUVHhxNlQ4eEps?=
 =?utf-8?B?Skt4R0plYm0rV3NKK2RJekcrUWt3UzZPdW5NcmVuQlpnUkNPVDI3RmFFS29r?=
 =?utf-8?B?alFVMXhuRTJSdEJzZEFQaGoxcm1aM2ZmV05oM1Y2Z2FxWjhkSlFBc01WWXJo?=
 =?utf-8?B?Ymk4eHh1UDdCNWtSM1YrNWZlUDRQWDBJR1E5cVFUYlBGb1o0REZFNm5qckFF?=
 =?utf-8?B?VzhtODIvY0JiNGtBNk02L2lpUFBSd0hLSUQvVGZmbERGY1VtcjR6V2tkSGkv?=
 =?utf-8?Q?q2T7RXnQBpey3i4JO/auocKMs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5a9fa4-4d3a-4216-b185-08dab022b72f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:33:57.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqrOadQ/ERuX0ziUPpBecZhIWcmUWB+xS7Z445zTnX/NnpM/JgQPlZkoxMlmh+XQXPCYT5i1/8WIjezTovvoFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, srw@sladewatkins.net, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14-Oct-22 3:26 PM, Ravi Bangoria wrote:
> On 13-Oct-22 4:29 PM, Peter Zijlstra wrote:
>> On Thu, Oct 13, 2022 at 03:37:23PM +0530, Ravi Bangoria wrote:
>>
>>>> -	refcount_t			refcount;
>>>> +	refcount_t			refcount; /* event <-> ctx */
>>>
>>> Ok. We need to remove all those // XXX get/put_ctx() from code
>>> which we added to make refcount a pmu_ctx <-> ctx.
>>
>> Them already gone :-) I've not yet fixed up the typoes, but current
>> version should be here:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=perf/core
>>
>> Thanks!
> 
> I've been running perf-fuzzer on Xeon machine since yesterday and I don't see any
> issue. Will do the same on my AMD machine as well over the weekend.

Only one WARN_ON() hit. Otherwise all good.
https://lore.kernel.org/lkml/8d91528b-e830-6ad0-8a92-621ce9f944ca@amd.com

Thanks,
Ravi
