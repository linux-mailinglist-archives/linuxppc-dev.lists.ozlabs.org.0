Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F9940BEBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 06:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8Rcf6ddPz2ywF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 14:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=f5JtWLoO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=f5JtWLoO; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8Rc03Pk2z2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 14:11:28 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id f129so1433573pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 21:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Www1Sy/iGaECDjccUq89+Q4UC3DZFrVqkJMRs3jnAoA=;
 b=f5JtWLoOAwop2HOyICQphlrTyYGhbXJ4qzohTu9cza9ymnaDVDmPoOXlWMNlsYZ63j
 48HThtIL3ulmBpXV0ywVISKr9usamlhlXBbyLfygAnd2803JLkoKDTpAeO5i/txnwsXF
 h1WNbhrz0rP6nIh4Wt1SElozQDPJW3xMcoZV8A50E0aFLtPG7ytbSJuvZGrXsRvmMfb5
 fhOef76SGMSCcSV5p+Yo2XFgSLD3X5/lciKLKcK4hDQns1tgB33yK+6T5vk6ny5JXT4d
 wK4l0b1z1iXjLq1DziyR7UVbUgxWsUqeFEj2UwAB4EVUuk1iGb+WIa+zTL88czpx4uWl
 flgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Www1Sy/iGaECDjccUq89+Q4UC3DZFrVqkJMRs3jnAoA=;
 b=AhEcygM2OicD//1qnM5glqnhCpkAuTYdM09csDIej5BXprLW0DOZzHu5MBEYG91tdO
 O5ELBPRnjas9LaS2uJv2p6FjaW78TVyAru1DUfIWDq1zJIU8vJjrq2OOe6GeYqjrqMfu
 PsMhLpdHgAtb9kTy0tNcN4olvNE6F2JuXbK6Il5vTtmCu0SDBffCSRxs7DKFeInjmhCr
 /jIqUM0yzswTwuUE0ezlSEIq3BI9utwYPhKvZ4hL40qydDuU6yDPy1LpOkTHgJdNvdqD
 qQXRmOA++DX8c/r0GHjlNQo1ai1kXpaZndrtq+BEdwcgEhWGyEpluEUP+g0emj32+3Go
 Mmkg==
X-Gm-Message-State: AOAM531ACfnMxqC7Z/0YaiTWpguzbETCmHtH1b/TMAxeub9adcKX9fy9
 XE78tGaGBOMkUKgePGOwAPZAH1IdICFbPDJHxa375g==
X-Google-Smtp-Source: ABdhPJzVXf0or9qBPzNfUFPKqhXw6K1+8mdqK8CY5lJZTuBV/KxnpGf4inQTjJwy/A58j34e85JTiH17oUDNfhLWDfc=
X-Received: by 2002:a63:1e0e:: with SMTP id e14mr18563273pge.5.1631679085171; 
 Tue, 14 Sep 2021 21:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210903050914.273525-1-kjain@linux.ibm.com>
 <20210903050914.273525-2-kjain@linux.ibm.com>
 <CAPcyv4jSL2cDxGiXEtyyce3eNEE_QUnnMjuLXb3iCwO8_7a7LQ@mail.gmail.com>
 <d7f8bf51-059f-4496-37c4-6516a703e209@linux.ibm.com>
 <CAPcyv4hE4rh5R+8zy3X4gDJeuPzQ0oQHmHbe_pppgWB2_RjfAg@mail.gmail.com>
In-Reply-To: <CAPcyv4hE4rh5R+8zy3X4gDJeuPzQ0oQHmHbe_pppgWB2_RjfAg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 14 Sep 2021 21:11:14 -0700
Message-ID: <CAPcyv4hZZX4WscR41PUSXZhDLPR6LuXHNRcJDO52gb+3MahYAA@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/4] drivers/nvdimm: Add nvdimm pmu structure
To: kajoljain <kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Santosh Sivaraj <santosh@fossix.org>,
 maddy@linux.ibm.com, "Weiny, Ira" <ira.weiny@intel.com>,
 rnsastry@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 atrajeev@linux.vnet.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 14, 2021 at 9:08 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Thu, Sep 9, 2021 at 12:56 AM kajoljain <kjain@linux.ibm.com> wrote:
