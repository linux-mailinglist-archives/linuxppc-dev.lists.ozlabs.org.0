Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960468529A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 08:22:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eAboUKrW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYt7C3dr5z3dXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 18:21:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eAboUKrW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYt6V3YQDz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 18:21:21 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7d5c890c67fso1964656241.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 23:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707808878; x=1708413678; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN5b5QdibQC55T6xYrHdi1pJX22VxUjqLdYp4BQXde0=;
        b=eAboUKrW+RPnHDbnfeEWsKk8mnbRghz+m3H+rR+5+Sho8MFnX9x5Aq7bjzpLeRU/AC
         D0ysi6NtOvtZ9QKWXhDgJ47uWHE6+4zPsjG9fdc0gb8QqwfQLm/WT9TNJLBb7UmyEBWg
         81PPGBwmZDt6yHdjOZG0GgElLY59gcaWA6c0tUAkiZ+1r+zG+4tSsJadU3XZGPkHowKQ
         Ylw3ihK1pIza7vofpXMYJwampKHAW8ea2VpWYAw/GwhzrJ0arhQt1WTxwFffFAiIo3je
         c9RbdmfT9fr/4X2WyU5Ey2G16EgNv+CCA9fiuO3YJvhR7X8YJnJgDUr9JBI1MbILZitc
         Zp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707808878; x=1708413678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN5b5QdibQC55T6xYrHdi1pJX22VxUjqLdYp4BQXde0=;
        b=drks5QVS/wtGUiuP2c/ezUGS+zWmwEl3tjLGcsZXwP199JPdy01iyMzASHw5iId4Cm
         bUuIY7oD8FQDqxKmhyGQEt4aSzK2PaTcWL3EUIYfr14YdAI7VxjadDVwR+DBlNPTIhOk
         iTNbPn1vMSv72jZWAS92BZsmJkbVkm0bnaFDCniyzd3V+3Uc0jdhS3mTnpwhjjrMluMh
         GuoJ/Td3+Or5bzfGVoyvzN5DbRHPRcRxdU6LStzPYlYNDadl9iF4J5dpK/tC6gXBHQ+S
         oqNvPKfRwji1DDzOxNJ6lXj1uAVkNeanBHphl+fdA4biV8bglJRlXnMqYKbsyAkCFzJG
         dSvw==
X-Forwarded-Encrypted: i=1; AJvYcCWSf0u/Z+Sih1kdJvzVprDqiKNaM6xejWf9o4fe+kSoeFLAk7x2iuvqMDESgUfgYiMqVs6fZvDBsEd4vstWjHSpX/r0HRuIyaAywCZdag==
X-Gm-Message-State: AOJu0Yy+6MBfvLtm79K2atw++9XcgBqFh7a65zvkmlW5/V5qCfr6sTAS
	65lsVWxr5y+JXUep5K5tpEUhdZMhCAMXttcvgbivM/NHHkw/CjRXmB+g12EBoGbdrtqvCMs1h1P
	N0uNjCSd60iM+pg0tSwyEINkzMCU=
X-Google-Smtp-Source: AGHT+IGapTWzbmkSlvS+mPaGaHuOMydLzPlQpGcs4IvTQiRvfX2gyxpag4GR0m9yV2+ziRblZmghiMlXYaDNrZPJoFc=
X-Received: by 2002:a05:6102:2859:b0:46d:224d:9290 with SMTP id
 az25-20020a056102285900b0046d224d9290mr5439307vsb.9.1707808878017; Mon, 12
 Feb 2024 23:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20240210113924.1130448-1-alexs@kernel.org> <20240210113924.1130448-5-alexs@kernel.org>
 <CAGsJ_4wh6kDs_OqOae-HocKWR9SuVY=KJR7+W1v11mE=ym0nYg@mail.gmail.com>
