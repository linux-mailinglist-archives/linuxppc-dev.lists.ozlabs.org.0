Return-Path: <linuxppc-dev+bounces-12735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F89EBC7DBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 10:00:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj2PB03D0z3cDN;
	Thu,  9 Oct 2025 19:00:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759996845;
	cv=none; b=KGxxdR9HyczrrI1TlUMDFsQV89/FmGh3h268LZiCqszSMB73RvqmdXqh0GlOoH/omKpR9KD9AuHLbxGFilaKNBgp2ToxkRPtVsOsTE7iuaZ0lBkJJIk6AddvAGo7PquZrso0SPBOvr4dNffLonpGbtGTPQtcngmuZr/QMibi1n4V0AgAGAVZBSfTr4AwsIVlQEac7lf1J0zK/MrpiR6NP407u2TPAmJbaN6JNRSsrO8a6ETg1kRJQG22b4npqhXMaVXYOxDIwcx1pdSCatSNztwSFqKdV45Sr1cW1HHhz/014TxJA1vh1hUVlluEhW3ZChdRnRfRzwtEkAJjmrWk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759996845; c=relaxed/relaxed;
	bh=H/mnhXDxBwuvogfaANfDq1wZ6HpShsUZviU//mfjbhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXUv55dXTCylXPLecPvjGoG7Xd729M/refz2gictDiQTVla5iLAaL4lfKyENUEEIp9usmTf7FzyULLSe6Ytwck96MWuK8Ko3IDbCFK0co32+tORxDryRW9ieCorCGdJ0r5HQoEO0C8tUzLd/zjm0srPDuS2xCqEi2FcanuHtlSScpY9WT4UmZyP3rjZjP0JOQ+EDilv/SnaBTNC6MuCP9hob+v1NwiEC+GL5c3w852XsrjtydzwEI6efYRX/bo9aGA1sG+JBu+tO8cr7hcmdyRd0264Tm8lQA+ab5njN09BZVBahFtSWY580y/9+xML5S0cSfKwvag3+PozC00fHJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JaOuZkVd; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JaOuZkVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj2P665ypz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 19:00:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H/mnhXDxBwuvogfaANfDq1wZ6HpShsUZviU//mfjbhQ=; b=JaOuZkVdx9gfIYp5ZRI1Tu2btN
	f3BtM/+Zk3dJspKXx4fXFLx2Xyj1wsiiY9tbal4y4a/YwjjBLzGeEKlIcrIpHK7IkvxkxCCNURGE8
	Nd2UsO/xTYmvDrfiEIN0AqJ6Mnt3sgS3SMHjpwVbRbFjn+bdlKT78IMFVmQQdP5K1hzzui8ym+8Tv
	F0y7d3ITC5gxZ/uSn2YLwcyVnCq9baT+zmtSe2VBHn0yNcwtFTfFPm/gCdgje9NFAERWQhUEH/teX
	LcKHm5kRc4dPlq7cN469bSfnZ4iaShdmyjypXxzGx9MukzUnA9tD1HUuIcs79cIIimQ4hlyFfU/F5
	IdCG0K7w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lZI-00000001HTU-39P7;
	Thu, 09 Oct 2025 08:00:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6543300400; Thu, 09 Oct 2025 10:00:07 +0200 (CEST)
Date: Thu, 9 Oct 2025 10:00:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, jstultz@google.com,
	stultz@google.com
Subject: Re: [bisected][mainline]Kernel warnings at
 kernel/sched/cpudeadline.c:219
Message-ID: <20251009080007.GH3245006@noisy.programming.kicks-ass.net>
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
 <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
 <5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
 <20251008111314.GI3289052@noisy.programming.kicks-ass.net>
 <86fbf707-9ecf-4941-ae70-3332c360533d@linux.ibm.com>
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
In-Reply-To: <86fbf707-9ecf-4941-ae70-3332c360533d@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 08, 2025 at 11:39:11PM +0530, Shrikanth Hegde wrote:

> *It pointed to this*
> 
> NIP [c0000000001fd798] dl_server_start+0x50/0xd8
> LR [c0000000001d9534] enqueue_task_fair+0x228/0x8ec
> Call Trace:
> [c000006684a579c0] [0000000000000001] 0x1 (unreliable)
> [c000006684a579f0] [c0000000001d9534] enqueue_task_fair+0x228/0x8ec
> [c000006684a57a60] [c0000000001bb344] enqueue_task+0x5c/0x1c8
> [c000006684a57aa0] [c0000000001c5fc0] ttwu_do_activate+0x98/0x2fc
> [c000006684a57af0] [c0000000001c671c] try_to_wake_up+0x2e0/0xa60
> [c000006684a57b80] [c00000000019fb48] kthread_park+0x7c/0xf0
> [c000006684a57bb0] [c00000000015fefc] takedown_cpu+0x60/0x194
> [c000006684a57c00] [c000000000161924] cpuhp_invoke_callback+0x1f4/0x9a4
> [c000006684a57c90] [c0000000001621a4] __cpuhp_invoke_callback_range+0xd0/0x188
> [c000006684a57d30] [c000000000165aec] _cpu_down+0x19c/0x560
> [c000006684a57df0] [c0000000001637c0] __cpu_down_maps_locked+0x2c/0x3c
> [c000006684a57e10] [c00000000018a100] work_for_cpu_fn+0x38/0x54
> [c000006684a57e40] [c00000000019075c] process_one_work+0x1d8/0x554
> [c000006684a57ef0] [c00000000019165c] worker_thread+0x308/0x46c
> [c000006684a57f90] [c00000000019e474] kthread+0x16c/0x19c
> [c000006684a57fe0] [c00000000000dd58] start_kernel_thread+0x14/0x18
> 
> It is takedown_cpu called from CPU0(boot CPU) and it wakes up kthread
> which is CPU Bound I guess.  Since happens after rq was marked
> offline, it ends up starting the deadline server again.
> 
> So i think it is sensible idea to stop the deadline server if the cpu
> is going down.  Once we stop the server we will return
> HRTIMER_NORESTART.

D'0h.. that stop was far too early.

How about moving that dl_server_stop() into sched_cpu_dying() like so.

This seems to survive a few hotplugs for me.

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 198d2dd45f59..f1ebf67b48e2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8571,10 +8571,12 @@ int sched_cpu_dying(unsigned int cpu)
 	sched_tick_stop(cpu);
 
 	rq_lock_irqsave(rq, &rf);
+	update_rq_clock(rq);
 	if (rq->nr_running != 1 || rq_has_pinned_tasks(rq)) {
 		WARN(true, "Dying CPU not properly vacated!");
 		dump_rq_tasks(rq, KERN_WARNING);
 	}
+	dl_server_stop(&rq->fair_server);
 	rq_unlock_irqrestore(rq, &rf);
 
 	calc_load_migrate(rq);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 615411a0a881..7b7671060bf9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1582,6 +1582,9 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 	if (!dl_server(dl_se) || dl_se->dl_server_active)
 		return;
 
+	if (WARN_ON_ONCE(!cpu_online(cpu_of(rq))))
+		return;
+
 	dl_se->dl_server_active = 1;
 	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
 	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))

