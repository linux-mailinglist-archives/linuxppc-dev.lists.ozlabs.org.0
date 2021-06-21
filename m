Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED043AEE13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 18:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7vw72Xskz3brv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 02:23:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gm2DSLrP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f;
 helo=mail-wr1-x42f.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gm2DSLrP; dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7vvd0ydFz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 02:22:50 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id f2so20318633wri.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ZnyDvnG5ZhYgMn6tMi27bIwWL9AbU2dgk9vvsELPdRU=;
 b=gm2DSLrPi//j9X/mkUegCOP3/S6a37EAmqSALOuICpRdlXNwUbiep/D63aqxU5TK6N
 We/SX5m7sprl9iqJdw+3XoEUiPNokE/0ONZs1nt33QltP8UklmBn7PttwaMEFgdj+0GP
 6sXECTAiSiTb2LTlDVpcyiABLCAf70pVVXkCNr/CTzhw8HgYZ8cLD4KXqG5ahwEI+0pO
 1Ru62ne6wtI59ttbbqx8f1ovjBSaF3zr2pvY04mFGbDpGDnQpzxQrA2nnaz4LOsY7DeO
 MFKeTXutMm0/U9Vvvqcb7NyQo7Vd18fMzCU2FFWaQErhBzBq5hE+B10iDWwaLHULyve0
 Gerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZnyDvnG5ZhYgMn6tMi27bIwWL9AbU2dgk9vvsELPdRU=;
 b=A9muQSFsXAHVSF7TeRvMYlQs3AAvL8/lPfzGY7PXLOOOhYV4pfV2Z7HYRieJ7f7ZHQ
 Nod5lb6irtowbvjlBktSc5Q/o2hdjF+/BudbzfdLAXWIdql8wIPtP3N3b7adADDArx35
 yx4qAebw4mhW/n/IAZ77p91JNCU3IPH7X+wlUZUl9ugi0yhM3rlE0eW9AOViB79n09/0
 Fy2GHobMxUMQXOWa5FaAzea40WPZUH56IlX3x7TFBbslHUDl6yYsd4XO3+ZAnVgZJHnZ
 CVyUUqT+weHSyJ9Misea4J6VVYagtRuUzcRfXwbEWDtL+Ni4cPt0ZQ6FbYIu43tTDdm/
 o0/Q==
X-Gm-Message-State: AOAM532EGTJmxe1jUfL0PBhh34xHecLDSiyuWfjo1Y7grAkCPDYA3qrs
 5aXY5kW0rR2Lus9voYeBS+uOBA==
X-Google-Smtp-Source: ABdhPJyzWjDLNL4IaffbXnCeqNGNS44dCOSMg3X8j0ZKdhaiJMMvgGSz+ElCqIJyN8CUxDL1PsPmyQ==
X-Received: by 2002:a5d:66c6:: with SMTP id k6mr28769322wrw.422.1624292565531; 
 Mon, 21 Jun 2021 09:22:45 -0700 (PDT)
Received: from vingu-book ([2a01:e0a:f:6020:7073:a754:9f82:97c1])
 by smtp.gmail.com with ESMTPSA id k16sm19052901wrn.96.2021.06.21.09.22.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jun 2021 09:22:44 -0700 (PDT)
Date: Mon, 21 Jun 2021 18:22:43 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Odin Ugedal <odin@uged.al>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
Message-ID: <20210621162243.GA29874@vingu-book>
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
 <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
 <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
 <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le lundi 21 juin 2021 à 14:42:23 (+0200), Odin Ugedal a écrit :
