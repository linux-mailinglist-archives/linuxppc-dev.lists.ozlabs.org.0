Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8614531D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 11:48:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482hwB2FkGzDqNr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 21:48:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=alexey.budankov@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482hs53SXQzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 21:46:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 02:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,349,1574150400"; d="scan'208";a="275571986"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2020 02:45:53 -0800
Received: from [10.125.253.5] (abudanko-mobl.ccr.corp.intel.com [10.125.253.5])
 by linux.intel.com (Postfix) with ESMTP id E79D15803C5;
 Wed, 22 Jan 2020 02:45:46 -0800 (PST)
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
From: Alexey Budankov <alexey.budankov@linux.intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Stephen Smalley <sds@tycho.nsa.gov>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
 <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
 <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
Organization: Intel Corp.
Message-ID: <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
Date: Wed, 22 Jan 2020 13:45:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
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
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Andy Lutomirski <luto@amacapital.net>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 21.01.2020 21:27, Alexey Budankov wrote:
> 
> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>> <alexey.budankov@linux.intel.com> wrote:
>>>
>>>
>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>
>>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>>> monitoring and observability operations so that CAP_PERFMON would assist
>>>>> CAP_SYS_ADMIN capability in its governing role for perf_events, i915_perf
>>>>> and other performance monitoring and observability subsystems.
>>>>>
>>>>> CAP_PERFMON intends to harden system security and integrity during system
>>>>> performance monitoring and observability operations by decreasing attack
>>>>> surface that is available to a CAP_SYS_ADMIN privileged process [1].
>>>>> Providing access to system performance monitoring and observability
>>>>> operations under CAP_PERFMON capability singly, without the rest of
>>>>> CAP_SYS_ADMIN credentials, excludes chances to misuse the credentials and
>>>>> makes operation more secure.
>>>>>
>>>>> CAP_PERFMON intends to take over CAP_SYS_ADMIN credentials related to
>>>>> system performance monitoring and observability operations and balance
>>>>> amount of CAP_SYS_ADMIN credentials following the recommendations in the
>>>>> capabilities man page [1] for CAP_SYS_ADMIN: "Note: this capability is
>>>>> overloaded; see Notes to kernel developers, below."
>>>>>
>>>>> Although the software running under CAP_PERFMON can not ensure avoidance
>>>>> of related hardware issues, the software can still mitigate these issues
>>>>> following the official embargoed hardware issues mitigation procedure [2].
>>>>> The bugs in the software itself could be fixed following the standard
>>>>> kernel development process [3] to maintain and harden security of system
>>>>> performance monitoring and observability operations.
>>>>>
>>>>> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>>>>> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>>>>> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
>>>>>
>>>>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>>>>> ---
>>>>>   include/linux/capability.h          | 12 ++++++++++++
>>>>>   include/uapi/linux/capability.h     |  8 +++++++-
>>>>>   security/selinux/include/classmap.h |  4 ++--
>>>>>   3 files changed, 21 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/capability.h b/include/linux/capability.h
>>>>> index ecce0f43c73a..8784969d91e1 100644
>>>>> --- a/include/linux/capability.h
>>>>> +++ b/include/linux/capability.h
>>>>> @@ -251,6 +251,18 @@ extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct
>>>>>   extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
>>>>>   extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
>>>>>   extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
>>>>> +static inline bool perfmon_capable(void)
>>>>> +{
>>>>> +    struct user_namespace *ns = &init_user_ns;
>>>>> +
>>>>> +    if (ns_capable_noaudit(ns, CAP_PERFMON))
>>>>> +        return ns_capable(ns, CAP_PERFMON);
>>>>> +
>>>>> +    if (ns_capable_noaudit(ns, CAP_SYS_ADMIN))
>>>>> +        return ns_capable(ns, CAP_SYS_ADMIN);
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>
>>>> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.

So far so good, I suggest using the simplest version for v6:

static inline bool perfmon_capable(void)
{
	return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
}

It keeps the implementation simple and readable. The implementation is more
performant in the sense of calling the API - one capable() call for CAP_PERFMON
privileged process.

Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
but this bloating also advertises and leverages using more secure CAP_PERFMON
based approach to use perf_event_open system call.

~Alexey

>>>
>>> Some of ideas from v4 review.
>>
>> well, in the requested changes form v4 I wrote:
>> return capable(CAP_PERFMON);
>> instead of
>> return false;
> 
> Aww, indeed. I was concerning exactly about it when updating the patch
> and simply put false, missing the fact that capable() also logs.
> 
> I suppose the idea is originally from here [1].
> BTW, Has it already seen any _more optimal_ implementation?
> Anyway, original or optimized version could be reused for CAP_PERFMON.
> 
> ~Alexey
> 
> [1] https://patchwork.ozlabs.org/patch/1159243/
> 
>>
>> That's what Andy suggested earlier for CAP_BPF.
>> I think that should resolve Stephen's concern.
>>
