Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC58394706
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 20:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsCrR67T0z2ymR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 04:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsCr15j6Fz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 04:28:47 +1000 (AEST)
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1lmgwN-0005jM-Ee; Fri, 28 May 2021 20:10:35 +0200
Received: from [85.7.101.30] (helo=linux.home)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1lmgwN-000BQv-4m; Fri, 28 May 2021 20:10:35 +0200
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Paul Moore <paul@paul-moore.com>
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
Date: Fri, 28 May 2021 20:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.2/26184/Fri May 28 13:05:50 2021)
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
Cc: jolsa@redhat.com, selinux@vger.kernel.org, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>,
 linux-security-module@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/28/21 5:47 PM, Paul Moore wrote:
> On Fri, May 28, 2021 at 3:10 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
>> On 5/28/21 3:37 AM, Paul Moore wrote:
>>> On Mon, May 17, 2021 at 5:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>>>>
>>>> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
>>>> lockdown") added an implementation of the locked_down LSM hook to
>>>> SELinux, with the aim to restrict which domains are allowed to perform
>>>> operations that would breach lockdown.
>>>>
>>>> However, in several places the security_locked_down() hook is called in
>>>> situations where the current task isn't doing any action that would
>>>> directly breach lockdown, leading to SELinux checks that are basically
>>>> bogus.
>>>>
>>>> Since in most of these situations converting the callers such that
>>>> security_locked_down() is called in a context where the current task
>>>> would be meaningful for SELinux is impossible or very non-trivial (and
>>>> could lead to TOCTOU issues for the classic Lockdown LSM
>>>> implementation), fix this by modifying the hook to accept a struct cred
>>>> pointer as argument, where NULL will be interpreted as a request for a
>>>> "global", task-independent lockdown decision only. Then modify SELinux
>>>> to ignore calls with cred == NULL.
>>>
>>> I'm not overly excited about skipping the access check when cred is
>>> NULL.  Based on the description and the little bit that I've dug into
>>> thus far it looks like using SECINITSID_KERNEL as the subject would be
>>> much more appropriate.  *Something* (the kernel in most of the
>>> relevant cases it looks like) is requesting that a potentially
>>> sensitive disclosure be made, and ignoring it seems like the wrong
>>> thing to do.  Leaving the access control intact also provides a nice
>>> avenue to audit these requests should users want to do that.
>>
>> I think the rationale/workaround for ignoring calls with cred == NULL (or the previous
>> patch with the unimplemented hook) from Ondrej was two-fold, at least speaking for his
>> seen tracing cases:
>>
>>     i) The audit events that are triggered due to calls to security_locked_down()
>>        can OOM kill a machine, see below details [0].
>>
>>    ii) It seems to be causing a deadlock via slow_avc_audit() -> audit_log_end()
>>        when presumingly trying to wake up kauditd [1].
>>
>> How would your suggestion above solve both i) and ii)?
> 
> First off, a bit of general commentary - I'm not sure if Ondrej was
> aware of this, but info like that is good to have in the commit
> description.  Perhaps it was in the linked RHBZ but I try not to look
> at those when reviewing patches; the commit descriptions must be
> self-sufficient since we can't rely on the accessibility or the
> lifetime of external references.  It's fine if people want to include
> external links in their commits, I would actually even encourage it in
> some cases, but the links shouldn't replace a proper description of
> the problem and why the proposed solution is The Best Solution.
> 
> With that out of the way, it sounds like your issue isn't so much the
> access check, but rather the frequency of the access denials and the
> resulting audit records in your particular use case.  My initial
> reaction is that you might want to understand why you are getting so
> many SELinux access denials, your loaded security policy clearly does
> not match with your intended use :)  Beyond that, if you want to
> basically leave things as-is but quiet the high frequency audit
> records that result from these SELinux denials you might want to look
> into the SELinux "dontaudit" policy rule, it was created for things
> like this.  Some info can be found in The SELinux Notebook, relevant
> link below:
> 
> * https://github.com/SELinuxProject/selinux-notebook/blob/main/src/avc_rules.md#dontaudit
> 
> The deadlock issue that was previously reported remains an open case
> as far as I'm concerned; I'm presently occupied trying to sort out a
> rather serious issue with respect to io_uring and LSM/audit (plus
> general stuff at $DAYJOB) so I haven't had time to investigate this
> any further.  Of course anyone else is welcome to dive into it (I
> always want to encourage this, especially from "performance people"
> who just want to shut it all off), however if the answer is basically
> "disable LSM and/or audit checks" you have to know that it is going to
> result in a high degree of skepticism from me, so heavy documentation
> on why it is The Best Solution would be a very good thing :)  Beyond
> that, I think the suggestions above of "why do you have so many policy
> denials?" and "have you looked into dontaudit?" are solid places to
> look for a solution in your particular case.
> 
>>>> Since most callers will just want to pass current_cred() as the cred
>>>> parameter, rename the hook to security_cred_locked_down() and provide
>>>> the original security_locked_down() function as a simple wrapper around
>>>> the new hook.
>>
>> [...]
>>>
>>>> 3. kernel/trace/bpf_trace.c:bpf_probe_read_kernel{,_str}_common()
>>>>        Called when a BPF program calls a helper that could leak kernel
>>>>        memory. The task context is not relevant here, since the program
>>>>        may very well be run in the context of a different task than the
>>>>        consumer of the data.
>>>>        See: https://bugzilla.redhat.com/show_bug.cgi?id=1955585
>>>
>>> The access control check isn't so much who is consuming the data, but
>>> who is requesting a potential violation of a "lockdown", yes?  For
>>> example, the SELinux policy rule for the current lockdown check looks
>>> something like this:
>>>
>>>     allow <who> <who> : lockdown { <reason> };
>>>
>>> It seems to me that the task context is relevant here and performing
>>> the access control check based on the task's domain is correct.
>>
>> This doesn't make much sense to me, it's /not/ the task 'requesting a potential
>> violation of a "lockdown"', but rather the running tracing program which is e.g.
>> inspecting kernel data structures around the triggered event. If I understood
>> you correctly, having an 'allow' check on, say, httpd would be rather odd since
>> things like perf/bcc/bpftrace/systemtap/etc is installing the tracing probe instead.
>>
>> Meaning, if we would /not/ trace such events (like in the prior mentioned syscall
>> example), then there is also no call to the security_locked_down() from that same/
>> unmodified application.
> 
> My turn to say that you don't make much sense to me :)
> 
> Let's reset.

