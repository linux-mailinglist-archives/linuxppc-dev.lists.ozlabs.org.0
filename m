Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52D74077D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 03:10:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qDYbBwy0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrNml6z9tz2yyw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 11:10:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qDYbBwy0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrNlw1RTVz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 11:09:47 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6b74791c948so2742784a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 18:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687914582; x=1690506582;
        h=in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HW7JQ71sbb4a92jnmvwt7wlFbdVggC9/cbLPydvRNIQ=;
        b=qDYbBwy0bqF4ACWJIkeR+LMgEM9XDHsWbUTFPkx99XcTcQzhemPO7x79dfE0F++p5r
         4KrZZnA2ltLyKxMG3HC9C6/w6ABjsdHLmLz9SUouRsSz6YUMQSD2O+v3Tf45urXIY6AN
         jDPSf16D86p4KcquPoY6O6I2QXzuF757ANFb3y/4qq1H7zGKvQM1ir3Vy5pohXuQxfIK
         zwv2lhbENECC9D42Ky0rHGwvY2OMHaWfLBtQL8If/hjiSbzF8HqsEyRep8EwpYaKAv8J
         mxiZGEDcD1usiE7Ccrym7T0MSzDPH3ub3/VIkziMkacUiHCZ+nrAxOpgsNs4IsVpnbba
         4fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687914582; x=1690506582;
        h=in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HW7JQ71sbb4a92jnmvwt7wlFbdVggC9/cbLPydvRNIQ=;
        b=FTomRdV8fkJQsYCSB/KCZ/Ei5++5ggsAzMW/YRZtfKf7UH5Yhxv3E/gq21OnRlD6pB
         oNo05gUJSENxsqfMN0vy2gAQifVHLY2vlAWM6bXyOVyUTTjjjbQIN0c2RFcXX01O+74U
         jNoKyk8p657NgkajD0bjn9O4xWVJB3yDzKy1neT+0Q6gojnPA4e7eGc2yBl6iEVTf+Sb
         iLzVa6krsxvyFCpLmItgIYtTHR+2gykCfZcM0x9dztteM/Tz8YAI6OxHA136p6K9hm0G
         mQHwYX4tyvuheNlKpOoTsGcTQpFV1XcTQt3Pm9uNkqnCCv+YdbFBwHa7dqmJ44nADXA+
         cO/A==
X-Gm-Message-State: AC+VfDw+AlpRKyIkmKCR5BoRc3awwx/WRrudL2AEUFGv+kWkfnIg4NdG
	B9iIAKMoXLb2fqkH7atC7Js=
X-Google-Smtp-Source: ACHHUZ5JII6/UO5PrtGdL6Wo8WDeps9s3NRIovdwZCw+zmQQJErkrtuoJhL2Y/gJCcR8ycGuB8B4dg==
X-Received: by 2002:aca:1c19:0:b0:3a2:f93e:d4ed with SMTP id c25-20020aca1c19000000b003a2f93ed4edmr2941640oic.33.1687914582286;
        Tue, 27 Jun 2023 18:09:42 -0700 (PDT)
Received: from dw-tp ([49.207.220.159])
        by smtp.gmail.com with ESMTPSA id i20-20020aa787d4000000b00679325476dfsm3511018pfo.91.2023.06.27.18.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 18:09:41 -0700 (PDT)
Date: Wed, 28 Jun 2023 06:39:30 +0530
Message-Id: <87wmzoo0j9.fsf@doe.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2 12/16] mm/vmemmap optimization: Split hugetlb and devdax vmemmap optimization
In-Reply-To: <20230616110826.344417-13-aneesh.kumar@linux.ibm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Arm disabled hugetlb vmemmap optimization [1] because hugetlb vmemmap
> optimization includes an update of both the permissions (writeable to
> read-only) and the output address (pfn) of the vmemmap ptes. That is not
> supported without unmapping of pte(marking it invalid) by some
> architectures.
>
> With DAX vmemmap optimization we don't require such pte updates and
> architectures can enable DAX vmemmap optimization while having hugetlb
> vmemmap optimization disabled. Hence split DAX optimization support into a
> different config.
>
> loongarch and riscv don't have devdax support. So the DAX config is not
> enabled for them. With this change, arm64 should be able to select DAX
> optimization
>
> [1] commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable HUGETLB_PAGE_OPTIMIZE_VMEMMAP")
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/loongarch/Kconfig | 2 +-
>  arch/riscv/Kconfig     | 2 +-
>  arch/x86/Kconfig       | 3 ++-
>  fs/Kconfig             | 2 +-
>  include/linux/mm.h     | 2 +-
>  mm/Kconfig             | 5 ++++-
>  6 files changed, 10 insertions(+), 6 deletions(-)

what about s390?

git grep "ARCH_WANT_OPTIMIZE_VMEMMAP" .
arch/s390/Kconfig:      select ARCH_WANT_OPTIMIZE_VMEMMAP

> diff --git a/mm/Kconfig b/mm/Kconfig
> index 7672a22647b4..7b388c10baab 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -461,7 +461,10 @@ config SPARSEMEM_VMEMMAP
>  # Select this config option from the architecture Kconfig, if it is preferred
>  # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
>  #
> -config ARCH_WANT_OPTIMIZE_VMEMMAP
> +config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
> +	bool
> +
> +config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>  	bool
>  
>  config HAVE_MEMBLOCK_PHYS_MAP
> -- 
> 2.40.1

-ritesh
