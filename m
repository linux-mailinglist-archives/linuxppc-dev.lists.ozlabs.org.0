Return-Path: <linuxppc-dev+bounces-639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C896200C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 08:52:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtw8m56mFz2yVT;
	Wed, 28 Aug 2024 16:52:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724827976;
	cv=none; b=ivuDvxExoy8JMITkjIzaVVQq/IP9X/YQ/EOntgRZDlFQ1iUpvLxbCvtnwHYfxuaRhfcuIMHafHpofahPWncROeJUO6UH4lj53T2INKpOqsXi2/DuHZb3AGXE8fKVbznu3z8Y3AbHJXEyar7MYfW6PKDblchYVUTLGqeSee3UsuyPHmlxpl4fBluCwHCyXUJk0ufB5WygrbMUPWFEXbbi1m2F1G2p2+6Wnu6qnYuC8htiMxHDe/J11kPzjBf6jf5mOhkrSPbQQxKw9wFgjygL9AYJ/enzr/iHgu7DnhsAAvGlR6EeJ0lFg2/gdtqdUYYzAxFfAUAO/uuXa9vLF5pV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724827976; c=relaxed/relaxed;
	bh=nPInF6T6RzDCnRPVdCv4mvGI1i9ybpdgsq3Rn+KFTjk=;
	h=X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:X-QQ-GoodBg:
	 X-BIZMAIL-ID:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID;
	b=KBGfLQboB8rd+E3osdM6vVL6GQJWPnjSIVrIq6Cg9weRCAG0t2m4mavbkU5A6tYCEZuYTBxkckHVGvZnnR03a9nFN8PpWOylSIr2JNrJC2pnbQI04KUO1hxwJ73RwdBn7awwGlKz00Si0Wm749sCs6cmxp5XSIBEwyp/8LddfBMtw/cYPMfQoapYLyCuGglbzECUyWPqHcbq1b0P1ayDti2ts5XN1C+bwAeS3VU5jIsqGDXCxVPSAAOkUL/VcDfG7wouoRT1b5uohFAWF352KGKRJgZcywJB5D2sS7gLJsUrmFjJEj+RJVo8yYZ1urw98CsdrnhfCyKwGdOq1TJTSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtw8l54d0z2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:52:55 +1000 (AEST)
X-QQ-mid: bizesmtpsz10t1724827845t6u5sv
X-QQ-Originating-IP: 4XErUzAeegOpAt/Xye4CSKyfGp6AsUdsR7koKUx/JO8=
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Aug 2024 14:50:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6561852366445271597
Date: Wed, 28 Aug 2024 14:50:19 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>,
	npiggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	mpe <mpe@ellerman.id.au>, "luming.yu" <luming.yu@gmail.com>,
	=?utf-8?B?5p2o5L2z6b6Z?= <jialong.yang@shingroup.cn>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
Message-ID: <B6A4506E3DD1F93F+Zs7Iq_EF799NyWHK@HX09040029.powercore.com.cn>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org>
 <8734vyn1ky.fsf@mail.lhotse>
 <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
 <0638f0a2-782b-411f-9937-c62d99e9562b@csgroup.eu>
 <tencent_4F2B3C0025D5A1722470D582@qq.com>
 <bd4908d2-cea9-406b-902f-618626e74c88@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd4908d2-cea9-406b-902f-618626e74c88@csgroup.eu>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Wed, Aug 28, 2024 at 07:46:52AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 28/08/2024 à 05:17, 虞陆铭 a écrit :
