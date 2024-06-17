Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFC90BFD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:41:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JQPop9UW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W35xj2c5xz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:41:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JQPop9UW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::609; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2fFF5lKHz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 15:53:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsfNs44ZRm/fFOKwxBLrd6N7CRZ9AYJ/3FpkKg9AZhdUnaprlvhL//PSRCrJ67nJjRCdaub/vlSPH6nAsxI8NiMJPnBr0xJbx7NKDHDnTPD6ENooe/zcfGVCzZLxnyM7nNUPsqzv38pPwh81JdJ9VVvQgMZysbM5F4MAlnOxM8QjuBKE50cFdWo065N0dTgeaainO84ugTpS5s/7Lsmx8wW4X+HPu2ozKLynmsZTchSWLYMtXZnQRX4DR6Nkk72+FbdCrq2mnFe11Ggd01O1aHEo8/cFGVzLLc5io8xdkf/RQiXqZBMCymtOd2Smp4xIEhGDZbg2kSahxuS+tr4C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqhn2CVmB14eYW/0N+KZSHU35QMBoZYH7Jmw7l4ir60=;
 b=EW0TiMnENzHp42NzhN4Szh28d0EBbb6sAeCdwlshYtYMBi/TQJ1HA7jIm6xM5DI3KK8c8ztbaRMSsITReI4qRCTUesPQR/x0WZSE9pOjx47Fhmzj54ZkF/XlYwKRyJBEcOCRYTOscitliw+I29v8Jf5Ry2getUyVpI9jXJeFEqyZbAILy+z0Fpm8BD5Tqt0WxtsJR1wjXshzf7hozlAMksN7n22vDhCmxQshn1+Qc+oxwJz/ga7Lnv/osJuZ34GVqZg4qqezRPbxaVyUc0XfN+T8wdN36w6He4arU3gU4aVtdMAeESymlvileatoGcZNqpwYKBg5unUgTwLUO/7NWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqhn2CVmB14eYW/0N+KZSHU35QMBoZYH7Jmw7l4ir60=;
 b=JQPop9UW3TPXbwb8B+O6OhIB+rsSJti5ue+d0LJ00OfdMvnAa+dhL+Ty1zIdQbR5WNA2BXn2eCWWBOMkvag7RKgeD7AbKlG9D8I8SwhZE1IGoOpuh/xYiEQdFvIVMXUh47by70/R4LlW5bc+cU91t7vELqqPOQC4X6i2F9GbC88=
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 05:52:47 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::ab) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 05:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 05:52:46 +0000
Received: from [10.136.33.236] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 00:52:30 -0500
Message-ID: <e2b75a7a-eb25-6436-1b9f-6155f7d29d45@amd.com>
Date: Mon, 17 Jun 2024 11:22:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, Peter Zijlstra
	<peterz@infradead.org>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
 <20240614092801.GL8774@noisy.programming.kicks-ass.net>
 <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
 <20240615012814.GP8774@noisy.programming.kicks-ass.net>
 <CAKfTPtD2fUBqw09QDPGgAHyvQRmcvzbq9o3FDsctw=R6HP+=CA@mail.gmail.com>
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CAKfTPtD2fUBqw09QDPGgAHyvQRmcvzbq9o3FDsctw=R6HP+=CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d5bc51-7a7d-4467-67a3-08dc8e91b6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230037|1800799021|7416011|376011|36860700010|82310400023;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?eU5ldEx5Q3NwRTlSTko5SHJGczJLaTFKbk9OdUVia1dKNkN2M2M5SzR1Vy9t?=
 =?utf-8?B?WTVPZ2VFbi8ya2puMmpLRlNtRU9RbGpJYVhHTy9CMjlXdW5RWmdBSXhadjdr?=
 =?utf-8?B?djhWSkV0TndXQ0Z6Sy9RWW4xTXVJMHVLM0pNNXV6cldJT09PdUJFNStZOS9l?=
 =?utf-8?B?UFZDUHFjbHNrOC9DS3FrYlVQVlIwcUFLNm1YUEo4ZTBCM0xsM000SnROcFJm?=
 =?utf-8?B?bGNjYUxOMU1qRXc0RjNsUTZNTGJlZXcyalpnWGxUQlJqaStBeG1MNTZEM3VD?=
 =?utf-8?B?dXluRkNlNHV0cS9UYmpPYktVeVpsUmlocm9CUStrUHFZeVF3Rk9ybTZFTllm?=
 =?utf-8?B?ellXWGZkdlFoU0xLakV3YkJ3Y2JSWDBDNlViNWxTNmlPWXBUdE05eC9QcWQ5?=
 =?utf-8?B?aUpiRGZQRGJvRXBvRmZLU2hTeTdkRmNCVGVCRWhiRVlXUUhoV2NMQkJhZmVz?=
 =?utf-8?B?WnFuSmVGMldqQUljUmtVbktaSy9ZeURickU1b2lCTUlEbzEwUXdJVmxwckY4?=
 =?utf-8?B?bjdxY2UvUnByMXJxSnVBem5tZldaenJUaFF6YUxwN2VaUkR4alpteENGV083?=
 =?utf-8?B?TldEQXJuTVNzOVZMbENuRGlsdmRmbW95eDVqNkt1M2xBajBkRFBpUGsvZHlI?=
 =?utf-8?B?eUpoOEF5bmRFdjd5Vlp0Lzl5aXhQcStpdGlmV3RNSUQzOURoeVoxNi9UL0xj?=
 =?utf-8?B?RmE5V1VMYTFTTDBNS21iRnprajhXUi9taVJRWlZ0eDBxMWFVMHpsZnZwZmFE?=
 =?utf-8?B?bVhESmRYTi91ODlFalgxVzllS1F2cGF0ckRLZWpiMHFWY3NWRi9DWHgzQ1Uv?=
 =?utf-8?B?Qkc5RlpMcDNYTWhRa05ZSkEvK2dPS2FqWFNFRk94UzJZc0RhbmZjTWZsWGx3?=
 =?utf-8?B?V3NFdEhBeS9mYWZxcmdya1lncHY1RzlCM2M1NC92aVZsdUhyV3V2aEtHbExy?=
 =?utf-8?B?YVJFVVhRTk5OOGJDZUgva0hpd3VSN2RDRTBkS24zcGRWTFRLZXM5dHhldmxF?=
 =?utf-8?B?anBGZnR0cnJmcGFPV2JFSkFrTkZTY0l6eEw4dTFvZCtMWlF5QmlTQ0FYZWln?=
 =?utf-8?B?akl6TmhtSlRUWFVIbnJ3NjhoVm1sVWpUMXp3RG41d05QZ2grWGxOZ290a1oy?=
 =?utf-8?B?Q3h6emROT0pmVWQ1Q3ZsUjkvYUJnQitJYmFtVXlMdEZCU3lZd3g1cnB4NHN2?=
 =?utf-8?B?Z043akkxOEdMUFZTOEpjQzBmcnpEdUMybThVMzlrM3Z1SGZlUUorMlErN2cv?=
 =?utf-8?B?ZTR4bWM1NkwvVHE3WStyZjk5ZThxQUZ3bytYakdCVVlwTmxZV1drRXBDWll4?=
 =?utf-8?B?c0VXL0V5M3hNZFpmMFJ0ajBSNkFBd2dHQVFsOFEwTUNhVEtjV1ZtZFJTdndE?=
 =?utf-8?B?OTNPNmpGc2Q3R2dGdDB3Wkd6YUlQNExqTFlZTE1oWkd0UUxOUGlIUjNjeEdL?=
 =?utf-8?B?L0xzVTd3ZXpIa3FEdUZiaytPeXJWOEltRXc5Y3VmNWY5RjFpWE5tU3BGTElp?=
 =?utf-8?B?TWMzOWd4OEhyYzlpZHVXOXJIRHVSRDRTMStXVTFkcTJkditrSW95Ry9iZnFX?=
 =?utf-8?B?ZWFzSHBlbUQrckFnekdKbHJZdXZKMWJWZnlheThvQmgzTVJQclZOOVhvc1Ja?=
 =?utf-8?B?MTduQ01JQlV2dE5XbDJUMDBEMkEvaGNsUEx4UGZoK3EwUmpqaThuWnloUGo5?=
 =?utf-8?B?ZEYyVFJBRDAxNFBSQzQ2NS9mZUxXL2trREtQYzlxRHM5dEFEK3hhSStKYldV?=
 =?utf-8?B?T281bmc1d1NCVVdUYmhuYTlrcnlVeWltb09IaWlUd3FPRTNJb2tIb3RkSjhs?=
 =?utf-8?Q?Ex5XvjteVVFCPAmmBhmjQRf0ldCEK9rkjoYls=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(376011)(36860700010)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 05:52:46.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d5bc51-7a7d-4467-67a3-08dc8e91b6c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