Sure, yep, lets shortly take one step back. :)

> What task_struct is running the BPF tracing program which is calling
> into security_locked_down()?  My current feeling is that it is this
> context/domain/cred that should be used for the access control check;
> in the cases where it is a kernel thread, I think passing NULL is
> reasonable, but I think the proper thing for SELinux is to interpret
> NULL as kernel_t.

If this was a typical LSM hook and, say, your app calls into bind(2) where
we then invoke security_socket_bind() and check 'current' task, then I'm all
with you, because this was _explicitly initiated_ by the httpd app, so that
allow/deny policy belongs in the context of httpd.

In the case of tracing, it's different. You install small programs that are
triggered when certain events fire. Random example from bpftrace's README [0],
you want to generate a histogram of syscall counts by program. One-liner is:

   bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'

bpftrace then goes and generates a BPF prog from this internally. One way of
doing it could be to call bpf_get_current_task() helper and then access
current->comm via one of bpf_probe_read_kernel{,_str}() helpers. So the
program itself has nothing to do with httpd or any other random app doing
a syscall here. The BPF prog _explicitly initiated_ the lockdown check.
The allow/deny policy belongs in the context of bpftrace: meaning, you want
to grant bpftrace access to use these helpers, but other tracers on the
systems like my_random_tracer not. While this works for prior mentioned
cases of security_locked_down() with open_kcore() for /proc/kcore access
or the module_sig_check(), it is broken for tracing as-is, and the patch
I sent earlier fixes this.

Thanks,
Daniel

   [0] https://github.com/iovisor/bpftrace
