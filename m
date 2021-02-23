Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B79EC322AD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 13:55:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlJtD6gyCz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 23:55:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oJIUKAN5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oJIUKAN5; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlJss0XFxz30Mp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 23:54:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DlJsk1lmPz9sRN;
 Tue, 23 Feb 2021 23:54:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614084875;
 bh=RaH1AREYo6rs7BSYMewJBBXZFyMXGvg4NQBjR/9RSrk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oJIUKAN5ojwFa6QdBKjs6r0Kse5cFXnceX19PIPrWj0ql6VqsynbU0uO2E+bI2hl6
 4Yy3C2MA/3bNvH4qN0DVKTobNxe+Us7cir87Z4PZJ84qb+ZqnKcdjelDt63d4noLRW
 CgakpZiRliwkGDhJDcWcHumcRRQ6MJULee/SC/s/HKCGhCGc49bQ73LsMcvFlAAIh7
 dUcxVEa71sPRlzpxV15vlHJzGy8q6DTHuXeQbPkf2UD46foeIj817gaPbmsUyyeERj
 KTAFuOXKwLc1DyY08AtO2u+FHIcwNu/+M8b5YgCkScMdWgnduThimLNOlhIldE4RQF
 jydd/ZFzpX0pg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Fix handling of privilege level checks in
 perf interrupt context
In-Reply-To: <YDTg99xsVolE+sv+@hirez.programming.kicks-ass.net>
References: <1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YDTg99xsVolE+sv+@hirez.programming.kicks-ass.net>
Date: Tue, 23 Feb 2021 23:54:28 +1100
Message-ID: <87czwrt057.fsf@mpe.ellerman.id.au>
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
Cc: maddy@linux.ibm.com, omosnace@redhat.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Tue, Feb 23, 2021 at 01:31:49AM -0500, Athira Rajeev wrote:
>> Running "perf mem record" in powerpc platforms with selinux enabled
>> resulted in soft lockup's. Below call-trace was seen in the logs:
...
>> 
>> Since the purpose of this security hook is to control access to
>> perf_event_open, it is not right to call this in interrupt context.
>> But in case of powerpc PMU, we need the privilege checks for specific
>> samples from branch history ring buffer and sampling register values.
>
> I'm confused... why would you need those checks at event time? Either
> the event has perf_event_attr::exclude_kernel and it then isn't allowed
> to expose kernel addresses, or it doesn't and it is.

Well one of us is confused that's for sure ^_^

I missed/forgot that we had that logic in open.

I think the reason we got here is that in the past we didn't have the
event in the low-level routines where we want to check,
power_pmu_bhrb_read() and perf_get_data_addr(), so we hacked in a
perf_paranoid_kernel() check. Which was wrong.

Then Joel's patch plumbed the event through and switched those paranoid
checks to perf_allow_kernel().

Anyway, we'll just switch those to exclude_kernel checks.

> There should never be an event-time question of permission like this. If
> you allow creation of an event, you're allowing the data it generates.

Ack.

cheers