> >
> >
> >
> > On 9/8/21 3:29 AM, Dan Williams wrote:
> > > Hi Kajol,
> > >
> > > Apologies for the delay in responding to this series, some comments below:
> >
> > Hi Dan,
> >     No issues, thanks for reviewing the patches.
> >
> > >
> > > On Thu, Sep 2, 2021 at 10:10 PM Kajol Jain <kjain@linux.ibm.com> wrote:
> > >>
> > >> A structure is added, called nvdimm_pmu, for performance
> > >> stats reporting support of nvdimm devices. It can be used to add
> > >> nvdimm pmu data such as supported events and pmu event functions
> > >> like event_init/add/read/del with cpu hotplug support.
> > >>
> > >> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > >> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> > >> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> > >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > >> ---
> > >>  include/linux/nd.h | 43 +++++++++++++++++++++++++++++++++++++++++++
> > >>  1 file changed, 43 insertions(+)
> > >>
> > >> diff --git a/include/linux/nd.h b/include/linux/nd.h
> > >> index ee9ad76afbba..712499cf7335 100644
> > >> --- a/include/linux/nd.h
> > >> +++ b/include/linux/nd.h
> > >> @@ -8,6 +8,8 @@
> > >>  #include <linux/ndctl.h>
> > >>  #include <linux/device.h>
> > >>  #include <linux/badblocks.h>
> > >> +#include <linux/platform_device.h>
> > >> +#include <linux/perf_event.h>
> > >>
> > >>  enum nvdimm_event {
> > >>         NVDIMM_REVALIDATE_POISON,
> > >> @@ -23,6 +25,47 @@ enum nvdimm_claim_class {
> > >>         NVDIMM_CCLASS_UNKNOWN,
> > >>  };
> > >>
> > >> +/* Event attribute array index */
> > >> +#define NVDIMM_PMU_FORMAT_ATTR         0
> > >> +#define NVDIMM_PMU_EVENT_ATTR          1
> > >> +#define NVDIMM_PMU_CPUMASK_ATTR                2
> > >> +#define NVDIMM_PMU_NULL_ATTR           3
> > >> +
> > >> +/**
> > >> + * struct nvdimm_pmu - data structure for nvdimm perf driver
> > >> + *
> > >> + * @name: name of the nvdimm pmu device.
> > >> + * @pmu: pmu data structure for nvdimm performance stats.
> > >> + * @dev: nvdimm device pointer.
> > >> + * @functions(event_init/add/del/read): platform specific pmu functions.
> > >
> > > This is not valid kernel-doc:
> > >
> > > include/linux/nd.h:67: warning: Function parameter or member
> > > 'event_init' not described in 'nvdimm_pmu'
> > > include/linux/nd.h:67: warning: Function parameter or member 'add' not
> > > described in 'nvdimm_pmu'
> > > include/linux/nd.h:67: warning: Function parameter or member 'del' not
> > > described in 'nvdimm_pmu'
> > > include/linux/nd.h:67: warning: Function parameter or member 'read'
> > > not described in 'nvdimm_pmu'
> > >
> > > ...but I think rather than fixing those up 'struct nvdimm_pmu' should be pruned.
> > >
> > > It's not clear to me that it is worth the effort to describe these
> > > details to the nvdimm core which is just going to turn around and call
> > > the pmu core. I'd just as soon have the driver call the pmu core
> > > directly, optionally passing in attributes and callbacks that come
> > > from the nvdimm core and/or the nvdimm provider.
> >
> > The intend for adding these callbacks(event_init/add/del/read) is to give
> > flexibility to the nvdimm core to add some common checks/routines if required
> > in the future. Those checks can be common for all architecture with still having the
> > ability to call arch/platform specific driver code to use its own routines.
> >
> > But as you said, currently we don't have any common checks and it directly
> > calling platform specific code, so we can get rid of it.
> > Should we remove this part for now?
>
> Yes, lets go direct to the perf api for now and await the need for a
> common core wrapper to present itself.
>
> >
> >
> > >
> > > Otherwise it's also not clear which of these structure members are
> > > used at runtime vs purely used as temporary storage to pass parameters
> > > to the pmu core.
> > >
> > >> + * @attr_groups: data structure for events, formats and cpumask
> > >> + * @cpu: designated cpu for counter access.
> > >> + * @node: node for cpu hotplug notifier link.
> > >> + * @cpuhp_state: state for cpu hotplug notification.
> > >> + * @arch_cpumask: cpumask to get designated cpu for counter access.
> > >> + */
> > >> +struct nvdimm_pmu {
> > >> +       const char *name;
> > >> +       struct pmu pmu;
> > >> +       struct device *dev;
> > >> +       int (*event_init)(struct perf_event *event);
> > >> +       int  (*add)(struct perf_event *event, int flags);
> > >> +       void (*del)(struct perf_event *event, int flags);
> > >> +       void (*read)(struct perf_event *event);
> > >> +       /*
> > >> +        * Attribute groups for the nvdimm pmu. Index 0 used for
> > >> +        * format attribute, index 1 used for event attribute,
> > >> +        * index 2 used for cpusmask attribute and index 3 kept as NULL.
> > >> +        */
> > >> +       const struct attribute_group *attr_groups[4];
> > >
> > > Following from above, I'd rather this was organized as static
> > > attributes with an is_visible() helper for the groups for any dynamic
> > > aspects. That mirrors the behavior of nvdimm_create() and allows for
> > > device drivers to compose the attribute groups from a core set and /
> > > or a provider specific set.
> >
> > Since we don't have any common events right now, Can I use papr
> > attributes directly or should we create dummy events for common thing and
> > then merged it with papr event list.
>
> Just use papr events directly.

That is to say...I think if another implementation followed it should
try to match as many common event names as papr_scm picked, and
possibly extend with its own rather than start with a papr_scm
specific namespace for everything.