X-Mailman-Approved-At: Tue, 18 Jun 2024 09:37:51 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal
 Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, Borislav Petkov <bp@alien8.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Vincent, Peter,

On 6/16/2024 8:27 PM, Vincent Guittot wrote:
> On Sat, 15 Jun 2024 at 03:28, Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Fri, Jun 14, 2024 at 12:48:37PM +0200, Vincent Guittot wrote:
>>> On Fri, 14 Jun 2024 at 11:28, Peter Zijlstra <peterz@infradead.org> wrote:
>>
>>>>> Vincent [5] pointed out a case where the idle load kick will fail to
>>>>> run on an idle CPU since the IPI handler launching the ILB will check
>>>>> for need_resched(). In such cases, the idle CPU relies on
>>>>> newidle_balance() to pull tasks towards itself.
>>>>
>>>> Is this the need_resched() in _nohz_idle_balance() ? Should we change
>>>> this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
>>>> something long those lines?
>>>
>>> It's not only this but also in do_idle() as well which exits the loop
>>> to look for tasks to schedule
>>
>> Is that really a problem? Reading the initial email the problem seems to
>> be newidle balance, not hitting schedule. Schedule should be fairly
>> quick if there's nothing to do, no?
> 
> There are 2 problems:
> - Because of NEED_RESCHED being set, we go through the full schedule
> path for no reason and we finally do a sched_balance_newidle()

