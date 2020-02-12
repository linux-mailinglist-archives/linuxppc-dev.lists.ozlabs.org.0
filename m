Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB115ADE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 17:58:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hm7g2X4qzDqGQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 03:58:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hm5h51XVzDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 03:57:12 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 08:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; d="scan'208";a="227877504"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 12 Feb 2020 08:57:07 -0800
Received: from [10.252.13.176] (abudanko-mobl.ccr.corp.intel.com
 [10.252.13.176])
 by linux.intel.com (Postfix) with ESMTP id BA161580696;
 Wed, 12 Feb 2020 08:56:56 -0800 (PST)
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Stephen Smalley <sds@tycho.nsa.gov>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
 <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
 <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
 <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
 <d7213569-9578-7201-6106-f5ebc95bd6be@tycho.nsa.gov>
 <2e38c33d-f085-1320-8cc2-45f74b6ad86d@linux.intel.com>
 <dd6a1382-7b2f-a6e6-a1ac-009566d7f556@tycho.nsa.gov>
 <8141da2e-49cf-c02d-69e9-8a7cbdc91431@linux.intel.com>
 <7c367905-e8c9-7665-d923-c850e05c757a@tycho.nsa.gov>
 <280e6644-c129-15f6-ea5c-0f66bf764e0f@tycho.nsa.gov>
From: Alexey Budankov <alexey.budankov@linux.intel.com>
Organization: Intel Corp.
Message-ID: <950cc6a4-5823-d607-1210-6f62c96cf67f@linux.intel.com>
Date: Wed, 12 Feb 2020 19:56:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <280e6644-c129-15f6-ea5c-0f66bf764e0f@tycho.nsa.gov>
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
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andi Kleen <ak@linux.intel.com>, Igor Lubashev <ilubashe@akamai.com>,
 James Morris <jmorris@namei.org>,
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



On 12.02.2020 18:45, Stephen Smalley wrote:
> On 2/12/20 10:21 AM, Stephen Smalley wrote:
>> On 2/12/20 8:53 AM, Alexey Budankov wrote:
>>> On 12.02.2020 16:32, Stephen Smalley wrote:
>>>> On 2/12/20 3:53 AM, Alexey Budankov wrote:
>>>>> Hi Stephen,
>>>>>
>>>>> On 22.01.2020 17:07, Stephen Smalley wrote:
>>>>>> On 1/22/20 5:45 AM, Alexey Budankov wrote:
>>>>>>>
>>>>>>> On 21.01.2020 21:27, Alexey Budankov wrote:
>>>>>>>>
>>>>>>>> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>>>>>>>>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>>>>>>>>> <alexey.budankov@linux.intel.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>>>>>>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>>>>>>>>
>>>>> <SNIP>
>>>>>>>>>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>>>>>>>>>
>>>>>>>>>>> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.
>>>>>>>
>>>>>>> So far so good, I suggest using the simplest version for v6:
>>>>>>>
>>>>>>> static inline bool perfmon_capable(void)
>>>>>>> {
>>>>>>>       return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
>>>>>>> }
>>>>>>>
>>>>>>> It keeps the implementation simple and readable. The implementation is more
>>>>>>> performant in the sense of calling the API - one capable() call for CAP_PERFMON
>>>>>>> privileged process.
>>>>>>>
>>>>>>> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
>>>>>>> but this bloating also advertises and leverages using more secure CAP_PERFMON
>>>>>>> based approach to use perf_event_open system call.
>>>>>>
>>>>>> I can live with that.  We just need to document that when you see both a CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process, try only allowing CAP_PERFMON first and see if that resolves the issue.  We have a similar issue with CAP_DAC_READ_SEARCH versus CAP_DAC_OVERRIDE.
>>>>>
>>>>> I am trying to reproduce this double logging with CAP_PERFMON.
>>>>> I am using the refpolicy version with enabled perf_event tclass [1], in permissive mode.
>>>>> When running perf stat -a I am observing this AVC audit messages:
>>>>>
>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { open } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { kernel } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { cpu } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>> type=AVC msg=audit(1581496695.666:8692): avc:  denied  { write } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>
>>>>> However there is no capability related messages around. I suppose my refpolicy should
>>>>> be modified somehow to observe capability related AVCs.
>>>>>
>>>>> Could you please comment or clarify on how to enable caps related AVCs in order
>>>>> to test the concerned logging.
>>>>
>>>> The new perfmon permission has to be defined in your policy; you'll have a message in dmesg about "Permission perfmon in class capability2 not defined in policy.".  You can either add it to the common cap2 definition in refpolicy/policy/flask/access_vectors and rebuild your policy or extract your base module as CIL, add it there, and insert the updated module.
>>>
>>> Yes, I already have it like this:
>>> common cap2
>>> {
>>> <------>mac_override<--># unused by SELinux
>>> <------>mac_admin
>>> <------>syslog
>>> <------>wake_alarm
>>> <------>block_suspend
>>> <------>audit_read
>>> <------>perfmon
>>> }
>>>
>>> dmesg stopped reporting perfmon as not defined but audit.log still doesn't report CAP_PERFMON denials.
>>> BTW, audit even doesn't report CAP_SYS_ADMIN denials, however perfmon_capable() does check for it.
>>
>> Some denials may be silenced by dontaudit rules; semodule -DB will strip those and semodule -B will restore them.  Other possibility is that the process doesn't have CAP_PERFMON in its effective set and therefore never reaches SELinux at all; denied first by the capability module.
> 
> Also, the fact that your denials are showing up in user_systemd_t suggests that something is off in your policy or userspace/distro; I assume that is a domain type for the systemd --user instance, but your shell and commands shouldn't be running in that domain (user_t would be more appropriate for that).

It is user_t for local terminal session:
ps -Z
LABEL                             PID TTY          TIME CMD
user_u:user_r:user_t            11317 pts/9    00:00:00 bash
user_u:user_r:user_t            11796 pts/9    00:00:00 ps

For local terminal root session:
ps -Z
LABEL                             PID TTY          TIME CMD
user_u:user_r:user_su_t          2926 pts/3    00:00:00 bash
user_u:user_r:user_su_t         10995 pts/3    00:00:00 ps

For remote ssh session:
ps -Z
LABEL                             PID TTY          TIME CMD
user_u:user_r:user_t             7540 pts/8    00:00:00 ps
user_u:user_r:user_systemd_t     8875 pts/8    00:00:00 bash

~Alexey
