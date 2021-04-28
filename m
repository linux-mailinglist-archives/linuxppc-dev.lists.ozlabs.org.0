Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7EE36D39D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 10:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVWNh6xcnz30Gx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 18:03:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVWNM1ln5z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 18:03:31 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E23F8AF8C;
 Wed, 28 Apr 2021 08:03:27 +0000 (UTC)
Date: Wed, 28 Apr 2021 10:03:26 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <20210428080326.GL6564@kitsune.suse.cz>
References: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210423073551.GZ6564@kitsune.suse.cz>
 <YILu6/GK+RwpskCc@drishya.in.ibm.com>
 <20210423174505.GE6564@kitsune.suse.cz>
 <YIMSCjTzcSwjQtRi@drishya.in.ibm.com>
 <20210423184216.GG6564@kitsune.suse.cz>
 <YIPKrIb+tY39taZv@drishya.in.ibm.com>
 <20210425110714.GH6564@kitsune.suse.cz>
 <20210428055848.GA6675@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210428055848.GA6675@in.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 28, 2021 at 11:28:48AM +0530, Gautham R Shenoy wrote:
> Hello Michal,
> 
> On Sun, Apr 25, 2021 at 01:07:14PM +0200, Michal Suchánek wrote:
> > On Sat, Apr 24, 2021 at 01:07:16PM +0530, Vaidyanathan Srinivasan wrote:
> > > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 20:42:16]:
> > > 
> > > > On Fri, Apr 23, 2021 at 11:59:30PM +0530, Vaidyanathan Srinivasan wrote:
> > > > > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 19:45:05]:
> > > > > 
> > > > > > On Fri, Apr 23, 2021 at 09:29:39PM +0530, Vaidyanathan Srinivasan wrote:
> > > > > > > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 09:35:51]:
> > > > > > > 
> > > > > > > > On Thu, Apr 22, 2021 at 08:37:29PM +0530, Gautham R. Shenoy wrote:
> > > > > > > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > > > > > > 
> > > > > > > > > Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > > > > > > > > CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> > > > > > > > > of the Extended CEDE states advertised by the platform
> > > > > > > > > 
> > > > > > > > > On some of the POWER9 LPARs, the older firmwares advertise a very low
> > > > > > > > > value of 2us for CEDE1 exit latency on a Dedicated LPAR. However the
> > > > > > > > Can you be more specific about 'older firmwares'?
> > > > > > > 
> > > > > > > Hi Michal,
> > > > > > > 
> > > > > > > This is POWER9 vs POWER10 difference, not really an obsolete FW.  The
> > > > > > > key idea behind the original patch was to make the H_CEDE latency and
> > > > > > > hence target residency come from firmware instead of being decided by
> > > > > > > the kernel.  The advantage is such that, different type of systems in
> > > > > > > POWER10 generation can adjust this value and have an optimal H_CEDE
> > > > > > > entry criteria which balances good single thread performance and
> > > > > > > wakeup latency.  Further we can have additional H_CEDE state to feed
> > > > > > > into the cpuidle.  
> > > > > > 
> > > > > > So all POWER9 machines are affected by the firmware bug where firmware
> > > > > > reports CEDE1 exit latency of 2us and the real latency is 5us which
> > > > > > causes the kernel to prefer CEDE1 too much when relying on the values
> > > > > > supplied by the firmware. It is not about 'older firmware'.
> > > > > 
> > > > > Correct.  All POWER9 systems running Linux as guest LPARs will see
> > > > > extra usage of CEDE idle state, but not baremetal (PowerNV).
> > > > > 
> > > > > The correct definition of the bug or miss-match in expectation is that
> > > > > firmware reports wakeup latency from a core/thread wakeup timing, but
> > > > > not end-to-end time from sending a wakeup event like an IPI using
> > > > > H_calls and receiving the events on the target.  Practically there are
> > > > > few extra micro-seconds needed after deciding to wakeup a target
> > > > > core/thread to getting the target to start executing instructions
> > > > > within the LPAR instance.
> > > > 
> > > > Thanks for the detailed explanation.
> > > > 
> > > > Maybe just adding a few microseconds to the reported time would be a
> > > > more reasonable workaround than using a blanket fixed value then.
> > > 
> > > Yes, that is an option.  But that may only reduce the difference
> > > between existing kernel and new kernel unless we make it the same
> > > number.  Further we are fixing this in P10 and hence we will have to
> > > add "if(P9) do the compensation" and otherwise take it as is.  That
> > > would not be elegant.  Given that our goal for P9 platform is to not
> > > introduce changes in H_CEDE entry behaviour, we arrived at this
> > > approach (this small patch) and this also makes it easy to backport to
> > > various distro products.
> > 
> > I don't see how this is more elegent.
> > 
> > The current patch is
> > 
> > if(p9)
> > 	use fixed value
> > 
> > the suggested patch is
> > 
> > if(p9)
> > 	apply compensation
> 
> 
> We could do that, however, from the recent measurements the default
> value is closer to the latency value measured using an IPI.
> 
> As Vaidy described earlier, on POWER9 and prior platforms, the wakeup
> latency advertized by the PHYP hypervisor corresponds to the latency
> required to wakeup from the underlying hardware idle state (Nap in
> POWER8 and stop0/1/2 on POWER9) into the hypervisor. That's 2us on
> POWER9.
> 
> We need to apply two kinds of compensation,
> 
> 1. Compensation for the time taken to transition the CPU from the
>    Hypervisor into the LPAR post wakeup from platform idle state
> 
> 2. Compensation for the time taken to send the IPI from the source CPU
>    (waker) to the idle target CPU (wakee).
> 
> 1. can be measured via timer idle test (I am using Pratik's
> cpuidle self-test posted here
> https://lore.kernel.org/lkml/20210412074309.38484-1-psampat@linux.ibm.com/)
> 
> We queue a timer, say for 1ms, and enter the CEDE state. When the
> timer fires, in the timer handler we compute how much extra timer over
> the expected 1ms have we consumed. This is what it looks like on
> POWER9 LPAR
> 
> CEDE latency measured using a timer (numbers in ns)
> ===================================================================
> N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
> 400     2601     5677     5668.74    5917    6413     9299   455.01
> 
> If we consider the avg and the 99th %ile values, it takes on an avg
> about somewhere between 3.5-4.5 us to transition from the Hypervisor
> to the guest VCPU after the CPU has woken up from the idle state. 
> 
> 1. and 2. combined can be determined by an IPI latency test (from the
> same self-test linked above). We send an IPI to an idle CPU and in the
> handler compute the time difference between when the IPI was sent and
> when the handler ran. We see the following numbers on POWER9 LPAR.
> 
> CEDE latency measured using an IPI (numbers in us)
> ==================================================
> N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
> 400     711      7564     7369.43   8559    9514      9698   1200.01
> 
> Thus considering the avg and the 99th percentile this compensation
> would be 5.4-7.5us.
> 
> Suppose, we consider the compensation corresponding to the 99th
> percentile latency value measured using the IPI, the compensation will
> be 7.5us, which will take the total CEDE latency to 9.5us.
> 
> This is in the ballpark of the default value of 10us which we obtain
> if we do
> 
> if (!p10)
>    use default hardcoded value;
> 
That's a nice detailed explanation. Maybe you could summarize it in the
commit message so that people looking at the patch in the future can
tell where the value comes from.

Thanks

Michal
