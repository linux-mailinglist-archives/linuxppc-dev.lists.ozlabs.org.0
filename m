Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93EB78D365
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 08:38:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L/3BFnHH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbF4C4Q3Dz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 16:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L/3BFnHH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbF3H1Z59z2xps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 16:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693377466;
	bh=vRm+U0m7WUTiTK+V6GXUqnaveSMN3SbjFT0m0KXkE2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L/3BFnHHBXlTUXyXo3M3BZs2XZWsABinbhUDMk+ZcKQnnO8F9o9OZ4YsUFVh/7BAl
	 l9+iVEiOppz0K3uNJflKLZDNGa60oG7NaTxc5OFuzlt0edO83aIP0DZ9EBpMJgSiar
	 zvObsOKVS9WtDHbntPvR1AjviBVPyJBZO4Ay296NYFrKLsUIuFmLTz3G0xA7gLXct2
	 iIJb8/bgv7NfIVDwq5qK590LycaXz4lkRyVgulRCmP808vz5KQW9ZFBe7k02NxGaQ1
	 FyS6bAaFRo6v/FfXZpce3XBS/CCCkIy+VW9m3MScKL6NvpmA/f8JO7Fn7OyAG17G/o
	 oOZPN6IOGcMLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbF3G65L3z4wy4;
	Wed, 30 Aug 2023 16:37:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joe Lawrence <joe.lawrence@redhat.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Recent Power changes and stack_trace_save_tsk_reliable?
In-Reply-To: <87o7ipxtdc.fsf@mail.lhotse>
References: <ZO4K6hflM/arMjse@redhat.com> <87o7ipxtdc.fsf@mail.lhotse>
Date: Wed, 30 Aug 2023 16:37:44 +1000
Message-ID: <87il8xxcg7.fsf@mail.lhotse>
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
Cc: live-patching@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, Ryan Sullivan <rysulliv@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Joe Lawrence <joe.lawrence@redhat.com> writes:
>> Hi ppc-dev list,
>>
>> We noticed that our kpatch integration tests started failing on ppc64le
>> when targeting the upstream v6.4 kernel, and then confirmed that the
>> in-tree livepatching kselftests similarly fail, too.  From the kselftest
>> results, it appears that livepatch transitions are no longer completing.
>
> Hi Joe,
>
> Thanks for the report.
>
> I thought I was running the livepatch tests, but looks like somewhere
> along the line my kernel .config lost CONFIG_TEST_LIVEPATCH=m, so I have
> been running the test but it just skips. :/
>
> I can reproduce the failure, and will see if I can bisect it more
> successfully.

It's caused by:

  eed7c420aac7 ("powerpc: copy_thread differentiate kthreads and user mode threads")

Which is obvious in hindsight :)

The diff below fixes it for me, can you test that on your setup?

A proper fix will need to be a bit bigger because the comments in there
are all slightly wrong now since the above commit.

Possibly we can also rework that code more substantially now that
copy_thread() is more careful about setting things up, but that would be
a follow-up.

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 5de8597eaab8..d0b3509f13ee 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -73,7 +73,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 	bool firstframe;
 
 	stack_end = stack_page + THREAD_SIZE;
-	if (!is_idle_task(task)) {
+	if (!(task->flags & PF_KTHREAD)) {
 		/*
 		 * For user tasks, this is the SP value loaded on
 		 * kernel entry, see "PACAKSAVE(r13)" in _switch() and


cheers
