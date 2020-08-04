Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423523BC26
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 16:29:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLcZx2gGWzDqPl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 00:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 489 seconds by postgrey-1.36 at bilbo;
 Wed, 05 Aug 2020 00:24:27 AEST
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLcT73T2MzDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 00:24:26 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 5E81F53A4293;
 Tue,  4 Aug 2020 16:16:10 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 4 Aug 2020
 16:16:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e3151918-35f1-4b55-810d-923abeda6b80,
 8D702D8D1A8AFA4BF73756F32E969A291ABE5FDC) smtp.auth=groug@kaod.org
Date: Tue, 4 Aug 2020 16:16:09 +0200
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for
 vCPU death
Message-ID: <20200804161609.6cb2cb71@bahia.lan>
In-Reply-To: <873652zg8h.fsf@mpe.ellerman.id.au>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: dc4a2545-135d-4a9d-823a-b1901d9ff165
X-Ovh-Tracer-Id: 7902128499820042534
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrjeeigdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdefkedvudduieffjeeijefhvedukeeuvdeiheevueeiveeftdefieekiedtgeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 04 Aug 2020 23:35:10 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Hi Mike,
> 
> There is a bit of history to this code, but not in a good way :)
> 
> Michael Roth <mdroth@linux.vnet.ibm.com> writes:
> > For a power9 KVM guest with XIVE enabled, running a test loop
> > where we hotplug 384 vcpus and then unplug them, the following traces
> > can be seen (generally within a few loops) either from the unplugged
> > vcpu:
> >
> >   [ 1767.353447] cpu 65 (hwid 65) Ready to die...
> >   [ 1767.952096] Querying DEAD? cpu 66 (66) shows 2
> >   [ 1767.952311] list_del corruption. next->prev should be c00a000002470208, but was c00a000002470048
> ...
> >
> > At that point the worker thread assumes the unplugged CPU is in some
> > unknown/dead state and procedes with the cleanup, causing the race with
> > the XIVE cleanup code executed by the unplugged CPU.
> >
> > Fix this by inserting an msleep() after each RTAS call to avoid
> 
> We previously had an msleep(), but it was removed:
> 
>   b906cfa397fd ("powerpc/pseries: Fix cpu hotplug")
> 

Ah, I hadn't seen that one...

> > pseries_cpu_die() returning prematurely, and double the number of
> > attempts so we wait at least a total of 5 seconds. While this isn't an
> > ideal solution, it is similar to how we dealt with a similar issue for
> > cede_offline mode in the past (940ce422a3).
> 
> Thiago tried to fix this previously but there was a bit of discussion
> that didn't quite resolve:
> 
>   https://lore.kernel.org/linuxppc-dev/20190423223914.3882-1-bauerman@linux.ibm.com/
> 

Yeah it appears that the motivation at the time was to make the "Querying DEAD?"
messages to disappear and to avoid potentially concurrent calls to rtas-stop-self
which is prohibited by PAPR... not fixing actual crashes.

> 
> Spinning forever seems like a bad idea, but as has been demonstrated at
> least twice now, continuing when we don't know the state of the other
> CPU can lead to straight up crashes.
> 
> So I think I'm persuaded that it's preferable to have the kernel stuck
> spinning rather than oopsing.
> 

+1

> I'm 50/50 on whether we should have a cond_resched() in the loop. My
> first instinct is no, if we're stuck here for 20s a stack trace would be
> good. But then we will probably hit that on some big and/or heavily
> loaded machine.
> 
> So possibly we should call cond_resched() but have some custom logic in
> the loop to print a warning if we are stuck for more than some
> sufficiently long amount of time.
> 

How long should that be ?

> 
> > Fixes: eac1e731b59ee ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1856588
> 
> This is not public.
> 

I'll have a look at changing that.

> I tend to trim Bugzilla links from the change log, because I'm not
> convinced they will last forever, but it is good to have them in the
> mail archive.
> 
> cheers
> 

Cheers,

--
Greg

> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Cedric Le Goater <clg@kaod.org>
> > Cc: Greg Kurz <groug@kaod.org>
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > index c6e0d8abf75e..3cb172758052 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > @@ -111,13 +111,12 @@ static void pseries_cpu_die(unsigned int cpu)
> >  	int cpu_status = 1;
> >  	unsigned int pcpu = get_hard_smp_processor_id(cpu);
> >  
> > -	for (tries = 0; tries < 25; tries++) {
> > +	for (tries = 0; tries < 50; tries++) {
> >  		cpu_status = smp_query_cpu_stopped(pcpu);
> >  		if (cpu_status == QCSS_STOPPED ||
> >  		    cpu_status == QCSS_HARDWARE_ERROR)
> >  			break;
> > -		cpu_relax();
> > -
> > +		msleep(100);
> >  	}
> >  
> >  	if (cpu_status != 0) {
> > -- 
> > 2.17.1

