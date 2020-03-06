Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E55917BE8A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 14:32:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YpTF1TdszDqW9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 00:32:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=p2OXCD56; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YpQN2pWTzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 00:30:18 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id j7so880820plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 05:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8fDPVkQKf/tmhi93KvvaGfhBbVlXTJ5zTqFQYzbKjFg=;
 b=p2OXCD56+llk60BiLPCPrMq2W4rbwQZUY0qSSBIwse5CuOzrKPbk8jmhlhq9h6IPY1
 sA+KtUeIXrwJOUN6kfZY4RMH5Ehvuxf+WXwinp8lCHVoDC3TGMEFuGzdIyc2yqANJBFd
 pWPnEEb3NIbZycqS5lJEfEx3Pd3ZQVuww0QTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8fDPVkQKf/tmhi93KvvaGfhBbVlXTJ5zTqFQYzbKjFg=;
 b=cy+tE1gWjBO1+cqlC/IdidqOeYCBZ4/4a4ZNiF6uNqY00GTW41TBf6HuIQMBDaWUMj
 ryP6gQDmuYUJoR9BD9qyiTcswu8LjEIjTpBe/xF+3kRmlwtXMfFYLiiLY47XCzUUtRNq
 oQrQ0Q+j6g+VKB/sJk0/9V/Vb6MflAm4dActXAoZS0NG46UP19wUZBejpJNdGGzP+TNH
 78JVvj5J7jaHfcgytOJDf9TDoRuyvzcrcKpHJfizWKik0hzsNosupSGGFEh+GLaOsPHt
 ssc72kBilyG7+9yt+AScebwiybYteX8v6EfKdzgbeWgrgiB6NPjRv1NYBw4wcLBCF1+b
 CAWA==
X-Gm-Message-State: ANhLgQ37C7M3Qj9MrO2LOcK6I8Ym+YPLK5KMJFLsxeEa0/xCLXnqw2hn
 PpC3NOQ5+K2xQ+/WDouLWYHzHg==
X-Google-Smtp-Source: ADFU+vvk6wtb6F7vqnCO7Rd6pA+u9zP5PHQ/ajFF38MU0kOL7MyFnmfiY8Cq0O2d1VzsXktK80nP4Q==
X-Received: by 2002:a17:90a:c38e:: with SMTP id
 h14mr3635476pjt.98.1583501414648; 
 Fri, 06 Mar 2020 05:30:14 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-b120-f113-a8cb-35fd.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b120:f113:a8cb:35fd])
 by smtp.gmail.com with ESMTPSA id h12sm19638863pfk.124.2020.03.06.05.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:30:13 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
In-Reply-To: <18e9cbdf-6056-e922-4bed-d8a3a205b2d3@linux.ibm.com>
References: <20200306073000.9491-1-dja@axtens.net>
 <18e9cbdf-6056-e922-4bed-d8a3a205b2d3@linux.ibm.com>
