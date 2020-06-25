Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB4D20A09E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 16:12:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t25k0CNqzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 00:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t21C2ZWQzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 00:08:31 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id 64so5350114oti.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 07:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1G0Ez0jA0KKuMLKX/f3wLMblA8vWgfaiNzP5I6+jGk=;
 b=UUMpcR2En0IUo4WobqphKmgyHA/oKLK+PMck75Il4wWP/0VW6u7e/ajOswEZjuiqHu
 yey6K9fYz8cry1AP3gDYSnMCmkdyn4YJOqB3DdoJC3XpnqVTTnyz162NZMLNoO96oUD8
 VZcp4ZklE3XgzdTbOfzx/ZB/4BR4Si4OVxQFgF+cS9X6c9RCK6g0Jklzn7d/LeX6OKH1
 s8R9OPq75frYB0g6yjldegmkTl8OObbUHituf9rt1Vle6SPE0TDA/CAKg1s3Gp1uDe7l
 oqD/f0fdFng9mzub466S3HqUzDfKzqP5TzJcbRzaNo7Xp3WY/mEA63nRfrH+BzcmsCQ2
 N1AA==
X-Gm-Message-State: AOAM533nsQ1tHArHg+13AFDODG3n0xFIV4yvYZm4C0yurHaAAYODIyJB
 yizkic+0wVh0PMdRhi84r6I0LiDo1YcAUV9HXVc=
X-Google-Smtp-Source: ABdhPJwQf1p7c/AXGZmwgxwwEMmerXk7khBfNnfyYqWCY5frEiveZRVNhDq2zcxvgennBXiVTqJDg1dcwqTyyOrWhQI=
X-Received: by 2002:a05:6830:10ca:: with SMTP id
 z10mr26064118oto.167.1593094109209; 
 Thu, 25 Jun 2020 07:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200625113602.z2xrwebd2gngbww3@vireshk-i7>
 <CAJZ5v0g=+2OFKVk2ZnmK-33knUwqcaOOQ+q9ZWnmeoBD9KOX9g@mail.gmail.com>
 <20200625115318.GA219598@google.com>
 <CAJZ5v0jQkeu5dJXxXN2eQ+cAwv8oSK_wZZgTW3cvMZX0ks9jHQ@mail.gmail.com>
 <20200625134953.GA242742@google.com>
In-Reply-To: <20200625134953.GA242742@google.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 25 Jun 2020 16:08:18 +0200
Message-ID: <CAJZ5v0iRSJgZ3H4rUJBzDB-gTvKUcyo0eubQm=wjKnGq0DBH2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
To: Quentin Perret <qperret@google.com>
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
 Viresh Kumar <viresh.kumar@linaro.org>, adharmap@codeaurora.org,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 25, 2020 at 3:50 PM Quentin Perret <qperret@google.com> wrote:
>
> On Thursday 25 Jun 2020 at 15:28:43 (+0200), Rafael J. Wysocki wrote:
> > On Thu, Jun 25, 2020 at 1:53 PM Quentin Perret <qperret@google.com> wrote:
> > >
> > > On Thursday 25 Jun 2020 at 13:44:34 (+0200), Rafael J. Wysocki wrote:
> > > > On Thu, Jun 25, 2020 at 1:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > This change is not right IMO. This part handles the set-policy case,
> > > > > where there are no governors. Right now this code, for some reasons
> > > > > unknown to me, forcefully uses the default governor set to indicate
> > > > > the policy, which is not a great idea in my opinion TBH. This doesn't
> > > > > and shouldn't care about governor modules and should only be looking
> > > > > at strings instead of governor pointer.
> > > >
> > > > Sounds right.
> > > >
> > > > > Rafael, I even think we should remove this code completely and just
> > > > > rely on what the driver has sent to us. Using the selected governor
> > > > > for set policy drivers is very confusing and also we shouldn't be
> > > > > forced to compiling any governor for the set-policy case.
> > > >
> > > > Well, AFAICS the idea was to use the default governor as a kind of
> > > > default policy proxy, but I agree that strings should be sufficient
> > > > for that.
> > >
> > > I agree with all the above. I'd much rather not rely on the default
> > > governor name to populate the default policy, too, so +1 from me.
> >
> > So before this series the default governor was selected at the kernel
> > configuration time (pre-build) and was always built-in.  Because it
> > could not go away, its name could be used to indicate the default
> > policy for the "setpolicy" drivers.
> >
> > After this series, however, it cannot be used this way reliably, but
> > you can still pass cpufreq_param_governor to cpufreq_parse_policy()
> > instead of def_gov->name in cpufreq_init_policy(), can't you?
>
> Good point. I also need to fallback to the default builtin governor if
> the command line parameter isn't valid (or non-existent), so perhaps
> something like so?

Yes, that should work if I haven't missed anything.

> iff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index dad6b85f4c89..20a2020abf88 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -653,6 +653,23 @@ static unsigned int cpufreq_parse_policy(char *str_governor)
>         return CPUFREQ_POLICY_UNKNOWN;
>  }
>
> +static unsigned int cpufreq_default_policy(void)
> +{
> +       unsigned int pol;
> +
> +       pol = cpufreq_parse_policy(cpufreq_param_governor);
> +       if (pol != CPUFREQ_POLICY_UNKNOWN)
> +               return pol;
> +
> +       if (IS_BUILTIN(CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE))
> +               return CPUFREQ_POLICY_PERFORMANCE;
> +
> +       if (IS_BUILTIN(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE))
> +               return CPUFREQ_POLICY_POWERSAVE;
> +
> +       return CPUFREQ_POLICY_UNKNOWN;
> +}
> +
>  /**
>   * cpufreq_parse_governor - parse a governor string only for has_target()
>   * @str_governor: Governor name.
> @@ -1085,8 +1102,8 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
>                 /* Use the default policy if there is no last_policy. */
>                 if (policy->last_policy) {
>                         pol = policy->last_policy;
> -               } else if (default_governor) {
> -                       pol = cpufreq_parse_policy(default_governor->name);
> +               } else {
> +                       pol = cpufreq_default_policy();
>                         /*
>                          * In case the default governor is neiter "performance"
>                          * nor "powersave", fall back to the initial policy
