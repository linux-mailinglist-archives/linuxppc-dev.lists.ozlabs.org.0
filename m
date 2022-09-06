Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AFD5ADF30
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 07:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMF040t09z3bd3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 15:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SLM63BCA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.100.69; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SLM63BCA;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMDzK0Q8yz2xGB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 15:51:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOrna5usLkH24rKinWMeFkkBx7NbMAgG51EADVJDZDm8qdAquXu8mgY7LOmQ3n1GBwnRX3KDEXBgJg/9EMuUUSs8SJjL771IgH1spPekSUNbtJ1cj4BS9GYeCSUT8Pv+eYkeEqcA7Zefrry8BpfuTpQ88HCLh2pXlpZpId78Q6r86kR5F+LwCbkVepDmBPTh5sMtcMRN+YXMWoEYqRF6ZWLqFITiVuzA7RBS2eZLIoz1cPVM33evMBmJYZnDbHZqpZ4UIFQMy35Y5iychbysjX+xdhKXUSP6Tmi0mf9B42ttQvt7nkw7VfEy/TVssxQtJBWuDOtO72BYHAm/O0eoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvmWjItMQDGmiM1RgZNL8NOYWfLoHxKHWu7BDH/h0i4=;
 b=NM5NVYB/BMz52/AxLq54S2Eib3mEn1D2rZFQkEd12TkkhWfVqWkUzHHseO1zuBBZlQfc6tjSMTHvM+dyaAJQ+o3Z0CXFXys2cO7poIPmbcFSHQXs60o1b0++uFXJgiqDh0t6AXOxzVUvTkhz1D2Z+Ys4ygJzDaO0p0+Je9OP45uT8VQYWV2LVxzZybGtfh9Cyw6ypII4iFh1diz8bnqdhXYhMy1UJzP+gz2g8x67KiUOJsBy5QCTNGEYIb7IF+pFcDkr16hptOxA9ZuVz802dVHnm8t2vQfRc2r96DKbDmoWmCqXP5Q9qR0MiCDbaHgYyEvLIqCxvZhbGvXbD8joew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvmWjItMQDGmiM1RgZNL8NOYWfLoHxKHWu7BDH/h0i4=;
 b=SLM63BCA+/4a8sA5jKjyE2AVFl9wmXzEx8QDM6L1QcTmKm+687UNMggMixbpsCTYP9Hl+HWxP9vOKStm2YMwXrKXtABwa+BTA9tSCatkd/D+arxt5Yl9QLudAB2xMrJb8uWjRm0WcOmXp9hMOTHT/2GlaXr++3BsO5SLFLRqA44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 05:51:14 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::d058:d925:c09b:de2]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::d058:d925:c09b:de2%5]) with mapi id 15.20.5588.010; Tue, 6 Sep 2022
 05:51:14 +0000
