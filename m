Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7754E3669
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 03:11:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMw3816cDz2yjc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 13:11:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jsl5hTKi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jsl5hTKi; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMw2R5693z2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 13:11:09 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so900021pjl.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGZp+MDIUzKlsOtQAo2TyTq0vVOirk1X0NOX9ev9OMc=;
 b=jsl5hTKisonrNJYTeMtNHzyDFdCfEUgD/ujMhDJCupZnphMkfd0uzKApmqk/n3FaED
 i46ZTIJ+Lj99NIG2v73jtrSrTVhoCDEpoHo9w7f4fY0L5l88DtDWVG91DqRej+vdmVzy
 Xp6pL5ctDPnLYuyosqtk4O/t+86XwfOHd3CCYIEVOeCa0p5eOsaD1qEqq8a0aXbxvWHf
 gX803FBk8yWx2Q0ft0SZnpgZ40r22BPfvagHhSHp0vKlLkzolVbE4jP+k1HbJAXZQKRY
 0piuCSEkh7Hwa3M83oI+taVZYG/M22LqqoyUtOWoKSK3WFjcvR01ygKRGV4swgcRolZg
 Dgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGZp+MDIUzKlsOtQAo2TyTq0vVOirk1X0NOX9ev9OMc=;
 b=O/USk04vBAVPRK04ogXBvzH8cqv2nleutfKAxs+j3CUvwpktZPaWLqZg8XupwaBint
 9zPlWwzhfMcQaPvmAKV0F++LWNrOa2LtlRgFRckRN0RDmWm+hW0OawSWda5Ai1ZUCyvK
 sp+juL1qqSy0K61wo2PzILtcub+ih3ufVUsHz0f61htwxCg3n2JdeT5QK+sLgg7pCu3S
 QrfL/gIHjtlk9kL/2PYB9okRogvizE/9W9GR3EOMecvoic3YZW72O1iXILHIB2X10q0M
 jeMwvnnTjkbeBbeCpJtfM5Nbw/q5uBzSm/Ll64pAF8Y3C89BkvBTvZxkMBausNix697E
 /I5w==
X-Gm-Message-State: AOAM532nI/vF3YIpCvTNhZ5OIoQgwP9m8zjGv+R/pDjT5hNEeuFXR2ZH
 4HEOs1gwixjJEGPmiqVyTFoqqmj1f367Mk/qf82YxQ==
X-Google-Smtp-Source: ABdhPJygUAsAdOWYyNjrdBLj+QkLKtyI/POLyJ7Ul6xPNIok2S+vw4/PZsNEToVHKjT2+REJe94s9PJMZnnk/6DQ+mw=
X-Received: by 2002:a17:90a:430d:b0:1bc:f340:8096 with SMTP id
 q13-20020a17090a430d00b001bcf3408096mr2221086pjg.93.1647915066682; Mon, 21
 Mar 2022 19:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220318114133.113627-1-kjain@linux.ibm.com>
In-Reply-To: <20220318114133.113627-1-kjain@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 21 Mar 2022 19:10:59 -0700
Message-ID: <CAPcyv4jNJy70b6jK6S9TYDrLLZxzSNQxfN7-bzOpVa+ffZN3hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers/nvdimm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
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
 maddy@linux.ibm.com, kernel test robot <lkp@intel.com>, "Weiny,
 Ira" <ira.weiny@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Peter Zijlstra <peterz@infradead.org>, rnsastry@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>
> The following build failure occures when CONFIG_PERF_EVENTS is not set
> as generic pmu functions are not visible in that scenario.
>
> |-- s390-randconfig-r044-20220313
> |   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_migrate_context
> |   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_register
> |   `-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_unregister
>
> Similar build failure in nds32 architecture:
> nd_perf.c:(.text+0x21e): undefined reference to `perf_pmu_migrate_context'
> nd_perf.c:(.text+0x434): undefined reference to `perf_pmu_register'
> nd_perf.c:(.text+0x57c): undefined reference to `perf_pmu_unregister'
>
> Fix this issue by adding check for CONFIG_PERF_EVENTS config option
> and disabling the nvdimm perf interface incase this config is not set.
>
> Also removed function declaration of perf_pmu_migrate_context,
> perf_pmu_register, perf_pmu_unregister functions from nd.h as these are
> common pmu functions which are part of perf_event.h and since we
> are disabling nvdimm perf interface incase CONFIG_PERF_EVENTS option
> is not set, we not need to declare them in nd.h
>
> Fixes: 0fab1ba6ad6b ("drivers/nvdimm: Add perf interface to expose
> nvdimm performance stats") (Commit id based on linux-next tree)
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Link: https://lore.kernel.org/all/62317124.YBQFU33+s%2FwdvWGj%25lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/nvdimm/Makefile | 2 +-
>  include/linux/nd.h      | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> ---
> - This fix patch changes are added and tested on top of linux-next tree
>   on the 'next-20220315' branch.
> ---
> diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
> index 3fb806748716..ba0296dca9db 100644
> --- a/drivers/nvdimm/Makefile
> +++ b/drivers/nvdimm/Makefile
> @@ -15,7 +15,7 @@ nd_e820-y := e820.o
>  libnvdimm-y := core.o
>  libnvdimm-y += bus.o
>  libnvdimm-y += dimm_devs.o
> -libnvdimm-y += nd_perf.o
> +libnvdimm-$(CONFIG_PERF_EVENTS) += nd_perf.o
>  libnvdimm-y += dimm.o
>  libnvdimm-y += region_devs.o
>  libnvdimm-y += region.o
> diff --git a/include/linux/nd.h b/include/linux/nd.h
> index 7b2ccbdc1cbc..a4265eaf5ae8 100644
> --- a/include/linux/nd.h
> +++ b/include/linux/nd.h
> @@ -8,8 +8,10 @@
>  #include <linux/ndctl.h>
>  #include <linux/device.h>
>  #include <linux/badblocks.h>
> +#ifdef CONFIG_PERF_EVENTS
>  #include <linux/perf_event.h>

Why must this not be included? Doesn't it already handle the
CONFIG_PERF_EVENTS=n case internally?

>  #include <linux/platform_device.h>

I notice now that this platform-device header should have never been
added in the first place, just forward declare:

struct platform_device;

> +#endif
>
>  enum nvdimm_event {
>         NVDIMM_REVALIDATE_POISON,
> @@ -25,6 +27,7 @@ enum nvdimm_claim_class {
>         NVDIMM_CCLASS_UNKNOWN,
>  };
>
> +#ifdef CONFIG_PERF_EVENTS
>  #define NVDIMM_EVENT_VAR(_id)  event_attr_##_id
>  #define NVDIMM_EVENT_PTR(_id)  (&event_attr_##_id.attr.attr)

Why must these be inside the ifdef guard?

>
> @@ -63,9 +66,7 @@ extern ssize_t nvdimm_events_sysfs_show(struct device *dev,
>
>  int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
>  void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);

Shouldn't there also be stub functions in the CONFIG_PERF_EVENTS=n case?

static inline int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm,
struct platform_device *pdev)
{
    return -ENXIO;
}

static inline void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu)
{
}

> -void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu);
> -int perf_pmu_register(struct pmu *pmu, const char *name, int type);
> -void perf_pmu_unregister(struct pmu *pmu);

Yeah, I should have caught these earlier.

> +#endif
>
>  struct nd_device_driver {
>         struct device_driver drv;
> --
> 2.31.1
>
