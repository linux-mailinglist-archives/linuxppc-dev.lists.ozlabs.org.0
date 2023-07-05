Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5F3747EA0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 09:53:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XE9yz12V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwsNM0ct6z30fS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 17:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XE9yz12V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwsMW53rlz2xq6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 17:52:37 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-314417861b9so1402918f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688543550; x=1691135550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAPyRu94/9pRok4+3blJRth1W3/gDiTcfE5m0+8MEzk=;
        b=XE9yz12VrrCYaxnDROcXiCBiUJ//62vweHsx/pzFiSM8LSzZrcaXzrHF9OejcsO53D
         5vhplYrmRvNzp7w6Fl5tPLJbTIkkOj6txCvoAlA1k7mGasWEOMKEw+/Re4UYu+/AmY52
         oFvO+GNbbeQe89mQP9GQ8o2yBNs11zbDowJjtBmMEu3LHMDH2HMT9NB5H1uegAjveBzu
         mOKWgUEvZF/LNumlIqoqBxrLacrCov4OjfFttRsBkrNt25vjyZDPn4oSAG/5IXhP/Yoq
         DpRVmf98UrwGt7h5+0fKblcdCeqZbNABckFk+I2FZk8YLe5rIpnnV58iHIHqIAa8AyE7
         IKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688543550; x=1691135550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAPyRu94/9pRok4+3blJRth1W3/gDiTcfE5m0+8MEzk=;
        b=fRkk1Kk4FzG4ZuBURXc4FSVbNHbw9s026uDajnZVc1gqeNVE5GTOVDfZAZ/8qygU53
         dh2pRqEnPdJ8zRgOPdqrlJtUZqv0BUP2bPW9D3f+63cFba30ryDGx0TdqBsK+PAtk/uG
         5k1dAnVYVcwYPBJtQmExWEF4ZzCVl9t+VQRX2NzZj+5cIBBFeMUOtBgr524ukfWp6ksD
         TzgbvewX8QU2L9eJuSQ2z+dn+0IgDeTBiMvYTVwFQ8NBe+tEXj0NZsPxfj1NpOcNG5Ud
         wmDrrngEF5aLiUpc9BXov9FGcEyD9tYiD0pOZU0CKndIaCaCOXNn3+fw1n0+keCNdVE8
         KV+Q==
X-Gm-Message-State: ABy/qLanIqiTyfd2tUIc02KtTitL9Tw2Q3PPK/GbnVr33pEtITCyR8YG
	a4xssc7kUWQGI+TPCnrL9w9wLg==
X-Google-Smtp-Source: APBJJlG5qDvlO24YWU/IRuaOVQ5nroxFlINnrDWuLLGg4h38uzR+LjCipzR7Dytp+yz09bAGyKwiIw==
X-Received: by 2002:a5d:5002:0:b0:314:12be:9f2 with SMTP id e2-20020a5d5002000000b0031412be09f2mr13017597wrt.46.1688543550357;
        Wed, 05 Jul 2023 00:52:30 -0700 (PDT)
