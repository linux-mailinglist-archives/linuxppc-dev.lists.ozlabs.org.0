Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67657ADF6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 21:04:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A3GWQmu8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A3GWQmu8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvXP43tjZz3dhc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 05:04:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A3GWQmu8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A3GWQmu8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvXMk5LVbz3chV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 05:03:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695668606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzBSf4JXBw9DG2ter3Ft2dbMxjnf+RIRHcyGZ86okTg=;
	b=A3GWQmu8LaFfcvIImtHF1rexOwS4zCMDRAQZI9MUgPfbbb2QoTO3z9BwEPfZwAwU8vdp7w
	IOoUUl5OJHZiX1AXSd4+zWEYRvEVXiuz2wf8jKB0YP6J5XQF/aT57nYwEV2EEc8SPi/5fS
	j979lMW2mOFA8MftXT7Jyqn/azZNUjo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695668606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzBSf4JXBw9DG2ter3Ft2dbMxjnf+RIRHcyGZ86okTg=;
	b=A3GWQmu8LaFfcvIImtHF1rexOwS4zCMDRAQZI9MUgPfbbb2QoTO3z9BwEPfZwAwU8vdp7w
	IOoUUl5OJHZiX1AXSd4+zWEYRvEVXiuz2wf8jKB0YP6J5XQF/aT57nYwEV2EEc8SPi/5fS
	j979lMW2mOFA8MftXT7Jyqn/azZNUjo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-NtUsmupsMqCxS1_LtyUfhw-1; Mon, 25 Sep 2023 15:03:14 -0400
X-MC-Unique: NtUsmupsMqCxS1_LtyUfhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 731C53C11A08;
	Mon, 25 Sep 2023 19:02:52 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.202])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B30240C2064;
	Mon, 25 Sep 2023 19:02:52 +0000 (UTC)
Date: Mon, 25 Sep 2023 15:02:50 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/stacktrace: Fix arch_stack_walk_reliable()
Message-ID: <ZRHZWpppf7iuA3Gs@redhat.com>
References: <20230921232441.1181843-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921232441.1181843-1-mpe@ellerman.id.au>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: pmladek@suse.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, live-patching@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 09:24:41AM +1000, Michael Ellerman wrote:
> The changes to copy_thread() made in commit eed7c420aac7 ("powerpc:
> copy_thread differentiate kthreads and user mode threads") inadvertently
> broke arch_stack_walk_reliable() because it has knowledge of the stack
> layout.
> 
> Fix it by changing the condition to match the new logic in
> copy_thread(). The changes make the comments about the stack layout
> incorrect, rather than rephrasing them just refer the reader to
> copy_thread().
> 
> Also the comment about the stack backchain is no longer true, since
> commit edbd0387f324 ("powerpc: copy_thread add a back chain to the
> switch stack frame"), so remove that as well.
> 
> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Fixes: eed7c420aac7 ("powerpc: copy_thread differentiate kthreads and user mode threads")
> ---
>  arch/powerpc/kernel/stacktrace.c | 27 +++++----------------------
>  1 file changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index b15f15dcacb5..e6a958a5da27 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -73,29 +73,12 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
>  	bool firstframe;
>  
>  	stack_end = stack_page + THREAD_SIZE;
> -	if (!is_idle_task(task)) {
> -		/*
> -		 * For user tasks, this is the SP value loaded on
> -		 * kernel entry, see "PACAKSAVE(r13)" in _switch() and
> -		 * system_call_common().
> -		 *
> -		 * Likewise for non-swapper kernel threads,
> -		 * this also happens to be the top of the stack
> -		 * as setup by copy_thread().
> -		 *
> -		 * Note that stack backlinks are not properly setup by
> -		 * copy_thread() and thus, a forked task() will have
> -		 * an unreliable stack trace until it's been
> -		 * _switch()'ed to for the first time.
> -		 */
> -		stack_end -= STACK_USER_INT_FRAME_SIZE;
> -	} else {
> -		/*
> -		 * idle tasks have a custom stack layout,
> -		 * c.f. cpu_idle_thread_init().
> -		 */
> +
> +	// See copy_thread() for details.
> +	if (task->flags & PF_KTHREAD)
>  		stack_end -= STACK_FRAME_MIN_SIZE;
> -	}
> +	else
> +		stack_end -= STACK_USER_INT_FRAME_SIZE;
>  
>  	if (task == current)
>  		sp = current_stack_frame();
> -- 
> 2.41.0
> 
> 

Reviewed-by: Joe Lawrence <joe.lawrence@redhat.com>

Thanks for posting, Michael.

Livepatching kselftests are happy now.  Minimal kpatch testing good, too
(we have not rebased our full integration tests to latest upstreams just
yet).

--
Joe

