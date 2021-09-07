Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3224030A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 00:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3zjh01z1z2yPc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 08:00:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=elcY35Sr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=elcY35Sr; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3zhx2k23z2xMF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 08:00:10 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id x19so272894pfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Sep 2021 15:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEjYbhAR02sgc7ovVsHyjAGZLSxtoc/tH2wPYp1Ypy8=;
 b=elcY35Sre5FRsVc5U7wrWxG59izHA38dFgmaHKIrZXPYnJABcHEWwH4WRekxYV8xTl
 72KxyD9kGd9FiJUW5mBrfPqmXaB7MxDmL/3NzRhvIoKpdxZaWEf99X1ru0Q/XLHtzFDL
 sGIZeHs9IHxA7Lee/Gkkoh145uPlhwzHwkNlzNSP5tDnh6igl77FtJr0SzfyTd3PPxSO
 YFlOudrMPSjcolvyPVOp+QbwxZNIWEzD3MAmIGB89LH6AIs2RV1hpD38ds8V5sh37dUK
 1vN3GRRPQeLW2fVGN9oQOvTv7wuPTOPJljZI1PXxlA6zhShM74+qRVpdIcijDHAjiD5f
 WX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEjYbhAR02sgc7ovVsHyjAGZLSxtoc/tH2wPYp1Ypy8=;
 b=aLZWtKyOesE/JmVABsnA1+4Y6D5xDky7rMl5An7SV4t41feLbtXAKvCRB3NH3ckPjx
 JKmWFunFSK1Z6jAa0Dbi73q1YgMbP2r9i4yp06fl8Zssyaj2CFpQn0DzmwKsLhhW8/at
 l2GZEiaEfQDIfxTqQCNhbEBa102/idcvi9LLJjCOeilalZ7Sx0oVLxH4sg3YQ+DVf6SM
 J89f7siwZYq1DjKS8ec6qB+rQWnwhicrWcT7ifAivGalMOnXccnf3ebsW5cpqBQlK90E
 3rsOc/1wNJgI+HWGORBweFK9nYG0FzFQjaJ4KUlTlW05B7S4KK4qtcEfobmadz4Oa/AC
 KnUg==
X-Gm-Message-State: AOAM53043TS4wilJsgmIP0/GE5WvifJhXQUaP5ifsufgcZiCkjBKIeC6
 UbYLGLIuGjzO6Kia+awnTQdRSADELyyyRxZQllAUBg==
X-Google-Smtp-Source: ABdhPJxx4EjbJvjL93bRoVayl6mm//Jv0BDO7s4EwjYNl8kM2qselsqA630wkktzF+3PhiHaezOvZrqOY7JxvIWmAUs=
X-Received: by 2002:a63:1e0e:: with SMTP id e14mr452534pge.5.1631052005753;
 Tue, 07 Sep 2021 15:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210903050914.273525-1-kjain@linux.ibm.com>
 <20210903050914.273525-2-kjain@linux.ibm.com>
In-Reply-To: <20210903050914.273525-2-kjain@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 Sep 2021 14:59:55 -0700
Message-ID: <CAPcyv4jSL2cDxGiXEtyyce3eNEE_QUnnMjuLXb3iCwO8_7a7LQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/4] drivers/nvdimm: Add nvdimm pmu structure
To: Kajol Jain <kjain@linux.ibm.com>
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

Hi Kajol,

Apologies for the delay in responding to this series, some comments below:

On Thu, Sep 2, 2021 at 10:10 PM Kajol Jain <kjain@linux.ibm.com> wrote:
>
> A structure is added, called nvdimm_pmu, for performance
> stats reporting support of nvdimm devices. It can be used to add
> nvdimm pmu data such as supported events and pmu event functions
> like event_init/add/read/del with cpu hotplug support.
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  include/linux/nd.h | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/include/linux/nd.h b/include/linux/nd.h
> index ee9ad76afbba..712499cf7335 100644
> --- a/include/linux/nd.h
> +++ b/include/linux/nd.h
> @@ -8,6 +8,8 @@
>  #include <linux/ndctl.h>
>  #include <linux/device.h>
>  #include <linux/badblocks.h>
> +#include <linux/platform_device.h>
> +#include <linux/perf_event.h>
>
>  enum nvdimm_event {
>         NVDIMM_REVALIDATE_POISON,
> @@ -23,6 +25,47 @@ enum nvdimm_claim_class {
>         NVDIMM_CCLASS_UNKNOWN,
>  };
>
> +/* Event attribute array index */
> +#define NVDIMM_PMU_FORMAT_ATTR         0
> +#define NVDIMM_PMU_EVENT_ATTR          1
> +#define NVDIMM_PMU_CPUMASK_ATTR                2
> +#define NVDIMM_PMU_NULL_ATTR           3
> +
> +/**
> + * struct nvdimm_pmu - data structure for nvdimm perf driver
> + *
> + * @name: name of the nvdimm pmu device.
> + * @pmu: pmu data structure for nvdimm performance stats.
> + * @dev: nvdimm device pointer.
> + * @functions(event_init/add/del/read): platform specific pmu functions.

This is not valid kernel-doc:

include/linux/nd.h:67: warning: Function parameter or member
'event_init' not described in 'nvdimm_pmu'
include/linux/nd.h:67: warning: Function parameter or member 'add' not
described in 'nvdimm_pmu'
include/linux/nd.h:67: warning: Function parameter or member 'del' not
described in 'nvdimm_pmu'
include/linux/nd.h:67: warning: Function parameter or member 'read'
not described in 'nvdimm_pmu'

...but I think rather than fixing those up 'struct nvdimm_pmu' should be pruned.

It's not clear to me that it is worth the effort to describe these
details to the nvdimm core which is just going to turn around and call
the pmu core. I'd just as soon have the driver call the pmu core
directly, optionally passing in attributes and callbacks that come
from the nvdimm core and/or the nvdimm provider.

Otherwise it's also not clear which of these structure members are
used at runtime vs purely used as temporary storage to pass parameters
to the pmu core.

> + * @attr_groups: data structure for events, formats and cpumask
> + * @cpu: designated cpu for counter access.
> + * @node: node for cpu hotplug notifier link.
> + * @cpuhp_state: state for cpu hotplug notification.
> + * @arch_cpumask: cpumask to get designated cpu for counter access.
> + */
> +struct nvdimm_pmu {
> +       const char *name;
> +       struct pmu pmu;
> +       struct device *dev;
> +       int (*event_init)(struct perf_event *event);
> +       int  (*add)(struct perf_event *event, int flags);
> +       void (*del)(struct perf_event *event, int flags);
> +       void (*read)(struct perf_event *event);
> +       /*
> +        * Attribute groups for the nvdimm pmu. Index 0 used for
> +        * format attribute, index 1 used for event attribute,
> +        * index 2 used for cpusmask attribute and index 3 kept as NULL.
> +        */
> +       const struct attribute_group *attr_groups[4];

Following from above, I'd rather this was organized as static
attributes with an is_visible() helper for the groups for any dynamic
aspects. That mirrors the behavior of nvdimm_create() and allows for
device drivers to compose the attribute groups from a core set and /
or a provider specific set.

> +       int cpu;
> +       struct hlist_node node;
> +       enum cpuhp_state cpuhp_state;
> +
> +       /* cpumask provided by arch/platform specific code */
> +       struct cpumask arch_cpumask;
> +};
> +
>  struct nd_device_driver {
>         struct device_driver drv;
>         unsigned long type;
> --
> 2.26.2
>
