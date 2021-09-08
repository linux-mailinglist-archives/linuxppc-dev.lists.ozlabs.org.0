Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2940320C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 03:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H43nt5dgMz2yhl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 11:04:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=gA2AKqSY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gA2AKqSY; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H43n70MDSz2xry
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 11:04:03 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id l11so250891plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Sep 2021 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iKng76PsWyRz/8pjKL65aYQlih1TWo8dnb6KnDDehM=;
 b=gA2AKqSYLA1MsQE3BMExMBWz0L/kPrN0d88m681N9dDRm9y82WlVbC6+jWD0ghSlB2
 SyFe6JEC96j2lU/x/FecVxc0WYkUZcUG9uoZpqzpweENWnSLhz5JKPTrGO9eCS27Vbvc
 ewatD2c1ew2eWWvkKyoX+9LBmuw46PIVIINoX6SHItS4Kk47q7OabMVfkxbBnPtll2SG
 Uqu7JK1N11ylCIyfv3MbaMrhirdiv3iPRTLfZIakN0PCojZw5OfR2W7zsOippo2Hb2UC
 XSBHw7iAga4VdN4tdA1JthLBERWT0L+AMeMHrii+pyS1jLW0BcEpe1VSAu9txz4ZfQZo
 Th3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iKng76PsWyRz/8pjKL65aYQlih1TWo8dnb6KnDDehM=;
 b=VbbbF/VNpljHk8gzdV9LpoNLSKeLmSbmjnHdAFOtuXf5O1Kow9FmKD6PEIJVe2WfwQ
 lnSsEtRYLbGOtaJxI5xHJDXNYb0xo3sNyvyVwciFSOBhCsRLKy95kphTR88jRpd1MN4u
 CBJ6223Epv206KnwnjbeASq+RecMfLVt9WrXwUFbchFDuskPUt+XPxiqQalB3O8muf1/
 +m96o6HWpb0ZXPh0gDhquYTKsak5S1ouBQQ50xsSTWWnKbHb3RYstDOoXIcgr9FwDTFp
 V0ovkURRf5Jjtb0SKRiw6v+xjY2kW8VatzCAIZNvr1/ZztUkSvKK8cguWYH4HMwZPIeS
 vXrQ==
X-Gm-Message-State: AOAM532ce0lAUpRFBKhZXmKYt7n5psyGSgAGc6noanQyvHBODZmc6tQT
 1w9NlEwDt+AAkGJFovedAcCgAmTV9IJry036JJN+yg==
X-Google-Smtp-Source: ABdhPJyamM17dGx2IKarxEjJH/roNB9B0xLZUNSeDoP4i/s+QWcFqzVWNormFy+djtNq4zfCina5FNZQADngZlT7D84=
X-Received: by 2002:a17:90b:3b84:: with SMTP id
 pc4mr1194364pjb.220.1631063038886; 
 Tue, 07 Sep 2021 18:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210903050914.273525-1-kjain@linux.ibm.com>
 <20210903050914.273525-5-kjain@linux.ibm.com>
In-Reply-To: <20210903050914.273525-5-kjain@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 Sep 2021 18:03:48 -0700
Message-ID: <CAPcyv4h-MgZmteMSUfdeQL+XCxL5HvxK87HA3JYB0OoQUaPipQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 4/4] powerpc/papr_scm: Document papr_scm sysfs
 event format entries
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

On Thu, Sep 2, 2021 at 10:11 PM Kajol Jain <kjain@linux.ibm.com> wrote:
>
> Details is added for the event, cpumask and format attributes
> in the ABI documentation.
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-papr-pmem | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
> index 95254cec92bf..4d86252448f8 100644
> --- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
> +++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
> @@ -61,3 +61,34 @@ Description:
>                 * "CchRHCnt" : Cache Read Hit Count
>                 * "CchWHCnt" : Cache Write Hit Count
>                 * "FastWCnt" : Fast Write Count
> +
> +What:          /sys/devices/nmemX/format
> +Date:          June 2021
> +Contact:       linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
> +Description:   (RO) Attribute group to describe the magic bits
> +                that go into perf_event_attr.config for a particular pmu.
> +                (See ABI/testing/sysfs-bus-event_source-devices-format).
> +
> +                Each attribute under this group defines a bit range of the
> +                perf_event_attr.config. Supported attribute is listed
> +                below::
> +
> +                   event  = "config:0-4"  - event ID
> +
> +               For example::
> +                   noopstat = "event=0x1"
> +
> +What:          /sys/devices/nmemX/events

That's not a valid sysfs path. Did you mean /sys/bus/nd/devices/nmemX?

> +Date:          June 2021
> +Contact:       linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
> +Description:    (RO) Attribute group to describe performance monitoring
> +                events specific to papr-scm. Each attribute in this group describes
> +                a single performance monitoring event supported by this nvdimm pmu.
> +                The name of the file is the name of the event.
> +                (See ABI/testing/sysfs-bus-event_source-devices-events).

Given these events are in the generic namespace the ABI documentation
should be generic as well. So I think move these entries to
Documentation/ABI/testing/sysfs-bus-nvdimm directly.

You can still mention papr-scm, but I would expect something like:

What:           /sys/bus/nd/devices/nmemX/events
Date:           September 2021
KernelVersion:  5.16
Contact:        Kajol Jain <kjain@linux.ibm.com>
Description:
                (RO) Attribute group to describe performance monitoring events
                for the nvdimm memory device. Each attribute in this group
                describes a single performance monitoring event supported by
                this nvdimm pmu.  The name of the file is the name of the event.
                (See ABI/testing/sysfs-bus-event_source-devices-events). A
                listing of the events supported by a given nvdimm provider type
                can be found in Documentation/driver-api/nvdimm/$provider, for
                example: Documentation/driver-api/nvdimm/papr-scm.



> +
> +What:          /sys/devices/nmemX/cpumask
> +Date:          June 2021
> +Contact:       linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
> +Description:   (RO) This sysfs file exposes the cpumask which is designated to make
> +                HCALLs to retrieve nvdimm pmu event counter data.

Seems this one would be provider generic, so no need to refer to PPC
specific concepts like HCALLs.
