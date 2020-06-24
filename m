Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D6420778D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 17:35:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sRzd52LxzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 01:35:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NdGWSeUR; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sRxH1gVdzDqkj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 01:33:06 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id a6so2735473wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tjbKj2JJLg9M2F9CwUzFaqxTadc+FoDJkeC9qG6WPMU=;
 b=NdGWSeURe89L687lK6viNqICXEaDJjfaGLPwujuLMFiZJ1aDEkLa12K2oxn2S2WIEs
 hkB1pY5if8CE4WN9vmXx0Rt76OtQhGpcgWLvBb3iCCJ+YzMa0+YAGQrTgNniCwPaxZzD
 jLe8XHBoU9Ood6I/yiYOC9k11zyPlMZk0dUuHGDNPIwkrxoAHyHWrD4UMCeRIoTCkV1w
 o8esn5pXHLSpajx8K6CJdbsk9mY5zOIDBMYBBT8F6zfWUR3it3aKHnDkkm8x688uoyBW
 Fbr4PQoeJ2PrJiLw0o2n+X26nm/5PKbIN4tjB76F5y9DL3ehSR9YWAes/eksf5KbWiQ5
 bL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tjbKj2JJLg9M2F9CwUzFaqxTadc+FoDJkeC9qG6WPMU=;
 b=huGbS9gpQWEJsfl+gkBq6t/Y0gLRpTy/L/HSqg4PbdN2bHmJpbXlcdHKRyt47wvaMC
 7484FcItfv7BNHxAqwmIeReSuba+95SaBQrFpQ5m9gzZ0zI/G66+pmLul3zr4tIAZTKi
 BxzEGoeAWeHhkgRMiiSZ+PuitP9dc+JmKeXam0nsKlDzmHY+Uv6qwQMMOgCh0nVfFLbQ
 1IPWWh0z+VxNOHFDVWsIDyuHeiSyBi4PvpAamJFHrQPdX97f7rXHaeR9oOmEftWPRu5v
 g5kE2ChNZnpopz+9+E3eZckbXrxEq0S8Wel51eb9/n5lTprYgAmATfQsx28hdHcxkgJb
 kB9Q==
X-Gm-Message-State: AOAM530yyq7ITPxLM+Nf0lgZA7nPKmVc5V/5K4N04lstL6CxHC8HEwZp
 t5geP1dWJTK1s0IDDlgtpihWdQ==
X-Google-Smtp-Source: ABdhPJzSLr689rNCk/afvTQhZdA+AJuwcms9tOdw/Vdl7nFAHHPTyyLyGmG/dH9YWD0knsSg2tqB1A==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr20640246wrw.204.1593012783030; 
 Wed, 24 Jun 2020 08:33:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id z6sm4359909wmf.33.2020.06.24.08.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:33:02 -0700 (PDT)
Date: Wed, 24 Jun 2020 16:32:59 +0100
From: Quentin Perret <qperret@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200624153259.GA2844@google.com>
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200624055023.xofefhohf7wifme5@vireshk-i7>
 <CAJZ5v0ja_rM7i=psW1HRyzEpW=8QwP2u9p+ihN3FS8_53bbxTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ja_rM7i=psW1HRyzEpW=8QwP2u9p+ihN3FS8_53bbxTQ@mail.gmail.com>
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

On Wednesday 24 Jun 2020 at 14:51:04 (+0200), Rafael J. Wysocki wrote:
> On Wed, Jun 24, 2020 at 7:50 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > @@ -2789,7 +2796,13 @@ static int __init cpufreq_core_init(void)
> > >       cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
> > >       BUG_ON(!cpufreq_global_kobject);
> > >
> > > +     mutex_lock(&cpufreq_governor_mutex);
> > > +     if (!default_governor)
> > > +             default_governor = cpufreq_default_governor();
> > > +     mutex_unlock(&cpufreq_governor_mutex);
> >
> > I don't think locking is required here at core-initcall level.
> 
> It isn't necessary AFAICS, but it may as well be regarded as
> annotation (kind of instead of having a comment explaining why it need
> not be used).

Right, but I must admit that, looking at this more, I'm getting a bit
confused with the overall locking for governors :/

When in cpufreq_init_policy() we find a governor using
find_governor(policy->last_governor), what guarantees this governor is
not concurrently unregistered? That is, what guarantees this governor
doesn't go away between that find_governor() call, and the subsequent
call to try_module_get() in cpufreq_set_policy() down the line?

Can we somewhat assume that whatever governor is referred to by
policy->last_governor will have a non-null refcount? Or are the
cpufreq_online() and cpufreq_unregister_governor() path mutually
exclusive? Or is there something else?

Thanks,
Quentin
