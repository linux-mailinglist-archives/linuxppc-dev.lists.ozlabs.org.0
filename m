Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF61D1ACC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 18:16:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MftJ14ByzDqJQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 02:16:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=i4xpCY5D; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MfrK243jzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 02:14:24 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id r7so14695504edo.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JcMsgBgFOR33rFkSLHsQoINTFi9A4r6gtBoxzM7yf+g=;
 b=i4xpCY5DSLfkEnhkBrJWM45ywVBJL4NJOtQux7qlHGMyoowblY76h3qVob1a001eel
 Q1RlgpqnZYfw0vUxGrfqj1fYKb+VNR0YPkAkDn23oiTp3VPCQoTstXPKTcxlvnbuCYvU
 Rd5Uu7wUKbDoA2zGV5xcPyhO8LBU+2Gdwt+BY6hMSk5TZx0zKKq+ZPIaAXfYUXW3oD37
 2LYEevpq6KqCQYYdcjkUwngZL7WjstoB73zpTX4YMCH7jClwh+5kKoDxmBjonmi1iTZE
 EYlk8ve1Yc7tPD/t0iOIwPUAj1ena1t9IZmY1lMWleSYlqchy010j/mXS0Cq9Piw2TfC
 sxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JcMsgBgFOR33rFkSLHsQoINTFi9A4r6gtBoxzM7yf+g=;
 b=mzJhDpqZgW/nAuFwaK8q0ofOlmafnWVMEvdv3EISswLfu+tBgYD8S4d7p1PypHt6go
 RSW/OetZt7gENVz2Rew9gGKDPg8oPURbk9a6ef1BnSvN5PZQ/epgbnj/iWsu/12aeHf/
 s4hEasLvVT5iocEAWnfZOfYzBwoH3fFY0W8qJqUSv20pmtk6EcBbob5O+9nVFj2jvSrj
 a9xgEbYQUlirxjLkewUISib3jchhTiZ63x6SeRs5CRmt8TI3/WQVcv3woqTzPWjV1ut0
 c9+xEX5rjUsUli5wgBCNSgPxZMR9q1QoNRdvaedaMpHUs8nv0eFEHIdk9gMTq3xvWD9a
 +irQ==
X-Gm-Message-State: AOAM533MvJ9D3Skc8p8BvZaY6rIfL7CjAJ/ZiXmIPQuQswVdul1EDT1Z
 Uo06SUY7mSGTK0Ts2r0RjnFX35K8Ptq4w/ZleDs5YQ==
X-Google-Smtp-Source: ABdhPJx9RnZUcqpbWUC0Rcy7ZBVVzkwrmg9V1QAHY5D9yoPZmXBNmm8PjE9ALhQbCbIJz8bYcgepWe2nAndXgth+Jb8=
X-Received: by 2002:a50:ee86:: with SMTP id f6mr378941edr.123.1589386459763;
 Wed, 13 May 2020 09:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 May 2020 09:14:08 -0700
Message-ID: <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alistair@popple.id.au,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 12, 2020 at 8:47 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Architectures like ppc64 provide persistent memory specific barriers
> that will ensure that all stores for which the modifications are
> written to persistent storage by preceding dcbfps and dcbstps
> instructions have updated persistent storage before any data
> access or data transfer caused by subsequent instructions is initiated.
> This is in addition to the ordering done by wmb()
>
> Update nvdimm core such that architecture can use barriers other than
> wmb to ensure all previous writes are architecturally visible for
> the platform buffer flush.

This seems like an exceedingly bad idea, maybe I'm missing something.
This implies that the deployed base of DAX applications using the old
instruction sequence are going to regress on new hardware that
requires the new instructions to be deployed. I'm thinking the kernel
should go as far as to disable DAX operation by default on new
hardware until userspace asserts that it is prepared to switch to the
new implementation. Is there any other way to ensure the forward
compatibility of deployed ppc64 DAX applications?

>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/nvdimm/region_devs.c | 8 ++++----
>  include/linux/libnvdimm.h    | 4 ++++
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index ccbb5b43b8b2..88ea34a9c7fd 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -1216,13 +1216,13 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
>         idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
>
>         /*
> -        * The first wmb() is needed to 'sfence' all previous writes
> -        * such that they are architecturally visible for the platform
> -        * buffer flush.  Note that we've already arranged for pmem
> +        * The first arch_pmem_flush_barrier() is needed to 'sfence' all
> +        * previous writes such that they are architecturally visible for
> +        * the platform buffer flush. Note that we've already arranged for pmem
>          * writes to avoid the cache via memcpy_flushcache().  The final
>          * wmb() ensures ordering for the NVDIMM flush write.
>          */
> -       wmb();
> +       arch_pmem_flush_barrier();
>         for (i = 0; i < nd_region->ndr_mappings; i++)
>                 if (ndrd_get_flush_wpq(ndrd, i, 0))
>                         writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> index 18da4059be09..66f6c65bd789 100644
> --- a/include/linux/libnvdimm.h
> +++ b/include/linux/libnvdimm.h
> @@ -286,4 +286,8 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
>  }
>  #endif
>
> +#ifndef arch_pmem_flush_barrier
> +#define arch_pmem_flush_barrier() wmb()
> +#endif
> +
>  #endif /* __LIBNVDIMM_H__ */
> --
> 2.26.2
>
