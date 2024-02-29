Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A386BF84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:37:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QJVh8MXs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlcNm74czz3vXw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QJVh8MXs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlcN211jfz3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:36:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INn9TVpYzRjjPcBG+NyM7R6jq4XRC6gwB1I5ZGL4spBA8RNpYDtQc6SA50Xby8ROg2oZGY6pWgGOX0j5NaPxok7A08i46eWYXaSN6k3FqXLEvryljzLYU9AtJY4vY7H+qtuneE4dW5aAR5aRo1dqzQu18Drfb3EOWgWlTejCmOTGErzuEjTjJ4QUa1NF1UjrgeWCrAcGvYz3S+24CPxx+h+NRf3DIh9yEkvJJFnz5XV7BxDxIYlTHBYrrUgIP0h0c369Ms868IWmEJuqUCPPHdJwjn/KxHPlnwNBcYOrgSt/ZGUZYuw1T2vngKzZ+5U30Hid0hKgdtOJJ3b8xeKFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVKELm0svmed5Q2fQ+aTFh3AoUo0NACKlnkaBecJiiI=;
 b=FVk5P8lKmqhqHq1YWhV2IYyFoPsryZuEoo+J/FCCRhS45M/EvBtdvU9v4jK7RxBXvQeFMtlHEQJoHAU5Mev7f2rqwm+GmTAU7QqMo785D8Sh6rmi/wXQ4vrKYX2ZGponurT+NAuGegdq3OKtlTwuMd5vl+btc4KbntNRrpykE9EnLQeTH+BfEU1Wm8ZtXl6yzP/PVh32uYbOl/lySwlruJU8ZyY6aIMvAgYtmOjLadLIFdEd9yxYhHfDE/Pb+n3CFfeew+6kHcBugpdpO8frcoWndHE6x9nZgGb2WdDpEmoeqJf0buCrXmguzZKgN7URRSfY6khoBFwYaUH/sxpQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVKELm0svmed5Q2fQ+aTFh3AoUo0NACKlnkaBecJiiI=;
 b=QJVh8MXsRn6eLaTVuOEVDBG4bC9AfkYeV0A6siKrf65q6bgWlqimka+UkdZhDpB+DSkNKpUHx740ArCQGZePrU9gmkBmSNvhugetMIY/QENddH83Jje7oNQVnpquuCiytZqVwOKJmdUqI9CmmTK14U45wXHTfaedEzw7gThazIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2379.namprd12.prod.outlook.com (2603:10b6:907:9::24)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 03:36:27 +0000
Received: from MW2PR12MB2379.namprd12.prod.outlook.com
 ([fe80::3150:d50f:7411:e6bb]) by MW2PR12MB2379.namprd12.prod.outlook.com
 ([fe80::3150:d50f:7411:e6bb%4]) with mapi id 15.20.7316.037; Thu, 29 Feb 2024
 03:36:27 +0000
