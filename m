Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE4742B0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 19:07:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsPy25SrNz3bmy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 03:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsPxT3p2dz3bVw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 03:06:36 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qEv5m-0004tO-Fr; Thu, 29 Jun 2023 19:06:02 +0200
Message-ID: <90150fe2-e07d-d991-5bab-0a931abda9a3@leemhuis.info>
Date: Thu, 29 Jun 2023 19:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
Content-Language: en-US, de-DE
To: Jiri Slaby <jirislaby@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, akpm@linux-foundation.org
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688058397;2b71bfc6;
X-HE-SMSGID: 1qEv5m-0004tO-Fr
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, Linux kernel regressions list <regressions@lists.linux.dev>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, paulmck@kernel.org, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, vbabka@suse.cz, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, linux-arm-kernel@lists.infradead.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, mgorman@techsingularity.net, kent.overstreet@linux.dev, linux-kern
 el@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 29.06.23 16:40, Jiri Slaby wrote:
> 
> On 27. 02. 23, 18:36, Suren Baghdasaryan wrote:
>> Attempt VMA lock-based page fault handling first, and fall back to the
>> existing mmap_lock-based handling if that fails.
> [...]
>> +    fault = handle_mm_fault(vma, address, flags |
>> FAULT_FLAG_VMA_LOCK, regs);
>> +    vma_end_read(vma);
>> +
>> +    if (!(fault & VM_FAULT_RETRY)) {
>> +        count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>> +        goto done;
>> +    }
>> +    count_vm_vma_lock_event(VMA_LOCK_RETRY);
> 
> This is apparently not strong enough as it causes go build failures like:
> 
> [  409s] strconv
> [  409s] releasep: m=0x579e2000 m->p=0x5781c600 p->m=0x0 p->status=2
> [  409s] fatal error: releasep: invalid p state
> [  409s]
> 
> [  325s] hash/adler32
> [  325s] hash/crc32
> [  325s] cmd/internal/codesign
> [  336s] fatal error: runtime: out of memory
> 
> There are many kinds of similar errors. It happens in 1-3 out of 20
> builds only.
> 
> If I revert the commit on top of 6.4, they all dismiss. Any idea?
> 
> The downstream report:
> https://bugzilla.suse.com/show_bug.cgi?id=1212775
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 0bff0aaea03e2a3ed6bfa3021
https://bugzilla.suse.com/show_bug.cgi?id=1212775
#regzbot title mm: failures when building go in 1-3 out of 20 builds
#regzbot ignore-activity

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
