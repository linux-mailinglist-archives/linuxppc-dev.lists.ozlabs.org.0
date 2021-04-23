Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C893699EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 20:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRjp54TR8z3021
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 04:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRjnn4pSSz2xfp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 04:42:21 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80436AE1C;
 Fri, 23 Apr 2021 18:42:18 +0000 (UTC)
Date: Fri, 23 Apr 2021 20:42:16 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Subject: Re: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <20210423184216.GG6564@kitsune.suse.cz>
References: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210423073551.GZ6564@kitsune.suse.cz>
 <YILu6/GK+RwpskCc@drishya.in.ibm.com>
 <20210423174505.GE6564@kitsune.suse.cz>
 <YIMSCjTzcSwjQtRi@drishya.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIMSCjTzcSwjQtRi@drishya.in.ibm.com>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 11:59:30PM +0530, Vaidyanathan Srinivasan wrote:
> * Michal Such?nek <msuchanek@suse.de> [2021-04-23 19:45:05]:
> 
> > On Fri, Apr 23, 2021 at 09:29:39PM +0530, Vaidyanathan Srinivasan wrote:
> > > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 09:35:51]:
> > > 
> > > > On Thu, Apr 22, 2021 at 08:37:29PM +0530, Gautham R. Shenoy wrote:
> > > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > > 
> > > > > Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > > > > CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> > > > > of the Extended CEDE states advertised by the platform
> > > > > 
> > > > > On some of the POWER9 LPARs, the older firmwares advertise a very low
> > > > > value of 2us for CEDE1 exit latency on a Dedicated LPAR. However the
> > > > Can you be more specific about 'older firmwares'?
> > > 
> > > Hi Michal,
> > > 
> > > This is POWER9 vs POWER10 difference, not really an obsolete FW.  The
> > > key idea behind the original patch was to make the H_CEDE latency and
> > > hence target residency come from firmware instead of being decided by
> > > the kernel.  The advantage is such that, different type of systems in
> > > POWER10 generation can adjust this value and have an optimal H_CEDE
> > > entry criteria which balances good single thread performance and
> > > wakeup latency.  Further we can have additional H_CEDE state to feed
> > > into the cpuidle.  
> > 
> > So all POWER9 machines are affected by the firmware bug where firmware
> > reports CEDE1 exit latency of 2us and the real latency is 5us which
> > causes the kernel to prefer CEDE1 too much when relying on the values
> > supplied by the firmware. It is not about 'older firmware'.
> 
> Correct.  All POWER9 systems running Linux as guest LPARs will see
> extra usage of CEDE idle state, but not baremetal (PowerNV).
> 
> The correct definition of the bug or miss-match in expectation is that
> firmware reports wakeup latency from a core/thread wakeup timing, but
> not end-to-end time from sending a wakeup event like an IPI using
> H_calls and receiving the events on the target.  Practically there are
> few extra micro-seconds needed after deciding to wakeup a target
> core/thread to getting the target to start executing instructions
> within the LPAR instance.

Thanks for the detailed explanation.

Maybe just adding a few microseconds to the reported time would be a
more reasonable workaround than using a blanket fixed value then.

> 
> > I still think it would be preferrable to adjust the latency value
> > reported by the firmware to match reality over a kernel workaround.
> 
> Right, practically we can fix for future releases and as such we
> targeted this scheme from POWER10 but expected no harm on POWER9 which
> proved to be wrong.
> 
> We can possibly change this FW value for POWER9, but it is too
> expensive and not practical because many release streams exist for
> different platforms and further customers are at different streams as
> well.  We cannot force all of them to update because that blows up
> co-dependency matrix.

From the user point of view only few firmware release streams exist but
what is packaged in such binaries might be another story.

Thanks

Michal