Message-ID: <9d7a9f37-f037-00b8-afd3-72bb840a90df@amd.com>
Date: Tue, 6 Sep 2022 11:20:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] perf: Rewrite core context handling
Content-Language: en-US
To: peterz@infradead.org
References: <20220829113347.295-1-ravi.bangoria@amd.com>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <20220829113347.295-1-ravi.bangoria@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::13) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 383abcd3-000c-4e8d-20ac-08da8fcbcf2f
X-MS-TrafficTypeDiagnostic: DS0PR12MB7511:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SSVKaITMMriznskGIX64kkA0n/pIcXVGFQ535RgTG4WEBk0vuLRYlbHUlfjwZRhyF6vEli5mS/mdN0V5Y6Xy8WTznM0nzZhOYGcAePqtiBNtgs/7XX2u9KGQDPeRE4oZbJJbL+OPrEwfkmz4FQ0BHgKf6I+YCSkRvWdUZuw673+CPNfMIjSvbozkfy/RF6acaoXg70LYgpcL1UqF3420JE+8VlHUc6aXUk0F3e0nCP3Ppujn1Kg/GEp3YrTz+4ajpmAaPARkBPtu7NLUstlz5D7vi5K6Qz3bzDC8JKIoUNmcOtAohgpTaKk8qVziX9IGfOM02V4q5IoMsryB2gY9oqTEFYUoNTvmqcJwM0hiHnNghI+NaUaTRmHcb3ZqhW6kFCfVTjdtWbS1q3+KlASHd+GGPfD/3QDJLNr3gkb95JROpwJKgOIffN6vPiMitsv771/kFLEhXcVKIKSRv2r1+TLQBhi6ulHGBAPjfpfwm+IXSazCJEY98rTzKlvUOWkyBmSQOqBVgdrtKlu6pcrfqUwB/tJ4M4GJbNQ2Sm9rqi48pGSLpGfPTe2tmAU9FqaApSbJmLCCKvXkqQTg//jw62Z+QeeRIK00aJILgzF6c5yBjvilRkJxBUhbsXgKP6Pysf/Z1SJ6dqbIGQEMpvZYiF72PSkC/ObEJOw1yarwmShR0699tEptwZN1t+OGRqitlDuUZq7aPFl/Ju6WxHyL/xbimuZiDgXsHPHjuvyglClVop5ynAqNRhfjAH35wjrKcGZAKBFWPKH8+eGaXSBahAO1YZT9gAu9sBf/vlRQnRlYXz37tklJQ4HGkYXEhP58
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(66556008)(478600001)(66946007)(6486002)(83380400001)(186003)(41300700001)(5660300002)(6666004)(2616005)(8936002)(66476007)(4326008)(8676002)(44832011)(7416002)(38100700002)(6512007)(31696002)(31686004)(2906002)(26005)(6916009)(6506007)(316002)(36756003)(86362001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OVloV0poTkRjK0dQZEJzTU9wU1NtdlJvVWkvekZOTnJhZk1nWUZYQkNnZ1Zm?=
 =?utf-8?B?MHpsQlR4ZkxnVTZGM29YdlpaVjAxek5zdzg1dWUvaHRxMHhTSElPaGQvdW5r?=
 =?utf-8?B?MlpkdUpzMmdkY2NDdDIxOGZhb2F5YW4xNTVxSE1xUXN2OXFHTS9KNjJwUHlw?=
 =?utf-8?B?TFF6dG53bzRkV3ZpT0tIbTJFTEQ4V0pXcXZFcTFnU3NhR0wxVWEzS2swbzZn?=
 =?utf-8?B?VmdwUW5mdVdVU0dNYitKZEY3aVNDZWt6diszc2dwS3FIWFB0ejZCaWFhV1hC?=
 =?utf-8?B?eWVRaGNGUTBNM2pDNUdEbDlCeHViL3FWcFFqTjlLejF1VFNIN2dla1ZRbUJx?=
 =?utf-8?B?VXRYWmg2aSs0aUFWZ2xuTkVteUdkcExzSk5jVE9EQkFjUEo4ZE1EZEljUUJJ?=
 =?utf-8?B?bzZaRjZOa1RBK3k4bGdiT2FNVmFaNXgzSzRiclpJNG4rTTMvNFlCSjQ3ZlRS?=
 =?utf-8?B?Um9MVitVNjlXSFRQWFdQRXJsVy95MmRHbUJFZWRkTHdZT2lZWW0xRmFMZnlO?=
 =?utf-8?B?Z1U3dXJPclJmQzZyU1ZZdG9aazVTSGlFbWFuYUJjRkt3OWtRYXIxQ0Zpeldo?=
 =?utf-8?B?NVRhUjZJWjQwYlFEVjA5czlJQWhyZGRRYWIyQ0pneFVESzdobndISEJNS3d2?=
 =?utf-8?B?aG1iWnpTOW9tSnVRVEJUYWtVU3Q5bURjd2JHOWhWbVdxQStGeDNZV1VzT0Iz?=
 =?utf-8?B?azhXYmdqTG1lZmJnOUdoYkx0UEZwcXZLSCtnM3RudmlVdEtrRGFmakg2TC9x?=
 =?utf-8?B?RHpubTFCREhyUjFFRjZBblFXYmppS2RCdElZNGdnOHU5aTVVeS9kR1MvYWI1?=
 =?utf-8?B?Z25rd2x6aWtzN3JlbWRPNnF5NWxhT1pnNHpHNmpEZ3QybXF1U3FzbUVGdG1u?=
 =?utf-8?B?R2M0VGVVY1hmbzZEajQzVEF6ckRUeXV6VDN3TVdldzRtWUpUZDJZMG42eXIx?=
 =?utf-8?B?bnhhRTViT3c0Qk1LM3I3LzhnTzJrZjVVWEJQbi9XN3FoMlNZOWRkMUhNYUNU?=
 =?utf-8?B?YXltMi92WEdNeUdseVBjcm5UemlmM2Mwd21vUmFwbkx4VEN6UEk5TWJJQWJo?=
 =?utf-8?B?L0hFOWFTeUxZN0toaEVrbDJFQzE3NTUveVVZdlFUZi9GZGE5Skt5OFJmek5R?=
 =?utf-8?B?Y0VhM1c4a3hVYWJISVRWazZXNE1UV21yWGY5TTdUcWw4cUIzajdDY2JJcGtz?=
 =?utf-8?B?WlJ2NFNHcGt3RHUrZThOd3UxdDVwc0J2UlM4UVduV3hHa3RObkRlaTJBUUhK?=
 =?utf-8?B?YkRiRTIzTFllV2tTaW1JUUk3VjhEUmJGeCtudVl5K0FJWHhFYWI5cG4wdXFp?=
 =?utf-8?B?RmtkOUpSL1NTMDYvSXVRZ1VQQmh4SnF2MytieFIwN3Y3TWZkUGhkSXB5Wmt2?=
 =?utf-8?B?WnRaOTN0RXJyNXhFOXpEZVZacDk2QnBlRHB3L1BtejNqL001OW1XTGNsS2hV?=
 =?utf-8?B?dTQvMHV3c1FXQS9mUVBxSmZtUWJZNmpSTUZHWEtGbVAydEw4YVJvbno4eTk4?=
 =?utf-8?B?dkZUU1lweUp0dDdSeVRmeGdvZ1pqMXZiQVEwYjhpU1orcThucC96UDVma2tl?=
 =?utf-8?B?K1pzNlI5aktOUUZaa3BXYzE5NmdjTWVkYktNbFBXUXp1aWlaRURFTXRlcEtm?=
 =?utf-8?B?RTRRREZMcC9jQmp0WDhHbzloTUNJaGZCS29RbWFUMWlVNmpvQXFnOGpIMFVT?=
 =?utf-8?B?NjF3U0RyV0pJSXBVdVlpcmxnRDl5UG1xWkVpdCtFb2xMOVc1VDBKWTNTU3A5?=
 =?utf-8?B?SGdadUJUUTczc1ZwRmI4VFVkR0VuZ3VXNTBqQW8xTUdmYXRuUE1qZEp5M05q?=
 =?utf-8?B?V0pLZ2h1R0pjL0NMYzBPdG93VzJxOE9lTHhaMHlzL3BobzB3NXlnQU05bDZE?=
 =?utf-8?B?ZlBqNXVIL3V4dDN3MnhsaW5lMytnRWNIZlFJV0c0VE4zOG1pZ0xZR2lPNmNi?=
 =?utf-8?B?RmRXZEFZeGhnMklzRm44RW5HR2JBM2VsWC9WV1JSK1FmOU9KcFBkTVNLYVk1?=
 =?utf-8?B?NWxjRWtWU3RpRVRZZVRENmZRSWI4VFN0SFQ1Y3N4RmxmZkp5TUlDOXRRZFg5?=
 =?utf-8?B?TUxUU25FUTlpM3Z1cUl0Yk44aGl6Q24yOGJuL25XRzIzUDFmU3dRMTdadU5t?=
 =?utf-8?Q?HQZMrSNBD+N2ec3co+MMTQdYZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383abcd3-000c-4e8d-20ac-08da8fcbcf2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 05:51:14.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: um6o2dqpFfNi60Fk4NSiASHGF5yjdbviRyFulZZAJQ0ovQ+l2l+qiavW9QTycN7QgQ+6e7PXBVSatdqL7N+eDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, ravi.bangoria@amd.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> @@ -9752,10 +9889,13 @@ void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
>  		struct trace_entry *entry = record;
>  
>  		rcu_read_lock();
> -		ctx = rcu_dereference(task->perf_event_ctxp[perf_sw_context]);
> +		ctx = rcu_dereference(task->perf_event_ctxp);
>  		if (!ctx)
>  			goto unlock;
>  
> +		// XXX iterate groups instead, we should be able to
> +		// find the subtree for the perf_tracepoint pmu and CPU.
> +
>  		list_for_each_entry_rcu(event, &ctx->event_list, event_entry) {
>  			if (event->cpu != smp_processor_id())
>  				continue;

This one was simple enough so I prepared a patch for this. Let
me know if you see any issues with below diff.

---
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 820c56c66b26..e0232e0bb74e 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9807,6 +9807,44 @@ static struct pmu perf_swevent = {
 
 #ifdef CONFIG_EVENT_TRACING
 
+static void tp_perf_event_destroy(struct perf_event *event)
+{
+	perf_trace_destroy(event);
+}
+
+static int perf_tp_event_init(struct perf_event *event)
+{
+	int err;
+
+	if (event->attr.type != PERF_TYPE_TRACEPOINT)
+		return -ENOENT;
+
+	/*
+	 * no branch sampling for tracepoint events
+	 */
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	err = perf_trace_init(event);
+	if (err)
+		return err;
+
+	event->destroy = tp_perf_event_destroy;
+
+	return 0;
+}
+
+static struct pmu perf_tracepoint = {
+	.task_ctx_nr	= perf_sw_context,
+
+	.event_init	= perf_tp_event_init,
+	.add		= perf_trace_add,
+	.del		= perf_trace_del,
+	.start		= perf_swevent_start,
+	.stop		= perf_swevent_stop,
+	.read		= perf_swevent_read,
+};
+
 static int perf_tp_filter_match(struct perf_event *event,
 				struct perf_sample_data *data)
 {
@@ -9856,6 +9894,49 @@ void perf_trace_run_bpf_submit(void *raw_data, int size, int rctx,
 }
 EXPORT_SYMBOL_GPL(perf_trace_run_bpf_submit);
 
+
+static void __perf_tp_event_target_task(u64 count, void *record,
+					struct pt_regs *regs,
+					struct perf_sample_data *data,
+					struct perf_event *event)
+{
+	struct trace_entry *entry = record;
+
+	if (event->attr.config != entry->type)
+		return;
+	/* Cannot deliver synchronous signal to other task. */
+	if (event->attr.sigtrap)
+		return;
+	if (perf_tp_event_match(event, data, regs))
+		perf_swevent_event(event, count, data, regs);
+}
+
+static void perf_tp_event_target_task(u64 count, void *record,
+				      struct pt_regs *regs,
+				      struct perf_sample_data *data,
+				      struct perf_event_context *ctx)
+{
+	struct perf_event *event, *sibling;
+
+	event = perf_event_groups_first(&ctx->pinned_groups, smp_processor_id(),
+					&perf_tracepoint, NULL);
+	for (; event; event = perf_event_groups_next(event, &perf_tracepoint)) {
+		__perf_tp_event_target_task(count, record, regs, data, event);
+		for_each_sibling_event(sibling, event) {
+			__perf_tp_event_target_task(count, record, regs, data, sibling);
+		}
+	}
+
+	event = perf_event_groups_first(&ctx->flexible_groups, smp_processor_id(),
+					&perf_tracepoint, NULL);
+	for (; event; event = perf_event_groups_next(event, &perf_tracepoint)) {
+		__perf_tp_event_target_task(count, record, regs, data, event);
+		for_each_sibling_event(sibling, event) {
+			__perf_tp_event_target_task(count, record, regs, data, sibling);
+		}
+	}
+}
+
 void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
 		   struct pt_regs *regs, struct hlist_head *head, int rctx,
 		   struct task_struct *task)
@@ -9886,29 +9967,15 @@ void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
 	 */
 	if (task && task != current) {
 		struct perf_event_context *ctx;
-		struct trace_entry *entry = record;
 
 		rcu_read_lock();
 		ctx = rcu_dereference(task->perf_event_ctxp);
 		if (!ctx)
 			goto unlock;
 
-		// XXX iterate groups instead, we should be able to
-		// find the subtree for the perf_tracepoint pmu and CPU.
-
-		list_for_each_entry_rcu(event, &ctx->event_list, event_entry) {
-			if (event->cpu != smp_processor_id())
-				continue;
-			if (event->attr.type != PERF_TYPE_TRACEPOINT)
-				continue;
-			if (event->attr.config != entry->type)
-				continue;
-			/* Cannot deliver synchronous signal to other task. */
-			if (event->attr.sigtrap)
-				continue;
-			if (perf_tp_event_match(event, &data, regs))
-				perf_swevent_event(event, count, &data, regs);
-		}
+		raw_spin_lock(&ctx->lock);
+		perf_tp_event_target_task(count, record, regs, &data, ctx);
+		raw_spin_unlock(&ctx->lock);
 unlock:
 		rcu_read_unlock();
 	}
@@ -9917,44 +9984,6 @@ void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
 }
 EXPORT_SYMBOL_GPL(perf_tp_event);
 
-static void tp_perf_event_destroy(struct perf_event *event)
-{
-	perf_trace_destroy(event);
-}
-
-static int perf_tp_event_init(struct perf_event *event)
-{
-	int err;
-
-	if (event->attr.type != PERF_TYPE_TRACEPOINT)
-		return -ENOENT;
-
-	/*
-	 * no branch sampling for tracepoint events
-	 */
-	if (has_branch_stack(event))
-		return -EOPNOTSUPP;
-
-	err = perf_trace_init(event);
-	if (err)
-		return err;
-
-	event->destroy = tp_perf_event_destroy;
-
-	return 0;
-}
-
-static struct pmu perf_tracepoint = {
-	.task_ctx_nr	= perf_sw_context,
-
-	.event_init	= perf_tp_event_init,
-	.add		= perf_trace_add,
-	.del		= perf_trace_del,
-	.start		= perf_swevent_start,
-	.stop		= perf_swevent_stop,
-	.read		= perf_swevent_read,
-};
-
 #if defined(CONFIG_KPROBE_EVENTS) || defined(CONFIG_UPROBE_EVENTS)
 /*
  * Flags in config, used by dynamic PMU kprobe and uprobe

---
