Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3A141344
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 22:42:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zvg12MThzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 08:42:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=alexey.budankov@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zvdB26ZZzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 08:41:01 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 13:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="249381111"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2020 13:33:49 -0800
Received: from [10.252.10.77] (abudanko-mobl.ccr.corp.intel.com [10.252.10.77])
 by linux.intel.com (Postfix) with ESMTP id 7E2515803DA;
 Fri, 17 Jan 2020 13:33:38 -0800 (PST)
Subject: Re: [PATCH v4 8/9] drivers/perf: open access for CAP_SYS_PERFMON
 privileged process
To: Will Deacon <will@kernel.org>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <ce3086d8-9fce-84d6-8b4e-948996c2e0fc@linux.intel.com>
 <20200117105153.GB6144@willie-the-truck>
From: Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <dc14cf55-d63e-3565-b366-3a93d54cd588@linux.intel.com>
Date: Sat, 18 Jan 2020 00:33:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117105153.GB6144@willie-the-truck>
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
 Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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


On 17.01.2020 13:51, Will Deacon wrote:
> On Wed, Dec 18, 2019 at 12:30:29PM +0300, Alexey Budankov wrote:
>>
>> Open access to monitoring for CAP_SYS_PERFMON privileged processes.
>> For backward compatibility reasons access to the monitoring remains open
>> for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN usage for secure
>> monitoring is discouraged with respect to CAP_SYS_PERFMON capability.
>>
>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>> ---
>>  drivers/perf/arm_spe_pmu.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 4e4984a55cd1..5dff81bc3324 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -274,7 +274,7 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
>>  	if (!attr->exclude_kernel)
>>  		reg |= BIT(SYS_PMSCR_EL1_E1SPE_SHIFT);
>>  
>> -	if (IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR) && capable(CAP_SYS_ADMIN))
>> +	if (IS_ENABLED(CONFIG_PID_IN_CONTEXTIDR) && perfmon_capable())
>>  		reg |= BIT(SYS_PMSCR_EL1_CX_SHIFT);
>>  
>>  	return reg;
>> @@ -700,7 +700,7 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>  		return -EOPNOTSUPP;
>>  
>>  	reg = arm_spe_event_to_pmscr(event);
>> -	if (!capable(CAP_SYS_ADMIN) &&
>> +	if (!perfmon_capable() &&
>>  	    (reg & (BIT(SYS_PMSCR_EL1_PA_SHIFT) |
>>  		    BIT(SYS_PMSCR_EL1_CX_SHIFT) |
>>  		    BIT(SYS_PMSCR_EL1_PCT_SHIFT))))
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Worth noting that this allows profiling of *physical* addresses used by
> memory access instructions and so probably has some security implications
> beyond the usual "but perf is buggy" line of reasoning.

Good to know. Thank you!
The data on physical addresses used by memory access instructions can already be
provided under CAP_SYS_ADMIN privileges [1] thus, I suppose, any implications you
have mentioned are already in place. I believe providing the data under CAP_PERFMON
alone without the rest of CAP_SYS_ADMIN credentials decreases chances to misuse the
data for harm and makes the monitoring more secure.

~Alexey

[1] https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html

> 
> Will
> 