Peter's patch up in the thread seems to improve the above case by
speeding up the schedule() loop similar to the very first solution
I tried with
https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/

I do see same level of improvements (if not better) with Peter's
SM_IDLE solution:

   ==================================================================
   Test          : ipistorm (modified)
   Units         : Normalized runtime
   Interpretation: Lower is better
   Statistic     : AMean
   ==================================================================
   kernel:				time [pct imp]
   tip:sched/core			1.00 [baseline]
   tip:sched/core + revert		0.40 [60.26%]
   tip:sched/core + TIF_NOTIFY_IPI	0.46 [54.88%]
   tip:sched/core + SM_IDLE		0.38 [72.64%]

> - Because of need_resched being set o wake up the cpu, we will not
> kick the softirq to run the nohz idle load balance and get a chance to
> pull a task on an idle CPU

However, this issues with need_resched() still remains. Any
need_resched() check within an interrupt context will return true if the
target CPU is perceived to be in a polling idle state by the sender as a
result of the optimization in commit b2a02fc43a1f ("smp: Optimize
send_call_function_single_ipi()").

If TIF_POLLING_NRFLAG is defined by an arch, do_idle() will set the
flag until the path hits call_cpuidle() where the flag is cleared just
before handing off the state entry to the cpuidle driver. An incoming
interrupt in this window will allow the idle path to bail early and
return before calling the driver specific routine since it'll be
indicated by TIF_NEED_RESCHED being set in the idle task's thread info.
Beyond that point, the cpuidle driver handles the idle entry.

I think an arch may define TIF_POLLING_NRFLAG just to utilize this
optimization in the generic idle path to answer Vincent's observation
on ARM32 having TIF_POLLING_NRFLAG.

> 
>>
>>>> I mean, it's fairly trivial to figure out if there really is going to be
>>>> work there.
>>>>
>>>>> Using an alternate flag instead of NEED_RESCHED to indicate a pending
>>>>> IPI was suggested as the correct approach to solve this problem on the
>>>>> same thread.
>>>>
>>>> So adding per-arch changes for this seems like something we shouldn't
>>>> unless there really is no other sane options.
>>>>
>>>> That is, I really think we should start with something like the below
>>>> and then fix any fallout from that.
>>>
>>> The main problem is that need_resched becomes somewhat meaningless
>>> because it doesn't  only mean "I need to resched a task" and we have
>>> to add more tests around even for those not using polling
>>
>> True, however we already had some of that by having the wakeup list,
>> that made nr_running less 'reliable'.
>>
>> The thing is, most architectures seem to have the TIF_POLLING_NRFLAG
>> bit, even if their main idle routine isn't actually using it, much of
> 
> Yes, I'm surprised that Arm arch has the TIF_POLLING_NRFLAG whereas it
> has never been supported by the arch
> 
>> the idle loop until it hits the arch idle will be having it set and will
>> thus tickle these cases *sometimes*.
>> [..snip..]

-- 
Thanks and Regards,
Prateek