> Hi,
> 
> Did some more research, and it looks like this is what happens:
> 
> $ tree /sys/fs/cgroup/ltp/ -d --charset=ascii
> /sys/fs/cgroup/ltp/
> |-- drain
> `-- test-6851
>     `-- level2
>         |-- level3a
>         |   |-- worker1
>         |   `-- worker2
>         `-- level3b
>             `-- worker3
> 
> Timeline (ish):
> - worker3 gets throttled
> - level3b is decayed, since it has no more load
> - level2 get throttled
> - worker3 get unthrottled
> - level2 get unthrottled
>   - worker3 is added to list
>   - level3b is not added to list, since nr_running==0 and is decayed
> 
> 
> The attached diff (based on
> https://lore.kernel.org/lkml/20210518125202.78658-3-odin@uged.al/)
> fixes the issue for me. Not the most elegant solution, but the
> simplest one as of now, and to show what is wrong.
> 
> Any thoughts Vincent?


I would prefer that we use the reason of adding the cfs in the list instead.

Something like the below should also fixed the problem. It is based on a
proposal I made to Rik sometimes ago when he tried to flatten the rq:
https://lore.kernel.org/lkml/20190906191237.27006-6-riel@surriel.com/

This will ensure that a cfs is added in the list whenever one of its  child
is still in the list. 

---
 kernel/sched/fair.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ea7de54cb022..e751061a9449 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3272,6 +3272,31 @@ static inline void cfs_rq_util_change(struct cfs_rq *cfs_rq, int flags)

 #ifdef CONFIG_SMP
 #ifdef CONFIG_FAIR_GROUP_SCHED
+/*
+ * Because list_add_leaf_cfs_rq always places a child cfs_rq on the list
+ * immediately before a parent cfs_rq, and cfs_rqs are removed from the list
+ * bottom-up, we only have to test whether the cfs_rq before us on the list
+ * is our child.
+ * If cfs_rq is not on the list, test wether a child needs its to be added to
+ * connect a branch to the tree  * (see list_add_leaf_cfs_rq() for details).
+ */
+static inline bool child_cfs_rq_on_list(struct cfs_rq *cfs_rq)
+{
+	struct cfs_rq *prev_cfs_rq;
+	struct list_head *prev;
+
+	if (cfs_rq->on_list) {
+		prev = cfs_rq->leaf_cfs_rq_list.prev;
+	} else {
+		struct rq *rq = rq_of(cfs_rq);
+
+		prev = rq->tmp_alone_branch;
+	}
+
+	prev_cfs_rq = container_of(prev, struct cfs_rq, leaf_cfs_rq_list);
+
+	return (prev_cfs_rq->tg->parent == cfs_rq->tg);
+}

 static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
 {
@@ -3287,6 +3312,9 @@ static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
 	if (cfs_rq->avg.runnable_sum)
 		return false;

+	if (child_cfs_rq_on_list(cfs_rq))
+		return false;
+
 	return true;
 }

--
2.17.1



> 
> Thanks
> Odin
> 
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bfaa6e1f6067..aa32e9c29efd 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -376,7 +376,8 @@ static inline bool list_add_leaf_cfs_rq(struct
> cfs_rq *cfs_rq)
>         return false;
>  }
> 
> -static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
> +/* Returns 1 if cfs_rq was present in the list and removed */
> +static inline bool list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
>  {
>         if (cfs_rq->on_list) {
>                 struct rq *rq = rq_of(cfs_rq);
> @@ -393,7 +394,9 @@ static inline void list_del_leaf_cfs_rq(struct
> cfs_rq *cfs_rq)
> 
>                 list_del_rcu(&cfs_rq->leaf_cfs_rq_list);
>                 cfs_rq->on_list = 0;
> +               return 1;
>         }
> +       return 0;
>  }
> 
>  static inline void assert_list_leaf_cfs_rq(struct rq *rq)
> @@ -3298,24 +3301,6 @@ static inline void cfs_rq_util_change(struct
> cfs_rq *cfs_rq, int flags)
> 
>  #ifdef CONFIG_SMP
>  #ifdef CONFIG_FAIR_GROUP_SCHED
> -
> -static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
> -{
> -       if (cfs_rq->load.weight)
> -               return false;
> -
> -       if (cfs_rq->avg.load_sum)
> -               return false;
> -
> -       if (cfs_rq->avg.util_sum)
> -               return false;
> -
> -       if (cfs_rq->avg.runnable_sum)
> -               return false;
> -
> -       return true;
> -}
> -
>  /**
>   * update_tg_load_avg - update the tg's load avg
>   * @cfs_rq: the cfs_rq whose avg changed
> @@ -4109,11 +4094,6 @@ static inline void update_misfit_status(struct
> task_struct *p, struct rq *rq)
> 
>  #else /* CONFIG_SMP */
> 
> -static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
> -{
> -       return true;
> -}
> -
>  #define UPDATE_TG      0x0
>  #define SKIP_AGE_LOAD  0x0
>  #define DO_ATTACH      0x0
> @@ -4771,10 +4751,11 @@ static int tg_unthrottle_up(struct task_group
> *tg, void *data)
>         if (!cfs_rq->throttle_count) {
>                 cfs_rq->throttled_clock_task_time += rq_clock_task(rq) -
>                                              cfs_rq->throttled_clock_task;
> -
> -               /* Add cfs_rq with load or one or more already running
> entities to the list */
> -               if (!cfs_rq_is_decayed(cfs_rq) || cfs_rq->nr_running)
> +               if (cfs_rq->insert_on_unthrottle) {
>                         list_add_leaf_cfs_rq(cfs_rq);
> +                       if (tg->parent)
> +
> tg->parent->cfs_rq[cpu_of(rq)]->insert_on_unthrottle = true;
> +                       }
>         }
> 
>         return 0;
> @@ -4788,7 +4769,7 @@ static int tg_throttle_down(struct task_group
> *tg, void *data)
>         /* group is entering throttled state, stop time */
>         if (!cfs_rq->throttle_count) {
>                 cfs_rq->throttled_clock_task = rq_clock_task(rq);
> -               list_del_leaf_cfs_rq(cfs_rq);
> +               cfs_rq->insert_on_unthrottle = list_del_leaf_cfs_rq(cfs_rq);
>         }
>         cfs_rq->throttle_count++;
> 
> @@ -8019,6 +8000,23 @@ static bool __update_blocked_others(struct rq
> *rq, bool *done)
> 
>  #ifdef CONFIG_FAIR_GROUP_SCHED
> 
> +static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
> +{
> +       if (cfs_rq->load.weight)
> +               return false;
> +
> +       if (cfs_rq->avg.load_sum)
> +               return false;
> +
> +       if (cfs_rq->avg.util_sum)
> +               return false;
> +
> +       if (cfs_rq->avg.runnable_sum)
> +               return false;
> +
> +       return true;
> +}
> +
>  static bool __update_blocked_fair(struct rq *rq, bool *done)
>  {
>         struct cfs_rq *cfs_rq, *pos;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index a189bec13729..12a707d99ee6 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -602,6 +602,7 @@ struct cfs_rq {
>         u64                     throttled_clock_task_time;
>         int                     throttled;
>         int                     throttle_count;
> +       int                     insert_on_unthrottle;
>         struct list_head        throttled_list;
>  #endif /* CONFIG_CFS_BANDWIDTH */
>  #endif /* CONFIG_FAIR_GROUP_SCHED */
