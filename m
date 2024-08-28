Return-Path: <linuxppc-dev+bounces-634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9265961E5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 07:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtthj2kqjz2yVB;
	Wed, 28 Aug 2024 15:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724824021;
	cv=none; b=ebRzeK7Qlk/Qgww2D2e+J/DYrAOd0XhyC8/7WCYqJscoa9eBxFK62k1AHndxXW05m+ryDE7VRT8VEDocyBrNfcOEmjRpKZEQASgZqul5LY6X+p1qaMmRnzRk7UQZlaRdjNs2x9/QhbkjKOK8RzRxLa8q84bIfg6VAiznQgotIdB0SRy530+VwYkg+wezoCMqx7zf01EDC7k5LW5R7yzBxjZMaaF3F75FpO+l+T6KFHEV/COAH1PHBcXcXs1nokutCP9qzDvRiz712j8SrtxCxwwY7C/MyqRw6Cf+RuOsq37jLqHWIrcBr/ywZJixAbYeiGDGALYyy1xqS8Hfb/Mymw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724824021; c=relaxed/relaxed;
	bh=ahec4yS/C5grMBYIF5n7DxeQK1CzH96nT7mMxhCFr3s=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=SHkwpBXCK5cWli6SCtVh0mYFXBPtmo23MettTVzxiCNe+dZE28Yyr8hv4Sf9JbQd31Tej1CokQEtHA9rpW3HQBBnB0YxEuylJUfbyb/AsNv8coXInQt22bOGf8KpLu0rj20NlSu64gfxWi1gRrvotNmQOwJlMoEjZMg1kMvdGy/Kt2ZrtTJVtVf7fM6lQPAJVo9rjhHt4my79a2206NZsklmGtebySRM+XaN8x2VHYeGwGiEteUht/EHEJlbanflkbMmIDBp4uyFTq1Z5FlpZBqZDFaRqOY7yvl4HwGtsohyIdQpDHgL/SDOe3PmtoLReBAsSi2/9W5/77aC7wnxww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtthj0M5jz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:46:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtthY439fz9sRy;
	Wed, 28 Aug 2024 07:46:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WURQqgcv68Sw; Wed, 28 Aug 2024 07:46:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtthY2Vnhz9sRs;
	Wed, 28 Aug 2024 07:46:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EC5A8B77D;
	Wed, 28 Aug 2024 07:46:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lLmlTUzjpCpN; Wed, 28 Aug 2024 07:46:53 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 09DBF8B764;
	Wed, 28 Aug 2024 07:46:53 +0200 (CEST)
Message-ID: <bd4908d2-cea9-406b-902f-618626e74c88@csgroup.eu>
Date: Wed, 28 Aug 2024 07:46:52 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
To: =?UTF-8?B?6Jme6ZmG6ZOt?= <luming.yu@shingroup.cn>
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>,
 npiggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 mpe <mpe@ellerman.id.au>, "luming.yu" <luming.yu@gmail.com>,
 =?UTF-8?B?5p2o5L2z6b6Z?= <jialong.yang@shingroup.cn>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org> <8734vyn1ky.fsf@mail.lhotse>
 <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
 <0638f0a2-782b-411f-9937-c62d99e9562b@csgroup.eu>
 <tencent_4F2B3C0025D5A1722470D582@qq.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <tencent_4F2B3C0025D5A1722470D582@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 28/08/2024 à 05:17, 虞陆铭 a écrit :
> Hi,
> 
> it appears the little feature might require a little bit more work to find its value of the patch.
> 
> Using the following debug module ,  some debugging shows the TIF_USER_RETURN_NOTIFY
> bit is propagated in __switch_to among tasks , but USER_RETURN_NOTIFY call back seems to
> be dropped somewhere on somone who carries the bit return to user space.
> side notes:
> there is an issue that the module symbols is not appended to /sys/kernel/debug/tracing/available_filter_functions
> which should be sovled first to make it easier for further debuggig.

As far as I can see, user return notifier infrastructure was implemented 
in 2009 for KVM on x86, see 
https://lore.kernel.org/all/1253105134-8862-1-git-send-email-avi@redhat.com/

Can you explain what is your usage of that infrastructure with your 
patch ? You are talking about debug, what's the added value, what is it 
used for ?

Thanks
Christophe

