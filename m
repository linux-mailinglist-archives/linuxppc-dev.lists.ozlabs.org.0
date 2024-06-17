Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBD90BFDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:42:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=E9fVmNiU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W35yb30B9z3gHm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:42:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=E9fVmNiU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:240a::60a; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2k9L37N6z3dWg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 18:50:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzWYhr6jrKoO1FtK+yxMS19rQJbLHH16Co6DUMYmQWXCgu7ciOjye354nayPWobZX/lBGcdz1hWPYq+T4Z5dQE8p+y7o+aXNasE+ilHk7mMGqC2Hp0wJEh57nKbDVs6mAlDI13eAkqMsWa/hMi6HKiBJz/CV7DA3qzOTtNVwlehHpt888StIMb4aclY+k36XCZVGFfRTP3McgBH1XBfb2/jnOBLPrwlCUCCX7FiA/TUn1gqaTia/5uN8w+Rcnbu6AgIz16xGKYnjQsvaxeAjxm637hqR4EpssaPyUeXvV+n0TM1zsHpHcq6+2kpk0CQKoBxH7ttMGcRYXsWBEY1vcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioI1udxjWgCX1GVr6bX14khFfKyVGS47PS7NC8FjZoY=;
 b=fSe1YMXivEC5hs4rBjM8/N9UNruKN31AmabA1xlmpOwCRTcJbw5es96ziHSGrjg6aBnWbkqBU7rKKIWMNg5FpfVkdN7rKFBucP3+IdRdNwn1Hn8xpKJVA42iMpZUyPyrAtCVAqEFUxgEA2FNrwfvBnvKvFmPuf4jNwrZyeJAA9LhHiThxWcam03n/qiVu9b+y2Rf6Rfz7TvyWvmdWJg5wMz2tt3/Tp/9YDKGlzmTLiNexFDjk4XP0GD8PMGakjCwxUZ9tR/euZdB8ncZk7gZRPRkYQvmw0bu0Cdyob4BZFx+7IAOW9bzDPO9KQGXQP3WE4RnahbzIb8QueNYySxTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioI1udxjWgCX1GVr6bX14khFfKyVGS47PS7NC8FjZoY=;
 b=E9fVmNiUD1Bmdwcq7wcvGrlgqQtcFm9drg3Wv0RZwmZuC8E8eWibw0+F2m0T+GtWJwq2m2+umP0YWZQqv73uqbi/FtqWEua4iuaj8Yg/fFq+f+zE7Ce5lmewJGY9Y1f9UEQ2oX14GmOKDnAbBGSAcvx7YAvrSu+rcO5cVpKHBJ8=
