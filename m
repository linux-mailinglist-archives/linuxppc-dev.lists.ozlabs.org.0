Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B520AE3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 10:11:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tV2z2h8MzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 18:11:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UrQ53aSA; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tV0Y0shyzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 18:09:32 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id q15so7955256wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rbLxPkU5zn6HuEV/rtbUuP7BkhVC3DU9UZS2cCgUUqs=;
 b=UrQ53aSAoNkLtJVEW6BDnSQ+6v0IYcarF2DEe3WeSNTvG7qhv/sVQjRNLftA1/WvTd
 rNga5sYIc0HtDHBmVny1DPoauZqqRn8iO8KpontGuzATd0MHdoAWU2xr9Xj1OdEZFShN
 YDyZbpxLiDck3HTKArsqvk3lNFCR9A3pAYLmA6qSCdm8CfqftPGBgmrcX9TEKwjrXI2N
 5hHn8+dFFTpVRNncH7Cjn1dfaEH2KxtiaeXc3itC4vpSwRpS8lfJSsx5i4+AdUM9twU8
 4t6q0s/b2Yh5yiyi4k3UnlXnyjPddkjPNH2OvXBekElzPhoJferFRvZJdJjRxutlfkZL
 jeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rbLxPkU5zn6HuEV/rtbUuP7BkhVC3DU9UZS2cCgUUqs=;
 b=dcnikZUjs6vMGZVHW2A6p5d6q4bbEo2Y/1YD2la3yQAIn4mFzFA26Hjhd1EEKueR/r
 ciUlELwnlbf4WFNkiDTu7etVgIjKe+xutpI3x8f562aOF5Vn9YL3RD1IGLParhEN8yu7
 +W14wqAS+Rhx/gnRUMXzUCzwN6KbPGWy9UQuMFNpbla+RfQLuKoylCW8wXCjmq52HmHo
 A6kL9y+QmVKCnrXoJNl5u33Rag3tulOwgFT40j1fCSeupqwdnwxVWnhQ4dKnxnNw2++6
 3JbquV2uEZyIYyrF08pgp4WYrKoBYm02qvtocVkEZ2MsFPyglqiWiBD3J6g/Zujn75Qh
 6HXQ==
X-Gm-Message-State: AOAM530l5t92cdPJDMQv3YqRDvVaP84Gb9ZhaKvk6dYbaFHyBSEUlnPP
 VspGQvLOG94FGm69QOECGMZ3NA==
X-Google-Smtp-Source: ABdhPJx1PfO/ReemODrB6fHZaYmkTV/XN0aLHdRmjz7wS+SEB2F1Yigl4vidu1EkS+IX0ywuZs+W1w==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr2196788wmh.73.1593158968078; 
 Fri, 26 Jun 2020 01:09:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id d2sm35925710wrs.95.2020.06.26.01.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:09:27 -0700 (PDT)
Date: Fri, 26 Jun 2020 09:09:24 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200626080924.GA281178@google.com>
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200626025346.z3g3ikdcin56gjlo@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626025346.z3g3ikdcin56gjlo@vireshk-i7>
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

On Friday 26 Jun 2020 at 08:23:46 (+0530), Viresh Kumar wrote:
> On 23-06-20, 15:21, Quentin Perret wrote:
> > @@ -2789,7 +2796,13 @@ static int __init cpufreq_core_init(void)
> >  	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
> >  	BUG_ON(!cpufreq_global_kobject);
> >  
> > +	mutex_lock(&cpufreq_governor_mutex);
> > +	if (!default_governor)
> 
> Also is this check really required ? The pointer will always be NULL
> at this point, isn't it ?

Not necessarily in this implementation -- the governors are registered
at core_initcall time too, so I don't think we can assume any ordering
there.

But it looks like your new version has fixed that by design, so I'll go
look at it some more, and try it out.

Thanks for the help!
Quentin
> 
> > +		default_governor = cpufreq_default_governor();
> > +	mutex_unlock(&cpufreq_governor_mutex);
> > +
> >  	return 0;
> >  }
> >  module_param(off, int, 0444);
> > +module_param_string(default_governor, cpufreq_param_governor, CPUFREQ_NAME_LEN, 0444);
> >  core_initcall(cpufreq_core_init);
> > -- 
> > 2.27.0.111.gc72c7da667-goog
> 
> -- 
> viresh
