Return-Path: <linuxppc-dev+bounces-15999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60739D3AD18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 15:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvtkZ6fZMz3blq;
	Tue, 20 Jan 2026 01:53:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768834422;
	cv=none; b=C2WU5FWBz9nZaDVn9RhIWepQP5Z3ZmApbqpD0C0YpE04wEmNyBaeAkGywSrwj4SCkH72KKoducUcQ0HBU9ZQY6lmj2bD5gcxqfA1FYy5AOapmRZhEbVV4Q1lG9mP9QTy1PkopDDs6121sZ1bN9+I3zNBo0gg6Ni5NQpG0fWDlN6Ao1/QIn8qBIfZgjeVtQySk4GZpWVfm9CE7lzGkv7A9J7KvFVlObUN2CveiKKK8kOx/o6VVq1TL4RBn0tcvgf5dGahV2Z/RH6KHSHaeMvlTvZkYfDocjmqg2q6nbdWEiNf2aBLzpY7ECreIte5rQAabJ3eKWqg939sDlkhkU2sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768834422; c=relaxed/relaxed;
	bh=jrDAxjhFf3FPLMbr/IOqWmWDDR5q/doAeWiuVFjaQvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtdkpTn6qFvDM6b/KHBlwp58yxaJh6+Xnj/qof9iZwTWsITA6Pn7sBKpEldepvP/qxoW6vJYadqp1BwG6ty+ufXCJjP4EIcsbi7xH0akOyIS1hekihWr6LTugT1HvCkk20+Cb/9guawS79rTmhSPy1G33AKiNEiKwsjGsE3t0OkiyJsB6ufnFZXrJzfJIYg9zBlhy1mg+keRa6UfBgG5zGFtvHp31oUmy1I/gbtEkYgz4f9jzo78UNTiV6jZR//JnYKe+dtgakFar7u/nV9aYCHG/k/iQXH1nxr0u0N71G74Tw0VSQXnJPg9EVHEBLLELEV8vd7ReZS+/A9MgEgO1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ov9hOHxz; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ov9hOHxz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvtkZ0blRz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 01:53:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jrDAxjhFf3FPLMbr/IOqWmWDDR5q/doAeWiuVFjaQvY=; b=ov9hOHxzzbUcf3Ie3aSb0QShDF
	+YggQwKOQw7guQyXSafiQuLquH2AQbsBQ3vkAOn72zXdtbwnjH7i/NB1rWne47GWzjcFfdit1ZyvC
	0EMVON8aMu6/psOQ5YiuIsyOgTH88WTbE+Tf7kmQzZbEp1VcvVBUV/KFQIab9FCWncqn5bUdc1lrs
	uoQND/4S7c4z4KnKbJYBuR+fY0Qipf+lsWIqYo9Hd+Go3BfKLBUf9Xiwmqg6IDtji8FRXBjy1tbBp
	NTyLzfmVtOnLvPkLTKHfEjWnAtsk/sZ2cqJltxnpRBd6WEidzOCDKMmjzFI2oe57Wwa068Bx9GzuR
	YPQz3Z2g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqdH-0000000CLEC-0iMk;
	Mon, 19 Jan 2026 14:53:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 959123006CD; Mon, 19 Jan 2026 15:53:30 +0100 (CET)
Date: Mon, 19 Jan 2026 15:53:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Kieran Bingham <kbingham@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, linuxppc-dev@lists.ozlabs.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>, linux-pm@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Nicholas Piggin <npiggin@gmail.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH 00/15] tick/sched: Refactor idle cputime accounting
Message-ID: <20260119145330.GI830229@noisy.programming.kicks-ass.net>
References: <20260116145208.87445-1-frederic@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116145208.87445-1-frederic@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 03:51:53PM +0100, Frederic Weisbecker wrote:
>  kernel/sched/cputime.c             | 302 +++++++++++++++++++++++++++++++------

My editor feels strongly about the below; with that it still has one
complaint about paravirt_steal_clock() which does not have a proper
declaration.


diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 7ff8dbec7ee3..248232fa6e27 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -2,6 +2,7 @@
 /*
  * Simple CPU accounting cgroup controller
  */
+#include <linux/sched/clock.h>
 #include <linux/sched/cputime.h>
 #include <linux/tsacct_kern.h>
 #include "sched.h"

