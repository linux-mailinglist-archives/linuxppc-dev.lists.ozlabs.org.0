Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40118069F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 19:34:17 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cNzC11XLzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 05:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YP894+sz; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cNwf04pTzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 05:32:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583865118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dJlX4LDcBzFdWvngwJvzTwhVKuVae1yG8vpkDvU+OQ8=;
 b=YP894+szmZiC91C1Ks9d7eFJMtPeou27EcvNU0r5NmJiaGLTu04RDkxA/PdGPkEdlZLHX2
 jFPyPLF5EsXU5SR229Gfg+nI1N1l7fLI1M7auvR8q7Kw8ZjUdvxhUljsWBZeFIQPjoDVXJ
 i+lgRhrZiv44i3EaFuelBB8ygDAEmk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-0j1lLHBCNWqPdafvCSTckw-1; Tue, 10 Mar 2020 14:31:54 -0400
X-MC-Unique: 0j1lLHBCNWqPdafvCSTckw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA09100550D;
 Tue, 10 Mar 2020 18:31:51 +0000 (UTC)
Received: from krava (ovpn-204-223.brq.redhat.com [10.40.204.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7DE360C87;
 Tue, 10 Mar 2020 18:31:44 +0000 (UTC)
Date: Tue, 10 Mar 2020 19:31:38 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Subject: Re: [PATCH v4 0/8] powerpc/perf: Add json file metric support for
 the hv_24x7 socket/chip level events
Message-ID: <20200310183138.GB181091@krava>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
 <20200309093506.GB67774@krava> <20200310181836.GA12036@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310181836.GA12036@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com,
 Kajol Jain <kjain@linux.ibm.com>, jmario@redhat.com, namhyung@kernel.org,
 tglx@linutronix.de, mpetlan@redhat.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 10, 2020 at 03:18:36PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Mon, Mar 09, 2020 at 10:35:06AM +0100, Jiri Olsa escreveu:
> > On Mon, Mar 09, 2020 at 11:55:44AM +0530, Kajol Jain wrote:
> > > First patch of the patchset fix inconsistent results we are getting when
> > > we run multiple 24x7 events.
> > > 
> > > Patchset adds json file metric support for the hv_24x7 socket/chip level
> > > events. "hv_24x7" pmu interface events needs system dependent parameter
> > > like socket/chip/core. For example, hv_24x7 chip level events needs
> > > specific chip-id to which the data is requested should be added as part
> > > of pmu events.
> > > 
> > > So to enable JSON file support to "hv_24x7" interface, patchset expose
> > > total number of sockets and chips per-socket details in sysfs
> > > files (sockets, chips) under "/sys/devices/hv_24x7/interface/".
> > > 
> > > To get sockets and number of chips per sockets, patchset adds a rtas call
> > > with token "PROCESSOR_MODULE_INFO" to get these details. Patchset also
> > > handles partition migration case to re-init these system depended
> > > parameters by adding proper calls in post_mobility_fixup() (mobility.c).
> > > 
> > > Patch 6 & 8 of the patchset handles perf tool plumbing needed to replace
> > > the "?" character in the metric expression to proper value and hv_24x7
> > > json metric file for different Socket/chip resources.
> > > 
> > > Patch set also enable Hz/hz prinitg for --metric-only option to print
> > > metric data for bus frequency.
> > > 
> > > Applied and tested all these patches cleanly on top of jiri's flex changes
> > > with the changes done by Kan Liang for "Support metric group constraint"
> > > patchset and made required changes.
> > > 
> > > Changelog:
> > > v3 -> v4
> > > - Made changes suggested by jiri.
> > 
> > could you please mention them next time? ;-)
> > 
> > > - Apply these patch on top of Kan liang changes.
> > 
> > Arnaldo, could you please pull the expr flex changes and Kan's
> > metric group constraint changes? it's both prereq of this patchset
> 
> Both are now in my perf/core branch, will go upstream soon, should I go
> and pickup the perf tooling bits in this patchkit?

Kajol mentioned there are still some issues with the
global variable, I plan to check on it this week

thanks,
jirka

