Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A5CB794
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 11:46:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l4l51DbmzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 19:46:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PlQzWAeK"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l4j2308xzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 19:44:36 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id z19so12248442ior.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Oct 2019 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AeOCuVNvbOiNRDsDLGaL1iRipTK66ZXvkDhGlOCNx0=;
 b=PlQzWAeK//l4dai5Q9PEC9E6SBkq/KqPOfoaLJEayRsUvoUoGXxI1BIpQmUk5IHU9x
 YQHN6e7vAgLrTVmTDs3Ju7MDwxozTWGElVuQ1kcLN8L+dytjPR+wdyQX6N0fEIdW5LXI
 D9VXgjieTqfOqZS+lvVYhegTd0VJzaYrvE7N3oNA8Pkxn68RkjwDmdV6aCtX8zU+QHXV
 mBZnhGbBIlfc3T4zGaoVMAjLaUV+p8wsw/NLLJDarU7/3oesnXEeDkcVJLGmt+vO/fK5
 h/E1cKWZ0B7aBaKOmFybXmLyyaCVI9GXonsF9m4K59qNYhprJVMss0oTGtC4QC1S17KD
 BpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AeOCuVNvbOiNRDsDLGaL1iRipTK66ZXvkDhGlOCNx0=;
 b=BSKTzeU2yUoNH4+kwUoewTmZkQzGtonIZXGUfLGbItkP4wY96NoHPt8vge2oRSGlMd
 BHHxzeKSBLPOXbX13isNQBJ3j9FdcU5ptFz+CMysPl/vvVLkiGcLLHpv4RMJ3O34sL/n
 yAUTvoSmPi1RluK9yfk5xhd6DqN+Fp/9fxn6c5Vf1Sx4enK2Q07RWN0Ax2jgNMKEakJi
 mnJ8UHBietFsJCS1lghVofQfvQ1t21c5sLO/HikmN78X253p39TE7wdRQcsDhsLJf4u3
 lqmdQ710d1qN2MSRqAKhiMboB3bgtq3Hl6lqrSeihPqHIXYldWZY571bZ8CyMPIN1K8K
 o+8w==
X-Gm-Message-State: APjAAAX7d4hJ7qQxGaBC6Y1hDMgBYYrjxlmmKvpYG8UzNJzLdABphSzY
 1AYHhIrtG1kGfa1x1L1Mg5SAD63hekEmC7b3C60=
X-Google-Smtp-Source: APXvYqxf69UnOPQlf1qEE2cUjLoLtiZyhIUG2CWiRBxhgOeXnw3vG1YvqS5BVpKmzz9TPpdBP242GzGCgDEkqTA6xtk=
X-Received: by 2002:a6b:2b91:: with SMTP id
 r139mr12672354ior.293.1570182272541; 
 Fri, 04 Oct 2019 02:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191004084335.16157-2-oohall@gmail.com>
 <201910041712.WAe5vxcJ%lkp@intel.com>
In-Reply-To: <201910041712.WAe5vxcJ%lkp@intel.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 4 Oct 2019 19:44:21 +1000
Message-ID: <CAOSf1CHwRgvwiygsSD_wFwe07nLKeaPMadP3VWHc2RAPfDQ-zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/powernv: Use common code for the symbol_map
 export
To: kbuild test robot <lkp@intel.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kbuild-all@01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 4, 2019 at 7:24 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Oliver,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [cannot apply to v5.4-rc1 next-20191004]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Oliver-O-Halloran/powerpc-powernv-Rework-exports-to-support-subnodes/20191004-165257
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/powerpc/platforms/powernv/opal.c: In function 'opal_export_attrs':
> >> arch/powerpc/platforms/powernv/opal.c:817:2: error: 'rc' undeclared (first use in this function); did you mean 'rq'?
>      rc = opal_add_one_export(opal_kobj, "symbol_map",
>      ^~
>      rq
>    arch/powerpc/platforms/powernv/opal.c:817:2: note: each undeclared identifier is reported only once for each function it appears in
>

I really need to start checking stuff still compiles after a rebase

*sigh*

>    787
>    788  /*
>    789   * opal_export_attrs: creates a sysfs node for each property listed in
>    790   * the device-tree under /ibm,opal/firmware/exports/
>    791   * All new sysfs nodes are created under /opal/exports/.
>    792   * This allows for reserved memory regions (e.g. HDAT) to be read.
>    793   * The new sysfs nodes are only readable by root.
>    794   */
>    795  static void opal_export_attrs(void)
>    796  {
>    797          struct device_node *np;
>    798          struct kobject *kobj;
>    799
>    800          np = of_find_node_by_path("/ibm,opal/firmware/exports");
>    801          if (!np)
>    802                  return;
>    803
>    804          /* Create new 'exports' directory - /sys/firmware/opal/exports */
>    805          kobj = kobject_create_and_add("exports", opal_kobj);
>    806          if (!kobj) {
>    807                  pr_warn("kobject_create_and_add() of exports failed\n");
>    808                  return;
>    809          }
>    810
>    811          opal_add_exported_attrs(np, kobj);
>    812
>    813          /*
>    814           * NB: symbol_map existed before the generic export interface so it
>    815           * lives under the top level opal_kobj.
>    816           */
>  > 817          rc = opal_add_one_export(opal_kobj, "symbol_map",
>    818                                   np->parent, "symbol-map");
>    819          if (rc)
>    820                  pr_warn("Error %d creating OPAL symbols file\n", rc);
>    821
>    822          of_node_put(np);
>    823  }
>    824
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
