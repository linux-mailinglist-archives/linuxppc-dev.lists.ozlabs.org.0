Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC467C168
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 01:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2LyP6PLyz3fC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 11:22:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ULxhZQ8c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ULxhZQ8c;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2LxW1WjPz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:22:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3CD1CB81C5E;
	Thu, 26 Jan 2023 00:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40041C4339C;
	Thu, 26 Jan 2023 00:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1674692521;
	bh=jgiR0d8hUFYk52IUlDU+5+WUlWzBEfGIiyIxt9qM28M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ULxhZQ8c8CFbkpJnZkQWozl7DcYVx5jaXu3rzUm9YEUVUUBF3LoSFC62/+TJOYZaR
	 XqOGcbMw9b1nL+CccygWmx/zE9bKSUO+vNPz8Irpn2cZdIGClGOwo3gE90ADY2+Gol
	 bLVO3uhuoeYOQb1698Ohp0oHoLXvcFQkBDfiZnyc=
Date: Wed, 25 Jan 2023 16:21:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
Message-Id: <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
In-Reply-To: <20230125233554.153109-2-surenb@google.com>
References: <20230125233554.153109-1-surenb@google.com>
	<20230125233554.153109-2-surenb@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> errors when we add a const modifier to vma->vm_flags.
> 
> ...
>
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  		 * orig->shared.rb may be modified concurrently, but the clone
>  		 * will be reinitialized.
>  		 */
> -		*new = data_race(*orig);
> +		memcpy(new, orig, sizeof(*new));

The data_race() removal is unchangelogged?

>  		INIT_LIST_HEAD(&new->anon_vma_chain);
>  		dup_anon_vma_name(orig, new);
>  	}