Date: Sat, 07 Mar 2020 00:30:10 +1100
Message-ID: <87tv31pq59.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On 6/3/20 6:30 pm, Daniel Axtens wrote:
>> kcov instrumentation is collected the __sanitizer_cov_trace_pc hook in
>> kernel/kcov.c. The compiler inserts these hooks into every basic block
>> unless kcov is disabled for that file.
>>=20
>> We then have a deep call-chain:
>>   - __sanitizer_cov_trace_pc calls to check_kcov_mode()
>>   - check_kcov_mode() (kernel/kcov.c) calls in_task()
>>   - in_task() (include/linux/preempt.h) calls preempt_count().
>>   - preempt_count() (include/asm-generic/preempt.h) calls
>>       current_thread_info()
>>   - because powerpc has THREAD_INFO_IN_TASK, current_thread_info()
>>       (include/linux/thread_info.h) is defined to 'current'
>>   - current (arch/powerpc/include/asm/current.h) is defined to
>>       get_current().
>>   - get_current (same file) loads an offset of r13.
>>   - arch/powerpc/include/asm/paca.h makes r13 a register variable
>>       called local_paca - it is the PACA for the current CPU, so
>>       this has the effect of loading the current task from PACA.
>>   - get_current returns the current task from PACA,
>>   - current_thread_info returns the task cast to a thread_info
>>   - preempt_count dereferences the thread_info to load preempt_count
>>   - that value is used by in_task and so on up the chain
>>=20
>> The problem is:
>>=20
>>   - kcov instrumentation is enabled for arch/powerpc/kernel/dt_cpu_ftrs.c
>>=20
>>   - even if it were not, dt_cpu_ftrs_init calls generic dt parsing code
>>     which should definitely have instrumentation enabled.
>>=20
>>   - setup_64.c calls dt_cpu_ftrs_init before it sets up a PACA.
>>=20
>>   - If we don't set up a paca, r13 will contain unpredictable data.
>>=20
>>   - In a zImage compiled with kcov and KASAN, we see r13 containing a va=
lue
>>     that leads to dereferencing invalid memory (something like
>>     912a72603d420015).
>>=20
>>   - Weirdly, the same kernel as a vmlinux loaded directly by qemu does n=
ot
>>     crash. Investigating with gdb, it seems that in the vmlinux boot cas=
e,
>>     r13 is near enough to zero that we just happen to be able to read th=
at
>>     part of memory (we're operating with translation off at this point) =
and
>>     the current pointer also happens to land in readable memory and
>>     everything just works.
>>=20
>>   - PACA setup refers to CPU features - setup_paca() looks at
>>     early_cpu_has_feature(CPU_FTR_HVMODE)
>>=20
>> There's no generic kill switch for kcov (as far as I can tell), and we
>> don't want to have to turn off instrumentation in the generic dt parsing
>> code (which lives outside arch/powerpc/) just because we don't have a re=
al
>> paca or task yet.
>>=20
>> So:
>>   - change the test when setting up a PACA to consider the actual value =
of
>>     the MSR rather than the CPU feature.
>>=20
>>   - move the PACA setup to before the cpu feature parsing.
>>=20
>> Translations get switched on once we leave early_setup, so I think we'd
>> already catch any other cases where the PACA or task aren't set up.
>>=20
>> Boot tested on a P9 guest and host.
>>=20
>> Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
>> Cc: Andrew Donnellan <ajd@linux.ibm.com>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>=20
>> ---
>>=20
>> Regarding moving the comment about printk()-safety:
>> I am about 75% sure that the thing that makes printk() safe is the PACA,
>> not the CPU features. That's what commit 24d9649574fb ("[POWERPC] Docume=
nt
>> when printk is useable") seems to indicate, but as someone wise recently
>> told me, "bootstrapping is hard", so I may be totally wrong.
>>=20
>> v3: Update comment, thanks Christophe Leroy.
>>      Remove a comment in dt_cpu_ftrs.c that is no longer accurate - than=
ks
>>        Andrew. I think we want to retain all the code still, but I'm ope=
n to
>>        being told otherwise.
>
> Thanks for doing that.
>
> This patch and the justification doesn't seem obviously wrong, and is=20
> snowpatch-clean.
>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
>
> (Is it worth cc'ing this to stable in case there are other situations we=
=20
> haven't foreseen where we hit the unpredictable r13 data? Few people use=
=20
> kcov...)

I did briefly consider it but didn't believe it reached the stable
criteria:

| It must fix a real bug that bothers people (not a, =E2=80=9CThis could be=
 a
| problem...=E2=80=9D type thing).

On reflection it's a real bug (boot hang), it bothers me, and presumably
also you due to the syzkaller interaction, and I am led to believe we
are both people, so I guess I'll do a v3 with cc: stable. Thanks!

Regards,
Daniel

>
> --=20
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
