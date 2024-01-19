Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C98325E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 09:43:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RUoTSPkL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGY6X1H0yz3by8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 19:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RUoTSPkL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGY5g1Tyrz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 19:42:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBB5E61922;
	Fri, 19 Jan 2024 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D732C433F1;
	Fri, 19 Jan 2024 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705653745;
	bh=g5BoGuy/aNMWgkh7HES0ckmxP53aa40fqWFfKkEi5ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUoTSPkLvPmGnMVOMJ1HuVQU6XfFhUmlMpbTrKyG6U8fqip+jV7+oHYufClRc2Byz
	 I3fuHmD32xA9G5aC/qgCk0gYD2vI2MQEFi09W0zbpuY8l7bMAjiVnFVTxzbC5teWMK
	 2ts22XzYj3hQvM/l0YmrlVjXLWu1vB29XDBEUj8NHEI4CKzhcPgj4wkLqJgR+twtIi
	 1e1W7S0aNeD7srev8SEKpVES97FlgnMqaSwICysppCZPOJOdR/q6MZgPu4DkdBn1e1
	 eGJEwySey3GhtxwqiPhQicHsJSJpxONbZ8rdyTC8j8SjIWuLoAXc0bc1dmrqTx86DO
	 cHge1k3R0OABQ==
Date: Fri, 19 Jan 2024 10:42:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Zao13I4Bb0tur0fZ@kernel.org>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, cl@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, Yury Norov <yury.norov@gmail.com>, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, vbabka@suse.cz, Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 19, 2024 at 02:46:16PM +0800, Shijie Huang wrote:
> 
> 在 2024/1/19 12:42, Yury Norov 写道:
> > This adds another level of indirection, I think. Currently cpu_to_node
> > is a simple inliner. After the patch it would be a real function with
> > all the associate overhead. Can you share a bloat-o-meter output here?
> #./scripts/bloat-o-meter vmlinux vmlinux.new
> add/remove: 6/1 grow/shrink: 61/51 up/down: 1168/-588 (580)
> Function                                     old     new   delta
> numa_update_cpu                              148     244     +96
> 
>  ...................................................................................................................................(to many to skip)
> 
> Total: Before=32990130, After=32990710, chg +0.00%
 
It's not only about text size, the indirect call also hurts performance
 
> > 
> > Regardless, I don't think that the approach is correct. As per your
> > description, some initialization functions erroneously call
> > cpu_to_node() instead of early_cpu_to_node() which exists specifically
> > for that case.
> > 
> > If the above correct, it's clearly a caller problem, and the fix is to
> > simply switch all those callers to use early version.
> 
> It is easy to change to early_cpu_to_node() for sched_init(),
> init_sched_fair_class()
> 
> and workqueue_init_early(). These three places call the cpu_to_node() in the
> __init function.
> 
> 
> But it is a little hard to change the early_trace_init(), since it calls
> cpu_to_node in the deep
> 
> function stack:
> 
>   early_trace_init() --> ring_buffer_alloc() -->rb_allocate_cpu_buffer()
> 
> 
> For early_trace_init(), we need to change more code.
> 
> 
> Anyway, If we think it is not a good idea to change the common code, I am
> oaky too.
 
Is there a fundamental reason to have early_cpu_to_node() at all?
It seems that all the mappings are known by the end of setup_arch() and the
initialization of numa_node can be moved earlier. 
 
> > I would also initialize the numa_node with NUMA_NO_NODE at declaration,
> > so that if someone calls cpu_to_node() before the variable is properly
> > initialized at runtime, he'll get NO_NODE, which is obviously an error.
> 
> Even we set the numa_node with NUMA_NO_NODE, it does not always produce
> error.
> 
> Please see the alloc_pages_node().
> 
> 
> Thanks
> 
> Huang Shijie
> 

-- 
Sincerely yours,
Mike.