Received: from vingu-book ([2a01:e0a:f:6020:d2ac:6ebc:2c4c:c472])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b0031433760a92sm8689236wrq.115.2023.07.05.00.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 00:52:30 -0700 (PDT)
Date: Wed, 5 Jul 2023 09:52:28 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Tobias Huschle <huschle@linux.ibm.com>
Subject: Re: [RFC 1/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
Message-ID: <ZKUhPO3xcvCfjWfe@vingu-book>
References: <20230515114601.12737-1-huschle@linux.ibm.com>
 <20230515114601.12737-2-huschle@linux.ibm.com>
 <CAKfTPtC9050oY2EikUTAXTL8pAui3L+Sr4DBS0T-TccGNaA2hw@mail.gmail.com>
 <9021d4d99370162a815928cd6467f4a5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9021d4d99370162a815928cd6467f4a5@linux.ibm.com>
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le lundi 05 juin 2023 à 10:07:16 (+0200), Tobias Huschle a écrit :
> On 2023-05-16 15:36, Vincent Guittot wrote:
> > On Mon, 15 May 2023 at 13:46, Tobias Huschle <huschle@linux.ibm.com>
> > wrote:
> > > 
> > > The current load balancer implementation implies that scheduler
> > > groups,
> > > within the same domain, all host the same number of CPUs. This is
> > > reflected in the condition, that a scheduler group, which is load
> > > balancing and classified as having spare capacity, should pull work
> > > from the busiest group, if the local group runs less processes than
> > > the busiest one. This implies that these two groups should run the
> > > same number of processes, which is problematic if the groups are not
> > > of the same size.
> > > 
> > > The assumption that scheduler groups within the same scheduler domain
> > > host the same number of CPUs appears to be true for non-s390
> > > architectures. Nevertheless, s390 can have scheduler groups of unequal
> > > size.
> > > 
> > > This introduces a performance degredation in the following scenario:
> > > 
> > > Consider a system with 8 CPUs, 6 CPUs are located on one CPU socket,
> > > the remaining 2 are located on another socket:
> > > 
> > > Socket   -----1-----    -2-
> > > CPU      1 2 3 4 5 6    7 8
> > > 
> > > Placing some workload ( x = one task ) yields the following
> > > scenarios:
> > > 
> > > The first 5 tasks are distributed evenly across the two groups.
> > > 
> > > Socket   -----1-----    -2-
> > > CPU      1 2 3 4 5 6    7 8
> > >          x x x          x x
> > > 
> > > Adding a 6th task yields the following distribution:
> > > 
> > > Socket   -----1-----    -2-
> > > CPU      1 2 3 4 5 6    7 8
> > > SMT1     x x x          x x
> > > SMT2                    x
> > 
> > Your description is a bit confusing for me. What you name CPU above
> > should be named Core, doesn' it ?
> > 
> > Could you share with us your scheduler topology ?
> > 
> 
> You are correct, it should say core instead of CPU.
> 
> One actual configuration from one of my test machines (lscpu -e):
> 

[...]

> 
> So, 6 cores / 12 CPUs in one group 2 cores / 4 CPUs in the other.

Thaks for the details

> 
> If I run stress-ng with 8 cpu stressors on the original code I get a
> distribution
> like this:
> 
> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>                 x     x     x     x      x  x  x  x
> 
> Which means that the two cores in the smaller group are running into SMT
> while two
> cores in the larger group are still idle. This is caused by the
> prefer_sibling path
> which really wants to see both groups run the same number of tasks.

yes and it considers that there are the same number of CPUs per group

> 
> > > 
> > > The task is added to the 2nd scheduler group, as the scheduler has the
> > > assumption that scheduler groups are of the same size, so they should
> > > also host the same number of tasks. This makes CPU 7 run into SMT
> > > thread, which comes with a performance penalty. This means, that in
> > > the window of 6-8 tasks, load balancing is done suboptimally, because
> > > SMT is used although there is no reason to do so as fully idle CPUs
> > > are still available.
> > > 
> > > Taking the weight of the scheduler groups into account, ensures that
> > > a load balancing CPU within a smaller group will not try to pull tasks
> > > from a bigger group while the bigger group still has idle CPUs
> > > available.
> > > 
> > > Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> > > ---
> > >  kernel/sched/fair.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 48b6f0ca13ac..b1307d7e4065 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -10426,7 +10426,8 @@ static struct sched_group
> > > *find_busiest_group(struct lb_env *env)
> > >          * group's child domain.
> > >          */
> > >         if (sds.prefer_sibling && local->group_type ==
> > > group_has_spare &&
> > > -           busiest->sum_nr_running > local->sum_nr_running + 1)
> > > +           busiest->sum_nr_running * local->group_weight >
> > > +                       local->sum_nr_running *
> > > busiest->group_weight + 1)


what you want to test here is that moving 1 task from busiest to local group
would help and balance the ratio of tasks per cpu

(busiest->sum_nr_running - 1) / busiest->group_weight > (local->sum_nr_running + 1) / local->group_weight

which can be develop into

busiest->sum_nr_running * local->group_weight >= local->sum_nr_running * busiest->group_weight + busiest->group_weight + local->group_weight

and you also have to change how we calculate the imbalance which just provide the half of the diff of nr_running

by something like

(busiest->sum_nr_running * local->group_weight) - (local->sum_nr_running * busiest->group_weight) / (busiest->group_weight + local->group_weight)

> > 
> > This is the prefer_sibling path. Could it be that you should disable
> > prefer_siling between your sockets for such topology ? the default
> > path compares the number of idle CPUs when groups has spare capacity
> > 
> > 
> 
> If I disable prefer_sibling (I played around with it a bit), I run into the
> problem,
> that the tasks are distributed s.t. each group has the same amount of idle
> CPUs, which
> yields distributions similar to this:
> 
> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>     x  x  x     x  x     x     x  x
> 
> Now both groups have 4 idle CPUs which fulfills the criteria imposed by the
> load balancer,
> but the larger group is now running SMT while the smaller one is just idle.
> 
> So, in this asymmetric setup, both criteria seem to not work in an optimal
> way. Going for
> the same number of idle CPUs or alternatively for the same number of running
> processes
> both cause a sub-optimal distribution of tasks, leading to unnecessary SMT.

there is the same behavior and assumption here too


> 
> It seems also to be possible to address the regular load balancing path by
> aiming to have the
> same unused capacity between groups instead of the same number of idle CPUs.
> This seems to
> have been considered in the past, but the choice went in favor of the number
> of idle CPUs.

unused capacity doesn't give the instantaneous state so a group can be idle but without
unused capacity

> Since this decision was actively taken already, I focused on the
> prefer_sibling path.
> 
> The question now would be how to address this properly (or if I'm missing
> something here).
> As mentioned in the cover letter, this was the most simplistic and least
> invasive approach
> I could find, others might be more sophisticated but also have some
> side-effects.
> 
> I have a bit of a hard time leaving this one as-is, as it just introduces
> two additional
> multiplications with no effect for most architectures. Maybe an
> architectures specific
> inline function that the compiler can optimize away if not needed?
> 
> > >                 goto force_balance;
> > > 
> > >         if (busiest->group_type != group_overloaded) {
> > > --
> > > 2.34.1
> > > 
> 
