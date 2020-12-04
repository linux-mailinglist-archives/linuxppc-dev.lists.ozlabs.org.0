Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4F2CF59F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:25:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnkjP4L3VzDrHY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 07:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=urezki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K0iA2Szd; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnkgH2KlrzDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 07:23:37 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id u18so9372859lfd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 12:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=peEkU3zubQPkU0UrFQOESqhsjqik4+avfR4D7o/wPyM=;
 b=K0iA2Szdq/cQgbHZgBZerMWVNobosBLFi9hxxasYw2dn1BWpncN0Ms2K23kTPM11L7
 /OVjhlK05lutUMoXjPouzwCbni3YMf0nA+hzvNW2dAK2z/9NpEI0/6aCTqMGbNVV6qSj
 ZpgiXdUrUkw+OQLcbXmpQx83x3a0jAtUbAaRU8X4Pmyomo5zUOm6B/VvuaZ8vjp7xULc
 hxyg/zBJZRGAlMT+Q2t9HbQziS4vzvXlUR44lqxsnkvxHsdVS47U18pSJrNDfMbUkvKb
 ba144qivHylgVmmNJvyP9R2frdNmkv+efRFDCRN+VZZJTRW3m2ztNLf2im1eGN+ZPN3R
 matQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=peEkU3zubQPkU0UrFQOESqhsjqik4+avfR4D7o/wPyM=;
 b=rcVeNhHvzyah5lZS14rv9XpAwO5k3kL3GK2Ablb9dgljtlRnYJ7B6BwVIj5fX7TW+c
 eedBbDIwqk28P6yK6MqVQ02HeKe19JSr46XpVwK/gTZjX49H9XxG+0NlbdaD3Ti8q8Vn
 ITJcObL8viHUir4sKraq0wonkRbTemq2Q3+juMha0UpzlPgYbGZAMZ3xYo4jRXVqh3eR
 wuplw+ypP6A5+Er6afDfk5/8TunQrVPw0hBdh8eg6v4sU1Sr2fIRyKemJCxrEVusLPfy
 cDPFtJhw4JViabm9swqzeeDneMXOvG8eg3PCH8LPLy36ysq15ulgxE9XJ1CfpmnST1mf
 2JPQ==
X-Gm-Message-State: AOAM5312mGWSdzLAruCzyuhLm7hsRoeJeSR9qxo93y+551y+DsHr11H8
 p/2f+shIzCjjJZ6/Yam7OGo=
X-Google-Smtp-Source: ABdhPJwSOvedHRtA3F6vv6v5LueSOramqlOjWy7M/BfLfjuVUcIQC2XTKkLkaGqoDF/2/WFJSCD+xA==
X-Received: by 2002:a19:e8d:: with SMTP id 135mr4021840lfo.383.1607113411914; 
 Fri, 04 Dec 2020 12:23:31 -0800 (PST)
Received: from pc638.lan (h5ef52e3d.seluork.dyn.perspektivbredband.net.
 [94.245.46.61])
 by smtp.gmail.com with ESMTPSA id d9sm562011lfj.228.2020.12.04.12.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 12:23:31 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Fri, 4 Dec 2020 21:23:29 +0100
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
Message-ID: <20201204202329.GA29467@pc638.lan>
References: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
 <87v9dkuwy3.fsf@mpe.ellerman.id.au> <20201202143955.GA12300@pc636>
 <87sg8nv277.fsf@mpe.ellerman.id.au> <20201203143445.GA22204@pc636>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203143445.GA22204@pc636>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 03:34:45PM +0100, Uladzislau Rezki wrote:
