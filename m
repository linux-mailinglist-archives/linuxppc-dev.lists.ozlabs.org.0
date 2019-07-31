Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A68247C3A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 15:35:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zDvM214SzDqb1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 23:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zBnm41L7zDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 22:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45zBnm180Pz9sN4;
 Wed, 31 Jul 2019 22:00:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bug 204371] BUG kmalloc-4k (Tainted: G W ): Object padding
 overwritten
In-Reply-To: <bug-204371-206035-O9m4mwJN9f@https.bugzilla.kernel.org/>
References: <bug-204371-206035@https.bugzilla.kernel.org/>
 <bug-204371-206035-O9m4mwJN9f@https.bugzilla.kernel.org/>
Date: Wed, 31 Jul 2019 22:00:27 +1000
Message-ID: <878ssequqs.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

bugzilla-daemon@bugzilla.kernel.org writes:

> https://bugzilla.kernel.org/show_bug.cgi?id=204371
>
> --- Comment #2 from Andrew Morton (akpm@linux-foundation.org) ---
> (switched to email.  Please respond via emailed reply-to-all, not via the
> bugzilla web interface).
>
>
> On Mon, 29 Jul 2019 22:35:48 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:
>
>> https://bugzilla.kernel.org/show_bug.cgi?id=204371
>> 
>>             Bug ID: 204371
>>            Summary: BUG kmalloc-4k (Tainted: G        W        ): Object
>>                     padding overwritten
>>            Product: Memory Management
>>            Version: 2.5
>>     Kernel Version: 5.3.0-rc2
>>           Hardware: PPC-32
>>                 OS: Linux
>>               Tree: Mainline
>>             Status: NEW
>>           Severity: normal
>>           Priority: P1
>>          Component: Slab Allocator
>>           Assignee: akpm@linux-foundation.org
>>           Reporter: erhard_f@mailbox.org
>>         Regression: No
>
> cc'ing various people here.
>
> I suspect proc_cgroup_show() is innocent and that perhaps
> bpf_prepare_filter() had a memory scribble.  iirc there has been at
> least one recent pretty serious bpf fix applied recently.  Can others
> please take a look?

I haven't been able to reproduce this on a 64-bit or 32-bit powerpc
machine here. But I don't run gentoo userspace, so I suspect I'm not
tripping the same path at boot. I did run the seccomp selftest and that
didn't trip it either.

cheers
