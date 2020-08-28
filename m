Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5178255F78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 19:10:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdR1z0G4QzDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 03:10:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.149; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=rj/KFFSu; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound6mad.lav.puc.rediris.es
 [130.206.19.149])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdQyN0FkdzDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 03:07:38 +1000 (AEST)
Received: from mta-out01.sim.rediris.es (mta-out01.sim.rediris.es
 [130.206.24.43])
 by mx01.puc.rediris.es  with ESMTP id 07SH7OR8017121-07SH7ORA017121
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 28 Aug 2020 19:07:24 +0200
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 26733303A2D9;
 Fri, 28 Aug 2020 19:07:24 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTP id 19A09303A2D8;
 Fri, 28 Aug 2020 19:07:24 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out01.sim.rediris.es
Received: from mta-out01.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out01.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wcwKqmJfmN65; Fri, 28 Aug 2020 19:07:24 +0200 (CEST)
Received: from lt-gp.iram.es (81.145.223.87.dynamic.jazztel.es [87.223.145.81])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPA id 843BD303A2C1;
 Fri, 28 Aug 2020 19:07:23 +0200 (CEST)
Date: Fri, 28 Aug 2020 19:07:12 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
Message-ID: <20200828170712.GA27426@lt-gp.iram.es>
References: <8ce38d9bb162268f53a2292a916c44579421e552.camel@sguazz.it>
 <5158eae8-6809-ae07-0d16-58f2a766f534@csgroup.eu>
 <c707f59d379a51b83ba52e796d137887219c32fc.camel@sguazz.it>
 <f96d336d-fb81-fe9d-9890-db57c6560e85@csgroup.eu>
 <e7a620fa7521e84e2010660b87f20dd24a3b0cd4.camel@sguazz.it>
 <65baad98-79a0-5ee4-521e-5327029de459@csgroup.eu>
 <0a18fc199cef2643bd07591205a6234c2edf6c95.camel@sguazz.it>
 <afd75c134e2c4a57f8cf1f064595455e67b17e41.camel@sguazz.it>
 <cab15033beeefa317aae40370664e108f57dc050.camel@sguazz.it>
 <afae7efd-0d8a-5672-7b75-9394b0ff3d3c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <afae7efd-0d8a-5672-7b75-9394b0ff3d3c@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=GMM/vtBh+9dLWtzgTE3C0Yo/sBtCDwwaEu8dOfCYMWA=;
 b=rj/KFFSuF9kUfP8kTO1ZTg3S3KCSlrN4EcZ5WaR9f920nJBcN+ONb0IXiDKCAAS8+9ORHVEGcmrf
 1cidI8zAolZlcUQdmKWZ3VsWTu3p/dlUEftI5Q0Q9It9MVcDS4SlKDPjgQU0wHHVUbcbQycpeH2t
 0/nOtctw0ulaAsXhjCC8vqvTWWVFUvWBm+wNR/Ylf1kCuc5gNtmnfqRouXDaiheJ5g2g1Hfv15Gs
 8d0xzbz3Xxa5TuK4S1G1Tg/rWvQJ1XeFow/01fZAC2/gv8PE8TCVRhVvda7qzE/hX5Nif2DmH2bo
 v0lOltQ6FWpxW9EpFSZgTpWKJPWqUec/ozcOeA==
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
Cc: Giuseppe Sacco <giuseppe@sguazz.it>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 12:39:06PM +0200, Christophe Leroy wrote:
> Hi,
>=20
> Le 27/08/2020 =E0 10:28, Giuseppe Sacco a =E9crit=A0:
> > Il giorno gio, 27/08/2020 alle 09.46 +0200, Giuseppe Sacco ha scritto=
:
> > > Il giorno gio, 27/08/2020 alle 00.28 +0200, Giuseppe Sacco ha scrit=
to:
> > > > Hello Christophe,
> > > >=20
> > > > Il giorno mer, 26/08/2020 alle 15.53 +0200, Christophe Leroy ha
> > > > scritto:
> > > > [...]
> > > > > If there is no warning, then the issue is something else, bad l=
uck.
> > > > >=20
> > > > > Could you increase the loglevel and try again both with and wit=
hout
> > > > > VMAP_STACK ? Maybe we'll get more information on where it stops=
.
> > > >=20
> > > > The problem is related to the CPU frequency changes. This is wher=
e the
> > > > system stop: cpufreq get the CPU frequency limits and then start =
the
> > > > default governor (performance) and then calls function
> > > > cpufreq_gov_performance_limits() that never returns.
> > > >=20
> > > > Rebuilding after enabling pr_debug for cpufreq.c, I've got some m=
ore
> > > > lines of output:
> > > >=20
> > > > cpufreq: setting new policy for CPU 0: 667000 - 867000 kHz
> > > > cpufreq: new min and max freqs are 667000 - 867000 kHz
> > > > cpufreq: governor switch
> > > > cpufreq: cpufreq_init_governor: for CPU 0
> > > > cpufreq: cpufreq_start_governor: for CPU 0
> > > > cpufreq: target for CPU 0: 867000 kHz, relation 1, requested 8670=
00 kHz
> > > > cpufreq: __target_index: cpu: 0, oldfreq: 667000, new freq: 86700=
0
> > > > cpufreq: notification 0 of frequency transition to 867000 kHz
> > > > cpufreq: saving 133328 as reference value for loops_per_jiffy; fr=
eq is 667000 kHz
> > > >=20
> > > > no more lines are printed. I think this output only refers to the
> > > > notification sent prior to the frequency change.
> > > >=20
> > > > I was thinking that selecting a governor that would run at 667mHz=
 would
> > > > probably skip the problem. I added cpufreq.default_governor=3Dpow=
ersave
> > > > to the command line parameters but it did not work: the selected
> > > > governor was still performance and the system crashed.
> > >=20
> > > I kept following the thread and found that CPU frequency is changed=
 in
> > > function pmu_set_cpu_speed() in file drivers/cpufreq/pmac32-cpufreq=
.c.
> > > As first thing, the function calls the macro preempt_disable() and =
this
> > > is where it stops.
> >=20
> > Sorry, I made a mistake. The real problem is down, on the same
> > function, when it calls low_sleep_handler(). This is where the proble=
m
> > probably is.
> >=20
>=20
>=20
> Great, you spotted the problem.
>=20
> I see what it is, it is in low_sleep_handler() in
> arch/powerpc/platforms/powermac/sleep.S
>=20
> All critical registers are saved on the stack. At restore, they are res=
tore
> BEFORE re-enabling MMU (because they are needed for that). But when we =
have
> VMAP_STACK, the stack can hardly be accessed without the MMU enabled.
> tophys() doesn't work for virtual stack addresses.
>=20
> Therefore, the low_sleep_handler() has to be reworked for using an area=
 in
> the linear mem instead of the stack.

Actually there is already one, at the end of sleep.S, there is a 4 byte
area called sleep_storage. It should be enough to move there the CPU stat=
e
which has to be restored before the MMU is enabled:
- SDR1
- BATs
- SPRG (they might stay on the stack by reordering the code unless I
  miss something)

Note that save_cpu_setup/restore_cpu_setup also use another static
storage area to save other SPRs.

Using static area would not work on SMP, but all PPC based Apple laptops
are single core and single thread.

	Gabriel
 

