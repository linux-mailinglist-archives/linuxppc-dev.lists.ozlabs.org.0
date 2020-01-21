Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7B14434C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 18:32:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482Fww5LNdzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 04:32:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 482Fv647CzzDq9C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 04:31:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="221768046"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2020 09:31:04 -0800
Received: from [10.252.13.111] (iganakov-mobl1.ger.corp.intel.com
 [10.252.13.111])
 by linux.intel.com (Postfix) with ESMTP id 874B25803C5;
 Tue, 21 Jan 2020 09:30:55 -0800 (PST)
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Stephen Smalley <sds@tycho.nsa.gov>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Serge Hallyn <serge@hallyn.com>,
 James Morris <jmorris@namei.org>, Will Deacon <will.deacon@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Robert Richter <rric@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
From: Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
Date: Tue, 21 Jan 2020 20:30:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
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
Cc: Song Liu <songliubraving@fb.com>, Andi Kleen <ak@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, oprofile-list@lists.sf.net,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Olsa <jolsa@redhat.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 21.01.2020 17:43, Stephen Smalley wrote:
> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>
>> Introduce CAP_PERFMON capability designed to secure system performance
>> monitoring and observability operations so that CAP_PERFMON would assist
>> CAP_SYS_ADMIN capability in its governing role for perf_events, i915_perf
>> and other performance monitoring and observability subsystems.
>>
>> CAP_PERFMON intends to harden system security and integrity during system
>> performance monitoring and observability operations by decreasing attack
>> surface that is available to a CAP_SYS_ADMIN privileged process [1].
>> Providing access to system performance monitoring and observability
>> operations under CAP_PERFMON capability singly, without the rest of
>> CAP_SYS_ADMIN credentials, excludes chances to misuse the credentials and
>> makes operation more secure.
>>
>> CAP_PERFMON intends to take over CAP_SYS_ADMIN credentials related to
>> system performance monitoring and observability operations and balance
>> amount of CAP_SYS_ADMIN credentials following the recommendations in the
>> capabilities man page [1] for CAP_SYS_ADMIN: "Note: this capability is
>> overloaded; see Notes to kernel developers, below."
>>
>> Although the software running under CAP_PERFMON can not ensure avoidance
>> of related hardware issues, the software can still mitigate these issues
>> following the official embargoed hardware issues mitigation procedure [2].
>> The bugs in the software itself could be fixed following the standard
>> kernel development process [3] to maintain and harden security of system
>> performance monitoring and observability operations.
>>
>> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
>>
>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>> ---
>>   include/linux/capability.h          | 12 ++++++++++++
>>   include/uapi/linux/capability.h     |  8 +++++++-
>>   security/selinux/include/classmap.h |  4 ++--
>>   3 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/capability.h b/include/linux/capability.h
>> index ecce0f43c73a..8784969d91e1 100644
>> --- a/include/linux/capability.h
>> +++ b/include/linux/capability.h
>> @@ -251,6 +251,18 @@ extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct
>>   extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
>>   extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
>>   extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
>> +static inline bool perfmon_capable(void)
>> +{
>> +    struct user_namespace *ns = &init_user_ns;
>> +
>> +    if (ns_capable_noaudit(ns, CAP_PERFMON))
>> +        return ns_capable(ns, CAP_PERFMON);
>> +
>> +    if (ns_capable_noaudit(ns, CAP_SYS_ADMIN))
>> +        return ns_capable(ns, CAP_SYS_ADMIN);
>> +
>> +    return false;
>> +}
> 
> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.

Some of ideas from v4 review.
Well, on the second sight, it defenitly should be logged for CAP_SYS_ADMIN.
Probably it is not so fatal for CAP_PERFMON, but personally 
I would unconditionally log it for CAP_PERFMON as well.
Good catch, thank you.

~Alexey
