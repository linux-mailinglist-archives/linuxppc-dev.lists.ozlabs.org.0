Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BD1A6595
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 13:22:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4915nj61QrzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 21:22:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=e6XtJ7t0; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4915lR4HcQzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 21:20:49 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id n24so552669plp.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=eWjJp/dxe+RPVXOdCDFcL7QIyEfvzzsWUDBkphPEud8=;
 b=e6XtJ7t03ertt8IS3771WG/kX6+5VdIGi4sYC6ffRouV1zzkbmjRUxFzXu5Bhmn397
 EaAwSWWBYTty8fYlDmLTXrhDvXucVV1DwRs+AOnWpeqyeX5ILBRdhcCLwOqo4qmr46ZP
 h73A/1Ps6b44fblnUMIlcmtADfQzODZ6C2G24l1W/IxsMn4IHbzEtADpsjIVCs8DFKBP
 vMlatW42ixXjUmOdazJOLus/x1wiJtkYFCjfgZ/OSR00U5vGCUVH4PWVW1IWKxY54TSs
 L3i2xY0GD4hTiNLhK8ceqkB4miftTJd583JB+8QjK2NZY1fBMlu0Vh99pgolCe3h1MSk
 qpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eWjJp/dxe+RPVXOdCDFcL7QIyEfvzzsWUDBkphPEud8=;
 b=X2D759hAxVhiEmy6nlyYKEv3M7//JJzu2t+SDx7mGCbwdBTjxJ02VHPm2rK20hqy4t
 URP4OGnNQxd3TUeXI+t0cwlCQbmZqAYIx92OkSpldbC55ApagHP4ajG8k30lE1jKQ2g4
 dP2Et0fRE1eVK4p4NTAMjCppO6/AyRyXU5TGkmYAyFvkxhAYin6CgWFx8WMwunsGbKiA
 ZMOGPZ5JG5MI9SUh9cYY25upQp3+fz8vgS/6VrMarEf2Cu4BgJR3TfjStmjW8brp9vPj
 5BDOpAZwRWJ4B8ze6z136Qs5sErciiej9WzGbOq+OpTQYsCU0wucCN+uko+7vE1k97io
 UQpw==
X-Gm-Message-State: AGi0PuaZi8sPvprPrRqQC+2Ma0tWmFrARWZh7yPCbYF5f86Zfrxp5vt6
 +QAnUHwBUM5rGI52tPYk8R0UCQ==
X-Google-Smtp-Source: APiQypKCbI/xA8FMnNToU+0P0qyXEEqBGTonTc6ZZd18qaFZc+Lie7KNbai01tJWaLFxjpZqSmcmkw==
X-Received: by 2002:a17:90a:3343:: with SMTP id
 m61mr22438044pjb.112.1586776845568; 
 Mon, 13 Apr 2020 04:20:45 -0700 (PDT)
Received: from localhost ([2401:4900:360d:80fd:f85c:bf4e:4685:22fb])
 by smtp.gmail.com with ESMTPSA id w2sm8420022pff.195.2020.04.13.04.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 04:20:44 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
In-Reply-To: <202004131149.8rYYWgAe%lkp@intel.com>
References: <20200401074741.1562361-1-santosh@fossix.org>
 <202004131149.8rYYWgAe%lkp@intel.com>
Date: Mon, 13 Apr 2020 16:50:38 +0530
Message-ID: <87a73fiqd5.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kbuild-all@lists.01.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kbuild test robot <lkp@intel.com> writes:

> Hi Santosh,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on v5.7-rc1 next-20200412]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see
> https://stackoverflow.com/a/37406982]

This patch depends on "powerpc/mce: Add MCE notification chain" [1].

[1]: https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/

Thanks,
Santosh

>
> url:    https://github.com/0day-ci/linux/commits/Santosh-Sivaraj/papr-scm-Add-bad-memory-ranges-to-nvdimm-bad-ranges/20200401-171233
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.3.0 make.cross ARCH=powerpc 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_init':
>>> arch/powerpc/platforms/pseries/papr_scm.c:584:3: error: implicit declaration of function 'mce_register_notifier'; did you mean 'bus_register_notifier'? [-Werror=implicit-function-declaration]
>      584 |   mce_register_notifier(&mce_ue_nb);
>          |   ^~~~~~~~~~~~~~~~~~~~~
>          |   bus_register_notifier
>    arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_exit':
>>> arch/powerpc/platforms/pseries/papr_scm.c:592:2: error: implicit declaration of function 'mce_unregister_notifier'; did you mean 'bus_unregister_notifier'? [-Werror=implicit-function-declaration]
>      592 |  mce_unregister_notifier(&mce_ue_nb);
>          |  ^~~~~~~~~~~~~~~~~~~~~~~
>          |  bus_unregister_notifier
>    cc1: some warnings being treated as errors
>
> vim +584 arch/powerpc/platforms/pseries/papr_scm.c
>
>    577	
>    578	static int __init papr_scm_init(void)
>    579	{
>    580		int ret;
>    581	
>    582		ret = platform_driver_register(&papr_scm_driver);
>    583		if (!ret)
>  > 584			mce_register_notifier(&mce_ue_nb);
>    585	
>    586		return ret;
>    587	}
>    588	module_init(papr_scm_init);
>    589	
>    590	static void __exit papr_scm_exit(void)
>    591	{
>  > 592		mce_unregister_notifier(&mce_ue_nb);
>    593		platform_driver_unregister(&papr_scm_driver);
>    594	}
>    595	module_exit(papr_scm_exit);
>    596	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