In-Reply-To: <CAGsJ_4wh6kDs_OqOae-HocKWR9SuVY=KJR7+W1v11mE=ym0nYg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 13 Feb 2024 20:21:06 +1300
Message-ID: <CAGsJ_4yqw3GvFbKkAN02CBnUHqT1B4voWcgdvAnAUxqLmn0few@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] sched: rename SD_SHARE_PKG_RESOURCES to SD_SHARE_LLC
To: alexs@kernel.org, Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Yicong Yang <yangyicong@hisilicon.com>, Ben Segall <bsegall@google.com>, Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Barry Song <song.bao.hua@hisilicon.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "open list:SCHEDULER" <linux-kernel@vger.kernel.org>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org
 >
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 8:01=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> Hi Alex, Valentin,
>
>
> On Sun, Feb 11, 2024 at 12:37=E2=80=AFAM <alexs@kernel.org> wrote:
> >
> > From: Alex Shi <alexs@kernel.org>
> >
> > SD_CLUSTER shares the CPU resources like llc tags or l2 cache, that's
> > easy confuse with SD_SHARE_PKG_RESOURCES. So let's specifical point
> > what the latter shares: LLC. That would reduce some confusing.
>
> On neither JACOBSVILLE nor kunpeng920, it seems CLUSTER isn't LLC.
> on Jacobsville, cluster is L2-cache while Jacobsville has L3; on kunpeng9=
20,
> cluster is L3-tag. On kunpeng920, actually 24 cpus or 32cpus share one LL=
C,
> the whole L3. cluster is kind of like middle-level caches.
>
> So I feel this patch isn't precise.

sorry for my noise, i thought you were renaming cluster to LLC. but after
second reading, you are renaming the level after cluster, so my comment
was wrong. Please feel free to add:

Reviewed-by: Barry Song <baohua@kernel.org>

