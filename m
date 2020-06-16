Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 474411FAB4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 10:33:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mM0Q1R9SzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 18:33:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IVV0TzJS; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mLyJ1pkHzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 18:31:19 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id x13so19786192wrv.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O9PrYTho49Bp6EVdK3E+npj+dEJ0SrzzaYmk25xGQCs=;
 b=IVV0TzJSfu6Cb6fbIfYYBpYjGCuxgbVN6r850piGyx/5zINEAkRFXfc72poc2cK3SZ
 VcEF0dEg5+XAe+ur1GnVppYchAQG97vZPiCl91UlA+lO45mdrqXZkQBH73ga3MUse6k8
 PIJS0YoOXZtsj9PPGtsNUfzRCyLXcKDCZjKMgvvYQcE98rVzgsqVF/3jX6iwWqlzOXnZ
 spDdTuXYgP3RMFGGFUaiblGaaV/T/RQ3mmLF9ELJoLXNag3y3Jlvcw26NSv+DvAClrkM
 Od/Kvm4WsC4LM9LUOt0LLdyQgRNEF6e7Ejc1Koa1sidd62IiKTJKeu9cI6v6cmCgIS4t
 pdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O9PrYTho49Bp6EVdK3E+npj+dEJ0SrzzaYmk25xGQCs=;
 b=cIr92Mh2XnOYBFbXKOnYkdsfdFrY+ZlNGSOooecd88pY7wKvs6irG5MyBaoMbF7puS
 FpHjug2beRrn6A8pPSfmXwWRhgOLXKrbllfiUWmtoQjfuCYL+MNIU+FjLLP8otCUCvZy
 l8nABAHDda6YtmYMouvZ8aIP7MaMgLUn1N4Y3iBHRR4DL5HH4fkEZ9mD8+QZ6R/ztjGL
 hbzIpTDjtLy7sUWbFkWbBo3w9pGV0SfCk5KWNQVFPybP6aO/8grGw1qRcujUlxRn5UjI
 ODgejgZ/qoUfOkHG9YK1/vx+s61OE7XDa/OgNexl8GmNckX0wD82j7uwxyqBgt+RdEuk
 +yuw==
X-Gm-Message-State: AOAM5334wyk3X5SSBQQQHeYDUgnVkBfStWJqMSnRrcGv1qXP6DwTZDik
 0JlMB9EKFprEUVFXQ728I+SREA==
X-Google-Smtp-Source: ABdhPJyGVDBmCjx821OXOVBJ+fFcT06h8c84Po1Zcr2LqYcehjC7g284lXeFVlBS/b/VGmEgEyVJRg==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr1815949wre.275.1592296271800; 
 Tue, 16 Jun 2020 01:31:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id b8sm27846943wrm.35.2020.06.16.01.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 01:31:10 -0700 (PDT)
Date: Tue, 16 Jun 2020 09:31:07 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200616083107.GA122049@google.com>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-3-qperret@google.com>
 <20200616043143.obk5k3rv737j5dnd@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616043143.obk5k3rv737j5dnd@vireshk-i7>
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, rafael@kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey Viresh,

On Tuesday 16 Jun 2020 at 10:01:43 (+0530), Viresh Kumar wrote:
> On 15-06-20, 17:55, Quentin Perret wrote:
> > +static void cpufreq_get_default_governor(void)
> > +{
> > +	default_governor = cpufreq_parse_governor(cpufreq_param_governor);
> > +	if (!default_governor) {
> > +		if (*cpufreq_param_governor)
> > +			pr_warn("Failed to find %s\n", cpufreq_param_governor);
> > +		default_governor = cpufreq_default_governor();
> 
> A module_get() never happened for this case and so maybe a
> module_put() should never get called.

Correct, however cpufreq_default_governor() being a weak function, we're
basically guaranteed the governor we get from there is builtin, so
gov->owner is NULL. That is, module_put() is not actively useful, but it
doesn't harm. So I figured that should be fine. That could definitely
use a comment, though :)

> > +	}
> > +}
> > +
> > +static void cpufreq_put_default_governor(void)
> > +{
> > +	if (!default_governor)
> > +		return;
> > +	module_put(default_governor->owner);
> > +	default_governor = NULL;
> > +}
> > +
> >  static int cpufreq_init_governor(struct cpufreq_policy *policy)
> >  {
> >  	int ret;
> > @@ -2701,6 +2721,8 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
> >  
> >  	if (driver_data->setpolicy)
> >  		driver_data->flags |= CPUFREQ_CONST_LOOPS;
> > +	else
> > +		cpufreq_get_default_governor();
> >  
> >  	if (cpufreq_boost_supported()) {
> >  		ret = create_boost_sysfs_file();
> > @@ -2769,6 +2791,7 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
> >  	subsys_interface_unregister(&cpufreq_interface);
> >  	remove_boost_sysfs_file();
> >  	cpuhp_remove_state_nocalls_cpuslocked(hp_online);
> > +	cpufreq_put_default_governor();
> >  
> >  	write_lock_irqsave(&cpufreq_driver_lock, flags);
> >  
> > @@ -2792,4 +2815,5 @@ static int __init cpufreq_core_init(void)
> >  	return 0;
> >  }
> 
> And since this is a per boot thing, there is perhaps no need of doing
> these at driver register/unregister, I would rather do it at:
> cpufreq_core_init() time itself and so we will never need to run
> cpufreq_put_default_governor() and so can be removed.

Right, so the reason I avoided cpufreq_core_init() was because it is
called at core_initcall() time, which means I can't really assume the
governors have been loaded by that time. By waiting for the driver to
probe before detecting the default gov, we get that nice ordering. But
yes, it feels odd to have it here :/

Thinking about it more, the natural fit for this would rather be the
register/unregister path for governors directly. If that sounds good to
you (?) I'll try to move it there in v2.

> And another thing I am not able to understand (despite you commenting
> about that in the commit log) is what happens if the default governor
> chosen is built as a module ?

So the answer is 'it depends'. If the driver is built as a module too,
then you should load the governor module first, and then the driver
module, and everything will work just fine.

But in the case where the governor is loaded _after_ the driver (either
because we got the module ordering wrong, or because the driver is
builtin), then the policies will be initialized with the builtin
default, and nothing special will happen when the governor module is
loaded.

That behaviour very much is open for discussion, though. A possible
alternative would be to automatically switch all policies to the default
governor upon loading. That would have the nice benefit or removing the
ordering dependency, but that is more involved and I didn't have a
use-case for it, so I went for the simpler option ('the-default
governor-needs-to-be-registered-before-the-policies-are-created').

Thoughts?

Thanks,
Quentin
