Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC89E835BD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 08:42:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jOnqDMRd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJMdR4gN0z3btl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 18:42:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jOnqDMRd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJMcf5JrRz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 18:42:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8F62610E7;
	Mon, 22 Jan 2024 07:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B284C43394;
	Mon, 22 Jan 2024 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705909326;
	bh=6q+Ae298LK6Fwx9w1Hxqg+/TcqF4+MMHBmWb7Tw8+hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOnqDMRdvXuWTje7hxQN2dCLE7PzYUq8rAYWennGmg2eWAJlF8wYxF7WITOD93XyX
	 kOi7HC3t/JBdyraClA4q5IQ6eCe0QP9DQEOOLu5rJzGGtUakerutvskNDSebyStAJZ
	 z+mnBJqfh9Fcq+5rh+Kc2KPiYn9xLCRpmCpxOFhvwp4xLOdS0I9/a1r1ZusQ+JEtay
	 eerJbS9dnoFfr2YnDqeIifjrZ8RFwgs3XLP/I8Wfw7PBHR0aHCQTC5FxayDUKgCqE/
	 I+Nux9qFYloyZL8LPJSk6tchB/m6C22f9IUgs1mhO9obbBZ8/pniLuN0IIT85I3k0j
	 4+4RMm18KCn0Q==
Date: Mon, 22 Jan 2024 09:41:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Za4cNBQBLZujlAlP@kernel.org>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
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

On Fri, Jan 19, 2024 at 04:50:53PM +0800, Shijie Huang wrote:
> 
> 在 2024/1/19 16:42, Mike Rapoport 写道:
> > Is there a fundamental reason to have early_cpu_to_node() at all?
> 
> The early_cpu_to_node does not work on some ARCHs (which support the NUMA),
> such as  SPARC, MIPS and S390.

My question was why we need early_cpu_to_node() at all and why can't we use
cpu_to_node() early on arches that do have it.
 
> Thanks
> 
> Huang Shijie
> 
> > It seems that all the mappings are known by the end of setup_arch() and the
> > initialization of numa_node can be moved earlier.
> > > > I would also initialize the numa_node with NUMA_NO_NODE at declaration,
> > > > so that if someone calls cpu_to_node() before the variable is properly
> > > > initialized at runtime, he'll get NO_NODE, which is obviously an error.
> > > Even we set the numa_node with NUMA_NO_NODE, it does not always produce
> > > error.
> > > 
> > > Please see the alloc_pages_node().
> > > 
> > > 
> > > Thanks
> > > 
> > > Huang Shijie
> > > 

-- 
Sincerely yours,
Mike.