>
> >
> > Suggested-by: Valentin Schneider <vschneid@redhat.com>
> > Signed-off-by: Alex Shi <alexs@kernel.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Miaohe Lin <linmiaohe@huawei.com>
> > Cc: Barry Song <song.bao.hua@hisilicon.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Frederic Weisbecker <frederic@kernel.org>
> > Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Juri Lelli <juri.lelli@redhat.com>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: "Gautham R. Shenoy" <gautham.shenoy@amd.com>
> > Cc: Yicong Yang <yangyicong@hisilicon.com>
> > Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> > Reviewed-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > ---
> >  arch/powerpc/kernel/smp.c      |  6 +++---
> >  include/linux/sched/sd_flags.h |  4 ++--
> >  include/linux/sched/topology.h |  6 +++---
> >  kernel/sched/fair.c            |  2 +-
> >  kernel/sched/topology.c        | 28 ++++++++++++++--------------
> >  5 files changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 693334c20d07..a60e4139214b 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -984,7 +984,7 @@ static bool shared_caches __ro_after_init;
> >  /* cpumask of CPUs with asymmetric SMT dependency */
> >  static int powerpc_smt_flags(void)
> >  {
> > -       int flags =3D SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> > +       int flags =3D SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
> >
> >         if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
> >                 printk_once(KERN_INFO "Enabling Asymmetric SMT scheduli=
ng\n");
> > @@ -1010,9 +1010,9 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(sp=
lpar_asym_pack);
> >  static int powerpc_shared_cache_flags(void)
> >  {
> >         if (static_branch_unlikely(&splpar_asym_pack))
> > -               return SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
> > +               return SD_SHARE_LLC | SD_ASYM_PACKING;
> >
> > -       return SD_SHARE_PKG_RESOURCES;
> > +       return SD_SHARE_LLC;
> >  }
> >
> >  static int powerpc_shared_proc_flags(void)
> > diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_fl=
ags.h
> > index a8b28647aafc..b04a5d04dee9 100644
> > --- a/include/linux/sched/sd_flags.h
> > +++ b/include/linux/sched/sd_flags.h
> > @@ -117,13 +117,13 @@ SD_FLAG(SD_SHARE_CPUCAPACITY, SDF_SHARED_CHILD | =
SDF_NEEDS_GROUPS)
> >  SD_FLAG(SD_CLUSTER, SDF_NEEDS_GROUPS)
> >
> >  /*
> > - * Domain members share CPU package resources (i.e. caches)
> > + * Domain members share CPU Last Level Caches
> >   *
> >   * SHARED_CHILD: Set from the base domain up until spanned CPUs no lon=
ger share
> >   *               the same cache(s).
> >   * NEEDS_GROUPS: Caches are shared between groups.
> >   */
> > -SD_FLAG(SD_SHARE_PKG_RESOURCES, SDF_SHARED_CHILD | SDF_NEEDS_GROUPS)
> > +SD_FLAG(SD_SHARE_LLC, SDF_SHARED_CHILD | SDF_NEEDS_GROUPS)
> >
> >  /*
> >   * Only a single load balancing instance
> > diff --git a/include/linux/sched/topology.h b/include/linux/sched/topol=
ogy.h
> > index a6e04b4a21d7..191b122158fb 100644
> > --- a/include/linux/sched/topology.h
> > +++ b/include/linux/sched/topology.h
> > @@ -38,21 +38,21 @@ extern const struct sd_flag_debug sd_flag_debug[];
> >  #ifdef CONFIG_SCHED_SMT
> >  static inline int cpu_smt_flags(void)
> >  {
> > -       return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> > +       return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
> >  }
> >  #endif
> >
> >  #ifdef CONFIG_SCHED_CLUSTER
> >  static inline int cpu_cluster_flags(void)
> >  {
> > -       return SD_CLUSTER | SD_SHARE_PKG_RESOURCES;
> > +       return SD_CLUSTER | SD_SHARE_LLC;
> >  }
> >  #endif
> >
> >  #ifdef CONFIG_SCHED_MC
> >  static inline int cpu_core_flags(void)
> >  {
> > -       return SD_SHARE_PKG_RESOURCES;
> > +       return SD_SHARE_LLC;
> >  }
> >  #endif
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cd1ec57c0b7b..da6c77d05d07 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -10687,7 +10687,7 @@ static inline void calculate_imbalance(struct l=
b_env *env, struct sd_lb_stats *s
> >          */
> >         if (local->group_type =3D=3D group_has_spare) {
> >                 if ((busiest->group_type > group_fully_busy) &&
> > -                   !(env->sd->flags & SD_SHARE_PKG_RESOURCES)) {
> > +                   !(env->sd->flags & SD_SHARE_LLC)) {
> >                         /*
> >                          * If busiest is overloaded, try to fill spare
> >                          * capacity. This might end up creating spare c=
apacity
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 0b33f7b05d21..99ea5986038c 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -657,13 +657,13 @@ static void destroy_sched_domains(struct sched_do=
main *sd)
> >  }
> >
> >  /*
> > - * Keep a special pointer to the highest sched_domain that has
> > - * SD_SHARE_PKG_RESOURCE set (Last Level Cache Domain) for this
> > - * allows us to avoid some pointer chasing select_idle_sibling().
> > + * Keep a special pointer to the highest sched_domain that has SD_SHAR=
E_LLC set
> > + * (Last Level Cache Domain) for this allows us to avoid some pointer =
chasing
> > + * select_idle_sibling().
> >   *
> > - * Also keep a unique ID per domain (we use the first CPU number in
> > - * the cpumask of the domain), this allows us to quickly tell if
> > - * two CPUs are in the same cache domain, see cpus_share_cache().
> > + * Also keep a unique ID per domain (we use the first CPU number in th=
e cpumask
> > + * of the domain), this allows us to quickly tell if two CPUs are in t=
he same
> > + * cache domain, see cpus_share_cache().
> >   */
> >  DEFINE_PER_CPU(struct sched_domain __rcu *, sd_llc);
> >  DEFINE_PER_CPU(int, sd_llc_size);
> > @@ -684,7 +684,7 @@ static void update_top_cache_domain(int cpu)
> >         int id =3D cpu;
> >         int size =3D 1;
> >
> > -       sd =3D highest_flag_domain(cpu, SD_SHARE_PKG_RESOURCES);
> > +       sd =3D highest_flag_domain(cpu, SD_SHARE_LLC);
> >         if (sd) {
> >                 id =3D cpumask_first(sched_domain_span(sd));
> >                 size =3D cpumask_weight(sched_domain_span(sd));
> > @@ -1554,7 +1554,7 @@ static struct cpumask             ***sched_domain=
s_numa_masks;
> >   * function. For details, see include/linux/sched/sd_flags.h.
> >   *
> >   *   SD_SHARE_CPUCAPACITY
> > - *   SD_SHARE_PKG_RESOURCES
> > + *   SD_SHARE_LLC
> >   *   SD_CLUSTER
> >   *   SD_NUMA
> >   *
> > @@ -1566,7 +1566,7 @@ static struct cpumask             ***sched_domain=
s_numa_masks;
> >  #define TOPOLOGY_SD_FLAGS              \
> >         (SD_SHARE_CPUCAPACITY   |       \
> >          SD_CLUSTER             |       \
> > -        SD_SHARE_PKG_RESOURCES |       \
> > +        SD_SHARE_LLC           |       \
> >          SD_NUMA                |       \
> >          SD_ASYM_PACKING)
> >
> > @@ -1609,7 +1609,7 @@ sd_init(struct sched_domain_topology_level *tl,
> >                                         | 0*SD_BALANCE_WAKE
> >                                         | 1*SD_WAKE_AFFINE
> >                                         | 0*SD_SHARE_CPUCAPACITY
> > -                                       | 0*SD_SHARE_PKG_RESOURCES
> > +                                       | 0*SD_SHARE_LLC
> >                                         | 0*SD_SERIALIZE
> >                                         | 1*SD_PREFER_SIBLING
> >                                         | 0*SD_NUMA
> > @@ -1646,7 +1646,7 @@ sd_init(struct sched_domain_topology_level *tl,
> >         if (sd->flags & SD_SHARE_CPUCAPACITY) {
> >                 sd->imbalance_pct =3D 110;
> >
> > -       } else if (sd->flags & SD_SHARE_PKG_RESOURCES) {
> > +       } else if (sd->flags & SD_SHARE_LLC) {
> >                 sd->imbalance_pct =3D 117;
> >                 sd->cache_nice_tries =3D 1;
> >
> > @@ -1671,7 +1671,7 @@ sd_init(struct sched_domain_topology_level *tl,
> >          * For all levels sharing cache; connect a sched_domain_shared
> >          * instance.
> >          */
> > -       if (sd->flags & SD_SHARE_PKG_RESOURCES) {
> > +       if (sd->flags & SD_SHARE_LLC) {
> >                 sd->shared =3D *per_cpu_ptr(sdd->sds, sd_id);
> >                 atomic_inc(&sd->shared->ref);
> >                 atomic_set(&sd->shared->nr_busy_cpus, sd_weight);
> > @@ -2446,8 +2446,8 @@ build_sched_domains(const struct cpumask *cpu_map=
, struct sched_domain_attr *att
> >                 for (sd =3D *per_cpu_ptr(d.sd, i); sd; sd =3D sd->paren=
t) {
> >                         struct sched_domain *child =3D sd->child;
> >
> > -                       if (!(sd->flags & SD_SHARE_PKG_RESOURCES) && ch=
ild &&
> > -                           (child->flags & SD_SHARE_PKG_RESOURCES)) {
> > +                       if (!(sd->flags & SD_SHARE_LLC) && child &&
> > +                           (child->flags & SD_SHARE_LLC)) {
> >                                 struct sched_domain __rcu *top_p;
> >                                 unsigned int nr_llcs;
> >
> > --
> > 2.43.0
> >
> >
>
> Thanks
> Barry
