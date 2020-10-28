Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A71DC29D174
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 19:25:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLxnq4pDzzDqG8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 05:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hj3Ts0lw; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hj3Ts0lw; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLxm84P3ZzDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 05:23:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603909430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oZiyvKbthkSVXmetaH/Tg/ylLfcMHsx8WKqlppb05Vw=;
 b=hj3Ts0lwmOTOopdRiHoIBmgGvdg7qZr9VmC3J3KTIhPeigJfTyn8vH3+Qt8D7jZSTvJ0od
 5ey9JC4xWQXl0LLRQKGxFNL1YM/4n+PgUTUppWIyBGZ20zZ5HygAt8AMlKLNnTcF+hzdw8
 qZpPerLZoxM6YmXgkjIOS6ccI90/Bxg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603909430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oZiyvKbthkSVXmetaH/Tg/ylLfcMHsx8WKqlppb05Vw=;
 b=hj3Ts0lwmOTOopdRiHoIBmgGvdg7qZr9VmC3J3KTIhPeigJfTyn8vH3+Qt8D7jZSTvJ0od
 5ey9JC4xWQXl0LLRQKGxFNL1YM/4n+PgUTUppWIyBGZ20zZ5HygAt8AMlKLNnTcF+hzdw8
 qZpPerLZoxM6YmXgkjIOS6ccI90/Bxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-NQE2bf9XOEqbiPyFFQ9_dg-1; Wed, 28 Oct 2020 14:23:46 -0400
X-MC-Unique: NQE2bf9XOEqbiPyFFQ9_dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D3836408F;
 Wed, 28 Oct 2020 18:23:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-66-92.rdu2.redhat.com
 [10.10.66.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 402CF6EF53;
 Wed, 28 Oct 2020 18:23:40 +0000 (UTC)
From: Qian Cai <cai@redhat.com>
To: "Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH] powerpc/smp: Move rcu_cpu_starting() earlier
Date: Wed, 28 Oct 2020 14:23:34 -0400
Message-Id: <20201028182334.13466-1-cai@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Qian Cai <cai@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The call to rcu_cpu_starting() in start_secondary() is not early enough
in the CPU-hotplug onlining process, which results in lockdep splats as
follows:

 WARNING: suspicious RCU usage
 -----------------------------
 kernel/locking/lockdep.c:3497 RCU-list traversed in non-reader section!!

 other info that might help us debug this:

 RCU used illegally from offline CPU!
 rcu_scheduler_active = 1, debug_locks = 1
 no locks held by swapper/1/0.

 Call Trace:
 dump_stack+0xec/0x144 (unreliable)
 lockdep_rcu_suspicious+0x128/0x14c
 __lock_acquire+0x1060/0x1c60
 lock_acquire+0x140/0x5f0
 _raw_spin_lock_irqsave+0x64/0xb0
 clockevents_register_device+0x74/0x270
 register_decrementer_clockevent+0x94/0x110
 start_secondary+0x134/0x800
 start_secondary_prolog+0x10/0x14

This is avoided by moving the call to rcu_cpu_starting up near the
beginning of the start_secondary() function. Note that the
raw_smp_processor_id() is required in order to avoid calling into
lockdep before RCU has declared the CPU to be watched for readers.

Link: https://lore.kernel.org/lkml/160223032121.7002.1269740091547117869.tip-bot2@tip-bot2/
Signed-off-by: Qian Cai <cai@redhat.com>
---
 arch/powerpc/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 3c6b9822f978..8c2857cbd960 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1393,13 +1393,14 @@ static void add_cpu_to_masks(int cpu)
 /* Activate a secondary processor. */
 void start_secondary(void *unused)
 {
-	unsigned int cpu = smp_processor_id();
+	unsigned int cpu = raw_smp_processor_id();
 
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
 
 	smp_store_cpu_info(cpu);
 	set_dec(tb_ticks_per_jiffy);
+	rcu_cpu_starting(cpu);
 	preempt_disable();
 	cpu_callin_map[cpu] = 1;
 
-- 
2.28.0

