Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781B135827
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 12:39:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tkfK5cVDzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 22:39:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=alexey.budankov@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tkc13YYzzDqY6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 22:37:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 03:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; d="scan'208";a="216275607"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 09 Jan 2020 03:36:59 -0800
Received: from [10.125.253.127] (abudanko-mobl.ccr.corp.intel.com
 [10.125.253.127])
 by linux.intel.com (Postfix) with ESMTP id 2707C58043A;
 Thu,  9 Jan 2020 03:36:50 -0800 (PST)
Subject: Re: [PATCH v4 2/9] perf/core: open access for CAP_SYS_PERFMON
 privileged process
To: Peter Zijlstra <peterz@infradead.org>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <c93309dc-b920-f5fa-f997-e8b2faf47b88@linux.intel.com>
 <20200108160713.GI2844@hirez.programming.kicks-ass.net>
From: Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <cc239899-5c52-2fd0-286d-4bff18877937@linux.intel.com>
Date: Thu, 9 Jan 2020 14:36:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200108160713.GI2844@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Song Liu <songliubraving@fb.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 08.01.2020 19:07, Peter Zijlstra wrote:
> On Wed, Dec 18, 2019 at 12:25:35PM +0300, Alexey Budankov wrote:
>>
>> Open access to perf_events monitoring for CAP_SYS_PERFMON privileged
>> processes. For backward compatibility reasons access to perf_events
>> subsystem remains open for CAP_SYS_ADMIN privileged processes but
>> CAP_SYS_ADMIN usage for secure perf_events monitoring is discouraged
>> with respect to CAP_SYS_PERFMON capability.
>>
>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>> ---
>>  include/linux/perf_event.h | 6 +++---
>>  kernel/events/core.c       | 6 +++---
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index 34c7c6910026..f46acd69425f 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -1285,7 +1285,7 @@ static inline int perf_is_paranoid(void)
>>  
>>  static inline int perf_allow_kernel(struct perf_event_attr *attr)
>>  {
>> -	if (sysctl_perf_event_paranoid > 1 && !capable(CAP_SYS_ADMIN))
>> +	if (sysctl_perf_event_paranoid > 1 && !perfmon_capable())
>>  		return -EACCES;
>>  
>>  	return security_perf_event_open(attr, PERF_SECURITY_KERNEL);
>> @@ -1293,7 +1293,7 @@ static inline int perf_allow_kernel(struct perf_event_attr *attr)
>>  
>>  static inline int perf_allow_cpu(struct perf_event_attr *attr)
>>  {
>> -	if (sysctl_perf_event_paranoid > 0 && !capable(CAP_SYS_ADMIN))
>> +	if (sysctl_perf_event_paranoid > 0 && !perfmon_capable())
>>  		return -EACCES;
>>  
>>  	return security_perf_event_open(attr, PERF_SECURITY_CPU);
>> @@ -1301,7 +1301,7 @@ static inline int perf_allow_cpu(struct perf_event_attr *attr)
>>  
>>  static inline int perf_allow_tracepoint(struct perf_event_attr *attr)
>>  {
>> -	if (sysctl_perf_event_paranoid > -1 && !capable(CAP_SYS_ADMIN))
>> +	if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
>>  		return -EPERM;
>>  
>>  	return security_perf_event_open(attr, PERF_SECURITY_TRACEPOINT);
> 
> These are OK I suppose.
> 
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 059ee7116008..d9db414f2197 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -9056,7 +9056,7 @@ static int perf_kprobe_event_init(struct perf_event *event)
>>  	if (event->attr.type != perf_kprobe.type)
>>  		return -ENOENT;
>>  
>> -	if (!capable(CAP_SYS_ADMIN))
>> +	if (!perfmon_capable())
>>  		return -EACCES;
>>  
>>  	/*
> 
> This one only allows attaching to already extant kprobes, right? It does
> not allow creation of kprobes.

This unblocks creation of local trace kprobes and uprobes by CAP_SYS_PERFMON 
privileged process, exactly the same as for CAP_SYS_ADMIN privileged process.

> 
>> @@ -9116,7 +9116,7 @@ static int perf_uprobe_event_init(struct perf_event *event)
>>  	if (event->attr.type != perf_uprobe.type)
>>  		return -ENOENT;
>>  
>> -	if (!capable(CAP_SYS_ADMIN))
>> +	if (!perfmon_capable())
>>  		return -EACCES;
>>  
>>  	/*
> 
> Idem, I presume.
> 
>> @@ -11157,7 +11157,7 @@ SYSCALL_DEFINE5(perf_event_open,
>>  	}
>>  
>>  	if (attr.namespaces) {
>> -		if (!capable(CAP_SYS_ADMIN))
>> +		if (!perfmon_capable())
>>  			return -EACCES;
>>  	}
> 
> And given we basically make the entire kernel observable with this CAP,
> busting namespaces shoulnd't be a problem either.
> 
> So yeah, I suppose that works.
> 
