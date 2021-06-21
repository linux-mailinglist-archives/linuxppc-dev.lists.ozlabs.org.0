Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F03AE950
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 14:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7q2X4cFLz3bs3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 22:43:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=VdvIKab7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=VdvIKab7; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7q240VMtz2yYP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 22:43:06 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id d196so29965782qkg.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+LmD+kQYl9KWjs3WNslIqBoSlOPQuU2PMBDArJmqyA=;
 b=VdvIKab7G0jo2Iatm0bZKpo6b5x9q7TuenDRzg4xMBROXbo7dXHRMAuHUNRT4X5X49
 MP5OCswylFTAdaGoRmn3zYkews7eHfimEYiWYETJTNlt40I+FhRNAsvY7O5doUZ967WK
 h5ODAJyX62fcITASLyuvxRVuhB5feJLwagG0dX2Lkt03GOAA1ScLgmAMdl5ItYFe8toY
 ffnSrMcZVU+XsUA9iQhYsHnUYCb6oaD/SheagejDd4E1gyk8Zi8VyKoWhLNkxzA9QZ+g
 UM8K/vDk8w4o5lGofyMjWvP+q0IqKupZNlK9R/Bul046zsn2cll3BhqdCSOOUzYcAfF/
 0C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+LmD+kQYl9KWjs3WNslIqBoSlOPQuU2PMBDArJmqyA=;
 b=dpRkESHosWWursbo1iggBb4699xAsthrzm2U8MrCySQpID+AVrERLGPeBKYvBrsZym
 wdYG3blYgCcUAHszNI8sTAtdmCUpvcwVemZermWqfd+JgyTSqa5oMNyExTvHKOEfRu95
 WCtJxjKoGAIcOWMIdoPnD/SUXHpsGBK8puTMPQ5MU5nkewym97wsrgWummKtkpXNqojJ
 lChyu19Bx7l2Tr7T12kM9xStlv8nnt21DIB5SN9jz8CAQFH5UQFd1qu8ARLBo1i8tvRY
 uVaLaX6OM6YcNEtve8teYYRHFEl0SJTmbdy+2xG2B/7Ya65SZ4/hPjIzu0FccpVMbOTI
 NB9g==
X-Gm-Message-State: AOAM531NfY4h7EGsVN4NOwpIFUWG6hFoYC2ax8mwWioeABmgy3I+iy/g
 YV2ppn63noelF9RhWPoEngM0F19B1XW3MVINvQS2vg==
X-Google-Smtp-Source: ABdhPJwfM0Hs1tHizl/QHRu2PUDcX/oBgvfaGVKpMS7oF13qGoYd12AouIA0LqBDOFXoR82/abxpkAcqAhub6+rGmYg=
X-Received: by 2002:ae9:dd06:: with SMTP id r6mr23422853qkf.74.1624279382697; 
 Mon, 21 Jun 2021 05:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
 <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
 <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
In-Reply-To: <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
From: Odin Ugedal <odin@uged.al>
Date: Mon, 21 Jun 2021 14:42:23 +0200
Message-ID: <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Odin Ugedal <odin@uged.al>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Did some more research, and it looks like this is what happens:

