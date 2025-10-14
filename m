Return-Path: <linuxppc-dev+bounces-12863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E9BD9F3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 16:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmGXc0Ljjz305S;
	Wed, 15 Oct 2025 01:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760451503;
	cv=none; b=PuoDL/J0+wtUtnRJ9DP7L8x0bJJOJLg1sGmg+t+abLiGTZ4FpSZHYLn7r7KHRssdYMJMso2I/HhMoeBsp1PIASsKw/ZUesaWWwh797C0reaeEkJCq/uptRFXqOs3yJOrr3cqThLaBrDg5H8SpKAk/n2KNIlXGeo7tUGFrW1+xE1AesylGaUX05w0b415bj0JmKfwYrPdzAYkHw3xtzwYhJNhkZqMKUXhTIWdaUoOCU6g0+4KnvRUoCd0bQwow1xXUBjJY5AzhINgYqMdyQ/1ikIEp6HtUcif4czkAC/TasyeBYMMT6INo2YYy++j3NY5VKBQjFLUSQ53SGOwMedRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760451503; c=relaxed/relaxed;
	bh=iioJ+H5BgqY5puHAxyGpj4x0tQd8UQglUZLFQMVFr44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1MgrqDCzJvDMGwuk8kEIM/fPrIiw+zeqvQBSTtlgb/26xyaw43pPxnxezV4QTT8RvSlyZrtkC8TjkO7E1ve7Nnp8Gl1seREAYei6vcVQeT8frXDsM+Iy0oWuMREzVpdwTbIl0xHner3Bk9rqi+EsiK5Q5JJtkNx6yEoIMhoVT0tLoLbyVj15qF7ioFHXAJHDKSL8aPF9dNpwvA1V8NsAEoO76VKzM4pk3gyw9qcB0aHmZO/c3WwotyXMYINCHTB9jsGrHSRBKVUCdlt4mR4gXE02Jl+bGXyphI0l4KoalKHCrg/gyVX0AVQSH2UO28gfaaIDfFQkIxCNAo+9xri5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g5FGoCuL; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g5FGoCuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmGXX4HNtz3000
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 01:18:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iioJ+H5BgqY5puHAxyGpj4x0tQd8UQglUZLFQMVFr44=; b=g5FGoCuL0zimjyfsecg0GRPO3s
	f2hG87ySsnZH7QcTJb8TQCsEySz2dFP4keEkjH5kzFbd/KkjPxKdkXKEqEgtiGQ/Te5cxe+Y2+U6q
	/kOztLe5ogwbAvF91sF91iGZ2+mhRuA9BvvcmGjV8tMX09UwRpVdrMRetqlORBFBDfwu6ARcRLyKB
	scfsGWlt02Rr+PxFo2fszdISCCzl85Uycsc6IGprodh3E6yMvAGJ7AnRqpu3mc4Ac7qB6Rzo7mKqX
	bpAxQFCB24P7lkEa7Xa8AlRgLQUB5A8ksAjQoI0GntfG9rsTpx7akpNBe1/RxrfDxJ89jH/XEW23m
	N8TRJhfA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fqF-00000005ErK-3Loc;
	Tue, 14 Oct 2025 14:17:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C2CF4300212; Tue, 14 Oct 2025 16:17:30 +0200 (CEST)
Date: Tue, 14 Oct 2025 16:17:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard
 MC scheduling bits
Message-ID: <20251014141730.GZ3245006@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
 <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
 <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com>
 <20251014094210.GQ3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdUD8RZqPL5ZYyJrwJB+XL_Tkn-rsLx7WvUmn6y5M_tAtw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdUD8RZqPL5ZYyJrwJB+XL_Tkn-rsLx7WvUmn6y5M_tAtw@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 02:37:11PM +0200, Geert Uytterhoeven wrote:

> > > > +       help
> > > > +         Improves the CPU scheduler's decision making when dealing with
> > > > +         MultiThreading at a cost of slightly increased overhead in some
> > > > +         places. If unsure say N here.
> > >
> > > So it should default to n?
> >
> > That's just help text that got carried around. Many of the architectures
> > that had default y still had this text on. I suppose we can change it if
> > someone cares.
> 
> Please do so.

How about we remove the recommendation like so? There are many help
things that do not have a recommendation. Mostly these options add a
little code and the most expensive bits tend to be gated by
static_branch() so it really shouldn't be that bit of a burden.

CONFIG_SMP was the big one for the scheduler, and Ingo recently removed
that (he did an effective unifdef CONFIG_SMP=y on the scheduler code).

---
diff --git a/arch/Kconfig b/arch/Kconfig
index ebe08b9186ad..3d8e2025a4ac 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -57,7 +57,7 @@ config SCHED_SMT
 	help
 	  Improves the CPU scheduler's decision making when dealing with
 	  MultiThreading at a cost of slightly increased overhead in some
-	  places. If unsure say N here.
+	  places.
 
 config SCHED_CLUSTER
 	bool "Cluster scheduler support"
@@ -77,7 +77,7 @@ config SCHED_MC
 	help
 	  Multi-core scheduler support improves the CPU scheduler's decision
 	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
+	  increased overhead in some places.
 
 # Selected by HOTPLUG_CORE_SYNC_DEAD or HOTPLUG_CORE_SYNC_FULL
 config HOTPLUG_CORE_SYNC