> > Hi,
> > 
> > it appears the little feature might require a little bit more work to find its value of the patch.
> > 
> > Using the following debug module ,  some debugging shows the TIF_USER_RETURN_NOTIFY
> > bit is propagated in __switch_to among tasks , but USER_RETURN_NOTIFY call back seems to
> > be dropped somewhere on somone who carries the bit return to user space.
> > side notes:
> > there is an issue that the module symbols is not appended to /sys/kernel/debug/tracing/available_filter_functions
> > which should be sovled first to make it easier for further debuggig.
> 
> As far as I can see, user return notifier infrastructure was implemented in
> 2009 for KVM on x86, see
> https://lore.kernel.org/all/1253105134-8862-1-git-send-email-avi@redhat.com/
> 
> Can you explain what is your usage of that infrastructure with your patch ?
> You are talking about debug, what's the added value, what is it used for ?
one example: I was thinking to live patch kernel at the moment that all cpus are
either returning to user space or going into idle. But I'm not sure if it is truly
valuable. secondly, it can help us get more accurate user/system time 
accounting via tracing rather than through sampling technique. 
The third: it could have similar usages in kvm for ppc as x86 for tsc_aux. 
etc :-)
> 
> Thanks
> Christophe
> 
> > 
> > [root@localhost linux]# cat lib/user-return-test.c
> > #include <linux/module.h>
> > #include <linux/kernel.h>
> > #include <linux/init.h>
> > #include <linux/container_of.h>
> > #include <linux/user-return-notifier.h>
> > #include <linux/delay.h>
> > #include <linux/kthread.h>
> > #include <linux/sched.h>
> > 
> > MODULE_LICENSE("GPL");
> > 
> > 
> > struct test_user_return {
> >          struct user_return_notifier urn;
> >          bool registered;
> >          int urn_value_changed;
> >          struct task_struct *worker;
> > };
> > 
> > static struct test_user_return __percpu *user_return_test;
> > 
> > static void test_user_return_cb(struct user_return_notifier *urn)
> > {
> >          struct test_user_return *tur =
> >                  container_of(urn, struct test_user_return, urn);
> >          unsigned long flags;
> > 
> >          local_irq_save(flags);
> >          tur->urn_value_changed++;
> >          local_irq_restore(flags);
> >          return;
> > }
> > 
> > static int test_user_return_worker(void *tur)
> > {
> >          struct test_user_return *t;
> >          t = (struct test_user_return *) tur;
> >          preempt_disable();
> >          user_return_notifier_register(&t->urn);
> >          preempt_enable();
> >          t->registered = true;
> >          while (!kthread_should_stop()) {
> >                  static int err_rate = 0;
> > 
> >                  msleep (1000);
> >                  if (!test_thread_flag(TIF_USER_RETURN_NOTIFY) && (err_rate == 0)) {
> >                          pr_err("TIF_USER_RETURN_NOTIFY is lost");
> >                          err_rate++;
> >                  }
> >          }
> >          return 0;
> > }
> > static int init_test_user_return(void)
> > {
> >          int r = 0;
> > 
> >          user_return_test = alloc_percpu(struct test_user_return);
> >          if (!user_return_test) {
> >                  pr_err("failed to allocate percpu test_user_return\n");
> >                  r = -ENOMEM;
> >                  goto exit;
> >          }
> >          {
> >                  unsigned int cpu;
> >                  struct task_struct *task;
> >                  struct test_user_return *tur;
> > 
> >                  for_each_online_cpu(cpu) {
> >                          tur = per_cpu_ptr(user_return_test, cpu);
> >                          if (!tur->registered) {
> >                                  tur->urn.on_user_return = test_user_return_cb;
> >                                  task = kthread_create(test_user_return_worker,
> >                                          tur, "test_user_return");
> >                                  if (IS_ERR(task))
> >                                          pr_err("no test_user_return kthread created for cpu %d",cpu);
> >                                  else {
> >                                          tur->worker = task;
> >                                          wake_up_process(task);
> >                                  }
> >                          }
> >                  }
> >          }
> > 
> > exit:
> >          return r;
> > }
> > static void exit_test_user_return(void)
> > {
> >          struct test_user_return *tur;
> >          int i,ret=0;
> > 
> >          for_each_online_cpu(i) {
> >                  tur = per_cpu_ptr(user_return_test, i);
> >                  if (tur->registered) {
> >                          pr_info("[cpu=%d, %d] ", i, tur->urn_value_changed);
> >                          user_return_notifier_unregister(&tur->urn);
> >                          tur->registered = false;
> >                  }
> >                  if (tur->worker) {
> >                          ret = kthread_stop(tur->worker);
> >                          if (ret)
> >                                  pr_err("can't stop test_user_return kthread for cpu %d", i);
> >                  }
> >          }
> >          free_percpu(user_return_test);
> >          return;
> > }
> > 
> > module_init(init_test_user_return);
> > module_exit(exit_test_user_return);
> > 
> > ------------------ Original ------------------
> > From:  "Christophe Leroy"<christophe.leroy@csgroup.eu>;
> > Date:  Tue, Feb 20, 2024 05:02 PM
> > To:  "mpe"<mpe@ellerman.id.au>; "Aneesh Kumar K.V"<aneesh.kumar@kernel.org>; "虞陆铭"<luming.yu@shingroup.cn>; "linuxppc-dev"<linuxppc-dev@lists.ozlabs.org>; "linux-kernel"<linux-kernel@vger.kernel.org>; "npiggin"<npiggin@gmail.com>;
> > Cc:  "shenghui.qu@shingroup.cn"<shenghui.qu@shingroup.cn>; "dawei.li@shingroup.cn"<dawei.li@shingroup.cn>; "ke.zhao@shingroup.cn"<ke.zhao@shingroup.cn>; "luming.yu"<luming.yu@gmail.com>;
> > Subject:  Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier infrastructure
> > 
> > 
> > 
> > 
> > Le 20/02/2024 à 09:51, Christophe Leroy a écrit :
> > > 
> > > 
> > > Le 19/12/2023 à 07:33, Michael Ellerman a écrit :
> > > > Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> > > > > Luming Yu <luming.yu@shingroup.cn> writes:
> > > > > 
> > > > > > Before we have powerpc to use the generic entry infrastructure,
> > > > > > the call to fire user return notifier is made temporarily in powerpc
> > > > > > entry code.
> > > > > > 
> > > > > 
> > > > > It is still not clear what will be registered as user return notifier.
> > > > > Can you summarize that here?
> > > > 
> > > > fire_user_return_notifiers() is defined in kernel/user-return-notifier.c
> > > > 
> > > > That's built when CONFIG_USER_RETURN_NOTIFIER=y.
> > > > 
> > > > That is not user selectable, it's only enabled by:
> > > > 
> > > > arch/x86/kvm/Kconfig:        select USER_RETURN_NOTIFIER
> > > > 
> > > > So it looks to me like (currently) it's always a nop and does nothing.
> > > > 
> > > > Which makes me wonder what the point of wiring this feature up is :)
> > > > Maybe it's needed for some other feature I don't know about?
> > > > 
> > > > Arguably we could just enable it because we can, and it currently does
> > > > nothing so it's unlikely to break anything. But that also makes it
> > > > impossible to test the implementation is correct, and runs the risk that
> > > > one day in the future when it does get enabled only then do we discover
> > > > it doesn't work.
> > > 
> > > Opened an "issue" for the day we need it:
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FKSPP%2Flinux%2Fissues%2F348&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cd9e9b6315413430cfba108dcc7100633%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638604118862628419%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=iIYQTodb9zrGdfmzvnZrIVZ%2BKh2qZjMjT29ddkUpGIw%3D&reserved=0
> > 
> > Correct one is https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Flinuxppc%2Fissues%2Fissues%2F477&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cd9e9b6315413430cfba108dcc7100633%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638604118862637095%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=aJRVdRWu%2F7NQ13jQ6yFLBynXIIfPPPQ3nS4FxiXGNyw%3D&reserved=0
> 