> On Thu, Dec 03, 2020 at 05:22:20PM +1100, Michael Ellerman wrote:
> > Uladzislau Rezki <urezki@gmail.com> writes:
> > > On Thu, Dec 03, 2020 at 01:03:32AM +1100, Michael Ellerman wrote:
> > ...
> > >> 
> > >> The SMP bringup stalls because _cpu_up() is blocked trying to take
> > >> cpu_hotplug_lock for writing:
> > >> 
> > >> [  401.403132][    T0] task:swapper/0       state:D stack:12512 pid:    1 ppid:     0 flags:0x00000800
> > >> [  401.403502][    T0] Call Trace:
> > >> [  401.403907][    T0] [c0000000062c37d0] [c0000000062c3830] 0xc0000000062c3830 (unreliable)
> > >> [  401.404068][    T0] [c0000000062c39b0] [c000000000019d70] __switch_to+0x2e0/0x4a0
> > >> [  401.404189][    T0] [c0000000062c3a10] [c000000000b87228] __schedule+0x288/0x9b0
> > >> [  401.404257][    T0] [c0000000062c3ad0] [c000000000b879b8] schedule+0x68/0x120
> > >> [  401.404324][    T0] [c0000000062c3b00] [c000000000184ad4] percpu_down_write+0x164/0x170
> > >> [  401.404390][    T0] [c0000000062c3b50] [c000000000116b68] _cpu_up+0x68/0x280
> > >> [  401.404475][    T0] [c0000000062c3bb0] [c000000000116e70] cpu_up+0xf0/0x140
> > >> [  401.404546][    T0] [c0000000062c3c30] [c00000000011776c] bringup_nonboot_cpus+0xac/0xf0
> > >> [  401.404643][    T0] [c0000000062c3c80] [c000000000eea1b8] smp_init+0x40/0xcc
> > >> [  401.404727][    T0] [c0000000062c3ce0] [c000000000ec43dc] kernel_init_freeable+0x1e0/0x3a0
> > >> [  401.404799][    T0] [c0000000062c3db0] [c000000000011ec4] kernel_init+0x24/0x150
> > >> [  401.404958][    T0] [c0000000062c3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
> > >> 
> > >> It can't get it because kprobe_optimizer() has taken it for read and is now
> > >> blocked waiting for synchronize_rcu_tasks():
> > >> 
> > >> [  401.418808][    T0] task:kworker/0:1     state:D stack:13392 pid:   12 ppid:     2 flags:0x00000800
> > >> [  401.418951][    T0] Workqueue: events kprobe_optimizer
> > >> [  401.419078][    T0] Call Trace:
> > >> [  401.419121][    T0] [c0000000062ef650] [c0000000062ef710] 0xc0000000062ef710 (unreliable)
> > >> [  401.419213][    T0] [c0000000062ef830] [c000000000019d70] __switch_to+0x2e0/0x4a0
> > >> [  401.419281][    T0] [c0000000062ef890] [c000000000b87228] __schedule+0x288/0x9b0
> > >> [  401.419347][    T0] [c0000000062ef950] [c000000000b879b8] schedule+0x68/0x120
> > >> [  401.419415][    T0] [c0000000062ef980] [c000000000b8e664] schedule_timeout+0x2a4/0x340
> > >> [  401.419484][    T0] [c0000000062efa80] [c000000000b894ec] wait_for_completion+0x9c/0x170
> > >> [  401.419552][    T0] [c0000000062efae0] [c0000000001ac85c] __wait_rcu_gp+0x19c/0x210
> > >> [  401.419619][    T0] [c0000000062efb40] [c0000000001ac90c] synchronize_rcu_tasks_generic+0x3c/0x70
> > >> [  401.419690][    T0] [c0000000062efbe0] [c00000000022a3dc] kprobe_optimizer+0x1dc/0x470
> > >> [  401.419757][    T0] [c0000000062efc60] [c000000000136684] process_one_work+0x2f4/0x530
> > >> [  401.419823][    T0] [c0000000062efd20] [c000000000138d28] worker_thread+0x78/0x570
> > >> [  401.419891][    T0] [c0000000062efdb0] [c000000000142424] kthread+0x194/0x1a0
> > >> [  401.419976][    T0] [c0000000062efe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
> > >> 
> > >> But why is the synchronize_rcu_tasks() not completing?
OK. Seems i have understood why the synchronize_rcu_tasks() is not doing progress
waiting on complition. Actually the GP kthreads are not spawned by the time when
early_initcall callbacks gets invoked.

It means that callbacks will not be processed because GP kthreads do not exist,
so wakeme_after_rcu() is not invoked, thus does not signal about that a grace
period has elapsed.

<snip>
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 35bdcfd84d42..c5422bba7fe7 100644  
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -241,7 +241,7 @@ static int __noreturn rcu_tasks_kthread(void *arg)
        }
 }

-/* Spawn RCU-tasks grace-period kthread, e.g., at core_initcall() time. */
+/* Spawn RCU-tasks grace-period kthread at early_initcall() time. */
 static void __init rcu_spawn_tasks_kthread_generic(struct rcu_tasks *rtp)
 {
        struct task_struct *t;
@@ -564,7 +564,7 @@ static int __init rcu_spawn_tasks_kthread(void)
        rcu_spawn_tasks_kthread_generic(&rcu_tasks);
        return 0;
 }
-core_initcall(rcu_spawn_tasks_kthread);
+early_initcall(rcu_spawn_tasks_kthread);
 
 #if !defined(CONFIG_TINY_RCU)
 void show_rcu_tasks_classic_gp_kthread(void)
@@ -692,7 +692,7 @@ static int __init rcu_spawn_tasks_rude_kthread(void)
        rcu_spawn_tasks_kthread_generic(&rcu_tasks_rude);
        return 0;
 }
-core_initcall(rcu_spawn_tasks_rude_kthread);
+early_initcall(rcu_spawn_tasks_rude_kthread);
 
 #if !defined(CONFIG_TINY_RCU)
 void show_rcu_tasks_rude_gp_kthread(void)
@@ -1193,7 +1193,7 @@ static int __init rcu_spawn_tasks_trace_kthread(void)
        rcu_spawn_tasks_kthread_generic(&rcu_tasks_trace);
        return 0;
 }
-core_initcall(rcu_spawn_tasks_trace_kthread);
+early_initcall(rcu_spawn_tasks_trace_kthread);
 
 #if !defined(CONFIG_TINY_RCU)
 void show_rcu_tasks_trace_gp_kthread(void)
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index 39334d2d2b37..a251fc705abd 100644  
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -133,7 +133,7 @@ EXPORT_SYMBOL(rcu_read_lock_sched_held);
  * that if the user specifies both rcu_expedited and rcu_normal, then
  * rcu_normal wins.  (Except during the time period during boot from
  * when the first task is spawned until the rcu_set_runtime_mode()
- * core_initcall() is invoked, at which point everything is expedited.)
+ * early_initcall() is invoked, at which point everything is expedited.)
  */

ol rcu_gp_is_normal(void)
 {
@@ -235,7 +235,7 @@ static int __init rcu_set_runtime_mode(void)
        rcu_test_sync_prims();
        return 0;
 }
-core_initcall(rcu_set_runtime_mode);
+early_initcall(rcu_set_runtime_mode);   

 #endif /* #if !defined(CONFIG_TINY_RCU) || defined(CONFIG_SRCU) */
<snip>

Appreciate if you can test on your setup above patch!

--
Vlad Rezki