Message-ID: <fe8462ae-9144-6925-1679-a5079e5b0556@amd.com>
Date: Thu, 29 Feb 2024 09:06:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
Content-Language: en-US
To: Tobias Huschle <huschle@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20240228161018.14253-1-huschle@linux.ibm.com>
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20240228161018.14253-1-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::18) To MW2PR12MB2379.namprd12.prod.outlook.com
 (2603:10b6:907:9::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PR12MB2379:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 524c8ea6-0f7c-41bd-bc93-08dc38d79c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kXLw7ySy6EqNCvRS8RfIJD2j8M7x7VgpI8R+xzJ0cJlKWUd0SrhtGMI3yVk3sMU58gqUQR6+qvitVIzCSUHVGGhKsPQSmvUp//6qsK21z83lHGA7bctN+bG4hiFPDdhH5zJMBjxBCGQjcLX/trJIyYLlsUlhJ1lPsNAf57QDNGOpRceYfFAAlEXN333ktRfO0PgqPTuo31mNPZItBpWEbA+ao1RSQjEgqEybJhZ4uMS+igtJY3hA6jj0XcMPHPVb7Z/Imc7CF4IQa3ayIjzAhraJvarVz0j6WYHmmXwQj8LoyK3AhqKXSA4G+xpKnGaTtiqsYJvlEKQVcKJSpLHoiW+sjxGpr+lO+UhhqXZ5goTNLzsvD1WoQowkum0NPLBWKfwpq0FsyCBAGi5ZDWtM75uYXscd00/2jGQMaW2jB0rbn8kpU1ttyeOtH8q0L9ew/Xke/hpCZz78Du3hnePCJRJuHvDSi7Qpgv5wmBxd2OaCT6OLD6bdQFyC0dVUYCD1ddTW6cSVMTkMGCN+WqXmYd+MVx8hfx9y57WTaPUJZN7gb4OXfQKrfu6cjME8URPjr5YQ0VneVLLDQUXE7UHhxN98lKomx5Gw6ei6CtvkqhcP5nW/Wo23XjRi+6oZA/7Z
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB2379.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z1JRbmk3RUUvYzdOZU1yYzMzNXd4KzFrS2hua05HcEhBNWRLWmdabjB2M3po?=
 =?utf-8?B?OFpOaVB1OElNT2ducGFmODdUcy9KbkQ2NjNDelVLdWF6c3pBOFJsNVFmWkVL?=
 =?utf-8?B?R3J6TGt5MVNtZFRYUzhFTDYvaW1uaFdOR2hiQzBwV1hPV0g5cGI1TG0rM3BJ?=
 =?utf-8?B?WGcwMStPKzYzRVNqVVloOGorOHVFWS91c00yUXRjYW9QSkpGLytoemJOS3lE?=
 =?utf-8?B?dDQ1cWdnR3NOUVdiZ1psc3l6M3FWSTdnRGF5TmtldWxudmgvUWdtL25LVWxa?=
 =?utf-8?B?TzVka1NQZlNEM0RrOWR5RU16d2dXcmM3SnduUFlYRkNhd0xHL0JCenBGQWZF?=
 =?utf-8?B?SFUrNlRMQXA1ZUtqZHN0YTg3TDlHbFlhUjVHY2dIQzRUVTJrQnovUENpalBW?=
 =?utf-8?B?SkJaV0lrZGZrQ2cxRVpIczlJTzAveXlCdk1yRjNpemU0Q083aDZuMmMyRkM5?=
 =?utf-8?B?NXEvbldVdi9BcEtnWEZGa3dZSWNOMDY3ZDZMYzd5OXFyM3FGZWRjSDNhc2M4?=
 =?utf-8?B?TFd5VlBFdVZCVGpUWXlZamRmUERjVXo0RVk4cjhvT1JONVlBVVI2Y1NpS2px?=
 =?utf-8?B?NENkZWtGY3M5aUEvUEk3VS9uR2s4cWJqYzlrU2pTOENiQk9aMVJTWEtXQmdY?=
 =?utf-8?B?cHhJTGo3ODJURU5qRjl6eVRDL24vU0NmRVNjL1V5WGErN1UvV3JKS3AzZzMr?=
 =?utf-8?B?VlJQMk9ITTZXMmdUKzR3ZTkwSS82bVFMNGZCQ0JIZHlTOWRSdEJZSngwSHJu?=
 =?utf-8?B?aGZJcFhUY2Y0TWZFYUEyN2pvdkRJRkRtU2pMeFh1aDRNMXhBS28xRnhtM0pQ?=
 =?utf-8?B?a0hhcmhGNGNkSDBUMzBjZnEzWUhSOTlhLy9SRDhrcFFOS2ltcFBlbDNXeDdq?=
 =?utf-8?B?ME5qR05wWjczTm9kQmp6UzhDTUFoY3NwTHcyTnZhWm01TWdYamI4ZXJ4Vzkx?=
 =?utf-8?B?dnpDOWgzc2lEbHJtQUtkeldpalgyV3JuYmdKWjdjMzNmTmRCcnNaNnY5c2Ux?=
 =?utf-8?B?OGc5SGdRaHVPbmt5OXdYWXFqdTFtOUFLUEhYZkJWTlpsNEVHVzc2RzBiVnhi?=
 =?utf-8?B?d082MGYyQWh6TzJYa2hURnZUQkIvb1Y2N3dZZVZQNHBEVTVXYzlXUlBhK1Ay?=
 =?utf-8?B?S01sVnA5VCsvUFZDSVB4Yjh1RFcyZDUyaHZ5SkJ6OERFRTkzY3orTTEvV0VE?=
 =?utf-8?B?L0xNL2xOMkdaKzE0SDJFVDc0K1M0WmJMb2QyZGxnUWhna1BVRnhWT2xwNitw?=
 =?utf-8?B?TzZlaWJYYmNVRkhId2JlQUZ6QWFtS1p2clp1SW5JWkZaNy9FbEg0MFNSb3Z0?=
 =?utf-8?B?UU9MaitRSTRBM0tKRTkwaUVHR2ZnZTFhWHhMTkZnMEloM25aV2xtU1lsM01k?=
 =?utf-8?B?VEtaWXdKUlFjR3JIWDE1Z3Q3QXc2NGh2ZXJjQ041dDF4Q2JIYTZuK0plcGNW?=
 =?utf-8?B?aVBSR2lLUExrQkVIVU5VTmErTmNrMGFzb1FSYVQxaGNCZmcxUnhpd3U1WDVt?=
 =?utf-8?B?MUJPZEFpQlJDeEtQU0tBUUZ1M2NWa25MMWtVdU1KdlhQcHJRejlGNWxOTS9j?=
 =?utf-8?B?L09qRGMxeDM0eW9OZkhKbFN6UEUzUHNwOXNLS3MreXRsZFZXVXJTczhOSDJk?=
 =?utf-8?B?NUhwMVFScmVKZlNYU3huMXpvVGI4QUZSejhuTVltY1J1K20wYWplT25FU3Bn?=
 =?utf-8?B?N0hKekdCUUphU255NHNFUzlZOWZVMDI4dUtYRjVueXdvMEJNTDM1VFhMUkl1?=
 =?utf-8?B?N1VnLzJqOWVSSVBBZjNCbGYzMTVJNTJjUVVIeDduQ1lTZVI0czdDdnJzWlRn?=
 =?utf-8?B?Ny9CenpaK25zdlFhQjBxOVRpYTlwUnE0dmt2TzVUMG5wUldBcWhYc3VQNmpq?=
 =?utf-8?B?YTI2QlM0ZnFUelNJTkY2VVRDb3Z6NXhsdHJFUFk3N095TnpjQzRjZ0UwblJB?=
 =?utf-8?B?YlVldXowRzl1REpmbGlsNTlNbjV0dTl0SU9XQVY4RU1EWlhrSFFudUREa1Vy?=
 =?utf-8?B?a0FXVEpMR25IckNKckFmTW5hS3JWbmwvem1vSUd5enpCWFhTTjhXTEVaS3JF?=
 =?utf-8?B?bW8rdTdBZEc0TVphSTlvVnZLRWNQSFFpajMxNzdHOVhOL3VWeVA5bGJiYjFK?=
 =?utf-8?Q?QLBDU5fZaxTIovayJvY93x2XI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c8ea6-0f7c-41bd-bc93-08dc38d79c60
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 03:36:27.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxLJhGRd/SlOpg/Dc7ToKkfx8IZ1nMMo2sr/JXaRy566MHDRcxGCDE1oVjoQkp9lHtJ/Q5Ttk+SByX3xTgPFOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, xuewen.yan94@gmail.com, mgorman@suse.de, ke.wang@unisoc.com, Xuewen Yan <xuewen.yan@unisoc.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(+ Xuewen Yan, Ke Wang)

Hello Tobias,

On 2/28/2024 9:40 PM, Tobias Huschle wrote:
> The previously used CFS scheduler gave tasks that were woken up an
> enhanced chance to see runtime immediately by deducting a certain value
> from its vruntime on runqueue placement during wakeup.
> 
> This property was used by some, at least vhost, to ensure, that certain
> kworkers are scheduled immediately after being woken up. The EEVDF
> scheduler, does not support this so far. Instead, if such a woken up
> entitiy carries a negative lag from its previous execution, it will have
> to wait for the current time slice to finish, which affects the
> performance of the process expecting the immediate execution negatively.
> 
> To address this issue, implement EEVDF strategy #2 for rejoining
> entities, which dismisses the lag from previous execution and allows
> the woken up task to run immediately (if no other entities are deemed
> to be preferred for scheduling by EEVDF).
> 
> The vruntime is decremented by an additional value of 1 to make sure,
> that the woken up tasks gets to actually run. This is of course not
> following strategy #2 in an exact manner but guarantees the expected
> behavior for the scenario described above. Without the additional
> decrement, the performance goes south even more. So there are some
> side effects I could not get my head around yet.
> 
> Questions:
> 1. The kworker getting its negative lag occurs in the following scenario
>    - kworker and a cgroup are supposed to execute on the same CPU
>    - one task within the cgroup is executing and wakes up the kworker
>    - kworker with 0 lag, gets picked immediately and finishes its
>      execution within ~5000ns
>    - on dequeue, kworker gets assigned a negative lag
>    Is this expected behavior? With this short execution time, I would
>    expect the kworker to be fine.
>    For a more detailed discussion on this symptom, please see:
>    https://lore.kernel.org/netdev/ZWbapeL34Z8AMR5f@DESKTOP-2CCOB1S./T/

Does the lag clamping path from Xuewen Yan [1] work for the vhost case
mentioned in the thread? Instead of placing the task just behind the
0-lag point, clamping the lag seems to be more principled approach since
EEVDF already does it in update_entity_lag().

If the lag is still too large, maybe the above coupled with Peter's
delayed dequeue patch can help [2] (Note: tree is prone to force
updates)

[1] https://lore.kernel.org/lkml/20240130080643.1828-1-xuewen.yan@unisoc.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/eevdf&id=e62ef63a888c97188a977daddb72b61548da8417

> 2. The proposed code change of course only addresses the symptom. Am I
>    assuming correctly that this is in general the exepected behavior and
>    that the task waking up the kworker should rather do an explicit
>    reschedule of itself to grant the kworker time to execute?
>    In the vhost case, this is currently attempted through a cond_resched
>    which is not doing anything because the need_resched flag is not set.
> 
> Feedback and opinions would be highly appreciated.
> 
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>  kernel/sched/fair.c     | 5 +++++
>  kernel/sched/features.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 533547e3c90a..c20ae6d62961 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5239,6 +5239,11 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  		lag = div_s64(lag, load);
>  	}
>  
> +	if (sched_feat(NOLAG_WAKEUP) && (flags & ENQUEUE_WAKEUP)) {
> +		se->vlag = 0;
> +		lag = 1;
> +	}
> +
>  	se->vruntime = vruntime - lag;
>  
>  	/*
> diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> index 143f55df890b..d3118e7568b4 100644
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -7,6 +7,7 @@
>  SCHED_FEAT(PLACE_LAG, true)
>  SCHED_FEAT(PLACE_DEADLINE_INITIAL, true)
>  SCHED_FEAT(RUN_TO_PARITY, true)
> +SCHED_FEAT(NOLAG_WAKEUP, true)
>  
>  /*
>   * Prefer to schedule the task we woke last (assuming it failed

--
Thanks and Regards,
Prateek
