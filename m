Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DF20A06F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 16:00:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t1qj12KczDqg5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 00:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FycxCHPi; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t1bt24w0zDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 23:50:01 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id t194so6006024wmt.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Km4XU3YCbQ1BlBaA5eguEzAMNhTjDSRuzkyQ4wjQ+Y=;
 b=FycxCHPiF4RsALIYh3iW+vhK/8NZBacCDA43aqRb5syfhW0lXroapFe7s7rNPJMH3L
 YJS5H3RrUA+/TxEJL5OEczu34Ql+7GwHaA6dPKjQHLOTvISFnLJULaNOFfzac2Yceqci
 Zp4amK8Gq63zXqgZQV3hT6NxwTa+d7H7DwLslCPYrO99etQ1IY9p57wNaheJved0wTsp
 ouPsbJ57kviReSPXQ7BpXAxXpmLGwWUtGi52hgzrfGIZ7oCe1n44I+5+Bf2u+na6amXE
 QQoikQ6kttKR73fDOSUPwEzx3XLMrmMo12J8YfINSK/x2EqM22GES5moEwSTzOeozHBD
 vQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Km4XU3YCbQ1BlBaA5eguEzAMNhTjDSRuzkyQ4wjQ+Y=;
 b=l9k0ayvTuJvwbI/UpNMWxcKy0YZYV9fQpex01ixlJn8PXdl5sj0vdsGTWrs7NWBgkN
 Mu2Ltkuy0bZVAqzC8mDMNPVhnBbEJCYHsCR4V2EfZkgTW9fu3Y226XfGlmrktmHxmoCa
 PoXMY4m+UOtEsgu1Szj/ZgFBx+yZ2x7aHs4KoirU9EZUGNcpapNLnjLy5Bt9+6p8iw1Y
 xjQijxLnY3pBn9scWLMCOZ8dxgOlnUVjDOVOaheJt3/Dm+/3S23WFcJjpbd/DJmUYaLA
 7LlOtMaJxpo3+nzGaOaqlvaBO7CJg2IZm5mr+KF/Tqpg2tv03vp6DRMribs8TuAa65Im
 XNgA==
X-Gm-Message-State: AOAM533jzcxHPnJCHtdXFslPwWRypRRPzNBg2tqrZ/scQ0kT8tjHoVRx
 OqhUG5zvf3XTnwM0kH9NA3oIkw==
X-Google-Smtp-Source: ABdhPJxecS3KmUscrOmXn/iaNXCbUj7dNrZNCXj7EKIp3bTt9cpi2niiXt7IGvLyLr8T+9KW/8WsAg==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr3301080wmn.167.1593092997450; 
 Thu, 25 Jun 2020 06:49:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id 67sm33021937wrk.49.2020.06.25.06.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 06:49:56 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:49:53 +0100
From: Quentin Perret <qperret@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200625134953.GA242742@google.com>
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200625113602.z2xrwebd2gngbww3@vireshk-i7>
 <CAJZ5v0g=+2OFKVk2ZnmK-33knUwqcaOOQ+q9ZWnmeoBD9KOX9g@mail.gmail.com>
 <20200625115318.GA219598@google.com>
 <CAJZ5v0jQkeu5dJXxXN2eQ+cAwv8oSK_wZZgTW3cvMZX0ks9jHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jQkeu5dJXxXN2eQ+cAwv8oSK_wZZgTW3cvMZX0ks9jHQ@mail.gmail.com>
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
 Linux PM <linux-pm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, adharmap@codeaurora.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 25 Jun 2020 at 15:28:43 (+0200), Rafael J. Wysocki wrote:
> On Thu, Jun 25, 2020 at 1:53 PM Quentin Perret <qperret@google.com> wrote:
> >
> > On Thursday 25 Jun 2020 at 13:44:34 (+0200), Rafael J. Wysocki wrote:
> > > On Thu, Jun 25, 2020 at 1:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > This change is not right IMO. This part handles the set-policy case,
> > > > where there are no governors. Right now this code, for some reasons
> > > > unknown to me, forcefully uses the default governor set to indicate
> > > > the policy, which is not a great idea in my opinion TBH. This doesn't
> > > > and shouldn't care about governor modules and should only be looking
> > > > at strings instead of governor pointer.
> > >
> > > Sounds right.
> > >
> > > > Rafael, I even think we should remove this code completely and just
> > > > rely on what the driver has sent to us. Using the selected governor
> > > > for set policy drivers is very confusing and also we shouldn't be
> > > > forced to compiling any governor for the set-policy case.
> > >
> > > Well, AFAICS the idea was to use the default governor as a kind of
> > > default policy proxy, but I agree that strings should be sufficient
> > > for that.
> >
> > I agree with all the above. I'd much rather not rely on the default
> > governor name to populate the default policy, too, so +1 from me.
> 
> So before this series the default governor was selected at the kernel
> configuration time (pre-build) and was always built-in.  Because it
> could not go away, its name could be used to indicate the default
> policy for the "setpolicy" drivers.
> 
> After this series, however, it cannot be used this way reliably, but
> you can still pass cpufreq_param_governor to cpufreq_parse_policy()
> instead of def_gov->name in cpufreq_init_policy(), can't you?

Good point. I also need to fallback to the default builtin governor if
the command line parameter isn't valid (or non-existent), so perhaps
something like so?

iff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index dad6b85f4c89..20a2020abf88 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -653,6 +653,23 @@ static unsigned int cpufreq_parse_policy(char *str_governor)
        return CPUFREQ_POLICY_UNKNOWN;
 }
 
+static unsigned int cpufreq_default_policy(void)
+{
+       unsigned int pol;
+
+       pol = cpufreq_parse_policy(cpufreq_param_governor);
+       if (pol != CPUFREQ_POLICY_UNKNOWN)
+               return pol;
+
+       if (IS_BUILTIN(CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE))
+               return CPUFREQ_POLICY_PERFORMANCE;
+
+       if (IS_BUILTIN(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE))
+               return CPUFREQ_POLICY_POWERSAVE;
+
+       return CPUFREQ_POLICY_UNKNOWN;
+}
+
 /**
  * cpufreq_parse_governor - parse a governor string only for has_target()
  * @str_governor: Governor name.
@@ -1085,8 +1102,8 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
                /* Use the default policy if there is no last_policy. */
                if (policy->last_policy) {
                        pol = policy->last_policy;
-               } else if (default_governor) {
-                       pol = cpufreq_parse_policy(default_governor->name);
+               } else {
+                       pol = cpufreq_default_policy();
                        /*
                         * In case the default governor is neiter "performance"
                         * nor "powersave", fall back to the initial policy
