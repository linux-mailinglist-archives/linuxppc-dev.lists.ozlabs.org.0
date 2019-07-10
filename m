Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65C644EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 12:08:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kFJb4tyVzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 20:08:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rjwysocki.net
 (client-ip=79.96.170.134; helo=cloudserver094114.home.pl;
 envelope-from=rjw@rjwysocki.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kFGj65SQzDqcN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 20:07:08 +1000 (AEST)
Received: from 79.184.253.121.ipv4.supernova.orange.pl (79.184.253.121) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.267)
 id fb1402abfa64d0e0; Wed, 10 Jul 2019 12:07:03 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Viresh Kumar <viresh.kumar@linaro.org>, Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v5] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Date: Wed, 10 Jul 2019 12:07:03 +0200
Message-ID: <2173177.H4fXhsoBLG@kreacher>
In-Reply-To: <20190709081205.a5sjsqo2el6zt24b@vireshk-i7>
References: <1562659447-39989-1-git-send-email-wen.yang99@zte.com.cn>
 <20190709081205.a5sjsqo2el6zt24b@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday, July 9, 2019 10:12:05 AM CEST Viresh Kumar wrote:
> On 09-07-19, 16:04, Wen Yang wrote:
> > The cpu variable is still being used in the of_get_property() call
> > after the of_node_put() call, which may result in use-after-free.
> > 
> > Fixes: a9acc26b75f ("cpufreq/pasemi: fix possible object reference leak")
> > Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-pm@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org

Patch applied.

> > ---
> > v5: put together the code to get, use, and release cpu device_node.
> > v4: restore the blank line.
> > v3: fix a leaked reference.
> > v2: clean up the code according to the advice of viresh.
> > 
> >  drivers/cpufreq/pasemi-cpufreq.c | 21 +++++++++------------
> >  1 file changed, 9 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> > index 6b1e4ab..1f0beb7 100644
> > --- a/drivers/cpufreq/pasemi-cpufreq.c
> > +++ b/drivers/cpufreq/pasemi-cpufreq.c
> > @@ -131,10 +131,17 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
> >  	int err = -ENODEV;
> >  
> >  	cpu = of_get_cpu_node(policy->cpu, NULL);
> > -
> > -	of_node_put(cpu);
> >  	if (!cpu)
> >  		goto out;
> 
> I would have loved a blank line here :)

And I added the blank line.

> > +	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
> > +	of_node_put(cpu);
> > +	if (!max_freqp) {
> > +		err = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	/* we need the freq in kHz */
> > +	max_freq = *max_freqp / 1000;
> >  
> >  	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
> >  	if (!dn)
> > @@ -171,16 +178,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
> >  	}
> >  
> >  	pr_debug("init cpufreq on CPU %d\n", policy->cpu);
> > -
> > -	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
> > -	if (!max_freqp) {
> > -		err = -EINVAL;
> > -		goto out_unmap_sdcpwr;
> > -	}
> > -
> > -	/* we need the freq in kHz */
> > -	max_freq = *max_freqp / 1000;
> > -
> >  	pr_debug("max clock-frequency is at %u kHz\n", max_freq);
> >  	pr_debug("initializing frequency table\n");
> 
> Though, enough versions have happened now.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> 

Thanks!



