Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4637D3F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 21:49:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgQNH1JSPz30C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 05:49:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=WURZ5Dp9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WURZ5Dp9; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgQMm6894z2y8F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 05:48:42 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id v5so17400886edc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=04u7NSFLCuoAEZTpNwtklAwY/LZiHtSbD3GHe1TrSXc=;
 b=WURZ5Dp9TLRM7pOryIseYUDP5G2ijGH4U67h3EYXg9MnF+15Y9iepy7FlDqXMig4gg
 meu0ctBC4yu+3xx+7/wPVvYjry/o73VCkzs6Dy+LUXKUVGOfrIs2QCcXy9/UDJE5+5PQ
 bbAd5uktx0ajURzTUfAvj1nElYoUyy585b2UxPzwQWSqUBjRvUvpYD3UW6jWS0C1Udyk
 KqMRGpkJFoUQUhWn+0v2nw+8jaHiDZ4u51XS7I8fXPGlmpWFBRgd/4oXeHdT68YW/zM2
 BTIE+7bTCwNJEbnnCNqi3lnDJvS8EXyqxVh0YiwgxZEveW1mywo/3Wygj9MglrG6uhj/
 KbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04u7NSFLCuoAEZTpNwtklAwY/LZiHtSbD3GHe1TrSXc=;
 b=RiyKJCKNauRDyr6RMcZZrEAYX33XzUnB2mei45ALsHpnzJ1LsIYhBmMtMMtqxq7jAe
 7WxD+2O9YLk7NWME0JhZlachi0mzb0WfalUtxTYz/NqnEiXjKu9grqarSuGNOmwg5gdW
 VGh93i3dvgucTWw1xp4FIWywcZat0KjZjo/Aw25PnYWQ8h8p72DKT4KUzFPaM+RtCpq4
 Tyt4n95Q4DwcHmRsOwBP3xOXBmBRWCMBLyShOl0r1qZnKUMFoPRRaVonOUJgQOUgryPu
 ToH8EpH5uggrF4Tqdt4nvPXxfrRo5Pe4ORgXjn0f1DmPMboe6byLQ4IXbk1MmDcDZcCj
 mhMQ==
X-Gm-Message-State: AOAM533CKH6Ek41QZh9VrPgh/p6dGZgffNC40XHtclWAhlxPrQ58YzV6
 tJ1HWIjSD2uYNP847wO2kC1nwyqoDbB/6ZFq5Q6b3A==
X-Google-Smtp-Source: ABdhPJx6vO+FpOhLvZ667PCFBJZ7nO93kAqvqyrdi7l+TpEsN2G1c7U+ERyiDWueE92+mc+LTS1rVrsVOJhHKxKlkpk=
X-Received: by 2002:a05:6402:54e:: with SMTP id
 i14mr46899040edx.210.1620848915486; 
 Wed, 12 May 2021 12:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210507113948.38950-1-vaibhav@linux.ibm.com>
In-Reply-To: <20210507113948.38950-1-vaibhav@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 12 May 2021 12:48:26 -0700
Message-ID: <CAPcyv4g7E39Hqe+fuv-J3gX1kiNVuenUfV4td_k9QtCNMV=C1w@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/papr_scm: Make 'perf_stats' invisible if
 perf-stats unavailable
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 7, 2021 at 4:40 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> In case performance stats for an nvdimm are not available, reading the
> 'perf_stats' sysfs file returns an -ENOENT error. A better approach is
> to make the 'perf_stats' file entirely invisible to indicate that
> performance stats for an nvdimm are unavailable.
>
> So this patch updates 'papr_nd_attribute_group' to add a 'is_visible'
> callback implemented as newly introduced 'papr_nd_attribute_visible()'
> that returns an appropriate mode in case performance stats aren't
> supported in a given nvdimm.
>
> Also the initialization of 'papr_scm_priv.stat_buffer_len' is moved
> from papr_scm_nvdimm_init() to papr_scm_probe() so that it value is
> available when 'papr_nd_attribute_visible()' is called during nvdimm
> initialization.
>
> Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')

Since this has been the exposed ABI since v5.9 perhaps a note /
analysis is needed here that the disappearance of this file will not
break any existing scripts/tools.

> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v2:
> * Removed a redundant dev_info() from pap_scm_nvdimm_init() [ Aneesh ]
> * Marked papr_nd_attribute_visible() as static which also fixed the
>   build warning reported by kernel build robot
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 35 ++++++++++++++++-------
>  1 file changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index e2b69cc3beaf..11e7b90a3360 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -907,6 +907,20 @@ static ssize_t flags_show(struct device *dev,
>  }
>  DEVICE_ATTR_RO(flags);
>
> +static umode_t papr_nd_attribute_visible(struct kobject *kobj,
> +                                        struct attribute *attr, int n)
> +{
> +       struct device *dev = container_of(kobj, typeof(*dev), kobj);

This can use the kobj_to_dev() helper.

> +       struct nvdimm *nvdimm = to_nvdimm(dev);
> +       struct papr_scm_priv *p = nvdimm_provider_data(nvdimm);
> +
> +       /* For if perf-stats not available remove perf_stats sysfs */
> +       if (attr == &dev_attr_perf_stats.attr && p->stat_buffer_len == 0)
> +               return 0;
> +
> +       return attr->mode;
> +}
> +
>  /* papr_scm specific dimm attributes */
>  static struct attribute *papr_nd_attributes[] = {
>         &dev_attr_flags.attr,
> @@ -916,6 +930,7 @@ static struct attribute *papr_nd_attributes[] = {
>
>  static struct attribute_group papr_nd_attribute_group = {
>         .name = "papr",
> +       .is_visible = papr_nd_attribute_visible,
>         .attrs = papr_nd_attributes,
>  };
>
> @@ -931,7 +946,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>         struct nd_region_desc ndr_desc;
>         unsigned long dimm_flags;
>         int target_nid, online_nid;
> -       ssize_t stat_size;
>
>         p->bus_desc.ndctl = papr_scm_ndctl;
>         p->bus_desc.module = THIS_MODULE;
> @@ -1016,16 +1030,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>         list_add_tail(&p->region_list, &papr_nd_regions);
>         mutex_unlock(&papr_ndr_lock);
>
> -       /* Try retriving the stat buffer and see if its supported */
> -       stat_size = drc_pmem_query_stats(p, NULL, 0);
> -       if (stat_size > 0) {
> -               p->stat_buffer_len = stat_size;
> -               dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
> -                       p->stat_buffer_len);
> -       } else {
> -               dev_info(&p->pdev->dev, "Dimm performance stats unavailable\n");
> -       }
> -
>         return 0;
>
>  err:   nvdimm_bus_unregister(p->bus);
> @@ -1102,6 +1106,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>         u64 blocks, block_size;
>         struct papr_scm_priv *p;
>         const char *uuid_str;
> +       ssize_t stat_size;
>         u64 uuid[2];
>         int rc;
>
> @@ -1179,6 +1184,14 @@ static int papr_scm_probe(struct platform_device *pdev)
>         p->res.name  = pdev->name;
>         p->res.flags = IORESOURCE_MEM;
>
> +       /* Try retriving the stat buffer and see if its supported */

s/retriving/retrieving/

> +       stat_size = drc_pmem_query_stats(p, NULL, 0);
> +       if (stat_size > 0) {
> +               p->stat_buffer_len = stat_size;
> +               dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
> +                       p->stat_buffer_len);
> +       }
> +
>         rc = papr_scm_nvdimm_init(p);
>         if (rc)
>                 goto err2;
> --
> 2.31.1
>

After the minor fixups above you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

...I assume this will go through the PPC tree.