$ tree /sys/fs/cgroup/ltp/ -d --charset=ascii
/sys/fs/cgroup/ltp/
|-- drain
`-- test-6851
    `-- level2
        |-- level3a
        |   |-- worker1
        |   `-- worker2
        `-- level3b
            `-- worker3

Timeline (ish):
- worker3 gets throttled
- level3b is decayed, since it has no more load
- level2 get throttled
- worker3 get unthrottled
- level2 get unthrottled
  - worker3 is added to list
  - level3b is not added to list, since nr_running==0 and is decayed


The attached diff (based on
https://lore.kernel.org/lkml/20210518125202.78658-3-odin@uged.al/)
fixes the issue for me. Not the most elegant solution, but the
simplest one as of now, and to show what is wrong.

Any thoughts Vincent?

Thanks
Odin


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bfaa6e1f6067..aa32e9c29efd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -376,7 +376,8 @@ static inline bool list_add_leaf_cfs_rq(struct
cfs_rq *cfs_rq)
        return false;
 }

-static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
+/* Returns 1 if cfs_rq was present in the list and removed */
+static inline bool list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
        if (cfs_rq->on_list) {
                struct rq *rq = rq_of(cfs_rq);
@@ -393,7 +394,9 @@ static inline void list_del_leaf_cfs_rq(struct
cfs_rq *cfs_rq)

                list_del_rcu(&cfs_rq->leaf_cfs_rq_list);
                cfs_rq->on_list = 0;
+               return 1;
        }
+       return 0;
 }

 static inline void assert_list_leaf_cfs_rq(struct rq *rq)
@@ -3298,24 +3301,6 @@ static inline void cfs_rq_util_change(struct
cfs_rq *cfs_rq, int flags)

 #ifdef CONFIG_SMP
 #ifdef CONFIG_FAIR_GROUP_SCHED
-
-static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
-{
-       if (cfs_rq->load.weight)
-               return false;
-
-       if (cfs_rq->avg.load_sum)
-               return false;
-
-       if (cfs_rq->avg.util_sum)
-               return false;
-
-       if (cfs_rq->avg.runnable_sum)
-               return false;
-
-       return true;
-}
-
 /**
  * update_tg_load_avg - update the tg's load avg
  * @cfs_rq: the cfs_rq whose avg changed
@@ -4109,11 +4094,6 @@ static inline void update_misfit_status(struct
task_struct *p, struct rq *rq)

 #else /* CONFIG_SMP */

-static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
-{
-       return true;
-}
-
 #define UPDATE_TG      0x0
 #define SKIP_AGE_LOAD  0x0
 #define DO_ATTACH      0x0
@@ -4771,10 +4751,11 @@ static int tg_unthrottle_up(struct task_group
*tg, void *data)
        if (!cfs_rq->throttle_count) {
                cfs_rq->throttled_clock_task_time += rq_clock_task(rq) -
                                             cfs_rq->throttled_clock_task;
-
-               /* Add cfs_rq with load or one or more already running
entities to the list */
-               if (!cfs_rq_is_decayed(cfs_rq) || cfs_rq->nr_running)
+               if (cfs_rq->insert_on_unthrottle) {
                        list_add_leaf_cfs_rq(cfs_rq);
+                       if (tg->parent)
+
tg->parent->cfs_rq[cpu_of(rq)]->insert_on_unthrottle = true;
+                       }
        }

        return 0;
@@ -4788,7 +4769,7 @@ static int tg_throttle_down(struct task_group
*tg, void *data)
        /* group is entering throttled state, stop time */
        if (!cfs_rq->throttle_count) {
                cfs_rq->throttled_clock_task = rq_clock_task(rq);
-               list_del_leaf_cfs_rq(cfs_rq);
+               cfs_rq->insert_on_unthrottle = list_del_leaf_cfs_rq(cfs_rq);
        }
        cfs_rq->throttle_count++;

@@ -8019,6 +8000,23 @@ static bool __update_blocked_others(struct rq
*rq, bool *done)

 #ifdef CONFIG_FAIR_GROUP_SCHED

+static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
+{
+       if (cfs_rq->load.weight)
+               return false;
+
+       if (cfs_rq->avg.load_sum)
+               return false;
+
+       if (cfs_rq->avg.util_sum)
+               return false;
+
+       if (cfs_rq->avg.runnable_sum)
+               return false;
+
+       return true;
+}
+
 static bool __update_blocked_fair(struct rq *rq, bool *done)
 {
        struct cfs_rq *cfs_rq, *pos;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a189bec13729..12a707d99ee6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -602,6 +602,7 @@ struct cfs_rq {
        u64                     throttled_clock_task_time;
        int                     throttled;
        int                     throttle_count;
+       int                     insert_on_unthrottle;
        struct list_head        throttled_list;
 #endif /* CONFIG_CFS_BANDWIDTH */
 #endif /* CONFIG_FAIR_GROUP_SCHED */