Received: from CH2PR15CA0021.namprd15.prod.outlook.com (2603:10b6:610:51::31)
 by CY8PR12MB7242.namprd12.prod.outlook.com (2603:10b6:930:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 08:33:59 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::4b) by CH2PR15CA0021.outlook.office365.com
 (2603:10b6:610:51::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Mon, 17 Jun 2024 08:33:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 08:33:59 +0000
Received: from [10.136.33.236] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 03:33:43 -0500
Message-ID: <4748fabf-c359-9199-16aa-469840201540@amd.com>
Date: Mon, 17 Jun 2024 14:03:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Content-Language: en-US
To: Chen Yu <yu.c.chen@intel.com>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
 <20240614092801.GL8774@noisy.programming.kicks-ass.net>
 <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
 <ZmxwWdW78hjNuxWU@chenyu5-mobl2>
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <ZmxwWdW78hjNuxWU@chenyu5-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|CY8PR12MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 9815d377-6429-452f-8d99-08dc8ea83c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230037|7416011|376011|1800799021|82310400023|36860700010;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?WlRpbnp4M09IUjZtU2djZEliMFJFYkdQdU1LZmtodHBJUlp3eWhXZnVPeFJt?=
 =?utf-8?B?N1QzaE5kSWlJOWc3S2xlaHBVTEFSRnpFcWpZai9jYmJIUi9GS2R1cDRiZ1Rh?=
 =?utf-8?B?U3pJclBkQzFYYTc4L2ZaMEZzRTdGVkNFZWthK0Z2S2p2YVFXNzU5cS8rOS9h?=
 =?utf-8?B?c1JuWm1DdjhpRWQzM1JDM3NXMy9QdzQ3MGhGMEdjanp5M0FQTEh6UmR1OG5I?=
 =?utf-8?B?ZWtLbWRpOVV6OUpBaTlLbDFreG9xUXRyNDFUdjA2MlhPYWlZNVh4UXZjb0NH?=
 =?utf-8?B?azdjUWJzRDdSZ2JRdFU2eFBUbklGc2hoUGdKRXEyekZVQmNKeEt4OXdkQ2NO?=
 =?utf-8?B?eSt0MFJ1REVrUVlaTW5RTmZrbldkdXErdG5FSUlBV2pVVFdiY1VUNnY2eFZN?=
 =?utf-8?B?VHdsUVo3alc4eHVYSm4rZEc3S1JwNkU0MFdBUGQrOG82a2xMcDNlR3V0RHhu?=
 =?utf-8?B?elZ0cy9lRUUwbG5WVVhJZytscDZxS3dOQUtCd0JGZk0yNUFZdW9MWFY3Y0k2?=
 =?utf-8?B?SVBYSnM5bjI2ZWhIZnM1QTdKZXZKRVdXZkNhTmRWcnJBMmRsYVQ2dGxmbGp1?=
 =?utf-8?B?c1dpSVdhSjY2WEQ0Q2VlK2hrMDNnaUdBdUtTMmEvQjZzaHZTMUNSeVU5aE1j?=
 =?utf-8?B?TWk2c0lFZXFKTzZaUEJ6NHBXU1lWOGVhMHRIV1NnY09VU2U0YnVOU0pIR1hn?=
 =?utf-8?B?L1Q1Mk90dC9XVFJRNGQ3ZThGa0dsemVvNTFFWVZHaUxYN01QTjJ0clN6dW9Y?=
 =?utf-8?B?VVIvN2FlOEpWYk9YQms5QjNZVENScFMxOW1WR3p6VEZYWm4wU0F0cXlRbjE2?=
 =?utf-8?B?QWYzZzhkMTR2WmlWZ3BVWk9ONkxGZUVDbnFSMHJvL04rQkllZU1meUFSSDFT?=
 =?utf-8?B?QWh1T3RvY2JDQUZnZkpMcFYvVWlLRTJmMUhGNjQ1MEI5SG9aaU1VSWJQZkdi?=
 =?utf-8?B?Rk5pd2hrTG56emswcU8zbTExWDlrVy8reFlKalVxWFRxSUs5dW1ENjVLOTY5?=
 =?utf-8?B?UXBiR0lRdVhhS21LR0lPdTNTYUQzTUtrTklTZ2hnMHphNHBEdk82Rjd4eU85?=
 =?utf-8?B?azNTRWZkaDVDR25oSzlUYU94Yy92VndZVWRYWTZCS1J4eW9EaDRka1VId0do?=
 =?utf-8?B?STFuYVp2dy9SN3E2RXBqK0tSRXJ0bnFMMnY4REVmZjd2TzZxc2V4cHVoNE5P?=
 =?utf-8?B?bjR6TTF0OXlJK2NXNmZqVm5OaVZlOWZTNStKSTFJbGFkdUZ3MC83bHVDMUNL?=
 =?utf-8?B?Z3VzbmNzanRaREY4dlhaMTFKZ0oxRmRJMGZwYzBQL0VRNFVrbmwrbU12STdz?=
 =?utf-8?B?dzk5RERtNmppdG9sTVQxdEpUaU5WY2lSYXV0S0p4Sk5KeHVrT09pR2VnLzNK?=
 =?utf-8?B?OEJYWmFEOWdmQWd3N0VzRWQvRTZtUWN1VzIrZkNLSnE0Wnc5SWNKWlBaSXdF?=
 =?utf-8?B?MEpBOWVINVh5RWVqQXRGc3pKeFIxeHVtV09NemNPOS9hOVdoa2R1eVpuQmdj?=
 =?utf-8?B?NTB6QmdYZDJzTTRjanJNbUVPM3RxSndaMTBFWUw5UUZOTUJjNnowYUxGVzEz?=
 =?utf-8?B?SzFNaDEzZ2FvTGZRSjdpNWRHZWxJYnpuUFhaekExYkxZSW5EUGRBMjg3dndT?=
 =?utf-8?B?MnN6YmU2SzdvVEZmOGRKY3Btcjg0eU9hS01UeGFCblMwZzl2MHlWcnRIR0ht?=
 =?utf-8?B?Q01OSzgwYkVJOS9MbWpJVFEvUE1oV3JzeDVKRGpyczArSWhuR0dUOWc0cHJt?=
 =?utf-8?B?eHJCaUljM3NqWCtZalBiOGNMOWF3MElGT0RNc1JUZjhVSE5FZGNzaFh3blZZ?=
 =?utf-8?B?b3EvVktCYnlUdEhBUDNpQ0R3Q1NBdFh4TUk0aUQyT1J2RU5TTDh2MENVd05l?=
 =?utf-8?B?SlkzVFAxaXBqK3dEYytPcjdRQm5McCtnTGpKYmpOeEovNlE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(82310400023)(36860700010);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 08:33:59.1401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9815d377-6429-452f-8d99-08dc8ea83c0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7242
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal
 Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, Borislav Petkov <bp@alien8.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Chenyu,

On 6/14/2024 10:01 PM, Chen Yu wrote:
> On 2024-06-14 at 12:48:37 +0200, Vincent Guittot wrote:
>> On Fri, 14 Jun 2024 at 11:28, Peter Zijlstra <peterz@infradead.org> wrote:
>>>
>>> On Thu, Jun 13, 2024 at 06:15:59PM +0000, K Prateek Nayak wrote:
>>>> Effects of call_function_single_prep_ipi()
>>>> ==========================================
>>>>
>>>> To pull a TIF_POLLING thread out of idle to process an IPI, the sender
>>>> sets the TIF_NEED_RESCHED bit in the idle task's thread info in
>>>> call_function_single_prep_ipi() and avoids sending an actual IPI to the
>>>> target. As a result, the scheduler expects a task to be enqueued when
>>>> exiting the idle path. This is not the case with non-polling idle states
>>>> where the idle CPU exits the non-polling idle state to process the
>>>> interrupt, and since need_resched() returns false, soon goes back to
>>>> idle again.
>>>>
>>>> When TIF_NEED_RESCHED flag is set, do_idle() will call schedule_idle(),
>>>> a large part of which runs with local IRQ disabled. In case of ipistorm,
>>>> when measuring IPI throughput, this large IRQ disabled section delays
>>>> processing of IPIs. Further auditing revealed that in absence of any
>>>> runnable tasks, pick_next_task_fair(), which is called from the
>>>> pick_next_task() fast path, will always call newidle_balance() in this
>>>> scenario, further increasing the time spent in the IRQ disabled section.
>>>>
>>>> Following is the crude visualization of the problem with relevant
>>>> functions expanded:
>>>> --
>>>> CPU0                                                  CPU1
>>>> ====                                                  ====
>>>>                                                        do_idle() {
>>>>                                                                __current_set_polling();
>>>>                                                                ...
>>>>                                                                monitor(addr);
>>>>                                                                if (!need_resched())
>>>>                                                                        mwait() {
>>>>                                                                        /* Waiting */
>>>> smp_call_function_single(CPU1, func, wait = 1) {                              ...
>>>>        ...                                                                     ...
>>>>        set_nr_if_polling(CPU1) {                                               ...
>>>>                /* Realizes CPU1 is polling */                                  ...
>>>>                try_cmpxchg(addr,                                               ...
>>>>                            &val,                                               ...
>>>>                            val | _TIF_NEED_RESCHED);                           ...
>>>>        } /* Does not send an IPI */                                            ...
>>>>        ...                                                             } /* mwait exit due to write at addr */
>>>>        csd_lock_wait() {                                       }
>>>>        /* Waiting */                                           preempt_set_need_resched();
>>>>                ...                                             __current_clr_polling();
>>>>                ...                                             flush_smp_call_function_queue() {
>>>>                ...                                                     func();
>>>>        } /* End of wait */                                     }
>>>> }                                                             schedule_idle() {
>>>>                                                                        ...
>>>>                                                                        local_irq_disable();
>>>> smp_call_function_single(CPU1, func, wait = 1) {                      ...
>>>>        ...                                                             ...
>>>>        arch_send_call_function_single_ipi(CPU1);                       ...
>>>>                                                \                       ...
>>>>                                                 \                      newidle_balance() {
>>>>                                                  \                             ...
>>>>                                              /* Delay */                       ...
>>>>                                                    \                   }
>>>>                                                     \                  ...
>>>>                                                      \-------------->  local_irq_enable();
>>>>                                                                        /* Processes the IPI */
>>>> --
>>>>
>>>>
>>>> Skipping newidle_balance()
>>>> ==========================
>>>>
>>>> In an earlier attempt to solve the challenge of the long IRQ disabled
>>>> section, newidle_balance() was skipped when a CPU waking up from idle
>>>> was found to have no runnable tasks, and was transitioning back to
>>>> idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
>>>> may be viable for CPUs that are idling with tick enabled, where the
>>>> newidle_balance() has the opportunity to pull tasks onto the idle CPU.
>>>
>>> I don't think we should be relying on this in any way shape or form.
>>> NOHZ can kill that tick at any time.
>>>
>>> Also, semantically, calling newidle from the idle thread is just daft.
>>> You're really not newly idle in that case.
>>>
>>>> Vincent [5] pointed out a case where the idle load kick will fail to
>>>> run on an idle CPU since the IPI handler launching the ILB will check
>>>> for need_resched(). In such cases, the idle CPU relies on
>>>> newidle_balance() to pull tasks towards itself.
>>>
>>> Is this the need_resched() in _nohz_idle_balance() ? Should we change
>>> this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
>>> something long those lines?
>>
>> It's not only this but also in do_idle() as well which exits the loop
>> to look for tasks to schedule
>>
>>>
>>> I mean, it's fairly trivial to figure out if there really is going to be
>>> work there.
>>>
>>>> Using an alternate flag instead of NEED_RESCHED to indicate a pending
>>>> IPI was suggested as the correct approach to solve this problem on the
>>>> same thread.
>>>
>>> So adding per-arch changes for this seems like something we shouldn't
>>> unless there really is no other sane options.
>>>
>>> That is, I really think we should start with something like the below
>>> and then fix any fallout from that.
>>
>> The main problem is that need_resched becomes somewhat meaningless
>> because it doesn't  only mean "I need to resched a task" and we have
>> to add more tests around even for those not using polling
>>
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 0935f9d4bb7b..cfa45338ae97 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -5799,7 +5800,7 @@ static inline struct task_struct *
>>>   __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>>>   {
>>>          const struct sched_class *class;
>>> -       struct task_struct *p;
>>> +       struct task_struct *p = NULL;
>>>
>>>          /*
>>>           * Optimization: we know that if all tasks are in the fair class we can
>>> @@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
>>>          if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
>>>                     rq->nr_running == rq->cfs.h_nr_running)) {
>>>
>>> -               p = pick_next_task_fair(rq, prev, rf);
>>> -               if (unlikely(p == RETRY_TASK))
>>> -                       goto restart;
>>> +               if (rq->nr_running) {
>>
>> How do you make the diff between a spurious need_resched() because of
>> polling and a cpu becoming idle ? isn't rq->nr_running null in both
>> cases ?
>> In the later case, we need to call sched_balance_newidle() but not in the former
>>
> 
> Not sure if I understand correctly, if the goal of smp_call_function_single() is to
> kick the idle CPU and do not force it to launch the schedule()->sched_balance_newidle(),
> can we set the _TIF_POLLING_NRFLAG rather than _TIF_NEED_RESCHED in set_nr_if_polling()?
> I think writing any value to the monitor address would wakeup the idle CPU. And _TIF_POLLING_NRFLAG
> will be cleared once that idle CPU exit the idle loop, so we don't introduce arch-wide flag.
Although this might work for MWAIT, there is no way for the generic idle
path to know if there is a pending interrupt within a TIF_POLLING_NRFLAG
section. do_idle() sets TIF_POLLING_NRFLAG and relies on a bunch of
need_resched() checks along the way to bail early until finally doing a
current_clr_polling_and_test() before handing off to the cpuidle driver
in call_cpuidle(). I believe this section will necessarily need the sender
to indicate a pending interrupt via TIF_NEED_RESCHED flag to enable the
early bail out before going into the cpuidle driver since this case cannot
be considered the same as a break from MWAIT.

On x86, there seems to be a possibility of missing an interrupt if
someone writes _TIF_POLLING_NRFLAG to thread info between the target
executing MONTOR and MWAIT. AMD64 Architecture Programmer’s Manual
Volume 3: "General-Purpose and System Instructions", Chapter 4. "System
Instruction Reference", section "MWAIT" carries the following note in
the coding requirements:

"MWAIT must be conditionally executed only if the awaited store has not
already occurred. (This prevents a race condition between the MONITOR
instruction arming the monitoring hardware and the store intended to
trigger the monitoring hardware.)"

There exists a similar note in the "Example" section for "MWAIT" in
Intel 64 and IA-32 Architectures Software Developer’s Manual, Vol 2B
Chapter 4.3 "Instructions (M-U)"

I'm not sure if one can use use _TIF_POLLING_NRFLAG alone and cover
all the cases but there might be some clever trick to make it all
work :)

> 
> thanks,
> Chenyu
>   
>>> +                       p = pick_next_task_fair(rq, prev, rf);
>>> +                       if (unlikely(p == RETRY_TASK))
>>> +                               goto restart;
>>> +               }
>>>
>>>                  /* Assume the next prioritized class is idle_sched_class */
>>>                  if (!p) {

-- 
Thanks and Regards,
Prateek