> 
> [root@localhost linux]# cat lib/user-return-test.c
> #include <linux/module.h>
> #include <linux/kernel.h>
> #include <linux/init.h>
> #include <linux/container_of.h>
> #include <linux/user-return-notifier.h>
> #include <linux/delay.h>
> #include <linux/kthread.h>
> #include <linux/sched.h>
> 
> MODULE_LICENSE("GPL");
> 
> 
> struct test_user_return {
>          struct user_return_notifier urn;
>          bool registered;
>          int urn_value_changed;
>          struct task_struct *worker;
> };
> 
> static struct test_user_return __percpu *user_return_test;
> 
> static void test_user_return_cb(struct user_return_notifier *urn)
> {
>          struct test_user_return *tur =
>                  container_of(urn, struct test_user_return, urn);
>          unsigned long flags;
> 
>          local_irq_save(flags);
>          tur->urn_value_changed++;
>          local_irq_restore(flags);
>          return;
> }
> 
> static int test_user_return_worker(void *tur)
> {
>          struct test_user_return *t;
>          t = (struct test_user_return *) tur;
>          preempt_disable();
>          user_return_notifier_register(&t->urn);
>          preempt_enable();
>          t->registered = true;
>          while (!kthread_should_stop()) {
>                  static int err_rate = 0;
> 
>                  msleep (1000);
>                  if (!test_thread_flag(TIF_USER_RETURN_NOTIFY) && (err_rate == 0)) {
>                          pr_err("TIF_USER_RETURN_NOTIFY is lost");
>                          err_rate++;
>                  }
>          }
>          return 0;
> }
> static int init_test_user_return(void)
> {
>          int r = 0;
> 
>          user_return_test = alloc_percpu(struct test_user_return);
>          if (!user_return_test) {
>                  pr_err("failed to allocate percpu test_user_return\n");
>                  r = -ENOMEM;
>                  goto exit;
>          }
>          {
>                  unsigned int cpu;
>                  struct task_struct *task;
>                  struct test_user_return *tur;
> 
>                  for_each_online_cpu(cpu) {
>                          tur = per_cpu_ptr(user_return_test, cpu);
>                          if (!tur->registered) {
>                                  tur->urn.on_user_return = test_user_return_cb;
>                                  task = kthread_create(test_user_return_worker,
>                                          tur, "test_user_return");
>                                  if (IS_ERR(task))
>                                          pr_err("no test_user_return kthread created for cpu %d",cpu);
>                                  else {
>                                          tur->worker = task;
>                                          wake_up_process(task);
>                                  }
>                          }
>                  }
>          }
> 
> exit:
>          return r;
> }
> static void exit_test_user_return(void)
> {
>          struct test_user_return *tur;
>          int i,ret=0;
> 
>          for_each_online_cpu(i) {
>                  tur = per_cpu_ptr(user_return_test, i);
>                  if (tur->registered) {
>                          pr_info("[cpu=%d, %d] ", i, tur->urn_value_changed);
>                          user_return_notifier_unregister(&tur->urn);
>                          tur->registered = false;
>                  }
>                  if (tur->worker) {
>                          ret = kthread_stop(tur->worker);
>                          if (ret)
>                                  pr_err("can't stop test_user_return kthread for cpu %d", i);
>                  }
>          }
>          free_percpu(user_return_test);
>          return;
> }
> 
> module_init(init_test_user_return);
> module_exit(exit_test_user_return);
> 
>   
> ------------------ Original ------------------
> From:  "Christophe Leroy"<christophe.leroy@csgroup.eu>;
> Date:  Tue, Feb 20, 2024 05:02 PM
> To:  "mpe"<mpe@ellerman.id.au>; "Aneesh Kumar K.V"<aneesh.kumar@kernel.org>; "虞陆铭"<luming.yu@shingroup.cn>; "linuxppc-dev"<linuxppc-dev@lists.ozlabs.org>; "linux-kernel"<linux-kernel@vger.kernel.org>; "npiggin"<npiggin@gmail.com>;
> Cc:  "shenghui.qu@shingroup.cn"<shenghui.qu@shingroup.cn>; "dawei.li@shingroup.cn"<dawei.li@shingroup.cn>; "ke.zhao@shingroup.cn"<ke.zhao@shingroup.cn>; "luming.yu"<luming.yu@gmail.com>;
> Subject:  Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier infrastructure
> 
>   
> 
> 
> 
> Le 20/02/2024 à 09:51, Christophe Leroy a écrit :
>>
>>
>> Le 19/12/2023 à 07:33, Michael Ellerman a écrit :
>>> Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
>>>> Luming Yu <luming.yu@shingroup.cn> writes:
>>>>
>>>>> Before we have powerpc to use the generic entry infrastructure,
>>>>> the call to fire user return notifier is made temporarily in powerpc
>>>>> entry code.
>>>>>
>>>>
>>>> It is still not clear what will be registered as user return notifier.
>>>> Can you summarize that here?
>>>
>>> fire_user_return_notifiers() is defined in kernel/user-return-notifier.c
>>>
>>> That's built when CONFIG_USER_RETURN_NOTIFIER=y.
>>>
>>> That is not user selectable, it's only enabled by:
>>>
>>> arch/x86/kvm/Kconfig:        select USER_RETURN_NOTIFIER
>>>
>>> So it looks to me like (currently) it's always a nop and does nothing.
>>>
>>> Which makes me wonder what the point of wiring this feature up is :)
>>> Maybe it's needed for some other feature I don't know about?
>>>
>>> Arguably we could just enable it because we can, and it currently does
>>> nothing so it's unlikely to break anything. But that also makes it
>>> impossible to test the implementation is correct, and runs the risk that
>>> one day in the future when it does get enabled only then do we discover
>>> it doesn't work.
>>
>> Opened an "issue" for the day we need it:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FKSPP%2Flinux%2Fissues%2F348&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cd9e9b6315413430cfba108dcc7100633%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638604118862628419%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=iIYQTodb9zrGdfmzvnZrIVZ%2BKh2qZjMjT29ddkUpGIw%3D&reserved=0
> 
> Correct one is https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Flinuxppc%2Fissues%2Fissues%2F477&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cd9e9b6315413430cfba108dcc7100633%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638604118862637095%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=aJRVdRWu%2F7NQ13jQ6yFLBynXIIfPPPQ3nS4FxiXGNyw%3D&reserved=0

