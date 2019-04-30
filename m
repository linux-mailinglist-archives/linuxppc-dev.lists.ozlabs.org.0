Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBAFE84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 19:11:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tp2r56fqzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 03:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44tp1L31jHzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 03:09:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B845374;
 Tue, 30 Apr 2019 10:09:55 -0700 (PDT)
Received: from [10.1.196.42] (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66A103F5C1;
 Tue, 30 Apr 2019 10:09:52 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] x86: clean up _TIF_SYSCALL_EMU handling using
 ptrace_syscall_enter hook
To: Andy Lutomirski <luto@kernel.org>
References: <20190318104925.16600-1-sudeep.holla@arm.com>
 <20190318104925.16600-4-sudeep.holla@arm.com>
 <CALCETrXEebRqX0W8MuS0SeaMDpEO5KdS3k7id279hZgHrmc8yA@mail.gmail.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Organization: ARM
Message-ID: <a1de9e18-95f6-c9a4-0d60-9f61b5a2f108@arm.com>
Date: Tue, 30 Apr 2019 18:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALCETrXEebRqX0W8MuS0SeaMDpEO5KdS3k7id279hZgHrmc8yA@mail.gmail.com>
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
Cc: Haibo Xu <haibo.xu@arm.com>, Steve Capper <Steve.Capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jeff Dike <jdike@addtoit.com>,
 X86 ML <x86@kernel.org>, Will Deacon <will.deacon@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Bin Lu <bin.lu@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/04/2019 17:46, Andy Lutomirski wrote:
> On Mon, Mar 18, 2019 at 3:49 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>>
>> Now that we have a new hook ptrace_syscall_enter that can be called from
>> syscall entry code and it handles PTRACE_SYSEMU in generic code, we
>> can do some cleanup using the same in syscall_trace_enter.
>>
>> Further the extra logic to find single stepping PTRACE_SYSEMU_SINGLESTEP
>> in syscall_slow_exit_work seems unnecessary. Let's remove the same.
>>
> 
> Unless the patch set contains a selftest that exercises all the
> interesting cases here, NAK.  To be clear, there needs to be a test
> that passes on an unmodified kernel and still passes on a patched
> kernel.  And that test case needs to *fail* if, for example, you force
> "emulated" to either true or false rather than reading out the actual
> value.
> 

Tested using tools/testing/selftests/x86/ptrace_syscall.c

Also v3 doesn't change any logic or additional call to new function as
in v2. It's just simple cleanup as suggested by Oleg.

-- 
Regards,
Sudeep
