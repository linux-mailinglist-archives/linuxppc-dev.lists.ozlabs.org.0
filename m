Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC267209D1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 12:54:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sxjG6TxMzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 20:54:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sxgd2Z70zDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 20:52:59 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id l63so4527218oih.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 03:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cwIdSXPUuU1uRqpvtJKtzstYQAUArlOMALUNp7co5jM=;
 b=N9mdXTuek7+GdyiT6k2fTSDaNNd5dfWX1i404xZVKFaKrq2nwlvL0MkAH/rQeZsebb
 caq/Yp/PQTpXrRnWKULqk86SCLXorNqXwNnN3VjFlEUsI6Ejarq47qX2VsfjQmz4wDqr
 QktiH9m3gW+Ip9BE58OUvCqX9T+TbffGNYkz6cVDskkPoplCPVGRHSh+UuGj7N/+VOc1
 qQIidybrpI6v/a75buA6kZEOkvxTdy0ZSXlf8ixMmH5NpxMVdsadV2SV7C0VhEQXCSk0
 RC2XLxlXg7aRO3jTcZmPBV2oRUuQmK2Y+JLi4gWLOUXIFwztZ4b7s/ClS8XZvJS4FZDv
 0Hag==
X-Gm-Message-State: AOAM531HR2IzhMP4iQ9Jf2+kFwMX4sSbtCjpDdu4zj04jaunePc1V8vS
 ugMlidBMiVsfghttNQel4+0bA8aNY4u9pyoWCFs=
X-Google-Smtp-Source: ABdhPJwRCQMnCB/bfuvmkARjDAhUHGU6ki0GfoTWamxo9Rq1xfFvWJi8TwqcHRaFJuXBeT1DMVCjbHvWJZL0Eu9jkFE=
X-Received: by 2002:a54:4585:: with SMTP id z5mr1704626oib.110.1593082376670; 
 Thu, 25 Jun 2020 03:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200624055023.xofefhohf7wifme5@vireshk-i7>
 <CAJZ5v0ja_rM7i=psW1HRyzEpW=8QwP2u9p+ihN3FS8_53bbxTQ@mail.gmail.com>
 <20200624153259.GA2844@google.com>
 <20200625085052.4ah4wbog3guj74v4@vireshk-i7>
In-Reply-To: <20200625085052.4ah4wbog3guj74v4@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 25 Jun 2020 12:52:45 +0200
Message-ID: <CAJZ5v0huMCZcqEkDw2KKp9RMBAU=rpex0zSAw_kK3CqjMyaibw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Linux PM <linux-pm@vger.kernel.org>, Quentin Perret <qperret@google.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, adharmap@codeaurora.org,
 Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 25, 2020 at 10:50 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 24-06-20, 16:32, Quentin Perret wrote:
> > Right, but I must admit that, looking at this more, I'm getting a bit
> > confused with the overall locking for governors :/
> >
> > When in cpufreq_init_policy() we find a governor using
> > find_governor(policy->last_governor), what guarantees this governor is
> > not concurrently unregistered? That is, what guarantees this governor
> > doesn't go away between that find_governor() call, and the subsequent
> > call to try_module_get() in cpufreq_set_policy() down the line?
> >
> > Can we somewhat assume that whatever governor is referred to by
> > policy->last_governor will have a non-null refcount? Or are the
> > cpufreq_online() and cpufreq_unregister_governor() path mutually
> > exclusive? Or is there something else?
>
> This should be sufficient to fix pending issues I believe. Based over your
> patches.

LGTM, but can you post it in a new thread to let Patchwork pick it up?

> -------------------------8<-------------------------
> From: Viresh Kumar <viresh.kumar@linaro.org>
> Date: Thu, 25 Jun 2020 13:15:23 +0530
> Subject: [PATCH] cpufreq: Fix locking issues with governors
>
> The locking around governors handling isn't adequate currently. The list
> of governors should never be traversed without locking in place. Also we
> must make sure the governor isn't removed while it is still referenced
> by code.
>
> Reported-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/cpufreq.c | 59 ++++++++++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 4b1a5c0173cf..dad6b85f4c89 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -624,6 +624,24 @@ static struct cpufreq_governor *find_governor(const char *str_governor)
>         return NULL;
>  }
>
> +static struct cpufreq_governor *get_governor(const char *str_governor)
> +{
> +       struct cpufreq_governor *t;
> +
> +       mutex_lock(&cpufreq_governor_mutex);
> +       t = find_governor(str_governor);
> +       if (!t)
> +               goto unlock;
> +
> +       if (!try_module_get(t->owner))
> +               t = NULL;
> +
> +unlock:
> +       mutex_unlock(&cpufreq_governor_mutex);
> +
> +       return t;
> +}
> +
>  static unsigned int cpufreq_parse_policy(char *str_governor)
>  {
>         if (!strncasecmp(str_governor, "performance", CPUFREQ_NAME_LEN))
> @@ -643,28 +661,14 @@ static struct cpufreq_governor *cpufreq_parse_governor(char *str_governor)
>  {
>         struct cpufreq_governor *t;
>
> -       mutex_lock(&cpufreq_governor_mutex);
> -
> -       t = find_governor(str_governor);
> -       if (!t) {
> -               int ret;
> -
> -               mutex_unlock(&cpufreq_governor_mutex);
> -
> -               ret = request_module("cpufreq_%s", str_governor);
> -               if (ret)
> -                       return NULL;
> -
> -               mutex_lock(&cpufreq_governor_mutex);
> +       t = get_governor(str_governor);
> +       if (t)
> +               return t;
>
> -               t = find_governor(str_governor);
> -       }
> -       if (t && !try_module_get(t->owner))
> -               t = NULL;
> -
> -       mutex_unlock(&cpufreq_governor_mutex);
> +       if (request_module("cpufreq_%s", str_governor))
> +               return NULL;
>
> -       return t;
> +       return get_governor(str_governor);
>  }
>
>  /**
> @@ -818,12 +822,14 @@ static ssize_t show_scaling_available_governors(struct cpufreq_policy *policy,
>                 goto out;
>         }
>
> +       mutex_lock(&cpufreq_governor_mutex);
>         for_each_governor(t) {
>                 if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char))
>                     - (CPUFREQ_NAME_LEN + 2)))
> -                       goto out;
> +                       break;
>                 i += scnprintf(&buf[i], CPUFREQ_NAME_PLEN, "%s ", t->name);
>         }
> +       mutex_unlock(&cpufreq_governor_mutex);
>  out:
>         i += sprintf(&buf[i], "\n");
>         return i;
> @@ -1060,11 +1066,14 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
>  {
>         struct cpufreq_governor *gov = NULL;
>         unsigned int pol = CPUFREQ_POLICY_UNKNOWN;
> +       bool put_governor = false;
> +       int ret;
>
>         if (has_target()) {
>                 /* Update policy governor to the one used before hotplug. */
> -               gov = find_governor(policy->last_governor);
> +               gov = get_governor(policy->last_governor);
>                 if (gov) {
> +                       put_governor = true;
>                         pr_debug("Restoring governor %s for cpu %d\n",
>                                  policy->governor->name, policy->cpu);
>                 } else if (default_governor) {
> @@ -1091,7 +1100,11 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
>                         return -ENODATA;
>         }
>
> -       return cpufreq_set_policy(policy, gov, pol);
> +       ret = cpufreq_set_policy(policy, gov, pol);
> +       if (put_governor)
> +               module_put(gov->owner);
> +
> +       return ret;
>  }
>
>  static int cpufreq_add_policy_cpu(struct cpufreq_policy *policy, unsigned int cpu)
