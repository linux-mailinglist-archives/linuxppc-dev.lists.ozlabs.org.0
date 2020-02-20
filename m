Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86D165E56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 14:09:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NZgG6T09zDqSj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 00:09:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NZZh71FXzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 00:05:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 05:05:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,464,1574150400"; d="scan'208";a="283399590"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Feb 2020 05:05:21 -0800
Received: from [10.125.252.166] (abudanko-mobl.ccr.corp.intel.com
 [10.125.252.166])
 by linux.intel.com (Postfix) with ESMTP id 253CC580472;
 Thu, 20 Feb 2020 05:05:12 -0800 (PST)
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
From: Alexey Budankov <alexey.budankov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Stephen Smalley
 <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 James Morris <jmorris@namei.org>
References: <875zgizkyk.fsf@nanos.tec.linutronix.de>
 <7d6f4210-423f-e454-3910-9f8e17dff1aa@linux.intel.com>
Organization: Intel Corp.
Message-ID: <95aa57e6-4d78-39df-386c-a98734f19777@linux.intel.com>
Date: Thu, 20 Feb 2020 16:05:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7d6f4210-423f-e454-3910-9f8e17dff1aa@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Paul Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andi Kleen <ak@linux.intel.com>, Igor Lubashev <ilubashe@akamai.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Robert Richter <rric@kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Stephane Eranian <eranian@google.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 07.02.2020 16:39, Alexey Budankov wrote:
> 
> On 07.02.2020 14:38, Thomas Gleixner wrote:
>> Alexey Budankov <alexey.budankov@linux.intel.com> writes:
>>> On 22.01.2020 17:25, Alexey Budankov wrote:
>>>> On 22.01.2020 17:07, Stephen Smalley wrote:
>>>>>> It keeps the implementation simple and readable. The implementation is more
>>>>>> performant in the sense of calling the API - one capable() call for CAP_PERFMON
>>>>>> privileged process.
>>>>>>
>>>>>> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
>>>>>> but this bloating also advertises and leverages using more secure CAP_PERFMON
>>>>>> based approach to use perf_event_open system call.
>>>>>
>>>>> I can live with that.  We just need to document that when you see
>>>>> both a CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process,
>>>>> try only allowing CAP_PERFMON first and see if that resolves the
>>>>> issue.  We have a similar issue with CAP_DAC_READ_SEARCH versus
>>>>> CAP_DAC_OVERRIDE.
>>>>
>>>> perf security [1] document can be updated, at least, to align and document 
>>>> this audit logging specifics.
>>>
>>> And I plan to update the document right after this patch set is accepted.
>>> Feel free to let me know of the places in the kernel docs that also
>>> require update w.r.t CAP_PERFMON extension.
>>
>> The documentation update wants be part of the patch set and not planned
>> to be done _after_ the patch set is merged.
> 
> Well, accepted. It is going to make patches #11 and beyond.

Patches #11 and #12 of v7 [1] contain information on CAP_PERFMON intention and usage.
Patch for man-pages [2] extends perf_event_open.2 documentation.

Thanks,
Alexey

---
[1] https://lore.kernel.org/lkml/c8de937a-0b3a-7147-f5ef-69f467e87a13@linux.intel.com/
[2] https://lore.kernel.org/lkml/18d1083d-efe5-f5f8-c531-d142c0e5c1a8@linux.intel.com/

